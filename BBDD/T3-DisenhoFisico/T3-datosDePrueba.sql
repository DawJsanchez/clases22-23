# Datos de prueba
USE $$DB$$;

SELECT 'Buscar los aciertos';

# EMPRESA
# ccc BIGINT(11)
# tlf INT(9)
INSERT INTO P3_EMPRESA VALUES ('A00000001', 'Bar Pepe, S.L.', 'c/Portugual 27B', '06001', 'Badajoz', 06123456701, 924123456),
       	    	    	   ('B00000001', 'Alimentación Manolo', 'Avda/ Elvas S/N', '06008', 'Badajoz', 06765432199, 924654321);

# CATEGORIA
# https://infogob.es/seguridad-social/categorias-profesionales/
INSERT INTO P3_CAT (ID, `nombreCat`) VALUES
		(1, 'Ing. y licenciados'),
		(2, 'Ing. tec. y tit. ayudantes'),
		(3, 'Jefes ad y de taller'),
		(4, 'Ayud no titulados');

# GRUPOS DE COTIZACIÓN
# https://infogob.es/seguridad-social/categorias-profesionales/
INSERT INTO P3_COT (ID, `grupo`) VALUES
		(1, 'Grupo 1'),
		(2, 'Grupo 2'),
		(3, 'Grupo 3'),
		(4, 'Grupo 4');

# Trabajadores
# dni char(9)
# nss BIGINT(12)
REPLACE INTO P3_TRABAJADOR VALUES ('12345678A', 'Pepe', 'González', 'Gutierrez', 924111222, 061234567812, 3, 3),
		('87654321Z','Marina','Antúnez','Pérez', 924333444, 068765432134, 2, 2);

# Tipo de contrato
REPLACE INTO P3_TCONTRATO VALUES (100, 'Indef., T.C., ordinario'),
	(109, 'Indef., T.C., fomento contratación'),
	(130, 'Indef., T.C., discapacitados'),
	(200, 'Indef., T.P.,ordinario'),
	(209, 'Indef., T.P.,fomento contratación'),
	(402, 'Dur det., T.C., eventual producción'),
	(403, 'Dur det.,T.C., inserción'),
	(420, 'Dur det., T.C., prácticas'),
	(421, 'Temporal, T.C., formación');

# Contrato
# borramos y reiniciamos
DELETE FROM P3_CONTRATO;
ALTER TABLE P3_CONTRATO AUTO_INCREMENT = 1;
# temporales
INSERT INTO P3_CONTRATO (`fAlta`, `fBaja`, `codContrato`, `NIF`, `CIF`) VALUES
	('2022-01-01', '2022-03-31', 420, '87654321Z', 'A00000001'),
	('2022-07-01', '2022-09-30', 421, '12345678A', 'B00000001');
# indefinidos
INSERT INTO P3_CONTRATO (`fAlta`, `codContrato`, `NIF`, `CIF`) VALUES
	('2022-04-01', 109, '87654321Z', 'A00000001'),
	('2022-10-01', 200, '12345678A', 'B00000001');

# Conceptos nómina
#---------------------------

# tipos
# Recuerda:
#	Si incrementa el patrimonio -> salarial
#	Si compensa pérdidas -> no salarial
REPLACE INTO P3_CONCTIPO VALUES
	(1, 'Salario base', 1),
	(2, 'Plus de convenio',1),
	(3, 'Antigüedad',1),
	(4, 'Nocturnidad',1),
	(5, 'Guardias',1),
	(6, 'Comisiones',1),
	(7, 'Horas extra',1),
	(8, 'Pro. Pagas Extra',1),
	(9, 'Incentivos',1),
	(10, 'Plus de peligrosidad', 0),
	(11, 'Plus de transporte', 0),
	(12, 'Ropa de trabajo',0);

INSERT INTO P3_CONCSALARIO (`numContrato`, `conTipo`, `cantidad`) VALUES
	(1, 1, 1000),
	(1, 2, 80),
	(2, 1, 1100),
	(2, 11, 50),
	(3, 1, 1000),
	(3, 2, 80),
	(3, 5, 100),
	(4, 1, 1100),
	(4, 7, 70),
	(4, 11, 50);

SELECT '-----------------------------------------------------';
SELECT 'Buscar los errores de FK';
SELECT
  TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = '$$DB$$' ;


SELECT '-----------------------------------------------------';
SELECT 'EMPRESA'; SELECT * FROM P3_EMPRESA;
SELECT 'CAT'; SELECT * FROM P3_CAT;
SELECT 'COT'; SELECT * FROM P3_COT;
SELECT 'TRABAJADOR'; SELECT * FROM P3_TRABAJADOR;
SELECT 'Tipo de CONTRATO'; SELECT * FROM P3_TCONTRATO;
SELECT 'CONTRATO'; SELECT * FROM P3_CONTRATO;
SELECT 'Tipo de conceptos'; SELECT * FROM P3_CONCTIPO;
SELECT 'CONCEPTOS'; SELECT * FROM P3_CONCSALARIO;
