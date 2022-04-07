FROM python:3-alpine
COPY log_periodically.sh index.html /app/

WORKDIR /app

EXPOSE 5000

CMD ["sh", "log_periodically.sh"]
