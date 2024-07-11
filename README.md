# analytics_engineer_assessment

## Part 1, Question 1 Customers Files
Here's a flow diagram of the process involved in ingesting data from CSV files:

* Data Acquisition: Collect the CSV files from sources.
* Pre-Ingestion Validation: Validate schema and perform initial data quality checks.
* Data Parsing and Transformation: Parse, clean, and normalize the data.
* Data Versioning: Add version numbers or use sharding for tracking changes.
* Staging: Load data into a staging area for further validation.
* Data Loading: Bulk load data from the staging area into the target database.
* Post-Ingestion Validation: Verify data consistency and accuracy.
* Monitoring and Logging: Implement logging and monitoring for the ingestion process.
* Error Handling and Recovery: Capture errors and implement recovery mechanisms.
* Documentation and Reporting: Document the process and generate reports on data quality.

This visual representation outlines the key steps in ensuring a robust data ingestion process

![Flowchart (2)](https://github.com/AwaishK/analytics_engineer_assessment/assets/18242446/00c47e77-bc01-42ac-8639-41a278e19374)



For the purpose of this task, we might not touch all the steps involved because they need to be in a complete project. 

I will be using postgres here to load csv files to the database. 

Data Acquisition: If we had to read files from a different server we might need to perform this step to download the csv files from the server but here we have the files in a local directory so we will just collect the path to csv files. 

Data Versioning: We will add a `created_at` column in postgres with default as current timestamp, so whenever we add now rows it will add datetime column with current time. 

Staging:

```sql
create table if not exists staging_customers (
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
    web varchar(500),
    created_at TIMESTAMP DEFAULT NOW()
);
```
