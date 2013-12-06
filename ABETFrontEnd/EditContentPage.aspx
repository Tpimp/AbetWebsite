<%@ Page Title="" Language="C#" MasterPageFile="~/RefinedMaster.Master" AutoEventWireup="true" CodeBehind="EditContentPage.aspx.cs" Inherits="ABETFrontEnd.EditContentPage" %>

<asp:Content ID="subTitleContent" ContentPlaceHolderID="subTitlePlaceHolder" runat="server">
    <asp:Label ID="editLabel" runat="server" Text="Edit Items" Font-Size="XX-Large" Font-Underline="True" style="color: #00FFFF"></asp:Label>
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <span style="color: #FFFF00; font-size: xx-large"><strong>
<asp:Label ID="Label1" runat="server" Height="40px" Text="On This page you can edit existing information in the database." Width="900px"></asp:Label>
<br />
<br />
</span><span style="font-size: xx-large; color: #00FF00">Author</span><span style="font-size: xx-large"><span style="font-size: xx-large; color: #00FF00"> Table</span></span><span style="color: #FFFF00; font-size: xx-large"><span style="color: #00FFFF; font-size: xx-large">
<asp:ImageButton ID="Toggle1" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle1Clicked" />
<br />
</span>&nbsp;<span style="color: #00FFFF; font-size: xx-large"><asp:GridView ID="AuthorTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="AuthorID" datasourceid="SqlDataSource3" EmptyDataText="No Rows Exist" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" InsertVisible="False" ReadOnly="True" SortExpression="AuthorID" />
        <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
        <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Author] WHERE [AuthorID] = @original_AuthorID AND [FName] = @original_FName AND [LName] = @original_LName" InsertCommand="INSERT INTO [Author] ([FName], [LName]) VALUES (@FName, @LName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Author]" UpdateCommand="UPDATE [Author] SET [FName] = @FName, [LName] = @LName WHERE [AuthorID] = @original_AuthorID AND [FName] = @original_FName AND [LName] = @original_LName">
    <DeleteParameters>
        <asp:Parameter Name="original_AuthorID" Type="Int32" />
        <asp:Parameter Name="original_FName" Type="String" />
        <asp:Parameter Name="original_LName" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="FName" Type="String" />
        <asp:Parameter Name="LName" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="FName" Type="String" />
        <asp:Parameter Name="LName" Type="String" />
        <asp:Parameter Name="original_AuthorID" Type="Int32" />
        <asp:Parameter Name="original_FName" Type="String" />
        <asp:Parameter Name="original_LName" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</span></span></strong>
<br />
<strong><span style="color: #FFFF00; font-size: xx-large">
<br />
</span><span style="font-size: xx-large; color: #00FF00">B</span><span style="color: #FFFF00; font-size: xx-large"><span style="font-size: xx-large"><span style="font-size: xx-large; color: #00FF00">uilding Table</span></span><span style="color: #00FFFF; font-size: xx-large">
<asp:ImageButton ID="Toggle2" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle2Clicked" />
<br />
</span>&nbsp;<span style="color: #00FFFF; font-size: xx-large"><asp:GridView ID="BuildingTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BuildingID" datasourceid="SqlDataSource4" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="BuildingID" HeaderText="BuildingID" InsertVisible="False" ReadOnly="True" SortExpression="BuildingID" />
        <asp:BoundField DataField="BuildingName" HeaderText="BuildingName" SortExpression="BuildingName" />
        <asp:BoundField DataField="BuildingAbbr" HeaderText="BuildingAbbr" SortExpression="BuildingAbbr" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Building] WHERE [BuildingID] = @original_BuildingID AND [BuildingName] = @original_BuildingName AND [BuildingAbbr] = @original_BuildingAbbr" InsertCommand="INSERT INTO [Building] ([BuildingName], [BuildingAbbr]) VALUES (@BuildingName, @BuildingAbbr)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Building]" UpdateCommand="UPDATE [Building] SET [BuildingName] = @BuildingName, [BuildingAbbr] = @BuildingAbbr WHERE [BuildingID] = @original_BuildingID AND [BuildingName] = @original_BuildingName AND [BuildingAbbr] = @original_BuildingAbbr">
    <DeleteParameters>
        <asp:Parameter Name="original_BuildingID" Type="Int32" />
        <asp:Parameter Name="original_BuildingName" Type="String" />
        <asp:Parameter Name="original_BuildingAbbr" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="BuildingName" Type="String" />
        <asp:Parameter Name="BuildingAbbr" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="BuildingName" Type="String" />
        <asp:Parameter Name="BuildingAbbr" Type="String" />
        <asp:Parameter Name="original_BuildingID" Type="Int32" />
        <asp:Parameter Name="original_BuildingName" Type="String" />
        <asp:Parameter Name="original_BuildingAbbr" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</span></span></strong>
