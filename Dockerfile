FROM python:3.9

WORKDIR /my-python-app


COPY . .

EXPOSE 8080

CMD ["python", "hello_world.py"]
