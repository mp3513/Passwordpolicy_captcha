<!--
Purpose		: Targetandjoblocation form 
Created  on	: 28-Jun-01/Rachit
Last moodified	: 9-Jul-2001/Sanjeev
-->

<html>
<head>
<script language="JavaScript" src="../cfunc.js"></script>

<SCRIPT language=JavaScript>

    function validatePage() {
        if (!(isNumber(document.form2.salary, "Desired Salary")))
            return false;

        var str = (document.form2.description.value);
        if (str.length > 250) {
            alert("Description cannot be more than 250 characters");
            document.form2.description.focus();
            return false;
        }

        return true;

    }


</SCRIPT>

<link rel="stylesheet" type="text/css" href="../acro_style.css">

</head>

<body bgcolor="#FFFFFF"  onload=document.form2.desiredjobtype.focus()>

<form action="targetjobsubmit.asp" method=post id=form2 name=form2 onSubmit="return validatePage()">
<INPUT name=newloc type=hidden>
  <table border=0 cellpadding=0 cellspacing=0 width="550">
    <tr> 
      <td align=middle width="664"> 
        <table border=0 cellpadding=4 cellspacing=0 width="614" height="573">
          <tbody> 
          <tr> 
            <td align=middle colspan=4 height="24" width="594"> 
              <p align="left"><b><font size="4" color="#6699CC" face="Arial">Target Job</font></b></p>
            </td>
          </tr>
          <tr> 
            <td colspan=4 width="594" valign="top"> 
              <hr noShade size=1>
            </td>
          </tr>
          <tr> 
            <td align=right width=82 height="21" class="tabletext"> 
              <p>Duration<font color=#cc0000>*</font> </p>
            </td>
            <td width=506 height="21" colspan="3">
              <select name=desiredjobtype size=1 tabindex=1>
                
                <% 
					'DurationVal is array taken from acroinc.inc file
						arrLength=UBOUND(desjobtype) - 1 
						for  i=0 to  arrLength
							if cint(varDesiredJobType)= i then	%>
								<option selected value="<%= varDesiredJobType%>"><%=desjobtype(varDesiredJobType)%></option>
							<% else %>
								<option value="<%=(i)%>" ><%=desjobtype(i)%>
								</option>
							<% end if 
						next %>
					</select>
            </td>
          </tr>
          <tr> 
            <td height="25" align="right" width="82" class="tabletext"> Schedule<font color=#cc0000>*</font> 
            </td>
            <td height="25" width="506" colspan="3">
              <select name=desiredstatusid size=1 tabindex=2>
           
           	<% 'Desiredstat is array taken from acroinc.inc file
						arrLength=UBOUND(Desiredstat) - 1 
						for i=0 to  arrLength
							if cint(varDesiredStatusId)=i then %>
								<OPTION selected value="<%= varDesiredStatusId%>"><%=desiredstat(varDesiredStatusId)%>
                            </OPTION>
							<% else %>
								<option value="<%=(i)%>" ><%=Desiredstat(i)%>
								</option>
            		   <% end if 
		               next %>
              </select>
            </td>
          </tr>
          <tr> 
            <td height="25" align="right" width="82" class="tabletext">Salary 
            </td>
            <td height="25" width="506" colspan="3">
            <INPUT maxLength=11 name="salary" value="<%=varDesiredSalary%>" size=14 tabindex="3">
			
              <select 
                  name=currencyid size="1" tabindex="4">
             
              <% 'CurrencyVal is array taken from acroinc.inc file
			
			arrLength=UBOUND(CurrencyVal) - 1 
			for i=0 to  arrLength
				if varCurrencyVal = CurrencyVal(i) then %>
					<OPTION selected value="<%=varCurrencyVal%>"><%=varCurrencyVal%></OPTION>
	              		<% else %>
					<option value="<%=CurrencyVal(i)%>"><%=CurrencyVal(i)%>
					</option>
        	    		<% end if 
		        next %>
			</select>
              <select name="salarytypeid" size="1" tabindex="5">
                			    
              <% 'Salarytypeid is array taken from acroinc.inc file

			arrLength=UBOUND(Salarytypearray) - 1 
			for i=0 to  arrLength
				if varSalaryFrequency = i then %>
					<OPTION selected value="<%=varSalaryFrequency%>"><%=Salarytypearray(varSalaryFrequency)%></OPTION>
	              		<% else %>
					<option value="<%=i%>"><%=Salarytypearray(i)%>
					</option>
	            		   <% end if 
	               next %>
                   </select>
            </td>
          </tr>
          <tr> 
            <td height="22" width="82" class="tabletext"></td>
            <td height="22" valign="bottom" class="tabletext" width="126"><i>City</i></td>
            <td height="22" width="102" valign="bottom" class="tabletext"><i>State</i></td>
            <td height="22" width="280" valign="bottom" class="tabletext"><i>Country</i></td>
          </tr>
          <tr> 
            <td height="25" width="82" class="tabletext"> 
              <p align="right">Location [1]
            </td>
            <td height="25" align="left" width="126">
              <input maxlength=11 name=city1 size=15 value="<%=cityvar1%>"  tabindex="6">
            </td>
            <td height="25" width="102"> 
              <select name=state1 size=1 tabindex=7>
                
             <% while not rslocation.EOF %>
	             <% if rslocation("countryvalue")=statevar1 then %>
  		           <option selected value="<%=statevar1%>"><%=rslocation("countryfield")%></option>
             
        	     <% else %>
            		 <option value="<%=rslocation("countryvalue")%>"><%=rslocation("countryfield")%></option>
		             <% end if %>
             
    	         <% rslocation.movenext ()
             wend

             rslocation.MoveFirst()
             
              %>    
                </select>
            </td>
            <td height="25" width="280">
              <select name=country1 size="1" tabindex=8>
               <% while not rscountry.EOF %>
		             <%if rscountry("countryvalue")=countryvar1 then %>
			             <option selected value=<%=countryvar1%>><%=rscountry("countryfield")%></option>
					<% else %>
			             <option value=<%=rscountry("countryvalue")%>><%=rscountry("countryfield")%></option>
        	    <% end if %>
             
            	 <% rscountry.movenext ()
             
	             wend
		           rscountry.MoveFirst()
                %>    

					</select>
            </td>
          </tr>
          <tr> 
            <td height="25" width="82" class="tabletext"> 
              <p align="right">Location [2]
            </td>
            <td height="25" align="left" width="126">
              <input maxlength=11 name=city2 value="<%=cityvar2%>" size=15  tabindex="9">
            </td>
            <td height="25" width="102">
              <select name=state2 size=1 tabindex=10>
              
                
              <% while not rslocation.EOF %>
		             <% if rslocation("countryvalue")=statevar2 then %>
    		         <option selected value="<%=statevar2%>"><%=rslocation("countryfield")%></option>
             
            	 <% else %>
			             <option value=<%=rslocation("countryvalue")%>><%=rslocation("countryfield")%></option>
        	     <% end if %>
             
	             <% rslocation.movenext ()
             wend
             rslocation.MoveFirst()
             
              %>    
               
              </select>
            </td>
            <td height="25" width="280">
              <select name=country2 size="1" tabindex=11>
             <% while not rscountry.EOF %>
	             <% if rscountry("countryvalue")=countryvar2 then %>
  		           <option selected value=<%=countryvar2%>><%=rscountry("countryfield")%></option>
             
        	     <% else %>
            		 <option value=<%=rscountry("countryvalue")%>><%=rscountry("countryfield")%></option>
	             <% end if %>
           
	             <% rscountry.movenext ()
             
	            wend
             rscountry.MoveFirst()
             
              %>    
              
              </select>
            </td>
          </tr>
          <tr> 
            <td height="25" width="82" class="tabletext"> 
              <p align="right">Location [3]
            </td>
            <td height="25" align="left" width="126">
              <input maxlength=11 name=city3 value="<%=cityvar3%>" size=15 tabindex="12">
            </td>
            <td height="25" width="102">
              <select name=state3 size=1 tabindex="13">
           

			   <% while not rslocation.EOF %>
             <% if rslocation("countryvalue")=statevar3 then %>
		             <option selected value="<%=statevar3%>"><%=rslocation("countryfield")%></option>
             
             <% else %>
    	         <option value=<%=rslocation("countryvalue")%>><%=rslocation("countryfield")%></option>
             <% end if %>
             
             <% rslocation.movenext ()
            wend
            rslocation.MoveFirst()
				%>    

              </select>
            </td>
            <td height="25" width="280">
              <select name=country3 size="1" tabindex=14>
            <% while not rscountry.EOF %>
	             <% if rscountry("countryvalue")=countryvar3 then %>
		             <option selected value=<%=countryvar3%>><%=rscountry("countryfield")%></option>
					 <% else %>
        	     	<option value=<%=rscountry("countryvalue")%>><%=rscountry("countryfield")%></option>
            	 <% end if %>
             
	             <% rscountry.movenext ()
             
             wend
             rscountry.MoveFirst()
             
              %>
              </select>
            </td>
          </tr>
          <tr> 
            <td height="119" width="82"> 
              <p align="right" class="tabletext">Description
            </td>
            <td colspan=3 height="119" width="506"> 
              <textarea cols=45 name="description" rows=5 tabindex=15 wrap=VIRTUAL maxlength="250"><%=varDescription%></textarea>
            </td>
          </tr>
          <tr> 
            <td colspan=4 height="67" width="594"> 
              <hr noShade size=1>
              <table border=0 cellpadding=0 cellspacing=0 width="100%">
                <tbody> 
                <tr> 
                  <td align=left> 
                    &nbsp;<input name=Submit2 type=submit value='Save and Continue >'><td align=right> 
                    &nbsp;</td>
                </tr>
                </tbody>
              </table>
              <hr noShade size=1>
            </td>
          </tr>
          <tr> 
            <td colspan=4 width="594" height="126"> 
              <p class="bodytext"><b><font color="#6699CC">Instructions:<br>
                <br>
                </font></b><b><font color="#808080">Location</font></b><font color="#808080">: 
                Select up to three target locations.<br>
                <br>
                </font><font color="#808080"><b>Description</b>: Here's your chance 
                to expand on the objective you completed in the introduction.<br>
                Briefly describe your ideal working environment.&nbsp; For your 
                ideal company, consider its industry,<br>
                size, market position, etc.&nbsp; For your ideal role within this 
                company, think about the technologies<br>
                you'd like to use, projects you want to be involved in, your capacity 
                to lead, etc.</font> 
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
