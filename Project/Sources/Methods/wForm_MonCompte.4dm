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
	: (web_context.utilisateur_connecte=Null:C1517)
		$result.error_code:=-2
		$result.error_message:="Vous devez être connecté"
		
	: ($arguments.w_nom=Null:C1517)
	: ($arguments.w_prenom=Null:C1517)
	: ($arguments.w_email=Null:C1517)
		//: ($arguments.w_password=Null)
		
	: ($arguments.w_nom="")
	: ($arguments.w_prenom="")
	: ($arguments.w_email="")
		//: ($arguments.w_password="")
		
	Else 
		$result.error_code:=0
		$result.error_message:="OK"
		// C'est tout bon
		// Vérifier si l'utilisateur n'existe pas déjà
		// Sinon, le créer
		
		web_context.utilisateur_connecte.Nom:=$arguments.w_nom
		web_context.utilisateur_connecte.Prenom:=$arguments.w_prenom
		web_context.utilisateur_connecte.Email:=$arguments.w_email
		
		If ($arguments.w_password#Null:C1517)
			If ($arguments.w_password#"")
				web_context.utilisateur_connecte.Password_hash:=Generate digest:C1147($arguments.w_password; SHA256 digest:K66:4)
			End if 
		End if 
		
		web_context.utilisateur_connecte.save()
		
		
		//var $es_utilisateurs : cs.UTILISATEURSelection
		//$es_utilisateurs:=ds.UTILISATEUR.query("AdresseEMail === :1"; $arguments.w_email)
		//If ($es_utilisateurs.length=0)
		//var $e_utilisateur : cs.UTILISATEUREntity
		//$e_utilisateur:=ds.UTILISATEUR.new()
		//$e_utilisateur.Nom:=$arguments.w_nom
		//$e_utilisateur.Prenom:=$arguments.w_prenom
		//$e_utilisateur.AdresseEMail:=$arguments.w_email
		//$e_utilisateur.PasswordHash:=Generate digest($arguments.w_password; SHA256 digest)
		//$e_utilisateur.save()
		//Else 
		//$result.error_code:=-2
		//$result.error_message:="Utilisateur déjà existant"
		//End if 
End case 

var $txt_result : Text
$txt_result:=JSON Stringify:C1217($result)
WEB SEND TEXT:C677($txt_result; "application/json")