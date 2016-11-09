<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Welcome to Acro Service Corporation-New Account</title>
<meta content="Microsoft FrontPage 12.0" name="GENERATOR">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta name="keywords" content="acro, IT, information technology, consulting, engineering, managed staffing,
staff augmentation, light industrial, office support, temps, network support,">
<style type="text/css">
	.alert-box {
    color:#555;
    
    font-family: Verdana; font-size: 8pt;
    padding:5px 5px 5px 25px;
    
}
.error {
		background:#ffecec url('error.png') no-repeat 5px 50%;
		border:1px solid #f5aca6;
	}
</style>
<script language="JavaScript" src="../cfunc.js">
</script>

<script language="javascript">
function myFunction(){
	document.getElementById("textbox").style.visibility = "hidden";
}
    function validatePage() {
     
            //check if password is not blank
            if (isBlank(document.frminsert.password, "textbox"))
                return false;
            else {
               
				
				if(document.frminsert.password.value.length < 6) {
					document.getElementById("textbox").style.visibility = "visible";
					document.getElementById("textbox").innerHTML = "Error:Password must contain atleast 6 characters!";
					//alert("Error: textbox must contain 6 to 10 characters!");
					document.frminsert.password.focus();
					return false;
				}
				
				if(document.frminsert.password.value.length > 10) {
					document.getElementById("textbox").style.visibility = "visible";
					document.getElementById("textbox").innerHTML = "Error:Password must contain maximum 10 characters!";
					//alert("Error: textbox must contain 6 to 10 characters!");
					document.frminsert.password.focus();
					return false;
				}
				
				 str = /[0-9]/;
				if(!str.test(document.frminsert.password.value)) {
					document.getElementById("textbox").style.visibility = "visible";
					document.getElementById("textbox").innerHTML = "Error:Password must contain at least one digit!";
					//alert("Error: textbox must contain at least one digit (0-9)!");
					document.frminsert.password.focus();
					return false;
				}
				
				str = /[a-z]/;
				if(!str.test(document.frminsert.password.value)) {
					document.getElementById("textbox").style.visibility = "visible";
					document.getElementById("textbox").innerHTML = "Error:Password must contain at least one lowercase letter!";
					//alert("Error: textbox must contain at least one lowercase letter (a-z)!");
					document.frminsert.password.focus();
					return false;
				}
				
				 str = /[A-Z]/;
				if(!str.test(document.frminsert.password.value)) {
					document.getElementById("textbox").style.visibility = "visible";
					document.getElementById("textbox").innerHTML = "Error:Password must contain at least one uppercase letter!";
					//alert("Error: textbox must contain at least one uppercase letter (A-Z)!");
					document.frminsert.password.focus();
					return false;
				}
            }
			 if (!(document.frminsert.password.value == document.frminsert.password1.value)) {
					document.getElementById("textbox").style.visibility = "visible";
					document.getElementById("textbox").innerHTML = "Error:Passwords don't match";
                   //alert("textbox not same in both the fields");
                    document.frminsert.password.focus();
                    return false;
                }
     
    }

</script>

 
<link rel="stylesheet" type="text/css" href="../acro_style.css">
  
</head>

<body bgColor="#ffffff" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0" onload="myFunction();">
<%

session("strid")= request.querystring("id")
session("stremail") = request.querystring("email")

%>
   <FORM METHOD="post" name=frminsert   ACTION="cregistersubmit1.asp"   onsubmit="return validatePage()">
<div align="center">

<table border="0" cellPadding="0" cellSpacing="0" bgcolor="#003163" width = "520">

<tr>
    <center>
      
<!-- Begin Center Section -->
 
    <td bgcolor="#FFFFFF" valign="top" height="473" align="left"> 
	<table border="0" width = "520">
        <tr> 
		<td  colspan="2" height="28" class="tableheader"> 
        <font face="Arial" size="4" color="#6699CC"><b><br>
        New User Registration</b></font>
        </td>
        </tr>
		
        <tr> 
        <td colspan="2"> 
        <hr noshade color="#C0C0C0" size="1">
        </td>
        </tr>
		
		<tr>
		<td>&nbsp;</td>
		<td height="17"><span id="textbox" class = "alert-box error"></span></td>
		</tr>
		
       
            
        <tr> 
        <td height="17" class="tabletext" align = "left" nowrap>Your Password</td>
		<td class="tabletext"><INPUT NAME="password" TYPE="password" SIZE=30 maxlength="12"></td>
		</tr>
           
        <tr> 
        <td height="31" class="tabletext" align = "left" nowrap> Re-enter your password</td>
		<td class="tabletext" > <input type="password" name="password1" size="30" maxlength="12"></td>
        </tr>
			
        <tr>
		<td>&nbsp;</td>
		<td><small class="tabletext">Password should be 6 to 10 characters long and must contain at least one uppercase letter, one lowercase letter and one digit.</small></td>
		</tr>
		  <tr> 
        <td >&nbsp;</td>
        </tr>
		<tr> 
        <td colspan="2"> 
        <hr noshade color="#C0C0C0" size="1">
        </td>
        </tr>
      
             
		<tr> 
				
        <td ><input type="submit" value="Register" name="submit"></td>
        </tr>
		
        <tr> 
        <td ></td>
        <td></td>
        </tr>
    </table>
	</td>		      
	</center>
        

</tr>
</table>

</div>

  
</form>
</body>

</html>
