<%@Language=VBScript %>
<%
	'Purpose		: Full Resume View 
	'Created  on	: 27-Jun-01
	'Last moodified	: 5-Jul-2001
	'Author			: Rachit
%>

<!-- #INCLUDE file="Adovbs.inc" -->
<!-- #include file="acroinc.inc" -->
	<%	
	
stremail=session("email")
stremail1 = Request.Querystring("email")	

IF stremail1 <>"" THEN 
	stremail=stremail1
ELSE 
	stremail=session("email")
END IF
		
	if stremail<>"" then
		
	
	SET con=Server.CreateObject("ADODB.Connection") 
	'recordset object
	SET rstitle=Server.CreateObject("ADODB.Recordset")
	SET rscandidateinfo=Server.CreateObject("ADODB.Recordset")
	SET rseducation=Server.CreateObject("ADODB.Recordset")
	SET rsskill=Server.CreateObject("ADODB.Recordset")
	SET rsadditionalinfo=Server.CreateObject("ADODB.Recordset")
	SET rsexperience=Server.CreateObject("ADODB.Recordset")
	'connection  open	
	con.Open Application("Database2_ConnectionString")
	'Command Object
	
	
	SET Regtitle = Server.CreateObject("ADODB.Command")
	SET Regcandidateinfo = Server.CreateObject("ADODB.Command")
	SET Regeducation = Server.CreateObject("ADODB.Command")
	SET Regskill = Server.CreateObject("ADODB.Command")
	SET Regexperience = Server.CreateObject("ADODB.Command")
	SET Regadditionalinfo = Server.CreateObject("ADODB.Command")
     
    Regtitle.ActiveConnection = con
    Regcandidateinfo.ActiveConnection = con
    Regeducation.ActiveConnection = con
	Regskill.ActiveConnection = con
	Regexperience.ActiveConnection = con
	Regadditionalinfo.ActiveConnection = con
    
	Regtitle.CommandType=adCmdStoredProc
	Regtitle.CommandText="Procblankcheck"

	Regcandidateinfo.CommandType=adCmdStoredProc
	Regcandidateinfo.CommandText="Procblankcheck"
	
	Regeducation.CommandType=adCmdStoredProc
	Regeducation.CommandText="Procblankcheck"
	
	Regskill.CommandType=adCmdStoredProc
	Regskill.CommandText="Procblankcheck"
	
	Regexperience.CommandType=adCmdStoredProc
	Regexperience.CommandText="Procblankcheck"
	
	Regadditionalinfo.CommandType=adCmdStoredProc
	Regadditionalinfo.CommandText="Procblankcheck"
	

	Regtitle.Parameters.Append Regtitle.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
	Regtitle.Parameters.Append Regtitle.CreateParameter ("varstring",adVarChar ,adParamInput,35)

	Regcandidateinfo.Parameters.Append Regcandidateinfo.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
	Regcandidateinfo.Parameters.Append Regcandidateinfo.CreateParameter ("varstring",adVarChar ,adParamInput,35)


	Regeducation.Parameters.Append Regeducation.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
	Regeducation.Parameters.Append Regeducation.CreateParameter ("varstring",adVarChar ,adParamInput,35)

	Regskill.Parameters.Append Regskill.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
	Regskill.Parameters.Append Regskill.CreateParameter ("varstring",adVarChar ,adParamInput,35)

	Regexperience.Parameters.Append Regexperience.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
	Regexperience.Parameters.Append Regexperience.CreateParameter ("varstring",adVarChar ,adParamInput,35)

	Regadditionalinfo.Parameters.Append Regadditionalinfo.CreateParameter ("varEmail",adVarChar ,adParamInput,35)
	Regadditionalinfo.Parameters.Append Regadditionalinfo.CreateParameter ("varstring",adVarChar ,adParamInput,35)


	email="'" + stremail+ "'"
	
	
	Regtitle.Parameters("varEmail")=email
	Regtitle.Parameters("varstring")="title"

	Regcandidateinfo.Parameters("varEmail")=email
	Regcandidateinfo.Parameters("varstring")="candidateinfo"

	Regskill.Parameters("varEmail")=email
	Regskill.Parameters("varstring")="skills"

	Regexperience.Parameters("varEmail")=email
	Regexperience.Parameters("varstring")="experience"

	Regadditionalinfo.Parameters("varEmail")=email
	Regadditionalinfo.Parameters("varstring")="additionalinfo"

	Regeducation.Parameters("varEmail")=email
	Regeducation.Parameters("varstring")="education"

	rstitle.CursorLocation =adUseClient

   
	rstitle.Open Regtitle
	rscandidateinfo.open Regcandidateinfo
	rseducation.open Regeducation
	rsskill.open Regskill
	rsexperience.open Regexperience
	rsadditionalinfo.open Regadditionalinfo
	
	
	
	end if
