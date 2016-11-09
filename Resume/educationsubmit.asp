<%
'Purpose		: Submitting education form
'Created  on	: 29-Jun-01/Rachit
'Last modified	: 10-Aug-2001/Sanjeev
%>
<!-- #include file="adovbs.inc" -->
<!-- #include file="acroinc.inc" -->
<%
	stremail=Session("email")
	if stremail="" then
		Response.Redirect "..\resintro.asp"
	end if 

	rdflag=Request.Form("redirectflag")
	olddegree=Request.form("olddegree")
	degreecompleted=Request.form("degreecompleted")
	strschool=Request.Form("school")
	strcity=Request.Form("city")
	strstate=Request.Form("state")
	strcountry=Request.Form("country")
	strdegreelevel=Request.Form("levelid")
	strcompleted = Request.Form("month")
	strcompleted = "0" & strcompleted
	strcompleted = strcompleted & "/" & Request.Form("year") 
	strdescription=Request.Form("description")

	strschool=fixQuotes(strschool)
	strcity=fixQuotes(strcity)
	strstate=fixQuotes(strstate)
	strcountry=fixQuotes(strcountry)
	strdegreelevel=fixQuotes(strdegreelevel)
	strdescription=fixQuotes(strdescription)

	if strschool<>"" then
		if len(strdescription)>100 then
			strdescription=left(strdescription,100)
		end if
		
		set con = Server.CreateObject("ADODB.Connection")
		con.Open Application("Database2_ConnectionString")

		SET RegCommand= Server.CreateObject("ADODB.Command")
		RegCommand.ActiveConnection = con
		RegCommand.CommandType=adCmdStoredProc
		RegCommand.CommandText="procEducation"
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varSchool",adVarChar ,adParamInput,35)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varCity",adVarChar ,adParamInput,20)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varState",adVarChar ,adParamInput,20)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varCountryid",adVarChar ,adParamInput,3)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varDegreelevelid",adVarChar ,adParamInput,2)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varCompletedon",adVarChar ,adParamInput,8)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varDescription",adVarChar ,adParamInput,100)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varOlddegree",adVarChar ,adParamInput,3)
		RegCommand.Parameters.Append RegCommand.CreateParameter ("varOldcomplete",adVarChar ,adParamInput,8)
		
		RegCommand.Parameters("varEmail")=stremail
		RegCommand.Parameters("varSchool")=strschool
		RegCommand.Parameters("varCity")=strcity
		RegCommand.Parameters("varState")=strstate
		RegCommand.Parameters("varCountryid")=strcountry
		RegCommand.Parameters("varDegreelevelid")=strdegreelevel
		RegCommand.Parameters("varCompletedon")=strcompleted
		RegCommand.Parameters("varDescription")=strdescription
		RegCommand.Parameters("varOlddegree")=olddegree
		RegCommand.Parameters("varOldcomplete")=degreecompleted
		
		RegCommand.Execute()
		
		
		SET RegCand= Server.CreateObject("ADODB.Command")
		RegCand.ActiveConnection = con
		
		RegCand.CommandType=adCmdStoredProc
		RegCand.CommandText="procCanEduTransfer"
		RegCand.Parameters.Append RegCand.CreateParameter ("varEmail",adVarChar ,adParamInput,50)
		RegCand.Parameters.Append RegCand.CreateParameter ("varCountry",adVarChar ,adParamInput,3)
		RegCand.Parameters.Append RegCand.CreateParameter ("varActualDegree",adVarChar ,adParamInput,1)
		RegCand.Parameters.Append RegCand.CreateParameter ("varReplaceDegree",adVarChar ,adParamInput,1)
		RegCand.Parameters("varEmail")=stremail
		RegCand.Parameters("varCountry")=strcountry
	
		IF strdegreelevel = "0" THEN
			strdegree = "1"
		END IF
		
		IF strdegreelevel = "1" THEN
			strdegree = "4"
		END IF
		
		IF strdegreelevel = "2" THEN
			strdegree = "2"
		END IF		
		
		IF strdegreelevel = "3" THEN
			strdegree = "5"
		END IF
		
		IF strdegreelevel = "4" THEN
			strdegree = "6"
		END IF
		
		IF strdegreelevel = "5" THEN
			strdegree = "7"
		END IF
		
		IF strdegreelevel = "6" THEN
			strdegree = "8"
		END IF	
		
		IF strdegreelevel = "7" THEN
			strdegree = "3"
		END IF							
		
		RegCand.Parameters("varActualDegree")=strdegreelevel
		RegCand.Parameters("varReplaceDegree")=strdegree
		
		RegCand.Execute()
		''''''''''''''''''''''''''''''''''''''''''''''		
		
		con.close()
	end if

	if rdflag="Y" then
		Response.Redirect "skills1.asp"
	else
		Response.Redirect "education1.asp"
	end if
%>
