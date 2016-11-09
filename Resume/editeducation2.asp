<!-- 
Purpose: Form for editing candidate education record
Created: 10-Aug-01/Sanjeev
-->
 
<html>
<head>
<script language="JavaScript" src="../cfunc.js"></script>

<script language="JavaScript">

    function validatePage() {
        if (isBlank(document.eduform.school, "School Name")) {
            alert("School Name cannot be blank");
            return false;
        }

        if ((isBlank(document.eduform.month, "Month")) || (isBlank(document.eduform.year, "Year"))) {
            alert("Month or year cannot be blank");
            return false;
        }

        //Verify DESCRIPTION TO be 100 CHARS
        var descriptionValue = (document.eduform.description.value);
        if (descriptionValue.length > 100) {
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

<link rel="stylesheet" type="text/css" href="../acro_style.css">

</head>
<body  onload=document.eduform.school.focus()>

<form action="educationsubmit.asp" name=eduform method=post onSubmit="return validatePage()">
<input type=hidden name="redirectflag" value="Y">
<input type=hidden name="olddegree" value="<%=stredud%>" >
<input type=hidden name="degreecompleted" value="<%=streduc%>" >
				
<table border="0" cellPadding="0" cellSpacing="0" width="585">
  <tr>
    <td align="middle" width="673">
      <table border="0" cellPadding="2" cellSpacing="0" width="672">
        <tbody>
          <tr>
            <td align="left" colspan="2" height="30">
              <p align="left"><b><font face="Arial" size="4" color="#6699CC">Edit
              Education</font></b></td>
          </tr>
          <tr>
            <td colSpan="2" width="666" valign="middle" height="21">
              <hr noShade SIZE="1">
            </td>
          </tr>
          <tr>
            <td align="right" width="160" height="26" nowrap class="tabletext">School
              or Program Name&nbsp;</td>
            <td width="500" height="26"><input maxLength="35" name="school" value="<%=TheFieldValue("school")%>" size="30" tabindex="1"></td>
          </tr>
          <tr>
            <td align="right" width="160" height="26" nowrap class="tabletext">City/Town
              </td>
            <td height="26" width="500"><input maxLength="20" name="city" value="<%=TheFieldValue("city")%>" size="30" tabindex="2"></td>
          </tr>
          <tr>
            <td align="right" width="160" height="26" nowrap class="tabletext">State
              </td>
            <td width="500" height="26"><input maxLength="20" name="state" value="<%=TheFieldValue("state")%>" size="30" tabindex="3"></td>
          </tr>
          <tr>
            <td align="right" width="160" height="26" nowrap class="tabletext">Country
              </td>
            <td width="500" height="26">
            <select name="country" size="1" tabindex="4">

            <% while not rscountry.EOF
		            if rscountry("countryvalue")=TheFieldValue("countryid")then %>
  		          <option selected value="<%=TheFieldValue("countryid")%>"><%=rscountry("countryfield")%></option>
	      	    <%else%>
            		<option value=<%=rscountry("countryvalue")%>><%=rscountry("countryfield")%></option>
              <% end if 
					 rscountry.movenext ()
			
				wend 
            rscountry.close()
            %>

              </select></td>
          </tr>
          <tr>
            <td align="right" width="160" height="26" nowrap class="tabletext">Degree/Level
              Attained </td>
            <td width="500" height="26">
            
            <select name="levelid" size="1" tabindex="5">
                <% 
					'DurationVal is array taken from acroinc.inc file
					arrLength=UBOUND(DegreeVal) - 1 
					for i=0 to  arrLength
						if cint(TheFieldValue("degreelevelid"))= i then %>
							<option selected value="<%=TheFieldValue("degreelevelid")%>"><%=deglevel(TheFieldValue("degreelevelid"))%></option>
						<%else%>
							<option value="<%=(i)%>" ><%=DegreeVal(i)%>
							</option>
    	           <% end if 
               next %>
              </select></td>
          </tr>
          <tr>
            <td align="right" width="160" height="27" nowrap class="tabletext">Completion
              Date</td>
            <td width="500" height="27"><select name="month" size="1" tabindex="6">
              <% 
				'monthvalue is array taken from acroinc.inc file
				varMonth=left(rs("completedon"),2)
				arrLength=UBOUND(monthvalue) - 1 
				for i=0 to  arrLength
					if i=cint(varMonth) then %>
						<option selected value="<%=i%>" ><%=monthvalue(varMonth)%>
						</option>
					<% else %>
    	            <option value="<%=i%>" ><%=monthvalue(i)%>
						</option>
					<% end if
						next
						%>
				    </select> <select name="year" size="1" tabindex="7">
                <option selected value="<%=right(TheFieldValue("completedon"),4)%>"><%=right(TheFieldValue("completedon"),4)%></option>
            	
				<%
            varStarted=cint(right(TheFieldValue("completedon"),4))
            for i=1950 to 2020
			if i=cint(varStarted) then		
				%>
			<OPTION selected value="<%=varStarted%>"><%=varStarted%></OPTION>
			<%else%>
					<OPTION value="<%=i%>" ><%=i%></OPTION> 
	   		<%end if
            next
            %>
              </select></td>
          </tr>
          <tr>
            <td align="right" width="160" height="87" class="tabletext">
              <p align="right">Description</td>
            <td width="500" height="87"><TEXTAREA cols=50 name="description" rows=8 style="height: 85; width: 429" wrap=VIRTUAL tabindex="8"><%=TheFieldValue("description")%></TEXTAREA></td>
          </tr>
          <tr>
            <td colSpan="2" width="666" height="68">
              <table border=0 width=594>
              <tbody>
              <TR>
                <TD colSpan=2 width="586">
                  <HR noShade SIZE=1>
					<%
					set rs3=server.CreateObject("adodb.recordset")
					set rs3.ActiveConnection=con
					rs3.Open "select * from education where email like '"&stremail&"'",con

					do while not rs3.EOF %>
				
				<tr>
				<td align=left width="260" valign="top"><%=deglevel(rs3("degreelevelid"))%>
				
				</td>
				<td align=right valign=top width="320"><%=rs3("completedon")%>
                  <A href="editeducation.asp?edue=<%=Server.URLEncode(rs3("email"))%>&edud=<%=Server.URLEncode(rs3("degreelevelid"))%>&educ=<%=Server.URLEncode(rs3("completedon"))%>&edua=Edit">&nbsp;Edit</A> <A href="deleteeducation.asp?edue=<%=Server.URLEncode(rs3("email"))%>&edud=<%=Server.URLEncode(rs3("degreelevelid"))%>&educ=<%=Server.URLEncode(rs3("completedon"))%>&edua=Delete"  onclick="return confirm('Are you sure?')">&nbsp;Delete</A>
				</td>
                
				<tr>
				<td align=left valign=bottom colspan="2" width="586"><hr noshade size=1></td>
				</tr>
				<%  rs3.MoveNext
				loop %>
			<%
        rs3.close
        rs.Close
        %>
				</tbody>
				</table>
                     
              <table border="0" cellPadding="0" cellSpacing="0" width="591">
                <tbody>
                  <tr>
                    <td align="left">
                    &nbsp;<input name="ADDNEW" type="button" onclick="createobject()" value="Save and Add Education"></td>
                    <td align="left" >
                     
                      
                     &nbsp;<input name="NEXT" type="submit" value="Save and Continue &gt;">
                    </td>
                    <td align="right" width="245">
                    
                    &nbsp;</td>
                  </tr>
                  <tr>
                    <td align="left" colspan="3" width="589">
                  <HR noShade SIZE=1>
                    </td>
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
