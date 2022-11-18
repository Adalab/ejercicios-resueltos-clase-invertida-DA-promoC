CREATE SCHEMA `leccion-3-sql` ;

 USE  `leccion-3-sql`;

CREATE TABLE Alumnas
(IDAlumna INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(15) DEFAULT NULL,
Apellido VARCHAR(30) DEFAULT NULL,
Email VARCHAR(30) DEFAULT NULL,
Telefono VARCHAR(10) DEFAULT NULL,
Direccion VARCHAR(50) DEFAULT NULL,
Ciudad VARCHAR(30) DEFAULT NULL,
Pais VARCHAR(30) DEFAULT NULL,
PRIMARY KEY (IDAlumna)
);

INSERT INTO Alumnas
VALUE (1,"Ana","González", "ana@adalab.es", "654785214", "Calle Alumna 1", "Madrid", "España"),
 (2,"Maria","López", "maria@adalab.es", "689656322", "Calle Alumna 2", "Barcelona", "España"),
 (3,"Lucía","Ramos", "lucia@adalab.es", "674459123", "Calle Alumna 3", "Valencia", "España"),
 (4,"Elena","Bueno", "elena@adalab.es", "628546577", "Calle Alumna 4", "Bilbao", "España"),
 (5,"Rocío","García", "rocio@adalab.es", "616365624", "Calle Alumna 5", "Paris", "Francia");
 



CREATE TABLE Empleadas
(IDEmpleada INT NOT NULL AUTO_INCREMENT,
Salario FLOAT DEFAULT NULL,
Nombre VARCHAR(30) DEFAULT NULL,
Apellido VARCHAR(30) DEFAULT NULL,
Pais VARCHAR(10) DEFAULT NULL,
PRIMARY KEY (IDEmpleada)
);

INSERT INTO Empleadas
VALUE (1, 2500,"Ana","González","España"),
(2, 4000, "Maria","López", "España"),
(3, 3000, "Lucía","Ramos", "España"),
(4, 5000, "Elena","Bueno", "España"),
(5, 1500, "Rocío","García", "Francia");



 
 /* Ejemplo ORDER BY*/
 SELECT *
FROM Alumnas
ORDER BY Apellido DESC;

/*Ejercicio: En la tabla Alumnas selecciona los valores que toma el atributo Ciudad para aquellas
 alumnas que son España y ordenalos por orden alfabético (según la Ciudad).*/
 
SELECT Ciudad
FROM Alumnas
WHERE Pais = 'España'
ORDER BY Ciudad;

 /* Ejemplo DISTINCT 1: Seleccionar los paises diferentes de la tabla de alumnas*/
 
 SELECT DISTINCT Pais
FROM Alumnas;

  /* Ejemplo DISTINCT 2: Seleccionar nombre y apellidos diferentes de la tabla alumnas*/
  
SELECT DISTINCT Nombre, Apellido
FROM Alumnas;


/*Ejercicio: En la tabla Alumnas selecciona los distintos valores que toma el atributo Ciudad para aquellas alumnas que son España:*/
SELECT DISTINCT Ciudad
FROM Alumnas
WHERE Pais = 'España';


  /* Ejemplo LIMIT : Obtener nombre, apellido y salario de las empleadas, ordenando por apellido en order desc y limtiando 10 resultados*/
SELECT Nombre, Apellido, Salario
FROM Empleadas
ORDER BY Apellido DESC
LIMIT 10;

/*Ejercicio: En la tabla Empleadas anterior selecciona todos los datos de las 3 empleadas que menos cobren y cuyo pais sea España:*/
SELECT *
FROM Empleadas
WHERE Pais = 'España'
ORDER BY Salario
LIMIT 3;

  /* Ejemplo TOP : Obtener nombre, apellido y salario de las empleadas, obteniendo los  10 salarios más altos y ordenando en forma descendente*/


SELECT Nombre, Apellido, Salario
FROM Empleadas
ORDER BY Salario DESC
LIMIT 10;


/*Ejercicio: En la tabla Empleadas selecciona los 2 primeros valores que toma el atributo pais
 para aquellas empleadas que son España cuando se los ordena por orden alfabético (según el nombre de las empleadas). */

 
SELECT  Pais
FROM Empleadas
WHERE Pais = 'España'
ORDER BY Nombre
LIMIT 2;

/* EJEMPLO OFFSET: Obtener las 10 empleadas que cobran más, descartando las 3 primeras*/
SELECT Nombre, Apellido, Salario
FROM Empleadas
ORDER BY Salario DESC
LIMIT 10
OFFSET 3;

/*Ejercicio: En la tabla Empleadas selecciona el Nombre y Apellido de la 2ª empleada que más cobre en España.*/
SELECT Nombre, Apellido
FROM Empleadas 
WHERE Pais = 'España'
ORDER BY Salario DESC
LIMIT 1
OFFSET 1;


/* EJEMPLO BETWEEN: Obtener nombre y apellido de las alimas cuyo ID alumna se encuentre entr 3 y 5*/
SELECT Nombre, Apellido
FROM Alumnas
WHERE IDAlumna BETWEEN 3 AND 5;

/*Ejercicio: Utilizando el ejemplo de la tabla Empleadas, selecciona los atributos
 Nombre y Apellido para aquellas empleadas de España que tengan un Salario entre 1000 y 3000 €.*/
SELECT Nombre, Apellido
FROM Empleadas WHERE Pais = 'España' 
AND Salario BETWEEN 1000 AND 3000;


/* EJEMPLO IN: Obtener nombre y apellido de las alumnas que vivan en Madrid, Valencia o Barcelona*/
SELECT Nombre, Apellido 
FROM Alumnas 
WHERE Ciudad IN ('Madrid', 'Valencia', 'Barcelona');

/*Ejercicio: Utilizando el ejemplo de la tabla Empleadas, selecciona Apellido y Salario de aquellas empleadas que vivan en España o Alemania.*/
SELECT Apellido, Salario
FROM Empleadas WHERE Pais IN ('España', 'Alemania');


/* EJEMPLO IN: Obtener nombre y apellido de las alumnas que vivan en Madrid, Valencia o Barcelona*/

SELECT Nombre AS Name, Apellido AS Surname
FROM Alumnas AS Students;

/*Ejercicio: Utilizando el ejemplo de la tabla Empleadas, selecciona Apellido y Salario de aquellas empleadas
 que vivan en España y renombra las columnas resultado a Alumna y Sueldo respectivamente.*/
 
SELECT Apellido AS Alumna, Salario AS Sueldo
FROM Empleadas
WHERE Pais = 'España';

