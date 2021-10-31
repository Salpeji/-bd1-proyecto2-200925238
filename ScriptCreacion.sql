# --- ELIMINACION DE BD ---
drop database if exists bd1_p2_200925238;

create database bd1_p2_200925238;
use bd1_p2_200925238;

# ---- Tablas ER -----
create table MUNICIPIO(
idMUNICIPIO int primary key AUTO_INCREMENT,
nombre varchar(255)
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
idVOTO int primary key auto_increment,
alfabeto varchar(255),
analfabeto varchar(255),
primaria int,
nivel_medio int,
universitario int
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

create table REGION_DEPARTAMENTO(
idREGIONDEPTO int primary key AUTO_INCREMENT
);

create table PAIS_REGION(
idPAISREGION int primary key AUTO_INCREMENT
);

# ---  llaves Foraneas ---
ALTER TABLE MUNICIPIO
    ADD COLUMN idDEPARTAMENTO INT NOT NULL,
ADD CONSTRAINT `fk_relacion_MUNICIPIO_DEPARTAMENTO` FOREIGN KEY (idDEPARTAMENTO)
       REFERENCES DEPARTAMENTO(idDEPARTAMENTO);
     
ALTER TABLE REGION_DEPARTAMENTO
    ADD COLUMN idREGION INT NOT NULL,
ADD CONSTRAINT `fk_relacion_REGIONDEPTO_REGION` FOREIGN KEY (idREGION)
       REFERENCES REGION(idREGION);  


ALTER TABLE REGION_DEPARTAMENTO
    ADD COLUMN idDEPARTAMENTO INT NOT NULL,
ADD CONSTRAINT `fk_relacion_REGIONDEPTO_DEPTO` FOREIGN KEY (idDEPARTAMENTO)
       REFERENCES DEPARTAMENTO(idDEPARTAMENTO);



ALTER TABLE PAIS_REGION
    ADD COLUMN idPAIS INT NOT NULL,
ADD CONSTRAINT `fk_relacion_PAISREGION_PAIS` FOREIGN KEY (idPAIS)
       REFERENCES PAIS(idPAIS);  


ALTER TABLE PAIS_REGION
    ADD COLUMN idREGION INT NOT NULL,
ADD CONSTRAINT `fk_relacion_PAISREGION_REGION` FOREIGN KEY (idREGION)
       REFERENCES REGION(idREGION);
       
ALTER TABLE voto
    ADD COLUMN idMUNICIPIO INT NOT NULL,
ADD CONSTRAINT `fk_relacion_VOTO_MUNICIPIO` FOREIGN KEY (idMUNICIPIO)
       REFERENCES MUNICIPIO(idMUNICIPIO);
     
       
ALTER TABLE voto
    ADD COLUMN idRAZA INT NOT NULL,
ADD CONSTRAINT `fk_relacion_VOTO_RAZA` FOREIGN KEY (idRAZA)
       REFERENCES RAZA(idRAZA);      
     
ALTER TABLE voto
    ADD COLUMN idSEXO INT NOT NULL,
ADD CONSTRAINT `fk_relacion_VOTO_SEXO` FOREIGN KEY (idSEXO)
       REFERENCES SEXO(idSEXO);    
     
ALTER TABLE voto
    ADD COLUMN idELECCION INT NOT NULL,
ADD CONSTRAINT `fk_relacion_VOTO_ELECCION` FOREIGN KEY (idELECCION)
       REFERENCES ELECCION(idELECCION);        