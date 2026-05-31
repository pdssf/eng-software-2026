FROM python:3.12

WORKDIR /experiment

COPY . .

RUN pip install -r requirements.txt

WORKDIR /experiment/src

RUN chmod +x run.sh

CMD ["./run.sh"]
