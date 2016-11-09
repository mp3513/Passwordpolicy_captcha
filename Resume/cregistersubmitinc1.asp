<%
	'Purpose		: Registering the candidate
	'Creaed	on		: 28-Jun-01
	'Last moodified	: 5-Jul-2001
	'Author			: Rachit
%>


<!-- #include file="adovbs.inc" -->
<%

strrecemail=Request.Form("recemail")
strpwd=Request.Form("password")
stremail = session("stremail")

set con = Server.CreateObject("ADODB.Connection")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="cregisterprocnew"

RegCommand.Parameters.Append RegCommand.CreateParameter ("varPassword",adVarChar ,adParamInput,12)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varFlag",adChar,adParamInput,1)

RegCommand.Parameters("varPassword")=strpwd
RegCommand.Parameters("varEmail")=stremail
RegCommand.Parameters("varFlag")="Y"

RegCommand.Execute()



%>