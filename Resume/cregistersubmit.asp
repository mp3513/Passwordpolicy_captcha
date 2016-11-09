<%@language=vbscript%>

<!-- #INCLUDE file="cregistersubmitinc.asp" -->
	
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Welcome to Acro Service Corporation</title>
<meta content="Microsoft FrontPage 4.0" name="GENERATOR">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta name="keywords" content="acro, IT, information technology, consulting, engineering,
 managed staffing,staff augmentation, light industrial, office support, temps, 
 network support">
      
<script language="JavaScript" src="../../cfunc.js"></script>

<link rel="stylesheet" type="text/css" href="acro_style.css">

</head>

<body bgColor="#ffffff" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0" >
  
<div align="center">

<table border="0" cellPadding="0" cellSpacing="0" width="750" bgcolor="#003163">
  
<tr>
    <center>
      
<% if returncode="0" then
	'new user proceed to register
%>
		  <!-- #include file="cregistersubmitinc2.asp" -->
  
        <td width="500" bgcolor="#FFFFFF" valign="top" height="473" align="left"> 
          <table width="97%" border="0">
            <tr>
              <td class="bodyheading">&nbsp;
                <p><font face="Arial" size="4" color="#6699CC"><b>Thank You</b></font></p>
                <p><font color="#6699CC">Please click on the link sent to your email address to complete your registration. </font></p>
               
                <p>&nbsp;</p>
				 <p><% response.write(text) %></p>
              </td>						 			
            </tr>
 
         </table>
		 
<!-- added by madhura-->
<%elseif returncode = "1" then
	'user with this id already exists%>
			<form method="post" action="cregistersubmitinc2.asp">
			<table width="97%" border="0">
            <tr>
              <td class="bodyheading">&nbsp;              
                <p><font color="#6699CC">The user ID you have selected already registered</font></p>
                <p><font color="#6699CC">Click on send email to get the link for completing the registration.</font></p>
				<p><input type ="submit" id="button" value = "send email"></p>
				
              </td>
            </tr>
			   <tr>
              <td class="bodyheading"></td>
            </tr>
          </table>
		  </form>



<%else
	'user with this id already exists%>

			<table width="97%" border="0">
            <tr>
              <td class="bodyheading">&nbsp;
                <p><font color="#6699CC" face="Arial" size="4"><b>Please Try a
                Different User ID</b></font></p>
                <p><font color="#6699CC">The user ID you have selected already exists</font></p>
                <p><a href="javascript:window.history.go(-1)">Back to
                Registration Page</a></p>
              </td>
            </tr>
			   <tr>
              <td class="bodyheading"></td>
            </tr>
          </table>

<%end if %>		

<p class="tabletext">&nbsp; </p>
</center>
    

</tr>
      
<center>
</center></table>

</div>

</body>

</html>
