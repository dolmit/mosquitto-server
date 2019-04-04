FROM ubuntu:18.04

MAINTAINER Dolmit

RUN apt-get update && apt-get install -y software-properties-common && \
 apt-add-repository ppa:mosquitto-dev/mosquitto-ppa && apt-get update && apt-get install -y mosquitto

RUN mkdir -p /mqtt/config /mqtt/data /mqtt/log
COPY config /mqtt/config/
RUN chown -R mosquitto:mosquitto /mqtt

EXPOSE 1883 9001

CMD ["mosquitto", "-c", "/mqtt/config/mosquitto.conf"]
