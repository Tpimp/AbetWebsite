using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace ABETFrontEnd
{
	public partial class DatabaseGridviewPage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		}

        protected void TableNameDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            updateCurrentTableGrid();
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
        protected void updateCurrentTableGrid()
        {
            //TableNameDropDown.DataValueField;
            String select_statement = ("SELECT * FROM " + TableNameDropDown.Text);
            DataSet data = new DataSet();
            SqlConnection conn = new SqlConnection(
                System.Configuration.ConfigurationManager.
                ConnectionStrings["CSET_ABET_DBConnectionString"].ConnectionString);
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(select_statement, conn);
            adapter.Fill(data, TableNameDropDown.Text);
            int count = data.Tables.Count;
            conn.Close();
            TableDataGrid.Caption = TableNameDropDown.Text + " Table";
            TableDataGrid.DataSource = data;
            TableDataGrid.DataBind();
        }

        protected void TableNameDropDown_DataBound(object sender, EventArgs e)
        {
            TableNameDropDown.SelectedIndex = 0;
            updateCurrentTableGrid();
        }
	}
}