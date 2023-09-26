drop table _claims;

CREATE TABLE _claims (
    clam_id SERIAL PRIMARY KEY,
    clam_source VARCHAR(255),
    clam_type VARCHAR(255),
    clam_date DATE,
    clam_amount_requested NUMERIC(10, 2),
    clam_iplc_id INT,
    clam_processed_amount NUMERIC(10, 2),
    clam_processed_date DATE,
    clam_processed_by INT,
    clam_remarks TEXT,
    clam_status VARCHAR(255)
);








drop table claim_bills

CREATE TABLE claim_bills (
    clam_id INT,
    clbl_bill_index INT,
    clbl_document_title VARCHAR(255),
    clbl_document_path VARCHAR(255),
    clbl_claim_amount NUMERIC(10, 2),
    clbl_processed_amount NUMERIC(10, 2),
    clbl_processed_date DATE,
    clbl_processed_by INT,
    clbl_remarks TEXT,
    clbl_status VARCHAR(255)
);

select * from claim_bills

update claim_bills set clbl_bill_index=1 where clam_id=8;




CREATE TABLE insurance_claim (
    policy_id INT,
    member_index INT,
    relation VARCHAR(255),
    joined_date DATE,
    patient_name VARCHAR(255),
    date_of_birth DATE,
    gender VARCHAR(255),
    contact_number VARCHAR(255),
    address TEXT,
    disease VARCHAR(255),
    diagnosis TEXT,
    treatment TEXT,
    claimAmount NUMERIC(10, 2)
);


select * from insurance_claim;
