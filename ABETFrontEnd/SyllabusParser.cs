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

		//choppable version of text
		private string strippedText;

		private string syllabusDeptAbbr;
		public string SyllabusDepartmentAbbreviation
		{
			get { return syllabusDeptAbbr; }
			set { syllabusDeptAbbr = value; }
		}

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
		public int LectureHours
		{
			get { return lectureHours; }
			set { lectureHours = value; }
		}

		private int labHours;
		public int LabHours
		{
			get { return labHours; }
			set { labHours = value; }
		}

		private int creditHours;
		public int CreditHours
		{
			get { return creditHours; }
			set { creditHours = value; }
		}

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
			int headerCharCount = 0;

			int lectureHoursIndex = 0;
			int labHoursIndex = 0;
			int creditHoursIndex = 0;

			bool courseNumberGrabbed = false;
			bool courseNameGrabbed = false;

			//count of newlines to find course number/name line
			int newlineCount = 0;

			//flag to prepare to finish header count loop
			bool headerTripFlag = false;
			//flag to end header count loop
			bool headerFinishedFlag = false;

			//header count loop
			for (int i = 0; i < syllabusText.Length && !headerFinishedFlag; i++)
			{
				if (')' == syllabusText[i])
				{
					headerFinishedFlag = true;
				}

				if ('(' == syllabusText[i])
				{
					//we now know where the follow index's values are
					lectureHoursIndex = i + 1;
					labHoursIndex = lectureHoursIndex + 2;
					creditHoursIndex = labHoursIndex + 2;

					lectureHours = Int32.Parse(syllabusText[lectureHoursIndex].ToString());
					labHours = Int32.Parse(syllabusText[labHoursIndex].ToString());
					creditHours = Int32.Parse(syllabusText[creditHoursIndex].ToString());
				}

				//after 3 newline symbols, the course is described
				if ('\r' == syllabusText[i])
					newlineCount++;

				//the newline count has been tripped
				if (newlineCount == 3 && !courseNameGrabbed)
				{
					bool done = false;

					//after 2 spaces the course name starts
					//the course number contains a space
					int spaceCount = 0;

					//text counters
					int j = i + 1;
					int desiredStart = i + 1;
					int desiredEnd = 0;

					while (!done)
					{
						if (syllabusText[j] == ' ')
						{
							spaceCount++;
						}
						if (spaceCount == 2 && !courseNumberGrabbed)
						{
							desiredEnd = j;
							syllabusCourseNumber = syllabusText.Substring(desiredStart, (desiredEnd - desiredStart));
							syllabusDeptAbbr = syllabusCourseNumber.Substring(0, 3);
							syllabusCourseNumber = syllabusCourseNumber.Substring(4, 3);
							desiredStart = desiredEnd + 1;
							courseNumberGrabbed = true;
						}
						if (syllabusText[j] == '\r' && !courseNameGrabbed)
						{
							desiredEnd = j;
							syllabusCourseName = syllabusText.Substring(desiredStart, (desiredEnd - desiredStart));
							done = true;
							courseNameGrabbed = true;
						}
						j++;
					}
				}

				headerCharCount = i;
			}
			headerTripFlag = false;
			headerFinishedFlag = false;

			//add 3 to account for newlines before instructor category
			strippedText = syllabusText.Remove(0, headerCharCount + 3);
		}

		public string getCurrentText()
		{
			return strippedText;
		}

		//returns all text related to instructors
		public void parseInstructor()
		{
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