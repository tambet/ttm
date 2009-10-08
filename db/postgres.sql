CREATE SEQUENCE  customer_id  START 1;

CREATE TABLE customer (
	customer            NUMERIC(30,0)  CONSTRAINT customer_pk PRIMARY KEY DEFAULT NEXTVAL('customer_id'),
	first_name          VARCHAR(100),
	last_name           VARCHAR(100),
	identity_code       VARCHAR(20),
	note                VARCHAR(1000),
	created             TIMESTAMP,
	updated             TIMESTAMP,
	created_by          NUMERIC(30,0),
	updated_by          NUMERIC(30,0),
	birth_date          TIMESTAMP,
	cst_type            NUMERIC(2,0),
	cst_state_type      NUMERIC(2,0)   
);

CREATE SEQUENCE  s_contract  START 1;

CREATE TABLE contract (
	contract               NUMERIC(30,0) CONSTRAINT contract_pk PRIMARY KEY DEFAULT NEXTVAL('s_contract'),
	contract_manager       NUMERIC(30,0),
	contract_status_type   NUMERIC(30,0),
	customer               NUMERIC(30,0),
	contract_type          NUMERIC(30,0),
	cnt_number             VARCHAR(20),
	name                   VARCHAR(200),
	description            VARCHAR(300),
	valid_from             TIMESTAMP,
	valid_to               TIMESTAMP,
	parent_cnt             NUMERIC(30,0),
	created                TIMESTAMP,
	updated                TIMESTAMP,
	created_by             NUMERIC(30,0),
	updated_by             NUMERIC(30,0),
	conditions             VARCHAR(300),
	note                   VARCHAR(300),
	value_amount           NUMERIC(32,16),
	struct_unit            NUMERIC(30,0)
);

CREATE SEQUENCE  s_cst_address  START 1;

CREATE TABLE cst_address (
	cst_address                  NUMERIC(30,0) CONSTRAINT cst_address_pk PRIMARY KEY DEFAULT NEXTVAL('s_cst_address'),
	customer                       NUMERIC(30,0),
	zip                            VARCHAR(20),
	house                          VARCHAR(100),
	address                        VARCHAR(100),
	county                         VARCHAR(100),
	parish                         VARCHAR(100),
	town_county                    VARCHAR(100),
	address_type                   NUMERIC(30,0),
	phone                          VARCHAR(20),
	sms                            VARCHAR(20),
	mobile                         VARCHAR(20),
	email                          VARCHAR(30),
	note                           VARCHAR(50),
	country                        NUMERIC(30,0),
	created                        TIMESTAMP,
	updated                        TIMESTAMP,
	created_by                     NUMERIC(30,0),
	updated_by                     NUMERIC(30,0)
);
