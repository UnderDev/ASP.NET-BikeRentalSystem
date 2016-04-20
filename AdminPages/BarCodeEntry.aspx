<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="BarCodeEntry.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="BarCodeEntryBg">
   <p> Enter The Bikes Barcode Below</p>

    <asp:TextBox ID="txtBoxBcEntry" runat="server" OnTextChanged="txtBoxBcEntry_TextChanged"
        ViewStateMode="Enabled" Height="25px"></asp:TextBox>

 </div>
</asp:Content>
