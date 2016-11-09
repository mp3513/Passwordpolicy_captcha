<!--	
Purpose		: Education form
Created  on	: 29-Jun-01/Rachit
Last moodified	: 10-Aug-2001/Sanjeev
-->

<html>
<head>
<script language="JavaScript" src="../cfunc.js"></script>

<script language="JavaScript">

    function validatePage() {
        if (isBlank(document.eduform.school))
            return true;

        if ((isBlank(document.eduform.month)) || (isBlank(document.eduform.year)))
            return false;

        var str = (document.eduform.description.value);
        if (str.length > 100) {
            alert("Description cannot be more than 100 characters");
            document.eduform.description.focus();
            return false;
        }
        return true;
    }

    function createobject() {
        if (validatePage()) {
            document.eduform.redirectflag.value = "N";
            document.eduform.action = "educationsubmit.asp";
            document.eduform.submit();
        }
    }
  
</script>
<link rel="stylesheet" href="../acro_style.css" type="text/css">
</head>
<BODY bgcolor="#ffffff"  onload=document.eduform.school.focus()>

<form action="educationsubmit.asp" name=eduform method=post onsubmit="return validatePage()">
	
	<input type=hidden name=redirectflag value="Y">	
		<table border="0" cellPadding="0" cellSpacing="0" width="600">
		  <tr>
		    <td align="middle" width="673">
			  
        <table border="0" cellPadding="2" cellSpacing="0" height="495">
          <tbody> 
          <tr> 
            <td align="left" colspan="2" height="18"> 
              <p align="left"><font color="#800000" size="4" ><b><font face="Arial, Helvetica, sans-serif" color="#6699cc">Education</font></b></font> 
            </td>
          </tr>
          <tr> 
            <td colSpan="2" valign="middle" height="21"> 
              <hr noShade SIZE="1">
            </td>
          </tr>
          <tr> 
            <td align="right" height="26" nowrap class="tabletext">School 
              or Program Name&nbsp;</td>
            <td height="26" nowrap> 
              <input maxLength="35" name="school" size="30" tabindex="1">
            </td>
          </tr>
          <tr> 
            <td align="right" height="26" nowrap class="tabletext">City 
            </td>
            <td height="26" nowrap> 
              <input maxLength="20" name="city" size="30" tabindex="2">
            </td>
          </tr>
          <tr> 
            <td align="right" height="26" nowrap class="tabletext">State 
            </td>
            <td height="26" nowrap> 
              <input maxLength="20" name="state" size="30" tabindex="3">
            </td>
          </tr>
          <tr> 
            <td align="right" height="26" nowrap class="tabletext">Country 
            </td>
            <td height="26" nowrap> 
              <select name="country" size="1" tabindex="4">
             <% while not rscountry.EOF 
             	if rscountry("countryvalue")= "164" then%>
		     <option selected value=<%=rscountry("countryvalue")%>><%=rscountry("countryfield")%></option>
				<%else%>		             
		             <option value=<%=rscountry("countryvalue")%>><%=rscountry("countryfield")%></option>
                	<% 
                end if	
                	rscountry.movenext ()
				wend 
				%>
              </select>
            </td>
          </tr>
          <tr> 
            <td align="right" height="26" nowrap class="tabletext">Degree/Level 
              Attained </td>
            <td height="26" nowrap> 
              <select name="levelid" size="1" tabindex="5">
                <% 
					'DurationVal is array taken from acroinc.inc file
						arrLength=UBOUND(DegreeVal) - 1 
						for i=0 to  arrLength%>
						<option value="<%=(i)%>" ><%=DegreeVal(i)%>
						</option>
               <% next %>
              
              </select>
            </td>
          </tr>
          <tr> 
            <td align="right" height="27" nowrap class="tabletext">Completion 
              Date</td>
            <td height="27" nowrap> 
              <select name="month" size="1" tabindex="6">
                 <% 
				'monthvalue is array taken from acroinc.inc file
				arrLength=UBOUND(monthvalue) - 1 
				for i=0 to  arrLength
					if i=0 then %>
						<option selected value="<%=i%>" ><%=monthvalue(i)%>
						</option>
					<% else %>
    	            <option value="<%=i%>" ><%=monthvalue(i)%>
						</option>
					<% end if
		        next
					%>
              </select>
              <select name="year" size="1" tabindex="7">
                <option selected value=""></OPTION> <%
            for i=1950 to 2020
					
				%>
					<OPTION value="<%=i%>" ><%=i%></OPTION> 
	   		<%
            next
            %>
              </select>
            </td>
          </tr>
          <tr> 
            <td align="right" height="87" nowrap class="tabletext"> 
              <p align="right">Description 
            </td>
            <td height="87" nowrap> 
              <TEXTAREA cols=50 name=description rows=8 style="height: 85; width: 398" wrap=VIRTUAL tabindex="8"></TEXTAREA>
            </td>
          </tr>
          <tr> 
            <td colSpan="2" height="68" width="626"> 
              <table border=0 height="50" width="550">
                <tbody> 
                <TR> 
                  <TD colSpan=2 width="550" height="8"> 
                    <HR noShade SIZE=1>
                    <% do while not RS.EOF%>
                <tr> 
                  <td align=left width="260" valign="top"><%=deglevel(TheFieldValue ("degreelevelid"))%> 
                     
                  </td>
                  <td align=right valign=top width="320" > <%=TheFieldValue ("completedon")%><a href="editeducation.asp?edue=<%=Server.URLEncode(TheFieldValue ("email"))%>&edud=<%=Server.URLEncode(TheFieldValue ("degreelevelid"))%>&educ=<%=Server.URLEncode(TheFieldValue ("completedon"))%>&edua=Edit">&nbsp;Edit</a> 
                    <a href="deleteeducation.asp?edue=<%=Server.URLEncode(TheFieldValue ("email"))%>&edud=<%=Server.URLEncode(TheFieldValue ("degreelevelid"))%>&educ=<%=Server.URLEncode(getVarValue("completedon"))%>&edua=Delete" onclick="return confirm('Are you sure?')">&nbsp;Delete</a> 
                  </td>
                <tr> 
                  <td align=center valign=bottom colspan="2"  width="586"> 
                    <hr noshade size=1>
                  </td>
                </tr>
  		              <%  RS.MoveNext
						loop
				%>
                </tbody> 
              </table>
              <table border="0" cellPadding="0" cellSpacing="0" width="550">
                <tbody> 
                <tr> 
                  <td align="left" > 
                    <input name="ADDNEW" type="button" onclick="createobject()" value="Save and Add Education" tabindex="10">                    </td>
                  <td align="left"> 
                    <input name="NEXT" type="submit" value="Save and Continue &gt;" tabindex="11"></td>
                  <td align="right" > 
                    &nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="3" width="563"> 
                    <HR noShade SIZE=1>
                  </td>
                </tr>
                <tr> 
                  <td align="left" colspan="3">&nbsp;</td>
                </tr>
                </tbody> 
              </table>
            </td>
          </tr>
          </tbody> 
        </table>
    </td>
  </tr>
</table>
</form>

</body>
</html>