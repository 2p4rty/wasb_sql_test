CREATE TABLE EMPLOYEE
AS 
SELECT * FROM UNNEST(ARRAY[
ROW(1,'Ian','James','CEO',4),
ROW(2,'Umberto','Torrielli','CSO',1),
ROW(3,'Alex','Jacobson','MD EMEA',2),
ROW(4,'Darren','Poynton','CFO',2),
ROW(5,'Tim','Beard','MD APAC',2),
ROW(6,'Gemma','Dodd','COS',1),
ROW(7,'Lisa','Platten','CHR',6),
ROW(8,'Stefano','Camisaca','GM Activation',2),
ROW(9,'Andrea','Ghibaudi','MD NAM',2)]
) AS t(employee_id,first_name,last_name,job_title,manager_id);

ALTER TABLE EMPLOYEE ALTER COLUMN employee_id SET DATA TYPE tinyint;
ALTER TABLE EMPLOYEE ALTER COLUMN manager_id SET DATA TYPE tinyint;