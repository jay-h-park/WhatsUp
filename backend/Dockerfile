FROM openjdk:11 AS builder

WORKDIR /backend
COPY . .
RUN pwd
RUN ./gradlew bootJar

FROM openjdk:11

COPY --from=builder /backend/build/libs/*.jar app.jar

# ENTRYPOINT ["java", "-jar", "/app.jar"]

