 /*Distribuir DATOS*/  
     
     
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
LOAD DATA LOCAL INFILE 'C:\\DATA\\ICE-Fuente.csv' INTO TABLE bd1_p2_200925238.TEMPORAL FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n' IGNORE 1 LINES(NOMBRE_ELECCION,ANO_ELECCION,PAIS,REGION,DEPTO,MUNICIPIO,PARTIDO,NOMBRE_PARTIDO,SEXO,RAZA,ANALFABETOS,ALFABETOS,PRIMARIA,NIVELMEDIO,UNIVERSITARIOS);

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
insert into MUNICIPIO(nombre,idDEPARTAMENTO)
select MUNICIPIO, (SELECT idDEPARTAMENTO FROM DEPARTAMENTO WHERE nombre_depto= DEPTO) from TEMPORAL group by municipio ;
select count(*) from MUNICIPIO;


delete from region_departamento where idREGIONDEPTO > -1;
insert into region_departamento(idREGION ,idDEPARTAMENTO)
select (select idREGION from region where nombreRegion = REGION), (select idDEPARTAMENTO from departamento where nombre_depto= DEPTO) from  TEMPORAL group by DEPTO;
select count(*) from region_departamento;



delete from PAIS_REGION where idPAISREGION > -1;
insert into PAIS_REGION(idPAIS ,idREGION)
select (select idPAIS from pais where nombre_pais= PAIS), (select idREGION from region where nombreRegion= REGION) from TEmporal where REGION in (select distinct(REGION) from temporal)  group by PAIS,REGION;
select count(*) from PAIS_REGION;

/*
delete from voto where idVOTO > -1;
insert into voto (alfabeto,analfabeto,primaria,nivel_medio,universitario)
select (ANALFABETOS,ALFABETOS,PRIMARIA,NIVELMEDIO,UNIVERSITARIOS) from  TEMPORAL
select count(*) from PAIS_REGION;
*/



/*select (select idPAIS from pais where nombre_pais= PAIS), (select idREGION from region where nombreRegion= REGION) from TEmporal where REGION in (select distinct(REGION) from temporal)  group by PAIS,REGION;*/

/*COMANDOS PRUEBA*/
/*
select * from temporal where municipio='Sensuntepeque';

SELECT * FROM municipio WHERE idDEPARTAMENTO=1

SELECT * From region_departamento where idRegion=1;
select * from municipio where nombre='Sensuntepeque';

select MUNICIPIO, ALFABETOS, ANALFABETOS, PRIMARIA, NIVELMEDIO, UNIVERSITARIOS from TEMPORAL group by municipio ;

select * from  TEmporal where MUNICIPIO ='Sensuntepeque';
*/
