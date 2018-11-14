
# oar-local

## Borders platform OAR local environment

### Create a working folder
cd <working folder>

### Clone oar-ui repo
```
git clone git@github.com:UKHomeOffice/oar-ui.git
cd oar-ui
git checkout -b feature/EOSR-434
```
### Clone oar-local repo
```
git clone git@github.com:UKHomeOffice/oar-local.git
cd oar-ui
git checkout -b feature/EOSR-434
```

## Build Docker images and instantiate a local environment 
```
cd oar-local

docker-compose up --build
```

## OAR-UI home's
```
http://localhost/startpage

http://localhost/oarhome

```

## KeyCloak home
```
http://localhost:8081

      KEYCLOAK USER: admin
      KEYCLOAK PASSWORD: password123!
```
## Flyway Postgres
```
See the [Hub's oar-flyway-postgres/README.md] 
(oar-flyway-postgres/README.md) for instruction of how to insert into Postgres via Flyway

      PGADMIN USER: oar@homeoffice.gov.uk
      PGADMIN PASSWORD: password

      POSTGRES USER: postgres
      POSTGRES PASSWORD: password

```

### Flyway - List available databases
```
docker exec -it $(docker container ls -qf name=oar-local_postgres-db_1) psql -U postgres -c '\l'
```
### Flyway - Create extensions
docker exec -it $(docker container ls -qf name=oar-local_postgres-db_1) psql -U postgres -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'

```
### Flyway - List available functions
```
docker exec -it $(docker container ls -qf name=oar-local_postgres-db_1) psql -U postgres -c '\df'
```

### Flyway - Create Database
```
docker exec -it $(docker container ls -qf name=oar-local_postgres-db_1) psql -U postgres -c 'CREATE DATABASE heroes OWNER postgres'
```

### Flyway Migrator - Load sql into Postgres via Flyway
```
Copy sql files into oar-flyway-migrator/sql folder that should be loaded

docker run  --name flyway-migrator --rm -v $PWD/oar-flyway-migrator/sql:/flyway/sql quay.io/ukhomeofficedigital/oar-flyway-migrator

```

## PGAdmin4 home
```
http://localhost:8082

      PGADMIN USER: oar@homeoffice.gov.uk
      PGADMIN PASSWORD: password
```

### Get postgres hostname required when creating servers etc via PG4Admin
```
docker ps

CONTAINER ID        IMAGE                                              PORTS                           NAMES
fe5341904923        quay.io/ukhomeofficedigital/oar-postgrest:latest   0.0.0.0:3000->3000/tcp          oar-local_postgrest_1
35be2d40172c        dpage/pgadmin4                                     443/tcp, 0.0.0.0:8082->80/tcp   oar-local_pg-admin_1
26e25aa4f977        postgres:10.5                                      0.0.0.0:5432->5432/tcp          oar-local_postgres-db_1
8ea99bfbe8d9        quay.io/ukhomeofficedigital/oar-keycloak:latest    0.0.0.0:8081->8080/tcp          oar-local_keycloak_1
bcbcaa64c62a        quay.io/ukhomeofficedigital/oar-ui:latest          0.0.0.0:80->8080/tcp            oar-local_oar-ui_1
```
### Use the following parameters to create servers, tables etc in potgres via PG4Admin4
```
      POSTGRES HOSTNAME: oar-local_postgres-db_1
      POSTGRES USER: postgres
      POSTGRES PASSWORD: password
```

## PostGREST home
```
http://localhost:3000

```
