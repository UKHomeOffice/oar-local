FROM jboss/keycloak:4.5.0.Final

USER root

RUN mkdir -p /opt/jboss/keycloak/standalone/tmp/vfs \
 && chmod g+r -vfR /opt/jboss/keycloak/standalone \
 && chmod g+w -vf /opt/jboss/keycloak/standalone/{.,deployments} \
 && chmod g+w -vfR /opt/jboss/keycloak/standalone/{tmp,configuration,log} \
 && chgrp 0 -vfR /opt/jboss/keycloak/standalone

ADD realm.json /tmp/realm.json
ADD auth-entrypoint.sh /opt/jboss/auth-entrypoint.sh
RUN chmod +x /opt/jboss/auth-entrypoint.sh

ENV PROXY_ADDRESS_FORWARDING=true

USER jboss

ENV KEYCLOAK_USER=admin
ENV KEYCLOAK_PASSWORD=password123!
ENV UI_URL=http://localhost:8080/

ENTRYPOINT [ "/opt/jboss/auth-entrypoint.sh" ]

CMD ["-b", "0.0.0.0", "-Dkeycloak.migration.action=import", "-Dkeycloak.migration.provider=singleFile", "-Dkeycloak.migration.strategy=IGNORE_EXISTING", "-Dkeycloak.migration.file=/tmp/realm.configured.json"]
