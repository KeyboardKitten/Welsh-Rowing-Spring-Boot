<h1 align="center">Welcome to Group 7 - Client Project - Welsh Rowing Association - After Fork - C1935888</h1>
<p>
</p>

> Client Project for the Welsh Rowing Association on behalf of group 7

### 🏠 [GitLab Homepage](https://git.cardiff.ac.uk/c1935888/clientproject-group7-1935888-afterfork/)

## Database Initialization  / Instructions

At the front of the directory file, ‘rowingDatabase.sql’ should be present.

Please open this file in ‘MySQL Workbench 8.0 CE’ OR ‘MariaDB’ with your root login connection
credentials and run ‘rowingDatabase.sql’.

The database is now set up and running for the web applications use.

## Building and starting the Spring Boot Application

Using command prompt set the current directory to the location of the project build.gradle file

Run the command 

```sh
gradle build
```
This will build the program using gradle, running all tests ensuring that they pass.

Once buliding is complete you can now run the application using the .jar file

In the Java '.jar' file directory, open Command Prompt and use the command 

```sh
java -jar -Dspring.profiles.active=prod -Djasypt.encryptor.password=COMSC JAR_C1935888.jar
```

The Spring Boot Application will then start-up and will host on port 8080

## Navigation to server homepage

In a browser of your choice navigate to 'HTTPS:/localhost:8080'

**HTTP is disabled, accessing the server via HTTP is forbidden.**

You will be directed to the homepage of the application


## Run tests

```sh
REQURIED
```
