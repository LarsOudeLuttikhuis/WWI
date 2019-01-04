<?php
include 'navbar.php';
include_once 'Functions/global.php';
$Pid = intval($_GET['Pid']);
ProductOverzichtBekijken($Pid);
ToonProduct();
sluitConnectiePDO();
?>
<!DOCTYPE html>
<html>
<body>
<div align= "right">
<h4>Aantal</h4>
<form>
  <select name="aantal">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
  </select>
  <br><br>
  <input type="submit">
</form>
</div>
</body>
</html>
<?php
include 'footer.php';
?>
