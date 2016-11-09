<%
'Purpose		: Targetandjoblocation fill form check
'Created  on	: 28-Jun-01/Rachit
'Last moodified: 9-Aug-2001/Sanjeev
%>

<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if
%>

<!-- #INCLUDE file="acroinc.inc" -->
<!-- #INCLUDE file="Adovbs.inc" -->

<%
Set Con=Server.CreateObject("ADODB.Connection") 
Set RS=Server.CreateObject("ADODB.Recordset")
Set rslocation=Server.CreateObject("ADODB.Recordset")
Set rscountry=Server.CreateObject("ADODB.Recordset")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
SET RegCommandl= Server.CreateObject("ADODB.Command")
SET RegCommandc= Server.CreateObject("ADODB.Command")

RegCommand.ActiveConnection = con
RegCommandl.ActiveConnection = con
RegCommandc.ActiveConnection = con

RegCommandl.CommandType=adCmdStoredProc
RegCommandl.CommandText="Proclocation"

RegCommandc.CommandType=adCmdStoredProc
RegCommandc.CommandText="Proccountry"

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="procGetTargetJobAndLocation"

RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)

RegCommand.Parameters("varEmail")=stremail

'default values

cityvar1=""
cityvar2=""
cityvar3=""
statevar1="0"
statevar2="0"
statevar3="0"
	
countryvar1="164"
countryvar2="164"
countryvar3="164"
  
varDesiredJobType = "0"
varDesiredStatusId = "0"
varDesiredSalary = ""
varCurrencyVal = "USD"
varSalaryFrequency = 0
varDescription = ""

rslocation.Open Regcommandl
rscountry.Open Regcommandc
RS.Open RegCommand

IF not RS.EOF THEN

	statevar1=rs("state1")
	statevar2=rs("state2")
	statevar3=rs("state3")
	
	countryvar1=rs("country1")
	countryvar2=rs("country2")
	countryvar3=rs("country3")
  
  cityvar1 = rs("city1")
  cityvar2 = rs("city2")
  cityvar3 = rs("city3")
  
  varDesiredJobType = TheFieldValue ("desiredjobtypeid")
  varDesiredStatusId = TheFieldValue ("desiredstatusid")
  varDesiredSalary = TheFieldValue ("desiredsalary")
  varCurrencyVal = TheFieldValue ("currencyid")
	varSalaryFrequency = cint(TheFieldValue ("salaryfrequency"))
  varDescription = rs("description")
end if

%>

<!-- #include file="targetandjoblocation2.asp" -->

<%
rs.close
rslocation.close
rscountry.close
con.close()
%>
