
START TRANSACTION;


INSERT INTO `categorias` (`categoria_id`, `nombre_categoria`) VALUES
(1, 'Ing. y licenciados'),
(2, 'Ing. tec. y tit. ayudantes'),
(3, 'Jefes ad y de taller'),
(4, 'Ayud no titulados');

-- --------------------------------------------------------


INSERT INTO `conceptos_de_salario` (`concepto_id`, `contrato_id`, `tipo_de_concepto_id`, `cantidad`) VALUES
(1, 1, 1, 1000),
(2, 1, 2, 80),
(3, 2, 1, 1100),
(4, 2, 11, 50),
(5, 3, 1, 1000),
(6, 3, 2, 80),
(7, 3, 5, 100),
(8, 4, 1, 1100),
(9, 4, 7, 70),
(10, 4, 11, 50);

-- --------------------------------------------------------


INSERT INTO `contratos` (`contrato_id`, `fAlta`, `fBaja`, 
			`tipo_de_contrato_id`, `trabajador_id`, `empresa_id`) VALUES
(1, '2022-01-01', '2022-03-31', 420, 2, 1),
(2, '2022-07-01', '2022-09-30', 421, 1, 2),
(3, '2022-04-01', NULL, 109, 2, 1),
(4, '2022-10-01', NULL, 200, 1, 2);

-- --------------------------------------------------------

INSERT INTO `cotizaciones` (`cotizacion_id`, `grupo`) VALUES
(1, 'Grupo 1'),
(2, 'Grupo 2'),
(3, 'Grupo 3'),
(4, 'Grupo 4');

-- --------------------------------------------------------


INSERT INTO `empresas` (`empresa_id`, `cif`, `nombre`, `dir`, `cp`, `prov`, `ccc`) VALUES
(1, 'A00000001', 'Bar Pepe, S.L.', 'c/Portugual 27B', 6001, 'Badajoz', 6123456701),
(2, 'B00000001', 'Alimentación Manolo', 'Avda/ Elvas S/N', 6008, 'Badajoz', 6765432199),
(3, 'G11111111', 'Asoc. Informaticos en Paro', 'Av. Santiago Ramón y Cajal', 6003, 'Badajoz', 6761432199);

-- --------------------------------------------------------


INSERT INTO `tipos_de_conceptos` (`tipo_de_concepto_id`, `nombre`, `tipo`) VALUES
(1, 'Salario base', 1),
(2, 'Plus de convenio', 1),
(3, 'Antigüedad', 1),
(4, 'Nocturnidad', 1),
(5, 'Guardias', 1),
(6, 'Comisiones', 1),
(7, 'Horas extra', 1),
(8, 'Pro. Pagas Extra', 1),
(9, 'Incentivos', 1),
(10, 'Plus de peligrosidad', 0),
(11, 'Plus de transporte', 0),
(12, 'Ropa de trabajo', 0);

-- --------------------------------------------------------


INSERT INTO `tipos_de_contrato` (`tipo_de_contrato_id`, `nombre`) VALUES
(100, 'Indef., T.C., ordinario'),
(109, 'Indef., T.C., fomento contratación'),
(130, 'Indef., T.C., discapacitados'),
(200, 'Indef., T.P.,ordinario'),
(209, 'Indef., T.P.,fomento contratación'),
(402, 'Dur det., T.C., eventual producción'),
(403, 'Dur det.,T.C., inserción'),
(420, 'Dur det., T.C., prácticas'),
(421, 'Temporal, T.C., formación');

-- --------------------------------------------------------


INSERT INTO `trabajadores` (`trabajador_id`, `nif`, `nombre`, `ape1`, `ape2`, `nss`, `categoria_id`, `cotizacion_id`) VALUES
(1, '12345678A', 'Pepe', 'González', 'Gutierrez', 61234567812, 3, 3),
(2, '87654321Z', 'Marina', 'Antúnez', 'Pérez', 68765432134, 2, 2),
(3, '34654321Z', 'Luis', 'Martínez', 'Sánchez', 102567832134, 4, 4);
