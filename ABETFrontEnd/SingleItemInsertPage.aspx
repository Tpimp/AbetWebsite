<%@ Page Title="" Language="C#" MasterPageFile="~/RefinedMaster.Master" AutoEventWireup="true" CodeBehind="SingleItemInsertPage.aspx.cs" Inherits="ABETFrontEnd.WebForm1" %>

<asp:Content ID="labelContent" ContentPlaceHolderID="subTitlePlaceHolder" runat="server">
    <asp:Label ID="singleItemLabel" runat="server" Text="Single Item Inserts" Font-Size="XX-Large" Font-Underline="True"></asp:Label>
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    Put insert controls here
</asp:Content>
