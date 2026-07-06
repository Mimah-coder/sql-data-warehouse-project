/*================================================================================================
Stored Procedure: Load Bronze Layer(Source ->Bronze)
==================================================================================================
Script Purpose:
This stored procedure loads data into the bronze schema from external CSV files.
It performs the following actions:
Truncates the bronze tables before loading data
Uses the BULK INSERT command to load data from CSV files to bronze tables.
ParameterS:
None
This stored procedure does not accept any parameters or return any values
Usage Examples:
EXEC bronzw load_bronze;
====================================================================================================*/
--Lastly, we create a new stored procedure
GO
CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
--We want to know how long it takes to load the data not only the durations in the tables but also as the whole batch. So, first, we declare the variables we are using
DECLARE @start_time DATETIME,@end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
BEGIN
BEGIN TRY
PRINT '==================================================================================';
PRINT 'Loading the bronze layer'
PRINT '==================================================================================';
PRINT '----------------------------------------------------------------------------------';
PRINT 'Loading CRM Tables';
SET @batch_start_time = GETDATE();
SET @start_time = GETDATE();
PRINT '>>Truncatiing Table: crm_cust_info';
TRUNCATE TABLE bronze.crm_cust_info;
PRINT '>>Inserting Data into: crm_cust_info';
--We make the table empty then load from scratch using 'TRUNCATE'
BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\LENOVO\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
--We are telling sql to use the second row which has the data and not the first row of the file which is just a header.
FIRSTROW =2,
--We then tell the sql of the separater btwn fields which is dependent on the source file. Since it's a csv it uses commas as separaters
FIELDTERMINATOR = ',',
--We lock the entire table data as sql loads it through
TABLOCK
);
SET @end_time = GETDATE();
PRINT '>>Load Duration: ' + CAST (DATEDIFF(second, @start_time,@end_time)
AS NVARCHAR) + ' seconds';
PRINT '=================================================================';

SET @start_time = GETDATE();
PRINT '>>Truncatiing Table: bronze.crm_prd_info';
TRUNCATE TABLE bronze.crm_prd_info;
PRINT '>>Inserting Data into: bronze.crm_prd_info';
--We make the table empty, then load from scratch using 'TRUNCATE'
BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\LENOVO\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
--We are telling SQL to use the second row, which has the data and not the first row of the file, which is just a header.
FIRSTROW =2,
--We then tell the SQL of the separator between fields, which is dependent on the source file. Since it's a CSV, it uses commas as separators
FIELDTERMINATOR = ',',
--We lock the entire table data as SQL loads it through
TABLOCK
);
SET @end_time = GETDATE();
PRINT '>>Load Duration: ' + CAST (DATEDIFF(second, @start_time,@end_time)
AS NVARCHAR) + ' seconds';
PRINT '=================================================================';

SET @start_time = GETDATE();
PRINT '>>Truncatiing Table: bronze.crm_sales_details';
TRUNCATE TABLE bronze.crm_sales_details;
PRINT '>>Inserting Data into: bronze.crm_sales_details';
--We make the table empty, then load from scratch using 'TRUNCATE'
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\LENOVO\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
--We are telling SQL to use the second row, which has the data, and not the first row of the file, which is just a header.
FIRSTROW =2,
--We then tell the SQL of the separator between fields, which is dependent on the source file. Since it's a CSV, it uses commas as separators
FIELDTERMINATOR = ',',
--We lock the entire table data as SQL loads it through
TABLOCK
);
SET @end_time = GETDATE();
PRINT '>>Load Duration: ' + CAST (DATEDIFF(second, @start_time,@end_time)
AS NVARCHAR) + ' seconds';
PRINT '=================================================================';


PRINT '==================================================================================';
PRINT 'Loading the bronze layer'
PRINT '==================================================================================';
PRINT '----------------------------------------------------------------------------------';
PRINT 'Loading ERP Tables';


SET @start_time = GETDATE();
PRINT '>>Truncatiing Table: bronze.erp_cost_az12';
TRUNCATE TABLE bronze.erp_cost_az12;
PRINT '>>Inserting Data into: bronze.erp_cost_az12';
--We make the table empty, then load from scratch using 'TRUNCATE'
BULK INSERT bronze.erp_cost_az12
FROM 'C:\Users\LENOVO\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
--We are telling SQL to use the second row, which has the data, and not the first row of the file, which is just a header.
FIRSTROW =2,
--We then tell the SQL of the separator between fields, which is dependent on the source file. Since it's a CSV, it uses commas as separators
FIELDTERMINATOR = ',',
--We lock the entire table data as SQL loads it through
TABLOCK
);
SET @end_time = GETDATE();
PRINT '>>Load Duration: ' + CAST (DATEDIFF(second, @start_time,@end_time)
AS NVARCHAR) + ' seconds';
PRINT '=================================================================';

SET @start_time = GETDATE();
PRINT '>>Truncatiing Table: bronze.erp_loc_a101';
TRUNCATE TABLE bronze.erp_loc_a101;
PRINT '>>Inserting Data into: bronze.erp_loc_a101';
--We make the table empty then load from scratch using 'TRUNCATE'
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\LENOVO\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
--We are telling sql to use the second row which has the data and not the first row of the file which is just a header.
FIRSTROW =2,
--We then tell the sql of the separater btwn fields which is dependent on the source file. Since it's a csv it uses commas as separaters
FIELDTERMINATOR = ',',
--We lock the entire table data as sql loads it through
TABLOCK
);
SET @end_time = GETDATE();
PRINT '>>Load Duration: ' + CAST (DATEDIFF(second, @start_time,@end_time)
AS NVARCHAR) + ' seconds';
PRINT '=================================================================';

SET @start_time = GETDATE();
PRINT '>>Truncatiing Table: bronze.erp_px_cat_glv2';
TRUNCATE TABLE bronze.erp_px_cat_glv2;
PRINT '>>Inserting Data into: bronze.erp_px_cat_glv2';
--We make the table empty, then load from scratch using 'TRUNCATE'
BULK INSERT bronze.erp_px_cat_glv2
FROM 'C:\Users\LENOVO\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
--We are telling SQL to use the second row, which has the data, and not the first row of the file, which is just a header.
FIRSTROW =2,
--We then tell the SQL of the separator between fields, which is dependent on the source file. Since it's a CSV, it uses commas as separators
FIELDTERMINATOR = ',',
--We lock the entire table data as SQL loads it through
TABLOCK
);
SET @end_time = GETDATE();
PRINT '>>Load Duration: ' + CAST (DATEDIFF(second, @start_time,@end_time)
AS NVARCHAR) + ' seconds';
PRINT '=================================================================';
--This is how we see how long loading everything took as a batch took
SET @batch_end_time = GETDATE();
PRINT '=================================================================';
PRINT 'Loading Bronze Layer is Completed';
PRINT '>>Total Load Duration: ' + CAST (DATEDIFF(second, @batch_start_time,@batch_end_time)
AS NVARCHAR) + ' seconds';
PRINT '=================================================================';

END TRY
BEGIN CATCH
PRINT '======================================================================='
PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER'
PRINT 'Error Message'+ ERROR_MESSAGE();
PRINT 'Error Message'+ CAST(ERROR_NUMBER() AS NVARCHAR);
PRINT 'Error Message'+ CAST(ERROR_STATE() AS NVARCHAR);
PRINT '======================================================================='
END CATCH
END
