
# oar-local

## Borders platform OAR local environment
```
Create a working folder
cd <working folder>

Clone oar-ui repo
git@github.com:UKHomeOffice/oar-ui.git

Clone oar-local repo
git@github.com:UKHomeOffice/oar-local.git
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

## PGAdmin4 home
```
http://localhost:8082

      PGADMIN USER: oar@homeoffice.gov.uk
      PGADMIN PASSWORD: password

      POSTGRES USER: postgres
      POSTGRES PASSWORD: password
```

## PostGREST home
```
http://localhost:3000

```
