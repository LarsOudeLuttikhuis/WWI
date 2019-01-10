<?php 
include_once('Functions/global.php');
include 'navbar.php';?>
<link rel="stylesheet" href="opmaak/contact.css">

<div class="row" id="contatti">
<div class="container mt-5" >
    <div class="row" style="height:550px;">
      <div class="col-md-6">
        <h2 class="text-uppercase mt-3 font-weight-bold text-white">Contact</h2>
        <h5>Wide world Importers</h5>
        <div class="row">
          <div class="col-lg-1"></div>
            <div class="jumbotron col-lg-10">
              <div class="">
                Email:<br>
                <input type="text" class="form-control mt-2" value="WideWorldImporters@yopmail.com" readonly>
              </div>
              <br>
              <div class="">
                Telefoon:<br>
                <input type="text" class="form-control mt-2" value="+31 640179120" readonly>
              </div>
              <br>
              <div class="">
                Straat:<br>
                <input type="text" class="form-control mt-2" value="Campus 2" readonly>
              </div>
              <br>
              <div class="">
                <div class="col-md-6 contact">
                  Plaats:<br>
                  <input type="text" class="form-control mt-2" value="Zwolle" readonly>
                </div>
                <div class="col-md-6 contact">
                  Postcode:<br>
                  <input type="text" class="form-control mt-2" value="8017 CA" readonly>
                </div>
          
              </div>
            </div>
          <div class="col-lg-1"></div>
          </div>
        </div>
      <div class="col-md-6 maps" >
        <iframe src="https://maps.google.com/maps?width=100%&height=600&hl=nl&q=Campus%202+(Wide%20World%20Importers)&ie=UTF8&t=&z=14&iwloc=B&output=embed" frameborder="0" style="border:0" allowfullscreen</iframe>
      </div>
    </div>
</div>
</div>

<?php include 'footer.php';?>
