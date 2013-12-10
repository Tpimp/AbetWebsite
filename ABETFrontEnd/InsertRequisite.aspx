<%@ Page Title="" Language="C#" MasterPageFile="~/RefinedMaster.Master" AutoEventWireup="true" CodeBehind="InsertRequisite.aspx.cs" Inherits="ABETFrontEnd.InsertRequisite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="subTitlePlaceHolder" runat="server">
    <p style="color: #FFFF00; font-size: large">
        Insert A Requisite</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <span style="color: #FFFFFF">
                <asp:Label ID="DataImportLabel" runat="server" BackColor="#336699" BorderColor="#003366" BorderStyle="Solid" BorderWidth="2px" Font-Names="Baskerville Old Face" Font-Size="XX-Large" Font-Underline="True" ForeColor="White" Text="Insert A New Requisite" style="color: #FFFF00"></asp:Label>
    </span>
    <span style="color: #FFFF00">&nbsp;&nbsp;<br />
    <br />
    A Course Requisite can be used as a Pre-Requisite or a Co-Requisite. A Requisite consists of three data elements:<br />
    <br />
&nbsp;&nbsp;&nbsp; RequisteType,<br />
&nbsp;&nbsp;&nbsp; CourseLink,<br />
&nbsp;&nbsp;&nbsp; RequisiteComment<br />
    <br />
&nbsp;&nbsp;&nbsp; For example a Requisite may look like:<br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ReqType]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [CourseLink]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ReqComment]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CST&nbsp; 116 Beginning Programming I,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;with grade &quot;C&quot; or better&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Must Be of Junior Standing,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;or instructor permission&quot;<br />
    <br />
    Choose Existing Requisite Type or Enter One Manually</span><br style="color: #FFFF00" />
    <asp:DropDownList ID="ReqType" runat="server" AutoPostBack="True" DataSourceID="RequisiteTypes" DataTextField="RequirementType" DataValueField="RequirementType" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="color: #000000">
    </asp:DropDownList>
    <asp:TextBox ID="ReqTypeTextBox" runat="server" Width="239px" style="color: #000000"></asp:TextBox>
&nbsp;<span style="color: #FFFF00">Manual Input Type (MUST BE BLANK TO USE DROP DOWN)<br />
    Choose a Course To Link to </span>
    <asp:DropDownList ID="CourseInput" runat="server" AutoPostBack="True" DataSourceID="CourseSelection" DataTextField="Course" DataValueField="Course" style="color: #000000">
        <asp:ListItem>No Class Link</asp:ListItem>
    </asp:DropDownList>
    <asp:CheckBox ID="SelectCourseLink" runat="server" ForeColor="White" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Use Course Link" style="color: #FFFF00" />
    <br style="color: #FFFF00" />
    <br style="color: #FFFF00" />
    <br style="color: #FFFF00" />
    <span style="color: #FFFF00">Choose Existing Comment Type or Enter One Manually</span><br style="color: #FFFF00" />
    <asp:DropDownList ID="ReqCommentBox" runat="server" DataSourceID="ReqComments" DataTextField="Comment" DataValueField="Comment" AutoPostBack="True" style="color: #000000">
    </asp:DropDownList>
    <asp:TextBox ID="ReqCommentInput" runat="server" Height="54px" TextMode="MultiLine" Width="260px" style="color: #000000"></asp:TextBox>
    <span style="color: #FFFF00">Manual Input Comment (MUST BE BLANK TO USE DROP DOWN)</span><br />
    <asp:Button ID="SubmitRequisite" runat="server" OnClick="InsertNewRequisite" Text="Submit Requisite" />
    <br />
    <asp:SqlDataSource ID="RequisiteTypes" runat="server" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" OnSelecting="RequisiteTypes_Selecting" SelectCommand="SELECT [RequirementType], [CourseLink] FROM [ReqType]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ReqComments" runat="server" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" SelectCommand="SELECT [Comment] FROM [ReqComment]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="CourseSelection" runat="server" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" SelectCommand="SELECT Department.DepartmentAbbr + ' ' + CONVERT (VARCHAR(16), Course.Number) + ' ' + Course.Title AS Course, Course.CourseID FROM Course INNER JOIN Department ON Course.DepartmentID = Department.DepartmentID"></asp:SqlDataSource>
</asp:Content>
