//%attributes = {"publishedWeb":true}
#DECLARE($in : Text)->$out : Text

var web_context : Object
If (web_context#Null:C1517)
	web_context.utilisateur_connecte:=Null:C1517
End if 

WEB SEND HTTP REDIRECT:C659("/home.shtml")