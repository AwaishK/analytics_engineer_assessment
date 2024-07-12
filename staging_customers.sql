create table if not exists staging_customers (
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
