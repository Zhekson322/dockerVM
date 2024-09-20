FROM ubuntu:focal
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openssh-server
RUN apt-get install -y iproute2 
RUN apt-get install -y net-tools
RUN mkdir /var/run/sshd
RUN echo 'root:1234' | chpasswd
RUN adduser --disabled-password --gecos '' ubuntu
RUN echo 'ubuntu:1234' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\srequired\spam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
CMD /usr/sbin/sshd -D & tail -f /dev/null
