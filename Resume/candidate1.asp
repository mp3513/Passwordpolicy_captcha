<% @Language = VBScript %>	

<%
'Purpose		: Resume Contact Information
'Created	on		: 29-Jun-01/Rachit
'Last moodified	: 7-Aug-2001/Sanjeev
%>

<!-- #INCLUDE file="Adovbs.inc" -->

<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if

Set con=Server.CreateObject("ADODB.Connection") 
Set RS=Server.CreateObject("ADODB.Recordset")
Set rscountry=Server.CreateObject("ADODB.Recordset")
con.Open Application("Database2_ConnectionString")

SET RegCommand= Server.CreateObject("ADODB.Command")
SET RegCommandc= Server.CreateObject("ADODB.Command")

RegCommand.ActiveConnection = con
RegCommandc.ActiveConnection = con

RegCommandc.CommandType=adCmdStoredProc
RegCommandc.CommandText="Proccountry"

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="procGetCandidateInfo"
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)

RegCommand.Parameters("varEmail")=stremail

rscountry.Open Regcommandc

RS.Open RegCommand

varFirstName = ""
varLastName = ""
varAddress1 = ""
varState = ""
varAddress2 = ""
varZip = ""
varDayTimePhone = ""
varEveningPhone = ""
varMobilePhone = ""
varFax = ""
varPager = ""
varUrl = ""
varCountry = "164"	'default to US

IF not RS.EOF THEN
	'values for form fields
	varFirstName = Server.HTMLEncode(RS("firstname"))
	varLastName = Server.HTMLEncode(TheFieldValue("lastname"))
	varAddress1 = Server.HTMLEncode(TheFieldValue("address1"))
	varState = Server.HTMLEncode(TheFieldValue("state"))
	varAddress2 = Server.HTMLEncode(TheFieldValue("address2"))
	varZip = Server.HTMLEncode(TheFieldValue("zip"))
	varDayTimePhone = Server.HTMLEncode(TheFieldValue("daytimephone"))
	varEveningPhone = Server.HTMLEncode(TheFieldValue("eveningphone"))
	varMobilePhone = Server.HTMLEncode(TheFieldValue("mobilephone"))
	varFax = Server.HTMLEncode(TheFieldValue("fax"))
	varPager = Server.HTMLEncode(TheFieldValue("pager"))
	varUrl = Server.HTMLEncode(TheFieldValue("url"))
  varCountry = rs("country")
end if
%>

<!-- #include file="candidate2.asp" -->

<%
rscountry.close
rs.close
con.close
%>
