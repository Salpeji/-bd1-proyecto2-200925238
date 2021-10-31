# ---- TEMPORAL
SET GLOBAL local_infile=1;
use bd1_p2_200925238;
DROP TABLE IF EXISTS TEMPORAL;

CREATE TEMPORARY TABLE TEMPORAL (
NOMBRE_ELECCION VARCHAR(255) NOT NULL, 
ANO_ELECCION INT NOT NULL,
PAIS VARCHAR(255) NOT NULL,
REGION  VARCHAR(255) NOT NULL,
DEPTO VARCHAR(255) NOT NULL,
MUNICIPIO VARCHAR(255) NOT NULL,
PARTIDO VARCHAR(255) NOT NULL,
NOMBRE_PARTIDO VARCHAR(255) NOT NULL,
SEXO VARCHAR(255) NOT NULL,
RAZA VARCHAR(255) NOT NULL,
ANALFABETOS INT NOT NULL,
ALFABETOS INT NOT NULL,
PRIMARIA INT NOT NULL,
NIVELMEDIO INT NOT NULL,
UNIVERSITARIOS INT NOT NULL
);
LOAD DATA LOCAL INFILE 'ICE-Fuente.csv' INTO TABLE bd1_p2_200925238.TEMPORAL FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n' IGNORE 1 LINES(NOMBRE_ELECCION,ANO_ELECCION,PAIS,REGION,DEPTO,MUNICIPIO,PARTIDO,NOMBRE_PARTIDO,SEXO,RAZA,ANALFABETOS,ALFABETOS,PRIMARIA,NIVELMEDIO,UNIVERSITARIOS);




# ---- Carga ER ----
delete from eleccion where idELECCION > -1;
insert into eleccion(anio_eleccion, nombre_eleccion) select distinct (ANO_ELECCION), NOMBRE_ELECCION from TEMPORAL;
select * from ELECCION;

delete from PAIS where idPAIS > -1;
insert into PAIS(nombre_pais) select distinct (PAIS) from TEMPORAL;
select * from PAIS;

delete from SEXO where idSEXO > -1;
insert into SEXO(tipo_sexo) select distinct (SEXO) from TEMPORAL;
select * from SEXO;

delete from RAZA where idRAZA > -1;
insert into RAZA(nombreRaza) select distinct (RAZA) from TEMPORAL;
select * from RAZA;


delete from PARTIDO where idPARTIDO > -1;
insert into PARTIDO(nombre_partido,siglas) select distinct (NOMBRE_PARTIDO), PARTIDO from TEMPORAL;
select * from PARTIDO;

delete from REGION where idRegion > -1;
insert into REGION(nombreRegion) select distinct (REGION) from TEMPORAL;
select * from REGION;

delete from DEPARTAMENTO where idDepartamento > -1;
insert into DEPARTAMENTO(nombre_depto) select distinct (DEPTO) from TEMPORAL;
select * from DEPARTAMENTO;


delete from MUNICIPIO where idMUNICIPIO > -1;
insert into MUNICIPIO(nombre,alfabeto,analfabeto,primaria,nivel_medio,universitario,idPAIS,idDEPARTAMENTO,idREGION ) 
select distinct (MUNICIPIO), ALFABETOS, ANALFABETOS, PRIMARIA, NIVELMEDIO, UNIVERSITARIOS, (SELECT idPAIS FROM PAIS WHERE nombre_pais=PAIS ) ,(SELECT idDEPARTAMENTO FROM DEPARTAMENTO WHERE nombre_depto= DEPTO) , (SELECT idREGION FROM REGION WHERE nombreRegion= REGION) from TEMPORAL;
select count(*) from MUNICIPIO;


delete from VOTO where idVOTO > -1;
insert into VOTO(idSEXO, idRAZA,idPARTIDO,idELECCION,idMUNICIPIO)  
  select (SELECT idSEXO FROM SEXO WHERE tipo_sexo = SEXO),
         (SELECT idRAZA FROM RAZA WHERE nombreRaza = RAZA),
         (SELECT idPARTIDO FROM PARTIDO WHERE nombre_partido = NOMBRE_PARTIDO LIMIT 1), 
         (SELECT idELECCION FROM ELECCION WHERE nombre_eleccion = NOMBRE_ELECCION LIMIT 1),
         (SELECT idMUNICIPIO FROM MUNICIPIO WHERE nombre = MUNICIPIO LIMIT 1)
  from TEMPORAL;
