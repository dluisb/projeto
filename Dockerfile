FROM java:8-jdk-alpine
VOLUME /tmp
COPY target/Proxy_Default-*.jar /root/projeto/target/Proxy_Default-0.0.2.jar
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]
