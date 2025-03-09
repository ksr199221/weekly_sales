# Data Warehousing and Data Pipeline for weekly_sales

## Ways to Implement the Project:
***
**Option A: Through AWS**
***
- Historic Load:
  - Load files to s3
  - Crawl the data and create metadata in Glue Data Catalog
  - Use Glue Data Catalog tables and do preprocessing(data brew) and write to s3 in the form of delta
  - Read Delta tables and do the processing and write to s3.
  - Use copy command to load to redshift or use redshift_connector or psycopg2 to Load to redshift directly.
  - Use External Tables to read from s3 on Redshift.

- Incremental Load:
  - Use Event Driven Approach
  - When File Lands to s3, Create a Event Bridge Rule to call Stepfunction.
  - Create Task in Stepfunction to Call Glue Job.
  - Inside the Glue Job, Use Merge Query based on delta tables and do the Upserts.


***
**Option B: Through Azure**
***
- Historic Load:
  - Load files to adls gen2
  - create metadata in azure databrics unity catalog
  - read files from adls gen2 and do preprocessing and write to adls gen 2 in the form of delta
  - Read Delta tables and do the processing and write to adls gen 2.

- Incremental Load:
  - Use Event Driven Approach
  - When File Lands to ADLS Gen2, Invoke a ADF Pipeline
  - Inside the Pipeline, Call Azure Databricks Notebook and Send the file details as parameter
  - Use the Merge Query and do the Upserts and write to adls Gen2 in the form of delta.
 

## Ingest Data

## Data Validations

## Processing
