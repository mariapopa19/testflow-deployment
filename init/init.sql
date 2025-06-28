IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'TestFlow')
BEGIN
    CREATE DATABASE TestFlow;
END
GO

USE TestFlow;
GO

-- Add your initial schema here
-- Example:
-- CREATE TABLE Users (
--     Id INT IDENTITY(1,1) PRIMARY KEY,
--     Email NVARCHAR(255) NOT NULL,
--     CreatedAt DATETIME2 DEFAULT GETDATE()
-- );

PRINT 'Database TestFlowDB created successfully';