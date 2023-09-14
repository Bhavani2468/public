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


insert into bvh_insurance_packages (insp_title ,insp_desc ,insp_status ,insp_range_start ,insp_range_end ,insp_agelimit_start ,insp_agelimit_end) values('Package1','package1','available',300000,1000000,1,5);

INSERT INTO bvh_insurance_packages (insp_title, insp_desc, insp_status, insp_range_start, insp_range_end, insp_agelimit_start, insp_agelimit_end)
VALUES
    ('Insurance Package 1', 'Description for Package 1', 'Active', 1000.00, 5000.00, 25, 65),
    ('Insurance Package 2', 'Description for Package 2', 'Active', 2000.00, 8000.00, 30, 70),
    ('Insurance Package 3', 'Description for Package 3', 'Inactive', 1500.00, 6000.00, 18, 60),
    ('Insurance Package 4', 'Description for Package 4', 'Active', 3000.00, 10000.00, 20, 75),
    ('Insurance Package 5', 'Description for Package 5', 'Active', 2500.00, 9000.00, 35, 70),
    ('Insurance Package 6', 'Description for Package 6', 'Active', 1200.00, 5500.00, 28, 67),
    ('Insurance Package 7', 'Description for Package 7', 'Inactive', 1750.00, 6200.00, 21, 61),
    ('Insurance Package 8', 'Description for Package 8', 'Active', 2700.00, 9800.00, 31, 68),
    ('Insurance Package 9', 'Description for Package 9', 'Active', 2300.00, 8500.00, 32, 69),
    ('Insurance Package 10', 'Description for Package 10', 'Active', 1400.00, 5900.00, 27, 63),
    ('Insurance Package 11', 'Description for Package 11', 'Inactive', 1600.00, 6100.00, 22, 62),
    ('Insurance Package 12', 'Description for Package 12', 'Active', 3200.00, 10500.00, 19, 72),
    ('Insurance Package 13', 'Description for Package 13', 'Active', 2100.00, 8700.00, 29, 71),
    ('Insurance Package 14', 'Description for Package 14', 'Active', 1800.00, 6300.00, 26, 64),
    ('Insurance Package 15', 'Description for Package 15', 'Inactive', 2800.00, 9400.00, 24, 73),
    ('Insurance Package 16', 'Description for Package 16', 'Active', 1900.00, 7900.00, 23, 74),
    ('Insurance Package 17', 'Description for Package 17', 'Active', 2600.00, 9200.00, 33, 66),
    ('Insurance Package 18', 'Description for Package 18', 'Inactive', 1700.00, 6600.00, 34, 75),
    ('Insurance Package 19', 'Description for Package 19', 'Active', 2100.00, 8800.00, 36, 69),
    ('Insurance Package 20', 'Description for Package 20', 'Active', 2200.00, 9100.00, 37, 71);



