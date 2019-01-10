<!DOCTYPE html>
<html lang="en">
<head>
  <title>Wide World Importers</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/opmaak/login.css">
  <link rel="stylesheet" href="opmaak/artikelen.css" />
  <link rel="stylesheet" href="opmaak/style.css" />
</head>
<body>
<div class="content">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="home.php">Wide World Importers</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="home.php">Home</a></li>
      <li><a href="contact.php">Contact</a></li>
      <li><a href="category.php">Category</a></li>
      <li> <a> 
          <form action="search.php" method="GET">
          <input class="zoek"type="text" name="query" />
          <input class="zoek"type="submit" value="Search" />
          </form>
</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Winkelwagen.php">Winkelwagen <img class='pic-1' src='images/Winkelwagen.jpg'width='25' height='25'></a></li>
      <?php
    
      if (isset($_SESSION["Voornaam"])){
        print('<li><a href="klantpagina.php"><span class="glyphicon glyphicon-cog"></span>  '.$_SESSION["Voornaam"].' </a></li>');
        print('<li><a href="logout.php"><span class="glyphicon glyphicon-log-in"></span> Logout </a></li>');
      } else {
        print('<li><a href="login.php"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>');
      }
      ?>
    </ul>
  </div>
</nav>

