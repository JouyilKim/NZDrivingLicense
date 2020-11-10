using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace New_Zealand_Driving_Test_Web_Application
{
    public class QuestionMidLayer
    {
        string connectionString;
        SqlConnection con;
        public QuestionMidLayer()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            con = new SqlConnection(connectionString);
            con.Open();
        }

        public int getMaxID()
        {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select Max(Id) from tblQuestion";

            int maxID = Convert.ToInt16(cmd.ExecuteScalar().ToString());
            return maxID;
        }

        public bool SaveQuestion(int Id, string question, string optionA, string optionB,
            string optionC, string optionD, string answer, string description, string image)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into tblQuestion" +
                " ([Id], [question], [optionA], [optionB], [optionC], [optionD], [answer], [description], [image]) " +
                " values(@Id, @question, @optionA, @optionB, @optionC, @optionD,@answer, @description,@img)";

            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@question", question);
            cmd.Parameters.AddWithValue("@OptionA", optionA);
            cmd.Parameters.AddWithValue("@OptionB", optionB);
            cmd.Parameters.AddWithValue("@OptionC", optionC);
            cmd.Parameters.AddWithValue("@OptionD", optionD);
            cmd.Parameters.AddWithValue("@answer", answer);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@img", image);

            int i = 0;
            i = Convert.ToInt16(cmd.ExecuteNonQuery());
            if (i > 0)

                return true;
            else
                return false;
        }
        public void CloseConnection()
        {
            //Step 6 - Close the connection.
            con.Close();
            con = null;
        }
    }
}