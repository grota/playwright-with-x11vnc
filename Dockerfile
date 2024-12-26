FROM mcr.microsoft.com/playwright:v1.49.1

RUN apt-get update && \
  apt-get install -y x11vnc && \
  rm -rf /var/lib/apt/lists/*

COPY start-vnc.sh /
RUN chmod a+x /start-vnc.sh

ENTRYPOINT [ "/start-vnc.sh" ]
