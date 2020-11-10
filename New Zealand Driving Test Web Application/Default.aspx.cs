using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_Zealand_Driving_Test_Web_Application
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (loginStatus())
                {
                    string userName = Request.Cookies["name"].Value;
                    lblName.Text = "Welcome " + userName + "  !!";

                    if (Convert.ToInt16(Request.Cookies["roles"].Value) == 1)
                    {
                        linkEditQ.Text = "";
                        LinkEditUser.Text = "";
                    }
                    else if (Convert.ToInt16(Request.Cookies["roles"].Value) == 2)
                    {
                        linkEditQ.Text = "Go Edit Questions";
                        LinkEditUser.Text = "Go Edit Users";
                    }
                    else
                    {
                        linkEditQ.Text = "";
                        LinkEditUser.Text = "";
                    }

                }
                else
                {
                    //todo make guest able to view things
                    lblName.Text = "Welcome to New Zealand Driving Test!";
                    linkEditQ.Text = "";
                    LinkEditUser.Text = "";
                }

            }
            catch
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "{error}", "alert('{Default load error}');window.location.href='Login.aspx' ", true);

            }
        }

        protected void linkDefault1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditQ.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditUser.aspx");
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