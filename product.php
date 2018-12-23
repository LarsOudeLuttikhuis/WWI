<?php
include 'navbar.php';
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
$id = intval($_GET['id']);
ProductOverzichtBekijken($id);
ToonProduct();
sluitConnectiePDO();
include 'footer.php';
?>