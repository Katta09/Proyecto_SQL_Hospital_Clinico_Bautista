-------------------------- DESAFIO IMPLEMENTACION DE SENTENCIAS (SUBLENGUAJE DCL)-----------------------------------------------------

/* CREACION DE 2 USUARIOS, EL USUARIO 'ANITA' TENDRÁ PERMISOS DE SOLO LECTURA EN TODAS LAS TABLAS, DE LA BASE DE DATOS HOSPITAL_BAUTISTA
MIENTRAS QUE EL USUARIO 'NATU' TENDRÁ PERMISOS DE LECTURA, INSERCION Y MODIFICACIÓN DE DATOS*/

USE MYSQL;
DROP USER IF EXISTS 'ANITA'@'LOCALHOST';
DROP USER IF EXISTS 'NATU'@'LOCALHOST';
CREATE USER 'ANITA'@'LOCALHOST' IDENTIFIED BY '6593164';
CREATE USER 'NATU'@'LOCALHOST' IDENTIFIED BY 'CODERHOUSE';

SELECT * FROM USER;

GRANT SELECT ON HOSPITAL_BAUTISTA.* TO 'ANITA'@'LOCALHOST';
SHOW GRANTS FOR 'ANITA'@'LOCALHOST';

GRANT SELECT, INSERT, UPDATE ON HOSPITAL_BAUTISTA.* TO 'NATU'@'LOCALHOST';
SHOW GRANTS FOR 'NATU'@'LOCALHOST';