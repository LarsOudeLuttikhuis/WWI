<?php
include_once 'Functions/global.php';
include 'navbar.php';
HomeProductenOverzichtBekijken(1);
ToonHomeProducten(); 
print($melding); 
sluitConnectiePDO();
include 'footer.php';
?>