CREATE SCHEMA `leccion-14-sql` ;

USE `leccion-14-sql`;


CREATE TABLE Empleadas
(IDEmpleada INT NOT NULL AUTO_INCREMENT,
Salario FLOAT DEFAULT NULL,
Nombre VARCHAR(30) DEFAULT NULL,
Apellido VARCHAR(30) DEFAULT NULL,
Email VARCHAR(30) DEFAULT NULL,
Telefono VARCHAR(10) DEFAULT NULL,
Ciudad VARCHAR(30) DEFAULT NULL,
Pais VARCHAR(10) DEFAULT NULL,
PRIMARY KEY (IDEmpleada)
);


INSERT INTO Empleadas
VALUE (1,2500,"Ana","González", "ana@adalab.es", "654785214", "Madrid", "España"),
 (2,4000,"Maria","López", "maria@adalab.es", "689656322", "Barcelona", "España"),
 (3,3000,"Lucía","Ramos", "lucia@adalab.es", "674459123", "Valencia", "España"),
 (4,5000,"Elena","Bueno", "elena@adalab.es", "628546577",  "Bilbao", "España"),
 (5,1500,"Rocío","García", "rocio@adalab.es", "616365624",  "Paris", "Francia");
 
 
  /*  INSERT */
 /* EJEMPLO INSERT */
 
 INSERT INTO Empleadas (Salario, Nombre, Apellido, Email, Telefono, Ciudad, Pais)
VALUES (2000, 'Inés', 'Romero', 'ines@adalab.es', '619739261', 'Sevilla', 'España');

/* EJEMPLO INSERT CON NULLS*/


INSERT INTO Empleadas (Salario, Nombre, Apellido, Email, Pais)
VALUES (2200, 'Alba', 'Fernández', 'alba@adalab.es', 'Portugal');


/*EJEMPLO INSERT CON VARIOS REGISTROS A LA VEZ*/

INSERT INTO Empleadas (Salario, Nombre, Apellido, Email,Telefono,Ciudad, Pais)
VALUES (1800, 'Julia', 'Aguilar', 'julia@adalab.es', '614339261', 'Zaragoza', 'España'),
(2000, 'Irene', 'Montenegro', 'irene@adalab.es', '659745615', 'Cataluña', 'España'),
(3000, 'Laura', 'Navarro', 'laura@adalab.es',NULL,NULL, 'Italia');



 
  /*  UPDATE */
 /* EJEMPLO UPDATE */
 
 UPDATE Empleadas
SET Telefono = 678652840, Ciudad = 'Madrid', Pais = 'España'
WHERE IDEmpleada = 10;

  /*  UPDATE */
 /* EJEMPLO UPDATE SIN WHERE */
 /* MODO SEGURO MySQL WORKBENCH POR DEFECTO, NO DEJA EJECUTAR SENTENCIAS DE ACTUALIZACION SIN WHERE*/
UPDATE Empleadas
SET Telefono = 678652840, Ciudad = 'Madrid', Pais = 'España';



/*  UPDATE */
/* EJEMPLO UPDATE MULTIPLE REGISTROS CON CONDICION EN WHERE  */
 
UPDATE Empleadas
SET Salario = 2000
WHERE Salario <2000;

 
/*  DELETE */
/* EJEMPLO DELETE*/
 
DELETE FROM Empleadas
WHERE IDEmpleada = 8;

/* EJEMPLO DELETE con dos condiciones en el WHERE, metodo alternativo de la sentencia delete anterior*/

DELETE FROM Empleadas
WHERE Nombre = 'Julia' AND Apellido= 'Aguilar';

/* EJEMPLO DELETE multiple basado en condición*/
DELETE FROM Empleadas
WHERE Salario > 2500
ORDER BY Salario DESC
LIMIT 3;


/* EJEMPLO DELETE TABLA EMPLEADAS*/


DELETE FROM Empleadas;


/*EJERCICOS FINALES*/

USE tienda;


/*EJERCICIO 1
Crea una copia de la tabla Customers, ya que vamos a modificar los datos originales de dicha tabla. Para ello ejecuta la siguente sentencia:*/

CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * FROM
    customers;


