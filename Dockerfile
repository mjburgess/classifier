FROM centos:latest

USER root

RUN yum install -y epel-release
RUN yum install -y java
RUN yum install -y python-pip 

WORKDIR /app

COPY ./requirements.txt /app
COPY ./classifier /app
COPY ./downloader/target/downloader-1.jar /app/
COPY ./input /app/input
COPY ./template.html /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80

CMD java -cp downloader-1.jar downloader.App && python main.py web
