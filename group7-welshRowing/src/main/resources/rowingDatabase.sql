# https://lucid.app/lucidchart/invitations/accept/fade6f95-af6c-4643-9f07-1e402e18cd19 following schema

#creates admin user with password adminpassword and gives them all permissions over all tables
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpassword';
GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';
FLUSH PRIVILEGES;

#creates coach user with password coachpassword and gives them all permissions to insert,select,update, and delete on all tables.
CREATE USER 'coach'@'localhost' IDENTIFIED BY 'coachpassword';
GRANT INSERT ON welshrowing TO 'coach'@'localhost';
GRANT SELECT ON welshrowing TO 'coach'@'localhost';
GRANT UPDATE ON welshrowing TO 'coach'@'localhost';
GRANT DELETE ON welshrowing TO 'coach'@'localhost';
FLUSH PRIVILEGES;

#creates athlete user with password athletepassword and gives them all permissions to insert,select,update on tables needed.
CREATE USER 'athlete'@'localhost' IDENTIFIED BY 'athletepassword';
GRANT SELECT ON welshrowing.User TO 'athlete'@'localhost';
GRANT INSERT ON welshrowing.User TO 'athlete'@'localhost';
GRANT UPDATE ON welshrowing.User TO 'athlete'@'localhost';

GRANT INSERT ON welshrowing.Athlete TO 'athlete'@'localhost';
GRANT UPDATE ON welshrowing.Athlete TO 'athlete'@'localhost';
GRANT SELECT ON welshrowing.Athlete TO 'athlete'@'localhost';

GRANT INSERT ON welshrowing.MedicalData TO 'athlete'@'localhost';
GRANT UPDATE ON welshrowing.MedicalData TO 'athlete'@'localhost';
GRANT SELECT ON welshrowing.MedicalData TO 'athlete'@'localhost';

GRANT INSERT ON welshrowing.AthletePreviousSports TO 'athlete'@'localhost';
GRANT UPDATE ON welshrowing.AthletePreviousSports TO 'athlete'@'localhost';
GRANT SELECT ON welshrowing.AthletePreviousSports TO 'athlete'@'localhost';

GRANT INSERT ON welshrowing.Interview TO 'athlete'@'localhost';
GRANT UPDATE ON welshrowing.Interview TO 'athlete'@'localhost';
GRANT SELECT ON welshrowing.Interview TO 'athlete'@'localhost';

GRANT INSERT ON welshrowing.AthleteTest TO 'athlete'@'localhost';
GRANT UPDATE ON welshrowing.AthleteTest TO 'athlete'@'localhost';
GRANT SELECT ON welshrowing.AthleteTest TO 'athlete'@'localhost';

GRANT INSERT ON welshrowing.MorningMonitoring TO 'athlete'@'localhost';
GRANT UPDATE ON welshrowing.MorningMonitoring TO 'athlete'@'localhost';
GRANT SELECT ON welshrowing.MorningMonitoring TO 'athlete'@'localhost';

GRANT INSERT ON welshrowing.SessionRPE TO 'athlete'@'localhost';
GRANT UPDATE ON welshrowing.SessionRPE TO 'athlete'@'localhost';
GRANT SELECT ON welshrowing.SessionRPE TO 'athlete'@'localhost';

GRANT INSERT ON welshrowing.CrossTraining TO 'athlete'@'localhost';
GRANT UPDATE ON welshrowing.CrossTraining TO 'athlete'@'localhost';
GRANT SELECT ON welshrowing.CrossTraining TO 'athlete'@'localhost';
FLUSH PRIVILEGES;


CREATE DATABASE IF NOT EXISTS welshRowing;

USE welshRowing;

