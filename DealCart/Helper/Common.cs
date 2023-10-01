using System.Collections;
using System.Security.Cryptography;
using System.Text;

namespace DealCart.Helper
{

    public class Common
    {

        private readonly IHttpContextAccessor _contextAccessor;

        public Common(IHttpContextAccessor contextAccessor)
        {

            _contextAccessor = contextAccessor;

        }

        public static String Encryption(string TextToBeEncrypted)
        {
            string EncryptedData = string.Empty;
            if (!string.IsNullOrWhiteSpace(TextToBeEncrypted))
            {
                RijndaelManaged RijndaelCipher = new RijndaelManaged();
                String Password = "CSC";
                Byte[] PlainText = System.Text.Encoding.Unicode.GetBytes(TextToBeEncrypted);
                Byte[] Salt = Encoding.ASCII.GetBytes(Password.Length.ToString());
                PasswordDeriveBytes SecretKey = new PasswordDeriveBytes(Password, Salt);
                //Creates a symmetric encryptor object. 
                ICryptoTransform Encryptor = RijndaelCipher.CreateEncryptor(SecretKey.GetBytes(32), SecretKey.GetBytes(16));
                MemoryStream memoryStream = new MemoryStream();
                //Defines a stream that links data streams to cryptographic transformations
                CryptoStream cryptoStream = new CryptoStream(memoryStream, Encryptor, CryptoStreamMode.Write);
                cryptoStream.Write(PlainText, 0, PlainText.Length);
                //Writes the final state and clears the buffer
                cryptoStream.FlushFinalBlock();
                Byte[] CipherBytes = memoryStream.ToArray();
                memoryStream.Close();
                cryptoStream.Close();
                EncryptedData = Convert.ToBase64String(CipherBytes);
            }
            return EncryptedData;
        }

        public static String Decryption(string TextToBeDecrypted)
        {
            string DecryptedData = string.Empty;
            if (!string.IsNullOrEmpty(TextToBeDecrypted))
            {
                TextToBeDecrypted = TextToBeDecrypted.Replace(" ", "+");
                RijndaelManaged RijndaelCipher = new RijndaelManaged();
                String Password = "CSC";
                try
                {
                    Byte[] EncryptedData = Convert.FromBase64String(TextToBeDecrypted);
                    Byte[] Salt = Encoding.ASCII.GetBytes(Password.Length.ToString());
                    //Making of the key for decryption
                    PasswordDeriveBytes SecretKey = new PasswordDeriveBytes(Password, Salt);
                    //Creates a symmetric Rijndael decryptor object.
                    ICryptoTransform Decryptor = RijndaelCipher.CreateDecryptor(SecretKey.GetBytes(32), SecretKey.GetBytes(16));
                    MemoryStream memoryStream = new MemoryStream(EncryptedData);
                    //Defines the cryptographics stream for decryption.THe stream contains decrpted data
                    CryptoStream cryptoStream = new CryptoStream(memoryStream, Decryptor, CryptoStreamMode.Read);
                    Byte[] PlainText = new Byte[EncryptedData.Length];
                    Int32 DecryptedCount = cryptoStream.Read(PlainText, 0, PlainText.Length);
                    memoryStream.Close();
                    cryptoStream.Close();
                    //Converting to string
                    DecryptedData = Encoding.Unicode.GetString(PlainText, 0, DecryptedCount);
                }
                catch (Exception ex)
                {
                    //ErrorSignal.FromCurrentContext().Raise(ex);
                    DecryptedData = TextToBeDecrypted;
                }
            }
            return DecryptedData;
        }

       
        public static String GetContextFromHTML(Hashtable paramLst, string Path)
        {
            string context = "";
            using (StreamReader sr = new StreamReader(Path))
            {
                String line;
                while ((line = sr.ReadLine()) != null)
                {
                    context += line;
                }
            }
            if (context.Length > 0)
            {
                foreach (DictionaryEntry key in paramLst)
                {
                    context = context.Replace(key.Key.ToString(), Convert.ToString(key.Value));
                }
            }
            return context;
        }


        public static string AccountNumberHide(string number)
        {
            if (number != null)
            {

                string creditCardAsteric = number.Substring(number.Length - 2).PadLeft(number.Length, '*');
                return creditCardAsteric;
            }
            else
            {
                return "";
            }

        }

       



   


    }

}
