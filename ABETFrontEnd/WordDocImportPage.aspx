<%@ Page Title="" Language="C#" MasterPageFile="~/RefinedMaster.Master" AutoEventWireup="true" CodeBehind="WordDocImportPage.aspx.cs" Inherits="ABETFrontEnd.WordDocImportPage" %>

    <asp:Content ID="subTitleContent" ContentPlaceHolderID="subTitlePlaceHolder" runat="server">
        <asp:Label ID="docImportSubTitle" runat="server" Text="Word Format Syllabus Import" Font-Size="XX-Large" Font-Underline="True"></asp:Label>
    </asp:Content>

    <asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">
        <div>
            <asp:Label ID="WordUploadIdentifier" runat="server" Text="Select Syllabus for Import"></asp:Label>
            <asp:FileUpload ID="DocumentUpload" runat="server" style="position: relative; top: 1px; left: 8px" Width="414px" />
        </div>
        <div>
            <asp:Label ID="ImportLabel" runat="server" Text="Click to Import" Font-Size="Large" />
            <asp:Button ID="ImportButton" runat="server" Text="Import" OnClick="ImportButton_Click" />
            <div id="DataImportReview" runat="server" visible="false" style="background-color: #000099; background-attachment: inherit; font-style: normal; font-weight: 500; font-size: large; font-family: 'Baskerville Old Face'; font-variant: normal; text-transform: none; color: #FFFFFF; border: thin ridge #00FFFF">
                <asp:Label ID="DataImportLabel" runat="server" BackColor="#3333FF" BorderColor="#66FFFF" BorderStyle="Solid" BorderWidth="2px" Font-Names="Baskerville Old Face" Font-Size="XX-Large" Font-Underline="True" ForeColor="Black" Text="Data Import Review"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" BackColor="#FF33CC" BorderColor="Aqua" BorderStyle="Inset" BorderWidth="2px" ForeColor="Yellow" OnClick="CancelImport" style="margin-top: 0px; margin-bottom: 1px" Text="Cancel Import" />
                <br />
                <br />
&nbsp;Please verify the imported data below.<br />
&nbsp;You may make changes to any items before submitting to the database.<br />
                <br />
&nbsp;Course Title:
                <asp:TextBox ID="CourseTitleInput" runat="server" Width="377px"></asp:TextBox>
                <asp:ImageButton ID="AcceptCourseTitle" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCourseTitle" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px"  />
                <br />
&nbsp;Course Number:
                <asp:TextBox ID="CourseNumberInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="350px" TextMode="Number"></asp:TextBox>
                <asp:ImageButton ID="AcceptCourseNumber" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCourseNumber" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Course Lecture Hours:
                <asp:TextBox ID="CourseLectureHoursInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="306px" TextMode="Number"></asp:TextBox>
                <asp:ImageButton ID="AcceptCourseLectureHours" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCourseLectureHours" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Course Lab Hours:
                <asp:TextBox ID="CourseLabHoursInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="332px" TextMode="Number"></asp:TextBox>
                <asp:ImageButton ID="AcceptCourseLabHours" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCourseLabHours" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Course Credits:<asp:TextBox ID="TextBox5" runat="server" OnTextChanged="TextBox2_TextChanged" Width="366px" TextMode="Number"></asp:TextBox>
                <asp:ImageButton ID="AcceptCourseCredits0" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCourseLabHours" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
                <br />
            </div>
        </div>
        
    </asp:Content>
