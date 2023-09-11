select * from chinnu_emp;
select empno,ename,sal,AvgTab.avs,DepAvg.depAvg from chinnu_emp chinnu,(select avg(sal) avs from chinnu_emp)AvgTab,(select dept_no,avg(sal) depAvg from chinnu_emp group by dept_no)DepAvg where chinnu.dept_no=DepAvg.dept_no;
select empno,ename,sal,Tab.min,Tab.avg,Tab.max from chinnu_emp ,(select min(sal) min,avg(sal) avg,max(sal) max from chinnu_emp)Tab;

with emp1(Id,Name,Salary,dno)
		as (select empno,ename,sal,dept_no from chinnu_emp),
	 emp2(AverageSalary,depNo)
		as (select (select avg(Sal) from chinnu_emp),dept_no from chinnu_emp)
select Id,Name,Salary,AverageSalary from emp1 inner join emp2 on emp1.dno=emp2.depNo;

with employee(eid,empName,empSal,mgrid)
		as (select empno,ename,sal,mgr from chinnu_emp),
	 manager(mid,mgrSal)
     	as (select empno,sal from chinnu_emp)
select eid,empName,empSal from employee inner join manager on mgrid=mid and empSal>mgrSal;


create or replace procedure chinnu_prdHello()
as $$
declare outValue int;
begin
select 1 into outValue;
raise notice 'Hello...';
end;
$$ language plpgsql;

call chinnu_prdHello();


create or replace procedure chinnu_sum(a int,b int)
language plpgsql as
$$
declare 
sum int;
begin
sum:=a+b;
raise notice 'Sum is %',sum;
end;
$$

call chinnu_sum(5,6);

create view chinnuEmpView as select empno,ename,job,hiredate from chinnu_emp;
select * from chinnuEmpView;


create or replace procedure chinnuAltEmpView()
as
$$
begin
insert into chinnuEmpView values(123,'Chintu','Manager','2002-01-14');
update chinnuEmpView set ename='Krishna' where empno=123;
delete from chinnuEmpView where ename='ALLEN';
end;
$$ language plpgsql;

do
$$
begin
call chinnuAltEmpView();
insert into chinnuEmpView values(234,'Bittu','Developer');
raise notice 'select * from chinnuEmpView';
end;
$$

DROP FUNCTION chinnufun();

create or replace function chinnuFunc() returns table(eno numeric(4),ename text,job text,hiredate date)
as $$
declare
no int:=123;
begin
return query delete from chinnuEmpView where empno=no;
end;
$$ language plpgsql;

do
$$
begin 
select chinnuFunc() as "FunctionFun";
end;
$$

create table chinnu_account(accNo int primary key,openDate date not null,name varchar(100) not null,balance numeric not null);
create table chinnu_transaction(accNo int references chinnu_account(accNo),ts_date date not null,ts_type varchar(1) not null,amt numeric not null);

select * from chinnu_account;
select * from chinnu_transaction;

INSERT INTO chinnu_account (accNo, openDate, name, balance)
VALUES
  (1001, '2022-07-01', 'John Doe', 5000.75),
  (1002, '2020-12-15', 'Jane Smith', 10000.50),
  (1003, '2023-07-10', 'Michael Johnson', 7500.25),
  (1004, '2023-01-05', 'Emily Brown', 12000.00),
  (1005, '2021-07-20', 'Robert Lee', 9000.80);

INSERT INTO chinnu_transaction (accNo, ts_date, ts_type, amt)
VALUES
  (1001, '2022-07-02', 'D', 2000.00),
  (1001, '2022-09-05', 'W', 500.50),
  (1001, '2022-12-10', 'D', 1000.25),
  (1001, '2023-02-15', 'W', 300.75),
  (1002, '2020-12-16', 'D', 3000.00),
  (1002, '2021-12-18', 'W', 1000.50),
  (1002, '2022-12-20', 'D', 2000.25),
  (1002, '2023-01-22', 'W', 500.75),
  (1003, '2023-07-12', 'D', 1000.00),
  (1003, '2023-07-14', 'W', 200.50),
  (1003, '2023-07-16', 'D', 500.25),
  (1003, '2023-07-20', 'W', 300.75),
  (1004, '2023-01-05', 'D', 1500.00),
  (1004, '2023-02-10', 'W', 200.50),
  (1004, '2023-03-15', 'D', 1000.25),
  (1004, '2023-05-20', 'W', 300.75),
  (1005, '2021-07-20', 'D', 2500.00),
  (1005, '2022-08-25', 'W', 400.50),
  (1005, '2022-10-02', 'D', 800.25),
  (1005, '2023-04-10', 'W', 100.75);

create or replace function chinnu_getbalasondate(ano int,d date) returns numeric
as
$$
declare 
ttype varchar(1);
tamt numeric;
bal numeric;
begin
select into bal balance from chinnu_account where accno=ano;
declare datecursor cursor for select ts_type,amt from chinnu_transactioin where accno=ano and ts_date>=d;
loop
fetch datecursor into ttype,tamt;
exit when not found;
if ttype='D' then
	bal=bal-tamt;
elsif ttype='W' then
	bal=bal+tmat;
end if;
end loop;
return bal;
end;
$$
language plpgsql;

-----------------------------------------------------------------
create or replace function triggfun1() returns record
language plpgsql as $$
begin 
insert into chinnu_booo values(5,'Honey');
return (select * from chinnu_booo where id=5);
end;
$$
-------------------------------------------------------------------
create or replace function triggfun2() returns setof record
language plpgsql as $$
begin 
insert into chinnu_booo values(5,'Honey');
return query select * from chinnu_booo where id=5;
end;
$$
--------------------------------------------------------------------
create or replace function insertiontrigg() returns trigger
language plpgsql as $$
begin 
update chinnu_booo set name='Booo' where id=7;
return (new.id,new.name);   --new
end;
$$

create trigger inserttrigg 
after insert
on chinnu_booo
for each row
execute function insertiontrigg();

insert into chinnu_booo values(7,'sarvani');

------------------------------------------------------------------------

create or replace function cursorfetchtrigg() returns trigger
language plpgsql as $$
declare
idno int;
nameval varchar(100);
triggcursor cursor for select * from chinnu_booo where id=7;
begin 
--update chinnu_booo set name='Booo' where id=7;
open triggcursor;
fetch triggcursor into idno,nameval;
raise notice '% %',idno,nameval;
close triggcursor;
return new;
end;
$$

create trigger cursortrigger 
after insert
on chinnu_booo
for each row
execute function cursorfetchtrigg();

insert into chinnu_booo values(7,'sarvani');

------------------------------------------------------------------------



















