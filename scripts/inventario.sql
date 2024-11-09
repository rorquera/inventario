DROP TABLE IF EXISTS CATEGORIAS;

DROP TABLE IF EXISTS CATEGORIAS_UNIDAD_MEDIDA;

CREATE TABLE CATEGORIAS (
	CODIGO SERIAL NOT NULL,
	NOMBRE VARCHAR(100) NOT NULL,
	CATEGORIA_PADRE INT,
	CONSTRAINT CATEGORIAS_PK PRIMARY KEY (CODIGO),
	CONSTRAINT CATEGORIAS_FK FOREIGN KEY (CATEGORIA_PADRE) REFERENCES CATEGORIAS (CODIGO)
);

INSERT INTO
	PUBLIC.CATEGORIAS (NOMBRE, CATEGORIA_PADRE)
VALUES
	('Materia Prima', NULL);

INSERT INTO
	PUBLIC.CATEGORIAS (NOMBRE, CATEGORIA_PADRE)
VALUES
	('Proteina', 1);

INSERT INTO
	PUBLIC.CATEGORIAS (NOMBRE, CATEGORIA_PADRE)
VALUES
	('Salsas', 1);

INSERT INTO
	PUBLIC.CATEGORIAS (NOMBRE, CATEGORIA_PADRE)
VALUES
	('Punto de Venta', NULL);

INSERT INTO
	PUBLIC.CATEGORIAS (NOMBRE, CATEGORIA_PADRE)
VALUES
	('Bebidas', 4);

INSERT INTO
	PUBLIC.CATEGORIAS (NOMBRE, CATEGORIA_PADRE)
VALUES
	('Con Alcohol', 5);

INSERT INTO
	PUBLIC.CATEGORIAS (NOMBRE, CATEGORIA_PADRE)
VALUES
	('Sin Alcohol', 5);

SELECT
	*
FROM
	CATEGORIAS;

----------------------------
--CATEGORIAS_UNIDAD_MEDIDA--
----------------------------
CREATE TABLE CATEGORIAS_UNIDAD_MEDIDA (
	CODIGO CHAR(1) NOT NULL,
	NOMBRE VARCHAR(50) NOT NULL,
	CONSTRAINT CATEGORIAS_UNIDAD_MEDIDA_PK PRIMARY KEY (CODIGO)
);

INSERT INTO
	PUBLIC.CATEGORIAS_UNIDAD_MEDIDA (CODIGO, NOMBRE)
VALUES
	('U', 'Unidades');

INSERT INTO
	PUBLIC.CATEGORIAS_UNIDAD_MEDIDA (CODIGO, NOMBRE)
VALUES
	('V', 'Volumen');

INSERT INTO
	PUBLIC.CATEGORIAS_UNIDAD_MEDIDA (CODIGO, NOMBRE)
VALUES
	('P', 'Peso');

SELECT
	*
FROM
	CATEGORIAS_UNIDAD_MEDIDA;

-------------------
--UNIDADES_MEDIDA--
-------------------
CREATE TABLE UNIDADES_MEDIDA (
	CODIGO SERIAL NOT NULL,
	NOMBRE VARCHAR(3) NOT NULL,
	DESCRIPCION VARCHAR(100) NOT NULL,
	CATEGORIA_UDM CHAR(1) NOT NULL,
	CONSTRAINT UNIDADES_MEDIDA_PK PRIMARY KEY (CODIGO),
	CONSTRAINT UNIDADES_MEDIDA_CATEGORIAS_UNIDAD_MEDIDA_FK FOREIGN KEY (CATEGORIA_UDM) REFERENCES CATEGORIAS_UNIDAD_MEDIDA (CODIGO)
);

INSERT INTO
	PUBLIC.UNIDADES_MEDIDA (NOMBRE, DESCRIPCION, CATEGORIA_UDM)
VALUES
	('ml', 'mililitros', 'V');

INSERT INTO
	PUBLIC.UNIDADES_MEDIDA (NOMBRE, DESCRIPCION, CATEGORIA_UDM)
VALUES
	('l', 'litros', 'V');

INSERT INTO
	PUBLIC.UNIDADES_MEDIDA (NOMBRE, DESCRIPCION, CATEGORIA_UDM)
VALUES
	('u', 'unidad', 'U');

INSERT INTO
	PUBLIC.UNIDADES_MEDIDA (NOMBRE, DESCRIPCION, CATEGORIA_UDM)
VALUES
	('d', 'docena', 'U');

INSERT INTO
	PUBLIC.UNIDADES_MEDIDA (NOMBRE, DESCRIPCION, CATEGORIA_UDM)
VALUES
	('g', 'gramos', 'P');

INSERT INTO
	PUBLIC.UNIDADES_MEDIDA (NOMBRE, DESCRIPCION, CATEGORIA_UDM)
VALUES
	('kg', 'kilogramos', 'P');

INSERT INTO
	PUBLIC.UNIDADES_MEDIDA (NOMBRE, DESCRIPCION, CATEGORIA_UDM)
