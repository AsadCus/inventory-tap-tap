<?php
// Copy this file to connect.php and fill in your own MySQL credentials.
// connect.php is git-ignored so your password never gets committed.
$host       ="localhost";
$user       ="root";
$password   ="";
$database   ="db_ujilevel_starbhak_2021";
$connect    =mysqli_connect($host,$user,$password,$database) or die("Cek Connect");
?>
