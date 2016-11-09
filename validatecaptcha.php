<?php
session_start();


if($_POST["captcha"]!=$_SESSION["captcha_code"] && $_POST["captcha"] == "")
{
	print "<p class='Error'>Enter correct captcha code.</p>";
	
}




?>