<br />
<br />
<span style="font-size: xx-large; color: #00FF00">Course Table</span><span style="color: #00FFFF; font-size: xx-large">
<asp:ImageButton ID="Toggle3" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle3Clicked" />
<br />
<asp:GridView ID="CourseTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CourseID" DataSourceID="SqlDataSource1" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="CourseID" HeaderText="CourseID" InsertVisible="False" ReadOnly="True" SortExpression="CourseID" />
        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
        <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
        <asp:BoundField DataField="Lecture Hours" HeaderText="Lecture Hours" SortExpression="Lecture Hours" />
        <asp:BoundField DataField="Lab Hours" HeaderText="Lab Hours" SortExpression="Lab Hours" />
        <asp:BoundField DataField="Credits" HeaderText="Credits" SortExpression="Credits" />
        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
        <asp:BoundField DataField="Goals" HeaderText="Goals" SortExpression="Goals" />
        <asp:BoundField DataField="Topics" HeaderText="Topics" SortExpression="Topics" />
        <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" SortExpression="DepartmentID" />
        <asp:BoundField DataField="CoordinatorID" HeaderText="CoordinatorID" SortExpression="CoordinatorID" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Course] WHERE [CourseID] = @original_CourseID AND [Title] = @original_Title AND [Number] = @original_Number AND [Lecture Hours] = @original_Lecture_Hours AND [Lab Hours] = @original_Lab_Hours AND [Credits] = @original_Credits AND [Description] = @original_Description AND [Goals] = @original_Goals AND [Topics] = @original_Topics AND (([DepartmentID] = @original_DepartmentID) OR ([DepartmentID] IS NULL AND @original_DepartmentID IS NULL)) AND (([CoordinatorID] = @original_CoordinatorID) OR ([CoordinatorID] IS NULL AND @original_CoordinatorID IS NULL))" InsertCommand="INSERT INTO [Course] ([Title], [Number], [Lecture Hours], [Lab Hours], [Credits], [Description], [Goals], [Topics], [DepartmentID], [CoordinatorID]) VALUES (@Title, @Number, @Lecture_Hours, @Lab_Hours, @Credits, @Description, @Goals, @Topics, @DepartmentID, @CoordinatorID)" OldValuesParameterFormatString="original_{0}" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [Course]" UpdateCommand="UPDATE [Course] SET [Title] = @Title, [Number] = @Number, [Lecture Hours] = @Lecture_Hours, [Lab Hours] = @Lab_Hours, [Credits] = @Credits, [Description] = @Description, [Goals] = @Goals, [Topics] = @Topics, [DepartmentID] = @DepartmentID, [CoordinatorID] = @CoordinatorID WHERE [CourseID] = @original_CourseID AND [Title] = @original_Title AND [Number] = @original_Number AND [Lecture Hours] = @original_Lecture_Hours AND [Lab Hours] = @original_Lab_Hours AND [Credits] = @original_Credits AND [Description] = @original_Description AND [Goals] = @original_Goals AND [Topics] = @original_Topics AND (([DepartmentID] = @original_DepartmentID) OR ([DepartmentID] IS NULL AND @original_DepartmentID IS NULL)) AND (([CoordinatorID] = @original_CoordinatorID) OR ([CoordinatorID] IS NULL AND @original_CoordinatorID IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_Title" Type="String" />
        <asp:Parameter Name="original_Number" Type="Int32" />
        <asp:Parameter Name="original_Lecture_Hours" Type="Int32" />
        <asp:Parameter Name="original_Lab_Hours" Type="Int32" />
        <asp:Parameter Name="original_Credits" Type="Int32" />
        <asp:Parameter Name="original_Description" Type="String" />
        <asp:Parameter Name="original_Goals" Type="String" />
        <asp:Parameter Name="original_Topics" Type="String" />
        <asp:Parameter Name="original_DepartmentID" Type="Int32" />
        <asp:Parameter Name="original_CoordinatorID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Number" Type="Int32" />
        <asp:Parameter Name="Lecture_Hours" Type="Int32" />
        <asp:Parameter Name="Lab_Hours" Type="Int32" />
        <asp:Parameter Name="Credits" Type="Int32" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Goals" Type="String" />
        <asp:Parameter Name="Topics" Type="String" />
        <asp:Parameter Name="DepartmentID" Type="Int32" />
        <asp:Parameter Name="CoordinatorID" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Number" Type="Int32" />
        <asp:Parameter Name="Lecture_Hours" Type="Int32" />
        <asp:Parameter Name="Lab_Hours" Type="Int32" />
        <asp:Parameter Name="Credits" Type="Int32" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Goals" Type="String" />
        <asp:Parameter Name="Topics" Type="String" />
        <asp:Parameter Name="DepartmentID" Type="Int32" />
        <asp:Parameter Name="CoordinatorID" Type="Int32" />
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_Title" Type="String" />
        <asp:Parameter Name="original_Number" Type="Int32" />
        <asp:Parameter Name="original_Lecture_Hours" Type="Int32" />
        <asp:Parameter Name="original_Lab_Hours" Type="Int32" />
        <asp:Parameter Name="original_Credits" Type="Int32" />
        <asp:Parameter Name="original_Description" Type="String" />
        <asp:Parameter Name="original_Goals" Type="String" />
        <asp:Parameter Name="original_Topics" Type="String" />
        <asp:Parameter Name="original_DepartmentID" Type="Int32" />
        <asp:Parameter Name="original_CoordinatorID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<br />
