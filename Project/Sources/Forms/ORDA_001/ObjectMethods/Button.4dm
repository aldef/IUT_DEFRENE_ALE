// Remplacer POSTE par CREDIT
// ET ENTREPRISE par UTILISATEUR
var $utilisateur : cs:C1710.UTILISATEUREntity
$utilisateur:=ds:C1482.UTILISATEUR.new()
$utilisateur.Nom:="Truc"
$utilisateur.Prenom:="Truc"
$utilisateur.Email:="truc@truc.truc"
$utilisateur.Password_hash:=Generate digest:C1147("Truc"; SHA256 digest:K66:4)
$utilisateur.save()
ui_loadUtilisateurs
