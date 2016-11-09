<%@ Language=VBScript %>

<%
'Purpose		: Editing of candidate education record
'Created  on	: 29-Jun-01/Rachit
'Last moodified	: 10-Aug-2001/Sanjeev
%>

<!-- #INCLUDE file="Adovbs.inc" -->
<!-- #INCLUDE file="acroinc.inc" -->
<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if
%> 

<%
stredue=Request.QueryString("edue")
stredud=Request.QueryString("edud")
streduc=Request.QueryString("educ")
stredua=Request.QueryString("edua")

'show the form edited with fields displayed
Set Con=Server.CreateObject("ADODB.Connection") 
Set RS=Server.CreateObject("ADODB.Recordset")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="procediteducation"

RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
RegCommand.Parameters.Append RegCommand.CreateParameter ("vardegreelevelid",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varcompletedon",adVarChar ,adParamInput,35)

RegCommand.Parameters("varEmail")=stremail
RegCommand.Parameters("vardegreelevelid")=stredud
RegCommand.Parameters("varcompletedon")=streduc

RS.Open RegCommand

Set rscountry=Server.CreateObject("ADODB.Recordset")
SET RegCommandc= Server.CreateObject("ADODB.Command")
RegCommandc.ActiveConnection = con
RegCommandc.CommandType=adCmdStoredProc
RegCommandc.CommandText="Proccountry"
	
rscountry.Open Regcommandc

%>

<!-- #include file = "editeducation2.asp" -->

<%
con.close
%>

