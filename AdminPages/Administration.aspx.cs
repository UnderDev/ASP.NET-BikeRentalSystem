using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


public partial class AdminPages_Administration : System.Web.UI.Page
{

    private static SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BPIConnectionString"].ConnectionString);
    private static SqlCommand _com;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    //ADD LABLES FOR ERROR HANDLING AND MAKE FANCY ///// ALSO CHANGE TO ALLOW THE USER TO ENTER A BIKE NUMBER OR BARCODE
    protected void Button1_Click(object sender, EventArgs e)
    {
        String barcode = txtBoxBarcode.Text;

        _conn.Close();
        _conn.Open();

        try
        {
            String curDate = "UPDATE BikeRentalTbl SET BcInUse= '" + DropDownList1.SelectedValue + "' where BarCode ='" + barcode + "'";

            _com = new SqlCommand(curDate, _conn);
            _com.ExecuteScalar();
        }
        catch (Exception)
        {
            //lblUserMessage.Text = "The Barcode You Entered Could Not Be Found!";
        }
        _conn.Close();

    }
}