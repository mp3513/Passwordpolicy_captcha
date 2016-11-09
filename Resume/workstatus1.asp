<%
'Purpose		: Workstatus fill form check
'Created  on	: 28-Jun-01/Rachit
'Last moodified	: 8-Aug-2001/Sanjeev
%>

<!-- #INCLUDE file="Adovbs.inc" -->
<!-- #INCLUDE file="acroinc.inc" -->

<% 
stremail=Session("email")
if stremail="" then
	Response.Redirect "../resintro.asp"
end if
	
Set Con=Server.CreateObject("ADODB.Connection") 
Set RS=Server.CreateObject("ADODB.Recordset")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="procGetWorkStatus"

RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)

RegCommand.Parameters("varEmail")=stremail

RS.Open RegCommand

'default values
stravailabletimeid = "4"
stravailableday = ""
stravailablemonth = "0"
stravailableyear = ""
varcb = "1"

if not rs.eof then
	if len(RS("availabletimeid")) = "8" then
		'data is in day month year format
		stravailableday = left(RS("availabletimeid"),2)
		stravailablemonth = mid(RS("availabletimeid"),3,2)
		stravailableyear = right(RS("availabletimeid"),4)


  	'set avaialble time to blank
		stravailabletimeid = "4"

	else
		'data is in available time format
		stravailabletimeid = RS("availabletimeid")
  	'set day month year to blank
		stravailableday = ""
		stravailablemonth = "00"
		stravailableyear = ""
	end if
	
	varcb = RS("workstatusid")
end if

%>
<!-- #include file="workstatus2.asp" -->
<%

rs.close
con.close()

%>
