# Data Warehousing and Data Pipeline for weekly_sales

## Ingest Data

## Data Validations

## Processing
=======
## Ways to Implement the Project:
***
**Option A: Through AWS**
***
- Historic Load:
  - Load files to s3
  - Crawl the data and create metadata in Glue Data Catalog
  - Use Glue Data Catalog tables and do preprocessing(data brew) and write to s3 in the form of delta
  - Read Delta tables and do the processing(glue) and write to s3.

- Incremental Load:
  - Use Event Driven Approach
  - When File Lands to s3, Create a Event Bridge Rule to call Stepfunction.
  - Create Task in Stepfunction to Call Glue Job.
  - Inside the Glue Job, Use Merge Query based on delta tables and do the Upserts.
  - Use copy command to load to redshift or use redshift_connector or psycopg2 to Load to redshift directly.
  - Use External Tables to read from s3 on Redshift.


***
**Option B: Through Azure**
***
- Historic Load:
  - Load files to adls gen2
  - create metadata in azure databrics unity catalog
  - read files from adls gen2 and do preprocessing and write to ADLS Gen2 in the form of delta
  - Read Delta tables and do the processing(azure db) and write to ADLS Gen2.

- Incremental Load:
  - Use Event Driven Approach
  - When File Lands to ADLS Gen2, Invoke a ADF Pipeline
  - Inside the Pipeline, Call Azure Databricks Notebook and Send the file details as parameter
  - Use the Merge Query and do the Upserts and write to ADLS Gen2 in the form of delta.
  - Use ADF or JBDC Connector to Load to Synapse
  - Use Synapse External Tables to read from ADLS Gen2


***
**Option C: Through Databricks**
***
- Historic Load:
  - Load files to DBFS
  - read files from DBFS and do preprocessing and write to DBFS in the form of delta
  - Create Database/Schema to save as delta Tables
  - Read Delta tables and do the processing and write to DBFS in the form of Delta Tables

- Incremental Load:
  - Read from External Storage Location or Upload to DBFS or Create Sample Data to Implement the Incremetal Load
  - Merge Incremental Data with Target Table and Perform Upsert
  - Check Incremental Data
  - Mount Any External Storage Location like S3, ADLS Gen2 to save the data further.
 
***
**Option D: Through Snowflake**
***
- Historic Load:
  - Load files to external storage locations like s3 or adls gen2
  - create external stage on the top of the file and copy into snowflake

- Incremental Load:
  - old way - Load data to snowflake using snowpipe and Use Streams and tasks for continuous CDC
  - New Way - Using Dynamic Tables
    
***
## Here I Implemented Using

- ~~AWS~~

- ~~Azure~~

- *Databricks*

- ~~Snowflake~~
  
***
## Data Ingestion and Validation:
1. **Notebook Names**
   ```sh
   Data_Ingestion.ipynb and Stage_Tables.ipynb
2. **Fact Tables**
   ```sh
   Transactions and Avergae Costs
3. **Dimension Tables**
   ```sh
   Product, Price State, RTLoc, PosSite, InvStatus, InvLoc, Holiday, Calendar
- Uploaded all .gz files to DBFS
- Read All Files and Created Dataframe to Infer Schema
- Checked for Null Values, Duplicate Records
- Checked for Foreign Key Constraint
  
***
## Data Processing:
1. **Notebook Names**
   ```sh
   Data_Processing.ipynb
- Read Delta Tables
- Done the Processing to get the weekly sales and created delta table
- Fetched Incremental Data for new and updated records
- Merged with weekly sales tables to do insert and updates.
>>>>>>> abf998597a385ab3a43f650f22e7c7231f634a9b