<strong><span style="color: #FFFF00; font-size: xx-large"><span style="font-size: xx-large"><span style="font-size: xx-large; color: #00FF00">Course_DegElective Table</span></span>
<asp:ImageButton ID="Toggle4" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle4Clicked" />
<br />
</span></strong>
<asp:GridView ID="Course_DegElectiveTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="C_ElectDegID" datasourceid="SqlDataSource5" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="C_ElectDegID" HeaderText="C_ElectDegID" InsertVisible="False" ReadOnly="True" SortExpression="C_ElectDegID" />
        <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
        <asp:BoundField DataField="DegreeID" HeaderText="DegreeID" SortExpression="DegreeID" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Course_ElectDeg] WHERE [C_ElectDegID] = @original_C_ElectDegID AND [CourseID] = @original_CourseID AND [DegreeID] = @original_DegreeID" InsertCommand="INSERT INTO [Course_ElectDeg] ([CourseID], [DegreeID]) VALUES (@CourseID, @DegreeID)" OldValuesParameterFormatString="original_{0}" OnSelecting="SqlDataSource5_Selecting" SelectCommand="SELECT * FROM [Course_ElectDeg]" UpdateCommand="UPDATE [Course_ElectDeg] SET [CourseID] = @CourseID, [DegreeID] = @DegreeID WHERE [C_ElectDegID] = @original_C_ElectDegID AND [CourseID] = @original_CourseID AND [DegreeID] = @original_DegreeID">
    <DeleteParameters>
        <asp:Parameter Name="original_C_ElectDegID" Type="Int32" />
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_DegreeID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CourseID" Type="Int32" />
        <asp:Parameter Name="DegreeID" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CourseID" Type="Int32" />
        <asp:Parameter Name="DegreeID" Type="Int32" />
        <asp:Parameter Name="original_C_ElectDegID" Type="Int32" />
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_DegreeID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<span style="font-size: xx-large; color: #00FF00">
<br />
Course_PreRequisite Table</span>
<asp:ImageButton ID="Toggle5" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle5Clicked" />
<br />
<asp:GridView ID="Course_PreRequisiteTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="C_PReqID" datasourceid="SqlDataSource6" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="C_PReqID" HeaderText="C_PReqID" InsertVisible="False" ReadOnly="True" SortExpression="C_PReqID" />
        <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
        <asp:BoundField DataField="RequisiteID" HeaderText="RequisiteID" SortExpression="RequisiteID" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Course_PreRequisites] WHERE [C_PReqID] = @original_C_PReqID AND [CourseID] = @original_CourseID AND [RequisiteID] = @original_RequisiteID" InsertCommand="INSERT INTO [Course_PreRequisites] ([CourseID], [RequisiteID]) VALUES (@CourseID, @RequisiteID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Course_PreRequisites]" UpdateCommand="UPDATE [Course_PreRequisites] SET [CourseID] = @CourseID, [RequisiteID] = @RequisiteID WHERE [C_PReqID] = @original_C_PReqID AND [CourseID] = @original_CourseID AND [RequisiteID] = @original_RequisiteID">
    <DeleteParameters>
        <asp:Parameter Name="original_C_PReqID" Type="Int32" />
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_RequisiteID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CourseID" Type="Int32" />
        <asp:Parameter Name="RequisiteID" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CourseID" Type="Int32" />
        <asp:Parameter Name="RequisiteID" Type="Int32" />
        <asp:Parameter Name="original_C_PReqID" Type="Int32" />
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_RequisiteID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<span style="font-size: xx-large; color: #00FF00">Course_Professor Table</span>
<asp:ImageButton ID="Toggle6" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle6Clicked" />
<br />
<asp:GridView ID="Course_ProfessorTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="C_PID" datasourceid="SqlDataSource8" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="C_PID" HeaderText="C_PID" InsertVisible="False" ReadOnly="True" SortExpression="C_PID" />
        <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
        <asp:BoundField DataField="ProfessorID" HeaderText="ProfessorID" SortExpression="ProfessorID" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource8" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Course_Professor] WHERE [C_PID] = @original_C_PID AND [CourseID] = @original_CourseID AND [ProfessorID] = @original_ProfessorID" InsertCommand="INSERT INTO [Course_Professor] ([CourseID], [ProfessorID]) VALUES (@CourseID, @ProfessorID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Course_Professor]" UpdateCommand="UPDATE [Course_Professor] SET [CourseID] = @CourseID, [ProfessorID] = @ProfessorID WHERE [C_PID] = @original_C_PID AND [CourseID] = @original_CourseID AND [ProfessorID] = @original_ProfessorID">
    <DeleteParameters>
        <asp:Parameter Name="original_C_PID" Type="Int32" />
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_ProfessorID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CourseID" Type="Int32" />
        <asp:Parameter Name="ProfessorID" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CourseID" Type="Int32" />
        <asp:Parameter Name="ProfessorID" Type="Int32" />
        <asp:Parameter Name="original_C_PID" Type="Int32" />
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_ProfessorID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<span style="font-size: xx-large; color: #00FF00">Course_ReqRequisite Table</span>
<asp:ImageButton ID="Toggle7" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle7Clicked" />
<br />
<asp:GridView ID="Course_ReqRequisiteTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="C_ReqDegID" datasourceid="SqlDataSource9" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="C_ReqDegID" HeaderText="C_ReqDegID" InsertVisible="False" ReadOnly="True" SortExpression="C_ReqDegID" />
        <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
        <asp:BoundField DataField="DegreeID" HeaderText="DegreeID" SortExpression="DegreeID" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource9" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Course_ReqDeg] WHERE [C_ReqDegID] = @original_C_ReqDegID AND (([CourseID] = @original_CourseID) OR ([CourseID] IS NULL AND @original_CourseID IS NULL)) AND (([DegreeID] = @original_DegreeID) OR ([DegreeID] IS NULL AND @original_DegreeID IS NULL))" InsertCommand="INSERT INTO [Course_ReqDeg] ([CourseID], [DegreeID]) VALUES (@CourseID, @DegreeID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Course_ReqDeg]" UpdateCommand="UPDATE [Course_ReqDeg] SET [CourseID] = @CourseID, [DegreeID] = @DegreeID WHERE [C_ReqDegID] = @original_C_ReqDegID AND (([CourseID] = @original_CourseID) OR ([CourseID] IS NULL AND @original_CourseID IS NULL)) AND (([DegreeID] = @original_DegreeID) OR ([DegreeID] IS NULL AND @original_DegreeID IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_C_ReqDegID" Type="Int32" />
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_DegreeID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CourseID" Type="Int32" />
        <asp:Parameter Name="DegreeID" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CourseID" Type="Int32" />
        <asp:Parameter Name="DegreeID" Type="Int32" />
        <asp:Parameter Name="original_C_ReqDegID" Type="Int32" />
        <asp:Parameter Name="original_CourseID" Type="Int32" />
        <asp:Parameter Name="original_DegreeID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
    <span style="font-size: xx-large; color: #00FF00">Degree Table</span>
