FROM ubuntu:18.04

MAINTAINER Dolmit

RUN apt-get update && apt-get install -y software-properties-common && \
 apt-add-repository ppa:mosquitto-dev/mosquitto-ppa && apt-get update && apt-get install -y mosquitto

ARG MQTTCLIENTPASS='sHalLnoTpaSS'
ENV \
    MQTTCLIENTUSER='publisher'\
    MQTTCLIENTPASS=${MQTTCLIENTPASS}

RUN mkdir -p /mqtt/config /mqtt/data /mqtt/log
COPY config /mqtt/config/
RUN chown -R mosquitto:mosquitto /mqtt

RUN touch /mqtt/config/passwd && echo "${MQTTCLIENTUSER}:${MQTTCLIENTPASS}" > /mqtt/config/passwd
RUN mosquitto_passwd -U /mqtt/config/passwd


EXPOSE 1883 9001

CMD ["mosquitto", "-c", "/mqtt/config/mosquitto.conf"]
