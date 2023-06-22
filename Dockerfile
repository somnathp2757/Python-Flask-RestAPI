FROM python:3.6

RUN python3 --version
RUN pip3 --version

WORKDIR /app
COPY ./app /app

RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt-get install openssl

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
