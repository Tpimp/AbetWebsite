using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABETFrontEnd
{
	public partial class LoginPage : System.Web.UI.Page
	{
		List<string> userList = new List<string>();
		List<string> passwordList = new List<string>();


		protected void Page_Load(object sender, EventArgs e)
		{
			userList.Add("breedlot");
			userList.Add("sanchezj");
			userList.Add("deanc");
			userList.Add("lindberga");
			userList.Add("admin");
			userList.Add("guest");

			passwordList.Add("breedlot");
			passwordList.Add("sanchezj");
			passwordList.Add("deanc");
			passwordList.Add("lindberga");
			passwordList.Add("admin");
			passwordList.Add("guest");

		}

		protected void loginButton_Click(object sender, EventArgs e)
		{
			string username = usernameInput.Text;
			string password = passwordInput.Text;

			if (checkUserName(username) && checkPassword(password))
			{
				Server.Transfer("~/VaporHome.aspx");
			}
		}

		private bool checkUserName(string username)
		{
			bool granted = false;

			for (int i = 0; i < userList.Count && !granted; i++)
			{
				if (username == userList[i])
					granted = true;
			}

			return granted;
		}

		private bool checkPassword(string password)
		{
			bool granted = false;

			for (int i = 0; i < passwordList.Count && !granted; i++)
			{
				if (password == passwordList[i])
					granted = true;
			}

			return granted;
		}
	}
}