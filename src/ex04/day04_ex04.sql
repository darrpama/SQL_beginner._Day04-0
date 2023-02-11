CREATE VIEW v_symmetric_union AS
WITH R AS (
    SELECT person_id
    FROM person_visits
    JOIN person ON person.id = person_visits.person_id
    WHERE visit_date = '2022-01-02'),
     S AS (
    SELECT person_id
    FROM person_visits
    JOIN person ON person.id = person_visits.person_id
    WHERE visit_date = '2022-01-06')
SELECT * FROM R
UNION
SELECT * FROM S
ORDER BY person_id;