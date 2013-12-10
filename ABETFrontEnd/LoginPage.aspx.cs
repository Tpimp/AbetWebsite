using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ABETFrontEnd
{
	public partial class LoginPage : System.Web.UI.Page
	{
		SqlConnection conn = new SqlConnection("Data Source=DrSanchez;Initial Catalog=CSET_ABET_DB;Integrated Security=True");
		SqlCommand cmd;
		SqlDataReader sqlReader;

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void loginButton_Click(object sender, EventArgs e)
		{
			string username = usernameInput.Text;
			string password = passwordInput.Text;

			bool matched = false;

			conn.Open();
			cmd = new SqlCommand("SELECT * FROM users WHERE UserName='" + username + "'", conn);
			sqlReader = cmd.ExecuteReader();

			while (sqlReader.Read() && !matched)
			{
				string passCheck = sqlReader["Password"].ToString();
				if (passCheck == password)
					matched = true;
			}

			if (matched)
				Server.Transfer("~/VaporHome.aspx");

			conn.Close();

			//if (checkUserName(username) && checkPassword(password))
			//{
			//	Server.Transfer("~/VaporHome.aspx");
			//}
		}
	}
}