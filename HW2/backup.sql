set search_path to 'covid-19-tracing-application';

CREATE TABLE IF NOT EXISTS "employee" (
  "employee_id" INTEGER NOT NULL,
  "name" TEXT NOT NULL,
  "office_number" INTEGER NOT NULL,
  "floor_number" INTEGER NOT NULL,
  "phone_number" TEXT NOT NULL,
  "email" TEXT NOT NULL,
  PRIMARY KEY ("employee_id")
);

CREATE TABLE IF NOT EXISTS "notification" (
  "notification_id" INTEGER NOT NULL,
  "employee_id" INTEGER NOT NULL,
  "notification_date" TIMESTAMP NOT NULL,
  "notification_type" TEXT NOT NULL,
  PRIMARY KEY ("notification_id"),
  CONSTRAINT "FK_Notification.notification_id"
    FOREIGN KEY ("notification_id")
      REFERENCES "employee"("employee_id")
);

CREATE TABLE IF NOT EXISTS "meeting" (
  "meeting_id" INTEGER NOT NULL,
  "employee_id" INTEGER NOT NULL,
  "room_number" INTEGER NOT NULL,
  "floor_number" INTEGER NOT NULL,
  "meeting_start_time" INTEGER NOT NULL,
  PRIMARY KEY ("meeting_id"),
  CONSTRAINT "FK_Meeting.meeting_id"
    FOREIGN KEY ("meeting_id")
      REFERENCES "employee"("employee_id")
);

CREATE TABLE IF NOT EXISTS "test" (
  "test_id" INTEGER NOT NULL,
  "employee_id" INTEGER NOT NULL,
  "location" TEXT NOT NULL,
  "test_date" TIMESTAMP NOT NULL,
  "test_time" INTEGER NOT NULL,
  "test_result" TEXT NOT NULL,
  PRIMARY KEY ("test_id"),
  CONSTRAINT "FK_Test.test_id"
    FOREIGN KEY ("test_id")
      REFERENCES "employee"("employee_id")
);

CREATE TABLE IF NOT EXISTS "scan" (
  "scan_id" INTEGER NOT NULL,
  "employee_id" INTEGER NOT NULL,
  "scan_date" TIMESTAMP NOT NULL,
  "scan_time" INTEGER NOT NULL,
  "temperature" INTEGER NOT NULL,
  PRIMARY KEY ("scan_id"),
  CONSTRAINT "FK_Scan.scan_id"
    FOREIGN KEY ("scan_id")
      REFERENCES "employee"("employee_id")
);

CREATE TABLE IF NOT EXISTS "symptom" (
  "row_id" INTEGER NOT NULL,
  "employee_id" INTEGER NOT NULL,
  "date_reported" TIMESTAMP NOT NULL,
  "symptom_id" INTEGER NOT NULL,
  PRIMARY KEY ("row_id"),
  CONSTRAINT "FK_Symptom.row_id"
    FOREIGN KEY ("row_id")
      REFERENCES "employee"("employee_id")
);

CREATE TABLE IF NOT EXISTS "covid_case" (
  "case_id" INTEGER NOT NULL,
  "employee_id" INTEGER NOT NULL,
  "date" TIMESTAMP NOT NULL,
  "resolution" TEXT NOT NULL,
  PRIMARY KEY ("case_id"),
  CONSTRAINT "FK_Case.case_id"
    FOREIGN KEY ("case_id")
      REFERENCES "employee"("employee_id")
);

CREATE TABLE IF NOT EXISTS "health_status" (
  "row_id" INTEGER NOT NULL,
  "employee_id" INTEGER NOT NULL,
  "date" TIMESTAMP NOT NULL,
  "status" TEXT NOT NULL,
  PRIMARY KEY ("row_id"),
  CONSTRAINT "FK_Health_Status.row_id"
    FOREIGN KEY ("row_id")
      REFERENCES "employee"("employee_id")
);


