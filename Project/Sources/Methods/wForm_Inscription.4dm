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
	: ($arguments.w_nom=Null:C1517)
	: ($arguments.w_prenom=Null:C1517)
	: ($arguments.w_email=Null:C1517)
	: ($arguments.w_password=Null:C1517)
		
	: ($arguments.w_nom="")
	: ($arguments.w_prenom="")
	: ($arguments.w_email="")
	: ($arguments.w_password="")
		
	Else 
		$result.error_code:=0
		$result.error_message:="OK"
		// C'est tout bon
		// Vérifier si l'utilisateur n'existe pas déjà
		// Sinon, le créer
		var $es_utilisateurs : cs:C1710.UTILISATEURSelection
		$es_utilisateurs:=ds:C1482.UTILISATEUR.query("Email === :1"; $arguments.w_email)
		If ($es_utilisateurs.length=0)
			var $e_utilisateur : cs:C1710.UTILISATEUREntity
			$e_utilisateur:=ds:C1482.UTILISATEUR.new()
			$e_utilisateur.Nom:=$arguments.w_nom
			$e_utilisateur.Prenom:=$arguments.w_prenom
			$e_utilisateur.Email:=$arguments.w_email
			$e_utilisateur.Password_hash:=Generate digest:C1147($arguments.w_password; SHA256 digest:K66:4)
			$e_utilisateur.Solde:=0
			$e_utilisateur.save()
		Else 
			$result.error_code:=-2
			$result.error_message:="Utilisateur déjà existant"
		End if 
End case 

var $txt_result : Text
$txt_result:=JSON Stringify:C1217($result)
WEB SEND TEXT:C677($txt_result; "application/json")