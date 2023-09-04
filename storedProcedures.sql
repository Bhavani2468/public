CREATE OR REPLACE FUNCTION GetAppointmentCount(doct_id INT, weekday INT) RETURNS INT AS $$
DECLARE
  weekpattern VARCHAR(10);
  appointment_count INT;
  pat_slot INT;
  flag INT := 0;
BEGIN
  SELECT doctorschedule INTO weekpattern
  FROM doctorschedule_bhaskar
  WHERE doctorid = doct_id;
  
  RAISE NOTICE 'week pattern: %', weekpattern;

  SELECT 20 INTO pat_slot;

  IF POSITION(weekday::TEXT IN weekpattern) > 0 THEN
    RAISE NOTICE 'Weekday % is present in the week pattern', weekday;
    flag := 1;
  END IF;

  IF flag = 1 THEN
    SELECT 
      ((EXTRACT(HOUR FROM doctoravailableto) * 60 + EXTRACT(MINUTE FROM doctoravailableto)) -
      (EXTRACT(HOUR FROM doctoravailablefrom) * 60 + EXTRACT(MINUTE FROM doctoravailablefrom))) / pat_slot
    INTO appointment_count
    FROM doctorschedule_bhaskar; 
    RETURN appointment_count;
  END IF;
  
  RETURN 0;
END;
$$ LANGUAGE plpgsql;


select GetAppointmentCount(1,1);

select * from doctorschedule_bhaskar;




select doctoravailableslot from doctorschedule_bhaskar where doctorid=1 and 


select doctoravailableto-doctoravailablefrom from doctorschedule_bhaskar;

