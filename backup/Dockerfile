FROM alpine:3.11.5
COPY ./schedule.sh /bin/schedule.sh
RUN chmod +x /bin/schedule.sh
RUN apk update \
 && apk add --no-cache curl
