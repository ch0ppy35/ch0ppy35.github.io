FROM alpine:3.18 as build

RUN apk add --no-cache hugo
WORKDIR /src
COPY . .
RUN hugo --gc --minify

FROM nginx:stable-alpine as dist
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /src/public /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]