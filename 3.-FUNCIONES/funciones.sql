
----- CREACION DE FUNCIONES ALMACENADAS------

----- LA PRIMERA FUNCION NOS PERMITE CONOCER LA EDAD DEL PACIENTE A TRAVES DE SU FECHA DE NACIMIENTO

DROP FUNCTION IF EXISTS FN_CALCULAR_EDAD; 
DELIMITER //
CREATE FUNCTION FN_CALCULAR_EDAD (FECHA_NACIMIENTO DATE)
RETURNS INT 
DETERMINISTIC
BEGIN
DECLARE EDAD INT;
SET EDAD= YEAR(CURDATE()) - YEAR(FECHA_NACIMIENTO) - (RIGHT(CURDATE(), 5) < RIGHT(FECHA_NACIMIENTO, 5));
RETURN EDAD;
END//
DELIMITER ; 

SELECT FN_CALCULAR_EDAD ('1965-08-15') AS EDAD;

----- SEGUNDA FUNCION

DROP FUNCTION IF EXISTS FN_CANTIDAD_FACTURAS_POR_METODO_DE_PAGO; 
DELIMITER //
CREATE FUNCTION FN_CANTIDAD_FACTURAS_POR_METODO_DE_PAGO (P_METODO_PAGO VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE TOTAL_FACTURAS INT;
    SET TOTAL_FACTURAS = (
        SELECT COUNT(ID_FACTURA) FROM FACTURA
        WHERE METODO_PAGO LIKE CONCAT('%', P_METODO_PAGO, '%')
    );
    RETURN TOTAL_FACTURAS; 
END//
DELIMITER ;
 
SELECT FN_CANTIDAD_FACTURAS_POR_METODO_DE_PAGO ('DEBITO') AS TOTAL_FACTURAS;

----- LA SEGUNDA FUNCION NOS PERMITE CONOCER LA CANTIDAD DE FACTURAS GENERADAS POR CADA METODO DE PAGO (CREDITO, DEBITO O EFECTIVO)
