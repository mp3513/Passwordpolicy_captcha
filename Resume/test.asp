
<!-- #INCLUDE file="Adovbs.inc" -->
<!-- #include file="acroinc.inc" -->
<!-- #include file="encrypt.aspx" -->

<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 12.0">
<meta name="ProgId" content="FrontPage.Editor.Document">

<% 
Response.Redirect("encrypt.aspx")
response.write(session["encryptedtext"])%>

</body>

</html>
