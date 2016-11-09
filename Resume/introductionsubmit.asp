<%@ language=vbscript%>
<!-- #include file="adovbs.inc" -->
<%
'File for saving of resume introduction
'Know creation: 19-Jul-01/Rachit
'Last modified: 7-Aug-01/Sanjeev

'check session
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if

strtitle=Replace(Request.Form("title"),"'","")
strobjective=Replace(Request.Form("objective"),"'","")

'database connection
set con=server.CreateObject("adodb.Connection")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="cintrosubmit"
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varTitle",adVarChar ,adParamInput,50)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varObjective",adVarChar ,adParamInput,2000)

RegCommand.Parameters("varTitle")=strtitle
RegCommand.Parameters("varEmail")=stremail
RegCommand.Parameters("varObjective")=strobjective

RegCommand.Execute()

con.close()

Response.redirect "candidate1.asp"
%>
