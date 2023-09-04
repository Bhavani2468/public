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
    FROM doctorschedule_bhaskar; 
    RETURN appointment_count;
  END IF;
  end loop;
   CLOSE cur_weekpattern;
  RETURN 0;
END;
$$ LANGUAGE plpgsql;


select GetAppointmentCount(1,2);

select * from doctorschedule_bhaskar;









