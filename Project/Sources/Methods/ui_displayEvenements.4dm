//%attributes = {}
var $writeEnabled : Boolean

$writeEnabled:=Not:C34(Locked:C147([EVENEMENT:1])) & Is record loaded:C669([EVENEMENT:1])
OBJECT SET ENTERABLE:C238([EVENEMENT:1]Libelle:2; $writeEnabled)
OBJECT SET ENTERABLE:C238([EVENEMENT:1]Date_Debut:3; $writeEnabled)
OBJECT SET ENTERABLE:C238([EVENEMENT:1]Date_Fin:4; $writeEnabled)

OBJECT SET ENABLED:C1123(*; "btn_sup"; $writeEnabled)
OBJECT SET ENABLED:C1123(*; "btn_enr"; $writeEnabled)