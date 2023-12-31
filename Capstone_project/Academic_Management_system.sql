CREATE TABLE Studentinfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME VARCHAR(255),
    DOB DATE,
    PHONE_NO VARCHAR(15),
    EMAIL_ID VARCHAR(255),
    ADDRESS VARCHAR(255)
);
CREATE TABLE Coursesinfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(255),
    COURSE_INSTRUCTOR_NAME VARCHAR(255)
);
CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLL_STATUS VARCHAR(20),
    FOREIGN KEY (STU_ID) REFERENCES Studentinfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES Coursesinfo(COURSE_ID)
);
INSERT INTO Studentinfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS)
VALUES
    (1, 'Preetha', '1997-11-24', '9876543210', 'pretha@gmail.com', '1st Street sai homes'),
    (2, 'Sriram', '1999-03-20', '9765432876', 'sriram@gmail.com', '4 Perambur');
INSERT INTO Coursesinfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES
    (101, 'Math 101', 'Prof. Prakash'),
    (102, 'History 201', 'Prof. Antony');
INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS)
VALUES
    (1, 1, 101, 'Enrolled'),
    (2, 1, 102, 'Not Enrolled'),
    (3, 2, 101, 'Enrolled');
SELECT S.STU_NAME, S.PHONE_NO, S.EMAIL_ID, E.ENROLL_STATUS FROM Studentinfo S JOIN EnrollmentInfo E on S.STU_ID = E.STU_ID;

SELECT C.COURSE_NAME FROM Coursesinfo C JOIN EnrollmentInfo E on C.COURSE_ID = E.COURSE_ID WHERE E.STU_ID =1;

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME FROM Coursesinfo;

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME FROM Coursesinfo WHERE COURSE_ID = 101;

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME FROM Coursesinfo WHERE COURSE_ID IN (101,102);

SELECT * FROM Studentinfo;

SELECT C.COURSE_NAME, COUNT(E.STU_ID) AS Num_students FROM Coursesinfo C LEFT JOIN EnrollmentInfo E ON C.COURSE_ID = E.COURSE_ID GROUP BY C.COURSE_NAME;

SELECT S.STU_NAME FROM Studentinfo S JOIN EnrollmentInfo E ON S.STU_ID = E.STU_ID WHERE E.COURSE_ID = 101;

SELECT C.COURSE_INSTRUCTOR_NAME, COUNT(E.STU_ID) AS Num_Students
FROM Coursesinfo C
LEFT JOIN EnrollmentInfo E ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_INSTRUCTOR_NAME;

SELECT S.STU_NAME
FROM Studentinfo S
JOIN EnrollmentInfo E ON S.STU_ID = E.STU_ID
GROUP BY S.STU_NAME
HAVING COUNT(DISTINCT E.COURSE_ID) > 1;

SELECT C.COURSE_NAME, COUNT(E.STU_ID) AS Num_Students
FROM Coursesinfo C
LEFT JOIN EnrollmentInfo E ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME
ORDER BY Num_Students DESC;
