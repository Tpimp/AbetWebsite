<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="ABETFrontEnd.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CSET ABET Login</title>
</head>
<body style="border-style: ridge; border-color: #003366; background-color: #336699; height: 100%; width: 90%">
    <form id="form1" runat="server" style="position:inherit; height:inherit; width:inherit;">
    <div id="header" style="border-style: ridge; border-color: #003366; background-color: #336699; height: 10%; width: 95%">
        <asp:Image ID="csetTitle" runat="server" ImageUrl="~/CSETText.png" Height="10%" Width="32%" />
        <asp:Label ID="pageTitle" runat="server" style="position: inherit" Text="Site Login Page" Font-Underline="true" Font-Size="XX-Large"></asp:Label>
    </div>
        <div id="usernameDiv" runat="server" style="border-style: ridge; border-color: #003366; background-color: #336699; height: 50%; width: 95%">
            <asp:Label ID="usernameLabel" style="position: inherit;" runat="server" BorderStyle="Ridge" BorderColor="#003366" BorderWidth="3px" Text="UserName:" Font-Size="XX-Large" Width="160px" Height="39px"></asp:Label>
            <asp:TextBox ID="usernameInput" runat="server" style="position: inherit; top: 87px; left: 18px; " Height="30px" Width="298px"></asp:TextBox>
        </div>
        <div id="passwordDiv" runat="server" style="border-style: ridge; border-color: #003366; background-color: #336699; height: 50%; width: 95%">
            <asp:Label ID="passwordLabel" style="position: inherit;" runat="server" BorderStyle="Ridge" BorderColor="#003366" BorderWidth="3px" Text="Password:" Font-Size="XX-Large" Width="160px" Height="42px"></asp:Label>
            <asp:TextBox ID="passwordInput" runat="server" style="position: inherit; top: 87px; left: 18px; " Height="30px" Width="298px" TextMode="Password"></asp:TextBox>
            <asp:Button ID="loginButton" runat="server" style="position: inherit; top: 160px; left: 499px; padding-left: 12px;" Text="Submit Login" Width="132px" BackColor="#3399FF" BorderColor="#003366" BorderStyle="Ridge" BorderWidth="2px" OnClick="loginButton_Click" Height="35px" />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
    </form>
</body>
</html>
