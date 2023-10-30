CREATE DATABASE EventsManagement;
CREATE TABLE Events (
       Event_Id SERIAL PRIMARY KEY,
       Event_Name TEXT,
       Event_Date DATE,
       Event_Location TEXT,
       Event_Description TEXT
   );

CREATE TABLE Attendees (
       Attendee_Id SERIAL PRIMARY KEY,
       Attendee_Name TEXT,
       Attendee_Phone TEXT,
       Attendee_Email TEXT,
       Attendee_City TEXT
   );

CREATE TABLE Registrations (
       Registration_id SERIAL PRIMARY KEY,
       Event_Id INT,
       Attendee_Id INT,
       Registration_Date DATE,
       Registration_Amount NUMERIC,
       FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
       FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
   );
INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
   VALUES ('Birthday Party', '2023-11-01', 'Erode', '1st Birthday of Sathvik'), 
('Marriage', '2024-06-09', 'Vadalur', 'Wedding of G&A'), 
('Engagement', '2023-09-09', 'Chennai', 'Engagement of R&V');

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
   VALUES ('Arthi', '8072322366', 'arthi@gmail.com', 'Coimbatore'),
('Gowtham', '9629255542', 'gowtham@gmail.com', 'Erode'),
('Santhosh', '8825417368', 'santhosh@gmail.com', 'Chennai');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
   VALUES (1, 1, '2024-06-09', 150.00),
(2, 2, '2023-11-01', 50.00),
(3, 3, '2023-09-09', 70.00);

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
   VALUES ('Ceremony', '2023-12-15', 'Banaglore', 'Naming Ceremony');
   
UPDATE Events
SET Event_Name = 'Ear-piercing', Event_Location = 'Salem'
WHERE Event_Id = 3;
  
DELETE FROM Events
WHERE Event_Location = 'Chennai';
  

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
   VALUES ('Dili', '7019023456', 'dili@gmail.com', 'Banaglore');
  
INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
   VALUES (4, 4, '2023-02-10', 75.00);
  
SELECT * FROM Events;
 
SELECT Attendees.*
   FROM Attendees
   JOIN Registrations ON Attendees.Attendee_Id = Registrations.Attendee_Id
   WHERE Registrations.Event_Id = 3;

SELECT Events.Event_Name, COUNT(Registrations.Attendee_Id) AS Total_Attendees
FROM Events
LEFT JOIN Registrations ON Events.Event_Id = Registrations.Event_Id
WHERE Events.Event_Id = 1
GROUP BY Events.Event_Id;
