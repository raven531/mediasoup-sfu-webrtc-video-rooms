FROM node:20-slim

WORKDIR /app

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        build-essential \
        python3 \
        python3-pip \
        ffmpeg \
        && rm -rf /var/lib/apt/lists/*
COPY package-lock.json .
COPY package.json .
RUN npm install

COPY src src
COPY ssl ssl
COPY public public

# EXPOSE 3016

# EXPOSE 10000-10100

RUN npm i -g nodemon

CMD npm start