CREATE TEMPORARY TABLE de_shop_customers_20230901 (
    first_name varchar,
    last_name varchar,
    company_name varchar,
    address varchar,
    city varchar(500),
    province varchar(500),
    postal varchar(10),
    phone1 varchar(12),
    phone2 varchar(12), 
    email varchar(500),
    web varchar(500)
);

CREATE TEMPORARY TABLE de_shop_customers_20230619 (
    first_name varchar,
    last_name varchar,
    company_name varchar,
    address varchar,
    city varchar(500),
    country varchar(500),
    postal varchar(10),
    phone1 varchar(12),
    phone2 varchar(12), 
    email varchar(500),
    web varchar(500)
);

CREATE TEMPORARY TABLE de_shop_customers_20240614 (
    first_name varchar,
    last_name varchar,
    company_name varchar,
    address varchar,
    city varchar(500),
    country varchar(500),
    state varchar(500),
    zip varchar(10),
    phone1 varchar(12),
    phone2 varchar(12), 
    email varchar(500),
    web varchar(500)
);

CREATE TEMPORARY TABLE de_shop_customers_20240701 (
    first_name varchar,
    last_name varchar,
    company_name varchar,
    address varchar,
    city varchar(500),
    state varchar(500),
    post varchar(10),
    phone1 varchar(12),
    phone2 varchar(12), 
    email varchar(500),
    web varchar(500)
);

\copy de_shop_customers_20230901(first_name, last_name, company_name, address, city, province, postal, phone1, phone2, email, web)
FROM '/Users/awaishkumar/Downloads/de_shop_customers_20230901.csv'
DELIMITER ','
CSV HEADER;

\copy de_shop_customers_20230901(first_name, last_name, company_name, address, city, country, postal, phone1, phone2, email, web)
FROM '/Users/awaishkumar/Downloads/de_shop_customers_20230619.csv'
DELIMITER ','
CSV HEADER;

\copy de_shop_customers_20230901(first_name, last_name, company_name, address, city, country, state, zip, phone1, phone2, email, web)
FROM '/Users/awaishkumar/Downloads/de_shop_customers_20240614.csv'
DELIMITER ','
CSV HEADER;

\copy de_shop_customers_20230901(first_name, last_name, company_name, address, city, state, post, phone1, phone2, email, web)
FROM '/Users/awaishkumar/Downloads/de_shop_customers_20240701.csv'
DELIMITER ','
CSV HEADER;

INSERT INTO staging_customers (
    first_name,
    last_name,
    company_name,
    address,
    city,
    country,  -- renamed from 'web'
    province_or_state,  -- renamed from 'province'
    postal,
    phone1,
    phone2,
    email,
    web,
    created_at
)
SELECT
    first_name,
    last_name,
    company_name,
    address,
    city,
    null AS country,  
    province AS province_or_state, 
    postal,
    phone1,
    phone2,
    email,
    web,
    NOW() AS created_at  -- set default value for 'created_at'
FROM de_shop_customers_20230901;

INSERT INTO staging_customers (
    first_name,
    last_name,
    company_name,
    address,
    city,
    country, 
    province_or_state,
    postal,
    phone1,
    phone2,
    email,
    web,
    created_at
)
SELECT
    first_name,
    last_name,
    company_name,
    address,
    city,
    country,
    null AS province_or_state,
    postal,
    phone1,
    phone2,
    email,
    web,
    NOW() AS created_at  -- set default value for 'created_at'
FROM de_shop_customers_20230619;

INSERT INTO staging_customers (
    first_name,
    last_name,
    company_name,
    address,
    city,
    country, 
    province_or_state,
    postal,
    phone1,
    phone2,
    email,
    web,
    created_at
)
SELECT
    first_name,
    last_name,
    company_name,
    address,
    city,
    country,
    state AS province_or_state,
    zip as postal,
    phone1,
    phone2,
    email,
    web,
    NOW() AS created_at  -- set default value for 'created_at'
FROM de_shop_customers_20240614;

INSERT INTO staging_customers (
    first_name,
    last_name,
    company_name,
    address,
    city,
    country, 
    province_or_state,
    postal,
    phone1,
    phone2,
    email,
    web,
    created_at
)
SELECT
    first_name,
    last_name,
    company_name,
    address,
    city,
    state AS province_or_state,
    post as postal,
    phone1,
    phone2,
    email,
    web,
    NOW() AS created_at  -- set default value for 'created_at'
FROM de_shop_customers_20240701;

drop table de_shop_customers_20230901;
drop table de_shop_customers_20230619;
drop table de_shop_customers_20240614;
drop table de_shop_customers_20240701;
