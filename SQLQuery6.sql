use Pasha
go
--drop table Drive
--go
CREATE TABLE Drive
(
 IdDrive int PRIMARY KEY IDENTITY(1,1) NOT NULL,
 Name nvarchar(50) NOT NULL , 
 FirstName nvarchar(50) NOT NULL , 
 NumberPermis nvarchar(20) NOT NULL 
 )


INSERT INTO Drive
SELECT DISTINCT Name , FerstName ,NumberUser   FROM Export ORDER BY FerstName

SELECT * FROM Drive
