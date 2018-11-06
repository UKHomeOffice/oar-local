
### Flyway - List available databases
```
docker exec -it $(docker container ls -qf name=test_postgres-db_) psql -U postgres -c '\l
```
