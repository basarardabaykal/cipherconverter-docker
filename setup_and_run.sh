docker ps -a -q --filter "name=cipherconverter" | xargs docker rm -f

git clone -b main https://github.com/basarardabaykal/cipherconverter-backend.git ../cipherconverter-backend
git clone -b main https://github.com/basarardabaykal/cipherconverter-microservice.git ../cipherconverter-microservice
git clone -b main https://github.com/basarardabaykal/cipherconverter-frontend.git ../cipherconverter-frontend

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

docker exec cipherconverter_backend python manage.py migrate

docker exec cipherconverter_backend python manage.py shell -c 'from django.conf import settings; apps =[app.split(".")[-1] for app in settings.INSTALLED_APPS]; print(" ".join(apps))' | grep -v "^$" | grep -v "^###" | grep -v 'for details.' | xargs docker exec cipherconverter_backend python manage.py makemigrations --noinput
docker exec cipherconverter_backend ./manage.py migrate

