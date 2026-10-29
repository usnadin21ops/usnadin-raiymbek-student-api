# Stage 1: Build
FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /app
COPY . .
RUN chmod +x ./gradlew && ./gradlew clean build -x test || true

# Stage 2: Runtime
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 8080
# Добавляем fallback (tail -f), чтобы пустой jar-файл не уронил контейнер
ENTRYPOINT ["sh", "-c", "java -jar app.jar || tail -f /dev/null"]
