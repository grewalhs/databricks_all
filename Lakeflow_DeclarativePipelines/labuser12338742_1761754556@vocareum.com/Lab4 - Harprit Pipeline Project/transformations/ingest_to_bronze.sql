CREATE OR REFRESH STREAMING TABLE lab_1_bronze_db.employees_bronze_lab4  -- You will have to modify this to create a streaming table in the pipeline
AS
SELECT 
    *,
    current_timestamp() AS ingestion_time,
    _metadata.file_name as raw_file_name
FROM STREAM read_files(                                           -- You will have to modify FROM clause to incrementally read in data
    '${source}',  -- You will have to modify this path in the pipeline to your specific raw data source
    format => 'CSV',
    header => 'true'
);