using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ABETFrontEnd
{
	public class Textbook
	{

		#region Properties and Members
		private List<string> authorLName;
		private List<string> authorFName;
		string textbookToParse;

		private string textbookTitle;
		public string TextbookTitle
		{
			get { return textbookTitle; }
			set { textbookTitle = value; }
		}

		private string publishDate;
		public string PublishDate
		{
			get { return publishDate; }
			set { publishDate = value; }
		}

		private string isbnNumber;
		public string ISBNNumber
		{
			get { return isbnNumber; }
			set { isbnNumber = value; }
		}

		public List<string> getLastNames()
		{
			return authorLName;
		}

		public List<string> getFirstNames()
		{
			return authorFName;
		}
		#endregion

		public Textbook(string textbookText)
		{
			textbookToParse = textbookText;
		}

		public void ParseTextbooks(string textbookText)
		{
		}
	}
}