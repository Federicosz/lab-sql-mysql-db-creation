CREATE TABLE cars (
    VIN varchar(50) PRIMARY KEY,
    manufacturer VARCHAR(50),
    model VARCHAR(50),
    year INT,
    color VARCHAR(50)
);

create table customers(
	customerID int primary key,
	name varchar(50),
	phonenumber numeric,
	email varchar(50),
	address varchar(50),
	stateProvince varchar(50),
	country varchar(50),
	zipPostalCode int
);

create table salespersons (
	staffID int primary key,
	name varchar(50),
	storeID varchar(50)
);

create table invoices (
	invoicenumber int,
	date date,
	car varchar(50),
	customer int,
	salesperson int,
	CONSTRAINT fk_car FOREIGN KEY (car) REFERENCES cars (VIN),
	CONSTRAINT fk_customer FOREIGN KEY (customer) REFERENCES customers (customerID),
	CONSTRAINT fk_salesperson FOREIGN KEY (salesperson) REFERENCES salespersons (staffID)
);


INSERT INTO cars 
VALUES
    ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
    ('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
    ('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
    ('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
    ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
    ('DAM41UDN3CHU2WVF9', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO customers
VALUES
    (10001, 'Pablo Picasso', '34636176382', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Spain', '28045','Madrid'),
    (20001, 'Abraham Lincoln', '13059077086', '-', '120 SW 8th St', 'Florida', 'United States', '33130', 'Miami'),
    (30001, 'Napoléon Bonaparte', '33179754000', '-', '40 Rue du Colisée', 'Île-de-France', 'France', '75008', 'Paris');


INSERT INTO salespersons
VALUES
    ('00001', 'Petey Cruiser', 'Madrid'),
    ('00002', 'Anna Sthesia', 'Barcelona'),
    ('00003', 'Paul Molive', 'Berlin'),
    ('00004', 'Gail Forcewind', 'Paris'),
    ('00005', 'Paige Turner', 'Miami'),
    ('00006', 'Bob Frapples', 'Mexico City'),
    ('00007', 'Walter Melon', 'Amsterdam'),
    ('00008', 'Shonda Leer', 'São Paulo');

INSERT INTO invoices 
VALUES
    (852399038, '2018-08-22', '3K096I98581DHSNUP', 10001, 00003),
    (731166526, '2018-12-31', 'RKXVNNIHLVVZOUB4M', 30001, 00005),
    (271135104, '2019-01-22', 'ZM8G7BEUQZ97IH46V', 20001, 00007);
	
UPDATE customers
SET email = 
    CASE 
        WHEN name = 'Pablo Picasso' THEN 'ppicasso@gmail.com'
        WHEN name = 'Abraham Lincoln' THEN 'lincoln@us.gov'
        WHEN name = 'Napoléon Bonaparte' THEN 'hello@napoleon.me'
        -- Add more cases as needed
    END
WHERE name IN ('Pablo Picasso', 'Abraham Lincoln', 'Napoléon Bonaparte');