#include <mysql.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <hiredis/hiredis.h>

char *substring(char *string, int position, int length){
	char *pointer;
	int c;

	pointer = malloc(length+1);

	if (pointer == NULL){
		printf("Unable to allocate memory.\n");
		exit(1);
	}
	for (c = 0 ; c < length ; c++){
		*(pointer+c) = *(string+position-1);
		string++;
	}
	*(pointer+c) = '\0';
	return pointer;
}


int main() {
	MYSQL *conn;
	MYSQL_RES *res;
	MYSQL_ROW row;
	MYSQL_FIELD *fields;

	redisContext *c;
	redisReply *reply;
	const char *hostname = "ec2-52-56-235-71.eu-west-2.compute.amazonaws.com";
	int port = 6379;
	struct timeval timeout = { 1, 500000 }; // 1.5 seconds

	unsigned int num_fields;
	unsigned int i, j;
	char db_tables[50][50];
	unsigned int table_no = 0;
	char r_key[20] = "", r_value[10000] = "";
	char temp_value[100] = "";
	int noOfPriKeys = 0;

	char sql_string[500] = "";

	char *server = "ec2-52-56-235-71.eu-west-2.compute.amazonaws.com";
	char *user = "shashi";
	char *password = "shashi";
	char *database = "poc-db";

	conn = mysql_init(NULL);

	/* Connect to MySQL database */
	if (!mysql_real_connect(conn, server,
			user, password, database, 0, NULL, 0)) {
		fprintf(stderr, "%s\n", mysql_error(conn));
		exit(1);
	}

	/* Connect to redis database */
	c = redisConnectWithTimeout(hostname, port, timeout);
	if (c == NULL || c->err) {
		if (c) {
			printf("Connection error: %s\n", c->errstr);
			redisFree(c);
		} else {
			printf("Connection error: can't allocate redis context\n");
		}
		exit(1);
	}


	/* MySQL - Get all tables */
	if (mysql_query(conn, "SHOW TABLES")) {
		fprintf(stderr, "%s\n", mysql_error(conn));
		exit(1);
	}
	printf("Tables in MySQL database:\n");
	res = mysql_use_result(conn);
	while ((row = mysql_fetch_row(res))){
		strcpy(db_tables[table_no], row[0]);
		printf("[ %s ]\n",row[0]);
		table_no++;
	}

	for(i = 0; i < table_no; i++){
		printf("\n********* REFRESHING TABLE : %s \n",db_tables[i]);

		// Get record counts
		sprintf(sql_string,"select count(*) from  `%s`.`%s`",database,db_tables[i]);
		//printf("********* sqlstring : %s\n",sql_string);
		if (mysql_query(conn, sql_string)) {
			fprintf(stderr, "%s\n", mysql_error(conn));
			exit(1);
		}
		res = mysql_use_result(conn);
		r_key[0] = '\0';
		r_value[0] = '\0';
		while ((row = mysql_fetch_row(res))){
			printf("********* Records in MySQL Table : %s \n",row[0]);
			sprintf(r_key,"%s_record_counts",db_tables[i]);
			sprintf(r_value,"%s",row[0]);
		}

		reply = redisCommand(c,"SET %s %s", r_key, r_value);
		freeReplyObject(reply);

		// Get primary keys
		sprintf(sql_string,"desc  `%s`.`%s`",database,db_tables[i]);
		//printf("********* sqlstring : %s\n",sql_string);
		if (mysql_query(conn, sql_string)) {
			fprintf(stderr, "%s\n", mysql_error(conn));
			exit(1);
		}

		res = mysql_use_result(conn);
		noOfPriKeys = 0;
		while ((row = mysql_fetch_row(res))){
			if(!strcmp(row[3],"PRI")){
				noOfPriKeys++;
			}
		}
		//printf("********* No of Primary Keys : %d\n",noOfPriKeys);
		sprintf(sql_string,"SELECT * FROM `%s`.`%s`",database,db_tables[i]);
		//printf("********* sqlstring : %s\n",sql_string);
		if (mysql_query(conn, sql_string)) {
			fprintf(stderr, "%s\n", mysql_error(conn));
			exit(1);
		}
		res = mysql_use_result(conn);

		num_fields = mysql_num_fields(res);
		fields = mysql_fetch_field(res);
		r_value[0] = '\0';
		for(j = 0; j < num_fields; j++){
			strcat(r_value,fields[j].name);
			strcat(r_value,",");
		}
		r_key[0] = '\0';
		sprintf(r_key,"%s_col_desc",db_tables[i]);
		//printf("[%s]:[%s]\n",r_key,r_value);

		/* Set table_col_desc key in redis */
		reply = redisCommand(c,"SET %s %s", r_key, r_value);
		freeReplyObject(reply);

		while ((row = mysql_fetch_row(res))){
			unsigned long *lengths;
			lengths = mysql_fetch_lengths(res);
			r_key[0] = '\0';
			r_value[0] = '\0';
			if(noOfPriKeys == 1)
				sprintf(r_key,"%s_rec_%s",db_tables[i],row[0]);
			else if(noOfPriKeys == 2)
				sprintf(r_key,"%s_rec_%s_%s",db_tables[i],row[0],row[1]);
			for(j = 0; j < num_fields; j++){
				sprintf(temp_value,"%.*s,", (int) lengths[j],row[j] ? row[j] : "NULL");
				strcat(r_value,temp_value);
			}
			//printf("[%s]:[%s]\n",r_key,r_value);
			reply = redisCommand(c,"SET %s %s", r_key, r_value);
			freeReplyObject(reply);
		}

		reply = redisCommand(c,"KEYS %s_rec_*",db_tables[i]);
		printf("********* Records added in redis : %zu\n",reply->elements);
		freeReplyObject(reply);

		printf("********* %s TABLE REFRESHED \n\n",db_tables[i]);
	}
	/* close connection */
	mysql_free_result(res);
	mysql_close(conn);
	redisFree(c);
}
