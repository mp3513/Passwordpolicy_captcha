<!--
Purpose		: Resume Contact Information display file
Created on		: 29-Jun-01/Rachit
Last moodified	: 7-Aug-2001/Sanjeev
-->

<!-- #INCLUDE file="acroinc.inc" -->

<html>
<head>
<script language="JavaScript" src="../cfunc.js"></script>
<script language="javascript">

    function validatePage() {
        //  if all the fields are blank, continue. 
        //  else check if all mandatory fields are null. If all are null, then
        //  set all non-mandatory fields to null and go to next page
        //  Else if atleast one mandatory field has been inserted, force the user
        //  to enter other mandatory fields

        if (checkBlankForm(document.form2, blankArrayFields)) {
            return true;
        }
        else	// all fields are not blank
        {
            if (IsBlankArray(mandatoryFieldsArray)) // check if all mandatory fields are blank
            {
                // If all these are blank it will return true 
                // but if at least one is blank, it will return false
                // set all non-mandatory fields to null
                setNull(FieldsToBeMadeNull);
                return true;
            }
            else	//at least one mandatory field is not blank
            {
                if (checkFillForm(document.form2, FieldsToIgnore)) {
                    if (isEmail(document.form2.url, "Email"))
                        return true;
                    else
                        return false;
                }
                else
                //all are not filled
                {
                    alert("All the mandatory fields must be entered");
                    return false;
                }
            }
        }
    }  

	
</script>

<link rel="stylesheet" type="text/css" href="../acro_style.css">

</head>
<BODY bgcolor="#ffffff" onload="document.form2.firstname.focus()">

