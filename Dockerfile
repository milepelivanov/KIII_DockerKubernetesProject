FROM maven:latest
LABEL author="mile.pelivanov"

WORKDIR /app

COPY pom.xml .

RUN mvn clean install -DskipTests

COPY target/fooddeliverysystem-0.0.1-SNAPSHOT.jar /app/fooddeliverysystem-0.0.1-SNAPSHOT.jar


EXPOSE 8080

CMD ["java", "-jar", "/app/fooddeliverysystem-0.0.1-SNAPSHOT.jar"]
