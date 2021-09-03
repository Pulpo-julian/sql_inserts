-- SE CREA BASE DE DATOS UNIVERSIDAD2
CREATE DATABASE universidad2;
USE universidad2;

-- TABLA PROFESOR
CREATE TABLE tblProfesor
(
    docid VARCHAR(15) NOT NULL,
    nombres VARCHAR(40) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    PRIMARY KEY(tblProfesor)
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
    docid VARCHAR(2) NOT NULL,
    descripcion VARCHAR(20) NOT NULL,
    PRIMARY KEY(docid)
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
    REFERENCES tblFacultad(docid)
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
    
)