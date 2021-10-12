-- DB application used = PostgreSQL | GUI used = PgAdmin4
set search_path to 'covid-19-tracing-application';

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


-- A temp table is created that creates a report of the floor number and how many employees are sick on that particular floor
-- This temp table is then used to find the floor(s) with the maximum number of sick employees a.k.a. sickest floor