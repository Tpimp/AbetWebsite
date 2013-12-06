using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ABETFrontEnd
{
	public class Requisite
	{
		//default to CoRequisite
		private bool preReqFlag = false;

		private string requisiteTextBody;

		private string reqType;
		public string ReqType
		{
			get { return reqType; }
			set { reqType = value; }
		}

		public void setReqType(bool coReq)
		{
			if (coReq == true)
			{
				reqType = "Corequisite";
			}
			else if (coReq == false)
			{
				reqType = "Prerequisite";
			}
		}

		private string courseNumber;
		public string CourseNumber
		{
			get { return courseNumber; }
			set { courseNumber = value; }
		}

		private string courseName;
		public string CourseName
		{
			get { return courseName; }
			set { courseName = value; }
		}

		private string courseComment;
		public string CourseComment
		{
			get { return courseComment; }
			set { courseComment = value; }
		}

		public Requisite(string requisiteText)
		{
			requisiteTextBody = requisiteText;
		}

		public void ParseRequisites()
		{
		}
	}
}