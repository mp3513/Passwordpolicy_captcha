<%@ language=vbscript%>
<!-- #INCLUDE file="acroinc.inc" -->
<!-- #INCLUDE file="Adovbs.inc" -->

<%
'File for resume introduction
'Last known creation: 19-July-01/Rachit
'Last modified: 7-Aug-01/Sanjeev

stremail = session("email")
if stremail = "" then
	response.redirect "..\resintro.asp"
end if

'check whether candidate title exists in the table - title

'Create ADO objects
Set Con=Server.CreateObject("ADODB.Connection") 
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="cintroblankcheck"

RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)

RegCommand.Parameters("varEmail") = stremail

set Rs=RegCommand.Execute()

varTitle = ""	'for candidate title record not found - display blank form
varObjective = ""

'candidate title record found - record populated form
if not rs.eof then
  varTitle = TheValue("title")
  varObjective = TheValue("objective")
end if
%>

<!-- #include file = "introduction2.asp" -->

<%
rs.close
con.close
%>
