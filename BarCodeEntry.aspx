<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BarCodeEntry.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="text-align: center">
    <br />
    Enter The Bikes Barcode Below</p>
<p style="text-align: center">
    
        <asp:TextBox ID="txtBoxBcEntry" runat="server" 
            ontextchanged="txtBoxBcEntry_TextChanged" ViewStateMode="Enabled" 
        Height="25px"></asp:TextBox>
    </p>
<p>
</p>
<p>
</p>
<p>
</p>
</asp:Content>

