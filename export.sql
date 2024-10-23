CREATE TABLE IF NOT EXISTS tour_agency.agents (
agent_id bigserial,
agent_code varchar(10) UNIQUE,
is_agent_active boolean NOT NULL DEFAULT 'true',
agent_details text,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
email varchar(254) NOT NULL,
phone varchar(15),

PRIMARY KEY (agent_id)
);

-- Юрій
CREATE TABLE IF NOT EXISTS tour_agency.clients (
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


-- Дмитро
CREATE TABLE IF NOT EXISTS tour_agency.services (
service_id bigserial,
service_name varchar(100) NOT NULL UNIQUE,
service_description text,

PRIMARY KEY (service_id)
);

-- Артур
CREATE TABLE IF NOT EXISTS tour_agency.resort_types (
resort_type_id bigserial,
resort_type_name varchar(100) NOT NULL UNIQUE,

PRIMARY KEY (resort_type_id)
);

-- Артур
CREATE TABLE IF NOT EXISTS tour_agency.resorts (
resort_id bigserial,
resort_name varchar(50) NOT NULL UNIQUE,
resort_type_id bigint,
resort_quality integer,
country varchar(56) NOT NULL,
location varchar(168) NOT NULL,

PRIMARY KEY (resort_id),

FOREIGN KEY (resort_type_id) REFERENCES tour_agency.resort_types (resort_type_id)
);

-- Ольга
CREATE TABLE IF NOT EXISTS tour_agency.photos (
photo_id bigserial,
resort_id bigint,
title varchar(50) NOT NULL,
file_path varchar(254) NOT NULL,
views_count integer,
likes_count integer,
upload_date date,
photo_tags varchar(254),

PRIMARY KEY (photo_id),

FOREIGN KEY (resort_id) REFERENCES tour_agency.resorts (resort_id)
);

-- Дмитро
CREATE TABLE IF NOT EXISTS tour_agency.comments (
comment_id bigserial,
photo_id bigint,
client_id bigint,
comment_text text,
comment_date date,

PRIMARY KEY (comment_id),

FOREIGN KEY (photo_id) REFERENCES tour_agency.photos (photo_id),
FOREIGN KEY (client_id) REFERENCES tour_agency.clients (client_id)
);

-- Олексій
CREATE TABLE IF NOT EXISTS tour_agency.offers (
offer_id bigserial,
resort_id bigint,
service_id bigint,
start_date date,
end_date date,
price decimal(9,2),
discount decimal(4,2),

PRIMARY KEY (offer_id),

FOREIGN KEY (resort_id) REFERENCES tour_agency.resorts (resort_id),
FOREIGN KEY (service_id) REFERENCES tour_agency.services (service_id)

);

-- Ольга
CREATE TABLE IF NOT EXISTS tour_agency.contracts (
contract_id bigserial,
client_id bigint,
agent_id bigint,
offer_id bigint,
signing_date date,
contract_status varchar(20) NOT NULL DEFAULT 'Initiated',
agent_commision decimal(4,2) NOT NULL DEFAULT '0',

PRIMARY KEY (contract_id),

FOREIGN KEY (client_id) REFERENCES tour_agency.clients (client_id),
FOREIGN KEY (agent_id) REFERENCES tour_agency.agents (agent_id),
FOREIGN KEY (offer_id) REFERENCES tour_agency.offers (offer_id)
);

-- Юрій
CREATE TABLE IF NOT EXISTS tour_agency.payments (
payment_id bigserial,
contract_id bigint,
transaction_id varchar(20),
payment_date date,
amount decimal(9,2),
currency varchar(10),

PRIMARY KEY (payment_id),

FOREIGN KEY (contract_id) REFERENCES tour_agency.contracts (contract_id)
);
