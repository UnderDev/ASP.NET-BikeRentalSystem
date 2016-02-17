<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="width: 826px">
        <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="BarCode" DataSourceID="SqlDataSourceRental" 
                    EmptyDataText="There are no data records to display." ForeColor="#333333" 
                    Height="266px" Width="812px" HorizontalAlign="Center" 
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
            <asp:SqlDataSource ID="SqlDataSourceRental" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BPIConnectionString %>" 
            SelectCommand="SELECT [BarCode], [TimesRented], [TimeInOut], [Total], [Date] FROM [BikeRentalTbl]">
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
    <p style="height: 58px">
    </p>
</asp:Content>

