create table cl_acal
(slot_id serial primary key,
 slot_doct_id int,
 slot_date date,
 slot_from time,
 slot_to time,
 slot_status varchar(2)
);

select * from cl_acal;

SELECT EXTRACT(DAY FROM slot_date),EXTRACT(hour FROM slot_from) as sf FROM cl_acal where EXTRACT(month FROM slot_date)=8 group by (slot_date,slot_from)  having count(*)>=3;



create table apmnt
(
    ap_id serial primary key,
    ap_bdate date,
    ap_adate date,
    ap_doct_id int,
    ap_patn_id int references patient(p_id),
    slot_id int references cl_acal(slot_id),
    ap_status varchar(2)
);

insert into apmnt(ap_bdate,ap_adate,ap_doct_id,ap_patn_id,slot_id,ap_status) values('2023-08-30','2023-08-24',1,2,1,'bd');

select * from apmnt;



SELECT EXTRACT(DAY FROM ap_adate) FROM apmnt group by ap_adate  having count(*)=2;

SELECT EXTRACT(DAY FROM ap_adate),slot_id FROM apmnt where EXTRACT(month FROM ap_adate)=9 group by (ap_adate,slot_id)  having count(*)=2;

create table patient
(
    p_id serial primary key,
    p_name varchar(100),
    p_age int,
    p_gen varchar(2),
    p_mobile varchar(10)
);


select * from patient;


