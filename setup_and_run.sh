docker ps -a -q --filter "name=cipherconverter" | xargs docker rm -f

git clone https://github.com/basarardabaykal/cipherconverter-backend.git ../cipherconverter-backend
git clone https://github.com/basarardabaykal/cipherconverter-microservice.git ../cipherconverter-microservice
git clone https://github.com/basarardabaykal/cipherconverter-frontend.git ../cipherconverter-frontend

(
  cd ../cipherconverter-frontend || exit
  git submodule init
  git submodule update
)

docker ps -a -q --filter "name=cipherconverter" | xargs docker rm -f
docker compose up -d db --build

sleep 15

docker compose up -d --build

sleep 15

docker exec cipherconverter_backend python manage.py makemigrations --noinput
docker exec cipherconverter_backend python manage.py migrate --noinput

