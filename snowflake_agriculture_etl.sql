 CREATE OR REPLACE STORAGE INTEGRATION PBI_Integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::00000000:role/powerbi.role'
  STORAGE_ALLOWED_LOCATIONS = ('s3://powerbi6.project/')
  COMMENT = 'Optional Comment'


  //description Integration Object
  desc integration PBI_Integration;

//drop integration PBI_Integration

//drop database PowerBI

CREATE database PowerBI;

create schema PBI_Data;

create table PBI_Dataset (
Year int,	Location string,	Area	int,
Rainfall	float, Temperature	float, Soil_type string,
Irrigation	string, yeilds	int,Humidity	float,
Crops	string,price	int,Season string



);

select * from PBI_Dataset;

//drop database test;

create stage PowerBI.PBI_Data.pbi_stage
url = 's3://powerbi6.project'
storage_integration = PBI_Integration

//desc stage s1

//drop stage s1;


copy into PBI_Dataset 
from @pbi_stage
file_format = (type=csv field_delimiter=',' skip_header=1 )
on_error = 'continue'

list @pbi_stage

SELECT YEAR,COUNT(*) COUNT FROM PBI_DATASET GROUP BY YEAR ORDER BY YEAR;


CREATE TABLE AGRICULTURE AS
SELECT * FROM PBI_DATASET;

SELECT * FROM AGRICULTURE;

UPDATE AGRICULTURE
SET RAINFALL = 1.1*RAINFALL;

UPDATE AGRICULTURE
SET AREA = 0.9*AREA;

SELECT * FROM AGRICULTURE;

//YEAR 2004 & 2009 - Y1
//YEAR 2010 & 2015 - Y2
//YEAR 2016 & 2019 - Y3

ALTER TABLE AGRICULTURE
ADD YEAR_GROUP STRING;


UPDATE AGRICULTURE
SET YEAR_GROUP = 'Y1'
WHERE YEAR >=2004 AND YEAR <=2009

UPDATE AGRICULTURE
SET YEAR_GROUP = 'Y2'
WHERE YEAR >=2010 AND YEAR <=2015

UPDATE AGRICULTURE
SET YEAR_GROUP = 'Y3'
WHERE YEAR >=2016 AND YEAR <=2019


ALTER TABLE AGRICULTURE
ADD RAINFALL_GROUPS STRING;

UPDATE AGRICULTURE
SET RAINFALL_GROUPS = 'LOW'
WHERE RAINFALL>=255 AND RAINFALL<1200

UPDATE AGRICULTURE
SET RAINFALL_GROUPS = 'MEDIUM'
WHERE RAINFALL>=1200 AND RAINFALL<2800

UPDATE AGRICULTURE
SET RAINFALL_GROUPS = 'HIGH'
WHERE RAINFALL>=2800 

