<%
'Purpose		: Additionalinfo form saving 
'Created on		: 27-Jun-01/Rachit
'Last moodified	: 10-Aug-2001/Sanjeev
%>

<!-- #include file="adovbs.inc" -->

<%
stremail=session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if 

strinformation=ltrim(replace(Request.Form("information"),"'",""))
if strinformation<>"" then

	set con = Server.CreateObject("ADODB.Connection")
	con.Open Application("Database2_ConnectionString")
	SET RegCommand= Server.CreateObject("ADODB.Command")
	RegCommand.ActiveConnection = con

	RegCommand.CommandType=adCmdStoredProc
	RegCommand.CommandText="procadditionalinfo"
	'Creating parameter
	RegCommand.Parameters.Append RegCommand.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
	RegCommand.Parameters.Append RegCommand.CreateParameter ("varInformation",adVarChar ,adParamInput,2000)

	'passing values to parameters
	RegCommand.Parameters("varEmail")=stremail
	RegCommand.Parameters("varInformation")=strinformation

	RegCommand.Execute()

  con.close()
end if 

%>

<html>
<head><Title></title>
<link rel="stylesheet" type="text/css" href="../acro_style.css">
</head>
<body bgcolor="#FFFFFF">
<table border="0" cellpadding="6" cellspacing="0" width="550" height="491">
  <tr> 
    <td width="789" height="1" valign="top" align="left"> 
      <p align="left"><b><font face="Arial" size="4" color="#6699CC">Thank You...</font></b></p>
      <p class="tabletext">We appreciate you taking the time to build your resume 
        and add it to our database. We're confident the extra effort will result 
        in a wider variety of options as you embark on the next phase of your 
        career.</p>
      <p>&nbsp;<a href="../../index.php/search-jobs" target="_top">Our 
        Current Job Listings</a></p>
</td>
  </tr>
  <tr> 
    <td valign="top" align="middle" width="969" height="439">&nbsp; </td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><b></b></p>
<p>&nbsp;</p>
<p>&nbsp;</p>

</body>
</html>
