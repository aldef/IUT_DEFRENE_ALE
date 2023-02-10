//%attributes = {"publishedWeb":true}
#DECLARE($in : Text)->$out : Text
var $result : Object
$result:=New object:C1471

var $arguments : Object
$arguments:=tool_getArguments

If (web_context.utilisateur_connecte=Null:C1517)
	$result.error_code:=-1
	$result.error_message:="Pas connecté"
Else 
	$requete:=ds:C1482.PARTICIPATION.query("ID_Evenement === :1 and ID_Utilisateur === :2"; $arguments.w_evenement; $arguments.w_id_utilisateur)
	If ($requete.length>0)
		$result.error_code:=-2
		$result.error_message:="Vous êtes déjà inscrit."
	Else 
		var $nouvelleParticipation : cs:C1710.PARTICIPATIONEntity
		
		$nouvelleParticipation:=ds:C1482.PARTICIPATION.new()
		$nouvelleParticipation.ID_Evenement:=$arguments.w_evenement
		$nouvelleParticipation.ID_Utilisateur:=$arguments.w_id_utilisateur
		
		$nouvelleParticipation.save()
		
		$result.error_code:=0
		$result.error_message:="Vous êtes désormais inscrit."
	End if 
End if 

var $txt_result : Text
$txt_result:=JSON Stringify:C1217($result)
WEB SEND TEXT:C677($txt_result; "application/json")