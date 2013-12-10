<%@ Page Title="" Language="C#" MasterPageFile="~/RefinedMaster.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="ABETFrontEnd.ManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="subTitlePlaceHolder" runat="server">
    <asp:Label ID="editLabel" runat="server" Text="Manage Users" Font-Size="XX-Large" Font-Underline="True" style="color: #00FFFF"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <asp:GridView ID="UserGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlUserDataSource">
    <Columns>
        <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
        
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlUserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" SelectCommand="SELECT * FROM [users]" UpdateCommand="UPDATE users SET UserName = @newUsername, Password = @newPassword">
    <UpdateParameters>
        <asp:Parameter Name="newUsername" Type="String"/>
        <asp:Parameter Name="newPassword" Type="String"/>
    </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="userLabel" runat="server" Text="UserName"></asp:Label>
    <asp:TextBox ID="userTextbox" runat="server" style="margin-bottom: 0px"></asp:TextBox>
    <asp:Label ID="passwordLabel" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="passwordTextbox" runat="server" style="margin-bottom: 0px"></asp:TextBox>
    <asp:Button ID="addUserButton" runat="server" OnClick="AddButton_Click" Text="Add User" />
    <br />
    <br />
    <asp:Label ID="userLabel0" runat="server" Text="UserName"></asp:Label>
    <asp:TextBox ID="userTextbox0" runat="server" style="margin-bottom: 0px"></asp:TextBox>
    <asp:Button ID="removeUserButton" runat="server" OnClick="RemoveButton_Click" Text="Remove User" />
</asp:Content>
