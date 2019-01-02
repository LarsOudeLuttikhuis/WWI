<?php
include 'navbar.php';
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
HomeProductenOverzichtBekijken(1);
ToonHomeProducten(); 
print($melding); 
sluitConnectiePDO();
include 'footer.php';
?>