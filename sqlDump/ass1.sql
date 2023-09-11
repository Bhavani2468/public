--2
select empno,ename from chinnu_emp where sal>(Select min(sal) from chinnu_emp where dept_no=20) and job!='CLERK';
--3
select dept_no from chinnu_emp group by dept_no having avg(Sal)>(select avg(Sal) from chinnu_emp where dept_no=30) and count(*)>2;
--4

--5
select dept_no from chinnu_emp where job='CLERK' and extract(year from hiredate)!=20202 group by (dept_no,job) having count(*)>1 and min(sal)=10000;
--II
select a.accno,opendate,balance,ts_date,amt from chinnu_account a,chinnu_transaction t 
where a.accno=t.accno and t.ts_date=(select ts_date from chinnu_transaction where a.accno=accno order by ts_date desc limit 1);

select * from  chinnu_transaction;


--III
--1

select distinct dept_no::text from chinnu_emp union  ((select dept_id||'*' from department) except (select dept_no||'*' from chinnu_emp group by dept_no));