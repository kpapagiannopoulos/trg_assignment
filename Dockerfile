FROM python:3.9

WORKDIR /hello_world.py


COPY . .

EXPOSE 5000

CMD ["python", "hello_world.py"]
