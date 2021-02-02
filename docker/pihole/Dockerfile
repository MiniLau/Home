FROM pihole/pihole:latest

RUN apt-get update
RUN apt-get install -y python3

COPY scripts/ /tmp/scripts/
RUN chmod 755 /tmp/scripts/conf.sh
