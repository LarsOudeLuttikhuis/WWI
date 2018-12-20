<?php include 'navbar.php'; ?>
<?php include 'Functions/login-back.php'?>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <h1 class="form-heading">login Form</h1>
            <div class="login-form">
                <div class="main-div">
                    <div class="panel">
                        <p>Please enter your email and password</p>
                    </div>
                    <form id="Login" action="login.php">
                        <div class="form-group">
                            <input type="email" class="form-control" id="inputEmail" placeholder="Email Address">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="inputPassword" placeholder="Password">   
                        </div>
                        <div class="forgot">
                            <a href="reset.html">Forgot password?</a>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                    </div>
                </div>
        </div> 
        <div class="col-lg-6">
            <h1 class="form-heading">Registreer Form</h1>
            <div class="login-form">
                <div class="main-div">
                    <div class="panel">
                        <p>Please enter your email and password</p>
                    </div>
                    <form id="Login" method="get" action="login.php">
                        <div class="row form-group">
                            <div class="col-lg-5">
                                <input type="text" class="form-control" id="inputEmail" placeholder="Voornaam">
                            </div>
                            <div class="col-lg-2">
                                <input type="text" class="form-control" id="inputPassword" placeholder="Tussenvoegsel">
                            </div>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" id="inputPassword" placeholder="Achternaam">
                            <br/>
                            </div> 
                            <div class="col-lg-12">
                                <input type="text" class="form-control" id="inputTelefoon" placeholder="Telefoon"> 
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-lg-12">
                                <input type="text" class="form-control" id="inputStraat" placeholder="Straat">
                                <br/>
                            </div>
                            <div class="col-lg-12">
                                <input type="text" class="form-control" id="inputHuisnummer" placeholder="Huisnummer"> 
                                <br/>
                            </div>
                            <div class="col-lg-12">
                                <input type="text" class="form-control" id="inputPostcode" placeholder="Postcode">  
                                <br/>
                            </div>
                            <div class="col-lg-12">
                                <input type="text" class="form-control" id="inputPlaats" placeholder="Plaats"> 
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-lg-12">
                                <input type="text" class="form-control" id="inputEmail" placeholder="Email"> 
                                <br/>
                            </div>
                            <label><?php $message ?></label>
                            <div class="col-lg-6">
                                <input type="password" class="form-control" id="inputWachtwoord" placeholder="Wachtwoord"> 
                            </div>
                            <div class="col-lg-6">
                                <input type="password" class="form-control" id="inputWachtwoord2" placeholder="Wachtwoord"> 
                            </div>
                            <?php print($melding); ?>
                        </div>
                     <br>
                        <button name="submit" type="submit" class="btn btn-primary">Registreer</button>
                    </form>
                    </div>
                </div>
    </div>
</div>
<form name="form" action="" method="get">
  <input type="text" name="subject" id="subject" value="Car Loan">
</form>
<?php passwordCheck(); ?>
<?php include 'footer.php'; ?>