<table width="603">
<form action="candidatesubmit.asp" method=post id=form2 name=form2 onSubmit="return validatePage()">
	<TBODY>
        <TR>
          <TD align=middle width="608">
            
      <TABLE border=0 cellPadding=2 cellSpacing=0 width=595>
        <TBODY> 
        <TR> 
          <TD align=middle colSpan=2 width="589"> 
            <p align="left"><B><font color="#6699CC" face="Arial" size="4">Contact 
              Information</font></B></p>
          </TD>
        </TR>
        <TR> 
          <TD colSpan=2 width="589"> 
            <HR noShade SIZE=1 width="585">
          </TD>
        </TR>
        <TR> 
          <TD align=right width="136" class="tabletext">First Name <FONT color=#cc0000>*</font></TD>
          <TD width="453"> 
            <INPUT tabindex=1 maxLength=20 name=firstname value="<%=varFirstName%>" size=46>
          </TD>
        </TR>
        <TR> 
          <TD align=right width="136" class="tabletext">Last Name <FONT color=#cc0000>* 
            </FONT></TD>
          <TD width="453"> 
            <INPUT maxLength=20 name=lastname value="<%=varLastName%>" size=46 tabindex=2>
          </TD>
        </TR>
        <TR> 
          <TD align=right width="136" class="tabletext">Home Address<FONT color=#cc0000>* 
            </FONT></TD>
          <TD width="453"> 
            <INPUT maxLength=30 name=address1 value="<%=varAddress1%>" size=46 tabindex=6>
          </TD>
        </TR>
        <TR> 
          <TD align=right width="136" class="tabletext"> 
            <P>City<FONT color=#cc0000>* </FONT></P>
          </TD>
          <TD width="453"> 
            <INPUT maxLength=15 name=state tabindex=7 value="<%=varState%>" size=46 >
          </TD>
        </TR>
        <tr> 
          <TD align=right width="136" class="tabletext">State </TD>
          <TD width="453"> 
            <INPUT maxLength=30 name=address2 tabindex=8 value="<%=varAddress2%>" size=46 >
          </TD>
        </tr>
        <TR> 
          <TD align=right width="136" class="tabletext">Postal/Zip Code<FONT color=#cc0000>* 
            </FONT></TD>
          <TD width="453"> 
            <INPUT maxLength=6 name=zip tabindex=9 value="<%=varZip%>" size=11 >
          </TD>
        </TR>
        <tr> 
          <TD align=right width="136" class="tabletext">Country<FONT color=#cc0000>*</FONT></TD>
          <TD width="453"> 
            <SELECT name=country size="1" tabindex = "10" >
            
             <% while not rscountry.EOF %>
					<% if rscountry("countryvalue")=varCountry then %>
						<option selected value="<%=rscountry("countryvalue")%>"><%=rscountry("countryfield")%></option>
             
					<% else %>
						<option value=<%=rscountry("countryvalue")%>><%=rscountry("countryfield")%></option>
             <% end if %>
             
						<% rscountry.movenext ()
             wend
				
              %>    
         
            </SELECT>
          </TD>
        </tr>
        <TR> 
          <TD align=right width="136" class="tabletext">Day Phone</TD>
          <TD width="453"> 
            <INPUT maxLength=16 name=daytimephone tabindex=12 value="<%=varDayTimePhone%>"  >
          </TD>
        </TR>
        <TR> 
          <TD align=right width="136" class="tabletext">Evening </TD>
          <TD width="453"> 
            <INPUT maxLength=16 name=eveningphone tabindex=13 value="<%=varEveningPhone%>"  >
          </TD>
        </TR>
        <TR> 
          <TD align=right width="136" class="tabletext">Mobile | Fax </TD>
          <TD width="453"> 
            <INPUT maxLength=12 name=mobilephone tabindex=14 value="<%=varMobilePhone%>"  
           >
            &nbsp; 
            <INPUT maxLength=16 name=fax tabindex=15 value="<%=varFax%>"  
           >
          </TD>
        </TR>
        <TR> 
          <TD align=right width="136" class="tabletext">Pager </TD>
          <TD width="453"> 
            <INPUT maxLength=12 name=pager tabindex=16 value="<%=varPager%>"  
           >
          </TD>
        </TR>
        <TR> 
          <TD align=right width="136" class="tabletext">E-Mail </TD>
          <TD width="453"> 
            <INPUT maxLength=35 name=url tabindex=17 value="<%=varUrl%>" size=42 >
          </TD>
        </TR>
        
        <TR> 
          <TD align=middle colSpan=2 width="589" class="tabletext"></TD>
        </TR>
        <TR> 
          <TD colSpan=2 width="589"> 
            <HR noShade SIZE=1 width="585">
            <TABLE border=0 cellPadding=0 cellSpacing=0 width="584">
              <TBODY> 
              <TR> 
                  <TD align=left width="366"> 
                    <div>
                      <input name=next type=submit tabindex=21 value="Save and Continue >"  >
                    </div>
                  </TD>
                  <TD align=right width="214"> 
                    <div align="center"> </div>
                  </TD>
              </TR>
              </TBODY> 
            </TABLE>
            <HR noShade SIZE=1 width="585">
          </TD>
        </TR>
        <TR> 
          <TD colSpan=2 width="589"> </TD>
        </TR>
        </TBODY> 
      </TABLE>
  </TD></TR>
    <script language="javascript">
        var FieldsToBeMadeNull = new Array(document.form2.dobmonth,
							document.form2.dobday,
							document.form2.dobyear,
							document.form2.address2,
							document.form2.passportnumber,
							document.form2.socialsecuritynumber,
							document.form2.daytimephone,
							document.form2.eveningphone,
							document.form2.mobilephone,
							document.form2.pager,
							document.form2.fax,
							document.form2.url,
							document.form2.textresume
)

        var FieldsToIgnore = new Array(document.form2.dobmonth,
							document.form2.dobday,
							document.form2.dobyear,
							document.form2.address2,
							document.form2.daytimephone,
							document.form2.eveningphone,
							document.form2.mobilephone,
							document.form2.pager,
							document.form2.fax,
							document.form2.url,
							document.form2.textresume
							)

        var mandatoryFieldsArray = new Array(document.form2.firstname,
						  document.form2.lastname,
						  document.form2.address1,
						  document.form2.state,
						  document.form2.zip


						 )

        var blankArrayFields = new Array(document.form2.country,
        //	  document.form2.careerlevelid,
						  document.form2.confidential)							  

</script>

</form>
</table>

</BODY>
