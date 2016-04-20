<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        <asp:Menu ID="QueryMenu" runat="server" Orientation="Horizontal" CssClass="Menu" 
            onmenuitemclick="Menu1_MenuItemClick" RenderingMode="Table" 
            StaticEnableDefaultPopOutImage="False" >
            <DynamicHoverStyle CssClass="MenuBoxHover" />
            <DynamicMenuItemStyle CssClass="MenuBoxDesign" />
            <DynamicMenuStyle CssClass="MenuBoxSubBack" />
            <Items>
                <asp:MenuItem Selected="True" Text="Show DataBase" Value="1">
                </asp:MenuItem>
                <asp:MenuItem Text="Bike Info" Value="Bike Info" Selectable="False">
                        <asp:MenuItem Text="Currently Available" Value="2">
                        <asp:MenuItem Text="Satori" Value="2.1"></asp:MenuItem>
                        <asp:MenuItem Text="Precept 200" Value="2.2"></asp:MenuItem>
                        <asp:MenuItem Text="Kids" Value="2.3"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Currently Rented" Value="3">
                        <asp:MenuItem Text="Satori" Value="3.1"></asp:MenuItem>
                        <asp:MenuItem Text="Precept 200" Value="3.2"></asp:MenuItem>
                        <asp:MenuItem Text="Kids" Value="3.3"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Most Popular" Value="4">
                        <asp:MenuItem Text="Satori" Value="4.1"></asp:MenuItem>
                        <asp:MenuItem Text="Precept 200" Value="4.2"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Out Of Action" Value="5"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Accounting" Value="Accounting" Selectable="False">
                    <asp:MenuItem Text="Income" Value="6"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
            <StaticHoverStyle CssClass="MenuBoxHover" />
            <StaticMenuItemStyle CssClass="MenuBoxDesign" />
        </asp:Menu>
    <br />

    <div class="GridBackGround">
    <asp:SqlDataSource ID="SqlDataSourceRental" runat="server" ConnectionString="<%$ ConnectionStrings:BPIConnectionString %>"
        SelectCommand="SELECT [BarCode], [TimesRented], [TimeInOut], [Total], [Date] FROM [BikeRentalTbl]">
    </asp:SqlDataSource>

    <div class="GridLbl">
        <asp:Label ID="lblUsrSelected" runat="server"></asp:Label>
    </div>
    
        <asp:GridView ID="gvBikeGrid" runat="server" 
            onpageindexchanging="gvBikeGrid_PageIndexChanging" CssClass="GridViewCss" >
            <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                PreviousPageText="Previous" />
            <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
   </div>
</asp:Content>
