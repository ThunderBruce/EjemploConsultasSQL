CREATE DEFINER=`root`@`localhost` PROCEDURE `procalm_liga`()
BEGIN
declare v_puesto,v_pg,v_pp,v_pf,v_pc,dif int;
declare v_reslocal, v_resvisit int;
declare v_ultima_fila int default 0;
declare v_local,v_visitante,v_nom varchar(5);
declare i int default 0;

DECLARE c_puntos cursor for
select local,visitante,reslocal,resvisit 
from partido;
declare c_nombre cursor for
select nombre from equipo order by pg desc, dif desc;
declare continue handler for not found set v_ultima_fila=1;
open c_puntos;
p_cursor: loop	
fetch c_puntos into v_local,v_visitante,v_reslocal,v_resvisit;
if v_ultima_fila=1 then
		leave p_cursor; 
        end if;
update equipo set pf=pf+v_reslocal,pc=pc+v_resvisit where v_local=nombre;
update equipo set pf=pf+v_resvisit,pc=pc+v_reslocal where v_visitante=nombre;
    if(v_reslocal>v_resvisit) then
	  update equipo set pg=pg+1 where v_local=nombre;
      update equipo set pp=pp+1 where v_visitante=nombre;
	else
		update equipo set pp=pp+1 where v_local=nombre;
      update equipo set pg=pg+1 where v_visitante=nombre;
    end if;
    
    
end loop p_cursor;
close c_puntos;
update equipo set dif=(pf-pc);
set v_ultima_fila=0;
 open c_nombre;
    bucle2: loop
		fetch c_nombre into v_nom;
         if v_ultima_fila=1 then
			leave bucle2;
		end if;
        set i=i+1;
        update equipo set puesto = i where nombre=v_nom;
        
       
    end loop bucle2;
    close c_nombre;
END
