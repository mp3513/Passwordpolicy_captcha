<%@ Language=VBScript %>
<%
'Purpose		: Additionalinfo fill form command object
'Created on		: 27-Jun-01/Rachit
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
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="procGetAdditionalinfo"

RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)

RegCommand.Parameters("varEmail")=stremail

RS.Open RegCommand

if rs.eof then
	information = ""
else
  information = TheValue("information")
end if

rs.close
con.close
%>

<!-- #include file="additionalinfo2.asp" -->
