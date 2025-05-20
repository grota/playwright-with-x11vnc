FROM mcr.microsoft.com/playwright:v1.52.0

RUN apt-get update && \
  apt-get install -y x11vnc inetutils-ping && \
  rm -rf /var/lib/apt/lists/*

COPY start-vnc.sh /
RUN chmod a+x /start-vnc.sh

ENTRYPOINT [ "/start-vnc.sh" ]

LABEL org.opencontainers.image.source=https://github.com/grota/playwright-with-x11vnc
