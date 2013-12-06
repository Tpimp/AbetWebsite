<%@ Page Title="" Language="C#" MasterPageFile="~/RefinedMaster.Master" AutoEventWireup="true" CodeBehind="DatabaseGridviewPage.aspx.cs" Inherits="ABETFrontEnd.DatabaseGridviewPage" %>

<asp:Content ID="subTitleContent" ContentPlaceHolderID="subTitlePlaceHolder" runat="server">
    <asp:Label ID="tablePageLabel" runat="server" Text="Database Table Views" Font-Size="XX-Large" Font-Underline="True"></asp:Label>
</asp:Content>
<asp:Content ID="tableContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <asp:DropDownList ID="TableNameDropDown" runat="server" AutoPostBack="True" DataSourceID="DBTableNames" DataTextField="TABLE_NAME" DataValueField="TABLE_NAME" OnSelectedIndexChanged="TableNameDropDown_SelectedIndexChanged" OnDataBound="TableNameDropDown_DataBound" ToolTip="Select a Table Name to view that table">
    </asp:DropDownList>
    <asp:SqlDataSource ID="DBTableNames" runat="server" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES ORDER BY TABLE_NAME"></asp:SqlDataSource>
    <asp:GridView ID="TableDataGrid" runat="server" AllowPaging="True" AllowSorting="True" Caption="Table Data" CellPadding="4" EmptyDataText="No Data" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" ViewStateMode="Enabled">
        <AlternatingRowStyle BackColor="White" />
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
&nbsp;
</asp:Content>