select count(*) from VOTO;



/*SELECT (SELECT idMUNICIPIO FROM MUNICIPIO WHERE nombre = MUNICIPIO) FROM TEMPORAL;*/
/*
delete from VOTO where idVOTO > -1;
insert into VOTO(idPARTIDO)  
select (SELECT idPARTIDO FROM PARTIDO WHERE nombre_partido = PARTIDO) from TEMPORAL;
select count(*) from VOTO;*/

/*
delete from VOTO where idVOTO > -1;
insert into VOTO(idRAZA)  
select (SELECT idRAZA FROM RAZA WHERE nombreRaza = T.RAZA) from TEMPORAL AS T;
select count(*) from VOTO;*/
/*

delete from VOTO where idVOTO > -1;
insert into VOTO(idPARTIDO)  
select (SELECT idPARTIDO FROM PARTIDO WHERE nombre_partido = PARTIDO) from TEMPORAL;
select count(*) from VOTO;

/*

idDEPARTAMENTO,idREGION,
(SELECT idPAIS FROM PAIS WHERE nombre_pais=PAIS )  as IdPAIS 
 (SELECT idDEPARTAMENTO FROM DEPARTAMENTO WHERE nombre_depto= DEPTO) , (SELECT idREGION FROM REGION WHERE nombreRegion= REGION),
delete from MUNICIPIO where idMUNICIPIO > -1;
insert into MUNICIPIO(nombre,alfabeto,analfabeto,primaria,nivel_medio,universitario) select distinct (MUNICIPIO), ALFABETOS, ANALFABETOS, PRIMARIA, NIVELMEDIO, UNIVERSITARIOS from TEMPORAL;
select count(*) from MUNICIPIO;







/*
delete from DEPARTAMENTO where idDEPARTAMENTO > -1;
insert into DEPARTAMENTO (DEPARTAMENTO.nombre_depto, DEPARTAMENTO.idRegion) select distinct TEMPORAL.depto, REGION.idRegion from TEMPORAL inner join REGION on region.nombreRegion = TEMPORAL.REGION inner join PAIS on PAIS.nombre_pais = TEMPORAL.PAIS and PAIS.idPAIS = REGION.idPAIS;
select count(*) from DEPARTAMENTO;
*/

/*
delete from VOTO where idVOTO > 1;
INSERT INTO VOTO (VOTO.idRAZA, VOTO.idELECCION, 
				  VOTO.idPARTIDO, VOTO.idSEXO)
    SELECT distinct
        RAZA.idRAZA,
        ELECCION.idELECCION,
        PARTIDO.idPARTIDO,
        SEXO.idSEXO
    FROM TEMPORAL
        INNER JOIN PAIS ON PAIS.nombre_pais = TEMPORAL.pais 
        INNER JOIN REGION ON REGION.nombreRegion = TEMPORAL.region AND REGION.idPAIS = PAIS.idPAIS
        INNER JOIN DEPARTAMENTO ON DEPARTAMENTO.nombre_depto = TEMPORAL.depto AND DEPARTAMENTO.idREGION = REGION.idRegion
        INNER JOIN RAZA ON RAZA.nombreRaza = TEMPORAL.RAZA
        INNER JOIN ELECCION ON ELECCION.nombre_eleccion = TEMPORAL.NOMBRE_ELECCION AND ELECCION.anio_eleccion = TEMPORAL.ANO_ELECCION
        INNER JOIN PARTIDO ON PARTIDO.nombre_partido = TEMPORAL.NOMBRE_PARTIDO
        INNER JOIN SEXO ON SEXO.tipo_sexo = TEMPORAL.SEXO;
select count(*) from VOTO;
        
  */      


















































