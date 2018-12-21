<?php
include 'navbar.php';
include_once 'Functions/global.php';
include_once 'Functions/sql.php';
ProductenOverzichtBekijken();
?>
<?php ToonProducten(9); ?>
<?php print($melding); 

sluitConnectiePDO();
include 'footer.php';
?>