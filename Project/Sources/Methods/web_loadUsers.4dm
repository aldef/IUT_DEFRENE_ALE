//%attributes = {"publishedWeb":true}
#DECLARE($in : Text)->$out : Text
var web_context : Object
If (web_context=Null:C1517)
	web_context:=New object:C1471
End if 

//var es_users : cs.UTILISATEURSelection
web_context.es_users:=ds:C1482.UTILISATEUR.all().orderBy("Nom asc, Prenom asc")
