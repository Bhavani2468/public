create table chinnu_trains as select trn_no,trn_name,trn_start,trn_end,trn_surcharge from tk_trains;

select * from chinnu_trains;

create table chinnu_stations as select * from tk_stations;

select * from chinnu_stations;




-- Create the 'stations' table
CREATE TABLE chinnu_stations (
    stn_code VARCHAR(5) PRIMARY KEY,
    stn_name VARCHAR(50)
);

-- Insert data into the 'stations' table
INSERT INTO chinnu_stations (stn_code, stn_name) VALUES
    ('HYD ', 'Hyderabad'),
    ('BZA ', 'Vijayawada'),
    ('VSKP', 'Visakhapatnam'),
    ('SC  ', 'Secunderabad'),
    ('TPTY', 'Tirupati'),
    ('GNT ', 'Guntur'),
    ('RJY ', 'Rajahmundry'),
    ('BNC ', 'Bengaluru City'),
    ('MAS ', 'Chennai Central'),
    ('CBE ', 'Coimbatore');



-- Create the 'trains' table
CREATE TABLE chinnu_trains (
    trn_no INT PRIMARY KEY,
    trn_name VARCHAR(50),
    trn_start VARCHAR(5),
    trn_end VARCHAR(5),
    trn_surcharge DECIMAL(8, 2)
);

-- Insert data into the 'trains' table
INSERT INTO trains (train_number, train_name, source_code, destination_code, fare) VALUES
    (12201, 'Rajdhani Express', 'BZA ', 'SC  ', 200.50),
    (12624, 'Chennai Mail', 'MAS ', 'VSKP', 150.25),
    (17239, 'Simhadri Express', 'SC  ', 'VSKP', 50.75),
    (12841, 'Coromandel Express', 'BZA ', 'MAS ', 175.00),
    (12759, 'Charminar Express', 'HYD ', 'SC  ', 75.50),
    (12806, 'Janmabhoomi Express', 'TPTY', 'BZA ', 100.25),
    (17488, 'Tirumala Express', 'MAS ', 'TPTY', 60.75),
    (22693, 'Rajya Rani Express', 'RJY ', 'VSKP', 80.50),
    (12696, 'Chennai Superfast', 'MAS ', 'CBE ', 140.25),
    (12734, 'Narayanadri Express', 'HYD ', 'TPTY', 95.00),
    (12640, 'Golconda Express', 'SC  ', 'GNT ', 45.50),
    (12711, 'Pinakini Express', 'TPTY', 'MAS ', 160.75),
    (12842, 'Coromandel Express', 'MAS ', 'BZA ', 75.25),
    (17210, 'Kakinada Express', 'BZA ', 'RJY ', 55.75),
    (12864, 'Yanam Express', 'SC  ', 'RJY ', 90.00),
    (12657, 'Navjeevan Express', 'MAS ', 'BNC ', 105.50),
    (12797, 'Venkatadri Express', 'BZA ', 'MAS ', 165.25),
    (17405, 'Krishna Express', 'SC  ', 'VSKP', 70.75),
    (12723, 'Telangana Express', 'HYD ', 'BNC ', 85.50),
    (12202, 'BZA Rajdhani Express', 'SC  ', 'BZA ', 200.50),
    (12623, 'VSKP Chennai Mail', 'VSKP', 'MAS ', 150.25),
    (17238, 'VSKP Simhadri Express', 'VSKP', 'SC  ', 50.75),
    (12840, 'MAS Coromandel Express', 'MAS ', 'BZA ', 175.00),
    (12758, 'SC Charminar Express', 'SC  ', 'HYD ', 75.50),
    (12805, 'BZA Janmabhoomi Express', 'BZA ', 'TPTY', 100.25),
    (17487, 'TPTY Tirumala Express', 'TPTY', 'MAS ', 60.75),
    (22692, 'VSKP Rajya Rani Express', 'VSKP', 'RJY ', 80.50),
    (12695, 'CBE Chennai Superfast', 'CBE ', 'MAS ', 140.25),
    (12733, 'TPTY Narayanadri Express', 'TPTY', 'HYD ', 95.00),
    (12639, 'GNT Golconda Express', 'GNT ', 'SC  ', 45.50),
    (12710, 'MAS Pinakini Express', 'MAS ', 'TPTY', 160.75),
    (12843, 'BZA Coromandel Express', 'BZA ', 'MAS ', 75.25),
    (17209, 'RJY Kakinada Express', 'RJY ', 'BZA ', 55.75),
    (12863, 'RJY Yanam Express', 'RJY ', 'SC  ', 90.00),
    (12656, 'BNC Navjeevan Express', 'BNC ', 'MAS ', 105.50),
    (12796, 'MAS Venkatadri Express', 'MAS ', 'BZA ', 165.25),
    (17404, 'SC Krishna Express', 'VSKP', 'SC  ', 70.75),
    (12722, 'BNC Telangana Express', 'BNC ', 'HYD ', 85.50);
    
    
    
    
    
    create table chinnu_passengers
    (
        passenger_id SERIAL PRIMARY KEY,
        name varchar(100) not null,
        gender varchar(8) not null,
        age int not null,
        tck_id int REFERENCES chinnu_ticket(tck_no)
    );
    
    select * from chinnu_passengers;
    
    select * from chinnu_ticket;
    
    
    create table chinnu_ticket
    (
        tck_no serial primary key,
        pnr_no serial,
        trn_name varchar(100),
        from_stn varchar(6),
        to_stn varchar(6),
        travelDate date,
        trn_class varchar(5),
        fare numeric
    );
    
    
    insert into chinnu_ticket(trn_name,from_stn ,to_stn ,
        travelDate,
        trn_class ,
        fare ) values('Rajdhani Express', 'BZA', 'SC', '2023-08-24','1A',200.50);
