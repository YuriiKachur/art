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
