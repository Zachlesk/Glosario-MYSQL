
//-- Ejemplo 1: Crear un procedimiento almacenado que lista las ciudades de un país por nombre
DELIMITER $$
//-- Crea el procedimiento almacenado llamado "listar_ciudades_nom_pais"
CREATE PROCEDURE listar_ciudades_nom_pais(IN nom_pais VARCHAR(50))
BEGIN
    //-- Sentencia SQL para obtener las ciudades del país especificado
    SELECT C.nombre
    FROM país AS P
    INNER JOIN ciudad AS C ON P.id = C.id_pais
    WHERE P.nombre = nom_pais;
END
$$
DELIMITER ;

//-- Ejemplo 2: Crear un procedimiento almacenado que cuenta la cantidad de ciudades de un país
DELIMITER $$
//-- Crea el procedimiento almacenado llamado "contar_ciudades_nom_pais"
CREATE PROCEDURE contar_ciudades_nom_pais(IN nom_pais VARCHAR(50), OUT total INT UNSIGNED)
BEGIN
    //-- Consulta SQL para contar las ciudades del país especificado
    SELECT COUNT(*) INTO total
    FROM país AS P
    INNER JOIN ciudad AS C ON P.id = C.id_pais
    WHERE P.nombre = nom_pais;
END
$$
DELIMITER ;

//-- Llamadas a los procedimientos almacenados

//-- Ejemplo de llamada al procedimiento "listar_ciudades_nom_pais"
DELIMITER ;
//-- Llama al procedimiento "listar_ciudades_nom_pais" pasando el parámetro "Colombia"
CALL listar_ciudades_nom_pais('Colombia');
//-- Restaura el delimitador de comandos a ";"
DELIMITER ;

//-- Ejemplo de llamada al procedimiento "contar_ciudades_nom_pais"
DELIMITER ;
//-- Llama al procedimiento "contar_ciudades_nom_pais" pasando el parámetro "Colombia" y muestra el resultado usando una variable de usuario
CALL contar_ciudades_nom_pais('Colombia', @total);
//-- Muestra el valor almacenado en la variable de usuario "@total"
SELECT @total;
//-- Restaura el delimitador de comandos a ";"
DELIMITER ;

//-- Estructuras de control

//-- Ejemplo de estructura IF-THEN-ELSE
DELIMITER $$
//-- Procedimiento almacenado que verifica si existen idiomas que no se hablan en ningún país
CREATE PROCEDURE verificar_idiomas_sin_pais()
BEGIN
    DECLARE num_idiomas_sin_pais INT;
    
    //-- Contar el número de idiomas que no se hablan en ningún país
    SELECT COUNT(*) INTO num_idiomas_sin_pais
    FROM idioma
    WHERE id NOT IN (SELECT id_idioma FROM idioma_pais);
    
    //-- Verificar si hay o no hay idiomas sin país y mostrar el resultado
    IF num_idiomas_sin_pais > 0 THEN
        //-- Si hay idiomas sin país, mostrar el mensaje correspondiente
        SELECT CONCAT('Existen ', num_idiomas_sin_pais, ' idiomas que no se hablan en ningún país.') AS mensaje;
    ELSE
        //-- Si no hay idiomas sin país, mostrar otro mensaje
        SELECT 'No hay idiomas que no se hablen en ningún país.' AS mensaje;
    END IF;
END
$$
DELIMITER ;

//-- Ejemplo de estructura CASE
DELIMITER $$
//-- Procedimiento almacenado que muestra información de una ciudad según su ID
CREATE PROCEDURE obtener_info_ciudad(IN ciudad_id INT)
BEGIN
    DECLARE ciudad_nombre VARCHAR(20);
    DECLARE pais_nombre VARCHAR(20);
    DECLARE continente_nombre VARCHAR(50);
    DECLARE poblacion INT;
    DECLARE info VARCHAR(100);
    
    //-- Obtener información de la ciudad y su país usando la estructura CASE
    SELECT C.nombre, P.nombre, P.continente, P.poblacion
    INTO ciudad_nombre, pais_nombre, continente_nombre, poblacion
    FROM ciudad AS C
    INNER JOIN pais AS P ON C.id_pais = P.id
    WHERE C.id = ciudad_id;
    
    //-- Construir el mensaje de información usando la estructura CASE
    SET info = CASE
        WHEN poblacion > 1000000 THEN CONCAT(ciudad_nombre, ' es una gran ciudad en ', continente_nombre, '.')
        WHEN poblacion > 500000 THEN CONCAT(ciudad_nombre, ' es una ciudad de tamaño mediano en ', continente_nombre, '.')
        ELSE CONCAT(ciudad_nombre, ' es una pequeña ciudad en ', continente_nombre, '.')
    END;
    
    //-- Mostrar la información
    SELECT CONCAT('La ciudad de ', ciudad_nombre, ' se encuentra en el país de ', pais_nombre, '. ', info) AS información;
END
$$
DELIMITER ;

//-- Estructuras repetitivas