<asp:ImageButton ID="Toggle8" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle8Clicked" />
<br />
<asp:GridView ID="DegreeTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DegreeID" datasourceid="SqlDataSource10" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="DegreeID" HeaderText="DegreeID" InsertVisible="False" ReadOnly="True" SortExpression="DegreeID" />
        <asp:BoundField DataField="DegreeName" HeaderText="DegreeName" SortExpression="DegreeName" />
        <asp:BoundField DataField="DegreeAbbr" HeaderText="DegreeAbbr" SortExpression="DegreeAbbr" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource10" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Degree] WHERE [DegreeID] = @original_DegreeID AND [DegreeName] = @original_DegreeName AND [DegreeAbbr] = @original_DegreeAbbr" InsertCommand="INSERT INTO [Degree] ([DegreeName], [DegreeAbbr]) VALUES (@DegreeName, @DegreeAbbr)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Degree]" UpdateCommand="UPDATE [Degree] SET [DegreeName] = @DegreeName, [DegreeAbbr] = @DegreeAbbr WHERE [DegreeID] = @original_DegreeID AND [DegreeName] = @original_DegreeName AND [DegreeAbbr] = @original_DegreeAbbr">
    <DeleteParameters>
        <asp:Parameter Name="original_DegreeID" Type="Int32" />
        <asp:Parameter Name="original_DegreeName" Type="String" />
        <asp:Parameter Name="original_DegreeAbbr" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="DegreeName" Type="String" />
        <asp:Parameter Name="DegreeAbbr" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="DegreeName" Type="String" />
        <asp:Parameter Name="DegreeAbbr" Type="String" />
        <asp:Parameter Name="original_DegreeID" Type="Int32" />
        <asp:Parameter Name="original_DegreeName" Type="String" />
        <asp:Parameter Name="original_DegreeAbbr" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
    <span style="font-size: xx-large; color: #00FF00">Degree Level Table</span>
<asp:ImageButton ID="Toggle9" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle9Clicked" />
<br />
<asp:GridView ID="DegreeLevelTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DegreeLevelID" datasourceid="SqlDataSource11" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="DegreeLevelID" HeaderText="DegreeLevelID" InsertVisible="False" ReadOnly="True" SortExpression="DegreeLevelID" />
        <asp:BoundField DataField="DegreeLevel" HeaderText="DegreeLevel" SortExpression="DegreeLevel" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource11" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [DegreeLevel] WHERE [DegreeLevelID] = @original_DegreeLevelID AND [DegreeLevel] = @original_DegreeLevel" InsertCommand="INSERT INTO [DegreeLevel] ([DegreeLevel]) VALUES (@DegreeLevel)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DegreeLevel]" UpdateCommand="UPDATE [DegreeLevel] SET [DegreeLevel] = @DegreeLevel WHERE [DegreeLevelID] = @original_DegreeLevelID AND [DegreeLevel] = @original_DegreeLevel">
    <DeleteParameters>
        <asp:Parameter Name="original_DegreeLevelID" Type="Int32" />
        <asp:Parameter Name="original_DegreeLevel" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="DegreeLevel" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="DegreeLevel" Type="String" />
        <asp:Parameter Name="original_DegreeLevelID" Type="Int32" />
        <asp:Parameter Name="original_DegreeLevel" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
    <span style="font-size: xx-large; color: #00FF00">Department Table</span>
