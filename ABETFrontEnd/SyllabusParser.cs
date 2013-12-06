using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ABETFrontEnd
{
	public class SyllabusParser
	{
		//plain text of word doc
		private string syllabusText;
		//length in chars of word doc
		private int syllabusTextLength;

		private string syllabusCourseNumber;
		public string SyllabusCourseNumber
		{
			get { return syllabusCourseNumber; }
			set { syllabusCourseNumber = value; }
		}

		private string syllabusCourseName;
		public string SyllabusCourseName
		{
			get { return syllabusCourseName; }
			set { syllabusCourseName = value; }
		}

		private int lectureHours;
		private int labHours;
		private int creditHours;

		private List<string> courseInstructorList;
		private string courseCoordinator;
		private List<Textbook> textbookList;
		private string descriptionText;
		private List<Requisite> requisiteList;
		private CourseDegree degreeApplication;
		private List<string> courseGoals;
		private List<int> bsSLOList;
		private List<int> aeSLOList;
		private List<string> courseTopics;


		public SyllabusParser(string syllabusPlainText)
		{
			syllabusText = syllabusPlainText;
			syllabusTextLength = syllabusPlainText.Length;


			stripToInstructor();
		}

		public void stripToInstructor()
		{
			string strippedText;
			int headerCharCount = 0;

			int lectureHoursIndex = 0;
			int labHoursIndex = 0;
			int creditHoursIndex = 0;

			//flag to prepare to finish header count loop
			bool headerTripFlag = false;
			//flag to end header count loop
			bool headerFinishedFlag = false;

			//header count loop
			for (int i = 0; i < syllabusText.Length && !headerFinishedFlag; i++)
			{
				//header is tripped, looking for closing parenthesis
				if (headerTripFlag)
				{
					if (i == lectureHoursIndex)
					{
						lectureHours = syllabusText[lectureHoursIndex];
					}
					if (i == labHoursIndex)
					{
						labHours = syllabusText[labHoursIndex];
					}
					if (i == creditHoursIndex)
					{
						creditHours = syllabusText[creditHoursIndex];
					}
					if (')' == syllabusText[i])
					{
						headerFinishedFlag = true;
					}
				}

				//header gets tripped
				if ('(' == syllabusText[i])
				{
					headerTripFlag = true;
					lectureHoursIndex = i + 1;
					labHoursIndex = lectureHoursIndex + 2;
					creditHoursIndex = labHoursIndex + 2;
				}

				headerCharCount = i;
			}
			headerTripFlag = false;
			headerFinishedFlag = false;

			strippedText = syllabusText.Remove(0, headerCharCount);
		}

		//returns all text related to instructors
		public string parseInstructor()
		{
			return "";
		}

		public void parseTextbook()
		{
		}

		public void parseRequisites()
		{
		}

		public void parseRequiredFor()
		{
		}

		public void parseCourseGoals()
		{
		}

		public void ParseSLOs()
		{
		}

		public void parseTopicsCovered()
		{
		}
	}
}