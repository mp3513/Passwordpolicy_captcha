<!--
Purpose		: Workstatus form 
Created  on	: 28-Jun-01/Rachit
Last moodified	: 8-Aug-2001/Sanjeev
-->

<html>

<head>

<script language="JavaScript" src="../cfunc.js"></script>
<script language="javascript">

    function validatePage() {
        if (((!(isBlank(document.form2.AvailableTimeID, "")))
		|| (
		(!(isBlank(document.form2.AvailableDay, ""))) &&
	   (!(isBlank(document.form2.AvailableMonth, ""))) &&
	   (!(isBlank(document.form2.AvailableYear, "")))
	   )
		)
		||
		(
	   ((isBlank(document.form2.AvailableTimeID, "")))
		&&
		((isBlank(document.form2.AvailableDay, ""))) &&
	   ((isBlank(document.form2.AvailableMonth, ""))) &&
	   ((isBlank(document.form2.AvailableYear, "")))
		)
		) {
            return true;
        }
        else {
            alert("All the mandatory fields must be entered");
            return false;
        }
    }

</script>

<link rel="stylesheet" type="text/css" href="../acro_style.css">
</head>

<body bgcolor="#ffffff"  onload=document.form2.AvailableTimeID.focus()>
	
<form action="workstatussubmit.asp" method=post  id=form2 name=form2 onsubmit="return validatePage()">

            <TABLE border=0 cellPadding=2 cellSpacing=0 width="585">
              <TR>
                <TD align=middle width="722">
                  <p align="left"><B><font size="4" color="#6699CC" face="Arial">Availability</font> </B></p>
                </TD></TR>
              <TR>
                
      <TD width="722" height="233"><FONT 
                  face="Verdana, Arial, Helvetica, sans-serif" size=-2> 
                  <hr noShade SIZE="1">
        </FONT>
                
