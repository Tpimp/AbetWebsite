using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ABETFrontEnd
{
	public class CourseDegree
	{
		private string requiredTextBody;

		private string requiredDegree;
		public string RequiredDegree
		{
			get { return requiredDegree; }
			set { requiredDegree = value; }
		}

		private string electiveDegree;
		public string ElectiveDegree
		{
			get { return electiveDegree; }
			set { electiveDegree = value; }
		}

		public CourseDegree(string requiredText)
		{
			requiredTextBody = requiredText;
		}

		public void ParseRequired()
		{
		}
	}
}