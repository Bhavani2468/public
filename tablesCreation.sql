-- Create the Agents table
CREATE TABLE Agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(50)
);
    
drop table users;
	
	
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(30),
    user_cdate DATE,
    user_pwd VARCHAR(100),
    user_type CHAR(4) CHECK (user_type IN ('ADMN', 'CUST')),
    user_status CHAR(2)
);

CREATE TABLE Customers (
    cust_id INT PRIMARY KEY,
    cust_fname VARCHAR(50),
    cust_lname VARCHAR(50),
    cust_dob DATE,
    cust_address VARCHAR(255),
    cust_gender CHAR(1),
    cust_cdate DATE,
    cust_aadhar INT,
    cust_status CHAR(2),
    cust_luudate DATE,
    cust_luuser INT
);

CREATE TABLE InsurancePackages (
    insp_id INT PRIMARY KEY,
    insp_title VARCHAR(60),
    insp_desc VARCHAR(255),
    insp_status VARCHAR(10),
    insp_range_start NUMERIC,
    insp_range_end NUMERIC,
    insp_agelimit_start INT,
    insp_agelimit_end INT
);
INSERT INTO InsurancePackages (insp_id, insp_title, insp_desc, insp_status, insp_range_start, insp_range_end, insp_agelimit_start, insp_agelimit_end) VALUES
(1, 'Basic Health Insurance', 'Covers essential medical expenses', 'Active', 1000, 10000, 18, 65),
(2, 'Comprehensive Auto Insurance', 'Provides full coverage for your vehicle', 'Active', 5000, 50000, 25, 70),
(3, 'Term Life Insurance', 'Coverage for a fixed term with payout on death', 'Active', 10000, 100000, 18, 75),
(4, 'Travel Insurance', 'Protection for your trips and vacations', 'Active', 500, 5000, 1, 80),
(5, 'Home Insurance', 'Protects your home and belongings', 'Active', 20000, 200000, 25, 80),
(6, 'Pet Insurance', 'Covers veterinary expenses for your pets', 'Active', 500, 5000, 1, 15),
(7, 'Business Liability Insurance', 'Protection for business owners', 'Active', 10000, 100000, 25, 65),
(8, 'Disability Insurance', 'Income replacement due to disability', 'Active', 1000, 10000, 18, 65),
(9, 'Critical Illness Insurance', 'Coverage for major illnesses', 'Active', 5000, 50000, 18, 70),
(10, 'Dental Insurance', 'Covers dental procedures and check-ups', 'Active', 500, 5000, 1, 75);
SELECT * FROM InsurancePackages;

CREATE TABLE Diseases (
    disc_id INT PRIMARY KEY,
    disc_name VARCHAR(100),
    disc_icdcode VARCHAR(10),
    disc_desc VARCHAR(255),
    disc_status VARCHAR(10)
);
INSERT INTO Diseases (disc_id, disc_name, disc_icdcode, disc_desc, disc_status) VALUES
(1, 'Influenza', 'J10', 'Respiratory infection caused by influenza viruses', 'Active'),
(2, 'Hypertension', 'I10', 'High blood pressure', 'Active'),
(3, 'Type 2 Diabetes', 'E11', 'Metabolic disorder resulting in high blood sugar', 'Active'),
(4, 'Asthma', 'J45', 'Chronic respiratory disease causing breathing difficulties', 'Active'),
(5, 'Osteoarthritis', 'M15', 'Degenerative joint disease', 'Active'),
(6, 'Cancer', 'C50', 'Malignant tumor', 'Active'),
(7, 'Heart Disease', 'I25', 'Various conditions affecting the heart', 'Active'),
(8, 'Migraine', 'G43', 'Recurrent headaches', 'Active'),
(9, 'Chronic Kidney Disease', 'N18', 'Progressive kidney damage', 'Active'),
(10, 'Alzheimer''s Disease', 'G30', 'Neurodegenerative disease causing memory loss', 'Active');
SELECT * FROM Diseases;

