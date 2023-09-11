create table chinnu_programmers as select * from programmers;
create table chinnu_softwaresdeveloped as select * from softwaresdeveloped;
create table chinnu_coursesstudied as select * from coursesstudied;

INSERT INTO chinnu_programmers (pid, name, dob, doj, prof1, prof2, sal, gender) VALUES
(11, 'REMITHA', '1970-04-19', '1993-04-20', 'C', 'ASSEMBLY', 3600, 'f'),
(1, 'ANAND', '1964-07-02', '1992-04-21', 'PASCAL', 'BASIC', 3200, 'm'),
(2, 'ALTAF', '1966-04-12', '1990-11-13', 'CLIPPER', 'COBOL', 2800, 'm'),
(3, 'JULIANA', '1960-01-31', '1990-04-21', 'COBOL', 'DBASE', 3000, 'm'),
(4, 'KAMALA', '1965-09-11', '1992-01-02', 'C', 'DBASE', 2900, 'f'),
(6, 'NELSON', '1968-10-03', '1989-10-11', 'COBOL', 'DBASE', 2500, 'm'),
(7, 'PATTRICK', '1965-11-10', '1990-04-21', 'PASCAL', 'CLIPPER', 2800, 'm'),
(8, 'QADIR', '1965-08-31', '1991-04-21', 'ASSEMBLY', 'C', 3000, 'm'),
(9, 'RAMESH', '1967-05-03', '1991-02-28', 'PASCAL', 'DBASE', 3200, 'm'),
(12, 'REVATHI', '1969-12-02', '1992-02-01', 'PASCAL', 'BASIC', 3700, 'f'),
(10, 'REBECCA', '1967-01-01', '1990-12-01', 'BASIC', 'COBOL', 2500, 'f'),
(14, 'RAVI', '1965-02-25', '1992-05-02', 'FOXPRO', 'C', 3500, 'f'),
(15, 'VIJAY', '1965-03-01', '1992-05-02', 'FOXPRO', 'C', 3500, 'm'),
(5, 'SATISH', '2002-07-24', '1991-01-02', 'CPP', 'ORACLE', 4500, 'f'),
(13, 'VIJAYA', '1965-12-14', '1992-05-02', 'FOXPRO', 'C', 3500, 'f');




INSERT INTO chinnu_softwaresdeveloped ("softid", "progid", "title", "dev_in", "scost", "dcost", "sold") VALUES
(1, 1, 'README', 'CPP', '300.00', '1200', '84'),
(2, 2, 'PARACHUTES', 'BASIC', '399.95', '6000', '43'),
(3, 3, 'VIDEO TITLING', 'PASCAL', '7500.00', '16000', '9'),
(5, 5, 'PAYROLL PKG.', 'DBASE', '9000.00', '20000', '7'),
(6, 6, 'FINANCIAL ACCT.', 'ORACLE', '18000.00', '85000', '4'),
(7, 7, 'CODE GENERATOR', 'C', '4500.00', '20000', '23'),
(8, 8, 'README', 'CPP', '300.00', '1200', '84'),
(9, 9, 'BOMBS AWAY', 'ASSEMBLY', '750.00', '3000', '11'),
(10, 10, 'VACCINES', 'C', '1900.00', '3100', '21'),
(11, 11, 'HOTEL MGMT.', 'DBASE', '13000.00', '35000', '4'),
(12, 12, 'DEAD LEE', 'PASCAL', '599.95', '4500', '73');


INSERT INTO chinnu_coursesstudied (progid, corsindex, splace, course, cost) VALUES
(1, 1, 'NKIITS', 'PGDCA', 4500),
(2, 2, 'COIT', 'DCA', 7200),
(3, 3, 'BDPS', 'MCA', 2200),
(4, 4, 'NKXGEN', 'DCA', 5000),
(5, 5, 'NKIITS', 'PGDCA', 4500),
(6, 6, 'NKXGEN', 'DAP', 6200),
(7, 7, 'NKXGEN', 'DCAP', 5200),
(8, 8, 'APPLE', 'HDCA', 14000),
(9, 9, 'NKIITS', 'PGDCA', 4500),
(10, 10, 'BRILLIANT', 'DCAP', 11000),
(11, 11, 'BDPS', 'DCS', 6000),
(12, 12, 'NKIITS', 'DAP', 5000),
(13, 13, 'BDPS', 'DCA', 4800);

