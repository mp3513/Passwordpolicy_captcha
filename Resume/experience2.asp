<!--
Purpose		: Experience form
Created  on	: 29-Jun-01/Rachit
Last moodified	: 9-Aug-2001/Sanjeev
-->

<html>
<head>
<script language="JavaScript" src="../cfunc.js"></script>
<script language="javaScript">
    function validatePage() {
        if (!checkBlankForm(document.expform, FieldToIgnore)) {
            if (!(isBlank(document.expform.company, "Company"))) {
                if (isBlank(document.expform.jobtitle, "You have given company name, Title")) {
                    return false;
                }
                else {
                    if ((isBlank(document.expform.startmonth, "Start Date")) || (isBlank(document.expform.startyear, "Start Date"))) {
                        return false;
                    }
                    else {
                        if (document.expform.endmonth.value != "00") {
                            if (isBlank(document.expform.endyear, "End Year")) {
                                return false;
                            }
                            else {
                                //TRUNCATE DESCRIPTION TO 1000 CHARS
                                var descriptionValue = document.expform.description.value;
                                document.expform.description.value = descriptionValue.substr(0, 1000);
                                return true;
                            }
                        }
                        else {
                            //TRUNCATE DESCRIPTION TO 1000 CHARS
                            var descriptionValue = document.expform.description.value;
                            document.expform.description.value = descriptionValue.substr(0, 1000);
                            return true;
                        }
                    }
                }
            }
            else {

                return false;
            }
        }
        else {
            //TRUNCATE DESCRIPTION TO 1000 CHARS
            var descriptionValue = document.expform.description.value;
            document.expform.description.value = descriptionValue.substr(0, 1000);
            return true;
        }
    }

    function createobject() {
        if (validatePage()) {
            document.expform.redirectflag.value = "Y";
            document.expform.action = "experiencesubmit.asp?action=Insert";
            document.expform.submit();
        }
    }
    function showLength(field, countfield, maxLimit) {
        //setting the limit of the message to 256
        if (field.value.length > maxLimit) // if too long...trim it!
            field.value = field.value.substring(0, maxLimit);
        // otherwise, update 'characters left' counter
        else
            if (document.all)
            { eval(countfield).innerText = field.value.length; }
            else {
                var strCtrlName = new String();
                var strtmp = new String();
                strCtrlName = countfield;
                strtmp = strCtrlName.substr(strCtrlName.lastIndexOf(".") + 1, strCtrlName.length - strCtrlName.lastIndexOf("."));
                document.getElementById(strtmp).innerHTML = field.value.length;
            }
    }

</script>

