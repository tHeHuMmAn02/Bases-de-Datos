use BDBiblioteca;
CREATE TABLE TPais (
nPaisID NUMERIC(3,0) NOT NULL UNIQUE PRIMARY KEY,
cNombre VARCHAR(30) NOT NULL
);

CREATE TABLE TEditorial (
nEditorialID INT AUTO_INCREMENT PRIMARY KEY,
cNombre VARCHAR(40) NOT NULL,
nPaisID NUMERIC(3,0) DEFAULT 724
, FOREIGN KEY (nPaisID) REFERENCES TPais (nPaisID)
ON UPDATE CASCADE
ON DELETE NO ACTION
);

CREATE TABLE TSocio (
cNIF CHAR(9) NOT NULL UNIQUE PRIMARY KEY,
cNombre VARCHAR(30) NOT NULL,
cApellidos VARCHAR(60) NOT NULL,
cDireccion VARCHAR(100),
cTelefono CHAR(12) NOT NULL,
dNacimiento DATE NOT NULL,
dAlta DATE NOT NULL CHECK (dAlta >= "2003-09-01")
);

CREATE TABLE TLibro (
nLibroID numeric (3,0) NOT NULL UNIQUE PRIMARY KEY,
cTitulo VARCHAR(35) NOT NULL,
nAnyofPublication NUMERIC (4,0) NOT NULL,
nEditorialID int,
foreign key (nEditorialID) references teditorial (nEditorialID)
);





CREATE TABLE TTema (
nTemaID numeric(3,0) not null unique primary key,
cNombre varchar (30) not null
);

CREATE TABLE TAutor (
nAutorID numeric (9) not null unique primary key,
cNombre varchar (30) not null,
cApellidos varchar (40) not null
);

CREATE TABLE TEjemplar (
CSignatura varchar (30) not null unique primary key,
nLibroID numeric (3,0) not null,
foreign key (nLibroID) references tLibro (nLibroID)
);

CREATE TABLE TPrestamo (
cSignatura VARCHAR(15) NOT NULL,
cNIF CHAR(9) NOT NULL,
dPrestamo DATE NOT NULL,
PRIMARY KEY (cSignatura, cNIF, dPrestamo)
, FOREIGN KEY (cSignatura) REFERENCES TEjemplar (cSignatura)
, FOREIGN KEY (cNIF) REFERENCES TSocio (cNIF)
);

CREATE TABLE TAutorPais (
nAutorID numeric (9) NOT NULL ,
nPaisID numeric (3,0) NOT NULL,
PRIMARY KEY (nAutorID, nPaisID),
foreign key (nAutorID) references tautor (nAutorID),
foreign key (nPaisID) references tPais (nPaisID)
);

CREATE TABLE TLibroAutor (
nLibroID numeric (3,0) not null,
nAutorID numeric (9) not null,
PRIMARY KEY (nLibroID, nAutorID),
Foreign key (nLibroID) references tLibro (nLibroID),
Foreign key (nAutorID) references tautor (nAutorID)
);

CREATE TABLE TLibroTema (
nLibroID numeric (3,0) not null,
nTemaID numeric (3,0) not null,
PRIMARY KEY (nLibroID, nTemaID),
FOREIGN KEY (nLibroID) references tLibro (nLibroID),
FOREIGN KEY (nTemaID) references ttema (nTemaID)
);

