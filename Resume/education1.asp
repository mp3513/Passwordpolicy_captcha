<%
'Purpose		: Education form fill check
'Created  on	: 29-Jun-01/Rachit
'Last moodified	: 9-Aug-2001/Sanjeev
%>

<!-- #INCLUDE file="Adovbs.inc" -->
<!-- #INCLUDE file="acroinc.inc" -->

<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if

function getVarValue (theVar)
	valTheVar = rs(theVar)
	if valTheVar <> "" then
		retval = Server.HTMLEncode (valTheVar)
	else
		retval = valTheVar
	end if
	getVarValue  = retval
end function
 
set Con=Server.CreateObject("ADODB.Connection") 
Set RS=Server.CreateObject("ADODB.Recordset")
'Set rslocation=Server.CreateObject("ADODB.Recordset")
Set rscountry=Server.CreateObject("ADODB.Recordset")
'connection string
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
'SET RegCommandl= Server.CreateObject("ADODB.Command")
SET RegCommandc= Server.CreateObject("ADODB.Command")

RegCommand.ActiveConnection = con
RegCommandc.ActiveConnection = con

'declaring command object and procedure

'RegCommandl.CommandType=adCmdStoredProc
'RegCommandl.CommandText="Proclocation"

RegCommandc.CommandType=adCmdStoredProc
RegCommandc.CommandText="Proccountry"

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="procGetAllEducation"

'creating parameters	
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)

'passing parameters
RegCommand.Parameters("varEmail")=stremail

'recordset opening
rscountry.Open Regcommandc
RS.Open RegCommand
%>

<!-- #include file="education2.asp" -->

<% con.close %>