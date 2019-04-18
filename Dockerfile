FROM alpine:latest

ENV BASTIONPW=ChAnG3_-_m3
ENV BASTIONHOSTNAME=sshbastion
ADD docker-entrypoint.sh /usr/local/bin
RUN apk update && apk add openssh && rm  -rf /tmp/* /var/cache/apk/* && adduser -s /bin/sh -u 1001 -h /home/bastion/ -D bastion bastion && echo "bastion:$BASTIONPW" | chpasswd && rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

EXPOSE 22
ENTRYPOINT ["docker-entrypoint.sh"] 
CMD ["/usr/sbin/sshd","-D"]
