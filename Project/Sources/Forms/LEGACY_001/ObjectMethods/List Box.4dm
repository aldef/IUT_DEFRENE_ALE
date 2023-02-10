var $colonne; $ligne : Integer

If (Form event code:C388=On Load:K2:1)
	ui_loadEvenements
	ui_displayEvenements
End if 

If (Form event code:C388=On Selection Change:K2:29)
	LISTBOX GET CELL POSITION:C971(*; "List Box"; $colonne; $ligne)
	If ($ligne>0)
		// Charger l'enregistrement qui se trouve àa la position
		// $ligne de ma sélection courante
		GOTO SELECTED RECORD:C245([EVENEMENT:1]; $ligne)
	End if 
End if 