-- INSERT data in EMPLOYEE table
INSERT INTO employee VALUES (1, 'Alayna Pearson', 1, 6, '213-200-6560', 'alayna.pearson@gmail.com');
INSERT INTO employee VALUES (2, 'Reese Hunt', 5, 1, '213-201-4288', 'reese.hunt@gmail.com');
INSERT INTO employee VALUES (3, 'Julissa Coffey', 1, 2, '213-202-8777', 'julissa.coffey@gmail.com');
INSERT INTO employee VALUES (4, 'Sophia Horne', 6, 3, '213-203-5805', 'sophia.horne@gmail.com');
INSERT INTO employee VALUES (5, 'Thomas Horton', 8, 4, '213-204-5953', 'thomas.horton@gmail.com');
INSERT INTO employee VALUES (6, 'Hamza Kane', 10, 10, '213-206-8302', 'hamza.kane@gmail.com');
INSERT INTO employee VALUES (7, 'Frederick Pratt', 6, 5, '213-207-9426', 'frederick.pratt@gmail.com');
INSERT INTO employee VALUES (8, 'Makayla Nixon', 6, 7, '213-209-1358', 'makayla.nixon@gmail.com');
INSERT INTO employee VALUES (9, 'Joaquin Barajas', 1, 8, '213-210-9283', 'joaquin.barajas@gmail.com');
INSERT INTO employee VALUES (10, 'Laura Adams', 6, 9, '213-213-5623', 'laura.adams@gmail.com');
INSERT INTO employee VALUES (11, 'Rolando Bridges', 2, 6, '213-215-4919', 'rolando.bridges@gmail.com');
INSERT INTO employee VALUES (12, 'Carmen Rasmussen', 5, 1, '213-216-8243', 'carmen.rasmussen@gmail.com');
INSERT INTO employee VALUES (13, 'Juliet Franco', 8, 2, '213-217-1970', 'juliet.franco@gmail.com');
INSERT INTO employee VALUES (14, 'Ivy Compton', 1, 3, '213-219-2722', 'ivy.compton@gmail.com');
INSERT INTO employee VALUES (15, 'Santino Brown', 8, 4, '213-220-2484', 'santino.brown@gmail.com');
INSERT INTO employee VALUES (16, 'Bianca Stanton', 8, 10, '213-221-7427', 'bianca.stanton@gmail.com');
INSERT INTO employee VALUES (17, 'Clinton Wyatt', 1, 5, '213-222-6001', 'clinton.wyatt@gmail.com');
INSERT INTO employee VALUES (18, 'Armando Gilmore', 10, 7, '213-223-7351', 'armando.gilmore@gmail.com');
INSERT INTO employee VALUES (19, 'Misael Gaines', 8, 8, '213-224-2710', 'misael.gaines@gmail.com');
INSERT INTO employee VALUES (20, 'Mara Fitzgerald', 5, 9, '213-225-9541', 'mara.fitzgerald@gmail.com');

-- INSERT data in MEETING table
INSERT INTO meeting VALUES (1, 20, 848, 6, 9);
INSERT INTO meeting VALUES (2, 1, 561, 1, 14);
INSERT INTO meeting VALUES (3, 2, 882, 2, 17);
INSERT INTO meeting VALUES (4, 3, 812, 3, 9);
INSERT INTO meeting VALUES (5, 4, 986, 4, 8);
INSERT INTO meeting VALUES (6, 5, 728, 10, 14);
INSERT INTO meeting VALUES (7, 6, 102, 5, 8);
INSERT INTO meeting VALUES (8, 7, 736, 7, 8);
INSERT INTO meeting VALUES (9, 8, 687, 8, 14);
INSERT INTO meeting VALUES (10, 9, 514, 9, 16);
INSERT INTO meeting VALUES (11, 10, 437, 6, 11);
INSERT INTO meeting VALUES (12, 11, 294, 1, 12);
INSERT INTO meeting VALUES (13, 12, 449, 2, 11);
INSERT INTO meeting VALUES (14, 13, 130, 3, 14);
INSERT INTO meeting VALUES (15, 14, 322, 4, 9);
INSERT INTO meeting VALUES (16, 15, 763, 10, 15);
INSERT INTO meeting VALUES (17, 16, 616, 5, 15);
INSERT INTO meeting VALUES (18, 17, 101, 7, 17);
INSERT INTO meeting VALUES (19, 18, 789, 8, 9);
INSERT INTO meeting VALUES (20, 19, 456, 9, 15);

