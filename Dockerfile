FROM ubuntu:16.04
MAINTAINER Santhosh
RUN apt-get update
RUN apt-get install openssh-server -y
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'root:root123' | chpasswd
RUN mkdir /var/run/sshd
CMD [ "/usr/sbin/sshd", "-D" ]