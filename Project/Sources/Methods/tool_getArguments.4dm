//%attributes = {}
/*
        -------------------------------------------
        tool_getArguments
        Created by: Mickael Rottiers
        Created the: 20/10/22
        -------------------------------------------
*/

C_OBJECT:C1216($0; $arguments)
C_LONGINT:C283($curseur)

$arguments:=New object:C1471

ARRAY TEXT:C222($aTNames; 0)
ARRAY TEXT:C222($aTValues; 0)
WEB GET VARIABLES:C683($aTNames; $aTValues)
For ($curseur; 1; Size of array:C274($aTNames))
	$arguments[$aTNames{$curseur}]:=$aTValues{$curseur}
End for 

$0:=$arguments