<asp:ImageButton ID="Toggle10" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle10Clicked" />
<br />
<asp:GridView ID="DepartmentTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DepartmentID" datasourceid="SqlDataSource12" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" InsertVisible="False" ReadOnly="True" SortExpression="DepartmentID" />
        <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DepartmentName" />
        <asp:BoundField DataField="DepartmentAbbr" HeaderText="DepartmentAbbr" SortExpression="DepartmentAbbr" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource12" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Department] WHERE [DepartmentID] = @original_DepartmentID AND [DepartmentName] = @original_DepartmentName AND [DepartmentAbbr] = @original_DepartmentAbbr" InsertCommand="INSERT INTO [Department] ([DepartmentName], [DepartmentAbbr]) VALUES (@DepartmentName, @DepartmentAbbr)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Department]" UpdateCommand="UPDATE [Department] SET [DepartmentName] = @DepartmentName, [DepartmentAbbr] = @DepartmentAbbr WHERE [DepartmentID] = @original_DepartmentID AND [DepartmentName] = @original_DepartmentName AND [DepartmentAbbr] = @original_DepartmentAbbr">
    <DeleteParameters>
        <asp:Parameter Name="original_DepartmentID" Type="Int32" />
        <asp:Parameter Name="original_DepartmentName" Type="String" />
        <asp:Parameter Name="original_DepartmentAbbr" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="DepartmentName" Type="String" />
        <asp:Parameter Name="DepartmentAbbr" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="DepartmentName" Type="String" />
        <asp:Parameter Name="DepartmentAbbr" Type="String" />
        <asp:Parameter Name="original_DepartmentID" Type="Int32" />
        <asp:Parameter Name="original_DepartmentName" Type="String" />
        <asp:Parameter Name="original_DepartmentAbbr" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<br />
</span><span style="font-size: xx-large; color: #00FF00">Professor Table</span><span style="color: #00FFFF; font-size: xx-large">
<asp:ImageButton ID="Toggle11" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle11Clicked" />
<br />
<asp:GridView ID="ProfessorTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProfessorID" datasourceid="SqlDataSource2" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="ProfessorID" HeaderText="ProfessorID" InsertVisible="False" ReadOnly="True" SortExpression="ProfessorID" />
        <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
        <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
        <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" SortExpression="DepartmentID" />
        <asp:BoundField DataField="BuildingID" HeaderText="BuildingID" SortExpression="BuildingID" />
        <asp:BoundField DataField="OfficeNumber" HeaderText="OfficeNumber" SortExpression="OfficeNumber" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Professor] WHERE [ProfessorID] = @original_ProfessorID AND [FName] = @original_FName AND [LName] = @original_LName AND (([DepartmentID] = @original_DepartmentID) OR ([DepartmentID] IS NULL AND @original_DepartmentID IS NULL)) AND (([BuildingID] = @original_BuildingID) OR ([BuildingID] IS NULL AND @original_BuildingID IS NULL)) AND [OfficeNumber] = @original_OfficeNumber" InsertCommand="INSERT INTO [Professor] ([FName], [LName], [DepartmentID], [BuildingID], [OfficeNumber]) VALUES (@FName, @LName, @DepartmentID, @BuildingID, @OfficeNumber)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Professor]" UpdateCommand="UPDATE [Professor] SET [FName] = @FName, [LName] = @LName, [DepartmentID] = @DepartmentID, [BuildingID] = @BuildingID, [OfficeNumber] = @OfficeNumber WHERE [ProfessorID] = @original_ProfessorID AND [FName] = @original_FName AND [LName] = @original_LName AND (([DepartmentID] = @original_DepartmentID) OR ([DepartmentID] IS NULL AND @original_DepartmentID IS NULL)) AND (([BuildingID] = @original_BuildingID) OR ([BuildingID] IS NULL AND @original_BuildingID IS NULL)) AND [OfficeNumber] = @original_OfficeNumber" OnSelecting="SqlDataSource2_Selecting">
    <DeleteParameters>
        <asp:Parameter Name="original_ProfessorID" Type="Int32" />
        <asp:Parameter Name="original_FName" Type="String" />
        <asp:Parameter Name="original_LName" Type="String" />
        <asp:Parameter Name="original_DepartmentID" Type="Int32" />
        <asp:Parameter Name="original_BuildingID" Type="Int32" />
        <asp:Parameter Name="original_OfficeNumber" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="FName" Type="String" />
        <asp:Parameter Name="LName" Type="String" />
        <asp:Parameter Name="DepartmentID" Type="Int32" />
        <asp:Parameter Name="BuildingID" Type="Int32" />
        <asp:Parameter Name="OfficeNumber" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="FName" Type="String" />
        <asp:Parameter Name="LName" Type="String" />
        <asp:Parameter Name="DepartmentID" Type="Int32" />
        <asp:Parameter Name="BuildingID" Type="Int32" />
        <asp:Parameter Name="OfficeNumber" Type="Int32" />
        <asp:Parameter Name="original_ProfessorID" Type="Int32" />
        <asp:Parameter Name="original_FName" Type="String" />
        <asp:Parameter Name="original_LName" Type="String" />
        <asp:Parameter Name="original_DepartmentID" Type="Int32" />
        <asp:Parameter Name="original_BuildingID" Type="Int32" />
        <asp:Parameter Name="original_OfficeNumber" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
    <span style="font-size: xx-large; color: #00FF00">Publisher Table</span>
