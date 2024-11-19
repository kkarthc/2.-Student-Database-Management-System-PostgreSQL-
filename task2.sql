-- Create the student_table
CREATE TABLE student_table (
    Student_id SERIAL PRIMARY KEY,      -- Unique identifier for each student
    Stu_name TEXT NOT NULL,             -- Student name
    Department TEXT NOT NULL,           -- Department of the student
    email_id TEXT,                      -- Email address
    Phone_no NUMERIC(15),               -- Phone number
    Address TEXT,                       -- Address of the student
    Date_of_birth DATE,                 -- Date of birth
    Gender TEXT CHECK (Gender IN ('Male', 'Female')), -- Gender
    Major TEXT,                         -- Major subject
    GPA NUMERIC(3, 2) CHECK (GPA >= 0 AND GPA <= 10), -- Grade Point Average
    Grade TEXT CHECK (Grade IN ('A', 'B', 'C', 'D', 'F')) -- Grade
);
-- Insert sample records into the student_table
INSERT INTO student_table (Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
('Karthick', 'Science', 'karthick@example.com', 1234567890, '123 Chennai', '2000-01-01', 'Male', 'Physics', 9.1, 'A'),
('Aishwarya', 'Engineering', 'aishwarya@example.com', 9876543210, '456 Adyar', '1998-05-15', 'Female', 'Mechanical', 7.2, 'B'),
('Athish Vikram', 'Arts', 'athish@example.com', 1122334455, '789 Perungudi', '1999-03-12', 'Male', 'History', 6.0, 'B'),
('Abdul', 'Engineering', 'abdul@example.com', 5566778899, '321 Kilpauk', '1997-07-21', 'Male', 'Civil', 5.8, 'C'),
('Shaji', 'Science', 'shaji@example.com', 9988776655, '654 Padur', '2001-02-10', 'Female', 'Biology', 8.5, 'A'),
('Rangaraj', 'Arts', 'rangaraj@example.com', 4433221100, '987 Anna Nagar', '1996-11-05', 'Male', 'Literature', 4.5, 'C'),
('Archana', 'Commerce', 'archana@example.com', 7766554433, '111 Mount Road', '2002-06-18', 'Female', 'Finance', 8.0, 'A'),
('Subash', 'Science', 'subash@example.com', 2233445566, '222 Parrys', '1995-04-25', 'Male', 'Chemistry', 5.0, 'B'),
('Sakthi', 'Commerce', 'sakthi@example.com', 3344556677, '333 Avadi', '2000-09-14', 'Male', 'Economics', 6.8, 'B'),
('Arun', 'Engineering', 'arun@example.com', 6677889900, '444 Ayanavaram', '1997-03-25', 'Male', 'Computer Science', 9.5, 'A');
-- Retrieve all student information sorted by grade in descending order
SELECT * 
FROM student_table
ORDER BY Grade DESC;
-- Retrieve information about all male students
SELECT * 
FROM student_table
WHERE Gender = 'Male';
-- Retrieve details of students with GPA < 5.0
SELECT * 
FROM student_table
WHERE GPA < 5.0;
-- Update email and grade for a specific student (e.g., Student_id = 3)
UPDATE student_table
SET email_id = 'updated_athish@example.com', GPA= 9.1, Grade = 'A'
WHERE Student_id = 3;
select * from student_table where student_id=3;
-- Retrieve names and ages of students with Grade "B"
SELECT 
    Stu_name, 
    DATE_PART('year', AGE(Date_of_birth)) AS Age
FROM 
    student_table
WHERE 
    Grade = 'B';
-- Group by Department and Gender, and calculate the average GPA
SELECT 
    Department, 
    Gender, 
    AVG(GPA) AS Average_GPA
FROM 
    student_table
GROUP BY 
    Department, Gender;
-- Rename the student_table to student_info
ALTER TABLE student_table
RENAME TO student_info;
select * from student_info;
-- Retrieve the name of the student with the highest GPA
SELECT 
    Stu_name 
FROM 
    student_info
WHERE 
    GPA = (SELECT MAX(GPA) FROM student_info);



