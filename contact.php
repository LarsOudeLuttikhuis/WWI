<?php include 'navbar.php';?>
<div class="jumbotron jumbotron-sm">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <h1 class="h1">
                    Contact us</h1>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="well well-sm">
            <form name="contactform" method="post" action="send_form_email.php">
                <table width="450px">
                    <tr>
                    <td valign="top">
                        <label for="first_name">Voornaam *</label>
                    </td>
                    <td valign="top">
                        <input  type="text" name="first_name" maxlength="50" size="30">
                    </td>
                    </tr>
                    <tr>
                    <td valign="top"">
                        <label for="last_name">Achternaam *</label>
                    </td>
                    <td valign="top">
                        <input  type="text" name="last_name" maxlength="50" size="30">
                    </td>
                    </tr>
                    <tr>
                    <td valign="top">
                        <label for="email">Email Adres *</label>
                    </td>
                    <td valign="top">
                        <input  type="text" name="email" maxlength="80" size="30">
                    </td>
                    </tr>
                    <tr>
                    <td valign="top">
                        <label for="telephone">Telefoon Nummer</label>
                    </td>
                    <td valign="top">
                        <input  type="text" name="telephone" maxlength="30" size="30">
                    </td>
                    </tr>
                    <tr>
                    <td valign="top">
                        <label for="comments">Opmerking *</label>
                    </td>
                    <td valign="top">
                        <textarea  name="comments" maxlength="1000" cols="25" rows="6"></textarea>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center">
                        <input type="submit" value="Submit">
                    </td>
                    </tr>
                </table>
            </form>
            </div>
        </div>
        <div class="col-md-4">
            <form>
            <legend><span class="glyphicon glyphicon-globe"></span> Our office</legend>
            <address>
                <strong></strong><br>
                <br>
                <br>
                <abbr title="Phone">
                    </abbr>
                
            </address>
            <address>
                <strong>Full Name</strong><br>
                <a href="mailto:#">first.last@example.com</a>
            </address>
            </form>
        </div>
    </div>
</div>
<?php include 'footer.php';?>