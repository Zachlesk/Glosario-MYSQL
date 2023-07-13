# BASES DE DATOS RELACIONALES - INTERMEDIO

- [Creación Tablas](#creación-de-tablas)
- [Revisar la Estructura de una Tabla](#revisar-la-estructura-de-una-tabla)
- [Relaciones entre Tablas](#relaciones-entre-tablas)
- [Campos y Alias en MySQL](#campos-y-alias-en-mysql)

## Creación de Tablas

Para crear una tabla en MySQL, se utilizan los siguientes pasos:

1. **Decidir la estructura de la tabla**: Antes de crear la tabla, debes determinar qué columnas o campos necesitas y el tipo de datos que contendrán. Por ejemplo, si quieres crear una tabla de usuarios, puedes tener columnas como id, nombre, email y edad.

2. **Escribir el comando CREATE TABLE**: Utilizando el comando CREATE TABLE, puedes crear una nueva tabla en la base de datos. El comando tiene la siguiente estructura básica:

```sql
CREATE TABLE nombre_tabla (
    columna1 tipo_dato,
    columna2 tipo_dato,
...
);
```

3. **Definir los tipos de datos y restricciones**: Para cada columna de la tabla, debes especificar el tipo de dato que contendrá. MySQL ofrece una variedad de tipos de datos.

| Tipo de Dato | Descripción                                                   | Ejemplo               |
| ------------ | ------------------------------------------------------------- | --------------------- |
| INT          | Número entero con signo.                                      | 10                    |
| FLOAT        | Número de coma flotante.                                      | 3.14                  |
| DOUBLE       | Número de coma flotante de doble precisión.                   | 3.141592653589793     |
| DECIMAL      | Número decimal de precisión fija.                             | 10.99                 |
| VARCHAR      | Cadena de texto variable con longitud máxima especificada.    | "Hola"                |
| CHAR         | Cadena de texto de longitud fija.                             | "OpenAI"              |
| TEXT         | Texto de longitud variable.                                   | "Lorem ipsum..."      |
| DATE         | Fecha en formato 'YYYY-MM-DD'.                                | "2022-01-01"          |
| TIME         | Hora en formato 'HH:MM:SS'.                                   | "12:30:45"            |
| DATETIME     | Combinación de fecha y hora en formato 'YYYY-MM-DD HH:MM:SS'. | "2022-01-01 12:30:45" |
| TIMESTAMP    | Marca de tiempo indicando fecha y hora del evento.            | 1641101445            |
| BOOLEAN      | Valor booleano, puede ser TRUE o FALSE.                       | TRUE                  |
| BLOB         | Datos binarios de longitud variable.                          | (binary data)         |
| BIT          | Valor binario de longitud fija.                               | b'1010'               |
| ENUM         | Valor de una lista predefinida de opciones.                   | "Rojo"                |
| SET          | Conjunto de valores seleccionables.                           | "Manzana, Naranja"    |

También puedes agregar restricciones, como PRIMARY KEY para indicar una clave primaria única o NOT NULL para evitar valores nulos en una columna.

4. **Ejecutar el comando**: Una vez que hayas escrito el comando CREATE TABLE con las columnas y restricciones adecuadas, puedes ejecutarlo en MySQL para crear la tabla. Puedes utilizar herramientas como la línea de comandos de MySQL, una interfaz gráfica o lenguajes de programación que interactúan con la base de datos.

```sql
CREATE TABLE usuarios (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    PRIMARY KEY (id)
);
```

## Revisar la Estructura de una Tabla

El comando para describir una tabla en MySQL es DESCRIBE o DESC. Estos comandos te permiten ver la estructura y los detalles de una tabla existente en la base de datos.

La sintaxis básica del comando DESCRIBE es la siguiente:

```sql
DESCRIBE nombre_tabla;
```

Para describir la tabla de usuario el comando seria el siguiente:

```sql
DESCRIBE usuarios;
```

El comando DESCRIBE en MySQL muestra información detallada sobre la estructura de una tabla, incluyendo nombre, tipo de dato, longitud, nulabilidad y restricciones. Es útil para obtener rápidamente propiedades y características de una tabla sin revisar su definición completa. Es específico de MySQL y ampliamente utilizado para describir tablas de forma rápida y sencilla.

## Relaciones entre Tablas

Para relacionar tablas en MySQL, se utiliza el concepto de claves primarias y claves externas:

1. **Clave Primaria (PRIMARY KEY)**: Es un campo o conjunto de campos que identifica de forma única cada registro en una tabla. Se utiliza el comando PRIMARY KEY al definir una columna como clave primaria. Por ejemplo:

```sql
CREATE TABLE usuarios (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    PRIMARY KEY (id)
);
```

2. **Clave Externa (FOREIGN KEY)**: Es un campo o conjunto de campos en una tabla que establece una relación con la clave primaria de otra tabla. Se utiliza el comando FOREIGN KEY al definir una columna como clave externa. Por ejemplo, si tienes una tabla productos y deseas relacionarla con la tabla usuarios, puedes hacerlo de la siguiente manera:

```sql
CREATE TABLE productos (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  usuario_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
```

La columna usuario_id en la tabla productos se define como clave externa haciendo referencia a la clave primaria id en la tabla usuarios. Esto asegura la integridad referencial de los datos relacionados. En MySQL, se relacionan tablas utilizando claves primarias y externas, asegurando que las claves tengan el mismo tipo de dato y tamaño para establecer una relación adecuada.

## Campos y Alias en MySQL

- **Campos**: Los campos se refieren a las columnas de una tabla. Al realizar consultas, puedes seleccionar los campos específicos que deseas recuperar utilizando la cláusula SELECT. Por ejemplo:

```sql
SELECT campo1, campo2, campo3 FROM tabla;
```

- **Alias**: Un alias es un nombre alternativo que se le da a un campo o tabla en una consulta. Puedes utilizar alias para dar nombres más descriptivos o para abreviar los nombres de los campos o tablas largos. Se utiliza la palabra clave AS para asignar un alias a un campo o tabla. Por ejemplo:

```sql
SELECT campo1 AS alias1, campo2 AS alias2 FROM tabla AS t;
```

En este caso, los campos `campo1` y `campo2` se seleccionan y se les asignan los alias `alias1` y `alias2`, respectivamente. También se utiliza un alias para la tabla tabla llamándola `t`.

El uso de campos y alias en MySQL te permite seleccionar los datos específicos que necesitas y asignar nombres más significativos en tus consultas. Esto facilita la comprensión de los resultados y mejora la legibilidad del código.