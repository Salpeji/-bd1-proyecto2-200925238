select elec.nombre_eleccion, elec.anio_eleccion, p.nombre_pais, parti.nombre_partido,  AVG(count(vot.idPAIS))
from eleccion elec, pais p, partido parti, voto vot  