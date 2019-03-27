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
    sed -i '/password/{s/$/ minlen=8/}' /etc/pam.d/base-password && \
    sed -i 's/jdk.tls.disabledAlgorithms=/jdk.tls.disabledAlgorithms=SSLv2Hello, DES40_CBC, RC4_40, SSLv2, TLSv1, TLSv1.1, /g' /usr/lib/jvm/default-jvm/jre/lib/security/java.security
COPY disabled-tls.properties .