%>


<html>
<head>
<title>View Resume</title>

</head>
<body bgcolor="#FFFFFF">
<div align="center">
  <center>
<table width="627"  border="0" cellspacing="0" cellpadding="0">
<% if not rscandidateinfo.EOF then %>
  
  <!-------------------------- DISPLAY CONTACT DATA ---------------------------------->


  <tr width="58%" valign="top"> 
    <td valign="bottom" align="left" width="268" height="66"><b><i><font face="Arial" size="4" color="#000000"> <%=rscandidateinfo("firstname")%>&nbsp;<%=rscandidateinfo("lastname")%></b></i></font>
    </td>
    <td width="355"  > 
      <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100%" align="right" valign="bottom"><i><font size="1" face="Arial">
          <%=rscandidateinfo("address1")%></font></i>
</td>
        </tr>
        <tr>
          <td width="100%" align="right" valign="bottom"><i><font size="1" face="Arial">
          <%=rscandidateinfo("state")%>, <%=rscandidateinfo("address2")%>&nbsp;&nbsp;<%=rscandidateinfo("zip")%></font></i></td>
        </tr>
        <tr>
          <td width="100%" align="right" valign="bottom"><i><font size="1" face="Arial">
          <%=rscandidateinfo("daytimephone")%>
          </font></i>
</td>
        </tr>
        <tr>
          <td width="100%" align="right" valign="bottom"><i><font size="1" face="Arial">
          <%=rscandidateinfo("email")%></font></i></td>
        </tr>
      </table>
 </td>
  </tr>


  <% end if %>
  <tr> 
    <td colspan="2" valign="top" width="625"> 
      <hr noshade color="#C0C0C0" size="1">
    
    </td>
  </tr>
  <tr> 
    <td colspan="2" width="625" height="21">
    </td>
  </tr>
  
  <!-------------------------- DISPLAY OBJECTIVE ---------------------------------->

    <tr> 
    <td colspan="2" width="625" height="18"><b><font face="Arial" size="2"><i>Objective</i></font></b></td>
  </tr>
 <% if not rstitle.EOF then %>
  <tr> 
    <td colspan="2" width="625" height="21"> 
      <hr noshade color="#C0C0C0" size="1">
    
    </td>
  </tr>
  
  <tr> 
    <td colspan="2" width="625" align="left" height="23"> 
         <table border="0" width="625" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25"></td>
            <td width="600">
            <p><font face="Arial" size="2"><%=rstitle("objective")%></font></p>
            </td>
          </tr>
         </table>

    </td>
  </tr>
  
  <tr> 

    <td colspan="2" width="625" height="18"><b><font face="Arial" size="2"><i>&nbsp;&nbsp;</i></font></b></td>
  </tr>
   


<!-------------------------- DISPLAY EXPERIENCE DATA ---------------------------------->

  <tr>
    <td colspan="2" width="625" height="18"><b><font face="Arial" size="2"><i>Experience</i></font></b></td>
  </tr>
  <tr> 
    <% end if %>

    <td colspan="2" width="625" height="21"> 
      <hr noshade color="#C0C0C0" size="1">
    
    </td>
  </tr>
  <% while not rsexperience.eof  %> 
  <tr> 
    <td colspan="2" width="625" height="23"> 
      <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td width="25"></td>
          <td width="600" valign="bottom">
          <i><b><font face="Arial" size="2"><%=rsexperience("company")%></b></i></font>          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td colspan="2" height="23" width="625"> 
      <table border="0" width="629" cellspacing="0" cellpadding="0">
        <tr>
          <td width="25"></td>
          <td width="255" valign="top"><font face="Arial" size="2"><i><%=rsexperience("title")%></i></font>
          </td>
          <td width="150" valign="top"><font face="Arial" size="2"><i><%=rsexperience("started")%>-<%=rsexperience("ended")%></i></font>
          </td>
          <td width="179" align="right" valign="top"><font face="Arial" size="2">
          <i><%=rsexperience("location")%></i></font>
          </td>
        </tr>
      </table>
 </td>
  </tr>
  
  <tr> 
    <td colspan="2" width="625" height="44">
      <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td width="25">&nbsp;</td>
          <td width="600">
          <font face="Arial" size="2">
 <%=rsexperience("description")%> </font>
          &nbsp;</td>
        </tr>
        <tr>
          <td width="25"></td>
          <td width="600" height="25">
          </td>
        </tr>
      </table>
    </td>
    <%rsexperience.movenext

