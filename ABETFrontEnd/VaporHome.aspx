<%@ Page Title="" Language="C#" MasterPageFile="~/RefinedMaster.Master" AutoEventWireup="true" CodeBehind="VaporHome.aspx.cs" Inherits="ABETFrontEnd.VaporHome" %>


<asp:Content ID="homeSubTitle" runat="server" ContentPlaceHolderID="subTitlePlaceHolder">
    <asp:Label ID="homeTitle" runat="server" Text="Home Page" Font-Size="XX-Large" Font-Underline="True"></asp:Label>
</asp:Content>

<asp:Content ID="placeFiller" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div>
        <div style="position: relative; height: 153px; width: 573px; top: 2px; left: 3px;">
            <asp:Image ID="purvineImage" ImageUrl="~/Purvine.jpg" runat="server" style="position: inherit; " Height="151px" Width="573px" />
        </div>
        <div id="welcomeMessage" style="position: inherit; width: inherit; height: 400px">
            Welcome to the CSET syllabus database web front-end. 
        </div>
    </div>
</asp:Content>