-- INSERT data in NOTIFICATION table (notificationID, employeeId, notificationDate, notificationType)
INSERT INTO notification VALUES (1, 20, '2020-01-13 09:52:50.55', 'OPTIONAL');
INSERT INTO notification VALUES (2, 1, '2020-12-22 19:51:48.145', 'MANDATORY');
INSERT INTO notification VALUES (3, 2, '2020-04-16 16:09:38.819', 'OPTIONAL');
INSERT INTO notification VALUES (4, 3, '2020-08-28 07:24:48.054', 'MANDATORY');
INSERT INTO notification VALUES (5, 4, '2020-10-23 10:46:20.077', 'OPTIONAL');
INSERT INTO notification VALUES (6, 5, '2020-06-08 10:33:24.664', 'MANDATORY');
INSERT INTO notification VALUES (7, 6, '2020-12-08 20:19:33.321', 'OPTIONAL');
INSERT INTO notification VALUES (8, 7, '2020-09-26 02:40:56.829', 'MANDATORY');
INSERT INTO notification VALUES (9, 8, '2020-08-09 07:51:54.111', 'OPTIONAL');
INSERT INTO notification VALUES (10, 9, '2020-12-02 16:25:24.382', 'MANDATORY');
INSERT INTO notification VALUES (11, 10, '2020-11-14 10:12:56.55', 'OPTIONAL');
INSERT INTO notification VALUES (12, 11, '2020-11-19 07:29:39.624', 'MANDATORY');
INSERT INTO notification VALUES (13, 12, '2020-09-13 18:48:14.694', 'OPTIONAL');
INSERT INTO notification VALUES (14, 13, '2020-02-11 16:43:44.991', 'MANDATORY');
INSERT INTO notification VALUES (15, 14, '2020-06-17 20:18:04.634', 'OPTIONAL');
INSERT INTO notification VALUES (16, 15, '2020-10-25 04:47:17.072', 'MANDATORY');
INSERT INTO notification VALUES (17, 16, '2020-11-08 19:24:17.385', 'OPTIONAL');
INSERT INTO notification VALUES (18, 17, '2020-08-30 19:05:40.472', 'MANDATORY');
INSERT INTO notification VALUES (19, 18, '2020-07-03 00:27:07.718', 'OPTIONAL');
INSERT INTO notification VALUES (20, 19, '2020-02-05 15:25:42.289', 'MANDATORY');

-- INSERT data in SYMPTOM table (rowID, employeeId, dateReported, symptomId)
INSERT INTO symptom VALUES (1, 19, '2020-08-03 22:38:41.925', '2');
INSERT INTO symptom VALUES (2, 1, '2020-05-03 05:34:45.349', '5');
INSERT INTO symptom VALUES (3, 2, '2020-12-04 22:41:33.107', '1');
INSERT INTO symptom VALUES (4, 3, '2020-04-09 06:02:20.585', '3');
INSERT INTO symptom VALUES (5, 4, '2020-09-03 09:19:43.102', '4');
INSERT INTO symptom VALUES (6, 5, '2020-01-03 12:45:41.76', '4');
INSERT INTO symptom VALUES (7, 6, '2020-02-25 13:37:40.358', '4');
INSERT INTO symptom VALUES (8, 7, '2020-08-26 12:43:17.482', '1');
INSERT INTO symptom VALUES (9, 8, '2020-11-17 12:44:48.516', '5');
INSERT INTO symptom VALUES (10, 9, '2020-05-05 06:37:24.252', '5');
INSERT INTO symptom VALUES (11, 10, '2020-05-07 10:46:08.679', '3');
INSERT INTO symptom VALUES (12, 11, '2020-09-13 21:29:46.555', '3');
INSERT INTO symptom VALUES (13, 12, '2020-12-16 09:43:13.716', '3');
INSERT INTO symptom VALUES (14, 13, '2020-01-04 01:29:07.794', '3');
INSERT INTO symptom VALUES (15, 14, '2020-02-15 05:32:02.743', '4');
INSERT INTO symptom VALUES (16, 15, '2020-08-26 10:09:56.248', '5');
INSERT INTO symptom VALUES (17, 19, '2020-04-18 03:28:18.073', '1');
INSERT INTO symptom VALUES (19, 19, '2020-04-18 03:28:18.073', '3');
INSERT INTO symptom VALUES (20, 19, '2020-04-18 03:28:18.073', '4');
INSERT INTO symptom VALUES (18, 19, '2020-04-18 03:28:18.073', '5');

