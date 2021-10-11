-- DB application used = PostgreSQL | GUI used = PgAdmin4
set search_path to 'covid-19-tracing-application';

-- Q2 (1 point). Write a query to output the most-self-reported symptom.
SELECT symptom_id,
       COUNT(symptom_id) AS number_of_times_symptom_was_reported
FROM   symptom
GROUP  BY symptom_id
ORDER  BY COUNT(symptom_id) DESC;

-- The query returns a result-set as a count of how many times has a particular symptom been reported.
-- Limiting an output to just the top row (after it has been sorted in descending order based on count(symptom_id)
-- can lead to incorrect data if the top self-reported symptom is more than one. Hence, I am generating a report to
-- identify the frequency of each self-reported symptom.