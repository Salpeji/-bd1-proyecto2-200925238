
/*CONSULTAS */

/* CONSULTA NO 7     */
       
select p.nombre_pais, r.nombreRegion
from pais_region pr,region r ,pais p
where pr.idPAIS = p.idPAIS  and pr.idREGION = r.idREGION;

select *,sum(v.alfabeto+analfabeto) from voto v group by v.idMUNICIPIO ;

select SUM(v.alfabeto+v.analfabeto) from voto v ;
select SUM(v.ALFABETOS+v.ANALFABETOS) from TEmporal v where PAIS= 'EL SALVADOR' and REGION ='REGION 1'; 



/* 9.- Desplegar el nombre del pais y el porcentaje de votos por raza */
select p.nombre_pais, r.nombreRaza AS nombre_raza, round( (v.idVOTO/p.idPAIS )*100, 4 ) as votos_raza 
from pais p, raza r, voto v;

select r.nombreRaza, round( (v.idVOTO/r.idRAZA)*100, 2)
from raza r, voto v;

/* 11.- Desplegar el total de votos y el porcentaje de votos 
emitidos por mujeres indigenas alfabetas*/

select p.nombre_pais, 
		v.alfabeto as votos_alfabetas_mujeres,
        round((sum(v.alfabeto)/v.idVOTO)*100, 4) as porcentaje_alfabetas_mujeres
from PAIS p, VOTO v, SEXO x, RAZA r where r.nombreRaza = 'INDIGENAS' and x.tipo_sexo = 'MUJERES';

/*total de mujeres que votaron en guatemala de las que son alfabeticas*/

select distinct( p.nombre_pais), 
v.alfabeto as votos_alfabetas_mujeres,
round((v.idVOTO/v.alfabeto)*100,3)
from VOTO v inner join RAZA r inner join SEXO x inner join PAIS p
on v.idSEXO = x.idSEXO 
and v.idRAZA = r.idRAZA
and x.tipo_sexo = 'mujeres' 
and r.nombreRaza = 'INDIGENAS';


/*VOTO v, RAZA r, SEXO x, PAIS p
where v.idRAZA = r.idRAZA and x.tipo_sexo = 'MUJERES' and r.nombreRaza = 'INDIGENAS';*/









