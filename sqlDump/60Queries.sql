CREATE TABLE chinnu_emp (
   empno INT,
   ename VARCHAR(255),
   job VARCHAR(255),
   mgr INT,
   hiredate DATE,
   sal DECIMAL(8,2),
   comm DECIMAL(8,2),
   dept_no INT
 );

 INSERT INTO chinnu_emp (empno, ename, job, mgr, hiredate, sal, comm, dept_no)
 VALUES
   (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.0, 300, 20),
   (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.0, 500, 30),
   (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.0, NULL, 20),
   (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.0, 1400, 30),
   (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.0, NULL, 30),
   (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.0, NULL, 10),
    (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.0, 0.0, 30),
   (7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100.0, NULL, 20),
   (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950.0, NULL, 30),
   (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.0, NULL, 20),
   (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.0, NULL, 10),
   (1234, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.0, NULL, 20),
   (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.0, 300, 30),
--   (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.0, 300, 10),
   (7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000.0, NULL, 20),
  (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.0, NULL, 10),
  (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.0, 0, 30),
   (7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100.0, NULL, 20),
   (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950.0, NULL, 30),
   (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.0, NULL, 20),
   (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.0, NULL, 10),
   (1234, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.0, NULL, 20),
   (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.0, 300, 30),
   (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.0, 300, 10);

select * from chinnu_emp;


select empno, ename, job,hiredate from chinnu_emp where dept_no=10;	--1

select ename,sal from chinnu_emp where job='CLERK';					--2

select ename,sal,comm from chinnu_emp where hiredate='1980-12-17';	--3

select ename,sal,comm from chinnu_emp where comm>sal;				--4

select ename,sal,sal/30,(sal/30)/24 from chinnu_emp;				--5

select ename,sal as monthly,sal/30 as daily,(sal/30)/24 as hourly from chinnu_emp;		--6

select ename,empno from chinnu_emp where job='MANAGER' and sal>=2600 order by ename;	--7

select * from chinnu_emp where job='MANAGER' or job='PRESIDENT' order by ename;			--8

select ename from chinnu_emp where ename not like '%S';				--9

select ename from chinnu_emp where ename like 'C%';					--10

select ename from chinnu_emp where ename>='C' and ename<='F';		--11

select ename from chinnu_emp where ename like 'I%R';				--12

select ename from chinnu_emp where ename like '%TII%' or ename like '%LL%';				--13

select * from chinnu_emp where extract(year from hiredate)=1983;	--14

select concat(ename ,' has held the position of ',job,'in department number ',dept_no,'since ',hiredate) from chinnu_emp where job='CLERK' and dept_no=20 and hiredate='1983-06-13';		--15

select empno, ename, job, mgr, hiredate, sal, coalesce(comm,'0') as comm, dept_no from chinnu_emp;		--16

select * from chinnu_emp where job='CLERK';							--17

select * from chinnu_emp where comm is null;							--18

select distinct length(ename) from chinnu_emp;						--19

select ename,to_char(hiredate,'DD-MM-YY') from chinnu_emp where dept_no=20;			--20

select (current_date-hiredate)/30 from chinnu_emp where job='PRESIDENT';			--21

select * from chinnu_emp where extract(month from hiredate)=12;						--22

select ename,job, 1 as JOBCLASS from chinnu_emp where job='CLERK' union select ename,job,3 as JOBCLASS from chinnu_emp where job='MANAGER' union select ename,job,5 as JOBCLASS from chinnu_emp where job='PRESIDENT' union select ename,job,2 as JOBCLASS from chinnu_emp where job not in ('CLERK','MANAGER','PRESIDENT') ;			--23

select ename,job,
case
 when job='CLERK' then 1 
 when job='MANAGER' then 3 
 when job='MANAGER' then 5 
 else 2 
end as JOBCLASS
from chinnu_emp;														--23

--select ename,job,if(job='CLERK',1,if(job='MANAGER',3,if(job='PRESIDENT',5,2))) as jobclass from chinnu_emp;

select dept_no,job,24*avg(sal) from chinnu_emp group by (dept_no,job);		--24

select distinct (select count(dept_no) from chinnu_emp where dept_no=30 and sal>0 and comm is null) as sal_count,(select count(dept_no) from chinnu_emp where dept_no=30 and sal>0 and comm is not null) as comm_count from chinnu_emp;				--25

select avg(sal),min(Sal),max(Sal) from chinnu_emp group by job having job='CLERK' or job='MANAGER';			--26

select dept_no from chinnu_emp where job='CLERK' or job='MANAGER'group by (dept_no,job) having (job='CLERK' and count(job)>2) or (job='MANAGER' and count(job)>3);		--27

select dept_no,12*(sum(sal)+(select sum(comm) from chinnu_emp)+100*(select count(comm) from chinnu_emp where comm is null)) as compensation_sum from chinnu_emp group by dept_no;		--28

--select not distinct from chinnu_emp;				--29

--select ename,job from chinnu_emp where job in ('CLERK','MANAGER','SALESMAN');			--30

SELECT empno FROM chinnu_emp GROUP BY empno HAVING COUNT(DISTINCT dept_no) = (SELECT COUNT(DISTINCT dept_no) FROM chinnu_emp);			--31

select 'Ename ' ||E'\t\t'||' Date Hired'||E'\n'||'****'||E'\t\t'||'*********'||E'\n'||'Smith 		June,thirteen 1983 '||E'\n'||'Jones		October, thirty first 1983';		--33

select empno,ename,job,mgr,hiredate,case when sal>1500 then cast(sal as text) when sal=1500 then 'on target' else 'Below '|| 1500 end as sal,comm,dept_no from chinnu_emp;			--34



