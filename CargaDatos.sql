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
select count(*) from ELECCION;

delete from PAIS where idPAIS > -1;
insert into PAIS(nombre_pais) select distinct (PAIS) from TEMPORAL;
select count(*) from PAIS;

delete from SEXO where idSEXO > -1;
insert into SEXO(tipo_sexo) select distinct (SEXO) from TEMPORAL;
select count(*) from SEXO;

delete from RAZA where idRAZA > -1;
insert into RAZA(nombreRaza) select distinct (RAZA) from TEMPORAL;
select count(*) from RAZA;

delete from PARTIDO where idPARTIDO > -1;
insert into PARTIDO(nombre_partido,siglas) select distinct (NOMBRE_PARTIDO), PARTIDO from TEMPORAL;
select count(*) from PARTIDO;

delete from MUNICIPIO where idMUNICIPIO > -1;
insert into MUNICIPIO(nombre,alfabeto,analfabeto,primaria,nivel_medio,universitario) select distinct (MUNICIPIO), ALFABETOS, ANALFABETOS, PRIMARIA, NIVELMEDIO, UNIVERSITARIOS from TEMPORAL;
select count(*) from MUNICIPIO;

delete from REGION where idREGION > -1;

	insert into REGION(region.nombreRegion, region.idPAIS) 
	select distinct TEMPORAL.region, pais.idPAIS 
	from TEMPORAL inner join pais on pais.nombre_pais = TEMPORAL.pais;
    
select distinct (p.idPAIS), t.PAIS, p.nombre_pais  from TEMPORAL AS t, PAIS AS p
where t.PAIS = p.nombre_pais;

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


















































