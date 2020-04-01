FROM python:3.7-alpine

MAINTAINER yuban10703 "2846021566@qq.com"

ENV LIBRARY_PATH=/lib:/usr/lib

WORKDIR /app

RUN apk add --no-cache --virtual  bili git gcc build-base libffi-dev tzdata&& \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    git clone https://github.com/yjqiang/bili2.0.git /app && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del bili && \
    apk add --no-cache git

CMD git pull && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -rf bili.log && \
    python ./run.py
