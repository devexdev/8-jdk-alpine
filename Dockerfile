FROM openjdk:8-jdk-alpine
RUN apk update && \
    apk upgrade && \
    apk --no-cache add shadow && \
    apk --no-cache add bash && \
    apk --no-cache add ca-certificates && \
    apk --no-cache add wget && \
    apk --no-cache add nss && \
    apk update && \
    apk upgrade && \
    apk add openjdk8="8.201.08-r0" && \
    sed -i '/password/{s/$/ minlen=8/}' /etc/pam.d/base-password
