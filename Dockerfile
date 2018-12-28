# This bitloop nginx Dockerfile
# Version 1.0
 
# Base images 基础镜像
FROM centos:7
 
#MAINTAINER 
MAINTAINER zhanghai
 
#RUN 执行以下命令 
RUN yum update -y && \
yum install -y epel-release && \
yum install -y nginx && \
yum clean all

RUN mkdir /var/log/nginx/bitloop
COPY ./config.conf /
COPY ./docker-entrypoint.sh /

ADD nginx.conf /etc/nginx/nginx.conf
ADD bitloop.conf /etc/nginx/conf.d/

#EXPOSE 映射端口
EXPOSE 80
 
#ENTRYPOINT
ENTRYPOINT ["/bin/bash", "docker-entrypoint.sh"]
