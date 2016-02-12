using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnBarCodeEntry_Click(object sender, EventArgs e)
    {
        //ServerSide move to another WebPage
        Server.Transfer("BarCodeEntryPage.aspx", true);
    }
}