SELECt date_trunc('month', current_date) + INTERVAL '1 month' - INTERVAL '1 day' -
    CASE
        WHEN EXTRACT(DOW FROM date_trunc('month', current_date) + INTERVAL '1 month' - INTERVAL '1 day') >= 5 THEN
            EXTRACT(DOW FROM date_trunc('month', current_date) + INTERVAL '1 month' - INTERVAL '1 day') - 5
        ELSE
            EXTRACT(DOW FROM date_trunc('month', current_date) + INTERVAL '1 month' - INTERVAL '1 day') + 2
    END * INTERVAL '1 day' AS last_friday_of_month;



select distinct ename,
	case
    	when extract(day from hiredate)<=15 then 
        		date_trunc('month', hiredate + INTERVAL '1 month' - INTERVAL '1 day' -
    			case
        			when extract(DOW FROM date_trunc('month', hiredate) + INTERVAL '1 month' - INTERVAL '1 day') >= 5 THEN
            			(extract(DOW FROM date_trunc('month', hiredate) + INTERVAL '1 month' - INTERVAL '1 day') - 5)
       			 else
           			(extract(DOW FROM date_trunc('month', hiredate) + INTERVAL '1 month' - INTERVAL '1 day') + 2)
   				 end * INTERVAL '1 day' 
       	else
				date_trunc('month', hiredate + INTERVAL '2 month' - INTERVAL '1 day' -
    			case
        			when extract(DOW FROM date_trunc('month', hiredate) + INTERVAL '2 month' - INTERVAL '1 day') >= 5 THEN
            			extract(DOW FROM date_trunc('month', hiredate) + INTERVAL '2 month' - INTERVAL '1 day') - 5
       			 else
           			extract(DOW FROM date_trunc('month', hiredate) + INTERVAL '2 month' - INTERVAL '1 day') + 2
   				 end * INTERVAL '1 day'
	end as first_pay_date,hiredate from chinnu_emp order by hiredate;



SELECT DISTINCT
    ename,
    CASE
        WHEN extract(day from hiredate) <= 15 THEN
            date_trunc('month', hiredate) + INTERVAL '1 month' - INTERVAL '1 day' -
            CASE
                WHEN extract(DOW FROM date_trunc('month', hiredate) + INTERVAL '1 month' - INTERVAL '1 day') >= 5 THEN
                    CASE
                        WHEN extract(DOW FROM date_trunc('month', hiredate) + INTERVAL '1 month' - INTERVAL '1 day') = 5 THEN INTERVAL '3 days'
                        ELSE INTERVAL '2 days'
                    END
                ELSE INTERVAL '1 day'
            END
        ELSE
            date_trunc('month', hiredate) + INTERVAL '1 months' - INTERVAL '1 day' +
            CASE
                WHEN extract(DOW FROM date_trunc('month', hiredate) + INTERVAL '1 months' - INTERVAL '1 day') >= 5 THEN
                    CASE
                        WHEN extract(DOW FROM date_trunc('month', hiredate) + INTERVAL '1 months' - INTERVAL '1 day') = 5 THEN INTERVAL '3 days'
                        ELSE INTERVAL '2 days'
                    END
                ELSE INTERVAL '1 day'
            END
    END AS first_pay_date,
    hiredate
FROM chinnu_emp
ORDER BY hiredate;



select sal,sal-(select avg(sal) from chinnu_emp) from chinnu_emp;		---36

select count(distinct empno) as emp_count,count(distinct dept_no) as dept_count from chinnu_emp;		--37

select avg(Sal) from chinnu_emp;		--38
                           
select dept_no,job,avg(Sal) from chinnu_emp group by (dept_no,job);		--40

select job from chinnu_emp group by job having min(sal)>=3000;    	--41                       
                           
select (avg(sal)+(select avg(comm) from chinnu_emp where comm is not null)) as avg,sum(sal)+(select sum(comm) from chinnu_emp where comm is not null) as sum from chinnu_emp group by dept_no;  			--42                      
                           
select max(sal)-min(sal) from chinnu_emp;  		--43
                           
select dept_no from chinnu_emp group by dept_no having count(*)>3;   		--44
                           
select empno,count(empno) from chinnu_emp group by empno having count(empno)>1;				--45
                           
select ename,mgr from chinnu_emp a where sal=(select min(Sal) from chinnu_emp where mgr=a.mgr group by mgr); 			--46
                           
select ename from chinnu_emp a where hiredate<(select hiredate from chinnu_emp where empno=a.mgr);			--50
                           
select ename from chinnu_emp a where sal>(select min(sal) from chinnu_emp where dept_no=a.dept_no group by dept_no);			--51
                           
select ename from chinnu_emp where sal>(select min(sal) from chinnu_emp where dept_no=30 group by dept_no);			--52
                           
select ename from chinnu_emp where sal>(select max(sal) from chinnu_emp where dept_no=30 group by dept_no);   			--53                        
                           
select job from chinnu_emp where sal=(Select max(sal) from chinnu_emp);			--54
                           
select ename,job,hiredate from chinnu_emp a where sal>(select max(sal) from chinnu_emp where job='SALESMAN' and dept_no=a.dept_no );			--55
                           
create table chinnu_temp as select * from chinnu_emp where dept_no=10;		--56
                           
select * from chinnu_temp;                           
                           
\d chinnu_emp;
                           
select * from chinnu_emp order by sal limit 3;       	--58                   
 
select dept_no from chinnu_emp group by dept_no having max(sal)=(select max(Sal) from chinnu_emp );  			--59  
                           

                           
