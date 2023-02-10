//%attributes = {}
var $maVar : Integer

Begin SQL
	
	SELECT COUNT(*) FROM BOUTIQUE
	INTO :$maVar;
	
End SQL

ALERT:C41(String:C10($maVar))