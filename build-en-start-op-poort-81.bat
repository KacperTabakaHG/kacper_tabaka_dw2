docker image build -t mydocker:22.04 .
docker run -d -t --name mydocker -p 13.74.162.243:80:81 mydocker:22.04
