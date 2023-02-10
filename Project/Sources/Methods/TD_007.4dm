//%attributes = {}
var $result : Text
var $curs_boutique; $curs_article; $idBoutique : Integer
var $nbreArticles : Integer
var $intituleArticle : Text
var $prix : Real

// Pour commencer, on récupère les IDs de l'ensemble des BOUTIQUEs
ARRAY LONGINT:C221($aIDs; 0)



Begin SQL
	
	SELECT ID FROM BOUTIQUE
	INTO :$aIDs;
	
End SQL

// Maintenant on boucle sur les boutiques pour créer des articles
For ($curs_boutique; 1; Size of array:C274($aIDs))
	
	// On définit le nombre d'articles à créer au hasard
	$nbreArticles:=Random:C100%5  // 0, 1, 2, 3 ou 4
	
	For ($curs_article; 1; $nbreArticles)
		
		// On définit le nom de l'article
		Case of 
			: ($curs_article=1)
				$intituleArticle:="Frites"
			: ($curs_article=2)
				$intituleArticle:="Hamburger"
			: ($curs_article=3)
				$intituleArticle:="Coca Cola"
			Else 
				$intituleArticle:="Ice Tea"
		End case 
		
		$idBoutique:=$aIDs{$curs_boutique}
		
		$prix:=Random:C100%5
		
		Begin SQL
			
			INSERT INTO ARTICLE
			(Libelle, Prix_HT, Taux_TVA, ID_Boutique)
			VALUES
			(:$intituleArticle, :$prix, 20, :$idBoutique);
			
		End SQL
		
		
	End for 
	
End for 

ALERT:C41("Done")