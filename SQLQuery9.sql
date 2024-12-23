use Pasha
go
--DROP TABLE GAI
--GO
CREATE TABLE  GAI
(
 Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
 IdModel int  , 
 IdDrive int  ,
 NumberAvto nvarchar(20) NOT NULL ,
 DateReg Date NOT NULL ,
 FOREIGN KEY (IdModel)  REFERENCES Model (IdModel ),
 FOREIGN KEY (IdDrive)  REFERENCES Drive (IdDrive)
)



INSERT INTO GAI
SELECT
(
  SELECT IdModel  FROM  Model 
  WHERE Model.VIN  = Export.Vin  
) as IdModel,
(
  SELECT IdDrive  FROM  Drive 
  WHERE Drive.NumberPermis   = Export.NumberUser
) as IdDrive,
NumberAvto, 
DateReg
FROM Export

SELECT  * FROM GAI
