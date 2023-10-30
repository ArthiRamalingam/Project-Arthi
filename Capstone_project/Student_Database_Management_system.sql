
CREATE TABLE student_table (Student_id SERIAL PRIMARY KEY, Stu_name TEXT, Department TEXT, email_id TEXT, Phone_no NUMERIC, Address TEXT, Date_of_birth DATE, Gender TEXT, Major TEXT, GPA NUMERIC, Grade TEXT );

INSERT INTO student_table (Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade) VALUES 

('Jagadeesh', 'Computer Science', 'jaga@gmail.com', 9087654678, '123 Chennai', '1999-06-30', 'Male', 'Computer Science', 8, 'O'), 
('Gowtham', 'Science', 'gowtham@gmail.com', 9929255542, 'Erode', '1997-11-20', 'Male', 'Bio-Science', 8.5, 'O'), 
('Dilip', 'English', 'dili@gmail.com', 7019055467, 'Hosur Main Road', '1999-07-19', 'Male', 'English', 7.5, 'A'), 
('Prasanna', 'MBA', 'chinna@gmail.com', 9965432780, 'Rajiv St, Trichy', '1990-01-15', 'Male', 'Computer Science', 6.5, 'B'), 
('Harshi', 'Computer Science', 'dino@gmail.com', 9876326761, '123 Main St', '2001-06-13', 'Female', 'Computer Science', 6.5, 'B'), 
('Santhosh', 'Science', 'santhosh@gmail.com', 8825417368, '175 B NCV nagar', '2002-06-26', 'Male', 'Bio-Science', 7.5, 'A'), 
('Ram', 'Computer Science', 'ram@gmail.com', 9876512346, '12B 7G Rainbow Colony', '1980-08-25', 'Male', 'Computer Science', 6.5, 'B'), 
('Vasanth', 'Computer Science', 'vasanth@reddifmail.com', 8877996655, '15E Dubai Main Road', '1978-03-07', 'Male', 'Computer Science', 3.5, 'C'), 
('Nithya', 'English', 'nithya@gmail.com', 9812467309, '12/255 A Atman Street', '1988-03-19', 'Female', 'Computer Science', 4.5, 'C'), 
('Manalan', 'Computer Science', 'manalan@yahoo.com', 8976897654, '12 Ragava Street', '1990-01-23', 'Male', 'Computer Science', 5, 'B');

SELECT * FROM student_table ORDER BY Grade DESC;
SELECT * FROM student_table WHERE Gender = 'Male';
SELECT * FROM student_table WHERE GPA < 5.0;
UPDATE student_table SET email_id = 'manalan1996@gmail.com', Grade = 'A'
WHERE Student_id = 10;

SELECT Stu_name, AGE(Date_of_birth) AS Age FROM student_table
WHERE Grade = 'B';

SELECT Department, Gender, AVG(GPA) AS Average_GPA FROM student_table
GROUP BY Department, Gender;

ALTER TABLE student_table RENAME TO student_info;

SELECT Stu_name FROM student_info WHERE GPA = (SELECT MAX(GPA) FROM student_info);
