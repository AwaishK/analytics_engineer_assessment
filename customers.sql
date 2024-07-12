create table if not exists customers (
    first_name varchar,
    last_name varchar,
    company_name varchar,
    address varchar,
    city varchar(500),
    country varchar(500),
    province_or_state varchar(500),
    postal varchar(10),
    phone1 varchar(12),
    phone2 varchar(12), 
    email varchar(500),
    web varchar(500),
    created_at TIMESTAMP DEFAULT NOW()
);


INSERT INTO customers (
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
    province_or_state,
    postal,
    phone1,
    phone2,
    email,
    web,
    created_at
FROM staging_customers;
