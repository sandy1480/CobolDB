#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <hiredis/hiredis.h>
#include "STRnn.h"

redisContext *c;
redisReply *reply;
const char *hostname = "127.0.0.1";
int port = 6379;
struct timeval timeout = { 1, 500000 }; // 1.5 seconds
int STRnnPRIND = 0;
int STRnnRSIND = 0;
int serviceNo = 0;
int subSerNo = 0;
int columns = 0;
char records[100];


//Redis parameters
char key[50];
char redisCMD[50];
char value[1000];

int atoi_(const char* str, int len)
{
	int i;
	int ret = 0;
	for(i = 0; i < len; ++i)
	{
		ret = ret * 10 + (str[i] - '0');
	}
	return ret;
}

int CONNECT_REDIS(){
	/* Connect to redis database */
	c = redisConnectWithTimeout(hostname, port, timeout);
	if (c == NULL || c->err) {
		if (c) {
			printf("Connection error: %s\n", c->errstr);
			redisFree(c);
		} else {
			printf("Connection error: can't allocate redis context\n");
		}
		return 0;
	}
	return 1;
}

int STRnn(struct TSRnnVAR *A, struct SERVICE *B, struct SUBSER *C){
	char *token;
	printf("*** STRnn() -> Entry ****\n");
	TSRnnPRMS = A;
	TRFSERVICE = B;
	TRFSUBSER = C;

	STRnnPRIND = TSRnnPRIND - '0';
	serviceNo = atoi_(TSRnnSERNO,sizeof(TSRnnSERNO));
	subSerNo = atoi_(TSRnnSUBSER,sizeof(TSRnnSUBSER));

	printf("*** STRnn() :: TSRnnPRIND : %d\n", STRnnPRIND);
	printf("*** STRnn() :: serviceNo : %d\n", serviceNo);
	printf("*** STRnn() :: subSerNo : %d\n", subSerNo);

	if(CONNECT_REDIS()){
		printf("STRnn()::Connected to redis!!!\n");
	} else {
		printf("STRnn()::Connection to redis failed!!!\n");
		TSRnnRSIND = '2';
	}

	// Get SERVICE TABLE header names - from Redis
	key[0] = '\0';
	redisCMD[0] = '\0';
	sprintf(key,"%s","SERVICE_col_desc");
	sprintf(redisCMD,"%s","GET SERVICE_col_desc");

	reply = redisCommand(c,redisCMD);
	printf("%s: %s\n", key, reply->str);
	freeReplyObject(reply);

	//GET SERVICE RECORD
	key[0] = '\0';
	redisCMD[0] = '\0';
	sprintf(key,"SERVICE_rec_%d",serviceNo);
	sprintf(redisCMD,"GET %s",key);
	reply = redisCommand(c,redisCMD);
	printf("%s: %s\n", key, reply->str);

	token = strtok(reply->str, ",");
	//sprintf(TRFSRNO,"%d",token);
	TRFSRNO = atoi_(token,strlen(token));
	printf("** %d ",TRFSRNO);
	token = strtok(NULL, ",");
	TRFSRTYPE = token[0];

	token = strtok(NULL, ",");
	sprintf(TRFSRNAME,"%s",token);

	token = strtok(NULL, ",");
	TRFSRVETGP = token[0];

	token = strtok(NULL, ",");
	TRFSRACTGP = token[0];

	token = strtok(NULL, ",");
	TRFSRSEG = token[0];

	token = strtok(NULL, ",");
	TRFSRSECT = token[0];

	token = strtok(NULL, ",");
	TRFSRPSN = token[0];

	token = strtok(NULL, ",");
	TRFSRSAI = token[0];

	token = strtok(NULL, ",");
	TRFSRFTA = token[0];

	token = strtok(NULL, ",");
	TRFSRCCA = token[0];

	token = strtok(NULL, ",");
	TRFSRCT = token[0];

	token = strtok(NULL, ",");
	TRFSRAPA = token[0];

	token = strtok(NULL, ",");
	TRFSRDCA = token[0];

	token = strtok(NULL, ",");
	TRFSRATA = token[0];

	freeReplyObject(reply);

	// Get SUB-SERV TABLE header names - from Redis
	key[0] = '\0';
	redisCMD[0] = '\0';
	sprintf(key,"%s","SUB-SER_col_desc");
	sprintf(redisCMD,"GET %s",key);

	reply = redisCommand(c,redisCMD);
	printf("%s: %s\n", key, reply->str);

	freeReplyObject(reply);

	// GET SUB-SER RECORDS
	key[0] = '\0';
	redisCMD[0] = '\0';
	sprintf(key,"SUB-SER_rec_%d_%d",serviceNo,subSerNo);
	sprintf(redisCMD,"GET %s",key);
	reply = redisCommand(c,redisCMD);
	printf("%s: %s\n", key, reply->str);

	token = strtok(reply->str, ",");
	sprintf(TRFSBSERNO,"%s",token);

	token = strtok(NULL, ",");
	sprintf(TRFSBSBNO,"%s",token);

	token = strtok(NULL, ",");
	TRFSBST = token[0];

	token = strtok(NULL, ",");
	TRFSBSF = token[0];

	token = strtok(NULL, ",");
	TRFSBIBC = token[0];

	token = strtok(NULL, ",");
	TRFSBCFCF = token[0];

	token = strtok(NULL, ",");
	TRFSBCFCM = token[0];

	token = strtok(NULL, ",");
	sprintf(TRFSBCFCT,"%s",token);

	token = strtok(NULL, ",");
	TRFSBWCB = token[0];

	token = strtok(NULL, ",");
	TRFSBTCB = token[0];

	token = strtok(NULL, ",");
	TRFSBCTT = token[0];

	token = strtok(NULL, ",");
	sprintf(TRFSBCOA,"%s",token);

	token = strtok(NULL, ",");
	TRFSBCCAF = token[0];

	token = strtok(NULL, ",");
	TRFSBCCAM = token[0];

	token = strtok(NULL, ",");
	sprintf(TRFSBTCW,"%s",token);

	freeReplyObject(reply);

	printf("*** STRnn() -> Exit ****\n");
	return 1;
}
