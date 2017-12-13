FROM verdaccio/verdaccio:2.7

USER root

RUN apk add --no-cache -v \
    python \
    py2-pip \
&& pip install --no-cache-dir awscli \
&& aws --version

COPY run-verdaccio.sh /usr/local/bin/run-verdaccio.sh
COPY s3-sync.sh /usr/local/bin/s3-sync.sh

USER verdaccio

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

CMD ["/usr/local/bin/run-verdaccio.sh"]
