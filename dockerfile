
FROM python:3.9-slim AS builder
WORKDIR /app

RUN apt-get update && \
	apt-get install -y --no-install-recommends build-essential gcc libjpeg-dev zlib1g-dev

COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


COPY app/01.py .


FROM python:3.9-slim
WORKDIR /app


COPY --from=builder /install /usr/local
COPY --from=builder /app/01.py .

EXPOSE 5000

CMD ["python", "01.py"]
