use dbt2512;

BULK INSERT test.abtesting
FROM 'D:\data\notes\data\ab_test\ab_data_1.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,  -- optional, skip header row
    TABLOCK
);

EXEC sp_rename 'test.abtesting.group', '[group]', 'COLUMN';