wend %>     
  </tr>
  

<!-------------------------- DISPLAY EDUCATION DATA ---------------------------------->
  <tr> 
    <td colspan="2" width="625" height="18"><b><i><font face="Arial" size="2">Education</font></i></b></td>
  </tr>
  
  <tr> 
    <td colspan="2" width="625" height="21"> 
      <hr noshade color="#C0C0C0" size="1">
    
    </td>
    
    <% while not rseducation.eof  %> 
  </tr>
  <tr> 
    <td colspan="2" width="625" height="21">
      <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td width="25">
          
          </td>
          <td width="600">
          <i><b><font face="Arial" size="2"><%=rseducation("school")%>&nbsp;&nbsp;</b></i></font>          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>  
    <td width="625" height="21" colspan="2"> 
      <table border="0" width="625" cellspacing="0" cellpadding="0">
        <tr><% degreevar=deglevel(rseducation("degreelevelid")) %> 
          <td width="25">&nbsp;</td>
          <td width="258"><i><font face="Arial" size="2"><%=degreevar%></font></i>           
          &nbsp;</td>
          <td width="149"><i><font face="Arial" size="2"><%=rseducation("completedon")%></font> </i>
          &nbsp;</td>
          <td width="177" align="right"><i><font face="Arial" size="2"><%=rseducation("city")%>,&nbsp<%=rseducation("state")%></font> </i>&nbsp;</td>
        </tr>
      </table>
 </td>
 
  </tr>
  <tr> <% degreevar=deglevel(rseducation("degreelevelid")) %> 
  </tr>
  <tr> 
    <td colspan="2" width="625" height="21">
      <table border="0" width="625" cellspacing="0" cellpadding="0">
        <tr>
          <td width="25"></td>
          <td width="600">
          <font face="Arial" size="2"><%=rseducation("description")%></td></font>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td colspan="2" width="625" height="21">
  </tr>
  <% rseducation.movenext()
	 wend %> 
  <tr> 
    <td colspan="2" width="625" height="18"> 
      <b><i><font face="Arial" size="2">&nbsp;&nbsp;</font></i></b>
    </td>
  </tr>
  
  
<!-------------------------- DISPLAY SKILLS DATA ---------------------------------->
 
 <tr> 
  <td colspan="2" width="625" height="18"> 
      <p><b><i><font face="Arial" size="2">Skills</font></i></b></p>
    </td>
  </tr>
  <% if not rsskill.eof then %> 
  <tr> 
    <td colspan="2" width="625" height="21"> 
      <hr noshade color="#C0C0C0" size="1">
    </td>
  </tr>
  <% end if %>
 
  <% while not rsskill.eof  %> 
 
  <tr> 
    <td colspan="2" width="625" height="18">
      <table border="0" width="625" cellspacing="0" cellpadding="0">
        <tr>
          <td width="25"></td>
          <td width="230" valign="top"><font face="Arial" size="2"><%=rsskill("category")%>:</font></td>
          <td width="370" valign="top"><font face="Arial" size="2"><%=rsskill("skilldetails")%></td>
        </tr>
      </table>
           
    </td>
  </tr>
  <tr> 
    <td colspan="2" width="625" height="18">&nbsp;&nbsp;</td>
  </tr>
  
  <% rsskill.movenext
   wend	
 %>       
  
  <!-------------------------- DISPLAY ADDITIONAL INFO ---------------------------------->
  
  <tr> 
    <td colspan="2" width="625" height="18"><b><font face="Arial" size="2"><i>Additional</i></font></b></td>
  </tr>
  <% while not rsadditionalinfo.eof  %> 
  <tr> 
    <td colspan="2" width="625" height="21"> 
      <hr noshade color="#C0C0C0" size="1">
    
    </td>
  </tr>
  <tr> 
    <td colspan="2" width="625" height="59"> 
      <table border="0" width="625" height="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td width="25"></td>
          <td width="600">
          <p><font face="Arial" size="2"><%=rsadditionalinfo("information")%></font></p>
      <p>&nbsp;</p>          </td>
        </tr>
      </table>
    </td>
  </tr>  
  <tr> 
    <td colspan="2" width="625" height="59"> 
      
    </td>
  </tr>
  <% rsadditionalinfo.movenext
wend %> 
</table>
  </center>
</div>
<p>&nbsp;</p>
</body>
</html>
