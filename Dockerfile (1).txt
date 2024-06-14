FROM openjdk:8
EXPOSE 8082
ADD target/petstore.war petstore.war
ENTRYPOINT ["java","-jar","/petstore.war"]
