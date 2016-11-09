<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Welcome to Acro Service Corporation-Candidate Login</title>
<meta content="Microsoft FrontPage 4.0" name="GENERATOR">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta name="keywords" content="acro, IT, information technology, consulting, engineering, managed staffing,
staff augmentation, light industrial, office support, temps, network support,">

<script language="JavaScript" src="../../cfunc.js">
</script>
      
<script language="javascript">


function validatePage() 
{
	// Check for valid email
	if (isEmail(document.frminsert.email,"Email"))
	    { 
		//check if password is not blank
		if (isBlank(document.frminsert.password,"Password"))
			return false;
		else
			return true;
		
		}
	else
		return false;
}

</script>

 
<link rel="stylesheet" type="text/css" href="acro_style.css">
  
</head>

<body bgColor="#ffffff" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0" onload="frminsert.email.focus ()">
   
<div align="center">

<table border="0" cellPadding="0" cellSpacing="0" width="750" bgcolor="#003163">

<tr>
    <center>
      
<!-- Begin Center Section -->
 
        <td width="500" bgcolor="#FFFFFF" valign="top" height="473" align="left"> 
          <FORM METHOD="post" name=frminsert   ACTION="loginok.asp"   onsubmit="return validatePage()">
          
 			<table width="550">
              <tr> 
                <td width="21" height="50" rowspan="2">&nbsp;</td>
                <td width="293" height="25"> 
                  <br>
                  <font face="Arial" size="4" color="#6699CC"><b>Member Login</b></font>
                </td>
              </tr>
              <tr> 
                <td width="539" height="25"> 
                  <hr noshade color="#C0C0C0" size="1">
                </td>
              </tr>
              <tr> 
                <td width="21">&nbsp;</td>
                <td width="293"> 
                  <p class="tabletext"> Your Email Address</p>
                </td>
              </tr>
              <tr valign="top"> 
                <td width="21">&nbsp;</td>
                <td width="293"> 
                  <p class="tabletext" > 
                    <INPUT NAME="email" SIZE=30 >
                  </p>
                </td>
              </tr>
              <tr> 
                <td height="17" width="21">&nbsp;</td>
                <td height="17" width="293"> 
                  <p class="tabletext" ><br>
                    Your Password</p>
                </td>
              </tr>
              <tr> 
                <td width="21">&nbsp;</td>
                <td width="293"> 
                  <p class="tabletext" > 
                    <INPUT NAME="password" TYPE="password" SIZE=30>
                  </p>
                </td>
              </tr>
              <tr> 
                <td width="21" height="56">&nbsp;</td>
                <td width="293" height="56"><br>
                    <input type="submit" value="Login" name="submit">
                </td>
              </tr>
              <tr> 
                <td width="21"></td>
                <td width="293"></td>
              </tr>
              <tr> 
                <td width="21">&nbsp;</td>
                <td> 
                  <p class="tabletext" ><br>
                    <a href="cregister.asp">New User? Register here</a><a href="../../Careers.htm"><br>
                  Back to
                  Career Center<br>
                  </a> </p>
                  <p class="tabletext" >Registering with Acro gives you access
                  to our resume builder and allows you to keep one resume in our
                  database--one that you can revise any time you like.&nbsp;
                  Submitting your resume this way has several key advantages,
                  including reduced processing time.&nbsp; However, if you
                  prefer, you can still submit your resume by the <a href="../../Resume.htm">cut
                  and paste method</a>.&nbsp; Either way, we appreciate your
                  time and we'll contact you soon.&nbsp; </p>
                </td>
              </tr>
            </table>
			 </form>     
			</center>
        

    </tr>
      
  <center>
             

</center></table>

</div>
<p align="center">&nbsp;</p>
<p align="center"><font color="#999999" size="1" face="Arial">&nbsp; </font></p>

  

</body>

</html>