--1
select avg(scost) from chinnu_softwaresdeveloped where dev_in='PASCAL' group by dev_in;
--2
select name,extract(year from age(current_date,dob)) as age from chinnu_programmers;
--3
select name from chinnu_programmers where pid=(select progid from chinnu_coursesstudied where course='DCS');
--4
select max(sold) from chinnu_softwaresdeveloped group by sold limit 1;
--5
select name,dob from chinnu_programmers where extract(month from dob)='1';
--6
select min(cost) from chinnu_coursesstudied group by cost limit 1;
--7
select count(pid) from chinnu_programmers where pid in (select progid from chinnu_coursesstudied where course='PGDCA');
--8
select sum(scost*sold) from chinnu_softwaresdeveloped where dev_in='C' group by dev_in;
--9
select title from chinnu_softwaresdeveloped where progid=(select pid from chinnu_programmers where name='RAMESH');
--10
select count(pid) from chinnu_programmers where pid in (select progid from chinnu_coursesstudied where splace='NKIITS');
--11
select softid,title,dev_in from chinnu_softwaresdeveloped where scost*sold>20000;
--12
select 
case
when scost>dcost then 1
else 
	case
	when (dcost%scost=0) then dcost/scost
    else (dcost/scost)+1
    end
end::int
from chinnu_softwaresdeveloped ;
--13
select max(scost) from chinnu_softwaresdeveloped where dev_in='BASIC' group by scost limit 1;
--14
select title from chinnu_softwaresdeveloped where scost*sold>=dcost;
--15
select count(softid) from chinnu_softwaresdeveloped where dev_in='DBASE';
--16
select count(pid) from chinnu_programmers where pid in (select progid from chinnu_coursesstudied where splace='NKXGEN');
--17
select count(pid) from chinnu_programmers where pid in (select progid from chinnu_coursesstudied where cost>=5000 and cost<=10000);
--18
select avg(cost) from chinnu_coursesstudied;
--19
select pid,name from chinnu_programmers where prof1='C' or prof2='C' or pid in (Select progid from chinnu_softwaresdeveloped where dev_in='C') or pid in (select progid from chinnu_coursesstudied where course='C');
--20
select count(pid) from chinnu_programmers where prof1='COBOL' or prof1='PASCAL' or prof2='COBOL' or prof2='PASCAL' or pid in (Select progid from chinnu_softwaresdeveloped where dev_in='COBOL' or dev_in='PASCAL') or pid in (select progid from chinnu_coursesstudied where course='COBOL' or course='PASCAL');
--21
select count(pid) from chinnu_programmers where prof1 not in ('C','PASCAL') and prof2 not in ('C','PASCAL') and pid not in (Select progid from chinnu_softwaresdeveloped where dev_in='C' or dev_in='PASCAL') and pid not in (select progid from chinnu_coursesstudied where course='C' or course='PASCAL');
--22
select max(extract(year from age(current_date,dob))) from chinnu_programmers where gender='m';
--23
select avg(extract(year from age(current_date,dob))) from chinnu_programmers where gender='f';
--24
select name,extract(year from age(current_date,doj)) as experience from chinnu_programmers order by experience desc;
--25
select pid,name from chinnu_programmers where extract(month from dob)=extract(month from current_date);
--26
select count(pid) from chinnu_programmers where gender='f';
--27
select prof1 as lang from chinnu_programmers where gender='m' union select prof2 as lang from chinnu_programmers where gender='m' and prof2 not in (select prof1 from chinnu_programmers where gender='m');
--28
select avg(sal) from chinnu_programmers;
--29
select count(pid) from chinnu_programmers where sal>=2000 and sal<=4000;
--30
select pid,name from chinnu_programmers where prof1 not in ('CLIPPER','COBOL','PASCAL') and prof2 not in ('CLIPPER','COBOL','PASCAL');





--31
select count(pid) from chinnu_programmers where gender='f' and extract(year from age(current_date,dob))>24 and (prof1='C' or prof2='C');
--32
select pid,name from chinnu_programmers where extract(month from dob)=extract(month from current_date) and (extract(day from  dob)-extract(day from current_date)<=7);
--33
select pid,name from chinnu_programmers where extract(year from age(current_date,doj))<1;
--34
select pid,name from chinnu_programmers where extract(year from age(current_date,doj))=1;
--35





