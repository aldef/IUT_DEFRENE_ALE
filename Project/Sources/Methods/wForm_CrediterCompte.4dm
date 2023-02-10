//%attributes = {"publishedWeb":true}
#DECLARE($in : Text)->$out : Text
var $result : Object
$result:=New object:C1471

var $arguments : Object
$arguments:=tool_getArguments

If (web_context#Null:C1517)
	$result.error_code:=-1
	$result.error_message:="Veuillez renseigner tous les champs"
	// Vérifier si tous les champs sont présents et remplis
	Case of 
		: ($arguments.numero_cebe=Null:C1517)
		: ($arguments.expiration_cebe=Null:C1517)
		: ($arguments.montant=Null:C1517)
		: ($arguments.numero_cebe="")
		: ($arguments.expiration_cebe="")
		: ($arguments.montant="")
		Else 
			var $e_credit : cs:C1710.CREDITEntity
			
			$e_credit:=ds:C1482.CREDIT.new()
			$e_credit.Moyen_Paiement:="CB"
			$e_credit.Montant:=$arguments.montant
			$e_credit.Date_Credit:=Current date:C33
			$e_credit.Heure_Credit:=Current time:C178
			$e_credit.ID_Borne_Credit:=1
			$e_credit.ID_Utilisateur:=web_context.utilisateur_connecte.ID
			
			$e_credit.save()
			
			$result.error_code:=0
			$result.error_message:="OK"
	End case 
End if 

var $txt_result : Text
$txt_result:=JSON Stringify:C1217($result)
WEB SEND TEXT:C677($txt_result; "application/json")