VALUES
	('lb', 'libras', 'P');

SELECT
	*
FROM
	UNIDADES_MEDIDA;

-------------
--PRODUCTOS--
-------------
CREATE TABLE PRODUCTOS (
	CODIGO SERIAL NOT NULL,
	NOMBRE VARCHAR(100) NOT NULL,
	UDM INT NOT NULL,
	PRECIO_VENTA MONEY NOT NULL,
	TIENE_IVA BOOLEAN NOT NULL,
	COSTE MONEY NOT NULL,
	CATEGORIA INT NOT NULL,
	STOCK INT NOT NULL,
	CONSTRAINT PRODUCTOS_PK PRIMARY KEY (CODIGO),
	CONSTRAINT PRODUCTOS_UNIDADES_MEDIDA_UDM_FK FOREIGN KEY (UDM) REFERENCES UNIDADES_MEDIDA (CODIGO),
	CONSTRAINT PRODUCTOS_UNIDADES_MEDIDA_CATEGORIA_FK FOREIGN KEY (CATEGORIA) REFERENCES CATEGORIAS (CODIGO)
);

INSERT INTO
	PUBLIC.PRODUCTOS (
		NOMBRE,
		UDM,
		PRECIO_VENTA,
		TIENE_IVA,
		COSTE,
		CATEGORIA,
		STOCK
	)
VALUES
	('Coca cola pequeña', 3, 0.58, TRUE, 0.39, 7, 105);

INSERT INTO
	PUBLIC.PRODUCTOS (
		NOMBRE,
		UDM,
		PRECIO_VENTA,
		TIENE_IVA,
		COSTE,
		CATEGORIA,
		STOCK
	)
VALUES
	('Salsa de tomate', 7, 0.95, TRUE, 0.85, 3, 0);

INSERT INTO
	PUBLIC.PRODUCTOS (
		NOMBRE,
		UDM,
		PRECIO_VENTA,
		TIENE_IVA,
		COSTE,
		CATEGORIA,
		STOCK
	)
VALUES
	('Mostaza', 7, 0.95, TRUE, 0.87, 3, 0);

INSERT INTO
	PUBLIC.PRODUCTOS (
		NOMBRE,
		UDM,
		PRECIO_VENTA,
		TIENE_IVA,
		COSTE,
		CATEGORIA,
		STOCK
	)
VALUES
	('Fuze Tea', 3, 0.8, TRUE, 0.7, 7, 49);

SELECT
	*
FROM
	PRODUCTOS;

-------------------
--TIPO_DOCUMENTOS--
-------------------
CREATE TABLE TIPO_DOCUMENTOS (
	CODIGO CHAR(1) NOT NULL,
	DESCRIPCION VARCHAR(20) NOT NULL,
	CONSTRAINT TIPO_DOCUMENTOS_PK PRIMARY KEY (CODIGO)
);

INSERT INTO
	PUBLIC.TIPO_DOCUMENTOS (CODIGO, DESCRIPCION)
VALUES
	('C', 'CEDULA');

INSERT INTO
	PUBLIC.TIPO_DOCUMENTOS (CODIGO, DESCRIPCION)
VALUES
	('R', 'RUC');

SELECT
	*
FROM
	TIPO_DOCUMENTOS;

---------------
--PROVEEDORES--
---------------
CREATE TABLE PROVEEDORES (
	IDENTIFICADOR VARCHAR(13) NOT NULL,
	TIPO_DOCUMENTO CHAR(1) NOT NULL,
	NOMBRE VARCHAR(100) NOT NULL,
	TELEFONO VARCHAR(20) NOT NULL,
	CORREO VARCHAR(50) NOT NULL,
	DIRECCION VARCHAR(100) NOT NULL,
	CONSTRAINT PROVEEDORES_PK PRIMARY KEY (IDENTIFICADOR),
	CONSTRAINT PROVEEDORES_TIPO_DOCUMENTOS_PK FOREIGN KEY (TIPO_DOCUMENTO) REFERENCES TIPO_DOCUMENTOS (CODIGO)
);

INSERT INTO
	PUBLIC.PROVEEDORES (
		IDENTIFICADOR,
		TIPO_DOCUMENTO,
		NOMBRE,
		TELEFONO,
		CORREO,
		DIRECCION
	)
VALUES
	(
		'1792285747',
		'C',
		'JUAN PEREZ',
		'0992920306',
		'jperez@gmail.com',
		'Cumbaya'
	);

INSERT INTO
	PUBLIC.PROVEEDORES (
		IDENTIFICADOR,
		TIPO_DOCUMENTO,
		NOMBRE,
		TELEFONO,
		CORREO,
		DIRECCION
	)
VALUES
	(
		'1792285747001',
		'R',
		'SNACKS SA',
		'0992920387',
		'snacks@gmail.com',
		'Quito'
	);

SELECT
	*
FROM
	PROVEEDORES;