<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="LogIn.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Login ID="Login1" runat="server" Style="width: 100%;" VisibleWhenLoggedIn="False"
        DestinationPageUrl="~/AdminPages/Home.aspx">
        <LayoutTemplate>
            <div class="box">
                <div class="LogInContent">
                    <h1>
                        Authentication Required</h1>
                    <asp:TextBox class="TxtBoxInput" placeholder="UserName" ID="UserName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1"
                        ForeColor="#FEF200">*</asp:RequiredFieldValidator>
                    <br>
                    <asp:TextBox class="TxtBoxInput" placeholder="PassWord" ID="Password" runat="server"
                        TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1"
                        ForeColor="#FEF200">*</asp:RequiredFieldValidator>
                    <br>
                    <asp:Button class="btn" ID="LoginButton" runat="server" CommandName="Login" Text="Log In"
                        ValidationGroup="Login1"></asp:Button>
                    <br>
                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False" ></asp:Literal>
                    </div>
            </div>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>
