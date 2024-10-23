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
