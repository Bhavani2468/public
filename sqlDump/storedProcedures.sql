CREATE OR REPLACE FUNCTION GetAppointmentCount(doct_id INT, weekday INT) RETURNS INT AS $$
DECLARE
  weekpattern VARCHAR(10);
  appointment_count INT;
  pat_slot INT;
  flag INT := 0;
  
  
  cur_weekpattern CURSOR FOR
    SELECT doctorschedule
    FROM doctorschedule_bhaskar
    WHERE doctorid = doct_id;
BEGIN
OPEN cur_weekpattern;
  
  LOOP
    FETCH cur_weekpattern INTO  weekpattern;
    EXIT WHEN NOT FOUND;
    
  
  RAISE NOTICE 'week pattern: %', weekpattern;

  IF POSITION(weekday::TEXT IN weekpattern) > 0 THEN
    RAISE NOTICE 'Weekday % is present in the week pattern', weekday;
    flag := 1;
  END IF;

  IF flag = 1 THEN
  
  SELECT doctoravailableslot INTO pat_slot from doctorschedule_bhaskar where doctorid=doct_id and doctorschedule=weekpattern;
  
    SELECT 
      ((EXTRACT(HOUR FROM doctoravailableto) * 60 + EXTRACT(MINUTE FROM doctoravailableto)) -
      (EXTRACT(HOUR FROM doctoravailablefrom) * 60 + EXTRACT(MINUTE FROM doctoravailablefrom))) / pat_slot
    INTO appointment_count
    FROM doctorschedule_bhaskar where doctorid=doct_id and doctorschedule=weekpattern;
    CLOSE cur_weekpattern;
    RETURN appointment_count;
  END IF;
  end loop;
   CLOSE cur_weekpattern;
  RETURN 0;
END;
$$ LANGUAGE plpgsql;


select GetAppointmentCount(1,2);

select * from doctorschedule_bhaskar;



CREATE OR REPLACE FUNCTION GetWeekdayFromDate(doct_id int,input_date DATE) RETURNS INT AS $$
DECLARE
  weekday INT;
BEGIN
  SELECT EXTRACT(DOW FROM input_date) INTO weekday;
  raise notice 'weekday is..%',weekday;
  
  RETURN GetAppointmentCount(doct_id, weekday); 
END;
$$ LANGUAGE plpgsql;


select GetWeekdayFromDate(1,'09-23-2023')




create table doctor_slots(slot_id serial primary key,slot_doct_id int,slot_date date,slot_from time,slot_to time,slot_status varchar(20),slot_count int);
select * from doctor_slots;



create table doctor_slots_range
(
    doct_id int,
    noofdays int
);
insert into doctor_slots_range values(1,45),(2, 45),
(3, 45),
(4, 45),
(5, 45),
(6, 45),
(7, 45),
(8, 45),
(9, 45),
(10, 45);

truncate doctor_slots_range;


CREATE OR REPLACE PROCEDURE GenerateDoctorSlots() LANGUAGE plpgsql AS $$
DECLARE
  doctor_record RECORD;
  slot_date DATE;
  slot_from time;
  slot_to time;
   no_of_days INT;
   
BEGIN
  FOR doctor_record IN (SELECT * FROM doctorschedule_bhaskar) LOOP
   raise notice 'doctor record is %',doctor_record;
    SELECT noofdays INTO no_of_days
    FROM doctor_slots_range
    WHERE doct_id = doctor_record.doctorid;
    
	raise notice 'no of days...%',no_of_days;    
	IF no_of_days IS NOT NULL AND no_of_days > 0 THEN
	FOR i IN 0..no_of_days-1 LOOP
      slot_date := CURRENT_DATE + i; 
      raise notice 'entered here..%',EXTRACT(DOW FROM slot_date);
      IF (select CheckWeekPattern(EXTRACT(DOW FROM slot_date)::text,(doctor_record.doctorschedule)::text)
      ) THEN
      raise notice 'entered here..%',i;
        INSERT INTO doctor_slots (slot_doct_id, slot_date, slot_from, slot_to, slot_status, slot_count)
        VALUES (
          doctor_record.doctorid,
          slot_date,
          doctor_record.doctoravailablefrom ,
          doctor_record.doctoravailableto ,
          'Available',
          (select GetWeekdayFromDate(doctor_record.doctorid,slot_date))
        );
      END IF;
    END LOOP;
    end if;
  END LOOP;
END;
$$;



truncate doctor_slots

select * from doctor_slots;

call GenerateDoctorSlots();


CREATE OR REPLACE FUNCTION CheckWeekPattern(weekday text, weekpattern TEXT) RETURNS BOOLEAN AS $$
BEGIN
  IF POSITION(weekday IN weekpattern) > 0 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
$$ LANGUAGE plpgsql;


select CheckWeekPattern(2,'135');


select * from doctor_slots;

select slot_doct_id from doctor_slots group by (slot_doct_id,slot_date) having count(*)>1 ;

