<!--
Purpose		: Skills fill form
Created on		: 27-Jun-2001/Rachit
Last moodified	: 10-Aug-2001/Sanjeev
-->

<html>
<head>
<script language="JavaScript" src="../cfunc.js"></script>

<script language="javascript">

    function validatePage() {
        if ((isBlank(document.skillform.skillcategory))) //if skillcategory fields are entered
        {
            alert("All the mandatory fields must be entered");
            return false;
        }

        var str = (document.skillform.skilldetails.value);
        if (str.length > 500) {
            alert("Skill Details cannot be more than 500 characters");
            document.skillform.skilldetails.focus();
            return false;
        }
        return true;
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

<script language=javascript>
    function createobject() {
        if (validatePage()) {
            document.skillform.redirectflag.value = "Y";
            document.skillform.action = "skillssubmit.asp";
            document.skillform.submit();
        }
    }
</script>

<link rel="stylesheet" type="text/css" href="../acro_style.css">
<style>
.shwTextCount    { color: #FF0000;  }
</style>
</head>
<BODY bgcolor="#ffffff" onload="document.skillform.skillcategory.focus()">
<form action="skillssubmit.asp" name="skillform" method=post >
	<input type=hidden name=redirectflag value="">
	<table border="0" cellspacing="0" width="550">
		<tr>
		<td align="middle" width="501">

			
        <table width="550" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td colspan="2" align="middle" width="550"> 
              <p align="left"> <b> <font size="4" color="#6699CC" face="Arial"> 
                Skills</font> </b> </p>
            </td>
          </tr>
          <tr> 
            <td colspan="2" width="550"> 
              <hr noshade size="1">
            </td>
          </tr>
          <tr> 
            <td align="right" width="142" class="tabletext">Skill Category<font color="#cc0000">*</font></td>
            <td width="408"> 
              <input type="text" name="skillcategory" maxlength="50" value="" size="43" >
            </td>
          </tr>
          <tr> 
            <td align="right" width="142" class="tabletext">Skill Details
            <div>(<span id='shwMessage' class="shwTextCount">0</span>/500 
                  chars)</div>
            </td>
            <td width="408">              
              <textarea  align="left" name="skilldetails"  maxlength="500" rows="2" cols="36" name="skilldetails" 
                    onKeyDown="showLength(this.form.skilldetails,'document.all.shwMessage',500)" 
                    onKeyUp="showLength(this.form.skilldetails,'document.all.shwMessage',500)" onfocus="showLength(this.form.skilldetails,'document.all.shwMessage',500)"></textarea>
            </td>
          </tr>
          <tr> 
            <td align="right" width="142" class="tabletext">  
 Last Used<font color="#cc0000">* </font> </td>
            <td width="408">  
              <select name="skillused" size=1>
                <OPTION VALUE="0">Never</OPTION>
                <OPTION selected VALUE="1">Currently used</OPTION>
                <OPTION VALUE="2">1 year ago</OPTION>
                <OPTION VALUE="3">2 years ago</OPTION>
                <OPTION VALUE="4">3 years ago</OPTION>
                <OPTION VALUE="5">4+ years ago</OPTION>
              </select>
               </td>
          </tr>
          <tr> 
            <td align="right" width="142" class="tabletext"> 
 Skill Level<font color="#cc0000">* </font>  </td>
            <td width="408"> 
              <select name="skilllevelid" size=1>
                <OPTION selected VALUE="0">Beginner</OPTION>
                <OPTION VALUE="1">Intermediate</OPTION>
                <OPTION VALUE="2">Expert</OPTION>
              </select>
               </td>
          </tr>
          <tr> 
            <td align="right" width="142" class="tabletext"> 
 Experience in Hours<font color="#cc0000">*  </font> 
            </td>
            <td width="408"> 
              <select name="hoursused" size=1>
                <option selected value="0">0-500 Hours</option>
                <option value="1">501-1000 Hours</option>
                <option value="2">1001-1500 Hours</option>
                <option value="3">1501-2000 Hours</option>
                <option value="4">2001-3000 Hours</option>
                <option value="5">3001-4000 Hours</option>
                <option value="6">4001-5000 Hours</option>
                <option value="7">5000+ Hours</option>
              </select>
               </td>
          </tr>
          <tr> 
            <td colSpan="2" width="550" height="68"> 
              <table border=0 width=550 height="50" cellspacing="0">
                <tbody> 
                <TR> 
                  <TD colSpan=2 width="550" height="8"> 
                    <HR noShade SIZE=1>
                    <%
		        do while not RS.EOF %>
                <tr> 
                  <td align=left width="50%" height="4" valign="top" nowrap><%=rs("category")%> 
                  </td>
                  <td align=right valign=top width="50%" height="4" nowrap><%=skillusedval(TheValue("skillused"))%> 
                    <a href="editskills.asp?Rowid=<%=Server.URLEncode(rs("RowId"))%>&amp;skilla=Edit">Edit</a> 
                    <A href="deleteskills.asp?Rowid=<%=Server.URLEncode(rs("RowId"))%>&skilla=Delete"  onclick="return confirm('Are you sure?')">Delete</A> 
                  
                <tr> 
                  <td align=left colspan="2" width="550"> 
                    <hr noshade size=1>
                  </td>
                  
                </tr>
                <%  
				RS.MoveNext
				loop
				%>
             </tbody> 
              </table>
              <table width="550" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td align="left">  
                    &nbsp;<input type="button" name="ADDNEW" onclick="createobject()" value="Save and Add Skill"></td>
                  <td align="left"> 
                    <input type="submit" name="NEXT" value="Save and Continue &gt;">
                  </td>
                  <td align="right"> 
                    &nbsp;</td>
                </tr>
              </table>
              <hr noshade size="1">
            </td>
          </tr>
          <tr> 
            <td colspan="2" width="550"> 
            <p class="bodytext"><b><font color="#6699CC">Instructions:</font></b></p>
            <p class="bodytext"><font color="#808080"><b>Skill Category</b>: (50 characters max): A
            general description of each skill, e.g., Programming, Airframe
            Maintenance, Database Design, Desktop Publishing, etc. </font></p>
            <p class="bodytext"><font color="#808080"><b>Skill Details</b>: (500
            characters max): Use this section to list the tools, software,
            hardware, equipment, regulations, etc., used when you practice(d)
            this skill.&nbsp; Examples for programmers might include C++, ASP,
            etc.&nbsp; Be sure to list any relevant keywords that could assist
            our recruiters in pinpointing the best possible opportunity for you.</font></p>
            </td>
          </tr>
        </table>

	</td>
	</tr>
	</table>
</form>

</html>

