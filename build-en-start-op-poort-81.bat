docker image build -t mydocker:22.04 .
docker run -d -t --name mydocker -p 81:80 mydocker:22.04
