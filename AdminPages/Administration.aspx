<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Administration.aspx.cs" Inherits="AdminPages_Administration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="AdminToolsBg">
        <br />
        <h3>Update The "Bike in Use" Field by the Bike Number or Barcode</h3>
        <table align="center" class="style1" >
            <tr>
                <td style="width: 100px">
                    <asp:TextBox ID="txtBoxBarcode" runat="server" placeholder="E.g. 23"></asp:TextBox>
                </td>
                <td style="width: 100px">
                    <asp:DropDownList ID="ddlBikeInUse" runat="server">
                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                        <asp:ListItem Value="N">No</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 100px">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                        onclick="btnUpdate_Click" Width="100px" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblErrorMessage" runat="server" ></asp:Label>
        <br />
    </div>
</asp:Content>
