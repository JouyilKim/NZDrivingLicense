using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_Zealand_Driving_Test_Web_Application
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddQ_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddQ.aspx");
        }
    }
}