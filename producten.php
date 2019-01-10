<?php
include_once 'Functions/global.php';
include 'navbar.php';
$CiD = intval($_GET['Cid']);
ProductenOverzichtBekijken($CiD);
ToonProducten();
print($melding); 
sluitConnectiePDO();
include 'footer.php';
?>