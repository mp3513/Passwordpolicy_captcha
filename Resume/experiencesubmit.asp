<%
'Purpose		: Submitting experience form
'Created  on	: 29-Jun-01/Rachit
'Last moodified	: 9-Aug-2001/Sanjeev
%>

<!-- #include file="adovbs.inc" -->

<%		
stremail=session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if

rdflag=Request.Form ("redirectflag")
strlocation=request.form("location")
strjobtitle=replace(Request.Form("jobtitle"),"'","")
if strlocation="" then
strlocation=" "
end if
varStartmonth=Request.Form("startmonth")
if cint(varStartmonth)< 10 then
	varStartmonth= "0" & varStartmonth  
end if
strstarted = varStartmonth & "/" & request.form("startyear")

strendmonth = Request.Form("endmonth")
if cint(strendmonth)< 10 then
	strendmonth= "0" & strendmonth  
end if
strendyear=Request.Form("endyear")

strdescription=replace(Request.Form("description"),"'","")		
strcompany=Request.Form("company")

if strlocation<>"" and strjobtitle<>"" and strstarted<>"" and stremail<>"" then
	if len(strdescription)>500 then
		'strstarted=left(strdescription,500)
	end if

	if strendyear="" then
		strended=strendmonth
	else
		strended=strendmonth & "/" & request.form("endyear")
	end if
		
	set con=server.CreateObject("adodb.Connection")
	con.Open Application("Database2_ConnectionString")
	SET RegCommand= Server.CreateObject("ADODB.Command")
	RegCommand.ActiveConnection = con
    
    'response.End
	RegCommand.CommandType=adCmdStoredProc
	RegCommand.CommandText="cexperience"
				
	'Creating parameter
	RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
	RegCommand.Parameters.Append RegCommand.CreateParameter ("varCompany",adVarChar ,adParamInput,35)
	RegCommand.Parameters.Append RegCommand.CreateParameter ("varLocation",adVarChar ,adParamInput,30)
	RegCommand.Parameters.Append RegCommand.CreateParameter ("varTitle",adVarChar ,adParamInput,30)
	RegCommand.Parameters.Append RegCommand.CreateParameter ("varStarted",adVarChar ,adParamInput,15)
	RegCommand.Parameters.Append RegCommand.CreateParameter ("varEnded",adVarChar ,adParamInput,15)
	RegCommand.Parameters.Append RegCommand.CreateParameter ("varDescription",adLongVarChar ,adParamInput,2000)
	RegCommand.Parameters.Append RegCommand.CreateParameter ("@action", adChar, adParamInput,1)
	If strComp(Request.QueryString("action"),"Update") = 0 Then
		RegCommand.Parameters.Append RegCommand.CreateParameter ("@rowid", adInteger, adParamInput,4)
		RegCommand.Parameters("@rowid") = request.QueryString("exprowid")
		RegCommand.Parameters("@action")= "U"
	Else
		RegCommand.Parameters("@action")= "I"
	End If

	'passing values to parameters
	RegCommand.Parameters("varEmail")=stremail
	RegCommand.Parameters("varCompany")=strcompany
	RegCommand.Parameters("varLocation")=strlocation
	RegCommand.Parameters("varTitle")=strjobtitle
	RegCommand.Parameters("varStarted")=strstarted
	RegCommand.Parameters("varEnded")=strended
	RegCommand.Parameters("varDescription")=Cstr(strdescription)
	
	'executing command object
	RegCommand.Execute()
	con.close()
end if 

if rdflag="Y" then 
	Response.redirect "experience1.asp"
else
	Response.redirect "education1.asp"
end if 

%>
	