using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ABETFrontEnd
{
	public partial class ManageUsers : System.Web.UI.Page
	{
		SqlConnection conn = new SqlConnection("Data Source=DrSanchez;Initial Catalog=CSET_ABET_DB;Integrated Security=True");
		SqlCommand cmd;
		SqlDataReader sqlReader;
		
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void AddButton_Click(object sender, EventArgs e)
		{
			string newUsername = "";
			string newPassword = "";

			if (userTextbox.Text != "" && passwordTextbox.Text != "")
			{
				newUsername = userTextbox.Text;
				newPassword = passwordTextbox.Text;

				userTextbox.Text = "";
				passwordTextbox.Text = "";

				cmd = new SqlCommand("INSERT INTO users VALUES (@username, @password)", conn);

				conn.Open();

				cmd.Parameters.AddWithValue("@username", newUsername);
				cmd.Parameters.AddWithValue("@password", newPassword);

				cmd.ExecuteNonQuery();

				conn.Close();
			}

			UserGridView.DataBind();
		}

		protected void RemoveButton_Click(object sender, EventArgs e)
		{
			string findUsername = "";

			if (userTextbox0.Text != "")
			{
				findUsername = userTextbox0.Text;

				userTextbox0.Text = "";

				cmd = new SqlCommand("DELETE users WHERE UserName=@username", conn);

				conn.Open();

				cmd.Parameters.AddWithValue("@username", findUsername);

				cmd.ExecuteNonQuery();

				conn.Close();

			}

			UserGridView.DataBind();

		}

	}
}