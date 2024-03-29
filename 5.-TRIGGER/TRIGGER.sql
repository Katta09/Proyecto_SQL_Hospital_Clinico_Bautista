----- CREACION DE TRIGGER-----

/* EL TRIGGER CREADO EN LA TABLA PACIENTE PERMITE CONOCER LA FECHA, HORA Y USUARIO QUE INGRESA REGISTROS EN ESTA TABLA,
DICHA INFORMACION SERA REFLEJADA EN UNA NUEVA TABLA CREADA LLAMADA PACIENTE_REGISTRO */

DROP TABLE IF EXISTS PACIENTE_REGISTRO;
CREATE TABLE PACIENTE_REGISTRO (ID_PACIENTE_R INT, NOMBRE_PACIENTE VARCHAR(50), APELLIDO_PACIENTE VARCHAR(50), FECHA_NACIMIENTO DATE, 
TELEFONO_PACIENTE VARCHAR(50), DIRECCION_PACIENTE VARCHAR(50), EMAIL_PACIENTE VARCHAR(50), USUARIO VARCHAR(50), FECHA_REGISTRO DATETIME);

DROP TRIGGER IF EXISTS PACIENTE_REGISTRO_AI;
CREATE TRIGGER PACIENTE_REGISTRO_AI AFTER INSERT ON PACIENTE FOR EACH ROW INSERT INTO PACIENTE_REGISTRO (ID_PACIENTE_R, NOMBRE_PACIENTE, 
APELLIDO_PACIENTE, FECHA_NACIMIENTO, TELEFONO_PACIENTE, DIRECCION_PACIENTE, EMAIL_PACIENTE, USUARIO, FECHA_REGISTRO) 
VALUES (NEW.ID_PACIENTE, NEW.NOMBRE_PACIENTE, NEW.APELLIDO_PACIENTE, NEW.FECHA_NACIMIENTO, NEW.TELEFONO_PACIENTE, 
NEW.DIRECCION_PACIENTE, NEW.EMAIL_PACIENTE, CURRENT_USER, NOW());

CALL `SP_INSERTAR_DATOS_PACIENTES` (19, 'PAOLA', 'ALVARADO', '28207175-0', '1989-07-24', '937775201', 'SANTIAGO, REGION METROPOLITANA', 'PAOLA.ALVARADO@GMAIL.COM');

SELECT * FROM PACIENTE_REGISTRO;