<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">



.Header1
{
    font-size:x-large;
    text-align: center;
}

.TblStyl1
{
     border-style:solid; 
     border:5;
}


.btnLogIn
{
    width:175px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
    <p>
    </p>
    <div class="Header1">
        User Login
        <p>Please enter your username and password.</p>
    </div>

  
        <table class="TblStyl1" align="center" cellpadding="5" cellspacing="5">
           <div class ="BoarderMargin">
            <tr>
                <td>
                    UserName</td>
                <td>
                    <asp:TextBox ID="txtBoxUserName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Password</td>
                <td>
                    <asp:TextBox ID="txtBoxPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="LoginButton" class="btnLogIn" runat="server" onclick="LoginButton_Click" 
                        Text="Login"/>
                </td>
            </tr>
            </table>

    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