<link rel="stylesheet" type="text/css" href="../acro_style.css">
<style>
.shwTextCount    { font-family: Verdana; font-size: 8pt; color: #FF0000;  }
</style>
</head>
<BODY bgcolor="#ffffff"  onload=document.expform.company.focus()>
<form action="experiencesubmit.asp?action=Insert" name="expform" method="post" onSubmit="return validatePage()">
<input type=hidden name=redirectflag value="">		 
<TABLE border=0 cellPadding=6 cellSpacing=0 width="550">
			<TR>
			<TD align=middle>
            
        <TABLE border=0 cellPadding=2 cellSpacing=0>
          <TBODY> 
          <TR> 
            <TD align=middle colSpan=2> 
              <p align="left"><B><font color="#6699CC" face="Arial" size="4">Work Experience
            </font></b></TD>
          </TR>
          <TR> 
            <TD colSpan=2> 
              <HR noShade SIZE=1>
            </TD>
          </TR>
          <TR> 
            <TD align=right width="146"><font face="Verdana, Arial, Helvetica, sans-serif" class="tabletext">Company</font>&nbsp;</TD>
            <TD> 
              <INPUT maxLength=30 name=company size=30 tabindex="1">
            </TD>
          </TR>
          <TR> 
            <TD align=right><span class="tabletext">City/State</span><b>&nbsp;</b></TD>
            <TD> 
              <INPUT maxLength=30 name=location size=30 tabindex="2">
            </TD>
          </TR>
          <TR> 
            <TD align=right><font face="Verdana, Arial, Helvetica, sans-serif" class="tabletext">Your 
              Title&nbsp;</font></TD>
            <TD> 
              <INPUT maxLength=30 name=jobtitle size=30 tabindex="3">
            </TD>
          </TR>
          <TR> 
            <TD align=right class="tabletext">Start Date&nbsp;</TD>
            <TD> 
              <P> 
                <SELECT name=startmonth tabindex="4">
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
                </SELECT>
                <SELECT name=startyear tabindex="5">
                  <OPTION selected value=""><%
            for i=1950 to 2020
					
				%>
					<OPTION value="<%=i%>" ><%=i%></OPTION> 
	   		<%
            next
            %>
                </SELECT>
              </P>
            </TD>
          </TR>
          <TR> 
            <TD align=right vAlign=top height="25"><span class="tabletext">End 
              Date</span><b>&nbsp;</b></TD>
            <TD height="25"> 
              <SELECT name="endmonth" size=1 tabindex="6">
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
						%></SELECT>
              <SELECT name=endyear tabindex="7">
                <OPTION selected value=""></OPTION>
              <%
            for i=1950 to 2020
					
				%>
					<OPTION value="<%=i%>" ><%=i%></OPTION> 
	   		<%
            next
            %>        </SELECT>
            </TD>
          </TR>
          
          <TR> 
            <TD align=middle class="tabletext"> 
              <div align="right"><span class="tabletext">Description</span>&nbsp; 
              <div>(<span id='shwMessage' class="shwTextCount">0</span>/1000 
                  chars)</div>
              </div>
            </TD>
            <TD align=left> 
              <textarea name="description" 
                    onKeyDown="showLength(this.form.description,'document.all.shwMessage',1000)" 
                    onKeyUp="showLength(this.form.description,'document.all.shwMessage',1000)" onfocus="showLength(this.form.description,'document.all.shwMessage',1000)" cols=25 rows=5 wrap=VIRTUAL tabindex="
                    8" style="width: 239px"></textarea>
            </TD>
          </TR>
          <tr> 
            <td colSpan="2" width="585" height="68"> 
              <table border=0 width=585 height="50">
                <tbody> 
                <TR> 
                  <TD colSpan=2 width="585" height="8"> 
                    <HR noShade SIZE=1>
                    <% do while not RS.EOF%> 
                <tr>
                  <td align=left width="220" height="4" valign="top" nowrap><b><%=RS("company")%></b> 
                  </td>
                  <td align=right valign=top width="365" height="4" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%=RS("started")%> 
                    <b><font color="#6699CC"></font></b>
                    <A href="editexp.asp?exprowid=<%=RS("row_id")%>&expaction=Edit">Edit</A> 
                    <A href="deleteexp.asp?exprowid=<%=RS("row_id")%>&expaction=Delete" onclick="return confirm('Are you sure?')">Delete</A> 
                  </td>
                  
                </tr>
                <tr> 
                  <td align=left height="4" valign="top" nowrap colspan="2"> 
                    <HR noShade SIZE=1>
                  </td>
                <%  RS.MoveNext
				loop
				%> </tbody> 
              </table>
          <TR> 
            <TD colSpan=2 width="585"> 
              <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
                <TBODY> 
                <TR> 
                  <TD align=left> 
                    &nbsp;<INPUT name=addexperience onclick="createobject()" type=button value="Save and Add Experience">&nbsp; 
                    <INPUT name=next type=submit value="Save and Continue >"></TD>
                  <TD align=middle> 
                    <p align="center"> 
                      &nbsp;</p>
                  </TD>
                  <TD align=right> 
                    &nbsp;</TD>
                </TR>
                </TBODY> 
              </TABLE>
              <HR noShade SIZE=1>
            </TD>
          </TR>
          <TR> 
            <TD colSpan=2 width="585"> 
              <p class="bodytext"><b><font color="#6699CC">Instructions:</font></b> 
              <p class="bodytext"><FONT  color="#808080">Start with your first 
                job and when you have put in all the details, click on Save add 
                experience. This will write the data you entered into the database 
                and show you the blank fields again. You can add the next job 
                now. When you are through with the last job click on save to go 
                to the next page.</FONT></p>
              <p class="bodytext"><font color="#808080"><b>Work Description:</b> 
                2000 character limit.</font> 
            </TD>
          </TR>
          </TBODY> 
        </TABLE>
      </TD></TR></TABLE>
                <script language="JavaScript" >
                    var FieldToIgnore = new Array(
    					document.expform.startmonth,
                        document.expform.startyear,
                        document.expform.endmonth,
                        document.expform.endyear)
</script>
			</form>
</body>
</html>