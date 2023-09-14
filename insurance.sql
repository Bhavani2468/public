create table bvh_customers
(
	cust_id serial primary key,
    cust_fname varchar(50),
    cust_lname  varchar(50),
    cust_dob date,
    cust_address varchar(50),
    cust_gender  varchar(50),
    cust_cdate date,
   	cust_aadhar bigint,
    cust_status  varchar(50),
    cust_luudate date,
    cust_luuser int
    
)

create table bvh_network_hospitals(
hosp_id serial primary key,
hosp_title varchar(50),
hosp_location varchar(50),
hosp_address varchar(50),
hosp_contact_mobile bigint,
hosp_contact_phone bigint,
hosp_pincode int,
hosp_luudate date,
hosp_luuser varchar(50)
)






create table bvh_users(
user_id serial primary key,
    user_name varchar(50),
    user_cdate date,
    user_pwd varchar(65),
    user_type varchar(50),
    user_status varchar(50)

)



create table bvh_insurance_packages(
	insp_id serial primary key,
    insp_title varchar(50),
    insp_desc varchar(50),
	insp_status varchar(50),
	insp_range_start numeric,
    insp_range_end numeric,
    insp_agelimit_start int,
    insp_agelimit_end int
)




create table bvh_diseases(
disc_id serial primary key,
    disc_name varchar(50),
    disc_icdcode varchar(50),
    disc_desc varchar(50),
    disc_status varchar(50)
    )
    
    
    
    
CREATE TABLE bvh_insurance_package_covered_diseases (
    insp_id INT,  
    disc_id INT,  

    FOREIGN KEY (insp_id) REFERENCES bvh_insurance_packages (insp_id),
    FOREIGN KEY (disc_id) REFERENCES bvh_diseases (disc_id),
    
    PRIMARY KEY (insp_id, disc_id)
);


create table bvh_insurances(
insr_id serial primary key,
insr_cust_id int,
    FOREIGN KEY (insr_cust_id) REFERENCES bvh_customers (cust_id),
    insr_cdate date,
    insr_sum_assured numeric,
    insr_insp_id int,
    insr_yrly_prem_amount numeric,
    insr_sdate date
)




drop table bvh_diseases;
drop table bvh_insurance_package_covered_diseases;
drop table bvh_insurance_packages;
drop table bvh_network_hospitals;
drop table bvh_users;


select * from bvh_customers

select * from bvh_network_hospitals

select * from bvh_users

select * from bvh_insurance_packages

select * from bvh_diseases

select * from bvh_insurance_package_covered_diseases

select * from bvh_insurances