<TABLE border=0 cellPadding=2 cellSpacing=0 width=575 height="232">
                    <TBODY>
                    <tr>
        <TD colSpan=2 width=515 height="30">
          <p class="tabletext">Upon receiving a job offer, when can you 
          start? </p>
      </TD>
                    </tr>
                    <tr>
        <TD align=right width=64 height="25">
          <p class="tabletext">Approx:</p>
 </TD>
        <TD vAlign=top width=515 height="25"> 
          <SELECT 
            name="AvailableTimeID" size="1" tabIndex="21">
			<% 
			'AvailableTime is array taken from acroinc.inc file
		
			arrLength=UBOUND(availabletime) - 1 
			for i=0 to  arrLength 
			
				if  cint(stravailabletimeid) = i then
			 %>
					<option selected value="<%=i%>" ><%=availabletime(i)%>
					</option>
				<% else %>
					<option value="<%=i%>" ><%=availabletime(i)%>
					</option>
				<% end if
        next
         %>

      
          </SELECT>
          
          </TD>
                    </tr>
                    <tr>
        <TD align=right width=64 height="25">
          <p class="tabletext"></p>
 </TD>
        <TD width=515 height="25"> 
          <p class="tabletext"><i>or, if you know the exact date:</i> 
          </TD>
                    </tr>
                    <tr>
        <TD align=right width=64 height="24">
          <p class="tabletext">On:</p>
        </TD>
        <TD width=515 height="24">
          <SELECT name="AvailableDay" size="1" tabIndex="22">
          <OPTION value="" ></OPTION> 
            
          <% for i=1 to 31
					if i<10 then
						varValue="0" & i
					else
						varValue=i
					end if          
					if stravailableday="" then %>
						<OPTION value="<%=varValue%>" ><%=varValue%></OPTION> 
				<%			 
          		elseif  i=cint(stravailableday) then %>
						<OPTION selected value="<%=stravailableday%>"><%=stravailableday%>   </OPTION>
					<%else%>
						<OPTION value="<%=varValue%>" ><%=varValue%></OPTION> 
            	<% end if
				next  %>
                     
          </SELECT>
          &nbsp; 
          <SELECT 
            name="AvailableMonth" size="1" tabIndex="23">
            <% 
				'monthvalue is array taken from acroinc.inc file
				arrLength=UBOUND(monthvalue) - 1 
				for i=0 to  arrLength
					if i<10 then
						varValue = "0" & i 
					else
						varValue = i
					end if
					if i=cint(stravailablemonth) then %>
						<OPTION selected value="<%=stravailablemonth%>"><%=monthvalue(cint(stravailablemonth))%></OPTION>
						</OPTION>
					<% else %>
    	            <option value="<%=varValue%>" ><%=monthvalue(i)%>
						</option>
					<% end if
    	    next %>
             
          </SELECT>
          &nbsp; 
          <SELECT 
            name=AvailableYear size=1 tabIndex=24>
            <% 
				'AvailableYear is array taken from acroinc.inc file
				arrLength=UBOUND(AvailYears) - 1 
				for i=0 to  arrLength 
					if AvailYears(i)= stravailableyear then	%> 
			        	 <OPTION selected value="<%=stravailableyear%>"><%=stravailableyear%></OPTION>
  		       <%else%>
        	        <option value="<%=AvailYears(i)%>" ><%=AvailYears(i)%>
						</option>
			        <% end if 
	         next %>
               
               </SELECT>
          </TD>
                    </tr>
                    <TR>
                      <TD width=494 colspan="2" height="21"></TD>
                    </TR>
                    <TR>
                      <TD width=494 colspan="2" height="20">
                        <p class="tabletext">Please
                        select one of the following:</p>
                      </TD>
                    </TR>
                    <TR>
                      
            <TD width=64 align="right"><font face="Book Antiqua" size=-2> 
                <% if varcb="1" then
					'first radio button is checked
                %>
		              <input name=workstatusid type=radio value="1" checked id=radio1 datafld=workstatusid datasrc=workstatus>
                <% else %>
	                <input name=workstatusid type=radio value="1" id=radio1 datafld=workstatusid datasrc=workstatus>
                <% end if %>
                </font>
              </TD>
                      <TD width=556>
                        <p class="tabletext">I am
                        authorized to work in the
                       US
                        for any 
                        employer.</p>
                      </TD>
                    </TR>
                    <TR>
                      
            <TD width=64 align="right"><font 
                  face="Book Antiqua" size=-2>
                <% if varcb="2" then
					'second radio button is checked
                %>
		              <input name=workstatusid type=radio value="2" checked id=radio2 datafld=workstatusid datasrc=workstatus>
                <% else %>
	                <input name=workstatusid type=radio value="2" id=radio2 datafld=workstatusid datasrc=workstatus>
                <% end if %>
              </font></TD>
                      <TD width=556 rowspan="2">
                        <p class="tabletext">I
                        am authorized to work in
                        the
                        US
                        for my present 
                        employer only.</p>
                      </TD>
                    </TR>
                    <TR>
                      
            <TD width=64 rowspan="2" align="right"><font 
                        face="Book Antiqua" 
                        size=1>
                <% if varcb="3" then
					'third radio button is checked
                %>
		              <input name=workstatusid type=radio value="3" checked id=radio3 datafld=workstatusid datasrc=workstatus>
                <% else %>
	                <input name=workstatusid type=radio value="3" id=radio3 datafld=workstatusid datasrc=workstatus>
                <% end if %>

              </font> </TD>
                    </TR>
                    <TR>
                      <TD width=556>
                        <p class="tabletext">I
                        require sponsorship to work in&nbsp; the
                        US.</p>
                      </TD>
                    </TR></TBODY></TABLE>
      </TD></TR>
              <TR>
                <TD width="722">
                  <HR noShade SIZE=1>

                  <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
                    <TBODY>
                    <TR>
                    <td align="left" width="97"><font face="Book Antiqua" size="-1">&nbsp;</font><font face="Book Antiqua"><INPUT name=next type=submit value="Save and Continue >"></font></td>
                      <TD align=right>
                      <font face="Book Antiqua">
                      &nbsp;</font></TD></TR></TBODY></TABLE>
                  <HR noShade SIZE=1>
                </TD></TR>
              <TR>
                
      <TD width="722" height="2"></TD>
    </TR></TABLE>
	</form>
