using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace New_Zealand_Driving_Test_Web_Application
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if the role is not admin, redirect to default
            if (!(Request.Cookies["roles"].Value == "2"))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                    "{noAccess}", "alert('{You have no Access to this!}');window.location.href='Default.aspx' ", true);
            }

            QuestionMidLayer qml = new QuestionMidLayer();
            txtId.Text = "" + (qml.getMaxID() + 1);
            qml.CloseConnection();   //should I close it?
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            QuestionMidLayer qml = new QuestionMidLayer();

            //all the elements to save to database
            int Id = Convert.ToInt32(txtId.Text);
            string question = txtQuestion.Text;
            string optionA = txtOptionA.Text;
            string optionB = txtOptionB.Text;
            string optionC = txtOptionC.Text;
            string optionD = txtOptionD.Text;
            string answer = txtAnswer.Text;
            string description = txtDescription.Text;
            string image = "";

            string fileName = Path.GetFileName(fileUploadImg.FileName); //get file name


            string filePath = "~/images/questionImages/";
            
            image = fileName; //change imgae name to the file name

            fileUploadImg.PostedFile.SaveAs(Server.MapPath(filePath));
            
            if (qml.SaveQuestion(Id, question, optionA, optionB, optionC, optionD, answer,
                description, image))
            {
                //notification for succeed and refresh the page
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                    "{saveProduct}", "alert('{Product saved!}');window.location.href='AddProduct.aspx' ", true);
            }
            else
            {
                //notification failure
                ClientScript.RegisterClientScriptBlock(this.GetType(),
                    "{saveError}", "alert('{Save Failed! Contact the developer!}');window.location.href='AddProduct.aspx' ", true);
            }

        }
    }
}