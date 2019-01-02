<?php
include 'navbar.php';
include_once 'Functions/global.php';
$Pid = intval($_GET['Pid']);
ProductOverzichtBekijken($Pid);
ToonProduct();
sluitConnectiePDO();
include 'footer.php';
?>