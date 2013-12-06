using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Tools.Word;
using System.Configuration;

namespace ABETFrontEnd
{
	public partial class WordDocImportPage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		}

		protected void ImportButton_Click(object sender, EventArgs e)
		{
            DataImportReview.Visible = true;
			/*string ImportFilePath = ConfigurationManager.AppSettings["FilePath"].ToString();
			bool success = false;
			string emptyCheck = string.Empty;

			//hoping to implement this..
			if (DocumentUpload.HasFile)
			{
                
				try
				{

				}
				catch (Exception ex)
				{

				}
			}*/
		}

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CancelImport(object sender, EventArgs e)
        {
            DataImportReview.Visible = false;
        }

        protected void VerifyCourseTitle(object sender, EventArgs e)
        {
            if (AcceptCourseTitle.ImageUrl == "~/thumbsup.png")
            {
                AcceptCourseTitle.ImageUrl = "~/Unlock-icon.png";
                CourseTitleInput.ReadOnly = true;
                CourseTitleInput.BackColor = System.Drawing.Color.Blue;
                CourseTitleInput.ForeColor = System.Drawing.Color.Yellow;
            }
            else
            {
                AcceptCourseTitle.ImageUrl = "~/thumbsup.png";
                CourseTitleInput.ReadOnly = false;
                CourseTitleInput.BackColor = System.Drawing.Color.White;
                CourseTitleInput.ForeColor = System.Drawing.Color.Black;
            }
        }
        protected void VerifyCourseNumber(object sender, EventArgs e)
        {
            if (AcceptCourseNumber.ImageUrl == "~/thumbsup.png")
            {
                AcceptCourseNumber.ImageUrl = "~/Unlock-icon.png";
                CourseNumberInput.ReadOnly = true;
                CourseNumberInput.BackColor = System.Drawing.Color.Blue;
                CourseNumberInput.ForeColor = System.Drawing.Color.Yellow;
            }
            else
            {
                AcceptCourseNumber.ImageUrl = "~/thumbsup.png";
                CourseNumberInput.ReadOnly = false;
                CourseNumberInput.BackColor = System.Drawing.Color.White;
                CourseNumberInput.ForeColor = System.Drawing.Color.Black;
            }
        }
        protected void VerifyCourseLectureHours(object sender, EventArgs e)
        {
            if (AcceptCourseLectureHours.ImageUrl == "~/thumbsup.png")
            {
                AcceptCourseLectureHours.ImageUrl = "~/Unlock-icon.png";
                CourseLectureHoursInput.ReadOnly = true;
                CourseLectureHoursInput.BackColor = System.Drawing.Color.Blue;
                CourseLectureHoursInput.ForeColor = System.Drawing.Color.Yellow;
            }
            else
            {
                AcceptCourseLectureHours.ImageUrl = "~/thumbsup.png";
                CourseLectureHoursInput.ReadOnly = false;
                CourseLectureHoursInput.BackColor = System.Drawing.Color.White;
                CourseLectureHoursInput.ForeColor = System.Drawing.Color.Black;
            }
        }
        protected void VerifyCourseLabHours(object sender, EventArgs e)
        {
            if (AcceptCourseLabHours.ImageUrl == "~/thumbsup.png")
            {
                AcceptCourseLabHours.ImageUrl = "~/Unlock-icon.png";
                CourseLabHoursInput.ReadOnly = true;
                CourseLabHoursInput.BackColor = System.Drawing.Color.Blue;
                CourseLabHoursInput.ForeColor = System.Drawing.Color.Yellow;
            }
            else
            {
                AcceptCourseLabHours.ImageUrl = "~/thumbsup.png";
                CourseLabHoursInput.ReadOnly = false;
                CourseLabHoursInput.BackColor = System.Drawing.Color.White;
                CourseLabHoursInput.ForeColor = System.Drawing.Color.Black;
            }
        }
	}
}