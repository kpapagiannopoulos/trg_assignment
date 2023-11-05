FROM python:3.9

WORKDIR /app


COPY . .

EXPOSE 5000

CMD ["python", "app.py"]