<asp:ImageButton ID="Toggle12" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle12Clicked" />
<br />
<asp:GridView ID="PublisherTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PublisherID" datasourceid="SqlDataSource13" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="PublisherID" HeaderText="PublisherID" InsertVisible="False" ReadOnly="True" SortExpression="PublisherID" />
        <asp:BoundField DataField="PublisherName" HeaderText="PublisherName" SortExpression="PublisherName" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource13" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Publisher] WHERE [PublisherID] = @original_PublisherID AND [PublisherName] = @original_PublisherName" InsertCommand="INSERT INTO [Publisher] ([PublisherName]) VALUES (@PublisherName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Publisher]" UpdateCommand="UPDATE [Publisher] SET [PublisherName] = @PublisherName WHERE [PublisherID] = @original_PublisherID AND [PublisherName] = @original_PublisherName">
    <DeleteParameters>
        <asp:Parameter Name="original_PublisherID" Type="Int32" />
        <asp:Parameter Name="original_PublisherName" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="PublisherName" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="PublisherName" Type="String" />
        <asp:Parameter Name="original_PublisherID" Type="Int32" />
        <asp:Parameter Name="original_PublisherName" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
    <span style="font-size: xx-large; color: #00FF00">ReqComment Table</span>
<asp:ImageButton ID="Toggle13" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle13Clicked" />
<br />
<asp:GridView ID="ReqCommentTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ReqCommentID" datasourceid="SqlDataSource7" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="ReqCommentID" HeaderText="ReqCommentID" InsertVisible="False" ReadOnly="True" SortExpression="ReqCommentID" />
        <asp:BoundField DataField="ReqComment" HeaderText="ReqComment" SortExpression="ReqComment" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [ReqComment] WHERE [ReqCommentID] = @original_ReqCommentID AND [ReqComment] = @original_ReqComment" InsertCommand="INSERT INTO [ReqComment] ([ReqComment]) VALUES (@ReqComment)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ReqComment]" UpdateCommand="UPDATE [ReqComment] SET [ReqComment] = @ReqComment WHERE [ReqCommentID] = @original_ReqCommentID AND [ReqComment] = @original_ReqComment">
    <DeleteParameters>
        <asp:Parameter Name="original_ReqCommentID" Type="Int32" />
        <asp:Parameter Name="original_ReqComment" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ReqComment" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="ReqComment" Type="String" />
        <asp:Parameter Name="original_ReqCommentID" Type="Int32" />
        <asp:Parameter Name="original_ReqComment" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
    <span style="font-size: xx-large; color: #00FF00">ReqType Table</span>
<asp:ImageButton ID="Toggle14" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle14Clicked" />
<br />
<asp:GridView ID="ReqTypeTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ReqTypeID" datasourceid="SqlDataSource14" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="ReqTypeID" HeaderText="ReqTypeID" InsertVisible="False" ReadOnly="True" SortExpression="ReqTypeID" />
        <asp:BoundField DataField="RequirementType" HeaderText="RequirementType" SortExpression="RequirementType" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource14" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [ReqType] WHERE [ReqTypeID] = @original_ReqTypeID AND [RequirementType] = @original_RequirementType" InsertCommand="INSERT INTO [ReqType] ([RequirementType]) VALUES (@RequirementType)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ReqType]" UpdateCommand="UPDATE [ReqType] SET [RequirementType] = @RequirementType WHERE [ReqTypeID] = @original_ReqTypeID AND [RequirementType] = @original_RequirementType">
    <DeleteParameters>
        <asp:Parameter Name="original_ReqTypeID" Type="Int32" />
        <asp:Parameter Name="original_RequirementType" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="RequirementType" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="RequirementType" Type="String" />
        <asp:Parameter Name="original_ReqTypeID" Type="Int32" />
        <asp:Parameter Name="original_RequirementType" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
    <span style="font-size: xx-large; color: #00FF00">Requisite Table</span>
