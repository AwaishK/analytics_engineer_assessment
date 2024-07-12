create table transactions(
	ORDERNUMBER integer,
	QUANTITYORDERED integer,
	ORDERLINENUMBER integer,
	TOTAL_AMOUNT integer,
	ORDERDATE timestamp,
	QTR_ID integer,
	MONTH_ID integer,
	YEAR_ID integer,
	PRODUCTCODE varchar(50),
	CUSTOMERNAME varchar,
	DEALSIZE varchar(10)
);

create table customer_info(
    CUSTOMERNAME varchar,
    PHONE varchar(50),
	ADDRESSLINE1 varchar,
	ADDRESSLINE2 varchar,
	CITY varchar(500),
	STATE varchar(500),
	POSTALCODE varchar(50),
	COUNTRY varchar(500),
	TERRITORY varchar(500),
	CONTACTLASTNAME varchar,
	CONTACTFIRSTNAME varchar,
);



\copy transactions(ORDERNUMBER, QUANTITYORDERED, ORDERLINENUMBER, TOTAL_AMOUNT, ORDERDATE, QTR_ID, MONTH_ID, YEAR_ID, PRODUCTCODE, CUSTOMERNAME, DEALSIZE) FROM '/Users/awaishkumar/Downloads/de_shop_transactions_20230821.csv' DELIMITER ',' CSV HEADER;
\copy customer_info(CUSTOMERNAME, PHONE, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY, TERRITORY, CONTACTLASTNAME, CONTACTFIRSTNAME) FROM '/Users/awaishkumar/Downloads/de_shop_transactions_20230821.csv' DELIMITER ',' CSV HEADER;

--- Queries to answer below questions

-- Q1: Provide the total amount of sales

select QTR_ID, MONTH_ID, YEAR_ID, sum(TOTAL_AMOUNT) as TOTAL_AMOUNT_OF_SALES
from transactions
where TOTAL_AMOUNT > 0
group by 1,2,3

-- Q2: Provide the total amount of sales

select QTR_ID, MONTH_ID, YEAR_ID, sum(TOTAL_AMOUNT) as TOTAL_AMOUNT_OF_REFUNDS
from transactions
where TOTAL_AMOUNT < 0
group by 1,2,3

-- Q3: Provide the total amount of items

select QTR_ID, MONTH_ID, YEAR_ID, sum(QUANTITYORDERED) as TOTAL_AMOUNT_OF_ITEMS_SOLD
from transactions
where TOTAL_AMOUNT > 0
group by 1,2,3

-- Q4: What's the unit price of the items?

select PRODUCTCODE, QTR_ID, MONTH_ID, YEAR_ID, sum(TOTAL_AMOUNT)/sum(QUANTITYORDERED) as unit_price
from transactions
where TOTAL_AMOUNT > 0
group by 1,2,3,4

-- Q5: Show the top 10 customers and their details so they can be contacted?

select 
	CUSTOMERNAME,
	PHONE,
	ADDRESSLINE1,
	ADDRESSLINE2,
	CITY,
	STATE,
	POSTALCODE,
	COUNTRY,
	TERRITORY,
	CONTACTLASTNAME,
	CONTACTFIRSTNAME
from customer_info
where CUSTOMERNAME in (
select CUSTOMERNAME
from transactions
where TOTAL_AMOUNT > 0
group by 1
order by sum(TOTAL_AMOUNT) desc
fetch first 10 rows only
)

