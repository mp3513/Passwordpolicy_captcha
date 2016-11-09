<%
'Purpose		: Deleting the education
'Created on		: 29-Jun-01/Rachit
'Last moodified	: 10-Aug-2001/Sanjeev
%>

<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if

stredue=Request.QueryString("edue")
stredud=Request.QueryString("edud")
streduc=Request.QueryString("educ")

'Create ADO objects
set con=server.CreateObject("adodb.connection")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
set RegCommand.ActiveConnection = con

'declaring command object and proceedure 
RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="procdeleducation"

'creating parameter
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varDegree",adVarChar ,adParamInput,30)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varCompleted",adVarChar ,adParamInput,35)

'passing parameter
RegCommand.Parameters("varEmail")=stremail
RegCommand.Parameters("varDegree")=stredud
RegCommand.Parameters("varCompleted")=streduc

RegCommand.Execute()
%>

<!-- #include file="education1.asp" -->

