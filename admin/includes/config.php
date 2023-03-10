<?php
include('mysql.php');
error_reporting(0);
ini_set("display_errors", "off");
$hostname = "localhost";
$db_name = "app_openhouse";
$username = "tracking_bismillah";
$password = '03jf6oezuuvymSdP';

mysql_connect($hostname, $username, $password) or die(mysql_error());

mysql_select_db($db_name) or die(mysql_error());

if (!isset($_SESSION)) {
session_start();
}

?>