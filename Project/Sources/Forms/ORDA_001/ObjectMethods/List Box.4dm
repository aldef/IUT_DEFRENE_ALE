Case of 
	: (Form event code:C388=On Load:K2:1)
		ui_loadUtilisateurs
		
	: (Form event code:C388=On Selection Change:K2:29)
		Form:C1466.UtilisateurAffiche:=Form:C1466.utilisateurSelectionne
		
	Else 
		
End case 