//-- Ejemplo de bucle LOOP
DELIMITER $$
//-- Procedimiento almacenado que utiliza un bucle LOOP para incrementar un contador hasta que se cumpla una condición
CREATE PROCEDURE cicloloop(p1 INT, OUT x INT)
BEGIN
    label1: LOOP
       SET p1 = p1 + 1;

       IF p1 < 10 THEN
          ITERATE label1;
       END IF;

       LEAVE label1;
    END LOOP label1;

    SET x = p1;
END
$$
DELIMITER ;

//-- Ejemplo de bucle REPEAT
DELIMITER $$
//-- Procedimiento almacenado que utiliza un bucle REPEAT para calcular la suma de los números del 1 al valor especificado por el parámetro "tope"
CREATE PROCEDURE ejemplo_bucle_repeat(IN tope INT, OUT suma INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    SET suma = 0;

    REPEAT
        SET suma = suma + contador;
        SET contador = contador + 1;
    UNTIL contador > tope;
END
$$
DELIMITER ;

//-- Ejemplo de bucle WHILE
DELIMITER $$
//-- Procedimiento almacenado que utiliza un bucle WHILE para calcular la suma de los números del 1 al valor especificado por el parámetro "tope"
CREATE PROCEDURE ejemplo_bucle_while(IN tope INT, OUT suma INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    SET suma = 0;

    WHILE contador <= tope DO
        SET suma = suma + contador;
        SET contador = contador + 1;
    END WHILE;
END
$$
DELIMITER ;
CALL ejemplo_bucle_while(10, @resultado);
SELECT @resultado;

//-- Cambia el delimitador de comandos a "$$" en lugar de ";"
DELIMITER $$

//-- Crea el trigger "before_insert_employee"
CREATE TRIGGER before_insert_employee
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    //-- Acción: Establecer la fecha y hora actual como fecha de creación
    SET NEW.creation_date = NOW();
    //-- Acción: Establecer la fecha y hora actual como fecha de actualización
    SET NEW.updated_date = NOW();
    //-- Acción: Establecer el estado como "Activo"
    SET NEW.status = 'Activo';
END$$

//-- Restaura el delimitador de comandos a ";" por defecto
DELIMITER ;

//-- DELIMITER $$: Cambia el delimitador de comandos a "$$" en lugar del punto y coma ";" para permitir la definición del trigger como un bloque de código independiente.

//-- CREATE TRIGGER before_insert_employee: Crea el trigger llamado "before_insert_employee".

//-- BEFORE INSERT ON employees: Especifica que el trigger se activa antes de cada inserción en la tabla "employees".

//-- FOR EACH ROW: Indica que el trigger se ejecuta para cada fila afectada por la operación de inserción.

//-- BEGIN: Indica el inicio del bloque de código del trigger.

//-- SET NEW.creation_date = NOW();: Establece la columna "creation_date" de la nueva fila que se va a insertar con la fecha y hora actuales utilizando la función NOW().

//-- SET NEW.updated_date = NOW();: Establece la columna "updated_date" de la nueva fila que se va a insertar con la fecha y hora actuales utilizando la función NOW().

//-- SET NEW.status = 'Activo';: Establece la columna "status" de la nueva fila que se va a insertar con el valor "Activo".

//-- END$$: Indica el final del bloque de código del trigger.

//-- DELIMITER ;: Restaura el delimitador de comandos a ";" por defecto.


-- Cambia el delimitador de comandos a "$$" en lugar de ";"
DELIMITER $$

-- Creación del trigger "BEFORE INSERT clientes_BI_TRIGGER"
CREATE TRIGGER clientes_BI_TRIGGER
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
    -- Acción: Verificar si el valor de la nota es negativo y establecerlo en 0
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0; -- Establece el valor de la nota en 0
    END IF;

    -- Acción: Verificar si el valor de la nota es mayor que 50 y establecerlo en 50
    IF NEW.nota > 50 THEN
        SET NEW.nota = 50; -- Establece el valor de la nota en 50
    END IF;
END$$


//-- Before INSERT
DELIMITER $$: Se cambia el delimitador de comandos a "$$" en lugar del punto y coma ";" para permitir la definición del trigger como un bloque de código independiente.

CREATE TRIGGER clientes_BI_TRIGGER: Se crea el trigger llamado "clientes_BI_TRIGGER".

BEFORE INSERT ON clientes: Se especifica que el trigger se activará antes de cada inserción en la tabla "clientes".

FOR EACH ROW: Indica que el trigger se ejecutará una vez por cada fila afectada por la operación de inserción.

BEGIN: Marca el inicio del bloque de código que se ejecutará cuando se active el trigger.

IF NEW.nota < 0 THEN: Se verifica si el valor de la columna "nota" en la nueva fila que se va a insertar es menor que 0.

SET NEW.nota = 0;: Si el valor de la columna "nota" es menor que 0, se establece el valor de "nota" en 0.

END IF;: Marca el final de la estructura condicional "IF".

IF NEW.nota > 50 THEN: Se verifica si el valor de la columna "nota" en la nueva fila que se va a insertar es mayor que 50.

SET NEW.nota = 50;: Si el valor de la columna "nota" es mayor que 50, se establece el valor de "nota" en 50.

END IF;: Marca el final de la estructura condicional "IF".

END$$: Indica el final del bloque de código del trigger.

DELIMITER ;: Se restaura el delimitador de comandos a ";" por defecto.

Argumentación:

Este trigger "BEFORE INSERT clientes_BI_TRIGGER" se ejecuta antes de cada inserción en la tabla "clientes" y tiene dos acciones específicas:

Acción: Verificar si el valor de la columna "nota" en la nueva fila es negativo y establecerlo en 0.

Si el valor de "nota" en la nueva fila es menor que 0, se establece el valor de "nota" en 0 para asegurarse de que no haya valores negativos en la columna "nota".
Acción: Verificar si el valor de la columna "nota" en la nueva fila es mayor que 50 y establecerlo en 50.

Si el valor de "nota" en la nueva fila es mayor que 50, se establece el valor de "nota" en 50 para asegurarse de que no haya valores superiores a 50 en la columna "nota".
Estas acciones garantizan que los valores de la columna "nota" estén dentro del rango válido (0 a 50) antes de realizar la inserción en la tabla "clientes".

.........



 //--Límites de uso :
/*El rendimiento de un SGBD puede disminuir cuando hay un aumento en el volumen de peticiones al servidor, la cantidad de usuarios conectados y la ejecución de consultas complejas. Para solucionar este problema, se pueden establecer límites en las peticiones que los usuarios realizan al servidor. Estos límites se definen mediante tres parámetros:

Máximo número de conexiones por hora.
Máximo número de consultas por hora.
Máximo número de actualizaciones por hora.
Aquí se muestra la sintaxis del comando para establecer estos límites para un usuario:*/

sql
Copy code
GRANT USAGE ON *.* TO 'usuario'@'localhost'
  WITH MAX_CONNECTIONS_PER_HOUR <cantidad>
       MAX_QUERIES_PER_HOUR <cantidad>
       MAX_UPDATES_PER_HOUR <cantidad>;
Donde:

'usuario'@'localhost' es el nombre de usuario y la ubicación desde donde se realiza la conexión. Puedes ajustar esto según tus necesidades.
<cantidad> es el número máximo permitido de conexiones, consultas y actualizaciones por hora que deseas establecer para el usuario.
Ejemplo 1:
Si deseas limitar el usuario 'campus'@'localhost' a 100 conexiones por hora, 500 consultas por hora y 200 actualizaciones por hora, el comando sería:

sql
Copy code
GRANT USAGE ON *.* TO 'campus'@'localhost'
  WITH MAX_CONNECTIONS_PER_HOUR 100
       MAX_QUERIES_PER_HOUR 500
       MAX_UPDATES_PER_HOUR 200;
6.4.10. Eliminar privilegios
Para eliminar los privilegios que se han otorgado a un usuario con el comando GRANT, se utiliza el comando REVOKE. La sintaxis del comando REVOKE es la siguiente:

css
Copy code
REVOKE [tipo_privilegio [, ...]] ON objeto
    FROM usuario [, ...];
Donde:

[tipo_privilegio [, ...]] hace referencia a los tipos de privilegios que se desean revocar. Puede ser uno o varios, separados por comas. Si se omite, se revocarán todos los privilegios.
objeto se refiere al objeto de la base de datos al que se aplicará la revocación. Puede ser una tabla, una vista, una base de datos, etc. Si se utiliza ., se aplicará a todos los objetos de todas las bases de datos.
usuario [, ...] son los nombres de usuario a los que se les revocarán los privilegios. Puede ser uno o varios, separados por comas.
Ejemplo 1:
El comando SQL:

sql
Copy code
REVOKE SELECT, INSERT ON idioma
    FROM user1, user2;
Este comando revocaría los privilegios de SELECT e INSERT en la tabla "idioma" para los usuarios "user1" y "user2".

Ejemplo 2:
El comando SQL:

sql
Copy code
REVOKE ALL ON *.*
    FROM visitante@localhost;
Este comando revocaría todos los privilegios de todas las tablas y bases de datos al usuario "visitante". Hay que tener en cuenta que solo revocaría los privilegios cuando este usuario se conecta desde localhost. Si el usuario "visitante" tiene permisos para conectarse desde otro dominio, sus privilegios seguirían intactos después de ejecutar el comando anterior.

6.4.11. Eliminar Usuarios
Para eliminar un usuario, se utiliza el comando DROP USER. La sintaxis del comando es la siguiente:

sql
Copy code
DROP USER [IF EXISTS] usuario [, usuario2, ...];
Donde:

usuario es el nombre del usuario que se desea eliminar.
IF EXISTS es una cláusula opcional que indica que el comando debe ejecutarse solo si el usuario existe.

Ejemplo 1:
Si se quiere eliminar el usuario "visitante", se ejecuta el siguiente comando:
DROP USER IF EXISTS visitante;

 