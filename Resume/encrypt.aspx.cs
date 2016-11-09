using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;


namespace encrypt
{
    public partial class encrypt : System.Web.UI.Page
    {
		public string EncryptedText;
		
        protected void Page_Load(object sender, EventArgs e)
        {
			EncryptedText = this.Encrypt("madhura");
			Session["encryptedtext"] = EncryptedText;
			Response.Redirect("test.asp")
        }
       
        private string Encrypt(string clearText)
        {
            string EncryptionKey = "B6FBE190-F4D5-4276-A52D-B192E413EE97";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

       
    }
}