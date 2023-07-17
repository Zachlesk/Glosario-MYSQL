# Introducción al Lenguaje de Consulta Estructura (SQL)

- [¿Qué es SQL?](#¿qué-es-sql)
- [Componentes de SQL](#componentes-de-sql)
- [Sentencias de definición de datos (DDL)](#sentencias-de-definición-de-datos-ddl)
- [Sentencias de definición de datos (DML)](#sentencias-de-definición-de-datos-dml)
- [Sentencias de consulta de datos (DQL)](#sentencias-de-consulta-de-datos-dql)
- [Comandos de Administración Permisos (DCL)](#comandos-de-administración-permisos-dcl)
- [Comandos de Control de Transacciones (TCL)](#comandos-de-control-de-transacciones-tcl)

## ¿Qué es SQL?

SQL (Structured Query Language) es un lenguaje utilizado para gestionar y manipular bases de datos relacionales. Es un estándar ampliamente aceptado en el campo de la administración de datos y se utiliza en una variedad de sistemas de gestión de bases de datos (SGBD).

Las principales características de SQL son:

1. **Lenguaje declarativo**: SQL permite a los usuarios describir qué datos desean obtener o manipular, en lugar de especificar los pasos detallados para lograrlo. Esto facilita la escritura de consultas y reduce la complejidad del código.

2. **Operaciones CRUD**: SQL proporciona operaciones básicas para manipular datos: CREATE (crear), READ (leer), UPDATE (actualizar) y DELETE (eliminar). Estas operaciones permiten crear tablas, insertar registros, actualizar valores y eliminar datos de una base de datos.

3. **Consultas complejas**: SQL permite realizar consultas complejas para recuperar información específica de la base de datos utilizando cláusulas como SELECT, WHERE, JOIN, GROUP BY y ORDER BY. Esto brinda flexibilidad para obtener datos filtrados, realizar cálculos y combinar información de múltiples tablas.

4. **Mantenimiento de integridad**: SQL proporciona mecanismos para mantener la integridad de los datos en una base de datos. Puede definir restricciones, como claves primarias y foráneas, para garantizar la consistencia y coherencia de los datos almacenados.

5. **Transacciones**: SQL permite realizar operaciones en forma de transacciones, lo que asegura que todas las operaciones se completen correctamente o se deshagan en caso de fallos. Esto garantiza la integridad de los datos y mantiene la coherencia en la base de datos.

6. **Escalabilidad y portabilidad**: SQL es compatible con una amplia gama de sistemas de gestión de bases de datos, lo que brinda escalabilidad y portabilidad. Puedes migrar fácilmente bases de datos entre diferentes SGBD que sean compatibles con SQL.

## Componentes de SQL

En SQL, los componentes principales son: [Ejemplo](./Consultas.sql)

| Componente                             | Descripción                                                                                  |
| -------------------------------------- | -------------------------------------------------------------------------------------------- |
| **DDL (Data Definition Language)**     | Se utiliza para definir y gestionar la estructura de la base de datos (CREATE, ALTER, DROP). |
| **DML (Data Manipulation Language)**   | Se utiliza para manipular los datos en la base de datos (INSERT, UPDATE, DELETE).            |
| **DQL (Data Query Language)**          | Se utiliza para realizar consultas y extraer información de la base de datos (SELECT, JOIN). |
| **DCL (Data Control Language)**        | Se utiliza para administrar los permisos y la seguridad en la base de datos (GRANT, REVOKE). |
| **TCL (Transaction Control Language)** | Se utiliza para controlar las transacciones en la base de datos (COMMIT, ROLLBACK).          |

## Sentencias de Definición de Datos (DDL)

Las Sentencias de Definición de Datos (DDL) en SQL se utilizan para definir y gestionar la estructura de la base de datos. Estas sentencias permiten crear, modificar y eliminar objetos de la base de datos, como tablas, índices, vistas, procedimientos almacenados, desencadenadores y restricciones.

Algunos ejemplos de sentencias DDL comunes son:

Las Sentencias de Definición de Datos (DDL) en SQL se utilizan para definir y gestionar la estructura de la base de datos. Estas sentencias permiten crear, modificar y eliminar objetos de la base de datos, como tablas, índices, vistas, procedimientos almacenados, desencadenadores y restricciones.

Algunos ejemplos de sentencias DDL comunes son:

- `CREATE TABLE`: Se utiliza para crear una nueva tabla en la base de datos.

```sql
  CREATE TABLE usuarios (id INT, nombre VARCHAR(50), email VARCHAR(100));
```

- `ALTER TABLE`: Permite modificar la estructura de una tabla existente en la base de datos.

```sql
  ALTER TABLE usuarios ADD COLUMN telefono VARCHAR(20);
```

- `DROP TABLE`: Se utiliza para eliminar una tabla de la base de datos.

```sql
  DROP TABLE usuarios;
```

- `CREATE INDEX`: Permite crear un índice en una o varias columnas de una tabla para mejorar la velocidad de las consultas.

```sql
  CREATE INDEX idx_nombre ON usuarios (nombre);
```

- `CREATE VIEW`: Se utiliza para crear una vista, que es una representación virtual de los datos de una o varias tablas.

```sql
  CREATE VIEW vista_usuarios AS SELECT nombre, email FROM usuarios WHERE edad >= 18;
```

Las sentencias DDL son fundamentales para establecer y modificar la estructura de la base de datos, permitiendo definir las tablas, columnas, relaciones y restricciones necesarias para almacenar y organizar los datos de manera adecuada.

## Sentencias de Definición de Datos (DML)

Las Sentencias de Manipulación de Datos (DML) en SQL se utilizan para manipular los datos en la base de datos. Estas sentencias permiten agregar, modificar y eliminar registros en las tablas.

Algunos ejemplos de sentencias DML comunes son:

- `INSERT INTO`: Se utiliza para agregar nuevos registros a una tabla.

```sql
  INSERT INTO usuarios (nombre, edad) VALUES ('Juan', 25);
```

- `UPDATE`: Permite modificar los valores de uno o varios registros en una tabla.

```sql
  UPDATE usuarios SET edad = 26 WHERE nombre = 'Juan';
```

- `DELETE FROM`: Se utiliza para eliminar uno o varios registros de una tabla.

```sql
  DELETE FROM usuarios WHERE edad > 30;
```

Las sentencias DML son fundamentales para manipular y modificar los datos almacenados en la base de datos, permitiendo agregar, actualizar y eliminar información según sea necesario.

## Sentencias de Consulta de Datos (DQL)

Las Sentencias de Consulta de Datos (DQL) en SQL se utilizan para realizar consultas y extraer información de la base de datos. Estas sentencias permiten recuperar datos de una o varias tablas, aplicar filtros, ordenar los resultados y realizar operaciones de combinación de datos.

Algunos ejemplos de sentencias DQL comunes son:

- `SELECT`: Se utiliza para seleccionar columnas específicas de una o varias tablas y recuperar los datos correspondientes.

```sql
  SELECT nombre, edad FROM usuarios;
```

- `WHERE`: Permite filtrar los resultados de una consulta basado en una condición específica.

```sql
  SELECT nombre, edad FROM usuarios WHERE edad > 25;
```

- `ORDER BY`: Se utiliza para ordenar los resultados de una consulta en base a una o varias columnas.

```sql
  SELECT nombre, edad FROM usuarios ORDER BY edad DESC;
```

- `JOIN`: Permite combinar datos de varias tablas basándose en una condición de unión.

```sql
  SELECT u.nombre, p.descripcion FROM usuarios u JOIN productos p ON u.producto_id = p.id;
```

En MySQL, los operadores de comparación se utilizan para comparar valores y generar condiciones en consultas. Algunos de los operadores de comparación más comunes son:

- Igualdad: `=`

```sql
  SELECT * FROM tabla WHERE columna = valor;
```

- Desigualdad: `<>` o `!=`

```sql
  SELECT * FROM tabla WHERE columna <> valor;
```

- Mayor que: `>`

```sql
  SELECT * FROM tabla WHERE columna > valor;
```

- Menor que: `<`

```sql
  SELECT * FROM tabla WHERE columna < valor;
```

- Mayor o igual que: `>=`

```sql
  SELECT * FROM tabla WHERE columna >= valor;
```

- Menor o igual que: `<=`

```sql
  SELECT * FROM tabla WHERE columna <= valor;
```

- Comparación de patrones: `LIKE`

```sql
  SELECT * FROM tabla WHERE columna LIKE 'patron';
```

Los operadores de verdad se utilizan para combinar condiciones y generar expresiones lógicas en consultas. Algunos de los operadores de verdad más comunes son:

- AND: Combina condiciones y devuelve verdadero si ambas condiciones son verdaderas.

```sql
  SELECT * FROM tabla WHERE condicion1 AND condicion2
```

- OR: Combina condiciones y devuelve verdadero si al menos una de las condiciones es verdadera.

```sql
  SELECT * FROM tabla WHERE condicion1 OR condicion2
```

- NOT: Niega una condición y devuelve verdadero si la condición es falsa.

```sql
  SELECT * FROM tabla WHERE NOT condicion
```

Estos operadores son fundamentales para construir consultas SQL más complejas y personalizadas, permitiendo realizar comparaciones y evaluar expresiones lógicas en función de los datos almacenados en la base de datos.

Las sentencias DQL son fundamentales para recuperar información específica de la base de datos y realizar consultas personalizadas según las necesidades del usuario.

## Comandos de Administración Permisos (DCL)

Los Comandos de Administración de Permisos (DCL) en SQL se utilizan para administrar los permisos y la seguridad en la base de datos. Estos comandos permiten otorgar y revocar privilegios a los usuarios, controlando quién tiene acceso y qué operaciones pueden realizar en la base de datos.

Algunos ejemplos de comandos DCL comunes son:

- `GRANT`: Se utiliza para otorgar permisos y privilegios a los usuarios.

```sql
GRANT SELECT, INSERT ON tabla1 TO usuario1;
```

- `REVOKE`: Permite revocar permisos previamente otorgados a los usuarios.

```sql
REVOKE INSERT ON tabla1 FROM usuario1;
```

Estos comandos DCL son fundamentales para garantizar la seguridad y el control de acceso en la base de datos, asegurando que los usuarios tengan los privilegios adecuados y solo puedan realizar las operaciones autorizadas.

## Comandos de Control de Transacciones (TCL)

Los Comandos de Control de Transacciones (TCL) en SQL se utilizan para controlar las transacciones en la base de datos. Estos comandos permiten agrupar un conjunto de operaciones como una unidad lógica e indivisible, garantizando la integridad y consistencia de los datos.

Algunos ejemplos de comandos TCL comunes son:

- `BEGIN - START`: Se utiliza para iniciar una transacción.

```sql
  BEGIN TRANSACTION;
```

```sql
  START TRANSACTION;
```

- `COMMIT`: Permite confirmar una transacción y aplicar los cambios realizados.

```sql
  COMMIT;
```

- `ROLLBACK`: Permite deshacer una transacción y descartar los cambios realizados.

```sql
  ROLLBACK;
```

Estos comandos TCL son fundamentales para garantizar la integridad de los datos en una base de datos y asegurar que todas las operaciones se completen correctamente o se deshagan en caso de algún error.

- [Características](#introducción-mysql)
- [Ventajas](#ventajas-de-mysql)
- [Historia](#historia-de-mysql)


## Características de MySQL

- **Arquitectura Cliente y Servidor**: En MySQL, la arquitectura cliente-servidor implica que el cliente se conecta al servidor para realizar operaciones en la base de datos. El servidor gestiona la base de datos y procesa las solicitudes del cliente, mientras que el cliente es la interfaz a través de la cual los usuarios interactúan con la base de datos.

- **Compatibilidad con SQL**: MySQL es compatible con el lenguaje estándar de consulta estructurada (SQL), lo que facilita la migración de datos desde y hacia MySQL u otras bases de datos SQL. Puedes utilizar tus consultas y comandos SQL existentes en MySQL sin realizar cambios significativos. MySQL también ofrece herramientas de migración para facilitar la transferencia de datos desde otros sistemas a MySQL, lo que lo hace una opción conveniente para migraciones futuras.

- **Procedimientos almacenados**: Los procedimientos almacenados en MySQL son bloques de código SQL que se guardan en el servidor y se pueden invocar desde aplicaciones o directamente en la base de datos. Permiten estructurar y reutilizar código, mejorando el rendimiento y la seguridad de las operaciones. Se utilizan sentencias como CREATE PROCEDURE y CALL para su definición e invocación.

- **Desencadenantes**: Los desencadenantes en MySQL son objetos de base de datos que se ejecutan automáticamente en respuesta a eventos específicos, como la inserción, actualización o eliminación de datos en una tabla. Permiten ejecutar lógica personalizada antes o después del evento, brindando mayor control y automatización en la manipulación de datos. Son útiles para implementar reglas de negocio y mantener la integridad de los datos.

- **Transacciones**: Las transacciones en MySQL son conjuntos de operaciones que se ejecutan como una unidad indivisible, garantizando la integridad y consistencia de los datos. Permiten agrupar cambios en la base de datos, asegurando que todas las operaciones se completen con éxito o se deshagan si alguna falla. Se utilizan las sentencias BEGIN, COMMIT y ROLLBACK para controlar el inicio, confirmación o cancelación de una transacción.

## Ventajas de MySQL

MySQL ofrece ventajas como escalabilidad, alto rendimiento, flexibilidad, soporte comunitario, seguridad, replicación, disponibilidad, bajo costo y compatibilidad con otros lenguajes y herramientas. Es ampliamente utilizado debido a su rendimiento rápido, su capacidad para manejar grandes volúmenes de datos y su facilidad de integración en diferentes entornos. Además, su comunidad activa brinda soporte y recursos adicionales.

## Historia de MySQL

MySQL se originó en 1994 y se lanzó públicamente en 1995. Ha sido desarrollado por Michael Widenius y David Axmark. En 2000, MySQL AB fue fundada para brindar servicios comerciales y soporte. Sun Microsystems adquirió MySQL AB en 2008, y luego Oracle Corporation adquirió Sun en 2010. MySQL ha evolucionado con múltiples versiones, siendo MySQL 8.0 lanzado en 2019. Ha ganado popularidad por su rendimiento, escalabilidad y facilidad de uso, y es ampliamente utilizado en diferentes aplicaciones y empresas.

## Clientes de MySQL

| Nombre          | S.O                   | Licencia  | Lenguaje de Desarrollo | Descripción                                                                                         | Tutorial/Descarga                                                          |
| --------------- | --------------------- | --------- | ---------------------- | --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| MySQL Workbench | Windows, macOS, Linux | Comercial | C/C++                  | MySQL Workbench es una herramienta gráfica de administración y diseño de bases de datos MySQL.      | [Enlace al tutorial/descarga](https://www.youtube.com/watch?v=nv9GCue0YwM) |
| phpMyAdmin      | Multiplataforma       | GPL       | PHP                    | phpMyAdmin es una aplicación web de código abierto escrita en PHP.                                  | [Enlace al tutorial/descarga](https://www.youtube.com/watch?v=36ritPuyd00) |
| Navicat         | Windows, macOS, Linux | Comercial | C/C++                  | Navicat es una herramienta de administración de bases de datos con soporte para múltiples sistemas. | [Enlace al tutorial/descarga](https://www.youtube.com/watch?v=vDugMMcP5xY) |
| HeidiSQL        | Windows               | GPL       | Delphi                 | HeidiSQL es una herramienta de administración de bases de datos MySQL.                              | [Enlace al tutorial/descarga](https://www.youtube.com/watch?v=UB9oPDDlvcI) |