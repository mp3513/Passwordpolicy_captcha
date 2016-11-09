<%
'Purpose		: Deleteing the experience
'Created	on	: 25-Jun-01/Rachit
'Last moodified	: 9-Aug-2001/Sanjeev
%>

<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if

strRowId = Request.QueryString("exprowid")
' Create ADO objects
set con = Server.CreateObject("ADODB.Connection")
		
'connection string 
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
set RegCommand.ActiveConnection = con
RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="procdelexperience"
		
'creating parameters
RegCommand.Parameters.Append RegCommand.CreateParameter ("rowid", adInteger,adParamInput,4)
		
'passing parameters
RegCommand.Parameters("rowid")=strRowId
		
'executing proceedure
RegCommand.Execute()		
				
%>

<!-- #include file="experience1.asp" -->