<asp:ImageButton ID="Toggle15" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle15Clicked" />
<br />
<asp:GridView ID="RequisiteTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RequisiteID" datasourceid="SqlDataSource15" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="RequisiteID" HeaderText="RequisiteID" InsertVisible="False" ReadOnly="True" SortExpression="RequisiteID" />
        <asp:BoundField DataField="CourseLink" HeaderText="CourseLink" SortExpression="CourseLink" />
        <asp:BoundField DataField="CommentID" HeaderText="CommentID" SortExpression="CommentID" />
        <asp:BoundField DataField="ReqType" HeaderText="ReqType" SortExpression="ReqType" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource15" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Requisite] WHERE [RequisiteID] = @original_RequisiteID AND (([CourseLink] = @original_CourseLink) OR ([CourseLink] IS NULL AND @original_CourseLink IS NULL)) AND (([CommentID] = @original_CommentID) OR ([CommentID] IS NULL AND @original_CommentID IS NULL)) AND (([ReqType] = @original_ReqType) OR ([ReqType] IS NULL AND @original_ReqType IS NULL))" InsertCommand="INSERT INTO [Requisite] ([CourseLink], [CommentID], [ReqType]) VALUES (@CourseLink, @CommentID, @ReqType)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Requisite]" UpdateCommand="UPDATE [Requisite] SET [CourseLink] = @CourseLink, [CommentID] = @CommentID, [ReqType] = @ReqType WHERE [RequisiteID] = @original_RequisiteID AND (([CourseLink] = @original_CourseLink) OR ([CourseLink] IS NULL AND @original_CourseLink IS NULL)) AND (([CommentID] = @original_CommentID) OR ([CommentID] IS NULL AND @original_CommentID IS NULL)) AND (([ReqType] = @original_ReqType) OR ([ReqType] IS NULL AND @original_ReqType IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_RequisiteID" Type="Int32" />
        <asp:Parameter Name="original_CourseLink" Type="Int32" />
        <asp:Parameter Name="original_CommentID" Type="Int32" />
        <asp:Parameter Name="original_ReqType" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CourseLink" Type="Int32" />
        <asp:Parameter Name="CommentID" Type="Int32" />
        <asp:Parameter Name="ReqType" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CourseLink" Type="Int32" />
        <asp:Parameter Name="CommentID" Type="Int32" />
        <asp:Parameter Name="ReqType" Type="Int32" />
        <asp:Parameter Name="original_RequisiteID" Type="Int32" />
        <asp:Parameter Name="original_CourseLink" Type="Int32" />
        <asp:Parameter Name="original_CommentID" Type="Int32" />
        <asp:Parameter Name="original_ReqType" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
    <span style="font-size: xx-large; color: #00FF00">SLO Table</span>
<asp:ImageButton ID="Toggle16" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle16Clicked" />
<br />
<asp:GridView ID="SLOTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SloID" datasourceid="SqlDataSource16" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="SloID" HeaderText="SloID" InsertVisible="False" ReadOnly="True" SortExpression="SloID" />
        <asp:BoundField DataField="SLODescID" HeaderText="SLODescID" SortExpression="SLODescID" />
        <asp:BoundField DataField="DegreeID" HeaderText="DegreeID" SortExpression="DegreeID" />
        <asp:BoundField DataField="DegreeLevelID" HeaderText="DegreeLevelID" SortExpression="DegreeLevelID" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource16" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [SLO] WHERE [SloID] = @original_SloID AND (([SLODescID] = @original_SLODescID) OR ([SLODescID] IS NULL AND @original_SLODescID IS NULL)) AND (([DegreeID] = @original_DegreeID) OR ([DegreeID] IS NULL AND @original_DegreeID IS NULL)) AND (([DegreeLevelID] = @original_DegreeLevelID) OR ([DegreeLevelID] IS NULL AND @original_DegreeLevelID IS NULL))" InsertCommand="INSERT INTO [SLO] ([SLODescID], [DegreeID], [DegreeLevelID]) VALUES (@SLODescID, @DegreeID, @DegreeLevelID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SLO]" UpdateCommand="UPDATE [SLO] SET [SLODescID] = @SLODescID, [DegreeID] = @DegreeID, [DegreeLevelID] = @DegreeLevelID WHERE [SloID] = @original_SloID AND (([SLODescID] = @original_SLODescID) OR ([SLODescID] IS NULL AND @original_SLODescID IS NULL)) AND (([DegreeID] = @original_DegreeID) OR ([DegreeID] IS NULL AND @original_DegreeID IS NULL)) AND (([DegreeLevelID] = @original_DegreeLevelID) OR ([DegreeLevelID] IS NULL AND @original_DegreeLevelID IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_SloID" Type="Int32" />
        <asp:Parameter Name="original_SLODescID" Type="Int32" />
        <asp:Parameter Name="original_DegreeID" Type="Int32" />
        <asp:Parameter Name="original_DegreeLevelID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="SLODescID" Type="Int32" />
        <asp:Parameter Name="DegreeID" Type="Int32" />
        <asp:Parameter Name="DegreeLevelID" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="SLODescID" Type="Int32" />
        <asp:Parameter Name="DegreeID" Type="Int32" />
        <asp:Parameter Name="DegreeLevelID" Type="Int32" />
        <asp:Parameter Name="original_SloID" Type="Int32" />
        <asp:Parameter Name="original_SLODescID" Type="Int32" />
        <asp:Parameter Name="original_DegreeID" Type="Int32" />
        <asp:Parameter Name="original_DegreeLevelID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
    <span style="font-size: xx-large; color: #00FF00">SLODescription Table</span>
<asp:ImageButton ID="Toggle17" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle17Clicked" />
<br />
<asp:GridView ID="SLODescriptionTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SLODescID" datasourceid="SqlDataSource17" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="SLODescID" HeaderText="SLODescID" InsertVisible="False" ReadOnly="True" SortExpression="SLODescID" />
        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource17" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [SLODescription] WHERE [SLODescID] = @original_SLODescID AND [Description] = @original_Description" InsertCommand="INSERT INTO [SLODescription] ([Description]) VALUES (@Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SLODescription]" UpdateCommand="UPDATE [SLODescription] SET [Description] = @Description WHERE [SLODescID] = @original_SLODescID AND [Description] = @original_Description">
    <DeleteParameters>
        <asp:Parameter Name="original_SLODescID" Type="Int32" />
        <asp:Parameter Name="original_Description" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="original_SLODescID" Type="Int32" />
        <asp:Parameter Name="original_Description" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
    <span style="font-size: xx-large; color: #00FF00">Textbook Table</span>
