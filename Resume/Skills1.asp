<%
'Purpose		: Skills fill form command object
'created on		: 26-June-2001/Rachit 
'Last moodified	: 10-Aug-2001/Sanjeev
%>

<!-- #INCLUDE file="Adovbs.inc" -->
<!-- #INCLUDE file="acroinc.inc" -->

<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if

Set Con=Server.CreateObject("ADODB.Connection") 
Set RS=Server.CreateObject("ADODB.Recordset")
'connection string
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="procGetAllSkills"

'creating parameters 
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)

'passing parameters
RegCommand.Parameters("varEmail")=stremail

'recordset opening	
RS.Open RegCommand
%>

<!-- #include file="skills2.asp" -->

<%
rs.close
con.close %>