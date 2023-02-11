INSERT INTO person_visits
VALUES (
            (SELECT (MAX(id) + 1) FROM person_visits),
            (SELECT id FROM person WHERE name = 'Dmitriy'),
            (SELECT MIN(pizzeria.id) FROM pizzeria
                JOIN menu  ON pizzeria.id = menu.pizzeria_id
                WHERE pizzeria.name NOT IN (SELECT pizzeria_name FROM mv_dmitriy_visits_and_eats) AND price < 800),
            '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;