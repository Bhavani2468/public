create table H_loanemischedule
(
	lnap_id int,
    lemi_index int,
    lemi_emidate date,
    lemi_amount numeric
);

select * from H_loanemischedule;

create table H_loanApplicationEMIMaster
(
	lnap_id int,
    lemi_roi numeric,
    lemi_noe int,
    lemi_repayamount numeric,
    lemi_sanctioned_amount numeric
);

select * from H_loamemischedule;





-- Create a sequence to generate unique lemi_index values
CREATE SEQUENCE lemi_index_seq;

-- Create the H_loamemischedule table with a DEFAULT value for lemi_index
CREATE TABLE H_loamemischedule (
    lnap_id int,
    lemi_index int DEFAULT nextval('lemi_index_seq'),
    lemi_emidate date,
    lemi_amount numeric
);

-- Create a trigger to set lemi_index based on the sequence
CREATE OR REPLACE FUNCTION set_lemi_index()
RETURNS TRIGGER AS $$
BEGIN
    NEW.lemi_index = nextval('lemi_index_seq');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_lemi_index_trigger
BEFORE INSERT ON H_loamemischedule
FOR EACH ROW
EXECUTE FUNCTION set_lemi_index();







