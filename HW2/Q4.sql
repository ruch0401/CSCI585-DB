-- DB application used = PostgreSQL | GUI used = PgAdmin4
set search_path to 'covid-19-tracing-application';

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
SELECT COUNT(*) AS TOTAL_NUMBER_OF_PEOPLE_WHO_SELF_REPORTED_SYMPTOMS
FROM symptom
WHERE date_reported
	BETWEEN '2020-04-13'::TIMESTAMP::date
	AND '2020-09-30'::TIMESTAMP::date;