FROM maven as build
WORkDIR /app
COPY . . 
RUN mvn install 


FROM openjdk:11.0
WORkDIR /app
COPY --from=build /app/target/devops-integration.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "devops-integration.jar"]