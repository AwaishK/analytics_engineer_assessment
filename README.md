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

1. Data Acquisition: If we had to read files from a different server we might need to perform this step to download the csv files from the server but here we have the files in a local directory so we will just collect the path to csv files. 

2. Data Versioning: We will add a `created_at` column in postgres with default as current timestamp, so whenever we add now rows it will add datetime column with current time. 

3. Staging:

* Load csv files to temporary tables.
* perform cleaning or renaming of columns. 
* checks for schema 
* load to staging table
* drop temporary tables
* Perform validations on the data e.g: if phone or email are correctled formatted. 

SQL FILES:
* staging_customers.sql
* create_temp_tables.sql

4. Data Loading:

Load data from staging_customers to customers table. 

SQL FILES:
customers.sql

### ERD Diagram
![erd](https://github.com/AwaishK/analytics_engineer_assessment/assets/18242446/db5f3e94-be55-4038-982d-2455c09f72b8)

### Security and Confidentiality 

* Limit Superuser Access: Avoid using the superuser (postgres) account for routine operations. Instead, create and use roles with minimal necessary privileges.

* Role-Based Access Control (RBAC): Grant permissions to database objects (tables, views, functions) based on roles rather than individual users. Use GRANT and REVOKE commands to manage permissions effectively.
* Encryption: Encrypting sensitive data such as email addresses and phone numbers in PostgreSQL (may be using extension `pgcrypto`).

### Role Diagram

![image](https://github.com/AwaishK/analytics_engineer_assessment/assets/18242446/d1e1f04b-0610-44cb-a29f-b2d23ca99c09)


## Part 1, Question 2 Transactions

Queries to load the data and to get the answers of the questions are in [transactions.sql](https://github.com/AwaishK/analytics_engineer_assessment/blob/main/transactions.sql) file. 


## Part 2, Question 3 Product Insights

1. The following business groups reported the highest sales figures:

    "MENS" Tops: 78,449 units
    "MENS" Other: 13,934 units
    "KIDS" Tops: 13,235 units
    "MENS" Bottoms: 11,358 units
2. The highest per-unit discount offers were observed in the Business group B&T Bottoms, despite only 180 units being sold overall.

3. Overall, Analysis of the data indicates a potential opportunity to expand our collection of Men's Tops, particularly focusing on popular colors such as black, white, and navy. Black emerged as the top-selling color among them. Sales of men's tops are approximately 590.56% higher than the sales of men's bottoms.

4. It also indicates that the increase in sales for Men's tops is predominantly from brick-and-mortar stores rather than Psycho Bunny's eCommerce platform. In response, Psycho Bunny can focus on two key strategies: 1) Enhancing promotional efforts for the eCommerce platform, and 2) Increasing stock availability in brick-and-mortar stores and expanding to more locations.

4. Since 2022, there has been no improvement in sales for men's bottoms or the men's other category. However, there has been an increase in sales for men's tops in the second, third, and fourth quarters of 2023 compared to 2022. Perhaps exploring a better product-market fit or increasing promotional efforts for other categories of men's could be beneficial.

5. The third fiscal quarter in both 2022 and 2023 consistently showed lower sales compared to other quarters, suggesting a recurring pattern. If this trend is influenced by Psycho Bunny's product alignment with seasonal demand, adjusting the clothing collections to better match consumer preferences could be beneficial. Alternatively, if the lower sales are more reflective of consumer behavior rather than product offerings, Psycho Bunny could consider shifting promotional strategies to other quarters to potentially enhance sales performance.

6. Fashion product types demonstrate significantly higher sales compared to other types. This suggests that quarterly sales are largely influenced by fashion production, while other types exhibit lower sales and minimal impact on overall figures.

7. In almost all the quarters, for men's tops, sales are highest for the following sizes in descending order: "M", "L", "S", "XL", "XXL", "XS", "XXXL", and "XXS". We should prioritize filling our inventory based on these size preferences.

8. Overall, 60% of the customers are repeat customers and 40% only made a purchase once. 
 Out of them 26% customers made purchase twice on Psycho Bunny. 
 And 32% made purchases more than two times. 

9. 40% of repeat customers prefer Psycho Bunny's eCommerce platform. This underscores the importance of investing in promotional activities to further promote Psycho Bunny's eCommerce presence.

