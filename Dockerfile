FROM python:3.7.5-slim

MAINTAINER jiangfengbing@gmail.com

ENV PYTHONUNBUFFERED 1
ENV TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone \
  && apt update \
  && apt install -y ca-certificates gcc libpq-dev \
  && pip install psycopg2==2.8.4 \
  && apt remove -y gcc \
  && apt autoremove -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /root/.cache

