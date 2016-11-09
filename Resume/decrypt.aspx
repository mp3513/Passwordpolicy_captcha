<%@ Page Language="C#" AutoEventWireup="true" CodeFile="decrypt.aspx.cs" Inherits="encrypt.decrypt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <u>Decrypt</u>
<br />
<br />
Encrypted Text:
<asp:TextBox ID="txtEncryptedText" runat="server" Text="" />
<br />
<br />
Decrypted Text:
<asp:Label ID="lblDecryptedText" runat="server" Text="" />
<br />
<br />
<asp:Button ID="btnDecrypt" OnClick="Decrypt" Text="Decrypt" runat="server" />
    </div>
    </form>
</body>
</html>
