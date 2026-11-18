CREATE OR REPLACE TABLE `dw-project-sql.silver.crm_cust_info` AS 

WITH flag AS (

SELECT *, 
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
FROM `dw-project-sql.bronze.crm_cust_info`
)

SELECT 
  cst_id,
  cst_key,
  cst_create_date,
  INITCAP(TRIM(cst_firstname)) AS cst_firstname,
  INITCAP(TRIM(cst_lastname)) AS cst_lastname,
  CASE
    WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
    WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
    ELSE 'N/A'
  END AS cst_gndr,
   CASE
    WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
    WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
    ELSE 'N/A'
  END AS cst_marital_status,
FROM flag
WHERE flag_last = 1;
