//%attributes = {"publishedWeb":true}
#DECLARE($in : Text)->$out : Text
var web_context : Object

web_context.soldeTotal:=0

If (web_context#Null:C1517)
	var $credit : cs:C1710.CREDITEntity
	var $credits : cs:C1710.CREDITSelection
	$credits:=ds:C1482.CREDIT.query("ID_Utilisateur === :1"; web_context.utilisateur_connecte.ID)
	
	For each ($credit; $credits)
		web_context.soldeTotal:=web_context.soldeTotal+$credit.Montant
	End for each 
	
	
	
End if 