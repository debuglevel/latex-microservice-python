FROM miktex/miktex

RUN apt-get update && apt-get install -y \
    python3.6 \
    && rm -rf /var/lib/apt/lists/*

COPY server.py /usr/bin/latex-server

ENV PYTHONUNBUFFERED 0
EXPOSE 7000
CMD latex-server
