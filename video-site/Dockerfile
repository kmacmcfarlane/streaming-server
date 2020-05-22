FROM node:lts-alpine AS build-video-site

COPY video-site /app/video-site
WORKDIR /app/video-site
RUN npm run serve
