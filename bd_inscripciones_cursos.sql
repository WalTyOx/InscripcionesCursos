INSERT INTO estudiantes(nombre, edad)
VALUES('Thom', 22), ('Julian', 23), ('Morrisey', 25), ('Jeff', 27), ('Kurt', 27);

INSERT INTO cursos(nombre, duracion)
VALUES('Python', '1 año'), ('Java', '6 meses'), ('JavaScript', '8 meses'), ('C#', '10 meses');

INSERT INTO inscripciones(estudiantes_id, cursos_id)
VALUES(1, 1), (2, 4), (3, 4), (4, 1);

SELECT e.nombre AS estudiante, c.nombre AS curso, c.duracion
FROM estudiantes e
JOIN inscripciones i ON e.id = i.estudiantes_id
JOIN cursos c ON i.cursos_id = c.id;

SELECT e.nombre AS estudiante, c.nombre AS curso, c.duracion
FROM estudiantes e 
JOIN inscripciones i ON e.id = i.estudiantes_id
JOIN cursos c ON i.cursos_id = c.id
WHERE c.nombre = 'Python';

SELECT c.nombre AS curso, e.nombre AS estudiante, c.duracion
FROM cursos c
JOIN inscripciones i ON c.id = i.cursos_id
JOIN estudiantes e ON i.estudiantes_id = e.id
WHERE e.nombre = 'Thom';

SELECT c.nombre, COUNT(i.estudiantes_id) AS cantidad_estudiantes
FROM cursos c LEFT JOIN inscripciones i ON c.id = i.cursos_id
GROUP BY c.id, c.nombre;

SELECT e.*
FROM estudiantes e LEFT JOIN inscripciones i ON e.id = i.estudiantes_id
WHERE i.estudiantes_id IS NULL;