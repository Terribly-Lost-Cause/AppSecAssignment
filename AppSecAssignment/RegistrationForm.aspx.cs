using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;

namespace AppSecAssignment
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        string MYDBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString;
        static string finalHash;
        static string salt;
        byte[] Key;
        byte[] IV;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string message = checkPassword(tbPassword.Text);

            string pwd = tbPassword.Text.ToString().Trim(); ;
            //Generate random "salt"
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] saltByte = new byte[8];
            //Fills array of bytes with a cryptographically strong sequence of random values.
            rng.GetBytes(saltByte);
            salt = Convert.ToBase64String(saltByte);
            SHA512Managed hashing = new SHA512Managed();
            string pwdWithSalt = pwd + salt;
            byte[] plainHash = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwd));
            byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
            finalHash = Convert.ToBase64String(hashWithSalt);
            RijndaelManaged cipher = new RijndaelManaged();
            cipher.GenerateKey();
            Key = cipher.Key;
            IV = cipher.IV;

            if (checkEmail() == true)
            {
                emailChkr.Text += "Email already in use.\nPlease try again with another email";
                emailChkr.ForeColor = Color.Red;

            }
           
            else if(message != "")
            {
                passwdChkr.Text = message.ToString();
                passwdChkr.ForeColor = Color.Red;
            }
            else
            {
                createAccount();
                Response.Redirect("Login.aspx");
            }

            


        }
        private string checkPassword(string password)
        {
            
            string message = "";
            if (password.Length <= 7)
            {
                message += "\nPassword length must be at least 8 characters\n";
            }
            
            if (Regex.IsMatch(password,"[a-z]")==false)
            {
                message += "\nPassword must have at least 1 lower letter\n";
            }
            if(Regex.IsMatch(password, "[A-Z]") == false)
            {
                message += "\nPassword must have at least 1 upper letter\n";
            }
            if (Regex.IsMatch(password, "[0-9]") == false)
            {
                message += "\nPassword must have at least 1 number\n";
            }
            if (Regex.IsMatch(password, "[^a-zA-Z0-9]") == false)
            {
                message += "\nPassword must have at least 1 special character\n";
            }
            
            return message;
            

        }
        private bool checkEmail()
        {
            bool exist = false;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString);
            
                con.Open();
                string sqlStatement = "SELECT * FROM Users WHERE Email = @Email";
                SqlCommand sqlCmd = new SqlCommand(sqlStatement, con);
                sqlCmd.Parameters.AddWithValue("@Email", tbEmail.Text.Trim());
            SqlDataReader read = sqlCmd.ExecuteReader();
                if (read.HasRows)
                {
                exist = true;
                }
            return exist;
                
            
        }
        protected byte[] encryptData(string data)
        {
            byte[] cipherText = null;
            try
            {
                RijndaelManaged cipher = new RijndaelManaged();
                cipher.IV = IV;
                cipher.Key = Key;
                ICryptoTransform encryptTransform = cipher.CreateEncryptor();
                ICryptoTransform decryptTransform = cipher.CreateDecryptor();
                byte[] plainText = Encoding.UTF8.GetBytes(data);
                cipherText = encryptTransform.TransformFinalBlock(plainText, 0, plainText.Length);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { }
            return cipherText;
        }
        public void createAccount()
        {
            
                using (SqlConnection con = new SqlConnection(MYDBConnectionString))
                {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Users VALUES(@Email, @First_Name, @Last_Name, @Credit_Card, @Date_Of_Birth, @PasswordHash, @PasswordSalt, @EmailVerified, @IV, @Key)"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@Email", tbEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@First_Name", tbFName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Last_Name", tbLName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Credit_Card", Convert.ToBase64String(encryptData(tbCard.Text.Trim())));
                        cmd.Parameters.AddWithValue("@Date_Of_Birth", tbDOB.Text.Trim());
                        cmd.Parameters.AddWithValue("@PasswordHash", finalHash);
                        cmd.Parameters.AddWithValue("@PasswordSalt", salt);
                        cmd.Parameters.AddWithValue("@EmailVerified", DBNull.Value);
                        cmd.Parameters.AddWithValue("@IV", Convert.ToBase64String(IV));
                        cmd.Parameters.AddWithValue("@Key", Convert.ToBase64String(Key));
                        cmd.Connection = con;
                        con.Open();

                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }

            
        }


    }
}
