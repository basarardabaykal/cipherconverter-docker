## Cipherconverter Setup Steps

1 - Create folder
```bash
mkdir cipherconverter
cd cipherconverter
```

2 - Clone docker repository
```bash
git clone https://github.com/basarardabaykal/cipherconverter-docker.git
cd cipherconverter-docker
```

3 - Create db.env and backend.env in cipherconverter-docker

Example `db.env`:
```bash
POSTGRES_DB=cipherconverter_db
POSTGRES_USER=postgres
POSTGRES_PASSWORD=12345
```

Example `backend.env`:
```bash
DATABASE_ENGINE=django.db.backends.postgresql
DATABASE_NAME=cipherconverter_db
DATABASE_USER=postgres
DATABASE_PASSWORD=12345
DATABASE_HOST=db
DATABASE_PORT=5432
```

4 - Run the setup script
```bash
bash setup_and_run.sh
```

- Frontend: `http://localhost:2106`
- Backend: `http://localhost:8805`