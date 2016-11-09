<%
'Purpose		: Submitting the candidateinformation
'Created on		: 29-Jun-01
'Last moodified	: 10-Jul-2001/Rachit
%>

<!-- #include file="adovbs.inc" -->
<!-- #include file="acroinc.inc" -->

<%
stremail=session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if 

strfirstname=Request.Form("firstname")
strlastname=Request.Form("lastname")
straddress1=Request.Form("address1")
straddress2=Request.Form("address2")
strstate=Request.Form("state")
strzip=Request.Form("zip")
strdayphone=Request.Form("daytimephone")
strevephone=Request.Form("eveningphone")
strmobile=Request.Form("mobilephone")
strfax=Request.Form("fax")
strpager=Request.Form("pager")
strurl=Request.Form("url")
strcountry=Request.Form("country")
strconfidential=Request.Form("confidential")

set con = Server.CreateObject("ADODB.Connection")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con

RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="candidatesubmit"
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varfirstname",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varlastname",adVarChar ,adParamInput,20)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varaddress1",adVarChar ,adParamInput,30)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varaddress2",adVarChar ,adParamInput,30)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varstate",adVarChar ,adParamInput,15)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varzip",adVarChar ,adParamInput,6)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varDaytimephone",adVarChar ,adParamInput,16)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varEveningphone",adVarChar ,adParamInput,16)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varmobilephone",adVarChar ,adParamInput,12)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varfax",adVarChar ,adParamInput,16)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varPager",adVarChar ,adParamInput,12)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varUrl",adVarChar ,adParamInput,35)
RegCommand.Parameters.Append RegCommand.CreateParameter ("varCountry",adVarChar ,adParamInput,3)
'RegCommand.Parameters.Append RegCommand.CreateParameter ("varMaritalstatus",adVarChar ,adParamInput,1)
'RegCommand.Parameters.Append RegCommand.CreateParameter ("varPassport",adVarChar ,adParamInput,12)
'RegCommand.Parameters.Append RegCommand.CreateParameter ("varSocialsecurity",adVarChar ,adParamInput,9)

RegCommand.Parameters("varEmail")=stremail
RegCommand.Parameters("varfirstname")=strfirstname
RegCommand.Parameters("varlastname")=strlastname
RegCommand.Parameters("varaddress1")=straddress1
RegCommand.Parameters("varaddress2")=straddress2
RegCommand.Parameters("varstate")=strstate
RegCommand.Parameters("varzip")=strzip
RegCommand.Parameters("varDaytimephone")=strdayphone
RegCommand.Parameters("varEveningphone")=strevephone
RegCommand.Parameters("varmobilephone")=strmobile
RegCommand.Parameters("varfax")=strfax
RegCommand.Parameters("varPager")=strpager

RegCommand.Parameters("varUrl")=strurl
RegCommand.Parameters("varCountry")=strcountry

RegCommand.Execute()

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' This stored procedure add new candidate detail in the IRM database
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
SET RegCand= Server.CreateObject("ADODB.Command")
RegCand.ActiveConnection = con

RegCand.CommandType=adCmdStoredProc
RegCand.CommandText="procCanTransfer"
RegCand.Parameters.Append RegCand.CreateParameter ("varEmail",adVarChar ,adParamInput,50)
RegCand.Parameters.Append RegCand.CreateParameter ("varCountry",adVarChar ,adParamInput,3)
RegCand.Parameters("varEmail")=stremail
RegCand.Parameters("varCountry")=strcountry
RegCand.Execute()
''''''''''''''''''''''''''''''''''''''''''''''

con.close()

Response.redirect "workstatus1.asp"

%>
