//%attributes = {"publishedWeb":true}
#DECLARE($in : Text)->$out : Text
var $result : Object
$result:=New object:C1471

var $arguments : Object
$arguments:=tool_getArguments

$result.error_code:=-1
$result.error_message:="Veuillez renseigner tous les champs"
// Vérifier si tous les champs sont présents et remplis
Case of 
	: ($arguments.w_email=Null:C1517)
	: ($arguments.w_password=Null:C1517)
		
	: ($arguments.w_email="")
	: ($arguments.w_password="")
		
	Else 
		// C'est tout bon
		// Vérifier si l'utilisateur n'existe pas déjà
		// Sinon, le créer
		var $es_utilisateurs : cs:C1710.UTILISATEURSelection
		var $pass : Text
		$pass:=Generate digest:C1147($arguments.w_password; SHA256 digest:K66:4)
		$es_utilisateurs:=ds:C1482.UTILISATEUR.query("Email === :1 and Password_hash = :2"; $arguments.w_email; $pass)
		If ($es_utilisateurs.length=1)
			$result.error_code:=0
			$result.error_message:="OK"
			
			// Il faut mémoriser l'utilisateur connecté
			var web_context : Object
			If (web_context=Null:C1517)
				web_context:=New object:C1471
			End if 
			web_context.utilisateur_connecte:=$es_utilisateurs.first()
			
		Else 
			$result.error_code:=-2
			$result.error_message:="Identifiant/Mot de passe invalide."
		End if 
End case 

var $txt_result : Text
$txt_result:=JSON Stringify:C1217($result)
WEB SEND TEXT:C677($txt_result; "application/json")