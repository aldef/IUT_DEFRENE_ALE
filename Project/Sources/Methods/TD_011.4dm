//%attributes = {}
// JOINTURE EXPLICITE

var $result : Text
var $i : Integer

ARRAY TEXT:C222($aArticle; 0)
ARRAY TEXT:C222($aBoutique; 0)

Begin SQL
	
	SELECT ARTICLE.Libelle, BOUTIQUE.Nom
	FROM ARTICLE
	INNER JOIN BOUTIQUE
	ON ARTICLE.ID_Boutique = BOUTIQUE.ID
	INTO :$aArticle, :$aBoutique;
	
End SQL

For ($i; 1; Size of array:C274($aArticle))
	$result+=$aArticle{$i}+" - "+$aBoutique{$i}+"\r"
End for 

ALERT:C41($result)