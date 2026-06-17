--Create Database and Schemas
--Script Purpose:
--This script creates a new database named 'DataWarehouse' after checking if it already exists.
--If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'

--WARNING
--Running the script will drop the entire 'DataWarehouse' database if it exists. All data in the database will be permanently deleted.
--Proceed with caution and ensure you have proper backups before running this script.


-- Switch to the master database
USE master;
GO

-- Create the DataWarehouse database if it doesn't already exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    CREATE DATABASE DataWarehouse;
    PRINT 'Database DataWarehouse created successfully.';
END
ELSE
    PRINT 'Database DataWarehouse already exists.';
GO

-- Switch to the new database
USE DataWarehouse;
GO

-- Create the bronze schema if it doesn't already exist
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
BEGIN
    CREATE SCHEMA bronze;
    PRINT 'Schema bronze created successfully.';
END
ELSE
    PRINT 'Schema bronze already exists.';
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
 
