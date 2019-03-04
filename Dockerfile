# ubuntu:xenial -> ubuntu 16.04
FROM ubuntu:xenial
MAINTAINER Ninja <ninja.devops@dev.com>

workdir /home
copy . /home

run mkdir -p /abs

run apt-get update
run apt-get -y install $(cat pkglist)

run pip3 install -r pip-requirements.txt
run cobc -x -free -o /abs/TESTMERGE /home/Cobol_Codes/TESTMERGE.cbl

EXPOSE 8000

CMD ["python3","/home/Python_Codes/python-api/manage.py", "runserver", "[::]:8000"]
