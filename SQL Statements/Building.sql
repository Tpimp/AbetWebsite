USE CSET_ABET_DB
Go
INSERT INTO Building(BuildingAbbr, BuildingName) VALUES
('PV', 'Purvine')
GO
UPDATE Building
SET BuildingAbbr = 'PV', BuildingName = 'Purvine'
GO
SELECT BuildingID, BuildingAbbr, BuildingName
FROM Building