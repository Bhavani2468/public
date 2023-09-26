

	
select * from claims;

update claims set clam_remarks='rejt' where clam_id=102;


create table claim_flow
(
    cf_id serial primary key,
    cf_clam_id int,
    cf_clam_status varchar(10),
    cf_clam_remarks varchar(1000),
    cf_clam_doc_path varchar(500),
    cf_clam_date date,
    cf_clam_processed_by int
);



select * from claim_flow;

CREATE TABLE Bills (
    clbl_billindex SERIAL PRIMARY KEY,
        clam_id INT, 
    clbl_document_title VARCHAR(100),
    clbl_document_path VARCHAR(255)
);


select * from bills;
drop table bill;
SELECT tgname FROM pg_trigger WHERE tgrelid = 'claims'::regclass;



-- Create the trigger function
CREATE OR REPLACE FUNCTION insert_claim_flow_on_update()
RETURNS TRIGGER AS $$
Declare
doc_path varchar(500);
BEGIN
    -- Check if the UPDATE statement affected the 'clam_status' column
    IF OLD.clam_remarks <> NEW.clam_remarks THEN
        -- Insert data into the 'claim_flow' table when the 'Claims' table is updated
        doc_path:=(select clbl_document_path from bills);
        INSERT INTO claim_flow (cf_clam_id, cf_clam_status, cf_clam_remarks,cf_clam_doc_path, cf_clam_date, cf_clam_processed_by)
        VALUES (NEW.clam_id, NEW.clam_status, NEW.clam_remarks, doc_path,CURRENT_DATE, NEW.clam_processed_by);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger
CREATE  TRIGGER claim_flow_trigger
AFTER UPDATE ON _Claims
FOR EACH ROW
WHEN (OLD.clam_remarks <> NEW.clam_remarks) -- Trigger only on 'clam_status' updates
EXECUTE FUNCTION insert_claim_flow_on_update();


drop trigger insert_claim_flow_trigger
 drop function insert_claim_flow_on_update()
 
 
  select * from claim_flow;
 select * from claimbills;

update claimbills set clbl_document_path='Insurance/src/main/resources/static/file/Comaparable based on passcount.txt' where clam_id=20 and clbl_billindex=1;

select * from _claims



select * from claim_flow




update claimbills set clam_id=112 where clbl_billindex=1;





