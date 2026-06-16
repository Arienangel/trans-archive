FROM docker.io/library/python:3.14-alpine AS builder

WORKDIR /app
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app
ARG SITE_URL
ARG REPO_URL
ARG EDIT_URI
ARG ONION_LOCATION
RUN mkdocs build

FROM docker.io/library/nginx:mainline-alpine-slim

COPY --from=builder /app/site /usr/share/nginx/html
CMD nginx -g "daemon off;"
EXPOSE 80
