//%attributes = {}
READ ONLY:C145(*)
ALL RECORDS:C47([EVENEMENT:1])  // Automatiquement, il charge le premier
ORDER BY:C49([EVENEMENT:1]; [EVENEMENT:1]Libelle:2; >)  // Automatiquement, il charge le premier
UNLOAD RECORD:C212([EVENEMENT:1])  // On libère le premier
