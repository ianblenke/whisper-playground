FROM ubuntu:22.04

RUN apt-get update \
 && apt-get install -y curl sudo git \
 && curl -sL https://deb.nodesource.com/setup_14.x | sudo bash - \
 && apt-get install -y ffmpeg portaudio19-dev nodejs python3-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN npm install --global yarn

WORKDIR /whisper-playground
ADD . .
WORKDIR interface
RUN yarn install
RUN yarn run react-scripts build
RUN npm install -g serve

WORKDIR ../backend
RUN pip install wheel
RUN pip install -r requirements.txt

WORKDIR ..

