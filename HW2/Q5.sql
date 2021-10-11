-- DB application used = PostgreSQL | GUI used = PgAdmin4
set search_path to 'covid-19-tracing-application';

-- Q5 (1 point). Create your own query! What else would you like to learn, from the data?
-- Describe/list the question, and come up with the query to answer it.
-- You'll get 1 extra point if your query involves table division [be sure to indicate this in your README].

CREATE TEMP TABLE IF NOT EXISTS A AS
  (SELECT e.name,
          s.symptom_id
   FROM employee e
   JOIN symptom s ON e.employee_id = s.employee_id
  )

CREATE TEMP TABLE IF NOT EXISTS S AS
  (SELECT DISTINCT s.symptom_id
   FROM symptom s
   ORDER BY s.symptom_id
  )

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

-- Note: The query performs relational division using the existing SQL operations at our disposal. Query explanation -
-- We create 2 temporary tables -> A(employee_name, symptom_id) and S(symptom_id)
-- We select the distinct occurrences of names in A and perform a cross join with S. This gives us all possible combinations
-- of employee name and available symptoms. We then perform a relational subtraction to remove all entries present in the original table 'A'
-- using 'EXCEPT' which gives us all the employees which DO NOT have all the symptoms. All this is wrapped in a Common Table Expression (CTE) with the name 'employeeswithoutallsymptoms'
-- We again perform the relational subtraction i.e. [A - employeeswithoutallsymptoms] to get the final answer
