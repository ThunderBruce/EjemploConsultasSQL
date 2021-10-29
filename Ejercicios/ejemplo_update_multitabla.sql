drop table if exists emp;
drop table if exists emp_act;


create table emp (
empno int,
salario int)engine=innodb;


create table emp_act (
empno int,
salario int)engine=innodb;

delete from emp;
insert into emp values(1,100),(2,200),(3,300),(4,400),(5,500),(6,600);
delete from emp_act;
insert into emp_act values(1,50),(3,40),(4,30);


--sentencia update multi-tabla
update emp x,emp_act y set x.salario=y.salario
where x.empno=y.empno;

--sentencia equivalente update mono-tabla
update emp x
set salario=(select salario
               from emp_act
				where empno=x.empno)
where empno=(select empno
		from emp_act
				where empno=x.empno);
				
--sentencia update multi-tabla con outer join
update emp x left join emp_act y 
on x.empno=y.empno
set x.salario=y.salario;

--sentencia equivalente update mono-tabla
update emp x
set salario=(select salario
               from emp_act
				where empno=x.empno);