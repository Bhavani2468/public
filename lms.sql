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

insert into H_users(user_name,user_pwd,user_email ,user_recoverymail, user_mobile , user_cdate ,user_type ) values('pk','1234','pk@gmail.com','pk@gmail.com',99087766,'2023-09-11','user');

create table H_user_sessions
(
    ussn_id serial primary key,
    user_id int,
    ussn_sessionid varchar(200),
    ussn_cdate timestamp,
    ussn_key varchar(100),
    ussn_host varchar(50),
    ussn_exptime timestamp,
    ussn_status char(2)
);

create table usr_sessions
(
    ussn_id serial primary key,
    user_id int,
    ussn_sessionid varchar(200),
    ussn_cdate timestamp,
    ussn_key varchar(100),
    ussn_host varchar(50),
    ussn_exptime timestamp,
    ussn_status char(2)
);


drop table usessions;

select * from H_user_sessions;

create table usessions as 
select * from H_user_sessions;

select * from usr_sessions;

insert into usr_sessions(user_id ,
    ussn_sessionid ,
    ussn_cdate ,
    ussn_key ,
    ussn_host ,
    ussn_exptime ,
    ussn_status ) values(1,'7288FA70BCEA3202D80BDE521E153FCC','2023-09-11 12:01:05.519271','7616c57dd34d4c71b398e83d5bf0f0e7','0:0:0:0:0:0:0:1','2023-09-11 12:31:05.519271','ac');


create table users_uri
(
    uri_id serial primary key,
    user_uri varchar(200)
);

drop table users_uri;

select * from users_uri;

insert into users_uri(user_uri) values('http://localhost:8081/LMS/adminld2');





select * from h_loanapplicants;


create table H_privileges
(
    pid serial primary key,
    priv_id int,
    priv_name varchar(100),
    priv_rpattern varchar(100),
    priv_action varchar(10)
);

drop table H_privileges;
select * from H_privileges;

insert into H_privileges(priv_id,priv_name ,priv_rpattern , priv_action) values(0,'login page','/login','GET');
insert into H_privileges(priv_id,priv_name ,priv_rpattern , priv_action) values(1,'login page','/login','GET');
insert into H_privileges(priv_id,priv_name ,priv_rpattern , priv_action) values(0,'admin home','/admin','GET');
insert into H_privileges(priv_id,priv_name ,priv_rpattern , priv_action) values(1,'user home','/personaldetails','GET');



insert into H_privileges(priv_id,priv_name ,priv_rpattern , priv_action) values(0,'admin loan details','/adminld','GET');
insert into H_privileges(priv_id,priv_name ,priv_rpattern , priv_action) values(0,'admin loan details page2','/adminld1','GET');
insert into H_privileges(priv_id,priv_name ,priv_rpattern , priv_action) values(0,'admin loan details page3','/adminld2','GET');












