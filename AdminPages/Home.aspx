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
                        <asp:MenuItem Text="Process" Value="2.2"></asp:MenuItem>
                        <asp:MenuItem Text="Precept 200" Value="2.3"></asp:MenuItem>
                        <asp:MenuItem Text="Kids" Value="2.4"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Currently Rented" Value="3">
                        <asp:MenuItem Text="Satori" Value="3.1"></asp:MenuItem>
                        <asp:MenuItem Text="Process" Value="3.2"></asp:MenuItem>
                        <asp:MenuItem Text="Precept 200" Value="3.3"></asp:MenuItem>
                        <asp:MenuItem Text="Kids" Value="3.4"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Most Popular" Value="4">
                        <asp:MenuItem Text="Satori" Value="4.1"></asp:MenuItem>
                        <asp:MenuItem Text="Process" Value="4.2"></asp:MenuItem>
                        <asp:MenuItem Text="Precept 200" Value="4.3"></asp:MenuItem>
                        <asp:MenuItem Text="Kids" Value="4.4"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Out Of Action" Value="5"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Accounting" Value="Accounting" Selectable="False">
                    <asp:MenuItem Text="Income" Value="6"></asp:MenuItem>
                    <asp:MenuItem Text="Most Popular Rental" Value="7"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
            <StaticHoverStyle CssClass="MenuBoxHover" />
            <StaticMenuItemStyle CssClass="MenuBoxDesign" />
        </asp:Menu>
   

<%--        <asp:Menu ID="QueryMenu0" runat="server" Orientation="Horizontal" CssClass="Menu" 
            onmenuitemclick="Menu1_MenuItemClick" RenderingMode="Table" 
            StaticEnableDefaultPopOutImage="False" >
            <DynamicHoverStyle CssClass="MenuBoxHover" />
            <DynamicMenuItemStyle CssClass="MenuBoxDesign" />
            <DynamicMenuStyle CssClass="MenuBoxSubBack" />
            <Items>
                <asp:MenuItem Selected="True" Text="Show DataBase" Value="Show DataBase">
                </asp:MenuItem>
                <asp:MenuItem Text="Bike Info" Value="Bike Info" Selectable="False">
                    <asp:MenuItem Text="Currently Available" Value="Currently Available">
                        <asp:MenuItem Text="Satori" Value="Satori"></asp:MenuItem>
                        <asp:MenuItem Text="Process" Value="Process"></asp:MenuItem>
                        <asp:MenuItem Text="Precept 200" Value="Precept 200"></asp:MenuItem>
                        <asp:MenuItem Text="Kids" Value="Kids"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Currently Rented" Value="Currently Rented">
                        <asp:MenuItem Text="Satori" Value="Satori"></asp:MenuItem>
                        <asp:MenuItem Text="Process" Value="Process"></asp:MenuItem>
                        <asp:MenuItem Text="Precept 200" Value="Precept 200"></asp:MenuItem>
                        <asp:MenuItem Text="Kids" Value="Kids"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Most Popular" Value="Most Popular">
                        <asp:MenuItem Text="Satori" Value="Satori"></asp:MenuItem>
                        <asp:MenuItem Text="Process" Value="Process"></asp:MenuItem>
                        <asp:MenuItem Text="Precept 200" Value="Precept 200"></asp:MenuItem>
                        <asp:MenuItem Text="Kids" Value="Kids"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Out Of Action" Value="Out Of Action"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Accounting" Value="Accounting" Selectable="False">
                    <asp:MenuItem Text="Income" Value="Total Income"></asp:MenuItem>
                    <asp:MenuItem Text="Most Popular Rental" Value="New Item"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
            <StaticHoverStyle CssClass="MenuBoxHover" />
            <StaticMenuItemStyle CssClass="MenuBoxDesign" />
        </asp:Menu>--%>
   

    <br />


    <asp:SqlDataSource ID="SqlDataSourceRental" runat="server" ConnectionString="<%$ ConnectionStrings:BPIConnectionString %>"
        SelectCommand="SELECT [BarCode], [TimesRented], [TimeInOut], [Total], [Date] FROM [BikeRentalTbl]">
    </asp:SqlDataSource>
    <asp:Label ID="lblUsrSelected" runat="server" CssClass="GridLbl"></asp:Label>
    <div>
        <asp:GridView ID="GridView2" runat="server" 
            onpageindexchanging="GridView2_PageIndexChanging" CssClass="GridViewCss">
        </asp:GridView>
   </div>
</asp:Content>
