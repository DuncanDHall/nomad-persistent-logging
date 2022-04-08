FROM python:3-alpine
COPY log_periodically.sh index.html start.sh /app/

WORKDIR /app

EXPOSE 5000

CMD ["sh", "start.sh"]
