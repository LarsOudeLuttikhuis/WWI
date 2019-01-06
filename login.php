<?php include 'navbar.php'; ?>
<?php include 'Functions/login.php'?>
<?php include 'Functions/sql.php'?>
<?php
# Controleren of er input is vanuit de pagina.
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    # Controleren of het login formulier is gebruikt 
    if (isset($_POST['loginFormulier'])) {
        print('loginform is aangeklikt.000');
        if (isset($_POST['inputEmail']) && isset($_POST['inputPassword'])){
            $email = $_POST["inputEmail"];
            $pass = hash("md5", $_POST["inputPassword"]);
            CheckLogin2($email, $pass);
        }
    # Anders het registreerformulier afhandelen
    } else {
        //assume btnSubmit
    }
}
?>




<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <h1 class="form-heading">login Form</h1>
            <div class="login-form">
                <div class="main-div">
                    <div class="panel">
                        <p>Please enter your email and password</p>
                    </div>
                    <form id="Login" method="post" action="login.php">
                        <div class="form-group">
                            <input type="email" class="form-control" name="inputEmail" placeholder="Email Address">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="inputPassword" placeholder="Password">   
                        </div>
                        <div class="forgot">
                            <a href="reset.html">Forgot password?</a>
                        </div>
                        <button type="submit" name="loginFormulier" class="btn btn-primary">Login</button>
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
                    <form id="Login" method="post" action="register.php">
                        <div class="row form-group">
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="inputVoornaam" placeholder="Voornaam">
                            </div>
                            <div class="col-lg-2">
                                <input type="text" class="form-control" name="inputTussenvoegsel" placeholder="Tussenvoegsel">
                            </div>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="inputAchternaam" placeholder="Achternaam">
                            <br/>
                            </div> 
                            <div class="col-lg-12">
                                <input type="text" class="form-control" name="inputTelefoon" placeholder="Telefoon"> 
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-lg-12">
                                <input type="text" class="form-control" name="inputStraat" placeholder="Straat">
                                <br/>
                            </div>
                            <div class="col-lg-12">
                                <input type="text" class="form-control" name="inputHuisnummer" placeholder="Huisnummer"> 
                                <br/>
                            </div>
                            <div class="col-lg-12">
                                <input type="text" class="form-control" name="inputPostcode" placeholder="Postcode">  
                                <br/>
                            </div>
                            <div class="col-lg-12">
                                <input type="text" class="form-control" name="inputPlaats" placeholder="Plaats"> 
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-lg-12">
                                <input type="text" class="form-control" name="inputEmail" placeholder="Email"> 
                                <br/>
                            </div>
                            <label><?php $message ?></label>
                            <div class="col-lg-6">
                                <input type="password" class="form-control" name="inputWachtwoord" placeholder="Wachtwoord"> 
                            </div>
                            <div class="col-lg-6">
                                <input type="password" class="form-control" name="inputWachtwoord2" placeholder="Wachtwoord"> 
                            </div>
                            <!-- <?php #print($melding); ?> -->
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

<?php include 'footer.php'; ?>