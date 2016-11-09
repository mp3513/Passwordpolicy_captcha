<!-- #include file="adovbs.inc" -->

<%
stremail=Session("email")
strpwd=Request.Form("PASSWORD")
strpwdnew=Request.Form("np")

set con = Server.CreateObject("ADODB.Connection")
con.Open Application("Database2_ConnectionString")

SET rs= Server.CreateObject("ADODB.Recordset")
SET rs1= Server.CreateObject("ADODB.Recordset")

SET RegCommand= Server.CreateObject("ADODB.Command")
SET RegCommand1= Server.CreateObject("ADODB.Command")

RegCommand.ActiveConnection = con
RegCommand1.ActiveConnection = con

SQL1 = "SELECT * FROM REGISTER WHERE EMAIL='" +stremail+ "'"
RegCommand1.CommandType=adCmdText
RegCommand1.CommandText=SQL1
rs1.Open RegCommand1

varPassword = ""

IF not rs1.EOF THEN
	varPassword = Server.HTMLEncode(rs1("PASSWORD"))	
end if

if(strpwd = varPassword) then

	SQL = "UPDATE REGISTER SET PASSWORD='" +strpwdnew+ "' WHERE EMAIL='" +stremail+ "'"
	RegCommand.CommandType=adCmdText
	RegCommand.CommandText=SQL
	RegCommand.Execute 
	response.write("<b><font size=""4"" color=""#6699DD"" face=""Arial"">Your Password has been updated</font></b>")
else

	response.write("<b><font face=""Arial"" color=""#6699CC"" size=""3"">Please enter correct Current Password</font></b>")
	response.write("<b><p><a href=""javascript:window.history.go(-1)"">Back to Change Password Page</a></p></b>")
	
end if

con.close()
%>

