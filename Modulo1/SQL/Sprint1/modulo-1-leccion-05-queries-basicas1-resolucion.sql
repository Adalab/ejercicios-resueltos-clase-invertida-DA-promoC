CREATE SCHEMA `leccion-2-sql` ;

 
 USE  `leccion-2-sql`;

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

 
 /*EJEMPLO Consulta SELECT : Extraer el nombre  de las alumnas*/
 
SELECT Nombre
FROM Alumnas;

 /*EJEMPLO Consulta SELECT : Extraer el nombre y apellido de las alumnas*/
 
SELECT Nombre, Apellido
FROM Alumnas;

 /*EJEMPLO Consulta SELECT : Extraer toda la info de la tabla alumnas*/
SELECT *
FROM Alumnas;


/*Ejercicio: Realiza una consulta SELECT que obtenga los atributos
 Nombre, Telefono y Direccion de todas las alumnas de la tabla Alumnas.*/

SELECT Nombre, Telefono, Direccion
FROM Alumnas;

 /*EJEMPLO Consulta WHERE : Extraer el nombre, apellido de las alumnas donde el pais sea Francia*/
/* Esto es un comentario en SQL */
SELECT Nombre, Apellido
FROM Alumnas
WHERE Pais = 'Francia';

/*Ejercicio: Realiza una consulta que obtenga los atributos Telefono y Direccion
 de aquellas alumnas de la tabla Alumnas que se llamen Elena.*/

SELECT Telefono, Direccion
FROM Alumnas
WHERE Nombre = 'Elena';


 /*EJEMPLO Consulta WHERE con AND : Extraer el telefono y direccionde las alumnas donde el pais sea España y el apellido Garcia */
SELECT Telefono, Direccion
FROM Alumnas
WHERE Pais = 'España'
AND Apellido = 'Garcia';

 /*EJEMPLO Consulta WHERE con AND : Extraer el telefono y direccionde las alumnas donde el pais sea España o el apellido Garcia */
 
 SELECT Telefono, Direccion
 FROM Alumnas
 WHERE Pais = 'España'
 OR Apellido = 'Garcia';
 
  /*EJEMPLO ConsultaNOT : Extraer el telefono y direccionde las alumnas donde el pais no sea España */
 SELECT Telefono, Direccion
FROM Alumnas
WHERE NOT Pais = 'España';

/*Ejercicio: Realiza una consulta que obtenga los atributos Email y Nombre de aquellas alumnas de la tabla Alumnas que sean de España o de Francia:*/

SELECT Email, Nombre
FROM Alumnas
WHERE Pais = 'España' OR Pais = 'Francia';

/*Ejercicio: Realiza una consulta que obtenga los atributos Email y Nombre de aquellas alumnas de la tabla Alumnas que no se apelliden Bueno:*/

SELECT Email, Nombre
FROM Alumnas
WHERE NOT Apellido = 'Bueno';


/*Ejemplos ejercicios de comparacion*/

/*Seleccionar Nombre y Apellido de las alumnas cuyo Email sea ana@adalab.es*/
SELECT Nombre, Apellido
FROM Alumnas
WHERE Email = 'ana@adalab.es';


/*Seleccionar Ciudad y Pais de las alumnas cuyo telefono sea distinto a 674459123:*/
SELECT Ciudad, Pais
FROM Alumnas
WHERE Telefono <> 674459123;


/*Ejercicio: Selecciona todos los atributos de las alumnas cuyo IDAlumna sea mayor o igual que 3:*/

SELECT *
FROM Alumnas
WHERE IDAlumna >= 3;

/*Ejercicio: Selecciona todos los atributos de las alumnas cuyo IDAlumna sea menor o igual que 4 y que sean de Madrid:*/

SELECT *
FROM Alumnas
WHERE IDAlumna <= 4
 AND Ciudad = 'Madrid';
 
 
 /*EJEMPLO IS NULL*/
 
 SELECT Nombre, Apellido, Email
FROM Alumnas
WHERE Ciudad IS NULL;

/*EJEMPLO NOT NULL*/

SELECT Nombre, Apellido, Email
FROM Alumnas
WHERE Ciudad IS NOT NULL;


/*Ejercicio: Selecciona Nombre y Apellido para aquellos registros de la tabla Alumnas
 que no tengan valor guardado para el atributo Telefono:*/

SELECT Nombre, Apellido
FROM Alumnas
WHERE Telefono IS NULL;

/*ENUNCIADO EJERCICIOS*/

USE tienda;
/* Utilizaremos la tabla customers*/

/* EJERCICIO 1
Realiza una consulta SELECT que obtenga los nombres, teléfonos y direcciones
 de todas las empresas cliente de la tabla customers.*/

SELECT customerName, phone, addressLine1     
FROM customers; 

/*EJERCICIO 2
Realiza una consulta que obtenga los teléfonos y direcciones de aquellas empresas
 de la tabla customers que se encuentren en USA (es su país).*/

SELECT phone, addressLine1     
FROM customers
WHERE country = "USA";  

/*EJERCICIO 3
Realiza una consulta que obtenga los nombre y apellidos de las personas de contacto
 en cada empresa que no tenga segunda linea de dirección.*/

SELECT contactFirstName, contactLastName   
FROM customers
WHERE addressLine2 IS NULL; 

/*EJERCICIO 4
Busca aquellos registros de la tabla Customers que tengan un valor guardado para el campo state.
 Este atributo solo es valido para USA por lo que habrá varias entradas con valor NULL.*/
 
SELECT *   
FROM customers
WHERE state IS NOT NULL;   

/*EJERCICIO 5
Buscar aquellos registros de la tabla Customers que correspondan a clientes de USA
 pero que no tengan un valor guardado para el campo state.*/
 
SELECT *     
FROM customers
WHERE country = "USA" AND state IS NULL;  

/*EJERCICIO 6
Selecciona el país (country) correspondiente a los registros de 
clientes con un límite de crédito (creditLimit) mayor que 10000 $.*/
SELECT country     
FROM customers
WHERE creditLimit > 10000; 
