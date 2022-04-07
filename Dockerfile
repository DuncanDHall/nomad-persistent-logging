FROM alpine
COPY log_periodically.sh /app/

WORKDIR /app

CMD ["sh", "log_periodically.sh"]
