/* Crear tablas con SELECT */

/*  Crear una tabla nueva llamada "tempPais" con los nombres y poblaciones de los países que tienen menos de 100 millones de habitantes */
CREATE TABLE tempPais
AS
SELECT nombre, poblacion
FROM pais
WHERE poblacion < 100000000;

/* Obtener la estructura de una tabla */
DESCRIBE tempPais;

/* Crear tabla con una llave foránea que referencia otra tabla" */
CREATE TABLE ciudad (
    id int PRIMARY KEY,
    nombre varchar(20),
    id_pais int,
    FOREIGN KEY (id_pais)
    REFERENCES pais (id)
);

/*  Seleccionar  con un alias "nombre_pais" */
SELECT nombre AS nombre_pais
FROM pais;

/* Hacer call con alias de tablas */
SELECT p.nombre AS nombre_pais, c.nombre AS nombre_ciudad
FROM pais AS p
JOIN ciudad AS c ON p.id = c.id_pais;

/* Concatenar datos  */
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo
FROM clientes;

/*   Asignar un atributo segun una condición */
SELECT nombre, precio, IF(precio > 100, 'Alto', 'Bajo') AS categoria_precio
FROM productos;

/* Combinar utilizando INNER JOIN */
SELECT p.nombre AS nombre_pais, c.nombre AS nombre_ciudad
FROM pais AS p
INNER JOIN ciudad AS c ON p.id = c.id_pais;
WHERE pais.nombre = "México"
LEFT JOIN:


//--La sintaxis de los LEFT JOIN es la siguiente:
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

//--Un ejemplo de uso de LEFT JOIN es listar todos los países y las ciudades que estén en la base de datos. La consulta SQL sería la siguiente:
SELECT pais.nombre AS pais, ciudad.nombre AS ciudad
FROM pais
LEFT JOIN ciudad
ON pais.id = ciudad.id_pais;

//--RIGHT JOIN:
//--La cláusula RIGHT JOIN devuelve todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda. El resultado es NULL en el lado izquierdo si no hay coincidencia.
//--La sintaxis de los RIGHT JOIN es la siguiente:
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

    //--Un ejemplo de uso de RIGHT JOIN es listar todas las ciudades y los países a los que pertenecen. La consulta SQL sería la siguiente:
SELECT pais.nombre AS pais, ciudad.nombre AS ciudad
FROM pais
RIGHT JOIN ciudad
ON pais.id = ciudad.id_pais;


//--RIGHT JOIN:
//--La cláusula RIGHT JOIN devuelve todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda. El resultado es NULL en el lado izquierdo si no hay coincidencia.
//--La sintaxis de los RIGHT JOIN es la siguiente:
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;


//--Un ejemplo de uso de RIGHT JOIN es listar todas las ciudades y los países a los que pertenecen. La consulta SQL sería la siguiente:
SELECT pais.nombre AS pais, ciudad.nombre AS ciudad
FROM pais
RIGHT JOIN ciudad
ON pais.id = ciudad.id_pais;
