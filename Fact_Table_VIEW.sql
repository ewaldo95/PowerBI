
--CREATE FACT-TABLE

CREATE VIEW [pbi].[FAKT_Tabelle] as

WITH fakten as (

SELECT	
		 CASE 
				WHEN LEN(CONCAT('000', kunde)) > 4 THEN CONCAT('00', kunde) 
				ELSE CONCAT('000', kunde) END as [Kundenummer] 
		,[Produkt]
		,[Stadt]
		,[Menge]
		,[Rabatt_%] = ([Rebatt]* 1.0) / 100   
		,[Datum]

FROM [dbo].[Fakte_Tabelle])

SELECT	 fk.Kundenummer
		,fk.Produkt
		,fk.Menge
		,fk.[Rabatt_%]
		,p.Preis
		,[Umsatz] = fk.Menge * p.Preis
		,CASE 
			WHEN fk.stadt IS NULL THEN kd.Stadt
			ELSE fk.stadt END as [Stadt] 
		
		,fk.Datum
       --,kd.kunde_id
	   

FROM fakten fk
LEFT JOIN [demo].[Kunde] kd
on kd.kunde_id = fk.Kundenummer
LEFT JOIN [pbi].DIM_Produkt p
on p.Produktnummer = fk.Produkt