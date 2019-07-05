Creates a mosquitto broker.


available --build-arg:
MQTTCLIENTPASS

docker build --build-arg MQTTCLIENTPASS='newPassWord' -t mosquitto/estonia .

//mqtt on port 1883
//ws on port 9001
docker run -d -p 1883:1883 -p 1884:9001 mosquitto/estonia


