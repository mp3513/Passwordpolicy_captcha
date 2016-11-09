<%
	'Purpose		: Registering the candidate
	'Creaed	on		: 28-Jun-01
	'Last moodified	: 5-Jul-2001
	'Author			: Rachit
%>


<!-- #include file="adovbs.inc" -->
<%

strrecemail=Request.Form("recemail")


'strpwd=Request.Form("password")
stremail=Request.Form("email")
strfirstname=Request.Form("FirstName")
strlastname=Request.Form("LastName")

set con = Server.CreateObject("ADODB.Connection")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="cregisterproc"
RegCommand.Parameters.Append RegCommand.CreateParameter ("varReturnCode",adInteger,adParamReturnValue)
'RegCommand.Parameters.Append RegCommand.CreateParameter ("varPassword",adVarChar ,adParamInput,12)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varfirstname",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varlastname",adVarChar ,adParamInput,20)
'RegCommand.Parameters.Append RegCommand.CreateParameter ("varFlag",adChar,adParamInput,1)

'RegCommand.Parameters("varPassword")=strpwd
RegCommand.Parameters("varEmail")=stremail
RegCommand.Parameters("varfirstname")=strfirstname
RegCommand.Parameters("varlastname")=strlastname
'RegCommand.Parameters("varFlag")="Y"

RegCommand.Execute()
returncode=RegCommand("varReturnCode")

set con = Server.CreateObject("ADODB.Connection")
con.Open Application("Database2_ConnectionString")
SET RegCommand1= Server.CreateObject("ADODB.Command")
RegCommand1.ActiveConnection = con
SET RS1= Server.CreateObject("ADODB.Recordset")
RegCommand1.CommandType=adCmdStoredProc
RegCommand1.CommandText="cregisterprocid"
RegCommand1.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
RegCommand1.Parameters("varEmail")=stremail
RS1.Open RegCommand1
do while not RS1.EOF 	
	varID = Server.HTMLEncode(RS1.Fields.Item("UID").Value&"")
RS1.MoveNext
loop

%>