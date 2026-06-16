FROM docker.io/library/nginx:mainline-alpine-slim

COPY site /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
