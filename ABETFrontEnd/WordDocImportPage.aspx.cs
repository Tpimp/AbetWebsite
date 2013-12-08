using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Word;
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

			try
			{
				dumpText();
			}
			catch (Exception ex)
			{

			}
		}

		private void dumpText()
		{
			DocumentUpload.SaveAs(Server.MapPath(DocumentUpload.FileName));
			object documentContainer = Server.MapPath(DocumentUpload.FileName);

			Microsoft.Office.Interop.Word.Application wordDocInstance = new Microsoft.Office.Interop.Word.Application();
			Microsoft.Office.Interop.Word.Document wordDocFile = new Microsoft.Office.Interop.Word.Document();

			object readOnly = false;
			object isVisible = true;
			object missing = System.Reflection.Missing.Value;
			

			try
			{
				wordDocFile = wordDocInstance.Documents.Open(ref documentContainer, ref missing, ref readOnly, ref missing,
								ref missing, ref missing, ref missing, ref missing, ref missing, ref isVisible);
				docOutput.MaxLength = wordDocFile.Content.Text.Length;

				string fullDocText = wordDocFile.Content.Text;

				docOutput.Text = fullDocText;

				SyllabusParser parser = new SyllabusParser(fullDocText);

				docOutput.Text = " ";
				docOutput.Text = parser.getCurrentText();

				fullDepartmentInput.Text = parser.SyllabusDepartment;
				CourseTitleInput.Text = parser.SyllabusCourseName;
				DeptAbbrInput.Text = parser.SyllabusDepartmentAbbreviation;
				CourseNumberInput.Text = parser.SyllabusCourseNumber;
				CourseLectureHoursInput.Text = parser.LectureHours.ToString();
				CourseLabHoursInput.Text = parser.LabHours.ToString();
				CourseCreditHoursInput.Text = parser.CreditHours.ToString();
				InstructorFirstInput.Text = parser.CourseInstructorFName;
				InstructorLastInput.Text = parser.CourseInstructorLName;
				CourseCoordinatorFirstInput.Text = parser.CourseCoordinatorFName;
				CourseCoordinatorLastInput.Text = parser.CourseCoordinatorLName;
			}
			catch (Exception ex)
			{
				wordDocFile.Close(ref missing, ref missing, ref missing);
				Console.WriteLine("ERROR: " + ex.Message);
			}
			finally
			{
				wordDocFile.Close(ref missing, ref missing, ref missing);
				wordDocInstance.DDETerminateAll();
			}
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
        protected void VerifyCourseCredits(object sender, EventArgs e)
        {
            if (AcceptCourseCredits.ImageUrl == "~/thumbsup.png")
            {
                AcceptCourseCredits.ImageUrl = "~/Unlock-icon.png";
				CourseCreditHoursInput.ReadOnly = true;
				CourseCreditHoursInput.BackColor = System.Drawing.Color.Blue;
				CourseCreditHoursInput.ForeColor = System.Drawing.Color.Yellow;
            }
            else
            {
                AcceptCourseCredits.ImageUrl = "~/thumbsup.png";
                CourseCreditHoursInput.ReadOnly = false;
				CourseCreditHoursInput.BackColor = System.Drawing.Color.White;
				CourseCreditHoursInput.ForeColor = System.Drawing.Color.Black;
            }
        }

		protected void VerifyDepartmentAbbreviation(object sender, ImageClickEventArgs e)
		{
			if (AcceptDeptAbbr.ImageUrl == "~/thumbsup.png")
			{
				AcceptDeptAbbr.ImageUrl = "~/Unlock-icon.png";
				DeptAbbrInput.ReadOnly = true;
				DeptAbbrInput.BackColor = System.Drawing.Color.Blue;
				DeptAbbrInput.ForeColor = System.Drawing.Color.Yellow;
			}
			else
			{
				AcceptDeptAbbr.ImageUrl = "~/thumbsup.png";
				DeptAbbrInput.ReadOnly = false;
				DeptAbbrInput.BackColor = System.Drawing.Color.White;
				DeptAbbrInput.ForeColor = System.Drawing.Color.Black;
			}
		}

		protected void VerifyCourseCredits(object sender, ImageClickEventArgs e)
		{
			if (AcceptCourseCredits.ImageUrl == "~/thumbsup.png")
			{
				AcceptCourseCredits.ImageUrl = "~/Unlock-icon.png";
				CourseCreditHoursInput.ReadOnly = true;
				CourseCreditHoursInput.BackColor = System.Drawing.Color.Blue;
				CourseCreditHoursInput.ForeColor = System.Drawing.Color.Yellow;
			}
			else
			{
				AcceptCourseCredits.ImageUrl = "~/thumbsup.png";
				CourseCreditHoursInput.ReadOnly = false;
				CourseCreditHoursInput.BackColor = System.Drawing.Color.White;
				CourseCreditHoursInput.ForeColor = System.Drawing.Color.Black;
			}
		}

		protected void VerifyDepartmentName(object sender, ImageClickEventArgs e)
		{
			if (AcceptDepartmentName.ImageUrl == "~/thumbsup.png")
			{
				AcceptDepartmentName.ImageUrl = "~/Unlock-icon.png";
				fullDepartmentInput.ReadOnly = true;
				fullDepartmentInput.BackColor = System.Drawing.Color.Blue;
				fullDepartmentInput.ForeColor = System.Drawing.Color.Yellow;
			}
			else
			{
				AcceptDepartmentName.ImageUrl = "~/thumbsup.png";
				fullDepartmentInput.ReadOnly = false;
				fullDepartmentInput.BackColor = System.Drawing.Color.White;
				fullDepartmentInput.ForeColor = System.Drawing.Color.Black;
			}
		}

		protected void VerifyInstructorFirst(object sender, ImageClickEventArgs e)
		{
			if (AcceptInstructorFirst.ImageUrl == "~/thumbsup.png")
			{
				AcceptInstructorFirst.ImageUrl = "~/Unlock-icon.png";
				InstructorFirstInput.ReadOnly = true;
				InstructorFirstInput.BackColor = System.Drawing.Color.Blue;
				InstructorFirstInput.ForeColor = System.Drawing.Color.Yellow;
			}
			else
			{
				AcceptInstructorFirst.ImageUrl = "~/thumbsup.png";
				InstructorFirstInput.ReadOnly = false;
				InstructorFirstInput.BackColor = System.Drawing.Color.White;
				InstructorFirstInput.ForeColor = System.Drawing.Color.Black;
			}
		}

		protected void VerifyCoordinatorFirst(object sender, ImageClickEventArgs e)
		{
			if (AcceptInstructorFirst.ImageUrl == "~/thumbsup.png")
			{
				AcceptInstructorFirst.ImageUrl = "~/Unlock-icon.png";
				InstructorFirstInput.ReadOnly = true;
				InstructorFirstInput.BackColor = System.Drawing.Color.Blue;
				InstructorFirstInput.ForeColor = System.Drawing.Color.Yellow;
			}
			else
			{
				AcceptInstructorFirst.ImageUrl = "~/thumbsup.png";
				InstructorFirstInput.ReadOnly = false;
				InstructorFirstInput.BackColor = System.Drawing.Color.White;
				InstructorFirstInput.ForeColor = System.Drawing.Color.Black;
			}
		}

		protected void VerifyInstructorLast(object sender, ImageClickEventArgs e)
		{
			if (AcceptCoordinatorLast.ImageUrl == "~/thumbsup.png")
			{
				AcceptCoordinatorLast.ImageUrl = "~/Unlock-icon.png";
				CourseCoordinatorLastInput.ReadOnly = true;
				CourseCoordinatorLastInput.BackColor = System.Drawing.Color.Blue;
				CourseCoordinatorLastInput.ForeColor = System.Drawing.Color.Yellow;
			}
			else
			{
				AcceptCoordinatorLast.ImageUrl = "~/thumbsup.png";
				CourseCoordinatorLastInput.ReadOnly = false;
				CourseCoordinatorLastInput.BackColor = System.Drawing.Color.White;
				CourseCoordinatorLastInput.ForeColor = System.Drawing.Color.Black;
			}
		}

		protected void VerifyCoordinatorLast(object sender, ImageClickEventArgs e)
		{
			if (AcceptCoordinatorLast.ImageUrl == "~/thumbsup.png")
			{
				AcceptCoordinatorLast.ImageUrl = "~/Unlock-icon.png";
				CourseCoordinatorLastInput.ReadOnly = true;
				CourseCoordinatorLastInput.BackColor = System.Drawing.Color.Blue;
				CourseCoordinatorLastInput.ForeColor = System.Drawing.Color.Yellow;
			}
			else
			{
				AcceptCoordinatorLast.ImageUrl = "~/thumbsup.png";
				CourseCoordinatorLastInput.ReadOnly = false;
				CourseCoordinatorLastInput.BackColor = System.Drawing.Color.White;
				CourseCoordinatorLastInput.ForeColor = System.Drawing.Color.Black;
			}
		}
	}
}