-- INSERT data in SCAN table (scanID, employeeId, scan_date, scan_time, temperature)
INSERT INTO scan VALUES (1, 20, '2020-01-13 09:52:50.55', 23, 102);
INSERT INTO scan VALUES (2, 1, '2020-12-22 19:51:48.145', 1, 97);
INSERT INTO scan VALUES (3, 2, '2020-04-16 16:09:38.819', 2, 104);
INSERT INTO scan VALUES (4, 3, '2020-08-28 07:24:48.054', 3, 96);
INSERT INTO scan VALUES (5, 4, '2020-10-23 10:46:20.077', 4, 99);
INSERT INTO scan VALUES (6, 5, '2020-06-08 10:33:24.664', 5, 96);
INSERT INTO scan VALUES (7, 6, '2020-12-08 20:19:33.321', 6, 104);
INSERT INTO scan VALUES (8, 7, '2020-09-26 02:40:56.829', 7, 99);
INSERT INTO scan VALUES (9, 8, '2020-08-09 07:51:54.111', 8, 104);
INSERT INTO scan VALUES (10, 9, '2020-12-02 16:25:24.382', 9, 100);
INSERT INTO scan VALUES (11, 10, '2020-11-14 10:12:56.55', 10, 104);
INSERT INTO scan VALUES (12, 11, '2020-11-19 07:29:39.624', 11, 96);
INSERT INTO scan VALUES (13, 12, '2020-09-13 18:48:14.694', 12, 101);
INSERT INTO scan VALUES (14, 13, '2020-02-11 16:43:44.991', 13, 106);
INSERT INTO scan VALUES (15, 14, '2020-06-17 20:18:04.634', 14, 98);
INSERT INTO scan VALUES (16, 15, '2020-10-25 04:47:17.072', 15, 96);
INSERT INTO scan VALUES (17, 16, '2020-11-08 19:24:17.385', 16, 99);
INSERT INTO scan VALUES (18, 17, '2020-08-30 19:05:40.472', 17, 104);
INSERT INTO scan VALUES (19, 18, '2020-07-03 00:27:07.718', 18, 104);
INSERT INTO scan VALUES (20, 19, '2020-02-05 15:25:42.289', 19, 104);

-- INSERT data in TEST table (testID, employeeID, location, test_date, test_time, result)
INSERT INTO test VALUES (1, 20, 'COMPANY', '2020-01-13 09:52:50.55', 23, 'POSITIVE');
INSERT INTO test VALUES (2, 1, 'HOSPITAL', '2020-12-22 19:51:48.145', 1, 'NEGATIVE');
INSERT INTO test VALUES (3, 2, 'CLINIC', '2020-04-16 16:09:38.819', 2, 'POSITIVE');
INSERT INTO test VALUES (4, 3, 'COMPANY', '2020-08-28 07:24:48.054', 3, 'NEGATIVE');
INSERT INTO test VALUES (5, 4, 'HOSPITAL', '2020-10-23 10:46:20.077', 4, 'POSITIVE');
INSERT INTO test VALUES (6, 5, 'CLINIC', '2020-06-08 10:33:24.664', 5, 'NEGATIVE');
INSERT INTO test VALUES (7, 6, 'COMPANY', '2020-12-08 20:19:33.321', 6, 'POSITIVE');
INSERT INTO test VALUES (8, 7, 'HOSPITAL', '2020-09-26 02:40:56.829', 7, 'NEGATIVE');
INSERT INTO test VALUES (9, 8, 'CLINIC', '2020-08-09 07:51:54.111', 8, 'POSITIVE');
INSERT INTO test VALUES (10, 9, 'COMPANY', '2020-12-02 16:25:24.382', 9, 'NEGATIVE');
INSERT INTO test VALUES (11, 10, 'HOSPITAL', '2020-11-14 10:12:56.55', 10, 'POSITIVE');
INSERT INTO test VALUES (12, 11, 'CLINIC', '2020-11-19 07:29:39.624', 11, 'NEGATIVE');
INSERT INTO test VALUES (13, 12, 'COMPANY', '2020-09-13 18:48:14.694', 12, 'POSITIVE');
INSERT INTO test VALUES (14, 13, 'HOSPITAL', '2020-02-11 16:43:44.991', 13, 'NEGATIVE');
INSERT INTO test VALUES (15, 14, 'CLINIC', '2020-06-17 20:18:04.634', 14, 'POSITIVE');
INSERT INTO test VALUES (16, 15, 'COMPANY', '2020-10-25 04:47:17.072', 15, 'NEGATIVE');
INSERT INTO test VALUES (17, 16, 'HOSPITAL', '2020-11-08 19:24:17.385', 16, 'POSITIVE');
INSERT INTO test VALUES (18, 17, 'CLINIC', '2020-08-30 19:05:40.472', 17, 'NEGATIVE');
INSERT INTO test VALUES (19, 18, 'COMPANY', '2020-07-03 00:27:07.718', 18, 'POSITIVE');
INSERT INTO test VALUES (20, 19, 'HOSPITAL', '2020-02-05 15:25:42.289', 19, 'NEGATIVE');

