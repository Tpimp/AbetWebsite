using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABETFrontEnd
{
	public partial class EditContentPage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource5_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void onToggle1Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(AuthorTable, Toggle1);
        }
        protected void onToggle2Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(BuildingTable, Toggle2);
        }
        protected void onToggle3Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(CourseTable, Toggle3);
        }
        protected void onToggle4Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(Course_DegElectiveTable, Toggle4);
        }
        protected void onToggle5Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(Course_PreRequisiteTable, Toggle5);
        }
        protected void onToggle6Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(Course_ProfessorTable, Toggle6);
        }
        protected void onToggle7Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(Course_ReqRequisiteTable, Toggle7);
        }
        protected void onToggle8Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(DegreeTable, Toggle8);
        }
        protected void onToggle9Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(DegreeLevelTable, Toggle9);
        }
        protected void onToggle10Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(DepartmentTable, Toggle10);
        }
        protected void onToggle11Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(ProfessorTable, Toggle11);
        }
        protected void onToggle12Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(PublisherTable, Toggle12);
        }
        protected void onToggle13Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(ReqCommentTable, Toggle13);
        }
        protected void onToggle14Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(ReqTypeTable, Toggle14);
        }
        protected void onToggle15Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(RequisiteTable, Toggle15);
        }
        protected void onToggle16Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(SLOTable, Toggle16);
        }
        protected void onToggle17Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(SLODescriptionTable, Toggle17);
        }
        protected void onToggle18Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(TextbookTable, Toggle18);
        }
        protected void onToggle19Clicked(object sender, EventArgs e)
        {
            onToggleMinimizedClicked(TextBook_AuthorTable, Toggle19);
        }
        protected void onToggleMinimizedClicked(GridView table, ImageButton togglebutton)
        {
            if(table.Visible)
            {
                table.Visible = false;
                togglebutton.ImageUrl = "~/down.png";
            }
            else
            {
                table.Visible = true;
                togglebutton.ImageUrl = "~/up.png";
            }
        }
	}
}