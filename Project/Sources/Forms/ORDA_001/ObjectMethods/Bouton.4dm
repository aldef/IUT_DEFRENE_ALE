var $result : Object
$result:=Form:C1466.UtilisateurAffiche.lock(dk reload if stamp changed:K85:15)
If ($result.success)
	// C'est tout bon...
	// Activer les champs de saisie
	// Activer les boutons enregistrer et supp
Else 
	ALERT:C41("QQ1 est en train de modifier cet enr.")
End if 