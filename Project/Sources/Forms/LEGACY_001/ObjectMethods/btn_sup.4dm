CONFIRM:C162("Etes-vous sûr de vouloir supprimer cet évènement ?")
If (OK=1)
	READ WRITE:C146([EVENEMENT:1])
	LOAD RECORD:C52([EVENEMENT:1])
	DELETE RECORD:C58([EVENEMENT:1])
	
	ui_loadEvenements
	ui_displayEvenements
End if 