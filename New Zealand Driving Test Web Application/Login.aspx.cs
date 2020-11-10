using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace New_Zealand_Driving_Test_Web_Application
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (loginStatus())
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "{error}", "alert('Please log out first!');window.location.href='Default.aspx'", true);
                }
            }
            catch
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "{error}", "alert('{Master page load error}');window.location.href='Login.aspx' ", true);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            UserMidLayer umt = new UserMidLayer();
            SqlDataReader reader = umt.Login(txtEmail.Text, txtPWD.Text);
            if (reader.Read())
            {

                Response.Cookies["name"].Value = reader["name"].ToString();
                Response.Cookies["user_id"].Value = reader["ID"].ToString();

                /*
                 * roles is a colume in the user database to identify if it's 
                 * a customer or administer
                 */
                Response.Cookies["roles"].Value = reader["type"].ToString();

                Response.Cookies["name"].Expires = DateTime.Now.AddDays(10);
                Response.Cookies["user_id"].Expires = DateTime.Now.AddDays(10);
                Response.Cookies["roles"].Expires = DateTime.Now.AddDays(10);

                reader.Close();
                umt.CloseConnection();
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblLoginError.Text = "Login failed. check your id or password.";
            }

        }

        protected void lkbtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        //return true if logged in
        protected bool loginStatus()
        {
            try
            {
                if (Request.Cookies["name"].Value == "")
                    return false;
                else
                    return true;
            }
            catch
            {
                return false;
            }
        }
    }
}