/*EJERCICIO 2
Realiza una inserción de datos sobre la tabla Customers introduciendo la siguente información.*/


INSERT INTO customers_mod (customerNumber,customerName, contactLastName, contactFirstName, phone,addressLine1,addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
VALUES (343,'Adalab','Rodriguez','Julia',672986373,'Calle Falsa 123','Puerta 42','Madrid','España',28000,'España',15,20000000);

/*EJERCICIO 3
Realiza una inserción de datos sobre la tabla Customers introduciendo la siguente información. Fijate que ahora no tenemos toda la información.*/

INSERT INTO customers_mod (customerNumber,customerName, contactLastName, contactFirstName, phone,addressLine1,addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
VALUES (344,'La pegatina After','Santiago','Maricarmen',00000000,'Travesia del rave',NULL,'Palma de mallorca',NULL,07005,'España',10,45673453);

 

/*EJERCICIO 4
Introduce ahora 5 filas nuevas con la información que consideres relevante para los campos disponibles
 ( Se recuerda que el Indice(la clave primaria), no es necesaria especificarla) en una misma instrucción.
 En 3 de las nuevas filas debes dejar vacio el campo 'contactFirstName'*/

/* ESTE  NO HACE FALTA RESOLVERLO, A CRITERIO DE LAS ALUMNAS*/

/*EJERCICIO 5

Actualiza ahora los datos faltantes corresponentes al CustomerName 'La pegatina After con la siguente información.*/



 
UPDATE customers_mod
SET addressLine1 = 'Poligono Industrial de Son Castelló',addressLine2= 'Nave 92', city = 'Palma de mallorca', state = 'España',postalCode = 28123,country ='España', salesRepEmployeeNumber= 25, creditLimit= 5000000
WHERE customerName = 'La pegatina After';


/*EJERCICIO 6

Vamos ahora a romper a proposito la tabla con la que estamos trabajando, para ello primero vamos a realizar una copia de la misma
 antes de ejecutar lo siguiente. Con el nombre customers_destroy

Una vez creada la copia y guardada a buen recaudo. 
Vamos a actualizar algunos de los cambios sin especificar la condición del WHERE.
Para ello modifica el campo los siguentes campos de 

- addressLine1: Vamos
- addressLine2: a
- postalCode: fastidiar
- country: la tabla :)

Y observa los frutos de de tu metedura de pata.

Tras esto restaura la tabla que has trasteado con la copia que te has creado previamente.*/

CREATE TABLE IF NOT EXISTS customers_destroy
SELECT * FROM
    customers;


UPDATE customers_destroy
SET addressLine1 = 'Vamos', addressLine2 = 'a', postalCode = 'fastidiar',country='la tabla :D';
    
    
SELECT * FROM customers_destroy;

/*EJERCICIO 7

Actaliza ahora los datos de la tabla customers_mod, para que las 10 primeras empresas sean gestionadas por la repesentante de ventas numero 2.
El resto de empresas no deben ser modificadas.*/


UPDATE customers_mod
SET salesRepEmployeeNumber = 2
LIMIT 10;


/*EJERCICIO 8

Queremos ahora eliminar de los datos de la tabla aquellos registros que contentan un 'null' en el campo 'ContactFirstName'*/

DELETE FROM customers_mod
WHERE ContactFirstName = NULL;


/*EJERCICIO 9

Eliminar ahora de los datos de la tabla aquellos registros de la tabla cuyo valor de la  columna creditLimit sea menor de 10000.*/

DELETE FROM customers_mod
WHERE creditLimit < 10000;

/*EJERCICIO 10

Ejecuta la instruccion de DELETE para el campo 'customerName' olvidando el WHERE como condición.
Y observa lo que ha ocurrido.  ( Y medita sobre las decisiones que has tomado en tu vida, si esto ocurriera en la base de datos de la empresa en la que trabajases, como mínimo te caería una bronca del copón)*/

DELETE FROM customers_mod;


/*EJERCICIO 11

Con el fin de que no se vuelva a repetir el ejecutar la sentencia DELETE sin el WHERE, mira el siguente vídeo

[No te olvides de poner el Where en el Delete From. ](https://www.youtube.com/watch?v=i_cVJgIz_Cs)*/

