<?php
session_start();
include_once "connect.php";
include_once "mail_function.php";
$conn = getDatabaseConnection();

$Email = $_POST['EmailId'];

$query = "SELECT Password,Email,REGISTERFLAG FROM Register where Email = '$Email' and REGISTERFLAG = 'Y'";
$result = sqlsrv_query( $conn, $query,array(), array( "Scrollable" => SQLSRV_CURSOR_KEYSET )) or die(print $errorText);

if($result)
	{
	$row = sqlsrv_num_rows($result);
	$rows= sqlsrv_fetch_array($result, MYSQL_ASSOC);

	}

$p = $rows[0];

$subject = "Your request for acrocorp.com registration information";
$message = "You requested your access information for the job portal on acrocorp.com". "<br>" ."Your registered email id: [$Email]"."<br>"."Password: [$p]."."<br><br>"."http://www.acrocorp.com/index.php/post-a-resume"."<br><br>"."Please change your password as soon as possible."."<br><br>"."This is system generated message.Please do not reply to this email message."."<br><br>";

if($row > 0 && $_POST["captcha"] == $_SESSION["captcha_code"])
{
	email("",$Email, $subject,$message);
}


else
{
	print "<p class='Error'>This email address is not registered</p>";
}
?>