//%attributes = {}
var $curseur_evenement; $id_evenement; $nombre_aleatoire : Integer
var $nom_boutique : Text

ARRAY LONGINT:C221($IDsEvenements; 0)
ARRAY TEXT:C222($NomsBoutiques; 2)

$NomsBoutiques{0}:="Burger King"
$NomsBoutiques{1}:="KFC"
$NomsBoutiques{2}:="McDonalds"

Begin SQL
	
	SELECT ID FROM EVENEMENT
	INTO :$IDsEvenements;
	
End SQL

For ($curseur_evenement; 1; Size of array:C274($IDsEvenements))
	
	$nombre_aleatoire:=Random:C100 & 2
	$nom_boutique:=$NomsBoutiques{$nombre_aleatoire}
	
	$id_evenement:=$IDsEvenements{$curseur_evenement}
	
	
	Begin SQL
		INSERT INTO BOUTIQUE
		(Nom, ID_Evenement)
		VALUES
		(:$nom_boutique, :$id_evenement);
	End SQL
	
End for 


ALERT:C41("Done")