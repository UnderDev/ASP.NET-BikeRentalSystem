using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{

    private SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BPIConnectionString"].ConnectionString);
    private DataSet ds = new DataSet();
    private SqlDataAdapter da;
    private String querey = "";

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        BuildGridSettings();

        Menu itemClicked = (Menu)sender;
        string path = Convert.ToString(itemClicked.SelectedItem.ValuePath);

        //itemClicked.SelectedItem.Value is the Value of the menu item clicked, which  set up as 1-7
        string value = itemClicked.SelectedItem.Value;

        querey = GetMenuItemClicked(value);

        DisplayMenuClikedMessage(value);


        //select statment baseed on the menu click 
        da = new SqlDataAdapter(querey, _conn);

        da.Fill(ds);//Fill the DataSet from the DataAdapter

        //Cache the DataSet for use later on in Pagging/Sorting
        Cache["Data"] = ds;

        gvBikeGrid.DataSource = ds;
        gvBikeGrid.DataBind();
    }

    /* Switches on a String(menu.SelectedItem.Value) and returns a message based on what the user
     * clicked on the menu from the homepage
    */
    private string DisplayMenuClikedMessage(string value)
    {
        switch (value)
        {
            case "1": return lblUsrSelected.Text = "Full DataBase";

            case "2": return lblUsrSelected.Text = "Currently Available Bikes To Rent";
            case "2.1": return lblUsrSelected.Text = "Currently Available Satori Bikes To Rent";
            //case "2.2": return lblUsrSelected.Text = "Currently Available Process Bikes To Rent";
            case "2.2": return lblUsrSelected.Text = "Currently Available DownHill Bikes To Rent";
            case "2.3": return lblUsrSelected.Text = "Currently Available Kids Bikes To Rent";

            case "3": return lblUsrSelected.Text = "Currently Rented Bikes";
            case "3.1": return lblUsrSelected.Text = "Currently Rented Satori Bikes";
            //case "3.2": return lblUsrSelected.Text = "Currently Rented Process Bikes";
            case "3.2": return lblUsrSelected.Text = "Currently Rented DownHill Bikes";
            case "3.3": return lblUsrSelected.Text = "Currently Rented Kids Bikes";

            case "4": return lblUsrSelected.Text = "Most Popular Bikes Rented";
            case "4.1": return "spGetMostPopularSatori";
            //case "4.2": return "spGetMostPopularProcess";
            case "4.2": return "spGetMostPopularDh";
            //case "4.3": return "";//spGetMostPopularKids

            case "5": return "spGetOutOfAction";//Out of Action

            case "6": return lblUsrSelected.Text = "Income Per Bike Model and Total from Rentals";
            default: return "Default";
        }
    }


    /* Switches on a String(menu.SelectedItem.Value) and returns the StoredProcedure
     * associated with that Value.
     * Each case (1, 2, 2.1)etc represents the value of the Menu item that was selected
     */
    private String GetMenuItemClicked(string value)
    {
        switch (value)
        {
            case "1": return "spGetBikeRental";

            case "2": return "spGetCurrAvail";
            case "2.1": return "spGetCurrAvailSatori";
            //case "2.2": return "";//spGetCurrAvailProcess
            case "2.2": return "spGetCurrAvailDh";
            case "2.3": return "spGetCurrAvailKids";

            case "3": return "spGetCurrRented";
            case "3.1": return "spGetCurrRentedSatori";
            //case "3.2": return "";//spGetCurrRentedProcess
            case "3.2": return "spGetCurrRentedDh";
            case "3.3": return "spGetCurrRentedKids";

            case "4": return "spGetMostPopular";
            case "4.1": return "spGetMostPopularSatori";
            //case "4.2": return "spGetMostPopularProcess";
            case "4.2": return "spGetMostPopularDh";
            //case "4.3": return "spGetMostPopularKids";

            case "5": return "spGetOutOfAction";//Out of Action

            case "6": return "spGetIncome";
            case "7": return "";

            default: return "spGetBikeRental";
        }
    }


    /*Sets up the Grid on the homepage at runtime with the following settings in the method
     */
    private void BuildGridSettings()
    {
        gvBikeGrid.PageSize = 10;
        gvBikeGrid.AllowPaging = true;
        gvBikeGrid.PageIndex = 0;
        gvBikeGrid.AllowSorting = false;

        //Setting up the CSS  for the Grid
        gvBikeGrid.PagerStyle.CssClass = "GridPagerStyle";
        gvBikeGrid.RowStyle.CssClass = "GridRowStyle";
        gvBikeGrid.AlternatingRowStyle.CssClass = "GridAltRowStyle";
        gvBikeGrid.HeaderStyle.CssClass = "GridHeaderStyle";
        gvBikeGrid.PagerSettings.Mode = PagerButtons.NextPreviousFirstLast;   
    }


    /* Gets the selected index(page Num) and sets the grids pageIndex to that.
     * Then sets the Grids Datasource to the Cached DataSet created when the user click on the menu
     * And Binds the data to the grid. updating its view
     */
    protected void gvBikeGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBikeGrid.PageIndex = e.NewPageIndex;
        gvBikeGrid.DataSource = (DataSet)Cache["Data"];
        gvBikeGrid.DataBind();
    }

}