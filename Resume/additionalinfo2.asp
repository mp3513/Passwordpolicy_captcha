<!--
Purpose		: Additionalinfo fill form command object
Created	on		: 27-Jun-01/Rachit
Last moodified	: 10-Aug-2001/Sanjeev
-->

<html>
<head>

<script language="javascript">

    function validatePage() {
        //check DESCRIPTION TO be 2000 CHARS
        var descriptionValue = document.additionalform.information.value;
        if (descriptionValue.length > 2000) {
            alert("Description cannot be more than 2000 characters");
            return false;
        }

        return true;
    }
	
</script>

<link rel="stylesheet" type="text/css" href="../acro_style.css">

</head>

<body bgcolor="#FFFFFF" onload="document.additionalform.information.focus()">

  <form action="additionalinfosubmit.asp" method=post name="additionalform" onSubmit="return validatePage()">

<table border="0" cellPadding="6" cellSpacing="0" width="585">
  <tr>
    <td align="middle" width="532">
      <table border="0" cellPadding="2" cellSpacing="0" width="574">
        <tbody>
          <tr>
            <td align="middle" width="568">
              <p align="left"><b><font size="4" color="#6699CC" face="Arial">Additional
              Information</font></b></p>
            </td>
          </tr>
          <tr>
            <td align="left"><font face="Arial">

            <TEXTAREA cols="50" name="information" rows="10"  
          wrap="VIRTUAL" align="left" ><%=information%></textarea></font>
            </td>
          </tr>
          <tr>
            <td width="568">
              <hr noShade SIZE="1">
              <table border="0" cellPadding="0" cellSpacing="0" width="100%">
                <tbody>
                  <tr>
                    <td align="left" width="97">
                    &nbsp;<input name="Next" type="submit" value="Save"></td>
                    <td align="right">
                    
                    &nbsp;</td>
                  </tr>
                </tbody>
              </table>
              <hr noShade SIZE="1">
            </td>
          </tr>
          <tr>
            <td width="568" valign="top">
            <p class="bodytext"><b><font color="#6699CC">Instructions:</font></b></p>
            <p class="bodytext"><font color="#808080">Providing additional
            information is optional.&nbsp; Add any comments or other information
            you would like to include in your resume.&nbsp; You may wish to add
            items such as awards, publications, patents, inventions, etc.</font></p>
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