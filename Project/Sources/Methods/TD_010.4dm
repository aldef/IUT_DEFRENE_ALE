//%attributes = {}
//JOINTURE IMPLICITE

var $result : Text
var $i : Integer

ARRAY TEXT:C222($aArticle; 0)
ARRAY TEXT:C222($aBoutique; 0)
ARRAY TEXT:C222($aBoutiqueSansArticle; 0)

Begin SQL
	
	SELECT ARTICLE.Libelle, BOUTIQUE.Nom
	FROM ARTICLE, BOUTIQUE
	WHERE ARTICLE.ID_Boutique = BOUTIQUE.ID
	ORDER BY ARTICLE.Libelle
	INTO :$aArticle, :$aBoutique;
	
End SQL

For ($i; 1; Size of array:C274($aArticle))
	$result+=$aArticle{$i}+" - "+$aBoutique{$i}+"\r"
End for 

ALERT:C41($result)