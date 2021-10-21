drop database bd1_p2_200925238;
# --- ELIMINACION DE BD ---
create database bd1_p2_200925238;
use bd1_p2_200925238;

# ---- Tablas ER -----
create table MUNICIPIO(
idMUNICIPIO int primary key AUTO_INCREMENT,
nombre varchar(255),
alfabeto varchar(255),
analfabeto varchar(255),
primaria int,
nivel_medio int,
universitario int
);	

create table PARTIDO(
idPARTIDO int primary key AUTO_INCREMENT, 
nombre_partido varchar(255),
siglas varchar(150)
);

create table DEPARTAMENTO(
idDEPARTAMENTO int primary key AUTO_INCREMENT,
nombre_depto varchar(255)
);

create table VOTO(
idVOTO int primary key AUTO_INCREMENT
);

create table RAZA(
idRAZA int primary key AUTO_INCREMENT,
nombreRaza varchar(255)
);

create table REGION(
idREGION int primary key AUTO_INCREMENT,
nombreRegion varchar(255)
);

create table ELECCION(
idELECCION int primary key AUTO_INCREMENT, 
nombre_eleccion varchar(255),
anio_eleccion int
);

create table SEXO(
idSEXO int primary key AUTO_INCREMENT,
tipo_sexo varchar(255)
);

create table PAIS(
idPAIS int primary key AUTO_INCREMENT,
nombre_pais varchar(255)
);

# ---  llaves Foraneas ---
ALTER TABLE MUNICIPIO 
    ADD COLUMN idDEPARTAMENTO INT,
	ADD CONSTRAINT `fk_relacion_MUNICIPIO_DEPARTAMENTO` FOREIGN KEY (idDEPARTAMENTO)
       REFERENCES DEPARTAMENTO(idDEPARTAMENTO);
       
ALTER TABLE MUNICIPIO
ADD COLUMN idVOTO INT,
	ADD CONSTRAINT `fk_relacion_MUNICIPIO_VOTO` FOREIGN KEY (idVOTO)
		REFERENCES VOTO(idVOTO);

ALTER TABLE VOTO
ADD COLUMN idPARTIDO INT,
	ADD CONSTRAINT `fk_relacion_VOTO_PARTIDO` FOREIGN KEY (idPARTIDO)
		REFERENCES PARTIDO(idPARTIDO);

ALTER TABLE VOTO
ADD COLUMN idRAZA INT,
	ADD CONSTRAINT `fk_relacion_VOTO_RAZA` FOREIGN KEY (idRAZA)
		REFERENCES RAZA(idRAZA);

ALTER TABLE VOTO
ADD COLUMN idSEXO INT,
	ADD CONSTRAINT `fk_relacion_VOTO_SEXO` FOREIGN KEY (idSEXO)
		REFERENCES SEXO(idSEXO);

ALTER TABLE VOTO
ADD COLUMN idELECCION INT,
	ADD CONSTRAINT `fk_relacion_VOTO_ELECCION` FOREIGN KEY (idELECCION)
		REFERENCES ELECCION(idELECCION);

ALTER TABLE DEPARTAMENTO
ADD COLUMN idREGION INT,
	ADD CONSTRAINT `fk_relacion_DEPARTAMENTO_REGION` FOREIGN KEY (idREGION)
		REFERENCES REGION(idREGION);        

ALTER TABLE REGION
ADD COLUMN idPAIS INT,
	ADD CONSTRAINT `fk_relacion_REGION_PAIS` FOREIGN KEY (idPAIS)
		REFERENCES PAIS(idPAIS);        







