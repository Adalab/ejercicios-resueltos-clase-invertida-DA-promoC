CREATE SCHEMA `leccion-13-sql` ;

USE `leccion-13-sql`;


CREATE TABLE Empleadas
(IDEmpleada INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(30) DEFAULT NULL,
Apellido VARCHAR(30) DEFAULT NULL,
Pais VARCHAR(10) DEFAULT NULL,
PRIMARY KEY (IDEmpleada)
);



/*Ejemplo: Añade a la tabla "Empleadas" una columna llamada "Salario" que contenga un número con decimales.*/


ALTER TABLE Empleadas
ADD COLUMN Salario FLOAT ;


-- Ejercicio: Cambia el tipo de datos de la columna "Salario" de la tabla "Empleadas" de tipo FLOAT a un número entero.

ALTER TABLE Empleadas
MODIFY COLUMN Salario INTEGER;

-- Ejercicio: Sobre la tabla Empleadas anterior añade la restricción de que el valor de salario no pueda estar vacío para nuevos registros.

ALTER TABLE Empleadas
MODIFY Salario FLOAT NOT NULL;


/*Ejemplo: Añade una restricción o restricciones a la columna "DNI" de la tabla "Empleadas" para que sea un atributo que no pueda repetirse ni dejarse vacío al introducir un nuevo registro en la base de datos.*/


CREATE TABLE Empleada2
(Nombre VARCHAR(30) DEFAULT NULL,
Apellido VARCHAR(30) DEFAULT NULL,
Pais VARCHAR(10) DEFAULT NULL
);

ALTER TABLE Empleada2
ADD COLUMN DNI VARCHAR(30) ;


/*Opcion A: Convertirlo en clave primaria*/

ALTER TABLE Empleada2
ADD CONSTRAINT PRIMARY KEY (DNI);

-- Opción B: Imponer restricciones UNIQUE y NOT NULL:

ALTER TABLE Empleada2 ADD CONSTRAINT UNIQUE (DNI);

ALTER TABLE Empleada2 MODIFY DNI  CHAR NOT NULL;



-- Ejemplo: Usa DROP para eliminar una tabla llamada tabla1:

DROP TABLE tabla1;

-- Ejemplo: Usa DROP para eliminar la tabla1 sólo si esta existe::

DROP TABLE IF EXISTS tabla1;   

-- Ejemplo: Elimina tres tablas (tabla1, tabla2 y tabla3) usando una única sentencia DROP:

DROP TABLE IF EXISTS tabla1, tabla2, tabla3;


/* EJERCICIOS FINALES */

DROP TABLE t1, t2;

CREATE TABLE t1 (a INTEGER, b CHAR(10));

/*EJERCICIO 1
Renombra la tabla t1 a t2:*/

ALTER TABLE t1 RENAME t2;


/*EJERCICIO 2
Cambia la columna a de tipo INTEGER a tipo TINYINT NOT NULL (manteniendo el mismo nombre para la columna):*/

ALTER TABLE t2 MODIFY a TINYINT NOT NULL;

/*EJERCICIO 3
Cambia la columna b de tipo CHAR de 10 caracteres a CHAR de 20 caracteres. Ya que estamos renombra la columna como c:*/

ALTER TABLE t2 CHANGE b c CHAR(20);

/*EJERCICIO 4
Añade una nueva columna llamada d de tipo TIMESTAMP:*/

ALTER TABLE t2 ADD d TIMESTAMP;

/*EJERCICIO 5
Añade una columna INDEX llamada d y una clausula UNIQUE a la columna A:*/

ALTER TABLE t2 ADD INDEX (d), ADD UNIQUE (a);

/*EJERCICIO 6
Elimina la columna c que definiste en el ejercicio 3:*/

ALTER TABLE t2 DROP COLUMN c;

/*EJERCICIO 7
Crea una tabla llamada t3 idéntica a la tabla t2 (de manera automática, no definiéndola columna a columna):*/

CREATE TABLE t3 LIKE t2;

/*EJERCICIO 8
Elimina la tabla original t2 y en otra sentencia renombra la tabla t3 como t1.*/

DROP TABLE t2;
ALTER TABLE t3 RENAME t1;
