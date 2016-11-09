<html>
<head>
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
<script language="javascript">
function myFunction(){
	document.getElementById("Newpassword").style.visibility = "hidden";
}

function validate(){
	
	if (document.form.password.value=="")
        {  
			document.getElementById("Newpassword").style.visibility = "visible";
			document.getElementById("Newpassword").innerHTML = "Error:Please enter your Current Password"; 
			//alert("Please enter your current password");
			document.form.password.focus();
			return false;
		}
		
	if (document.form.np.value=="")
		{
			document.getElementById("Newpassword").style.visibility = "visible";
			document.getElementById("Newpassword").innerHTML = "Error:Please enter New Password"; 
			//alert("Please enter new password");
			document.form.np.focus();
			return false;
		}
		
	if(document.form.password.value==document.form.np.value)	
	{
		document.getElementById("Newpassword").style.visibility = "visible";
		document.getElementById("Newpassword").innerHTML = "Error:New Password cannot be same as current password"; 
		//alert("New Password cannot be same as old");
		return false;
	}
            else {
                
				if(document.form.np.value.length < 6) {
					document.getElementById("Newpassword").style.visibility = "visible";
					document.getElementById("Newpassword").innerHTML = "Error:New Password must contain atleast 6 characters!";
					//alert("Error: Password must contain 6 to 10 characters!");
					document.form.np.focus();
					return false;
				}
				
				if(document.form.np.value.length > 10) {
				document.getElementById("Newpassword").style.visibility = "visible";
					document.getElementById("Newpassword").innerHTML = "Error:New Password must contain maximum 10 characters!";
					//alert("Error: Password must contain 6 to 10 characters!");
					document.form.np.focus();
					return false;
				}
				
				 str = /[0-9]/;
				if(!str.test(document.form.np.value)) {
				document.getElementById("Newpassword").style.visibility = "visible";
					document.getElementById("Newpassword").innerHTML = "Error:New Password must contain at least one digit!";
					//alert("Error: Password must contain at least one digit (0-9)!");
					document.form.np.focus();
					return false;
				}
				
				str = /[a-z]/;
				if(!str.test(document.form.np.value)) {
				document.getElementById("Newpassword").style.visibility = "visible";
					document.getElementById("Newpassword").innerHTML = "Error:New Password must contain at least one lowercase letter!";
					//alert("Error: Password must contain at least one lowercase letter (a-z)!");
					document.form.np.focus();
					return false;
				}
				
				 str = /[A-Z]/;
				if(!str.test(document.form.np.value)) {
				document.getElementById("Newpassword").style.visibility = "visible";
					document.getElementById("Newpassword").innerHTML = "Error:New Password must contain at least one uppercase letter!";
					//alert("Error: Password must contain at least one uppercase letter (A-Z)!");
					document.form.np.focus();
					return false;
				}
            }
			if (!(document.form.np.value == document.form.newpassword1.value)) {
					document.getElementById("Newpassword").style.visibility = "visible";
					document.getElementById("Newpassword").innerHTML = "Error:New Password's don't match"; 
                    //alert("Password not same in both the fields");
                    document.form.np.focus();
                    return false;
                }
      
}
</script>
</head>
<link rel="stylesheet" type="text/css" href="../acro_style.css">
<body onload="myFunction()" bgcolor="#FFFFFF">

<form name=form action="PasswordSubmit.asp" method=post  onsubmit="return validate()">
	<input type=hidden name=redirectflag value="">
	<table border="0" cellspacing="1" width="550">
		<tr>
		<td align="left" width="501">

			
        <table style="padding-right: 20px;" width="550" border="0" cellspacing="3" cellpadding="1">
			<tr> 
            <td colspan="2" align="middle" width="550"> 
              <p align="left"> <b> <font size="4" color="#6699CC" face="Arial"> 
                New Password</font> </b> </p>
            </td>
			</tr>
		  
		    <tr> 
            <td colspan="2"> 
              <hr noshade size="1">
            </td>
			</tr>
			
			
			<tr>
			<td>&nbsp;</td>
			<td nowrap><span id="Newpassword" class = "alert-box error"></span></td>
			
			</tr>
			<tr> 
            <td align="right" width="142" class="tabletext">Current Password<font color="#cc0000">*</font></td>
            <td> 
              <input type="PASSWORD" name="password" maxlength="10" value="" size="30" >
            </td>
            </tr>
		  
		    <tr> 
            <td align="right" width="142"  class="tabletext">New Password<font color="#cc0000">*</font></td>
            <td> 
              <input type="PASSWORD" name="np" maxlength="10" value="" size="30" >
            </td>
			
			
			</tr>
			
		  
			<tr> 
            <td align="right" width="142" class="tabletext">Confirm New Password<font color="#cc0000">*</font></td>
            <td>
				
              <input type="PASSWORD" name="newpassword1" maxlength="10" value="" size="30" >
            </td>
			</tr>
			
			<tr>
			  <td >&nbsp;</td>
			  <td>
			  <p><small>Password should be 6 to 10 characters long and must contain </small></p></td>
			  </tr>
			  <tr>
			  <td>&nbsp;</td>
			  <td><small>at least one uppercase letter, one lowercase letter and one digit.</small></td>
			  </tr>
			  
			 
			
			<tr> 
            <td colspan="2"> 
              <hr noshade size="1">
            </td>
			</tr>
			
			<tr>
            <td align="left">
            &nbsp;<input name="submit" type="submit" value="Change Password"></td>
            <td align="right">
                    
            &nbsp;</td>
            </tr>
			
			<tr> 
            <td colspan="2"> 
              <hr noshade size="1">
            </td>
			</tr>
		  
		</table>

		</td>
		</tr>
	</table>
</form>


</body>
</html>

