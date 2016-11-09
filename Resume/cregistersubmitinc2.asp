<%
	'Purpose		: Additionalinfo fill form command object
	'Last moodified	: 10-Jul-2001
	'Author			: Rachit
%>


<%	
on error resume next	
			
session("email")=Request.Form("email")
session("auth_user")=Request.Form("email")
stremail = session("email")

Text="Thank you for registering with Acro Service Corporation."
Text = Text & "Please click on the link to complete your registration."
Text = Text & "http://localhost/support/resume/cregister.asp?email="&stremail


response.write(Text)

Response.write("Email Sent")

set acromail=Server.CreateObject("CDO.Message")			
acromail.From="mpradhan@acrocorp.com"
	acromail.To=stremail
	acromail.Subject=server.htmlencode( "Your Registration with Acro Service Corporation")
	response.write(varemailfrom)
	'response.write(stremail)
	acromail.TextBody=Text
	acromail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
	'Name or IP of remote SMTP server
	acromail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="localhost"
	'Server port
	acromail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") =25
	acromail.Configuration.Fields.Update
	acromail.Send	
set acromail=nothing



	
'Response.Flush
'Response.Redirect "rbframe.asp" 
%>