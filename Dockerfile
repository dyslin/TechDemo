FROM openjdk:11.0.2-jre-slim-stretch
EXPOSE 8085
ARG JAR=spring-petclinic-2.5.0-SNAPSHOT.jar
COPY target/$JAR /petclinic.jar
ENTRYPOINT ["java","-jar","/petclinic.jar"]
