

--Confederación con más goles en una temporada


SELECT * FROM (SELECT lc.CONFEDERATION , SUM(hc.SUMA) as GOLES_TOTALES  
FROM H_CONF hc , D_LIST_CONF lc,D_TIEMPO t ,  D_PARTIDOS_CONF pc
where hc.DCONFEPK=lc.ID_CONFEDERACION  and t.DTIEMPOPK= hc.DTIEMPOPK
and pc.ID_PARTIDO = hc.DPARTIDOSPK
and pc.FECHA = t.FECHA and 
t.TEMPORADA='11-12'
GROUP BY lc.CONFEDERATION   ORDER BY GOLES_TOTALES DESC) where rownum=1;



--Confederación con menos goles en una temporada



SELECT * FROM (SELECT lc.CONFEDERATION , SUM(hc.SUMA) as GOLES_TOTALES  
FROM H_CONF hc , D_LIST_CONF lc,D_TIEMPO t ,  D_PARTIDOS_CONF pc
where hc.DCONFEPK=lc.ID_CONFEDERACION  and t.DTIEMPOPK= hc.DTIEMPOPK
and pc.ID_PARTIDO = hc.DPARTIDOSPK
and pc.FECHA = t.FECHA and 
t.TEMPORADA='11-12'
GROUP BY lc.CONFEDERATION   ORDER BY GOLES_TOTALES ASC) where rownum=1;


--Confederación con más goles en el histórico



SELECT * FROM (SELECT CONFEDERATION, SUM(SUMA) as GOLES_TOTALES  
FROM H_CONF, D_LIST_CONF where ID_CONFEDERACION=DCONFEPK  
GROUP BY CONFEDERATION  ORDER BY GOLES_TOTALES DESC) where rownum=1;


--Confederación con menos goles en el histórico 



SELECT * FROM (SELECT CONFEDERATION, SUM(SUMA) as GOLES_TOTALES  
FROM H_CONF, D_LIST_CONF where ID_CONFEDERACION=DCONFEPK  
GROUP BY CONFEDERATION  ORDER BY GOLES_TOTALES ASC  )where rownum=1;

--Confederación con más cantidad de partidos 


SELECT * FROM( SELECT CONFEDERATION, COUNT(DPARTIDOSPK) as TOTAL_PARTIDOS  
FROM H_CONF, D_LIST_CONF l 
where ID_CONFEDERACION=DCONFEPK  
GROUP BY CONFEDERATION  ORDER BY TOTAL_PARTIDOS DESC)where rownum=1;


