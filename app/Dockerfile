FROM ubuntu

MAINTAINER Bob "zhuangzebo0@gmail.com"

RUN apt-get update

# install openresty
RUN apt-get install -y libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential
RUN apt-get install -y libxslt-dev libxml2-dev 
RUN apt-get install -y libgd-dev libgd2-xpm-dev
RUN apt-get install -y geoip-database libgeoip-dev
RUN apt-get install -y vim
RUN apt-get install -y ssh 

# RUN wget https://openresty.org/download/openresty-1.11.2.1.tar.gz
# ADD ./openresty-1.11.2.1.tar.gz /root/      

WORKDIR /root/
#ADD https://openresty.org/download/openresty-1.11.2.1.tar.gz ./
#RUN ['tar', '-xvf', 'openresty-1.11.2.1.tar.gz']

#1.install openresty

ADD ./openresty-1.11.2.1.tar.gz ./      
ADD ./install_openresty.sh ./openresty-1.11.2.1/

RUN cd /root/openresty-1.11.2.1/ && ./install_openresty.sh
RUN ln -s /usr/local/openresty/nginx/nginx/sbin/nginx /usr/bin/nginx 

#2.install mysql

RUN apt-get install -y bison openssl libncurses5-dev perl cmake
ADD ./mysql-boost-5.7.14.tar.gz ./
ADD ./mysql-5.7.14.tar.gz ./
ADD ./install_mysql.sh ./mysql-5.7.14/

RUN chmod 755 ./mysql-5.7.14/*.sh
RUN cd /root/mysql-5.7.14/ && ./install_mysql.sh

#3.login with password

RUN echo "root:123456" | chpasswd
RUN echo "PermitRootLogin yes" > /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/lib/nginx/body

EXPOSE 80
EXPOSE 22
EXPOSE 443

ADD ./run.sh ./
RUN chmod 755 /root/*.sh
CMD ["/root/run.sh"]
