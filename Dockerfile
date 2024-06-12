FROM debian:bookworm-slim

COPY run.sh /tapis/run.sh

RUN chmod +x /tapis/run.sh
RUN sudo apt-get install libc6
ENTRYPOINT [ "/tapis/run.sh" ]

CMD ["1280x800"]