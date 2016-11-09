<html>
<head>
<style>

.error{border:#AA4502 1px solid;padding: 5px 10px;border-radius:4px;}
.success{border:#0FA015 1px solid;padding: 5px 10px;border-radius:4px;}
.info{font-size:.8em;color: #336699;letter-spacing:2px;padding-left:5px;}
</style>

<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>
function sendContact() {
	
	var valid;
	var a;	
	valid = validateContact();
	
	if(valid) {
		$('#img').show();
		jQuery.ajax({
		url: "post.php",
		data:'EmailId='+$("#EmailId").val()+'&captcha='+$("#captcha").val(),
		type: "GET",
		success:function(data){
		$("#status").html(data);
		$('#img').hide();
		
	
		},
		error:function (){$('#img').hide();}
		});
	}
}

function validateContact() {
	
	var valid = true;	
	if(!$("#EmailId").val()) {
		$("#Email-info").html("(required)");	
		valid = false;
	}
	
	if(!$("#captcha").val()) {
		$("#captcha-info").html("(required)");	
		valid = false;
	}
	if ($("#EmailId").val() != $("#EMAIL_2").val())
    {
        alert('Emails don\'t match!');
        valid = false;
    } 
	
	return valid;
}
function refreshCaptcha() {
	$("#captcha_code").attr('src','captcha_code.php?'+new Date().getTime());
}


</script>
<link rel="stylesheet" type="text/css" href="acro_style.css">
</head>

<body>

<div id="status"></div>

<table border="0" cellPadding="1" cellSpacing="1" id="table" >

<tr>
<td><label class="tabletext" id="text1">Your Registered Email Address</label></td>
<td><span id="Email-info" class="info"></span></td>
</tr>

<tr valign="top">
<td><p class="tabletext"><input type="text" size=25 autocomplete="off" id="EmailId" name="EmailId"></p></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td><label class="tabletext">Confirm Email Address</label></td>
</tr>

<tr> 
<td><p class="tabletext"><input type="text" size=25 autocomplete="off" id="EMAIL_2" name="EMAIL_2"></p></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td><label class="tabletext">Captcha</label></td>
</tr>

<tr>
<td><p class="tabletext"><input type="text" size=25 autocomplete="off" name="captcha" id="captcha" class="demoInputBox"></p></td>
<td><span id="captcha-info" class="info"></span></td>
</tr>
<tr>
<td><button name="submit" id="textt" onClick="refreshCaptcha();"><img src="images/refresh.png"></button> <img id="captcha_code" src="captcha_code.php" width="120" height="30" border="1" alt="CAPTCHA"/></td>
</tr>
<tr>
<td><small id="small">Type the letters from the image into this box</small></td>
</tr>

<tr>
<td><input name="submit" id="button" value="submit" onClick="sendContact();" type="submit"> <img src="images/ajax-loader.gif" id="img" style="display:none"/ ></td>
</tr>


</body>
</html>




