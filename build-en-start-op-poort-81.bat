docker image build -t mydocker:22.04 .
docker run -d -t --name mydocker -p kacpertabaka.northeurope.cloudapp.azure.com:81:80 mydocker:22.04
