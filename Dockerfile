# ubuntu:xenial -> ubuntu 16.04
FROM ubuntu:xenial
MAINTAINER Ninja <ninja.devops@dev.com>

workdir /home
copy . /home

run mkdir -p /abs

run apt-get update
run apt-get -y install $(cat pkglist)

run pip3 install -r pip-requirements.txt

workdir /home/credis
run make && make install
run ldconfig

workdir /home

run cobc -x -free -o /abs/coboldb /home/Cobol_Codes/coboldb.cbl /home/C_Codes/STRnn.c -lhiredis

EXPOSE 3000

CMD ["python3", "coboldb.py"]
