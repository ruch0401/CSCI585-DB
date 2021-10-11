-- DB application used = PostgreSQL | GUI used = PgAdmin4
set search_path to 'covid-19-tracing-application';

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


-- The query returns a result-set as a count of how many patients were reported/diagnosed sick on each floor.
-- Limiting an output to just the top row (after it has been sorted in descending order based on count(e.floor_numbe)
-- can lead to incorrect data if there are same number of employees that have been reported sick on 2 different floors.
-- Hence, I am generating a report to identify the number of sick employees on each floor.