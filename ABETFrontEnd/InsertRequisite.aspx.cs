using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace ABETFrontEnd
{
    public partial class InsertRequisite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RequisiteTypes_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void InsertNewRequisite(object sender, EventArgs e)
        {
            string reqtype;
            string reqcomment;
            string department = "";
            string deptabbr = "";
            string coursenum = "";
            string coursetitle = "";
            if(ReqTypeTextBox.Text.Count() <= 0)
            {
                reqtype = ReqType.Text;
            }
            else
            {
                reqtype = ReqTypeTextBox.Text;
            }
            if(ReqCommentInput.Text.Count() <= 0)
            {
                reqcomment = ReqCommentBox.Text;
            }
            else
            {
                reqcomment = ReqCommentInput.Text.Replace("'","\"");
            }
            if (SelectCourseLink.Checked)
            {
                string coursetext = CourseInput.Text;
                string[] str_list = coursetext.Split(' ');
                deptabbr = str_list[0];
                coursenum = str_list[1];
                for(int index = 2; index < str_list.Count(); index++)
                {
                    coursetitle += str_list[index] + ' ';
                }
                coursetitle.Remove(coursenum.Length - 1);
            }
            
            String insert_statement = ("EXEC sp_IOrFRequisite '" + department + "', '"+ deptabbr + "', '" + coursenum + "', '" +  reqtype + "', '" + reqcomment + "';");
            SqlConnection conn = new SqlConnection(
                System.Configuration.ConfigurationManager.
                ConnectionStrings["CSET_ABET_DBConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand command = new SqlCommand(insert_statement, conn);
            int @reqID = command.ExecuteNonQuery();
            conn.Close();
            ReqType.DataBind();
            ReqCommentBox.DataBind();
            ReqTypeTextBox.Text = "";
            ReqCommentInput.Text = "";
        }
        
    }
}