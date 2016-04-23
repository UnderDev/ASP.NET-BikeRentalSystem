<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Administration.aspx.cs" Inherits="AdminPages_Administration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <br />
        Enter The Bike Number or Barcode of the bike you want to Edit
        <table align="center" width="400" >
            <tr>
                <td style="width: 100px">
                    <asp:TextBox ID="txtBoxBarcode" runat="server"></asp:TextBox>
                </td>
                <td style="width: 50px">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                        <asp:ListItem Value="N">No</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 50px">
                    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
                </td>
            </tr>
        </table>
        <br />
    </div>
</asp:Content>
