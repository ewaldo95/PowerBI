
--Erstellung DIM Produkt

CREATE VIEW [pbi].[DIM_Produkt] as

SELECT	
		[Produkt_ID]   AS [Produktnummer]
      ,[Produkt_gruppe] 
      ,[Produkt]
      ,[Preis]
  FROM [testDB].[dbo].[Produkt]
GO

/********************************************************************************************************************************
********************************************************************************************************************************/

--Erstellung DIM Kunde

CREATE VIEW [pbi].[DIM_Kunde] as

SELECT	
		[Kunde_id] as [Kundenummer]
      ,[Vorname]
      ,[Nachname]
      ,[Kunde_Alter]
      ,[Stadt]
  FROM [testDB].[demo].[Kunde]

UNION ALL 

SELECT 
		[Kd_id] = '0026',
		[Vorname] = 'Umbekannt',
		[nachname] = 'Umbekannt',
		[kd_alter] = null,
		[Stadt] = 'Wien'

UNION ALL
SELECT
		[Kd_id] = '0027',
		[Vorname] = 'Umbekannt',
		[nachname] = 'Umbekannt',
		[kd_alter] = null,
		[Stadt] = 'Wien'

/********************************************************************************************************************************
********************************************************************************************************************************/

--Erstellung Dimention Region

CREATE VIEW [pbi].[DIM_Region] as

SELECT	
		 [City] as [Stadt],
		[Country] as [Land]
		

FROM [dbo].[DIM Region]
WHERE City <> 'Stadt'

--