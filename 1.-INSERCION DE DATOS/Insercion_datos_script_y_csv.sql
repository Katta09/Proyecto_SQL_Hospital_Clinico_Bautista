INSERT INTO `PACIENTE`(ID_PACIENTE, NOMBRE_PACIENTE, APELLIDO_PACIENTE, CEDULA_PACIENTE, FECHA_NACIMIENTO, TELEFONO_PACIENTE, DIRECCION_PACIENTE, EMAIL_PACIENTE)
VALUES (1, 'JUAN', 'PEREZ', '12345678-9', '1965-08-15', '912345678', 'SANTIAGO, REGION METROPOLITANA', 'JUAN.PEREZ@GMAIL.COM'),
(2, 'MARIA', 'GOMEZ', '23456789-K', '1973-04-07', '923456789', 'VALPARAISO, REGION DE VALPARAISO', 'MARIA.GOMEZ@GMAIL.COM'),
(3, 'LUIS', 'RODRIGUEZ', '34567890-1', '1980-11-23', '934567890', 'CONCEPCION, REGION DEL BIOBIO', 'LUIS.RODRIGUEZ@GMAIL.COM'),
(4, 'ANA', 'MARTINEZ', '45678901-2', '1987-05-12', '945678901', 'LA SERENA, REGION DE COQUIMBO', 'ANA.MARTINEZ@GMAIL.COM'),
(5, 'CARLOS', 'LOPEZ', '56789012-3', '1994-02-02', '956789012', 'ANTOFAGASTA, REGION DE ANTOFAGASTA', 'CARLOS.LOPEZ@GMAIL.COM'),
(6, 'LAURA', 'SANCHEZ', '67890123-4', '2000-07-18', '967890123', 'ARICA, REGION DE ARICA Y PARINACOTA', 'LAURA.SANCHEZ@GMAIL.COM'),
(7, 'PEDRO', 'FERNANDEZ', '78901234-5', '2007-03-09', '978901234', 'PUERTO MONTT, REGION DE LOS LAGOS', 'PEDRO.FERNANDEZ@GMAIL.COM'),
(8, 'ISABEL', 'GARCIA', '89012345-6', '2014-10-25', '989012345', 'RANCAGUA, REGION DE O\'HIGGINS', 'ISABEL.GARCIA@GMAIL.COM'),
(9, 'ROBERTO', 'HERNANDEZ', '90123456-7', '1961-12-06', '990123456', 'TALCA, REGION DEL MAULE', 'ROBERTO.HERNANDEZ@GMAIL.COM'),
(10, 'SOFIA', 'DIAZ', '15347876-8', '1969-09-29', '911223344', 'IQUIQUE, REGION DE TARAPACA', 'SOFIA.DIAZ@GMAIL.COM'),
(11, 'MIGUEL', 'TORRES', '12345678-K', '1976-06-14', '922334455', 'CURICO, REGION DEL MAULE', 'MIGUEL.TORRES@GMAIL.COM'),
(12, 'CARMEN', 'ORTEGA', '23456789-1', '1983-01-03', '933445566', 'PUNTA ARENAS, REGION DE MAGALLANES', 'CARMEN.ORTEGA@GMAIL.COM'),
(13, 'ALEJANDRO', 'LARA', '34567890-2', '1990-04-22', '944556677', 'COPIAPO, REGION DE ATACAMA', 'ALEJANDRO.LARA@GMAIL.COM'),
(14, 'PAULA', 'PINEDA', '45678901-3', '1997-11-11', '955667788', 'IQUIQUE, REGION DE TARAPACA', 'PAULA.PINEDA@GMAIL.COM'),
(15, 'JAVIER', 'CASTRO', '56789012-4', '2003-08-30', '966778899', 'VIÃ‘A DEL MAR, REGION DE VALPARAISO', 'JAVIER.CASTRO@GMAIL.COM');


/*EN ESTA PARTE SE INICIA LA INSERCION DE TODOS LOS DATOS EN LAS TABLAS A TRAVES DE LA IMPORTACION DE ARCHIVOS .CSV
PARA ELLO SE DEBE PROCEDER DE LA SIGUIENTE MANERA: 
1) CONSULTAR TABLA CON SELECT * FROM NOMBRE_DE_LA_TABLA (EJEMPLO SELECT * FROM MEDICO)
2) SELECCIONAR EL ITEM IMPORT QUE SE ENCUENTRA EN LA REJILLA DE RESULTADOS
3) SELECCIONAR BROWSE Y BUSCAR EL ARCHIVO EXTENSION .CSV QUE SE DESEA CARGAR (SE DEBE CARGAR EN ORDEN DE CREACION DE LAS TABLAS, DE TABLA MADRE 
   A TABLA HIJA)
4) LUEGO DE DAR "SIGUIENTE (NEXT)" DEBO SELECCIONAR LA PRIMERA OPCION "USAR TABLA EXISTENTE" Y EN EL MENU DESPLEGABLE ELEGIR LA TABLA CARGADA
5) VERIFICAR QUE EL ARCHIVO SEA UTF-8 Y QUE LOS CAMPOS CARGADOS SEAN LOS CORRECTOS
6) DAR SIGUIENTE Y FINALIZAR EL PROCESO
7) COMO ULTIMO PASO SE COMPRUEBA LA CORRECTA INSERCION DE DATOS CONSULTANDO LA TABLA CON SELECT * FROM
*/
----- SE DEJAN LAS CONSULTAS A CONTINUACION PARA COMPROBAR EL PROCESO DE INSERCION

----- ESTA INSERCION FUE EJECUTADA CON INSERT INTO
SELECT * FROM PACIENTE;

----- ESTAS INSERCIONES FUERON EJECUTADAS POR IMPORTACION
SELECT * FROM MEDICO;
SELECT * FROM CONSULTORIO;
SELECT * FROM FARMACIA;
SELECT * FROM ESPECIALIDAD_MEDICO;
SELECT * FROM CONSULTORIO_MEDICO;
SELECT * FROM CITA_PACIENTE_MEDICO;
SELECT * FROM HISTORIA_PACIENTE;
SELECT * FROM PRESCRIPCIONES;
SELECT * FROM FACTURA;
