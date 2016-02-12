using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


public partial class LogIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        //new connection
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BPIConnectionString"].ConnectionString);
       
        //Open the connection
        conn.Open();
        //select all users by the username entered
        String checkUsr = "Select count(*) from UserDataTbl where userName ='"+txtBoxUserName.Text +"'";

        //new communication
        SqlCommand com = new SqlCommand(checkUsr, conn);

        //if the user is there temp will be = 1 
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();
       
        if (temp == 1)
        {
            conn.Open();
            String checkPwd = "Select password from UserDataTbl where userName ='" + txtBoxUserName.Text + "'";
             SqlCommand passCom = new SqlCommand(checkPwd, conn);
             String password = passCom.ExecuteScalar().ToString().Replace(" ","");//Passs the password from the query into a string

             if (password == txtBoxPassword.Text)
             {
                 Response.Write("Password is correct");
                 
                 
                 //ServerSide move to another WebPage   ***********************************
                 Server.Transfer("~/Default.aspx");
             }
             else
                 Response.Write("Password is not correct");
        }
        else
            Response.Write("UserName is not correct");

        conn.Close();

    }
}