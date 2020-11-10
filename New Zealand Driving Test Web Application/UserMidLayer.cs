using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;

namespace New_Zealand_Driving_Test_Web_Application
{
    public class UserMidLayer
    {
        string connectionString;
        SqlConnection con;
        
        public UserMidLayer()
        {

            connectionString = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            con = new SqlConnection(connectionString);
            con.Open();
        }

        public SqlDataReader Login(string email, string password)
        {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblUser where email=@email and password=@password";


            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", getPasswordHash(email, password));



            SqlDataReader reader = cmd.ExecuteReader();



            return reader;
        }

        public bool RegisterUser(string email, string password, string name)
        {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into tblUser values(@id, @email, @password, @name," +
                " 1)";


            //add values into the query
            cmd.Parameters.AddWithValue("@id", getMaxID() + 1);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", getPasswordHash(email, password));
            cmd.Parameters.AddWithValue("@name", name);

            int i = 0;
            i = Convert.ToInt16(cmd.ExecuteNonQuery());

            if (i > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //for get the max value of id
        public int getMaxID()
        {
            string query = "select Max(Id) from tblUser";

            SqlCommand command = new SqlCommand(query, con);
            try
            {
                int maxID = int.Parse(command.ExecuteScalar().ToString());
                return maxID;
            }
            catch
            {
                return 0;
            }
            
        }

        //check if email is already registered
        public bool checkEmailExists(string email)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblUser where email=@email";

            cmd.Parameters.AddWithValue("@email", email);

            if (cmd.ExecuteScalar() != null)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        //hash method, also share with login 
        public string getPasswordHash(string userID, string password)
        {
            return processPassword(userID, password);
        }

        private static string processPassword(string userID, string password)
        {
            byte[] bytePassword = ASCIIEncoding.ASCII.GetBytes(password + getSalt(userID));
            HashAlgorithm hashAlgorithm;

            if (userID.Length % 3 == 0)
                hashAlgorithm = SHA256.Create();
            else if (userID.Length % 3 == 1)
                hashAlgorithm = SHA512.Create();
            else
                hashAlgorithm = SHA1.Create();

            byte[] byteHashPassword = hashAlgorithm.ComputeHash(bytePassword);
            return Convert.ToBase64String(byteHashPassword);
        }
        private static string getSalt(string userID)
        {
            return "Salt" + userID;
        }

        public void CloseConnection()
        {
            con.Close();
            con = null;
        }

    }

}