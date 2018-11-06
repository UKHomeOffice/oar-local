FROM java:8

ADD http://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/5.2.1/flyway-commandline-5.2.1.zip /flyway.zip

RUN unzip /flyway.zip && rm /flyway.zip && mv /flyway-5.2.1 /flyway && chmod -R 755 /flyway && ln -s /flyway/flyway /usr/local/bin/flyway

RUN ls -la /flyway
RUN ls -la /flyway/flyway
RUN stat /flyway

WORKDIR /flyway

# A simple testing
RUN ./flyway -v
#RUN ./flyway 2>&1 | grep "Flyway 5.2.1"

ENTRYPOINT ["flyway"]
CMD ["--help"]
