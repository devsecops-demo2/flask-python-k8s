FROM python:3.13.0b3-slim
RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install \
    nginx \
    python3-dev \
    build-essential

WORKDIR /app

COPY ./app/requirements.txt ./requirements.txt
RUN pip install -r requirements.txt --src /usr/local/src

COPY ./app .

EXPOSE 5000
CMD [ "python", "app.py" ]