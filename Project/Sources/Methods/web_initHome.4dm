//%attributes = {"publishedWeb":true}
#DECLARE($in : Text)->$out : Text

ALL RECORDS:C47([EVENEMENT:1])
ORDER BY:C49([EVENEMENT:1]; [EVENEMENT:1]Libelle:2; >)