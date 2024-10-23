-- Create the database
CREATE DATABASE tour_agency;

-- Switch to the tour_agency database
\c tour_agency;

-- Create clients table
CREATE TABLE tour_agency.clients (
    client_id bigserial,
    birth_date date,
    res_address text NOT NULL,
    vip_client boolean DEFAULT 'false',
    client_rating integer DEFAULT '0',
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(254) NOT NULL,
    phone varchar(15),
    PRIMARY KEY (client_id)
);

-- Create payments table
CREATE TABLE tour_agency.payments (
    payment_id bigserial,
    contract_id bigint,
    transaction_id varchar(20),
    payment_date date,
    amount decimal(9,2),
    currency varchar(10),
    PRIMARY KEY (payment_id),
    FOREIGN KEY (contract_id) REFERENCES tour_agency.contracts (contract_id)
);
