<script>
function open_window(url, width, height) {
	var my_window;

	// screen.width means Desktop Width
	// screen.height means Desktop Height

	var center_left = (screen.width / 2) - (width / 2);
	var center_top = (screen.height / 2) - (height / 2);

	my_window = window.open(url, "Title","scrollbars=1,  width="+width+", height="+height+", left="+center_left+", top="+center_top);
	my_window.focus();
}
</script>

<!DOCTYPE HTML>
<html> 
<body>

<form action = "post.php" method="post">
E-mail: <input type="text" name="EmailId"><br>
Password <input type="password" name="Password"><br>

<!-- <a href="#" onclick= "window.open('popup.php', 'popup', 'width=500,height=300');">Forgot Password?</a> -->
<a href="#" onclick= "open_window('popup.php',500,300)">Forgot Password?</a> 



<input type="submit">
</form>



</body>
</html>



