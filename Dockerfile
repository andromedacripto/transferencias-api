# Etapa 1: build da aplicação
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: imagem final com o JAR
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=build /app/target/transferencias-api-1.0.0.jar app.jar

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
