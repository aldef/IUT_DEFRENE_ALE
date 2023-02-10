//%attributes = {}
var $nbreArticleOrphelins : Integer
var $curs_articleOrphelin : Integer
var $intituleArticleOrphelin : Text

For ($curs_articleOrphelin; 1; 3)
	Case of 
		: ($curs_articleOrphelin=1)
			$intituleArticleOrphelin:="Frites"
		: ($curs_articleOrphelin=2)
			$intituleArticleOrphelin:="Hamburger"
		: ($curs_articleOrphelin=3)
			$intituleArticleOrphelin:="Coca Cola"
	End case 
	
	Begin SQL
		
		INSERT INTO ARTICLE 
		(Libelle, Prix_HT, Taux_TVA, ID_Boutique)
		VALUES
		(:$intituleArticleOrphelin, 2.4, 20, 11111);
		
	End SQL
	
End for 

ALERT:C41("Done")