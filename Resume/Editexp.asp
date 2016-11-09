<%@ Language=VBScript %>
<%
'Purpose		: Deleting the records from skills table
'Created  on	: 29-Jun-01/Rachit
'Last moodified	: 9-Aug-2001/Sanjeev
%>

<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if
%>

<!-- #INCLUDE file="acroinc.inc" -->
<!-- #INCLUDE file="Adovbs.inc" -->

<%
strexptype=Request.QueryString("expaction")
strRowId = Request.QueryString("exprowid")
%>

<%
Set Con=Server.CreateObject("ADODB.Connection") 
Set RS=Server.CreateObject("ADODB.Recordset")
con.Open Application("Database2_ConnectionString")
SET RegCommand= Server.CreateObject("ADODB.Command")
RegCommand.ActiveConnection = con
SET RegCommandExp = Server.CreateObject("ADODB.Command")
set RS1=server.CreateObject("adodb.recordset")
set RS1.ActiveConnection=Con
RegCommandExp.ActiveConnection = con

'get the particular experience of the candidate
RegCommand.CommandType=adCmdStoredProc
RegCommand.CommandText="proceditexperience"

RegCommand.Parameters.Append RegCommand.CreateParameter ("rowid", adInteger,adParamInput,4)
RegCommand.Parameters("rowid")=strRowId

RS.Open RegCommand

'get all the experiences of the candidate
RegCommandExp.CommandType=adCmdStoredProc
RegCommandExp.CommandText="procGetAllExperience"

RegCommandExp.Parameters.Append RegCommand.CreateParameter ("varemail",adVarChar ,adParamInput,35)

RegCommandExp.Parameters("varemail") = stremail

RS1.Open RegCommandExp

if mid((TheValue("ended")),4,1)="" then
	endyear=""
else
	endyear=right(TheValue("ended"),4)
