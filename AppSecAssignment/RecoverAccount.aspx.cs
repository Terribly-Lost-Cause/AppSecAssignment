using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppSecAssignment
{
    public partial class RecoverAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString);
            con.Open();
            string sql = "SELECT Email, Questions FROM Users WHERE Email = @Email ";
            
            SqlCommand command = new SqlCommand(sql, con);

            command.Parameters.AddWithValue("@Email", tbEmail.Text);
            SqlDataReader read = command.ExecuteReader();
            if (read.HasRows && read.Read())
            {
                
             
                tbQ.Text = read["Questions"].ToString();
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString);
            con.Open();
            string sql = "SELECT Email, Credit_Card, Answer FROM Users WHERE Email = @Email AND Answer = @Answer";

            SqlCommand command = new SqlCommand(sql, con);

            command.Parameters.AddWithValue("@Email", tbEmail.Text);
            command.Parameters.AddWithValue("@Answer", tbA.Text);

            SqlDataReader read = command.ExecuteReader();
            if (read.HasRows)
            {
                Response.Redirect("Login.aspx", false);

            }
            else
            {
                lblMsg.Text = "Incorrect answer";
            }
            con.Close();
        }
    }
}