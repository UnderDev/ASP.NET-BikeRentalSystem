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
        txtBoxBarcode.Focus();
    }

    //ADD LABLES FOR ERROR HANDLING AND MAKE FANCY ///// ALSO CHANGE TO ALLOW THE USER TO ENTER A BIKE NUMBER OR BARCODE
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        _conn.Close();
        _conn.Open();

        string barcode = txtBoxBarcode.Text;

        //Update the BcInUse column with the selected value in the dropdownlist based on either the bike number entered or the full barcode
        String sqlUpdate = "UPDATE BikeRentalTbl SET BcInUse = '" + ddlBikeInUse.SelectedValue + "' WHERE (BarCode = '" + barcode + "') OR (SUBSTRING(BarCode, 2, 2) = '" + txtBoxBarcode.Text + "')";
        _com = new SqlCommand(sqlUpdate, _conn);
        int checkUpdated = _com.ExecuteNonQuery();

        //Check that the database was updated, if the command returns 1, a row has been updated, otherwise the string entered was not found in the database 
        if (checkUpdated == 1){
            lblErrorMessage.Text = "Bike " + barcode + " Found! <br/> Successfully Updated the \"Bike In Use\" value to " + ddlBikeInUse.SelectedItem;
        }
        else{
            lblErrorMessage.Text = "Bike Not Found, Try Again";
        }
        //reset the textbox
        txtBoxBarcode.Text = "";

       _conn.Close();
    }
    protected void txtBoxBarcode_TextChanged(object sender, EventArgs e)
    {
        txtBoxBarcode.Text = "";
    }
}