--1 
-- Nombre de los ciclistas que pertenezcan al mismo equipo que Miguel Indurain. 
select nombre from ciclista where nomeq=(select nomeq from ciclista where nombre = 'Miguel Indurain');
--2
--Obtener el nombre de los ciclistas que han ganado más de un puerto.
select nombre,count(p.dorsal) as 'num puertos' from ciclista c join puerto p on c.dorsal=p.dorsal group by nombre having count(p.dorsal)>1;
--3 Obtén el nombre y la categoría de los puertos ganados por ciclistas del equipo ʻBanestoʼ. 
select nompuerto, categoria from puerto p join ciclista c on c.dorsal=p.dorsal where p.dorsal in (select dorsal from ciclista where nomeq='Banesto');

--4 Obtener el nombre de los ciclistas con el color de cada maillot que hayan llevado. 
select c.nombre, m.color from llevar l join ciclista c
on l.dorsal = c.dorsal
join maillot m
on l.codigo = m.codigo
GROUP by c.edad, m.color;
-- 5 Obtener el nombre o nombres de las ciudades de salida y de llegada de las etapas donde estén los dos puertos con mayor pendiente. 
select e.salida, e.llegada, p.pendiente from etapa e join puerto p
on e.netapa = p.netapa
order by pendiente desc
limit 2;
--6 Obtener el nombre de los ciclistas que pertenezcan a un equipo que tenga mas de cinco corredores y que hayan ganado alguna etapa indicando
-- cuantas etapas han ganado
select nombre, count(e.dorsal) as 'Num_etapas' from ciclista c join etapa e on c.dorsal=e.dorsal
where c.nomeq in(select nomeq from ciclista group by nomeq having count(nomeq)>5);
--7 Obtener el nombre de los ciclistas que han ganado todos los puertos de una etapa y además han ganado esa misma etapa. 
select c.nombre, c.dorsal, e.dorsal,p.dorsal from ciclista c join puerto p
on c.dorsal=p.dorsal join etapa e
on c.dorsal=e.dorsal 
where e.netapa in(select p.netapa from puerto p where p.dorsal=e.dorsal);

select e.dorsal, p.netapa from etapa e join puerto p
on e.dorsal=p.dorsal
where e.netapa=p.netapa 
group by e.dorsal,p.dorsal;
select dorsal, count(dorsal) from puerto where dorsal = (select dorsal from etapa);
 