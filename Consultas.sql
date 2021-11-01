/*CONSULTAS */

/* 7.- Desplegar el nombre del país, la región y el promedio de votos por departamento. 
        Por ejemplo: si la región tiene tres departamentos, se debe sumar todos los votos 
        de la región y dividirlo dentro de tres (número de departamentos de la región)     */
select t.PAIS as 'nombre_pais', 
		t.REGION as 'descripcion_region', 
		round( SUM(alfabetos+analfabetos)/1, 4) as 'total_votos' 
	from temporal  as t 
	group by pais,region;

/* 9.- Desplegar el nombre del pais y el porcentaje de votos por raza */
select p.nombre_pais, r.nombreRaza AS nombre_raza,
		round( (v.idVOTO/p.idPAIS )*100, 4 ) as votos_raza 
from pais p, raza r, voto v;

/* 11.- Desplegar el total de votos y el porcentaje de votos 
emitidos por mujeres indigenas alfabetas*/
















