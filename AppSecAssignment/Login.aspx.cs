﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Timers;

namespace AppSecAssignment
{
    public partial class Login : System.Web.UI.Page
    {
        
        public class MyObject
        {
            public string success { get; set; }
            public List<string> ErrorMessage { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string getDBHash(string email)
        {
            string h = null;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString);
            string sql = "select PasswordHash FROM Users WHERE Email=@Email";
            SqlCommand command = new SqlCommand(sql, con);
            command.Parameters.AddWithValue("@Email", email);
            try
            {
                con.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {

                    while (reader.Read())
                    {
                        if (reader["PasswordHash"] != null)
                        {
                            if (reader["PasswordHash"] != DBNull.Value)
                            {
                                h = reader["PasswordHash"].ToString();
                            }
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { con.Close(); }
            return h;
        }

        protected string getDBSalt(string userid)
        {
            string s = null;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString);
            string sql = "select PasswordSalt FROM Users WHERE Email=@Email";
            SqlCommand command = new SqlCommand(sql, con);
            command.Parameters.AddWithValue("@Email", userid);
            try
            {
                con.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader["PasswordSalt"] != null)
                        {
                            if (reader["PasswordSalt"] != DBNull.Value)
                            {
                                s = reader["PasswordSalt"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { con.Close(); }
            return s;
        }
        static int attempt = 0;
        static int left = 2;




        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string pwd = tbPassword.Text.ToString().Trim();
            string userid = tbEmail.Text.ToString().Trim();
            SHA512Managed hashing = new SHA512Managed();
            string dbHash = getDBHash(userid);
            string dbSalt = getDBSalt(userid);
            try
            {
                if (dbSalt != null && dbSalt.Length > 0 && dbHash != null && dbHash.Length > 0)
                {
                    string pwdWithSalt = pwd + dbSalt;
                    byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
                    string userHash = Convert.ToBase64String(hashWithSalt);
                    if (attempt < 3)
                    {

                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString);
                        con.Open();
                        string sql = "SELECT Email, PasswordHash FROM Users WHERE Email = @Email AND PasswordHash = @PasswordHash";
                        DataSet set = new DataSet();
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        SqlCommand command = new SqlCommand(sql, con);
                        command.Parameters.AddWithValue("@Email", tbEmail.Text);
                        command.Parameters.AddWithValue("@PasswordHash", dbHash);
                        SqlDataReader read = command.ExecuteReader();
                        if (read.HasRows && userHash.Equals(dbHash))
                        {
                            Session["LoggedIn"] = tbEmail.Text.Trim();

                            string guid = Guid.NewGuid().ToString();
                            Session["AuthToken"] = guid;
                            Response.Cookies.Add(new HttpCookie("AuthToken", guid));

                            Response.Redirect("Homepage.aspx", false);
                        }
                        else if(attempt == 2)
                        {
                            Response.Redirect("RecoverAccount.aspx", false);

                            
                            attempt = 0;
                            left = 2;
                            
                            
                        }
                        else
                        {
                            attempt = attempt + 1;
                            lblMsg.Text = left+" attempts left before account lockout!";
                            left--;

                        }
                        con.Close();
                        
                        
                        
                    }
                    
                } 

        }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { }

        }
        
        protected void OnTimed(object source, ElapsedEventArgs e)
    {
            btnLogin.Enabled = false;
    }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrationForm.aspx", false);

        }

        protected void btnRec_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecoverAccount.aspx", false);
        }
    }
    
}