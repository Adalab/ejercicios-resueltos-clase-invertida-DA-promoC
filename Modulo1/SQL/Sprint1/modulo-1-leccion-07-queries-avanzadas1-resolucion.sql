CREATE SCHEMA `leccion-4-sql` ;
USE  `leccion-4-sql`;

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
 
 
 
 /*EJEMPLO Min*/
 
SELECT MIN(IDAlumna) AS IDMenor
FROM Alumnas;
 
/*Ejercicio: Selecciona el número de ID más alto de la tabla Alumnas y asignale un alias que sea explicativo.*/

SELECT MAX(IDAlumna) AS IDMayor
FROM Alumnas;


/*Ejercicio: Selecciona el último nombre de alumna si ordenasemos la columna en orden alfabético.*/

SELECT MAX(Nombre)
FROM Alumnas;


  /*EJEMPLO SUM : Calcular el salario total de la tabla Empleadas, con alias TotalSalarios*/
  
  SELECT SUM(Salario) AS TotalSalarios
FROM Empleadas;

 /*EJEMPLO AVG Calcular el salario medio de la tabla Empleadas con alias SalarioMedio*/
SELECT AVG(Salario) AS SalarioMedio
FROM Empleadas;

 /*EJEMPLO COUNT Mostar cuantas empleadas tienen un salario por encima de los 3000 euros */
 SELECT COUNT(Salario) AS SalariosAltos
FROM Empleadas
WHERE Salario >= 3000;


/*Ejercicios finales*/

USE tienda;

/*EJERCICIO 1
Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.*/

SELECT MIN(customerNumber) AS NumeroMinimo
FROM customers;

/*EJERCICIO 2
Selecciona el limite de credito medio para los clientes de España(Spain):*/

SELECT AVG(creditLimit)
FROM customers
WHERE country = 'Spain';

/*EJERCICIO 3
Selecciona el numero de clientes en Francia(France):*/

SELECT COUNT(customerName)
FROM customers
WHERE country = 'France';

/*EJERCICIO 4
Selecciona el máximo de credito que tiene cualquiera de los clientes del empleado con número 1323:*/

SELECT MAX(creditLimit)
FROM customers
WHERE salesRepEmployeeNumber = 1323;

/*EJERCICIO 5
¿Cuál es el número máximo de empleado de la tabla Customers?*/

SELECT MAX(salesRepEmployeeNumber)
FROM customers;



SELECT *
FROM customers;