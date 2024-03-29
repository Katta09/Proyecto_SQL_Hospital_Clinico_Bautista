-------- DESAFIO TRANSACCIONES-------

----- ESTA PRIMERA TRANSACCIÓN PERMITE ELIMINAR TRES (3) REGISTROS DE LA TABLA FARMACIA-----
USE HOSPITAL_BAUTISTA;

START TRANSACTION;
DELETE FROM `FARMACIA` WHERE ID_MEDICAMENTO IN (3, 6, 8);
----- AGREGAMOS UN ROLLBACK PARA REVERTIR EL CAMBIO REALIZADO-----
ROLLBACK;
COMMIT;

----- AÑADO LA CONSULTA DE LA TABLA FARMACIA PARA OBSERVAR LOS CAMBIOS-----
SELECT * FROM FARMACIA;
 
----- INSERCION DE DATOS EN UNA SEGUNDA TABLA-----

START TRANSACTION;
INSERT INTO MEDICO (ID_MEDICO, NOMBRE_MEDICO, APELLIDO_MEDICO, EMAIL_MEDICO) VALUES (16, 'FRANCISCO', 'VIERA', 'FRANCISCO.VIERA@GMAIL.COM');
INSERT INTO MEDICO (ID_MEDICO, NOMBRE_MEDICO, APELLIDO_MEDICO, EMAIL_MEDICO) VALUES (17, 'MARIA', 'RAMIREZ', 'MARIA.RAMIREZ@GMAIL.COM');
INSERT INTO MEDICO (ID_MEDICO, NOMBRE_MEDICO, APELLIDO_MEDICO, EMAIL_MEDICO) VALUES (18, 'JAIRO', 'MARCIALES', 'JAIRO.MARCIALES@GMAIL.COM');
INSERT INTO MEDICO (ID_MEDICO, NOMBRE_MEDICO, APELLIDO_MEDICO, EMAIL_MEDICO) VALUES (19, 'MARCELA', 'PEREZ', 'MARCELA.PEREZ@GMAIL.COM');
SAVEPOINT LOTE_1;
INSERT INTO MEDICO (ID_MEDICO, NOMBRE_MEDICO, APELLIDO_MEDICO, EMAIL_MEDICO) VALUES (20, 'MARIBEL', 'LARA', 'MARIBEL.LARA@GMAIL.COM');
INSERT INTO MEDICO (ID_MEDICO, NOMBRE_MEDICO, APELLIDO_MEDICO, EMAIL_MEDICO) VALUES (21, 'HECTOR', 'MOLINA', 'HECTOR.MOLINA@GMAIL.COM');
INSERT INTO MEDICO (ID_MEDICO, NOMBRE_MEDICO, APELLIDO_MEDICO, EMAIL_MEDICO) VALUES (22, 'JOEL', 'GUERRERO', 'JOEL.GUERRERO@GMAIL.COM');
INSERT INTO MEDICO (ID_MEDICO, NOMBRE_MEDICO, APELLIDO_MEDICO, EMAIL_MEDICO) VALUES (23, 'KARLA', 'REINA', 'KARLA.REINA@GMAIL.COM');
SAVEPOINT LOTE_2;

ROLLBACK TO LOTE_1;
ROLLBACK TO LOTE_2;
RELEASE SAVEPOINT LOTE_1; ----- ELIMINACION SAVEPOINT NUMERO 1----
RELEASE SAVEPOINT LOTE_2; ----- ELIMINACION SAVEPOINT NUMERO 2------
COMMIT;

SELECT * FROM MEDICO;

ALTER TABLE MEDICO ENGINE= InnoDB;----- CAMBIO DEL MOTOR DE ALMACENAMIENTO A INNODB
