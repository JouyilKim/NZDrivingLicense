using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_Zealand_Driving_Test_Web_Application
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (loginStatus())
                {
                    lkbtnLogin.Text = "Logout"; //set link text to logout
                }
            }
            catch
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "{error}", "alert('{Master page load error}');window.location.href='Login.aspx' ", true);
            }
        }

      

        protected void lkbtnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (loginStatus())    //logout; clear all cookies
                {
                    Response.Cookies["name"].Expires = DateTime.MinValue;   //delete user cookies
                    Response.Cookies["user_id"].Expires = DateTime.MinValue;
                    Response.Cookies["roles"].Expires = DateTime.MinValue;

                    lkbtnLogin.Text = "Login"; //set link to "Login" again

                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }
            catch
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "{error}", "alert('{Master logout error}');window.location.href='Login.aspx' ", true);
            }
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