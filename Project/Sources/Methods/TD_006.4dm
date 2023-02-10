//%attributes = {}
var $result : Text
var $i : Integer

ARRAY TEXT:C222($aNoms; 0)
ARRAY INTEGER:C220($aIDs; 0)

Begin SQL
	
	SELECT Nom, ID FROM BOUTIQUE
	INTO :$aNoms, :$aIDs;
	
End SQL

For ($i; 1; Size of array:C274($aNoms)
	$result+=$aNoms{$i}+" - "+String:C10($aIDs{$i})+"\r"
End for 

ALERT:C41($result)