<%
'Purpose		: Skills submit
'Created  on	: 26-Jun-01/Rachit
'Last moodified	: 10-Aug-2001/Sanjeev
%>

<!-- #include file="adovbs.inc" -->
<!-- #INCLUDE file="acroinc.inc" -->

<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if

rdflag=Request.Form ("redirectflag")
oldcategory=Request.Form("oldcategory")
oldskillused=Request.Form("oldskillused")
oldskilldetails = Request.Form("oldskilldetails")

strskillname=Request.Form("skillname")
strused=Request.Form("skillused")
strskilllevel=Request.Form("skilllevelid")
strhoursused=Request.Form("hoursused")
strskilldetails=Request.Form ("skilldetails")
strskillcategory=Request.Form ("skillcategory")

strskillname=fixQuotes(strskillname)
strused=fixQuotes(strused)
strskilllevel=fixQuotes(strskilllevel)
strhoursused=fixQuotes(strhoursused)
strskilldetails=fixQuotes(strskilldetails)
strskillcategory=fixQuotes (strskillcategory)

if strskillcategory<>"" then
		set con = Server.CreateObject("ADODB.Connection")
		con.Open Application("Database2_ConnectionString")
		SET RegCommand= Server.CreateObject("ADODB.Command")
		RegCommand.ActiveConnection = con
		RegCommand.CommandType=adCmdStoredProc
		RegCommand.CommandText="procskills"

		RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varSkillused",adVarChar ,adParamInput,1)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varSkilllevelid",adVarChar ,adParamInput,1)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varHoursused",adVarChar ,adParamInput,1)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varCategory",adVarChar ,adParamInput,50)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varSkilldetails",adVarChar ,adParamInput,1000)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varOldcategory",adVarChar ,adParamInput,50)
    RegCommand.Parameters.Append RegCommand.CreateParameter ("varOldSkillDetails",adVarChar ,adParamInput,1000)

		RegCommand.Parameters("varEmail")=stremail
		RegCommand.Parameters("varSkillused")=strused
		RegCommand.Parameters("varSkilllevelid")=strskilllevel
		RegCommand.Parameters("varHoursused")=strhoursused
		RegCommand.Parameters("varCategory")=strskillcategory
		RegCommand.Parameters("varSkilldetails")=strskilldetails
		RegCommand.Parameters("varOldcategory")=oldcategory
    RegCommand.Parameters("varOldSkillDetails")=oldskilldetails

		RegCommand.Execute()

    con.close()
end if

if rdflag="Y" then
	Response.redirect "skills1.asp"
else 
	Response.redirect "additionalinfo1.asp"
end if 
%>
