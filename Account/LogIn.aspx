<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="LogIn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User LogIn</title>
   
    <link href="../Styles/StyleSheet.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form2" runat="server">
    <p>
        <asp:SqlDataSource ID="SqlDataSourceLogIn" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BPIConnectionString %>" 
            SelectCommand="SELECT * FROM [UserDataTbl]"></asp:SqlDataSource>
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
            </div>
        </table>

    </form>
</body>
</html>
