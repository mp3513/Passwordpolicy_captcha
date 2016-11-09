<%@ Language=VBScript %>
<%
'Purpose		: Editing skills 
'Created  on	: 29-Jun-01/Rachit
'Last moodified	: 10-Aug-2001/Sanjeev
%>

<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if
%>

<!-- #INCLUDE file="Adovbs.inc" -->
<!-- #INCLUDE file="acroinc.inc" -->

<%
strskille=Request.QueryString("skille")
strskilln=Request.QueryString("skilln")
strskillu=Request.QueryString("skillu")
strskilla=Request.QueryString("skilla")
strskilln=fixQuotes(strskilln)
strRowId=Request.QueryString("Rowid")
strskilldetails = Request.QueryString("skilldetails")

'show the form edited with fields displayed
stremail=Session("email")
' Create ADO objects
Set Con=Server.CreateObject("ADODB.Connection") 
Set RS=Server.CreateObject("ADODB.Recordset")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="proceditskill1"

RegCommand.Parameters.Append RegCommand.CreateParameter ("Rowid",adVarChar ,adParamInput,35)

RegCommand.Parameters("Rowid")=strRowId


RS.Open RegCommand

set rs2 = server.CreateObject("adodb.recordset")
set rs2.ActiveConnection = con
SET RegCommandAllSkills = Server.CreateObject("ADODB.Command")
RegCommandAllSkills.ActiveConnection = con

RegCommandAllSkills.CommandType=adCmdStoredProc
RegCommandAllSkills.CommandText="procGetAllSkills"

'creating parameters 
RegCommandAllSkills.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)

'passing parameters
RegCommandAllSkills.Parameters("varEmail")=stremail

'recordset opening	
RS2.Open RegCommandAllSkills

category=rs("category")
category=Server.HTMLEncode (category)
skilldetails = rs("skilldetails")
skilldetails = Server.HTMLEncode (skilldetails)
%>
		
<!-- #include file = "editskills2.asp" -->

<%
rs2.close
rs.close
con.close
%>

