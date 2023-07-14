/* Crear una base de datos */
CREATE DATABASE IF NOT EXISTS mundo;

/* Eliminar una base de datos  */

DROP DATABASE IF EXISTS mundo;

/* Usar una base de datos */

USE mundo;

/* Crear una tabla en la base de datos */

CREATE TABLE IF NOT EXISTS pais(
    id int,
    nombre varchar(20),
    continente varchar(50),
    poblacion int
);

/* Borrar tablas en la base de datos */
CREATE TABLE Temp(
    id int,
    dato varchar(20);
)
DROP TABLE Temp;

/* Crear llaves primarias */

CREATE TABLE IF NOT EXISTS pais(
    id int PRIMARY KEY,
    nombre varchar(20),
    continente varchar(50),
    poblacion int
);

/* Definir la llave foranea después de crear la tabla */

ALTER TABLE pais
ADD PRIMARY KEY (id);

/* Insertar datos en la tabla de  la base de datos */

INSERT INTO pais(id, nombre, continente, poblacion)
VALUES (101, "Colombia","Sur América", 5000000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (102, "Ecuador", "Sur América", 17000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (103, "Guatemala", "Centro América", 17000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (104, "México", "Centro América", 126000000);

/* Modificar datos de la base de datos */

UPDATE pais
SET poblacion = 50887423
WHERE id=101;

/* Eliminar datos de la base de datos */

DELETE FROM pais WHERE id=104;

/* Consultar datos en la base de datos */

SELECT id, nombre, continente, poblacion
FROM pais

/* Cuando se desea consultar todos los campos de una tabla se usa el operador de comodin */

SELECT * FROM pais;

/* Seleccionarun dato mediante una codición que propongamos */

SELECT nombre FROM pais WHERE poblacion <=10000000;


/* En las cláusulas WHERE se puede utilizar varios operadores lógicos y condicionales para construir condiciones que determinen qué filas deben seleccionarse */.

/* 1. Operadores de comparación:
"=": Igual a.
"<>": Diferente de.
"<": Menor que.
">": Mayor que.
"<=": Menor o igual que.
">=": Mayor o igual que

2. Operadores lógicos:
 "AND": Evalúa dos condiciones y devuelve verdadero si ambas son verdaderas.
 "OR": Evalúa dos condiciones y devuelve verdadero si al menos una de ellas es verdadera.
 "NOT": Niega una condición y devuelve verdadero si la condición es falsa */

/* Ordenar los datos asignados dependiendo de la condicion que otorguemos */
/* Resultado de ordenación por nombre (se podria usar ASC, que significa ascedente, pero esta hace por defecto con el ORDER BY) */

SELECT nombre
FROM pais
WHERE poblacion <= 100000000
ORDER BY nombre; 

/*  Resultados ordenados descendentemente */

SELECT nombre
FROM pais
ORDER BY nombre DESC; 

/* Consulta limitando los resultados con limit */

SELECT nombre
FROM pais
ORDER BY nombre
LIMIT 2;

