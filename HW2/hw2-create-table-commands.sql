set search_path to 'covid-19-tracing-application-3';

CREATE TABLE IF NOT EXISTS "employee" (
  "employee_id" INTEGER NOT NULL,
  "name" TEXT NOT NULL,
  "office_number" INTEGER NOT NULL,
  "floor_number" INTEGER NOT NULL CHECK (floor_number >= 1 AND floor_number <= 10),
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
  "floor_number" INTEGER NOT NULL CHECK (floor_number >= 1 AND floor_number <= 10),
  "meeting_start_time" INTEGER NOT NULL CHECK (meeting_start_time <= 23 AND meeting_start_time >= 0),
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
  "test_time" INTEGER NOT NULL CHECK (test_time <= 23 AND test_time >= 0),
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
  "scan_time" INTEGER NOT NULL CHECK (scan_time <= 23 AND scan_time >= 0),
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

-- INSERT data in EMPLOYEE table (ID, name, office number, floor number, phone number, email address )
INSERT INTO employee VALUES (1, 'Alayna Pearson', 1, 6, '213-200-6560', 'alayna.pearson@gmail.com');
INSERT INTO employee VALUES (2, 'Reese Hunt', 5, 8, '213-201-4288', 'reese.hunt@gmail.com');
INSERT INTO employee VALUES (3, 'Julissa Coffey', 1, 8, '213-202-8777', 'julissa.coffey@gmail.com');
INSERT INTO employee VALUES (4, 'Sophia Horne', 6, 9, '213-203-5805', 'sophia.horne@gmail.com');
INSERT INTO employee VALUES (5, 'Thomas Horton', 8, 1, '213-204-5953', 'thomas.horton@gmail.com');
INSERT INTO employee VALUES (6, 'Hamza Kane', 10, 7, '213-206-8302', 'hamza.kane@gmail.com');
INSERT INTO employee VALUES (7, 'Frederick Pratt', 6, 3, '213-207-9426', 'frederick.pratt@gmail.com');
INSERT INTO employee VALUES (8, 'Makayla Nixon', 6, 7, '213-209-1358', 'makayla.nixon@gmail.com');
INSERT INTO employee VALUES (9, 'Joaquin Barajas', 1, 1, '213-210-9283', 'joaquin.barajas@gmail.com');
INSERT INTO employee VALUES (10, 'Laura Adams', 6, 2, '213-213-5623', 'laura.adams@gmail.com');
INSERT INTO employee VALUES (11, 'Rolando Bridges', 2, 6, '213-215-4919', 'rolando.bridges@gmail.com');
INSERT INTO employee VALUES (12, 'Carmen Rasmussen', 5, 4, '213-216-8243', 'carmen.rasmussen@gmail.com');
INSERT INTO employee VALUES (13, 'Juliet Franco', 8, 3, '213-217-1970', 'juliet.franco@gmail.com');
INSERT INTO employee VALUES (14, 'Ivy Compton', 1, 3, '213-219-2722', 'ivy.compton@gmail.com');
INSERT INTO employee VALUES (15, 'Santino Brown', 8, 6, '213-220-2484', 'santino.brown@gmail.com');
INSERT INTO employee VALUES (16, 'Bianca Stanton', 8, 9, '213-221-7427', 'bianca.stanton@gmail.com');
INSERT INTO employee VALUES (17, 'Clinton Wyatt', 1, 9, '213-222-6001', 'clinton.wyatt@gmail.com');
INSERT INTO employee VALUES (18, 'Armando Gilmore', 1, 4, '213-223-7351', 'armando.gilmore@gmail.com');
INSERT INTO employee VALUES (19, 'Misael Gaines', 8, 7, '213-224-2710', 'misael.gaines@gmail.com');
INSERT INTO employee VALUES (20, 'Mara Fitzgerald', 5, 1, '213-225-9541', 'mara.fitzgerald@gmail.com');

-- INSERT data in MEETING table (meeting ID, employee ID, room number, floor number, meeting start time)
INSERT INTO meeting VALUES (1, 10, 848, 6, 9);
INSERT INTO meeting VALUES (2, 1, 561, 8, 14);
INSERT INTO meeting VALUES (3, 2, 882, 8, 17);
INSERT INTO meeting VALUES (4, 3, 812, 9, 9);
INSERT INTO meeting VALUES (5, 4, 986, 1, 8);
INSERT INTO meeting VALUES (6, 5, 728, 7, 14);
INSERT INTO meeting VALUES (7, 6, 102, 3, 8);
INSERT INTO meeting VALUES (8, 7, 736, 7, 8);
INSERT INTO meeting VALUES (9, 8, 687, 1, 14);
INSERT INTO meeting VALUES (10, 20, 514, 2, 16);
INSERT INTO meeting VALUES (11, 9, 437, 6, 11);
INSERT INTO meeting VALUES (12, 11, 294, 4, 12);
INSERT INTO meeting VALUES (13, 12, 449, 3, 11);
INSERT INTO meeting VALUES (14, 13, 130, 3, 14);
INSERT INTO meeting VALUES (15, 14, 322, 6, 9);
INSERT INTO meeting VALUES (16, 15, 763, 9, 15);
INSERT INTO meeting VALUES (17, 16, 616, 9, 15);
INSERT INTO meeting VALUES (18, 17, 101, 4, 17);
INSERT INTO meeting VALUES (19, 18, 789, 7, 9);
INSERT INTO meeting VALUES (20, 19, 456, 1, 15);

-- INSERT data in NOTIFICATION table (notificationID, employeeId, notificationDate, notificationType)
INSERT INTO notification VALUES (1, 7, '2020-11-25 21:56:22.834', 'OPTIONAL');
INSERT INTO notification VALUES (2, 1, '2020-12-25 13:21:57.481', 'MANDATORY');
INSERT INTO notification VALUES (3, 2, '2020-04-14 05:04:57.581', 'OPTIONAL');
INSERT INTO notification VALUES (4, 3, '2020-09-20 17:09:03.914', 'MANDATORY');
INSERT INTO notification VALUES (5, 4, '2020-04-09 01:43:17.728', 'OPTIONAL');
INSERT INTO notification VALUES (6, 5, '2020-07-30 08:31:19.577', 'MANDATORY');
INSERT INTO notification VALUES (7, 20, '2020-07-30 23:42:06.568', 'OPTIONAL');
INSERT INTO notification VALUES (8, 6, '2020-11-10 12:14:43.0', 'MANDATORY');
INSERT INTO notification VALUES (9, 8, '2020-04-23 03:38:34.867', 'OPTIONAL');
INSERT INTO notification VALUES (10, 9, '2020-12-07 01:58:45.814', 'MANDATORY');
INSERT INTO notification VALUES (11, 10, '2020-08-21 01:30:32.496', 'OPTIONAL');
INSERT INTO notification VALUES (12, 11, '2020-09-04 09:59:58.7', 'MANDATORY');
INSERT INTO notification VALUES (13, 12, '2020-05-28 17:46:32.02', 'OPTIONAL');
INSERT INTO notification VALUES (14, 13, '2020-02-20 00:40:30.403', 'MANDATORY');
INSERT INTO notification VALUES (15, 14, '2020-05-26 11:54:10.156', 'OPTIONAL');
INSERT INTO notification VALUES (16, 15, '2020-03-22 04:37:42.417', 'MANDATORY');
INSERT INTO notification VALUES (17, 16, '2020-04-19 02:15:09.428', 'OPTIONAL');
INSERT INTO notification VALUES (18, 17, '2020-11-25 10:47:18.702', 'MANDATORY');
INSERT INTO notification VALUES (19, 18, '2020-07-20 19:13:04.594', 'OPTIONAL');
INSERT INTO notification VALUES (20, 19, '2020-01-19 16:08:14.789', 'MANDATORY');

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
INSERT INTO scan VALUES (1, 3, '2020-03-12 01:54:50.901', 5, 102);
INSERT INTO scan VALUES (2, 1, '2020-10-09 02:55:54.363', 1, 97);
INSERT INTO scan VALUES (3, 20, '2020-05-23 21:37:01.631', 2, 104);
INSERT INTO scan VALUES (4, 2, '2020-12-10 10:20:49.315', 3, 96);
INSERT INTO scan VALUES (5, 4, '2020-06-12 10:17:14.232', 23, 99);
INSERT INTO scan VALUES (6, 5, '2020-01-08 22:19:16.634', 4, 96);
INSERT INTO scan VALUES (7, 6, '2020-05-19 23:58:15.197', 6, 104);
INSERT INTO scan VALUES (8, 7, '2020-03-04 06:34:50.256', 7, 99);
INSERT INTO scan VALUES (9, 8, '2020-08-04 04:01:28.42', 8, 104);
INSERT INTO scan VALUES (10, 9, '2020-10-07 16:27:40.844', 9, 100);
INSERT INTO scan VALUES (11, 10, '2020-02-09 12:02:13.683', 10, 104);
INSERT INTO scan VALUES (12, 11, '2020-04-01 14:26:47.274', 11, 96);
INSERT INTO scan VALUES (13, 12, '2020-07-18 03:21:10.506', 12, 101);
INSERT INTO scan VALUES (14, 13, '2020-01-26 22:57:31.613', 13, 106);
INSERT INTO scan VALUES (15, 14, '2020-02-10 02:17:58.82', 14, 98);
INSERT INTO scan VALUES (16, 15, '2020-07-21 23:57:40.077', 15, 96);
INSERT INTO scan VALUES (17, 16, '2020-01-26 15:52:07.702', 16, 99);
INSERT INTO scan VALUES (18, 17, '2020-10-25 04:43:11.305', 17, 104);
INSERT INTO scan VALUES (19, 18, '2020-08-17 04:25:28.593', 18, 104);
INSERT INTO scan VALUES (20, 19, '2020-11-25 04:30:48.427', 19, 104);

-- INSERT data in TEST table (testID, employeeID, location, test_date, test_time, result)
INSERT INTO test VALUES (1, 20, 'COMPANY', '2020-12-23 21:27:43.031', 10, 'POSITIVE');
INSERT INTO test VALUES (2, 1, 'HOSPITAL', '2020-01-27 06:05:12.227', 1, 'NEGATIVE');
INSERT INTO test VALUES (3, 2, 'CLINIC', '2020-09-06 11:48:05.163', 2, 'POSITIVE');
INSERT INTO test VALUES (4, 3, 'COMPANY', '2020-04-09 20:10:33.249', 3, 'NEGATIVE');
INSERT INTO test VALUES (5, 4, 'HOSPITAL', '2020-08-19 02:14:47.112', 4, 'POSITIVE');
INSERT INTO test VALUES (6, 5, 'CLINIC', '2020-01-22 00:28:34.092', 5, 'NEGATIVE');
INSERT INTO test VALUES (7, 6, 'COMPANY', '2020-01-20 02:41:29.164', 6, 'POSITIVE');
INSERT INTO test VALUES (8, 7, 'HOSPITAL', '2020-10-06 05:32:00.439', 7, 'NEGATIVE');
INSERT INTO test VALUES (9, 8, 'CLINIC', '2020-12-17 14:16:20.448', 8, 'POSITIVE');
INSERT INTO test VALUES (10, 9, 'COMPANY', '2020-07-02 06:48:14.177', 23, 'NEGATIVE');
INSERT INTO test VALUES (11, 10, 'HOSPITAL', '2020-11-25 14:30:00.774', 9, 'POSITIVE');
INSERT INTO test VALUES (12, 11, 'CLINIC', '2020-07-19 13:39:01.703', 11, 'NEGATIVE');
INSERT INTO test VALUES (13, 12, 'COMPANY', '2020-05-01 14:03:42.229', 12, 'POSITIVE');
INSERT INTO test VALUES (14, 13, 'HOSPITAL', '2020-12-22 21:30:57.237', 13, 'NEGATIVE');
INSERT INTO test VALUES (15, 14, 'CLINIC', '2020-12-14 20:42:39.137', 14, 'POSITIVE');
INSERT INTO test VALUES (16, 15, 'COMPANY', '2020-03-26 12:01:01.082', 15, 'NEGATIVE');
INSERT INTO test VALUES (17, 16, 'HOSPITAL', '2020-10-26 05:23:09.241', 16, 'POSITIVE');
INSERT INTO test VALUES (18, 17, 'CLINIC', '2020-08-26 21:43:17.019', 17, 'NEGATIVE');
INSERT INTO test VALUES (19, 18, 'COMPANY', '2020-12-25 09:12:10.49', 18, 'POSITIVE');
INSERT INTO test VALUES (20, 19, 'HOSPITAL', '2020-11-29 21:04:18.76', 19, 'NEGATIVE');

-- INSERT data in covid_case (caseID, employeeId, date, resolution)
INSERT INTO covid_case VALUES (1, 20, '2020-03-08 00:31:50.869', 'BACK TO WORK');
INSERT INTO covid_case VALUES (2, 1, '2020-01-16 09:10:54.258', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (3, 2, '2020-12-03 15:57:31.583', 'DECEASED');
INSERT INTO covid_case VALUES (4, 3, '2020-02-15 06:06:44.313', 'BACK TO WORK');
INSERT INTO covid_case VALUES (5, 4, '2020-05-11 06:01:26.079', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (6, 5, '2020-06-30 20:28:09.047', 'DECEASED');
INSERT INTO covid_case VALUES (7, 6, '2020-10-24 09:44:24.776', 'BACK TO WORK');
INSERT INTO covid_case VALUES (8, 7, '2020-04-13 07:50:29.798', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (9, 8, '2020-01-19 10:50:29.439', 'DECEASED');
INSERT INTO covid_case VALUES (10, 9, '2020-02-12 16:26:49.336', 'BACK TO WORK');
INSERT INTO covid_case VALUES (11, 10, '2020-03-07 13:54:59.34', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (12, 11, '2020-08-26 06:42:29.039', 'DECEASED');
INSERT INTO covid_case VALUES (13, 12, '2020-09-05 20:46:57.718', 'BACK TO WORK');
INSERT INTO covid_case VALUES (14, 13, '2020-12-26 17:37:39.904', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (15, 14, '2020-03-24 07:45:21.435', 'DECEASED');
INSERT INTO covid_case VALUES (16, 15, '2020-01-28 12:54:00.152', 'BACK TO WORK');
INSERT INTO covid_case VALUES (17, 16, '2020-02-26 08:15:07.283', 'LEFT THE COMPANY');
INSERT INTO covid_case VALUES (18, 17, '2020-09-13 06:38:25.395', 'DECEASED');
INSERT INTO covid_case VALUES (19, 18, '2020-07-01 17:58:37.703', 'BACK TO WORK');
INSERT INTO covid_case VALUES (20, 19, '2020-07-09 12:15:19.119', 'LEFT THE COMPANY');

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


-- Q2 (1 point). Write a query to output the most-self-reported symptom.
SELECT symptom_id,
       COUNT(symptom_id) AS most_reported_symptom
FROM symptom
GROUP  BY symptom_id
HAVING COUNT(symptom_id) >=
  (SELECT COUNT(symptom_id)
   FROM symptom
   GROUP BY symptom_id
   ORDER BY count(symptom_id) DESC
   LIMIT 1);

-- Q3 (1 point). Write a query to output the 'sickest' floor.
DROP TABLE IF EXISTS t1;
CREATE TEMP TABLE t1 AS
  (SELECT e.floor_number,
          COUNT(e.floor_number) AS SICKEST_FLOOR
   FROM employee e
   JOIN
     (SELECT *
      FROM health_status
      WHERE status in ('SICK',
                       'HOSPITALIZED')) AS hs ON (e.employee_id = hs.employee_id)
   GROUP BY e.floor_number
   ORDER BY COUNT(e.floor_number) DESC);

SELECT *
FROM t1
WHERE t1.SICKEST_FLOOR >=
    (SELECT SICKEST_FLOOR
     FROM t1
     ORDER BY SICKEST_FLOOR DESC
     LIMIT 1);


-- Q4 (1 point). The management would like stats, for a given period (between start, end dates), on the following:
-- number of scans,
-- number of tests,
-- number of employees who self-reported symptoms,
-- number of positive cases.
-- Write queries to output these.

-- Note: The start and end dates have been hardcoded and chosen at random to show data that conforms within that date range

-- total number of scans
SELECT COUNT(*) as TOTAL_NUMBER_OF_SCANS
FROM scan
WHERE scan_date
    BETWEEN '2020-04-13'::TIMESTAMP::date
    AND '2020-09-30'::TIMESTAMP::date;

-- total number of tests
SELECT COUNT(*) as TOTAL_NUMBER_OF_TESTS
FROM test
WHERE test_date
	BETWEEN '2020-04-13'::TIMESTAMP::date
	AND '2020-09-30'::TIMESTAMP::date;

-- total number of people who self-reported the symptoms
SELECT COUNT(*) AS TOTAL_NUMBER_OF_PEOPLE_WHO_SELF_REPORTED_SYMPTOMS
FROM symptom
WHERE date_reported
	BETWEEN '2020-04-13'::TIMESTAMP::date
	AND '2020-09-30'::TIMESTAMP::date;

-- number of positive cases.
SELECT COUNT(*) AS TOTAL_POSITIVE_CASES
FROM test
WHERE test_date
  BETWEEN '2020-04-13'::TIMESTAMP::date
  AND '2020-09-30'::TIMESTAMP::date
    AND test_result = 'POSITIVE';


-- Q5 (1 point). Create your own query! What else would you like to learn, from the data?
-- Describe/list the question, and come up with the query to answer it.
-- You'll get 1 extra point if your query involves table division [be sure to indicate this in your README].

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