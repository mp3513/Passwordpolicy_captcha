<%
'Purpose		: Deleting the records from skills table
'Created on		: 29-Jun-01/Rachit
'Last moodified	: 10-Aug-2001/Sanjeev
%>

<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if

strskille=Request.QueryString("skille")
strskilln=Request.QueryString("skilln")
strskillu=Request.QueryString("skillu")
skilldetails=Request.QueryString("skilldetails")
strRowid=Request.QueryString("Rowid")
skilldetails=fixQuotes(skilldetails)
strskilln=fixQuotes(strskilln)

'Create ADO objects
set con = Server.CreateObject("ADODB.Connection")
Set RS=Server.CreateObject("ADODB.Recordset")
'connection string
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")

RegCommand.ActiveConnection = con
RegCommand.CommandType=adCmdStoredProc

'creating parameter
RegCommand.CommandText="procdelskills1"
RegCommand.Parameters.Append RegCommand.CreateParameter ("Rowid",adVarChar ,adParamInput,35)

'passing parameter
RegCommand.Parameters("Rowid")=strRowid

'store proceedure executed										
RegCommand.Execute()
con.close()
%>
	
<!-- #include file="skills1.asp" -->