-- INSERT data in covid_case (caseID, employeeId, date, resolution)
INSERT INTO covid_case VALUES (1, 20, '2020-01-13 09:52:50.55', 'BACK TO WORK');
INSERT INTO covid_case VALUES (2, 1, '2020-12-22 19:51:48.145', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (3, 2, '2020-04-16 16:09:38.819', 'DECEASED');
INSERT INTO covid_case VALUES (4, 3, '2020-08-28 07:24:48.054', 'BACK TO WORK');
INSERT INTO covid_case VALUES (5, 4, '2020-10-23 10:46:20.077', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (6, 5, '2020-06-08 10:33:24.664', 'DECEASED');
INSERT INTO covid_case VALUES (7, 6, '2020-12-08 20:19:33.321', 'BACK TO WORK');
INSERT INTO covid_case VALUES (8, 7, '2020-09-26 02:40:56.829', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (9, 8, '2020-08-09 07:51:54.111', 'DECEASED');
INSERT INTO covid_case VALUES (10, 9, '2020-12-02 16:25:24.382', 'BACK TO WORK');
INSERT INTO covid_case VALUES (11, 10, '2020-11-14 10:12:56.55', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (12, 11, '2020-11-19 07:29:39.624', 'DECEASED');
INSERT INTO covid_case VALUES (13, 12, '2020-09-13 18:48:14.694', 'BACK TO WORK');
INSERT INTO covid_case VALUES (14, 13, '2020-02-11 16:43:44.991', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (15, 14, '2020-06-17 20:18:04.634', 'DECEASED');
INSERT INTO covid_case VALUES (16, 15, '2020-10-25 04:47:17.072', 'BACK TO WORK');
INSERT INTO covid_case VALUES (17, 16, '2020-11-08 19:24:17.385', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (18, 17, '2020-08-30 19:05:40.472', 'DECEASED');
INSERT INTO covid_case VALUES (19, 18, '2020-07-03 00:27:07.718', 'BACK TO WORK');
INSERT INTO covid_case VALUES (20, 19, '2020-02-05 15:25:42.289', 'LEFT THE COMPANY');

-- INSERT data in health_status(row ID, employee ID, date, status)
INSERT INTO health_status VALUES (1, 20, '2020-01-13 09:52:50.55', 'SICK');
INSERT INTO health_status VALUES (2, 1, '2020-12-22 19:51:48.145', 'HOSPITALIZED');
INSERT INTO health_status VALUES (3, 2, '2020-04-16 16:09:38.819', 'WELL');
INSERT INTO health_status VALUES (4, 3, '2020-08-28 07:24:48.054', 'SICK');
INSERT INTO health_status VALUES (5, 4, '2020-10-23 10:46:20.077', 'HOSPITALIZED');
INSERT INTO health_status VALUES (6, 5, '2020-06-08 10:33:24.664', 'WELL');
INSERT INTO health_status VALUES (7, 6, '2020-12-08 20:19:33.321', 'SICK');
INSERT INTO health_status VALUES (8, 7, '2020-09-26 02:40:56.829', 'HOSPITALIZED');
INSERT INTO health_status VALUES (9, 8, '2020-08-09 07:51:54.111', 'WELL');
INSERT INTO health_status VALUES (10, 9, '2020-12-02 16:25:24.382', 'SICK');
INSERT INTO health_status VALUES (11, 10, '2020-11-14 10:12:56.55', 'HOSPITALIZED');
INSERT INTO health_status VALUES (12, 11, '2020-11-19 07:29:39.624', 'WELL');
INSERT INTO health_status VALUES (13, 12, '2020-09-13 18:48:14.694', 'SICK');
INSERT INTO health_status VALUES (14, 13, '2020-02-11 16:43:44.991', 'HOSPITALIZED');
INSERT INTO health_status VALUES (15, 14, '2020-06-17 20:18:04.634', 'WELL');
INSERT INTO health_status VALUES (16, 15, '2020-10-25 04:47:17.072', 'SICK');
INSERT INTO health_status VALUES (17, 16, '2020-11-08 19:24:17.385', 'HOSPITALIZED');
INSERT INTO health_status VALUES (18, 17, '2020-08-30 19:05:40.472', 'WELL');
INSERT INTO health_status VALUES (19, 18, '2020-07-03 00:27:07.718', 'SICK');
INSERT INTO health_status VALUES (20, 19, '2020-02-05 15:25:42.289', 'HOSPITALIZED');

-- Q2 (1 point). Write a query to output the most-self-reported symptom.
SELECT symptom_id,
       COUNT(symptom_id) AS number_of_times_symptom_was_reported
FROM   symptom
GROUP  BY symptom_id
ORDER  BY COUNT(symptom_id) DESC; 

-- Q3 (1 point). Write a query to output the 'sickest' floor.
SELECT e.floor_number,
       COUNT(e.floor_number) AS NUMBER_OF_PATIENTS_SICK_ON_THIS_FLOOR
FROM employee e
JOIN
  (SELECT *
   FROM health_status
   WHERE status in ('SICK',
                    'HOSPITALIZED')) AS hs ON (e.employee_id = hs.employee_id)
GROUP BY e.floor_number
ORDER BY COUNT(e.floor_number) DESC;

-- Q4 (1 point). The management would like stats, for a given period (between start, end dates), on the following: 
-- number of scans, 
-- number of tests, 
-- number of employees who self-reported symptoms, 
-- number of positive cases. 
-- Write queries to output these.

-- number of scans
SELECT employee_id,
       scan_date::date,
       temperature
FROM scan
WHERE scan_date BETWEEN '2020-04-13'::TIMESTAMP::date AND '2020-09-30'::TIMESTAMP::date;

-- total number of tests
SELECT employee_id,
       test_date::date,
       test_result
FROM test
WHERE test_date 
	BETWEEN '2020-04-13'::TIMESTAMP::date 
	AND '2020-09-30'::TIMESTAMP::date;

-- total number of people who self-reported the symptoms
SELECT employee_id,
       date_reported,
       symptom_id
FROM symptom
WHERE date_reported 
	BETWEEN '2020-04-13'::TIMESTAMP::date 
	AND '2020-09-30'::TIMESTAMP::date;

-- number of positive cases.
SELECT *
FROM test
WHERE test_date 
	BETWEEN '2020-04-13'::TIMESTAMP::date 
	AND '2020-09-30'::TIMESTAMP::date
  	AND test_result = 'POSITIVE';


SELECT sym.symptom_id,
       s.temperature,
       t.test_result,
       count(*)
FROM scan s
INNER JOIN test t ON s.employee_id = t.employee_id
INNER JOIN symptom sym ON t.employee_id = sym.employee_id
WHERE t.test_date 
	BETWEEN '2020-04-13'::TIMESTAMP::date 
	AND '2020-09-30'::TIMESTAMP::date
	AND test_result = 'POSITIVE'
GROUP BY sym.symptom_id,
         s.temperature,
         t.test_result;
		 
		 
-- Q5 (1 point). Create your own query! What else would you like to learn, from the data? 
-- Describe/list the question, and come up with the query to answer it. 
-- You'll get 1 extra point if your query involves table division [be sure to indicate this in your README].

-- The query could be something like this - Which employee has had all the symptoms?

DROP TABLE A;
DROP TABLE S;

CREATE TEMP TABLE IF NOT EXISTS A AS
  (SELECT e.name,
          s.symptom_id
   FROM employee e
   JOIN symptom s ON e.employee_id = s.employee_id
  );

CREATE TEMP TABLE IF NOT EXISTS S AS
  (SELECT DISTINCT s.symptom_id
   FROM symptom s
   ORDER BY s.symptom_id
  );

WITH employeeswithoutallsymptoms AS
  (SELECT name,
          symptom_id
   FROM S
   CROSS JOIN
     (SELECT DISTINCT name
      FROM A) AS uniquenames
   EXCEPT SELECT name,
                 symptom_id
   FROM A
  )
SELECT DISTINCT name AS EMPLOYEES_WITH_ALL_SYMPTOMS
FROM A
EXCEPT
SELECT DISTINCT name
FROM employeeswithoutallsymptoms;

-- To verify the ID of the employee with all the symptoms
SELECT * FROM EMPLOYEE WHERE name like '%Misael Gaines%';



DROP TABLE employee;
DROP TABLE notification;
DROP TABLE meeting;
DROP TABLE test;
DROP TABLE scan;
DROP TABLE symptom;
DROP TABLE covid_case;
DROP TABLE health_status;


select * from employee;
select * from covid_case;
select * from health_status;
select * from meeting;
select * from symptom;
select * from notification;
select * from scan;
select * from test;