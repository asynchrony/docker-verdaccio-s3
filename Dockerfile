FROM verdaccio/verdaccio:2.7

COPY run-verdaccio.sh /usr/local/bin/run-verdaccio.sh
COPY s3-sync.sh /usr/local/bin/s3-sync.sh

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

CMD ["/usr/local/bin/run-verdaccio.sh"]
