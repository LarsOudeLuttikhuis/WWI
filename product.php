<?php
include 'navbar.php';
include_once 'Functions/global.php';
$Pid = intval($_GET['Pid']);
ProductOverzichtBekijken($Pid);
?>
<div class='container'>
        <div class='row'>
          <h3 class='title'> <?php echo $product["StockItemName"]?> </h3>
        </div>
        <div class='row'>
            <div class='col-md-3'>
                <img class='img-rounded' src='images/100x150.png' width='200' heigth='300'>
                <br/>
                <br/>
                <img class='img-rounded' src='images/100x150.png'> 
                 
                <img class='img-rounded' src='images/100x150.png'>
                <br/>
                <br/>
                <img class='img-rounded' src='images/100x150.png'>
                 
                <img class='img-rounded' src='images/100x150.png'>
            </div>
            <div class='col-md-4'>
                <h3 class='title'>Omschrijving</h3>
            </div>
            <div class='col-md-5'>
                <div class='row'>
                    <iframe  width='100%' height='300' src='https://www.youtube.com/embed/MrYbBcvdzIY' valing=right' frameborder='0' allowfullscreen></iframe>
                </div>
                <div class='row'>
                <table class='table'>
                <tr>
              <th class='th'><p style='text-align:left;'>€<?php echo $product["UnitPrice"]?></p>
                <form style='text-align:center;'>
                <select name='Quantity'>
                    <option value='1'>1</option>
                    <option value='2'>2</option>
                    <option value='3'>3</option>
                    <option value='4'>4</option>
                    <option value='5'>5</option>
                    <option value='6'>6</option>
                    <option value='7'>7</option>
                    <option value='8'>8</option>
                    <option value='9'>9</option>
                    <option value='10'>10</option>
                </select>
                </form> 
                 </th> 
                <th class='th'style='text-align:right;'><a class='btn btn-success' href='bevestiging.php?nummer=".$product["StockItemID"]."'>In Winkelwagen</a></th>
                </tr>
                </table>
                </div>
            </div>
        </div>
    </div>
<? include 'footer.php';
?>
