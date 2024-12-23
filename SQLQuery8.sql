use Pasha
GO 
--drop table Model 
--go
--drop table ModelTemp
--go
CREATE TABLE Model
(
 IdModel int PRIMARY KEY IDENTITY(1,1) NOT NULL,
 VIN nvarchar(20) NOT NULL , 
 [Name] nvarchar(50) NOT NULL , 
 NameType nvarchar(50) NOT NULL , 
 IdManufacturer int NOT NULL ,
 FOREIGN KEY (IdManufacturer)  REFERENCES Manufacturer (IdManufacturer)
)

CREATE TABLE ModelTemp
(
 VIN nvarchar(20) NOT NULL , 
 Firma  nvarchar(50) NOT NULL ,
 Model nvarchar(50) NOT NULL , 
 Kuzov nvarchar(50) NOT NULL 
)

INSERT INTO ModelTemp
SELECT DISTINCT Vin, Firma,  Model, Kuzov  FROM Export

INSERT INTO Model
SELECT 
VIN, Model, Kuzov, 
(
 select IdManufacturer from  Manufacturer 
 WHERE ModelTemp.Firma = Manufacturer 
) AS IdManufacturer
FROM ModelTemp

SELECT  * FROM Model
