<!-- #include file="adovbs.inc" -->

<%
'Candidate login verification

email=Request.Form("email")
password=request.Form("password")

Set con=Server.CreateObject("ADODB.Connection")
set RS=server.CreateObject("adodb.recordset")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="clogin"
RegCommand.Parameters.Append RegCommand.CreateParameter ("varReturnCode",adInteger,adParamReturnValue)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varPassword",adVarChar ,adParamInput,12)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)

RegCommand.Parameters("varPassword")=password
RegCommand.Parameters("varEmail")=email

RegCommand.Execute()
returncode=RegCommand("varReturnCode")
if returncode="0" then
	'Login does not exist 
%>
	<!-- #include file="loginfail.asp" -->

<%else 
	'login exists


	session("email")=email
	Response.Redirect "rbframe.asp"

end if %>