select slot_doct_id,slot_date,slot_count from doctor_slots where slot_doct_id=3 and slot_count>0;

select slot_date from doctor_slots where slot_doct_id=1 order by slot_date desc limit 1;


CREATE OR REPLACE PROCEDURE updateDoctorSlots() LANGUAGE plpgsql AS $$
DECLARE
  doctor_record RECORD;
  slot_dat DATE;
  slot_from time;
  slot_to time;
   no_of_days INT;
   lower_bound date;
   upper_bound date;
   gap int;
   
BEGIN
	
  FOR doctor_record IN (SELECT * FROM doctorschedule_bhaskar) LOOP
  
  raise notice 'doctor record is %',doctor_record;
    SELECT noofdays INTO no_of_days
    FROM doctor_slots_range
    WHERE doct_id = doctor_record.doctorid;
  
  select slot_date into lower_bound from doctor_slots where slot_doct_id=doctor_record.doctorid order by slot_date desc limit 1;
  
  upper_bound := current_date + no_of_days;
  
  gap:=upper_bound-lower_bound;
   
    
	raise notice 'no of days...%',no_of_days;    
	IF no_of_days IS NOT NULL AND no_of_days > 0 THEN
	FOR i IN 0..gap-1 LOOP
      slot_dat := lower_bound + i; 
      raise notice 'entered here..%',EXTRACT(DOW FROM slot_dat);
      IF (select CheckWeekPattern(EXTRACT(DOW FROM slot_dat)::text,(doctor_record.doctoravailableslot)::text)
      ) THEN
      raise notice 'entered here..%',i;
        INSERT INTO doctor_slots (slot_doct_id, slot_date, slot_from, slot_to, slot_status, slot_count)
        VALUES (
          doctor_record.doctorid,
          slot_dat,
          doctor_record.doctoravailablefrom ,
          doctor_record.doctoravailableto ,
          'Available',
          (select GetWeekdayFromDate(doctor_record.doctorid,slot_dat))
        );
      END IF;
    END LOOP;
    end if;
  END LOOP;
END;
$$;

call updateDoctorSlots();



CREATE OR REPLACE FUNCTION getDoctorSlotsGenerated(Docct_id INT) RETURNS TABLE (
    slot_id int,
    slot_doct_id INT,
    slot_date DATE,
    slot_from TIME,
    slot_to TIME,
    slot_status VARCHAR(20),
    slot_count INT
) AS $$
DECLARE
    lower_bound DATE;
    upper_bound DATE;
    drange int;
BEGIN
    lower_bound := CURRENT_DATE;
    
    SELECT noofdays INTO drange
    FROM doctor_slots_range
    WHERE doct_id = Docct_id;
    
    upper_bound := lower_bound+drange;
    
    RETURN QUERY
    SELECT *
    FROM doctor_slots
    WHERE doctor_slots.slot_doct_id = Docct_id
      AND doctor_slots.slot_date BETWEEN lower_bound AND upper_bound and doctor_slots.slot_count>0;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION getdoctorslotsgenerated(integer)

select getDoctorSlotsGenerated(1);


create table doctorschedule_bhaskar
(
	doctorid int,doctorslotindex int,doctorschedule varchar(10),doctoravailablefrom time,doctoravailableto time,doctoravailableslot int
);

insert into doctorschedule_bhaskar values(1,1,'135','09:00:00','12:00:00',15),
(1,2,'246','14:00:00','17:00:00',30),
(2,1,'135','10:00:00','13:00:00',15),
(2,2,'246','15:00:00','18:00:00',30),
(3,1,'146','08:00:00','11:00:00',15),
(3,2,'127','09:00:00','12:00:00',20),
(4,1,'135','14:00:00','17:00:00',15),
(4,2,'246','10:00:00','13:00:00',30),
(5,1,'257','15:00:00','18:00:00',20),
(5,2,'346','08:00:00','11:00:00',10),
(6,1,'12345','11:00:00','13:00:00',30),
(7,1,'147','16:00:00','19:00:00',15),
(8,1,'267','09:00:00','12:00:00',35),
(9,1,'3467','14:30:00','17:30:00',20),
(10,1,'67','14:30:00','17:30:00',10);

select * from doctor_slots where slot_doct_id=1 and slot_status='booked';
select * from doctor_slots where slot_date='2023-09-14' and slot_doct_id=1;
rollback;
update doctor_slots set slot_status='booked'  where slot_date='2023-09-09' and slot_doct_id=1;
UPDATE doctor_slots SET slot_count = CASE WHEN slot_count > 1 THEN slot_count - 1 ELSE 0 END,slot_status = CASE WHEN slot_count = 1 THEN 'booked' ELSE slot_status END WHERE slot_date = '2023-09-09' and slot_doct_id=1




select * from apmnt;








select * from chinnu_emp;
create table chinnuemp(empno int,ename varchar(100),job varchar(50),sal numeric,dept_no int);
select * from chinnuemp;









