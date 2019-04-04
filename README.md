Creates a mosquitto broker.

docker build -t mosquitto/estonia .

//mqtt on port 1883
//ws on port 9001
docker run -d -p 1883:1883 -p 1884:9001 mosquitto/estonia