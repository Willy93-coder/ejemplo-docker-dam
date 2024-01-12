FROM ubuntu:22.04

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash
RUN apt update
RUN apt install -y mysql-server nodejs npm

WORKDIR /the/workdir/path

COPY . /the/workdir/path/.

RUN cd /the/workdir/path && npm install
RUN chmod +x /the/workdir/path/mysql-init.sh
RUN /bin/bash -c /the/workdir/path/mysql-init.sh

EXPOSE 3000

CMD service mysql restart && node index.js