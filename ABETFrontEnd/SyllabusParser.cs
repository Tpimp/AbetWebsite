using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ABETFrontEnd
{
	public class SyllabusParser
	{
		//plain text of word doc
		private string unalteredText;
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

		//private List<Textbook> textbookList;
		private List<string> authorLName;
		public List<string> getAuthorLNameList()
		{ return authorLName; }

		private List<string> authorFName;
		public List<string> getAuthorFNameList()
		{ return authorFName; }

		private string textbookTitle;
		public string TextbookTitle
		{
			get { return textbookTitle; }
			set { textbookTitle = value; }
		}

		private string publisher;
		public string Publisher
		{
			get { return publisher; }
			set { publisher = value; }
		}

		//will need parsed by inputBox into Date form of what information exists
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

		private string descriptionText;
		public string DescriptionText
		{
			get { return descriptionText; }
			set { descriptionText = value; }
		}

		//private List<Requisite> requisiteList;
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

		private string requisiteDeptAbbr;
		public string RequisiteDeptAbbr
		{
			get { return requisiteDeptAbbr; }
			set { requisiteDeptAbbr = value; }
		}

		private string requisiteCourseNumber;
		public string RequisiteCourseNumber
		{
			get { return requisiteCourseNumber; }
			set { requisiteCourseNumber = value; }
		}

		private string requisiteCourseName;
		public string RequisiteCourseName
		{
			get { return requisiteCourseName; }
			set { requisiteCourseName = value; }
		}

		private string requisiteCourseComment;
		public string RequisiteCourseComment
		{
			get { return requisiteCourseComment; }
			set { requisiteCourseComment = value; }
		}


		//private CourseDegree degreeApplication;
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
		
		private List<string> courseGoals;
		private List<int> bsSLOList;
		private List<int> aeSLOList;
		private List<string> courseTopics;


		public SyllabusParser(string syllabusPlainText)
		{
			syllabusText = syllabusPlainText;
			unalteredText = syllabusPlainText;
			syllabusTextLength = syllabusPlainText.Length;

			authorFName = new List<string>();
			authorLName = new List<string>();
			courseGoals = new List<string>();
			bsSLOList = new List<int>();
			aeSLOList = new List<int>();
			courseTopics = new List<string>();


			stripToInstructor();
			parseInstructor();
			parseTextbook();
			parseDescription();
            parseRequisites();
			//complete up to here

			//need to call the remaining functions
			//in the order they are defined down the class def
			//parseRequisites();


		}
		/*******************************************************
		*	returns all fields found in header of syllabus
		*	(not in order) Department Name, Department Abbreviation,
		*	course name, course number, and lab, lecture and credit hours
		********************************************************/
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
			syllabusText = getCurrentText();

			//count of text to remove from string being parsed
			int instructorCharCount = 0;

			//critical loop flags
			bool instructorFound = false;
			bool coordinatorFound = false;
			bool firstNameFlag = true;

			//character indexers
			int i = 0;
			int j = 0;

			//always the same across every syllabus
			int instructorTagLength = 11;
			int coordinatorTagLength = 19;
					
			//jump the first tag
			i = instructorTagLength;

			int loopCount = 0;

			while (syllabusText[i] != '\r' && syllabusText[i] != '\v')
			{
				if (!instructorFound)
				{
					if (syllabusText[i] == ' ' || syllabusText[i] == '\t')
					{
						if (syllabusText[i+1] == ' ' || syllabusText[i+1] == '\t')
						{
							if (syllabusText[i+2] == ' ' || syllabusText[i+2] == '\t')
							{
								if (syllabusText[i+3] == ' ' || syllabusText[i+3] == '\t')
								{
									instructorFound = true;
									courseInstructorFName = "";
									courseInstructorLName = "";
								}
							}
						}
					}
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
								else if (!firstNameFlag)
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
				if (!instructorFound || !coordinatorFound)
					i++;
			}
			//index [i] now == '\r' (word newline)
			//set instructorCharCount to [i] + 1 and strip instructor line
			instructorCharCount = i + 1;

			strippedText = syllabusText.Remove(0, instructorCharCount);
		}

		public void parseTextbook()
		{
			//reset syllabusText index to 0
			syllabusText = getCurrentText();

			//tagLength same across all syllabai
			int textbookTagLength = 9;


			//holds author names, etc, before moving to actual holder
			string buffer = "";
			
			//for scoping reasons, index defined external to the loop
			int index = 0;

			//jump index to author names
			index = textbookTagLength + 2;

			while (syllabusText[index] != ',')
			{
				if (syllabusText[index] != ',')
					buffer += syllabusText[index];
				index++;
			}
			authorLName.Add(buffer);
			buffer = "";
			index += 2;
			while (syllabusText[index] != ' ')
			{
				if (syllabusText[index] != ' ' && syllabusText[index] != '.')
					buffer += syllabusText[index];
				index++;
			}
			authorFName.Add(buffer);
			buffer = "";
			index += 5;
			string doubleAuthorChecker = syllabusText.Substring(index - 4, (index - 1) - (index - 4));
			if (doubleAuthorChecker == "and")
			{
				while (syllabusText[index] != ' ')
				{
					if (syllabusText[index] != ' ')
						buffer += syllabusText[index];
					index++;
				}
				authorFName.Add(buffer);
				buffer = "";
				index += 1;
				while (syllabusText[index] != '.')
				{
					if (syllabusText[index] != '.')
						buffer += syllabusText[index];
					index++;
				}
				authorLName.Add(buffer);
				buffer = "";
				index += 2;
			}
			else//reverse the index increase during check for multi-author
				index -= 5;
			if (syllabusText[index] == ' ')
				index++;
			while (syllabusText[index] != '.')
			{
				if (syllabusText[index] != '.')
					buffer += syllabusText[index];
				index++;
			}
			textbookTitle = buffer;
			buffer = "";
			index += 2;
			if (syllabusText[index] == ' ')
				index++;
			while (syllabusText[index] != ',' && syllabusText[index] != '.')
			{
				if (syllabusText[index] != ',' && syllabusText[index] != '.')
					buffer += syllabusText[index];
				index++;
			}
			publisher = buffer;
			buffer = "";
			index += 2;
			if (syllabusText[index] == ' ') 
				index++;
			while (syllabusText[index] != '.')
			{
				if (syllabusText[index] != '.')
					buffer += syllabusText[index];
				index++;
			}
			publishDate = buffer;
			if (publishDate[0] == '3')
				publishDate = "";
			buffer = "";
			index += 8;
			string checkForISBN = syllabusText.Substring(index - 6, (index - 2) - (index - 6));
			if (checkForISBN == "ISBN")
			{
				while (syllabusText[index] != '\r')
				{
					if (syllabusText[index] != '\r')
						buffer += syllabusText[index];
					index++;
				}
				isbnNumber = buffer;
				buffer = "";
				index++;
			}
			else
			{
				isbnNumber = "";
				index -= 5;
			}
			if (syllabusText[index] == '\r')
			{
				while (syllabusText[index] == '\r')
				{
					index++;
				}
			}
			strippedText = syllabusText.Remove(0, index);
		}

		public void parseDescription()
		{
			//reset syllabusText index to 0
			syllabusText = getCurrentText();

			int index = 0;
			//loop to start up description text
			while (syllabusText[index] != '\r' && syllabusText[index] != '\v')
			{
				index++;
			}
			//loop to end of description text
			if (syllabusText[index] == '\r')
			{
				while (syllabusText[index] == '\r')
				{
					index++;
				}
			}
			while (syllabusText[index] != '\r')
			{
				descriptionText += syllabusText[index];
				index++;
			}
			if (syllabusText[index] == '\r')
			{
				while (syllabusText[index] == '\r')
				{
					index++;
				}
			}

			strippedText = syllabusText.Remove(0, index);
		}

		/****************************************************
		**	on function start, you want to take stock of syllabusText
		**  and strippedText. to remove the stuff you already parsed and
		**	reset the index to 0, call getCurrentText on syllabusText
		**	unmodified version of syllabus text is in unalteredText
		**	for the current architecture, strippedText = syllabusText.Remove(0, index);
		**	is key at the end of each function. index can be whatever your counter is
		**	at the end of the set for parsing. i have been stripping out all remaining
		**	whitespace to next category as well
		**	white space symbols:
		**	'\r'	'\v'	'\t'	'\n'
		** CR		VT		HT		NL
		** 
		*****************************************************/

		public void parseRequisites()
		{
			//reset syllabusText index to 0
			syllabusText = getCurrentText();

			int index = 0;

            string tag_buffer = "";

            while (syllabusText[index] != ':') { tag_buffer += syllabusText[index++]; }
            if (tag_buffer.Contains("Prequisite"))
            {
                tag_buffer = "";
            }

			strippedText = syllabusText.Remove(0, index);
		}

		private bool requisiteParseHelper(Queue<char> charSetToCheck, string key)
		{
			bool matched = false;
			string buffer = "";//ensure empty buffer string
			while (charSetToCheck.Count > 0)
			{
				buffer += charSetToCheck.Dequeue();
			}
			if (buffer == key)
				matched = true;
			//else not a match, default false

			//requeue buffer
			for (int i = 0; i < buffer.Length; i++)
			{
				charSetToCheck.Enqueue(buffer[i]);
			}
			buffer = "";

			return matched;
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