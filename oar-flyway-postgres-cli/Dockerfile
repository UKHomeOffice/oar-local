FROM quay.io/ukhomeofficedigital/oar-flyway-cli

RUN apt-get update && apt-get -y install postgresql-client curl jq

COPY scripts/run-flyway.sh /scripts/run-flyway.sh

# only a hack, will be fixed in later version of docker-compose
RUN chmod 755 /scripts/run-flyway.sh

WORKDIR /flyway

ENTRYPOINT [ "/scripts/run-flyway.sh" ]
