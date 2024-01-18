
/* CREACION DE 5 VISTAS. DESPUES DE LA CREACION DE CADA VISTA, APARECE LA CONSULTA DE LA MISMA
ORDEN DE CREACION DE LAS VISTAS:
1) VISTA_PACIENTE_HOSPITAL
2) VISTA_HORA_ATENCION_PACIENTE_MEDICO
3) VISTA_MONTO_PAGADO_DEL_PACIENTE
4) VISTA_SOLICITUD_PRODUCTOS_BAJOS_EN_STOCK
5) VISTA_INFORMACION_DE_FACTURAS 
*/

CREATE OR REPLACE VIEW VISTA_PACIENTE_HOSPITAL AS
SELECT NOMBRE_PACIENTE AS NOMBRE, APELLIDO_PACIENTE AS APELLIDO,
TELEFONO_PACIENTE AS TELEFONO, EMAIL_PACIENTE AS EMAIL FROM PACIENTE;

SELECT * FROM VISTA_PACIENTE_HOSPITAL;

CREATE OR REPLACE VIEW VISTA_HORA_ATENCION_PACIENTE_MEDICO AS
SELECT P.NOMBRE_PACIENTE, P.APELLIDO_PACIENTE, C.FECHA_CITA, M.NOMBRE_MEDICO, M.APELLIDO_MEDICO, E.NOMBRE_ESPECIALIDAD
FROM PACIENTE AS P
INNER JOIN CITA_PACIENTE_MEDICO AS C
       ON P.ID_PACIENTE=C.ID_PACIENTE
INNER JOIN MEDICO AS M 
	  ON M.ID_MEDICO=C.ID_MEDICO
INNER JOIN ESPECIALIDAD_MEDICO AS E 
      ON M.ID_MEDICO=E.ID_MEDICO;
      
SELECT * FROM VISTA_HORA_ATENCION_PACIENTE_MEDICO;

CREATE OR REPLACE VIEW VISTA_MONTO_PAGADO_DEL_PACIENTE AS
SELECT P.NOMBRE_PACIENTE, P.APELLIDO_PACIENTE, F.MONTO_PAGADO_CLP, F.METODO_PAGO
FROM PACIENTE AS P
INNER JOIN FACTURA AS F
      ON P.ID_PACIENTE=F.ID_PACIENTE;

SELECT * FROM VISTA_MONTO_PAGADO_DEL_PACIENTE;

CREATE OR REPLACE VIEW VISTA_SOLICITUD_PRODUCTOS_BAJOS_EN_STOCK AS
SELECT NOMBRE_MEDICAMENTO AS PRODUCTOS_BAJOS_EN_STOCK
FROM FARMACIA
WHERE STOCK_MEDICAMENTO <20;

SELECT * FROM VISTA_SOLICITUD_PRODUCTOS_BAJOS_EN_STOCK;

CREATE OR REPLACE VIEW VISTA_INFORMACION_DE_FACTURAS AS
SELECT COUNT(ID_FACTURA) AS CANTIDAD_FACTURAS, 
SUM(MONTO_PAGADO_CLP) AS MONTO_TOTAL_FACTURADO,
METODO_PAGO
FROM FACTURA
GROUP BY METODO_PAGO ORDER BY CANTIDAD_FACTURAS ASC;

SELECT * FROM VISTA_INFORMACION_DE_FACTURAS;