end if
%>

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
                                if (descriptionValue.length > 1000) {
                                    alert("Description cannot be more than 1000 characters");
                                    return false;
                                }
                                //document.expform.description.value = descriptionValue.substr(0,1000);
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

    function createobject(rowid) {
        if (validatePage()) {
            document.expform.redirectflag.value = "Y";
            document.expform.action = "experiencesubmit.asp?action=Update&exprowid=" + rowid;
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

<link rel="stylesheet" type="text/css" href="acro_style.css">
<style>
.shwTextCount    { color: #FF0000;  }
</style>
</head>

<body  onload=document.expform.description.focus()>

<form action="experiencesubmit.asp?action=Update&exprowid=<%=request.querystring("exprowid")%>" name="expform" method="post" onSubmit="return validatePage()">
<input type=hidden name=redirectflag value="">	 
<input  type=hidden name="oldtitle" value="<%=strexptitle%>">
<input  type=hidden name="oldcompany" value="<%=strexpcompany%>">

      <TABLE border=0 cellPadding=2 cellSpacing=0 width="585">
        <TR>
          <TD align=middle>
            <TABLE border=0 cellPadding=2 cellSpacing=0 width="100%">
              <TBODY>
              <TR>
                <TD align=middle colSpan=2>
                  <p align="left"><B><font size="4" color="#6699CC" face="Arial">Edit
                  Work 
                  Experience</font></B></p>
                </TD></TR>
              <TR>
                <TD colSpan=2>
                  <HR noShade SIZE=1>
                </TD></TR>
              <TR>
                <TD align=right class="tabletext" width="146">Company</TD>
                <TD><INPUT maxLength=30 value="<%=TheValue("company")%>" name=company size=30 tabindex="1"> 
              </TD></TR>
              <TR>
                <TD align=right class="tabletext">City/State&nbsp;</TD>
                <TD><INPUT maxLength=30 value="<%=TheValue("location")%>" name=location size=30> 
              </TD></TR>
              <TR>
                <TD align=right class="tabletext">Your Title&nbsp;</TD>
                <TD><INPUT maxLength=30 value="<%=TheValue("title")%>" name=jobtitle size=30> </TD></TR>
              <TR>
                <TD align=right class="tabletext">Start Date&nbsp;</TD>
                <TD>
                  <P><SELECT name=startmonth> 
                  <% 
				'monthvalue is array taken from acroinc.inc file
				varMonth=cint(left(TheValue("started"),2))
				arrLength=UBOUND(monthvalue) - 1 
				for i=0 to  arrLength
					if i = varMonth then %>
						<option selected value="<%=i%>" ><%=monthvalue(varMonth)%>
						</option>
					<% else %>
    	            <option value="<%=i%>" ><%=monthvalue(i)%>
						</option>
					<% end if
						next
						%>
						
						</SELECT><SELECT name=startyear>
                    <OPTION value="" ></OPTION> 
			
				<%
            varStarted=cint(right(TheValue("started"),4))
            for i=1950 to 2020
			if i=cint(varStarted) then		
				%>
			<OPTION selected value="<%=varStarted%>"><%=varStarted%></OPTION>
			<%else%>
					<OPTION value="<%=i%>" ><%=i%></OPTION> 
	   		<%end if
            next
            %></SELECT> </P></TD></TR>
              <TR>
                <TD align=right class="tabletext">End Date&nbsp;</TD>
                <TD><SELECT name="endmonth" size=1>
                 <% 
				'monthvalue is array taken from acroinc.inc file
				varMonth=cint(left(TheValue("ended"),2))
				arrLength=UBOUND(monthvalue) - 1 
				for i=0 to  arrLength
					if i=varMonth then %>
						<option selected value="<%=i%>" ><%=monthvalue(varMonth)%>
						</option>
					<% else %>
    	            <option value="<%=i%>" ><%=monthvalue(i)%>
						</option>
					<% end if
						next
						%></SELECT><SELECT name=endyear> 
                    
                  <OPTION value="" ></OPTION> 
				<%
            for i=1950 to 2020
			if i=cint(endyear) then		
				%>
			<OPTION selected value="<%=endyear%>"><%=endyear%></OPTION>
			<%else%>
					<OPTION value="<%=i%>" ><%=i%></OPTION> 
	   		<%end if
            next
            %></SELECT></TD></TR>
              <TR>
                <TD align=right class="tabletext">
                  Description
                   <div>(<span id='shwMessage' class="shwTextCount"><%=Len(TheValue("description"))%></span>/1000 
                  chars)</div>
                  </TD>
                <TD align="left">
                <textarea name="description" autofocus="true"
                    onKeyDown="showLength(this.form.description,'document.all.shwMessage',1000)" 
                    onKeyUp="showLength(this.form.description,'document.all.shwMessage',1000)" 
                    onfocus="showLength(this.form.description,'document.all.shwMessage',1000)" cols=25 rows=5 wrap=VIRTUAL tabindex="8" style="width: 239px"><%=TheValue("description")%></textarea>
                                
                  <BR></TD></TR>
			<tr>
            <td colSpan="2" width="585" height="68">
              <table border=0 height="50">
              <tbody>
              <TR>
                <TD colSpan=2 width="585" height="8">
                  <HR noShade SIZE=1>
<%
				do while not RS1.EOF
			%>
				<tr>
				<td align=left width="220" height="4" valign="top" nowrap><b><%=RS1("company")%></b>
				</td>
				<td align=right valign=top width="365" height="4" nowrap><%=RS1("started")%>
                  <A href="editexp.asp?exprowid=<%=RS1("row_id")%>&expaction=Edit">Edit</A> 
                  <A href="deleteexp.asp?exprowid=<%=RS1("row_id")%>&expaction=Delete" onclick="return confirm('Are you sure?')">Delete</A>
				</td>
				<tr>
				<td align=left valign=bottom colspan="2">
                  <HR noShade SIZE=1>
                </td>
				
				</tr>
				<%  RS1.MoveNext
				loop
				%>
				<%
            rs.close
            RS1.Close
            %>
				</tbody>
				</table>
                <TR>
                <TD colSpan=2>
                  <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
                    <TBODY>
                    <TR>
                      <TD align=left>
                        
						&nbsp;<INPUT name=addexperience onclick="createobject(<%=request.querystring("exprowid")%>)" type=button value="Save and Add Experience">&nbsp;&nbsp;<INPUT name=next type=submit value="Save and Continue &gt;"></TD>
                      <TD align=middle>
                        <p align="center">
						&nbsp;</p>
                      </TD>
                      <TD align=right>
                        
						&nbsp;</TD></TR>
                    </TBODY></TABLE>
                  <HR noShade SIZE=1>
                </TD></TR>
              <TR>
                <TD colSpan=2>
                </TD></TR></TBODY></TABLE></TD></TR></TABLE>
                <script language="JavaScript" >
                    var FieldToIgnore = new Array(document.expform.endmonth, document.expform.endyear)
</script>
		</form>

 
</body>
</html>

<%
con.close()
%>
