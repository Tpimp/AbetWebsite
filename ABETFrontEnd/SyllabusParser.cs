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

		private string syllabusDepartment;
		public string SyllabusDepartment
		{
			get { return syllabusDepartment; }
			set { syllabusDepartment = value; }
		}

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

		private string courseInstructor;

		private string courseInstructorFName;
		public string CourseInstructorFName
		{
			get { return courseInstructorFName; }
			set { courseInstructorFName = value; }
		}

		private string courseInstructorLName;
		public string CourseInstructorLName
		{
			get { return courseInstructorLName; }
			set { courseInstructorLName = value; }
		}

		private string courseCoordinator;

		private string courseCoordinatorFName;
		public string CourseCoordinatorFName
		{
			get { return courseCoordinatorFName; }
			set { courseCoordinatorFName = value; }
		}

		private string courseCoordinatorLName;
		public string CourseCoordinatorLName
		{
			get { return courseCoordinatorLName; }
			set { courseCoordinatorLName = value; }
		}

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
			parseInstructor();
		}

		public void stripToInstructor()
		{
			int headerCharCount = 0;

			int lectureHoursIndex = 0;
			int labHoursIndex = 0;
			int creditHoursIndex = 0;

			//flags to block conditional statements
			bool courseNumberGrabbed = false;
			bool courseNameGrabbed = false;
			bool departmentDone = false;

			//count of newlines to find course number/name line
			int newlineCount = 0;

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

				if (newlineCount == 1 && !departmentDone)
				{
					int k = i + 1;
					int start = k;
					int end = 0;

					while (!departmentDone)
					{
						if (syllabusText[k] == '\r')
						{
							end = k;
							syllabusDepartment = syllabusText.Substring(start, (end - start));
							departmentDone = true;
						}
						k++;
					}
				}

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
			//syllabusText has been stripped an can be re-indexed at 0
			//reset the syllabusText to current text remaining
			//to allow chopping of strippedText
			syllabusText = strippedText;

			//count of text to remove from string being parsed
			int instructorCharCount = 0;

			//parse delimiter counter
			int colonCount = 0;

			//critical loop flags
			bool instructorFound = false;
			bool implicitInstructor = false;
			bool coordinatorFound = false;
			bool counting = false;
			bool firstNameFlag = true;

			//lengths
			int instructorNameLength = 0;
			int coordinatorNameLength = 0;

			//character indexers
			int i = 0;
			int j = 0;
			int instructorNameStart = 0;
			int instructorNameEnd = 0;

			//always the same across every syllabus
			int instructorTagLength = 11;
			int coordinatorTagLength = 19;
					
			i = instructorTagLength;

			while (syllabusText[i] != '\r')
			{
				if (!instructorFound)
				{
					//loop over the gap between instructorTag and name
					if (syllabusText[i] != ' ' && syllabusText[i] != '\t')
					{//looping until name found
						while (!instructorFound)
						{
							if (syllabusText[i] == ' ' || syllabusText[i] == '\t')
							{//done looking at first name
								if (firstNameFlag)
								{
									firstNameFlag = false;
									//jump the space
									i++;
								}
								else
								{//we found the space following last name
									instructorFound = true;
								}
							}
							if (firstNameFlag && (syllabusText[i] != ' ' && syllabusText[i] != '\t'))
							{//append first name char by char
								courseInstructorFName += syllabusText[i];
							}
							else if (!firstNameFlag && (syllabusText[i] != ' ' && syllabusText[i] != '\t'))
							{//append last name char by char
								courseInstructorLName += syllabusText[i];
							}
							i++;
						}
					}
					if (instructorFound)
					{
						//reset first name flag for coordinator loop
						firstNameFlag = true;
						//loop i to the beginning of the coordinator tag
						while (syllabusText[i] == ' ' || syllabusText[i] == '\t')
						{	i++; }
						//then jump to end of coordinator tag
						i += coordinatorTagLength;
					}
				}
				else if (instructorFound)
				{
					//loop over the gap between coordinatorTag and name
					if (syllabusText[i] != ' ' && syllabusText[i] != '\t')
					{//looping until name found
						while (!coordinatorFound)
						{
							if (syllabusText[i] == ' ' || syllabusText[i] == '\r' || syllabusText[i] == '\v')
							{//done looking at first name
								if (firstNameFlag)
								{
									firstNameFlag = false;
									//jump the space
									i++;
								}
								else
								{//we found the space following last name
									coordinatorFound = true;
								}
							}
							if (firstNameFlag)
							{//append first name char by char
								courseCoordinatorFName += syllabusText[i];
							}
							else if (!firstNameFlag && syllabusText[i] != '\r' && syllabusText[i] != '\v')
							{//append last name char by char
								courseCoordinatorLName += syllabusText[i];
							}
							i++;
						}
					}
				}
				i++;
			}
			//index [i] now == '\r' (word newline)
			//set instructorCharCount to [i] + 1 and strip instructor line
			instructorCharCount = i + 1;

			strippedText = syllabusText.Remove(0, instructorCharCount);
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