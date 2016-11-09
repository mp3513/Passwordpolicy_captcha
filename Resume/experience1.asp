<%
'Purpose		: Experience form fill check
'Created  on	: 29-Jun-01/Rachit
'Last moodified	: 9-Aug-2001/Sanjeev
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
Set Con=Server.CreateObject("ADODB.Connection") 
Set RS=Server.CreateObject("ADODB.Recordset")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con
RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="procGetAllExperience"

RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)

RegCommand.Parameters("varEmail")=stremail

RS.Open RegCommand

%>
<!-- #INCLUDE file="experience2.asp" -->

<% 
rs.close
con.close()
%>
