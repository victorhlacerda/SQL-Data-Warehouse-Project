CREATE OR REPLACE TABLE `dw-project-sql.silver.crm_prd_info` AS

SELECT 
  prd_id,   
  REPLACE(SUBSTRING(prd_key,1,5),'-','_') AS cat_key,
  SUBSTRING(prd_key, 7, LENGTH(prd_key)) AS prd_key,    
  prd_nm,    
  COALESCE(prd_cost, 0) AS prd_cost,    
  CASE 
    WHEN UPPER(TRIM(prd_line)) = "M" THEN 'Mountain'
    WHEN UPPER(TRIM(prd_line)) = "R" THEN 'Road'
    WHEN UPPER(TRIM(prd_line)) = "S" THEN 'Other Sales'
    WHEN UPPER(TRIM(prd_line)) = "T" THEN 'Touring'
    ELSE 'N/A'
  END AS prd_line,
  CAST(prd_start_dt AS DATE) AS prd_start_dt,
  CAST(LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)-1 AS DATE) AS prd_end_dt
FROM `dw-project-sql.bronze.crm_prd_info`;