DROP TABLE NetworkHospitals;
CREATE TABLE NetworkHospitals (
    hosp_id INT PRIMARY KEY,
    hosp_title VARCHAR(70),
    hosp_location VARCHAR(50),
    hosp_address VARCHAR(100),
    hosp_contact_number VARCHAR(10),
    hosp_pincode INT,
    hosp_luudate DATE,
    hosp_luuser INT
);
INSERT INTO NetworkHospitals (hosp_id, hosp_title, hosp_location, hosp_address, hosp_contact_number, hosp_pincode, hosp_luudate, hosp_luuser) VALUES
(1, 'City Hospital', 'City Center', '123 Main St', '1234567890', 12345, '2023-09-23', 1),
(2, 'Rural Health Clinic', 'Rural Village', '456 Elm St', '2345678901', 54321, '2023-09-23', 2),
(3, 'Metro General Hospital', 'Downtown', '789 Oak St', '3456789012', 67890, '2023-09-23', 3),
(4, 'Coastal Medical Center', 'Coastal City', '987 Pine St', '4567890123', 45678, '2023-09-23', 1),
(5, 'Mountain View Hospital', 'Mountain Town', '654 Birch St', '5678901234', 98765, '2023-09-23', 2),
(6, 'Sunrise Medical Center', 'Suburban Area', '321 Cedar St', '6789012345', 87654, '2023-09-23', 3),
(7, 'Golden State Hospital', 'Downtown', '135 Redwood St', '7890123456', 10987, '2023-09-23', 1),
(8, 'Valley Community Clinic', 'Valley Town', '246 Maple St', '8901234567', 32109, '2023-09-23', 2),
(9, 'Northern Regional Hospital', 'Northern City', '753 Willow St', '9012345678', 54321, '2023-09-23', 3),
(10, 'Sunnyvale Medical Center', 'Suburban Area', '852 Walnut St', '0123456789', 43210, '2023-09-23', 1),
(11, 'Bayside Health Center', 'Coastal Town', '369 Spruce St', '1234509876', 56789, '2023-09-23', 2),
(12, 'Capital City Hospital', 'City Center', '147 Elm St', '2345678901', 98765, '2023-09-23', 3),
(13, 'Hillside General Hospital', 'Hillside Area', '963 Pine St', '3456789012', 10987, '2023-09-23', 1),
(14, 'Lakeview Medical Center', 'Lakeside Town', '753 Birch St', '4567890123', 54321, '2023-09-23', 2),
(15, 'Countryside Health Clinic', 'Countryside', '258 Oak St', '5678901234', 87654, '2023-09-23', 3);
SELECT * FROM NetworkHospitals;

CREATE TABLE InsurancePackageCoveredDiseases (
    insp_id INT,
    disc_id INT,
    PRIMARY KEY (insp_id, disc_id),
    FOREIGN KEY (insp_id) REFERENCES InsurancePackages(insp_id),
    FOREIGN KEY (disc_id) REFERENCES Diseases(disc_id)
);

-- Create the InsurancePolicies table
CREATE TABLE InsurancePolicies (
    iplc_id INT PRIMARY KEY,
    iplc_cust_id INT,
    iplc_cdate DATE,
    iplc_sum_assured NUMERIC,
    iplc_applicable_date DATE,
    iplc_insp_id INT,
    iplc_yrly_prem_amount NUMERIC,
    iplc_expdate DATE,
    iplc_agnt_id INT,
    FOREIGN KEY (iplc_insp_id) REFERENCES InsurancePackages(insp_id),
    FOREIGN KEY (iplc_agnt_id) REFERENCES Agents(agent_id)
);

CREATE TABLE InsurancePolicySchedule (
    iplc_id INT,
    iplc_sindex SMALLINT,
    iplc_date DATE,
    iplc_premium NUMERIC,
    iplc_paid_date DATE,
    PRIMARY KEY (iplc_id, iplc_sindex),
    FOREIGN KEY (iplc_id) REFERENCES InsurancePolicies(iplc_id)
);

CREATE TABLE InsurancePolicyPayments (
    inpp_id INT PRIMARY KEY,
    inpp_iplc_id INT,
    inpp_trans_id VARCHAR(50),
    inpp_amount NUMERIC,
    inpp_paymode CHAR(4),
    FOREIGN KEY (inpp_iplc_id) REFERENCES InsurancePolicies(iplc_id)
);

CREATE TABLE Claims (
    clam_id INT PRIMARY KEY,
    clam_source CHAR(4) CHECK (clam_source IN ('INDV', 'HSPT')),
    clam_type CHAR(4) CHECK (clam_type IN ('DRCT', 'REIM')),
    clam_date DATE,
    clam_amount_requested NUMERIC,
    clam_iplc_id INT,
    clam_processed_amount NUMERIC,
    clam_processed_date DATE,
    clam_processed_by INT,
    clam_remarks VARCHAR(1000),
    clam_status CHAR(4)
);



CREATE TABLE ClaimBills (
    clam_id serial primary key ,
	clbl_claim_amount NUMERIC,
    clbl_processed_amount NUMERIC,
    clbl_processed_date DATE,
    clbl_processed_by INT,
	--FOREIGN KEY (clbl_processed_by) REFERENCES Users(user_id),
    clbl_remarks VARCHAR(1000),
    clbl_status CHAR(4)
);


CREATE TABLE Bill (
    clbl_billindex SERIAL PRIMARY KEY,
    clbl_document_title VARCHAR(100),
    clbl_document_path VARCHAR(255),
    
    clam_id INT, 
    FOREIGN KEY (clam_id) REFERENCES ClaimBills(clam_id)
);


drop table bill;
drop table claimbills

select * from claimbills;
select * from bill;




