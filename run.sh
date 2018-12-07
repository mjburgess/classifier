
sudo docker build . -t classifier
sudo docker run -d -p 80:80 classifier
