CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name as pizzeria_name
FROM (SELECT * FROM person) AS persons
JOIN person_visits pv ON persons.id = pv.person_id
JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE pv.visit_date = '2022-01-08' AND persons.name = 'Dmitriy' AND menu.price < 800;