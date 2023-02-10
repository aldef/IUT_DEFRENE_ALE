//%attributes = {}
Begin SQL
	
	INSERT INTO EVENEMENT
	(Libelle, Date_Debut, Date_Fin)
	VALUES
	('Amiens Fest', '2022-09-11 08:00:00', '2022-09-15 20:00:00');
	
	INSERT INTO EVENEMENT
	(Libelle, Date_Debut, Date_Fin)
	VALUES
	('Amiens Square', '2022-05-14 21:00:00', '2022-05-16 00:00:00');
	
	INSERT INTO EVENEMENT
	(Libelle, Date_Debut, Date_Fin)
	VALUES
	('Electro Amiens', '2022-10-10 22:30:00', '2022-10-11 02:00:00');
	
	
End SQL

ALERT:C41("Done")