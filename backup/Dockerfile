FROM alpine:3.11.5
COPY ./schedule.sh /bin/schedule.sh
COPY ./schedule-ns.sh /bin/schedule-ns.sh
COPY ./schedule-ws.sh /bin/schedule-ws.sh
RUN chmod +x /bin/schedule.sh
RUN chmod +x /bin/schedule-ws.sh
RUN chmod +x /bin/schedule-ns.sh
RUN apk update \
 && apk add --no-cache curl
