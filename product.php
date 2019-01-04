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
<h4>Quantity</h4>
<form>
  <select name="Quantity">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
  </select>
  <br><br>
  <input type="submit" value="Add to chart">
</form>
</div>
</body>
</html>
<?php
include 'footer.php';
?>
