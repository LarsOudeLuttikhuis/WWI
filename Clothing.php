<?php
include 'navbar.php';
include 'Functions/global.php';
include 'Functions/sql.php';
ProductenOverzichtBekijken(2);
ToonProducten(); 
print($melding); 
sluitConnectiePDO();
include 'footer.php';
?>