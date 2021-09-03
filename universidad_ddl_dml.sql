-- SE CREA BASE DE DATOS UNIVERSIDAD2
CREATE DATABASE universidad2;
USE universidad2;

-- TABLA PROFESOR
CREATE TABLE tblProfesor
(
    docid VARCHAR(15) NOT NULL,
    nombres VARCHAR(40) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    PRIMARY KEY(docid)
);

-- TABLA MATERIA
CREATE TABLE tblMateria
(
    codigo VARCHAR(2) NOT NULL,
    descripcion VARCHAR(20) NOT NULL,
    -- FK
    profesor VARCHAR(15),
    PRIMARY KEY(codigo),
    -- SE TRAEN FK
    CONSTRAINT tblProfesor_tblmateria_profesor FOREIGN KEY(profesor)
    REFERENCES tblProfesor(docid)
);

-- SE CREA TABLA FACULTAD
CREATE TABLE tblFacultad
(
    codigo VARCHAR(2) NOT NULL,
    descripcion VARCHAR(20) NOT NULL,
    PRIMARY KEY(codigo)
);

-- SE CREA TABLA CARRERA
CREATE TABLE tblCarrera
(
    codigo VARCHAR(4) NOT NULL,
    descripcion VARCHAR(30) NOT NULL,
    -- FK
    facultad VARCHAR(2),
    PRIMARY KEY(codigo),
    -- SE TRAEN FK
    CONSTRAINT tblFacultad_tblCarrera_facultad FOREIGN KEY(facultad)
    REFERENCES tblFacultad(codigo)
);

-- SE CREA TABLA ESTUDIANTES
CREATE TABLE tblEstudiantes
(
    docid VARCHAR(15) NOT NULL,
    nombres VARCHAR(40) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    direccion VARCHAR(70) NOT NULL,
    -- FK.. EN EL DOCUMENTO PARECE "CIUDAD" PERO NO TIENE SENTIDO CON LA TABLA CARRERA
    -- ENTONCES LO NOMBRO "CARRERA"
    carrera VARCHAR(4),
    grado INT(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    saldo INT NOT NULL,
    PRIMARY KEY(docid),
    -- SE TRAEN FK
    CONSTRAINT tblCarrera_tblEstudiantes_carrera FOREIGN KEY(carrera)
    REFERENCES tblCarrera(codigo)
);

-- SE CREA TABLA CON CLAVES COMPUESTAS
CREATE TABLE tblMateriaEstudiante 
(
    docidestudiante VARCHAR(15) NOT NULL,
    codmateria VARCHAR(2) NOT NULL,
    PRIMARY KEY(docidestudiante, codmateria),
    -- LOS DOS CAMP0S SON FK ASI QUE SE TRAEN
    CONSTRAINT tblEstud_tblmatest_docidest FOREIGN KEY(docidestudiante)
    REFERENCES tblEstudiantes(docid),
    CONSTRAINT tblEstud_tblMat_codmat FOREIGN KEY(codmateria)
    REFERENCES tblMateria(codigo)
);

-- INICIO CON EL PUNTO 2 YA QUE EL 1 NECESITA DATOS DE OTRA TABLA
-- INGRESO 3 REGISTROS EN TABLA PROFESOR
INSERT INTO tblProfesor VALUES
('1','alejandra','guzman'),
('2','fabricio','guzman'),
('3','el','sapo XD XDDD');

-- INGRESO 3 REGISTROS EN LA TABLA FACULTAD
INSERT INTO tblFacultad VALUES
('1','Ingenieria'),
('2','Medicina'),
('3','Artes');

-- PUNTO 1 INGRESO 3 REGISTROS EN LA TABLA CARRERA
INSERT INTO tblCarrera VALUES
('1','ingenieria informatica','1'),
('2','medicina','2'),
('3','ingenieria en sistemas','1');

--PUNTO 3 INGRESO 3 REGISTROS EN LA TABLA ESTUDIANTES
INSERT INTO tblEstudiantes VALUES
('1','Maria Alejandra','Martinez', 'CLL 23 n56', '1', '9', 'maria@universidad.com', 0),
('2','mario andres','mejia', 'CLL 26 n58', '2', '8', 'mario@universidad.com', 12000),
('56482156','jose luis','gonzales', 'CLL 11 n12', '3', '5', 'jose@universidad.com', 26000);

--PUNTO 5
INSERT INTO tblProfesor VALUES
('15425485','marta','bolaños');

UPDATE tblProfesor SET apellidos = 'Rodriguez Gomez' WHERE docid = '15425485';

-- PUNTO 6 NO DA SI TENEMOS UN DATO DE MAS DE 2 CARACTERES
ALTER TABLE tblMateria CHANGE codigo codigo VARCHAR(15) NOT NULL; -- QUEDA COMO PK
INSERT INTO tblMateria VALUES
('48AS36','matematicas','2');

UPDATE tblMateria SET descripcion = 'Estructura de datos' WHERE codigo = '48AS36';

-- PUNTO 7 

UPDATE tblEstudiantes SET saldo = 1325280 WHERE docid = '56482156';

-- PUNTO 8 NO HAY CAMPO SALARIO
ALTER TABLE tblProfesor ADD COLUMN salario INT NOT NULL;
UPDATE tblProfesor SET salario = 2200000 WHERE salario = 0;
UPDATE tblProfesor SET salario = 1500000 WHERE docid = 1;

DELETE FROM tblProfesor WHERE salario <= 2000000;

-- PUNTO 9 
DELETE FROM tblEstudiantes WHERE grado >= 6;

-- PUNTO 10 
INSERT INTO tblFacultad VALUES 
('M1', 'artes');

DELETE FROM tblFacultad WHERE codigo = 'M1';
