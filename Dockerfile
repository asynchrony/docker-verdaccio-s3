FROM verdaccio/verdaccio:2.7

COPY run-verdaccio.sh /usr/local/bin/run-jenkins.sh
COPY s3-sync.sh /usr/local/bin/s3-sync.sh
