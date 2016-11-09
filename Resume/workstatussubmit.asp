<%
	'Purpose		: Workstatus submit
	'Created  on	: 28-Jun-01
	'Last moodified	: 3-Jul-2001
	'Author			: Rachit
%>

<!-- #include file="adovbs.inc" -->
<%
stremail=Session("email")

if stremail="" then
	Response.Redirect "..\resintro.asp"
end if 

strworkstatus=Request.Form("workstatusid")
stravailabletime=Request.Form("AvailableTimeid")
	
stravailableday=Request.Form("AvailableDay")
stravailablemonth=Request.Form("AvailableMonth")
stravailableyear=Request.Form("AvailableYear")

'if day-month-year are not blank then overwrite the available time
if stravailableday<>"" and stravailablemonth<> "" and stravailableyear<> "" then
	stravailabletime = stravailableday & stravailablemonth & stravailableyear
end if 

	
set con = Server.CreateObject("ADODB.Connection")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="cworkstatus"
'Creating parameter
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varWorkstatusid",adVarChar ,adParamInput,1)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varAvailabletimeid",adVarChar ,adParamInput,8)
	
'passing values to parameters
RegCommand.Parameters("varEmail")=stremail
RegCommand.Parameters("varWorkstatusid")=strworkstatus
RegCommand.Parameters("varAvailabletimeid")=stravailabletime

RegCommand.Execute()

con.close()

Response.Redirect "targetandjoblocation.asp"

%>