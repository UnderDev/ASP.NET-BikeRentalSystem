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
    private String querey="";

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

        querey= GetMenuItemClicked(value);

        //select statment baseed on the menu click 
        da = new SqlDataAdapter(querey, _conn);
    
        da.Fill(ds);//Fill the DataSet from the DataAdapter

        //Cache the DataSet for use later on in Pagging/Sorting
        Cache["Data"] = ds;

        GridView2.DataSource = ds;

        //BoundField Col1 = new BoundField();
        //Col1.HeaderText = "Date";
        //Col1.DataField = "Date";
        //Col1.DataFormatString = "{0:D}";
        //BoundField Col2 = new BoundField();
        //Col2.DataField = "Total";
        //Col2.DataFormatString = "{0:c}";
        //GridView2.Columns.Add(Col1);
        ////grdTest.Columns.Add(Col2);
        //GridView2.Columns.Add(Col2);
        GridView2.DataBind();      
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
            case "2.1": return "";
            case "2.2": return "";
            case "2.3": return "";
            case "2.4": return "";

            case "3": return "spGetCurrRented";
            case "3.1": return "";
            case "3.2": return "";
            case "3.3": return "";
            case "3.4": return "";

            case "4": return "spGetMostPopular";
            case "4.1": return "";
            case "4.2": return "";
            case "4.3": return "";
            case "4.4": return "";

            case "5": return "";

            case "6": return "spGetIncome";
            case "7": return "";

            default: return "default";
        }
    }



    private void BuildGridSettings()
    {
        GridView2.PageSize = 10;
        GridView2.AllowPaging = true;
        GridView2.PageIndex = 0;
        GridView2.AllowSorting = true;
    }



    /* Gets the selected index(page Num) and sets the grids pageIndex to that.
     * Then sets the Grids Datasource to the Cached DataSet created when the user click on the menu
     * And Binds the data to the grid. updating its view
     */
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        GridView2.DataSource = (DataSet)Cache["Data"];
        GridView2.DataBind();
    }

}