CREATE TABLE IF NOT EXISTS `User` (
  `userID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `role` VARCHAR(45),

  PRIMARY KEY (`userID`))
ENGINE = InnoDB;

CREATE TABLE `Athlete` (
    athleteID INTEGER,
    coachID INTEGER,
    name VARCHAR(30),
    gender VARCHAR(10),
    DOB DATE,
    applicationStatus BOOLEAN,
    email VARCHAR(30),
    mobileNumber VARCHAR(50), # allows country code and spaces and to ensure digits only
    telephoneNumber VARCHAR(50),
    address VARCHAR(50),
    postcode VARCHAR(8),
    placeOfEducation VARCHAR(50),
    guardianName VARCHAR(50),
    relationshipToAthlete VARCHAR(20),
    guardianEmail VARCHAR(30),
    guardianContactNumber VARCHAR(50),
    heardFrom VARCHAR(40),
    interestLetter BOOLEAN,
    postTestResult VARCHAR(60),
    PRIMARY KEY PKAthlete(athleteID),
    FOREIGN KEY FKAthlete(`coachID`) REFERENCES Athlete(`athleteID`)
);

CREATE TABLE `MedicalData` (
    medicalDataID INTEGER AUTO_INCREMENT NOT NULL,
    athleteID INTEGER NOT NULL,
    injuries VARCHAR(100),
    heightCM INTEGER,
    weightKG INTEGER,
    armSpanCM INTEGER,
    PRIMARY KEY PKMedicalData(medicalDataID),
    FOREIGN KEY FKMedicalData(athleteID) REFERENCES Athlete(athleteID)
);

CREATE TABLE `AthletePreviousSports` (
    apsID INTEGER AUTO_INCREMENT NOT NULL,
    athleteID INTEGER NOT NULL,
    previousSport VARCHAR(100),
    monthsTesting VARCHAR(50),
    sessionsPerWeek VARCHAR(50),
    endurancePerWeek VARCHAR(50),
    strengthPerWeek VARCHAR(50),
    yearsAtLevel VARCHAR(50),
    PRIMARY KEY PKAthletePreviousSports(apsID),
    FOREIGN KEY FKAthletePreviousSports(athleteID) REFERENCES Athlete(athleteID)

);

CREATE TABLE `Interview` (
    interviewID INTEGER AUTO_INCREMENT NOT NULL,
    athleteID INTEGER NOT NULL,
    answer1 VARCHAR(100),
    answer2 VARCHAR(100),
    answer3 VARCHAR(100),
    answer4 VARCHAR(100),
    answer5 VARCHAR(100),
    answer6 VARCHAR(100),
    answer7 int,
    answer8 int,
    answer9 int,
    answer10 int,
    answer11 VARCHAR(100),
    answer12 VARCHAR(100),
    answer13 VARCHAR(100),
    answer14 int,
    answer15 int,
    answer16 int,
    answer17 int,
    answer18 int,
    answer19 int,
    answer20 int,
    answer21 int,
    answer22 int,
    answer23 int,
    answer24 int,
    PRIMARY KEY PKInterview(interviewID),
    FORinterviewEIGN KEY FKInterview(athleteID) REFERENCES Athlete(athleteID)
);

CREATE TABLE `Coach` (
    coachID INTEGER AUTO_INCREMENT,
    name VARCHAR(20),
    username VARCHAR(20),
    password VARCHAR(20),
    PRIMARY KEY PKCoach(coachID)
);

CREATE TABLE `AthleteTest` (
   athleteTestID INTEGER AUTO_INCREMENT NOT NULL,
   athleteID INTEGER NOT NULL,
   coachID INTEGER,
   dateOfTest DATE,
   athleteComments VARCHAR(100),
   legPress3Reps INTEGER NOT NULL,
   armPress3Reps INTEGER NOT NULL,
   armPull3Reps INTEGER NOT NULL,
   armPull15Reps INTEGER NOT NULL,
   score INTEGER NOT NULL,
   observations VARCHAR(150),
   basicCore VARCHAR(5),
   bCNotes VARCHAR(50),
   flexibility VARCHAR(5),
   fNotes VARCHAR(50),
   PRIMARY KEY PKAthleteTest (athleteTestID),
   FOREIGN KEY FKAthleteTest(athleteID) REFERENCES Athlete(athleteID),
   FOREIGN KEY FKCoachAthleteTest (coachID) REFERENCES Coach(coachID)
);


CREATE TABLE `MorningMonitoring` (
    monitoringID INTEGER NOT NULL AUTO_INCREMENT,
    athleteID INTEGER NOT NULL,
    date DATE,
    walkingHeartRate INTEGER NOT NULL,
    standingHeartRate INTEGER NOT NULL,
    perceivedShape INTEGER NOT NULL,
    perceivedMentalState INTEGER NOT NULL,
    sleepQuantityHours INTEGER NOT NULL,
    sleepQuality INTEGER,
    PRIMARY KEY PKMorningMonitoring(monitoringID),
    FOREIGN KEY FKMorningMonitoring(athleteID) REFERENCES Athlete(athleteID)
);

CREATE TABLE `SessionRPE` (
    sessionRPEID INTEGER NOT NULL AUTO_INCREMENT,
    athleteID INTEGER NOT NULL,
    dateOfSession DATE,
    typeOfSession VARCHAR(50),
    RPE INTEGER,
    sessionDurationMinutes INTEGER,
    PRIMARY KEY PKSessionRPE(sessionRPEID),
    FOREIGN KEY FKSessionRPE(athleteID) REFERENCES Athlete(athleteID)
);

CREATE TABLE `CrossTraining` (
    crossTrainingID INTEGER NOT NULL AUTO_INCREMENT,
    athleteID INTEGER NOT NULL,
    dateOfSession DATE,
    typeOfCrossTraining VARCHAR(50),
    totalTimeMinutes INTEGER,
    totalDistance INTEGER,
    PRIMARY KEY PKCrossTraining(crossTrainingID),
    FOREIGN KEY FKCrossTraining(athleteID) REFERENCES Athlete(athleteID)
);

CREATE TABLE `UserAudit` (
     athleteID INTEGER NOT NULL,
     deletedDate DATE,
     deleted_by VARCHAR(50)
);
  
   DELIMITER //

CREATE TRIGGER athlete_after_delete
AFTER DELETE
   ON athlete FOR EACH ROW

BEGIN

   DECLARE userName varchar(50);

   -- Find username of person performing the DELETE into table
   SELECT USER() INTO userName;

   -- Insert record into audit table
   INSERT INTO users_audit
   ( athleteID,
     deletedDate,
     deleted_by)
   VALUES
   ( OLD.athleteID,
     SYSDATE(),
     userName );

END; //

DELIMITER ;

   DELIMITER //

CREATE TRIGGER athletetest_after_delete
AFTER DELETE
   ON athletetest FOR EACH ROW

BEGIN

   DECLARE userName varchar(50);

   -- Find username of person performing the DELETE into table
   SELECT USER() INTO userName;

   -- Insert record into audit table
   INSERT INTO users_audit
   ( athleteID,
     deletedDate,
     deleted_by)
   VALUES
   ( OLD.athleteID,
     SYSDATE(),
     userName );

END; //

DELIMITER ;

   DELIMITER //

CREATE TRIGGER crosstraining_after_delete
AFTER DELETE
   ON crosstraining FOR EACH ROW

BEGIN

   DECLARE userName varchar(50);

   -- Find username of person performing the DELETE into table
   SELECT USER() INTO userName;

   -- Insert record into audit table
   INSERT INTO users_audit
   ( athleteID,
     deletedDate,
     deleted_by)
   VALUES
   ( OLD.athleteID,
     SYSDATE(),
     userName );

END; //

DELIMITER ;

   DELIMITER //

CREATE TRIGGER medicaldata_after_delete
AFTER DELETE
   ON medicaldata FOR EACH ROW

BEGIN

   DECLARE userName varchar(50);

   -- Find username of person performing the DELETE into table
   SELECT USER() INTO userName;

   -- Insert record into audit table
   INSERT INTO users_audit
   ( athleteID,
     deletedDate,
     deleted_by)
   VALUES
   ( OLD.athleteID,
     SYSDATE(),
     userName );

END; //

DELIMITER ;

   DELIMITER //

CREATE TRIGGER morningmonitoring_after_delete
AFTER DELETE
   ON morningmonitoring FOR EACH ROW

BEGIN

   DECLARE userName varchar(50);

   -- Find username of person performing the DELETE into table
   SELECT USER() INTO userName;

   -- Insert record into audit table
   INSERT INTO users_audit
   ( athleteID,
     deletedDate,
     deleted_by)
   VALUES
   ( OLD.athleteID,
     SYSDATE(),
     userName );

END; //

DELIMITER ;

   DELIMITER //

CREATE TRIGGER sessionrpe_after_delete
AFTER DELETE
   ON sessionrpe FOR EACH ROW

BEGIN

   DECLARE userName varchar(50);

   -- Find username of person performing the DELETE into table
   SELECT USER() INTO userName;

   -- Insert record into audit table
   INSERT INTO users_audit
   ( athleteID,
     deletedDate,
     deleted_by)
   VALUES
   ( OLD.athleteID,
     SYSDATE(),
     userName );

END; //

DELIMITER ;
   DELIMITER //

CREATE TRIGGER user_after_delete
AFTER DELETE
   ON user FOR EACH ROW

BEGIN

   DECLARE userName varchar(50);

   -- Find username of person performing the DELETE into table
   SELECT USER() INTO userName;

   -- Insert record into audit table
   INSERT INTO users_audit
   ( athleteID,
     deletedDate,
     deleted_by)
   VALUES
   ( OLD.athleteID,
     SYSDATE(),
     userName );

END; //

DELIMITER ;

CREATE VIEW userAuditAdmin
AS
	SELECT athleteID, deletedDate, deleted_by FROM useraudit;
    
CREATE VIEW userAuditCoach
AS
	SELECT deletedDate FROM useraudit;
