CREATE SCHEMA `leccion-12-sql` ;

USE `leccion-12-sql`;

-- CREATE TABLE
-- Ejemplo: Para crear una tabla "Productos" podríamos usar la siguiente secuencia:

CREATE TABLE productos
(id_producto INT,
nombre VARCHAR(100),
color ENUM('rojo','amarillo','azul'),
precio INT,
stock FLOAT
);

/*Ejercicio: Crea la tabla Empleadas que hemos estado utilizando en las lecciones anteriores.
 De momento no te preocupes por definir restricciones a los datos que se pueden introducir, o por definir claves primarias o foráneas. Puedes ver a continuación un ejemplo de la tabla*/
 
 CREATE TABLE Empleadas
(IDEmpleada INT,
Salario FLOAT,
Nombre VARCHAR(30),
Apellido VARCHAR(30),
Pais VARCHAR(10)
);


-- Restricciones de columna:
-- Ejemplo: Para crear una tabla "Productos" podríamos usar la siguiente secuencia:

CREATE TABLE productos2
(id_producto INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100) DEFAULT NULL,
color ENUM('rojo','amarillo','azul') DEFAULT NULL,
precio INT DEFAULT NULL,
stock FLOAT DEFAULT NULL,
PRIMARY KEY (id_producto)
);

-- Ejemplo: Creamos la tabla Personas para contener información de las empleadas de una empresa:

CREATE TABLE Personas (
ID INT NOT NULL,
Apellido VARCHAR(255) NOT NULL,
Nombre VARCHAR(255),
Edad INT,
Ciudad varchar(255) DEFAULT 'Madrid'
);



-- Restricciones de tabla:

-- Ejemplo: Para crear una tabla "Productos" podríamos usar la siguiente secuencia:

CREATE TABLE productos3
(id_producto INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100) DEFAULT NULL,
color ENUM('rojo','amarillo','azul') DEFAULT NULL,
precio INT DEFAULT NULL,
stock FLOAT DEFAULT NULL,
PRIMARY KEY (id_producto),
CONSTRAINT precio_positivo CHECK ((precio > 0))
);


/*Ejercicio: Crea la misma tablas Personas que hemos definido anteriormente pero añadiendo una
 restricción de tabla que comprueba si la edad de la persona es mayor de 16 años:*/

CREATE TABLE Personas_restringido (
ID INT NOT NULL,
Apellido VARCHAR(255) NOT NULL,
Nombre VARCHAR(255),
Edad INT,
Ciudad varchar(255) DEFAULT 'Madrid',
CONSTRAINT CHK_Persona CHECK (Edad>=16)
);


/*Ejercicio: Crea la tabla Pedidos, estableciendo restricciones de tabla para la clave primaria y la clave foránea:*/

CREATE TABLE Pedidos (
PedidoID INT NOT NULL,
NumeroPedido INT NOT NULL,
PersonaID INT REFERENCES Personas(ID),
PRIMARY KEY (PedidoID)
);


-- Restricciones de FOREIGN KEY
/*Ejercicio: Crea las tabla Empleadas y EmpleadasEnProyectos que hemos usado en lecciones anteriores, definiendo claves primarias, claves foránea, tipos de datos, etc. Haz que cuando se elimine una Empleada, se eliminen todas las entradas en EmpleadasEnProyectos asociadas.*/

CREATE TABLE Empleadas_foreign
(IDEmpleada INT NOT NULL AUTO_INCREMENT,
Salario FLOAT DEFAULT NULL,
Nombre VARCHAR(30) DEFAULT NULL,
Apellido VARCHAR(30) DEFAULT NULL,
Pais VARCHAR(10) DEFAULT NULL,
PRIMARY KEY (IDEmpleada)
);


CREATE TABLE EmpleadasEnProyectos
(IDEmpleada INT NOT NULL REFERENCES Empleadas(IDEmpleada) ON DELETE CASCADE,
IDProyecto INT NOT NULL,
PRIMARY KEY (IDEmpleada,IDProyecto)
);


-- Crear una tabla usando una tabla existente
/*Ejercicio: Crea una copia de la tabla Pedidos que definimos anteriormente, pero sin incluir el NumeroPedido dentro de la misma. Haz que se llame PedidosPorPersona:*/

CREATE TABLE PedidosPorPersona AS
SELECT PedidoID, PersonaID
FROM Pedidos;


/* EJERCICIOS FINALES */

/*EJERCICIO 1
Crea la tabla Customers (sin tener en cuenta claves foráneas relacionadas con la tabla Employees).*/

CREATE TABLE customers (
customerNumber int NOT NULL,
customerName varchar(50) NOT NULL,
contactLastName varchar(50) NOT NULL,
contactFirstName varchar(50) NOT NULL,
phone varchar(50) NOT NULL,
addressLine1 varchar(50) NOT NULL,
addressLine2 varchar(50) DEFAULT NULL,
city varchar(50) NOT NULL,
state varchar(50) DEFAULT NULL,
postalCode varchar(15) DEFAULT NULL,
country varchar(50) NOT NULL,
salesRepEmployeeNumber int DEFAULT NULL,
creditLimit decimal(10,2) DEFAULT NULL,
PRIMARY KEY (customerNumber) );

/*EJERCICIO 2
Crea la tabla Employees (sin tener en cuenta claves foráneas relacionadas con la tabla Customers).*/

CREATE TABLE employees (
employeeNumber int NOT NULL,
lastName varchar(50) NOT NULL,
firstName varchar(50) NOT NULL,
extension varchar(10) NOT NULL,
email varchar(100) NOT NULL,
officeCode varchar(10) NOT NULL,
reportsTo int DEFAULT NULL,
jobTitle varchar(50) NOT NULL,
PRIMARY KEY (employeeNumber)
);

/*EJERCICIO 3
Crea de nuevo las dos tablas teniendo en cuenta las claves foráneas y restricciones para los datos (por ejemplo que el teléfono tenga sólo 9 cifras,
 que el límite de crédito nunca sea negativo... Todo lo que se te ocurra).*/

CREATE TABLE employees1 (
employeeNumber int NOT NULL,
lastName varchar(50) NOT NULL,
firstName varchar(50) NOT NULL,
extension varchar(10) NOT NULL,
email varchar(100) NOT NULL,
officeCode varchar(10) NOT NULL,
reportsTo int DEFAULT NULL,
jobTitle varchar(50) NOT NULL,
PRIMARY KEY (employeeNumber)
);



CREATE TABLE customers2 (
customerNumber int NOT NULL,
customerName varchar(50) NOT NULL,
contactLastName varchar(50) NOT NULL,
contactFirstName varchar(50) NOT NULL,
phone varchar(50) NOT NULL,
addressLine1 varchar(50) NOT NULL,
addressLine2 varchar(50) DEFAULT NULL,
city varchar(50) NOT NULL,
state varchar(50) DEFAULT NULL,
postalCode varchar(15) DEFAULT NULL,
country varchar(50) NOT NULL,
salesRepEmployeeNumber int DEFAULT NULL,
creditLimit decimal(10,2) DEFAULT NULL,
PRIMARY KEY (customerNumber),
KEY salesRepEmployeeNumber (salesRepEmployeeNumber),
CONSTRAINT customers_ibfk_1 FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees (employeeNumber)
);