<asp:ImageButton ID="Toggle18" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle18Clicked" />
<br />
<asp:GridView ID="TextbookTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TextbookID" datasourceid="SqlDataSource18" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="TextbookID" HeaderText="TextbookID" InsertVisible="False" ReadOnly="True" SortExpression="TextbookID" />
        <asp:BoundField DataField="PublisherID" HeaderText="PublisherID" SortExpression="PublisherID" />
        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
        <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
        <asp:BoundField DataField="PublishDate" HeaderText="PublishDate" SortExpression="PublishDate" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource18" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Textbook] WHERE [TextbookID] = @original_TextbookID AND (([PublisherID] = @original_PublisherID) OR ([PublisherID] IS NULL AND @original_PublisherID IS NULL)) AND [Title] = @original_Title AND [ISBN] = @original_ISBN AND [PublishDate] = @original_PublishDate" InsertCommand="INSERT INTO [Textbook] ([PublisherID], [Title], [ISBN], [PublishDate]) VALUES (@PublisherID, @Title, @ISBN, @PublishDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Textbook]" UpdateCommand="UPDATE [Textbook] SET [PublisherID] = @PublisherID, [Title] = @Title, [ISBN] = @ISBN, [PublishDate] = @PublishDate WHERE [TextbookID] = @original_TextbookID AND (([PublisherID] = @original_PublisherID) OR ([PublisherID] IS NULL AND @original_PublisherID IS NULL)) AND [Title] = @original_Title AND [ISBN] = @original_ISBN AND [PublishDate] = @original_PublishDate">
    <DeleteParameters>
        <asp:Parameter Name="original_TextbookID" Type="Int32" />
        <asp:Parameter Name="original_PublisherID" Type="Int32" />
        <asp:Parameter Name="original_Title" Type="String" />
        <asp:Parameter Name="original_ISBN" Type="String" />
        <asp:Parameter DbType="Date" Name="original_PublishDate" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="PublisherID" Type="Int32" />
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="ISBN" Type="String" />
        <asp:Parameter DbType="Date" Name="PublishDate" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="PublisherID" Type="Int32" />
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="ISBN" Type="String" />
        <asp:Parameter Name="PublishDate" DbType="Date" />
        <asp:Parameter Name="original_TextbookID" Type="Int32" />
        <asp:Parameter Name="original_PublisherID" Type="Int32" />
        <asp:Parameter Name="original_Title" Type="String" />
        <asp:Parameter Name="original_ISBN" Type="String" />
        <asp:Parameter DbType="Date" Name="original_PublishDate" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<br />
    <span style="font-size: xx-large; color: #00FF00">Textbook_Author Table</span>
<asp:ImageButton ID="Toggle19" runat="server" Height="30px" ImageAlign="Top" ImageUrl="~/down.png" Width="30px" OnClick="onToggle19Clicked" />
<br />
<asp:GridView ID="TextBook_AuthorTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TextbookID,AuthorID" datasourceid="SqlDataSource19" EmptyDataText="No Rows Exist" Visible="False">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="TextbookAuthorID" HeaderText="TextbookAuthorID" InsertVisible="False" ReadOnly="True" SortExpression="TextbookAuthorID" />
        <asp:BoundField DataField="TextbookID" HeaderText="TextbookID" SortExpression="TextbookID" ReadOnly="True" />
        <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" SortExpression="AuthorID" ReadOnly="True" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource19" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CSET_ABET_DBConnectionString %>" DeleteCommand="DELETE FROM [Textbook_Author] WHERE [TextbookID] = @original_TextbookID AND [AuthorID] = @original_AuthorID AND [TextbookAuthorID] = @original_TextbookAuthorID" InsertCommand="INSERT INTO [Textbook_Author] ([TextbookID], [AuthorID]) VALUES (@TextbookID, @AuthorID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Textbook_Author]" UpdateCommand="UPDATE [Textbook_Author] SET [TextbookAuthorID] = @TextbookAuthorID WHERE [TextbookID] = @original_TextbookID AND [AuthorID] = @original_AuthorID AND [TextbookAuthorID] = @original_TextbookAuthorID">
    <DeleteParameters>
        <asp:Parameter Name="original_TextbookID" Type="Int32" />
        <asp:Parameter Name="original_AuthorID" Type="Int32" />
        <asp:Parameter Name="original_TextbookAuthorID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="TextbookID" Type="Int32" />
        <asp:Parameter Name="AuthorID" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="TextbookAuthorID" Type="Int32" />
        <asp:Parameter Name="original_TextbookID" Type="Int32" />
        <asp:Parameter Name="original_AuthorID" Type="Int32" />
        <asp:Parameter Name="original_TextbookAuthorID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<br />
<br />
</span>&nbsp;
</asp:Content>
