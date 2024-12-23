use Pasha
GO 

CREATE TABLE Manufacturer
(
 IdManufacturer int PRIMARY KEY IDENTITY(1,1) NOT NULL,
 Manufacturer nvarchar(50) NOT NULL
)

INSERT INTO Manufacturer
SELECT DISTINCT Firma FROM Export ORDER BY Firma

SELECT  * FROM Manufacturer
