<%
'Purpose		: Targetandjoblocation fill form check
'Created  on	: 28-Jun-01
'Last moodified	: 3-Jul-2001
'Author			: Rachit
%>

<!-- #include file="adovbs.inc" -->
<!-- #INCLUDE file="acroinc.inc" -->

<%
stremail=session("email")
strdesiredjob=Request.Form("desiredjobtype")
strdesiredstatus=Request.Form("desiredstatusid")

strsalary=Request.Form("salary")
strcurrencyid=Request.Form("currencyid")
strsalarytype=Request.Form("salarytypeid")

strdescription=Request.Form("description")
strmylocations=Request.Form("newloc")
strrelocate=Request.Form("relocateid")
city1=Request.Form ("city1")
city2=Request.Form ("city2")
city3=Request.Form ("city3")
state1=Request.form ("state1")
state2=Request.form ("state2")
state3=Request.form ("state3")

country1=Request.form ("country1")
country2=Request.form ("country2")
country3=Request.form ("country3")

if len(strdescription)>250 then
	strdescription=left(strdescription,250)
end if

set con = Server.CreateObject("ADODB.Connection")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="ctargetjoblocation"
'Creating parameters
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
RegCommand.Parameters.Append RegCommand.CreateParameter ("vardesiredjobtypeid",adVarChar ,adParamInput,1)
RegCommand.Parameters.Append RegCommand.CreateParameter ("vardesiredstatusid",adVarChar ,adParamInput,1)
RegCommand.Parameters.Append RegCommand.CreateParameter ("vardesiredsalary",adVarChar ,adParamInput,15)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varcurrencyid",adVarChar ,adParamInput,15)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varsalfrequency",adVarChar ,adParamInput,5)

RegCommand.Parameters.Append RegCommand.CreateParameter ("vardescription",adVarChar ,adParamInput,250)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varcity1",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varstate1",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varcountry1",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varcity2",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varstate2",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varcountry2",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varcity3",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varstate3",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varcountry3",adVarChar ,adParamInput,20)

'passing values to parameters
RegCommand.Parameters("varEmail")=stremail
RegCommand.Parameters("vardesiredjobtypeid")=strdesiredjob
RegCommand.Parameters("vardesiredstatusid")=strdesiredstatus
RegCommand.Parameters("vardesiredsalary")=strsalary
RegCommand.Parameters("varcurrencyid")=strcurrencyid

RegCommand.Parameters("varsalfrequency")=strsalarytype

RegCommand.Parameters("vardescription")=strdescription
RegCommand.Parameters("varcity1")=city1
RegCommand.Parameters("varstate1")=state1
RegCommand.Parameters("varcountry1")=country1
RegCommand.Parameters("varcity2")=city2
RegCommand.Parameters("varstate2")=state2
RegCommand.Parameters("varcountry2")=country2
RegCommand.Parameters("varcity3")=city3
RegCommand.Parameters("varstate3")=state3
RegCommand.Parameters("varcountry3")=country3

RegCommand.Execute()

con.close()

Response.redirect "experience1.asp"

%>