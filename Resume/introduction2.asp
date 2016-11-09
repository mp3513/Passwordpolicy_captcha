<!-- 
Purpose: to display candidate introduction form
Created: 9-Aug-01/Sanjeev
 -->

<html>
<head>
<script language="javascript" src="../cfunc.js"></script>

<script language="JavaScript">
    function validatePage() {
        //for validating the blank title field
        if (isBlank(document.introform.title, "Title")) {
            alert("Title can not be blank");
            document.introform.title.focus();
            return false;
        }

        var str = (document.introform.objective.value);
        if (str.length > 2000) {
            alert("Objective cannot be more than 2000 characters");
            document.introform.objective.focus();
            return false;
        }

        return true;

    }

</script>

<link rel="stylesheet" type="text/css" href="../acro_style.css">

</head>

<body bgcolor="#ffffff" onload="document.introform.title.focus()">

<FORM METHOD="POST" NAME=introform ACTION="introductionsubmit.asp" onSubmit="return validatePage()">

	<table border="0" cellPadding="6" cellSpacing="0" width="550">
  <tr>
    <td width="789" valign="top" align="left">
      <p align="left"><b><font face="Arial" size="4" color="#6699CC">Introduction</font></b></p>
      <p class="tabletext">Welcome to the Acro Resume Builder.&nbsp; We've
      designed it to present your talents and experience in a way that generates
      fast, quality responses.&nbsp; Where applicable, instructions for each
      section of the builder appear at the bottom of the page.</p>
    </td>
  </tr>
  <tr>
    <td valign="top" align="middle" width="969" height="439">
      <table width="550" border="0" cellpadding="0" cellspacing="0" height="309">
        <tr>
          <td colspan="2" align="middle" width="616" height="1">
            <hr noshade size="1">
          </td>
        </tr>
        <tr>
          <td colspan="2" align="middle" width="616" height="1">
            <p align="left"><b><font color="#6699CC" size="4" face="Arial">Summary
            &amp; Objective</font></b></p>
          </td>
        </tr>
        <tr>
          <td colspan="2" width="616" height="1">
            <b><font face="Book Antiqua" size="-2">&nbsp;&nbsp;</font></b>
          </td>
        </tr>
        <tr>
          <td width="133" height="26">
            <p align="right" class="tabletext">Summary<font color="#CC0000">*</font><b>&nbsp;</b><font color="#cc0000">&nbsp;</font></p>
          </td>
          <td width="481" height="26">
          <input name="title" value = "<%= varTitle %>" size ="48" maxlength="50">
          </td>
        </tr>
        <tr>
          <td width="133" align="right">
            <font size="1" face="Book Antiqua">&nbsp;&nbsp;</font>
          </td>
          <td width="481"></td>
        </tr>
        <tr>
          <td width="133" align="right" height="30">
            <p class="tabletext">
          Objective&nbsp;
          </td>
          <td width="481" height="30"><font size="1" face="Book Antiqua"><TEXTAREA cols=42 name="objective" rows=45 style="HEIGHT: 66px;" 
          wrap=VIRTUAL maxlength="2000" ><%=varObjective%></TEXTAREA>
  </font></td>
        </tr>
        <tr>
          <td width="133" align="right">
            <p class="tabletext">
          &nbsp;&nbsp;
          </p>
          </td>
          <td width="481"></td>
        </tr>
        <tr>
          <td colspan="2" width="616" height="1">
            <hr noshade size="1">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left">
                    <p align="left"> <font face="Book Antiqua">  
                      <input type="submit" name="Submit" value="Save and Continue >"></font></p>
                </td>
                  <td align="right"> 
                    <p align="center"><font face="Book Antiqua"> 
                      &nbsp;</font></p>
                </td>
              </tr>
            </table>
            <hr noshade size="1">
            <p class="bodytext"><b><font color="#6699CC">Instructions:</font></b></p>
            <p class="bodytext"><font color="#808080"><b>Summary </b>(50
            characters max): A concise summary of your specialty, experience,
            and/or career goals.&nbsp; This is the written equivalent of an
            &quot;elevator speech,&quot; and is designed to help us find you the
            best possible job opportunity.&nbsp; For example, &quot;Designer w/
            5 yrs Pro/E experience.&quot;&nbsp;&nbsp;&nbsp;&nbsp;</font></p>
            <p class="bodytext"><font color="#808080"><b>Objective </b>(2000
            characters max): Briefly describe your target job and how you are
            uniquely qualified to excel in this position.&nbsp;&nbsp;</font></p>
            <p class="bodytext"><b><font color="#6699CC">General:</font></b></p>
            <p class="bodytext">We
            recommend that you complete your resume in one session, but you can
            save it anytime and sign in again to make changes.</p>
            <p style="MARGIN-BOTTOM: 0px; MARGIN-TOP: 0px; WORD-SPACING: 0px" class="bodytext" 
           ><font color="#808080">Fields marked with (</font><font color="#CC0000">*</font><font color="#808080">) are mandatory. At the end of each
            screen, click the <b>Save and Continue </b>button to store any information you have entered and to move on to
            the next screen.</font> </p>
            
            <p style="MARGIN-BOTTOM: 0px; MARGIN-TOP: 0px; WORD-SPACING: 0px" class="bodytext" 
           >&nbsp; </p>
            
            <p style="MARGIN-BOTTOM: 0px; MARGIN-TOP: 0px; WORD-SPACING: 0px" class="bodytext" 
           ><font color="#808080">Not all information requested in the forms
            (e.g., target locations) will appear in the viewable resume.&nbsp;
            Our recruiters will use this information to find jobs that best meet
            your needs.</font> </p>
            
          </td>
        </tr>
        <tr>
          <td colspan="2" width="616" height="1">
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

</form>

</body>
</html>
