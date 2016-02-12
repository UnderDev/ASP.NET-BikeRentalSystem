<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 356px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <h1>
        Bike Park Ireland Logo</h1>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Button ID="Button3" runat="server" Text="Button" />
            </td>
            <td rowspan="8">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="BarCode" DataSourceID="SqlDataSourceRental" 
                    EmptyDataText="There are no data records to display." ForeColor="#333333" 
                    Height="266px" Width="887px" HorizontalAlign="Center" 
                    style="text-align: center; font-size: medium">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="BarCode" HeaderText="BarCode" ReadOnly="True" 
                            SortExpression="BarCode" />
                        <asp:BoundField DataField="TimesRented" HeaderText="TimesRented" 
                            SortExpression="TimesRented" />
                        <asp:BoundField DataField="TimeInOut" HeaderText="TimeInOut" 
                            SortExpression="TimeInOut" />
                        <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button4" runat="server" Text="Button" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button5" runat="server" Text="Button" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button6" runat="server" Text="Button" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button7" runat="server" Text="Button" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button8" runat="server" Text="Button" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button9" runat="server" Text="Button" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="BtnBarCodeEntry" runat="server" Text="Enter BarCodes" 
                    onclick="BtnBarCodeEntry_Click" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSourceRental" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BPIConnectionString %>" 
        SelectCommand="SELECT * FROM [BikeRentalTbl] ORDER BY [BarCode]">
    </asp:SqlDataSource>
    </form>
</body>
</html>
