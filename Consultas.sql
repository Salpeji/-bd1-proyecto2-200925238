
/*CONSULTAS */

/* CONSULTA NO 7     */
       
select p.nombre_pais, r.nombreRegion
from pais_region pr,region r ,pais p
where pr.idPAIS = p.idPAIS  and pr.idREGION = r.idREGION;

select *,sum(v.alfabeto+analfabeto) from voto v group by v.idMUNICIPIO ;

select SUM(v.alfabeto+v.analfabeto) from voto v ;
select SUM(v.ALFABETOS+v.ANALFABETOS) from TEmporal v where PAIS= 'EL SALVADOR' and REGION ='REGION 1'; 