<?php
/******************************* Mail function ******************************************/
	
		
		
function email($from, $to, $subject, $messageBody){
require("PHPMailer_5.2.0/PHPMailer_5.2.0/class.phpmailer.php");	//added
$toEmail = "".$to."";
	if(empty($from)){
			$from = "acro.corp@yahoo.com";
	}

$headers = '<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns:m="http://schemas.microsoft.com/office/2004/12/omml" xmlns="http://www.w3.org/TR/REC-html40"><meta http-equiv=Content-Type content="text/html; charset=us-ascii">
<meta name=Generator content="Microsoft Word 12 (filtered medium)">';

$confidential = "<p class=MsoNormal><span style='font-size:6.0pt;font-family:\"Arial\",\"sans-serif\"'>Confidentiality
Notice:&nbsp; This e-mail, including all attachments, is for the sole use of
the intended recipient(s) and may contain confidential and privileged
information.&nbsp; Any unauthorized review, use disclosure or distribution is
prohibited unless specifically provided for under the New Mexico Inspection of
Public Records Act.&nbsp; If you are not the intended recipient, please contact
the sender and destroy all copies of the message.<o:p></o:p></span></p>";

$mail = new PHPMailer();
$body             = $messageBody;
 $mail->SMTPSecure = 'tls'; //aDDED
$mail->IsSMTP(); // telling the class to use SMTP
//$mail->SMTPDebug  = 2;                     // enables SMTP debug information (for testing)								  
$mail->SMTPAuth   = true;                  // enable SMTP authentication
$mail->Host       = "smtp.mail.yahoo.com";      // sets GMAIL as the SMTP server
$mail->Port       = 587;                   // set the SMTP port for the GMAIL server
$mail->Username   = "acro.corp@yahoo.com";  // GMAIL username
$mail->Password   = "acrocorp1234";            // GMAIL password
$mail->SetFrom("$from");
$mail->MsgHTML($body);
$mail->AddAddress("$toEmail");
$mail->Subject = "".$subject."";
$mail->Body = $headers . "<br>" . $messageBody . "<br>" . $confidential;
$mail->WordWrap = 50;
$mail->MsgHTML($mail->Body);

	if(!$mail->Send()) {
	
	//echo "Mailer Error: " . $mail->ErrorInfo;
	print "<p class='Error'>Error in sending email.Please try again.</p>";
	
	} else {
	print "<p class='success'>An email is sent to you with the access information.</p>";
    
	}


}   // end of mail funciton
?>