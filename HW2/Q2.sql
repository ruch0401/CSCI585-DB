-- DB application used = PostgreSQL | GUI used = PgAdmin4
set search_path to 'covid-19-tracing-application';

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

-- The query returns the most self-reported symptom