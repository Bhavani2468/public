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


 



create table H_users
(
    user_id serial primary key,
    user_name varchar(20),
    user_pwd varchar(20),
    user_email varchar(60),
    user_recoverymail varchar(60),
    user_mobile int,
    user_cdate date,
    user_type char(5)
);

drop table H_users;
select * from H_users;

insert into H_users(user_name,user_pwd,user_email ,user_recoverymail, user_mobile , user_cdate ,user_type ) values();

create table H_user_sessions
(
    ussn_id serial primary key,
    user_id int,
    ussn_sessionid varchar(20),
    ussn_cdate timestamp,
    ussn_key varchar(100),
    ussn_host varchar(20),
    ussn_exptime timestamp,
    ussn_status char(2)
);
drop table H_user_sessions;

select * from H_user_sessions;



