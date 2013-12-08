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
            <asp:Button ID="importButton" runat="server" style="position: inherit;" Text="Import" Width="132px" BackColor="#3399FF" BorderColor="#003366" BorderStyle="Ridge" BorderWidth="2px" OnClick="ImportButton_Click" Height="35px" />
            <div>
            <asp:TextBox ID="docOutput" runat="server" Height="600px" Width="500px" TextMode="MultiLine"></asp:TextBox>
        </div>
            <div id="DataImportReview" runat="server" visible="false" style="background-color: #336699; background-attachment: inherit; font-style: normal; font-weight: 500; font-size: large; font-family: 'Baskerville Old Face'; font-variant: normal; text-transform: none; color: #FFFFFF; border: thin ridge #00FFFF">
                <asp:Label ID="DataImportLabel" runat="server" BackColor="#336699" BorderColor="#003366" BorderStyle="Solid" BorderWidth="2px" Font-Names="Baskerville Old Face" Font-Size="XX-Large" Font-Underline="True" ForeColor="white" Text="Data Import Review"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="cancelImportButton" runat="server" style="position: inherit;" Text="Cancel Import" Width="132px" BackColor="#3399FF" BorderColor="#003366" BorderStyle="Ridge" BorderWidth="2px" OnClick="CancelImport" Height="35px" />
                <br />
                <br />
&nbsp;Please verify the imported data below.<br />
&nbsp;You may make changes to any items before submitting to the database.<br />
                <br />
&nbsp;Department Name:
                <asp:TextBox ID="fullDepartmentInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="330px"></asp:TextBox>
                <asp:ImageButton ID="AcceptDepartmentName" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyDepartmentName" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Department Abbreviation:
                <asp:TextBox ID="DeptAbbrInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="284px"></asp:TextBox>
                <asp:ImageButton ID="AcceptDeptAbbr" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyDepartmentAbbreviation" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Course Number:
                <asp:TextBox ID="CourseNumberInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="350px" TextMode="Number"></asp:TextBox>
                <asp:ImageButton ID="AcceptCourseNumber" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCourseNumber" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Course Title:
                <asp:TextBox ID="CourseTitleInput" runat="server" Width="377px"></asp:TextBox>
                <asp:ImageButton ID="AcceptCourseTitle" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCourseTitle" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px"  />
                <br />
&nbsp;Course Lecture Hours:
                <asp:TextBox ID="CourseLectureHoursInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="306px" TextMode="Number"></asp:TextBox>
                <asp:ImageButton ID="AcceptCourseLectureHours" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCourseLectureHours" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Course Lab Hours:
                <asp:TextBox ID="CourseLabHoursInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="332px" TextMode="Number"></asp:TextBox>
                <asp:ImageButton ID="AcceptCourseLabHours" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCourseLabHours" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Course Credits:
                <asp:TextBox ID="CourseCreditHoursInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="360px" TextMode="Number"></asp:TextBox>
                <asp:ImageButton ID="AcceptCourseCredits" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCourseCredits" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Instructor First Name:
                <asp:TextBox ID="InstructorFirstInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="312px" TextMode="SingleLine"></asp:TextBox>
                <asp:ImageButton ID="AcceptInstructorFirst" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyInstructorFirst" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Instructor Last Name:
                <asp:TextBox ID="InstructorLastInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="313px" TextMode="SingleLine"></asp:TextBox>
                <asp:ImageButton ID="AcceptInstructorLast" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyInstructorLast" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Course Coordinator First Name:
                <asp:TextBox ID="CourseCoordinatorFirstInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="239px" TextMode="SingleLine"></asp:TextBox>
                <asp:ImageButton ID="AcceptCoordinatorFirst" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCoordinatorFirst" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Course Coordinator Last Name:
                <asp:TextBox ID="CourseCoordinatorLastInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="239px" TextMode="SingleLine"></asp:TextBox>
                <asp:ImageButton ID="AcceptCoordinatorLast" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyCoordinatorLast" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Author Last Name:
                <asp:TextBox ID="AuthorLastInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="332px" TextMode="MultiLine" Height="40px"></asp:TextBox>
                <asp:ImageButton ID="AcceptAuthorLast" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyAuthorLast" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Author Last Name:
                <asp:TextBox ID="AuthorFirstInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="331px" TextMode="MultiLine" Height="40px"></asp:TextBox>
                <asp:ImageButton ID="AcceptAuthorFirst" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyAuthorFirst" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Textbook Title:
                <asp:TextBox ID="TextbookTitleInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="355px" TextMode="SingleLine"></asp:TextBox>
                <asp:ImageButton ID="AcceptTextbookTitle" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyTextbookTitle" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Publisher:
                <asp:TextBox ID="PublisherInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="396px" TextMode="SingleLine"></asp:TextBox>
                <asp:ImageButton ID="AcceptPublisher" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyPublisher" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Publish Date:
                <asp:TextBox ID="PublishDateInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="370px" TextMode="SingleLine"></asp:TextBox>
                <asp:ImageButton ID="AcceptPublishDate" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyPublishDate" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
&nbsp;Textbook ISBN:
                <asp:TextBox ID="ISBNInput" runat="server" OnTextChanged="TextBox2_TextChanged" Width="346px" TextMode="SingleLine"></asp:TextBox>
                <asp:ImageButton ID="AcceptISBN" runat="server" BackColor="Black" BorderColor="Yellow" onClick="VerifyTextbookISBN" BorderStyle="Outset" BorderWidth="2px" Height="25px" ImageAlign="Top" ImageUrl="~/thumbsup.png" ValidateRequestMode="Disabled" Width="25px" />
                <br />
                <br />
            </div>
        </div>
        
    </asp:Content>
