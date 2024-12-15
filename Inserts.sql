-- Persons
INSERT INTO Person (Person_ID, Peron_Name, Surname, Birth_date, Pesel, Nationality, Physical_address, Phone_number)
VALUES
    (1, 'John', 'Smith', '1980-01-01', 12345678901, 'Polish', 'Konrada Leczkowa 18, 80-432 Gdañsk', '+48123456789'),
    (2, 'Anna', 'Nowak', '1990-02-02', 23456789012, 'Polish', 'Szeroka 10, 80-835 Gdañsk', '+48234567890'),
    (3, 'Piotr', 'Kowalski', '1975-03-03', 34567890123, 'Polish', 'Chrobrego 2, 84-230 Rumia', '+48345678901'),
    (4, 'Kasia', 'Zielinska', '1985-04-04', 45678901234, 'Polish', 'Aleja Grunwaldzka 45, 80-241 Gdañsk', '+48456789012'),
    (5, 'Mateusz', 'Lewandowski', '1992-05-05', 56789012345, 'Polish', 'Zamkowa 8, 83-400 Koœcierzyna', '+48567890123'),
    (6, 'Marek', 'Czerwinski', '1970-06-06', 67890123456, 'Polish', 'Starowiejska 5, 81-356 Gdynia', '+48678901234'),
    (7, 'Tomasz', 'Wojcik', '1988-07-07', 78901234567, 'Polish', '10 Lutego 23, 81-364 Gdynia', '+48789012345'),
    (8, 'Pawel', 'Gorski', '1995-08-08', 89012345678, 'Polish', 'Morska 15, 84-120 W³adys³awowo', '+48890123456'),
    (9, 'Agnieszka', 'Michalska', '1983-09-09', 90123456789, 'Polish', 'Pi³sudskiego 30, 84-300 Lêbork', '+48901234567'),
	(10, 'Maria', 'Sobczak', '1999-10-10', 1234567890, 'Polish', 'Gdyñska 1, 84-230 Rumia', '+48101234567');

--Prison Cells
INSERT INTO Prison_cell (Cell_number, Count_Of_Inmates, Capacity)
VALUES
	(101, 2, 2),
	(102, 2, 3),
	(103, 1, 2),
	(104, 0, 1),
	(105, 1, 1);

-- Prisoners
INSERT INTO Prisoner (Prisoner_ID, Sentence, Is_allowed_to_work, 
	Planned_starting_date, Planned_ending_date, Real_starting_date, Real_ending_date, Blood_type, Person_ID)
VALUES
	(1, 'Armed robbery 10 years', 1, '2015-01-01', '2025-01-01', '2015-01-01', NULL, 'A+', 1),
	(2, 'Robbery 5 years', 0, '2020-02-02', '2025-02-02', '2020-02-02', NULL, 'O-', 2),
	(3, 'Fatal car accident 15 years', 1, '2010-03-03', '2025-03-03', '2010-03-03', NULL, 'B+', 3),
	(4, 'Murder 20 years', 1, '2005-04-04', '2025-04-04', '2005-04-04', NULL, 'AB-', 4),
	(5, 'Starting fires 7 years', 0, '2018-05-05', '2025-05-05', '2018-05-05', NULL, 'A-', 5),
	(6, 'Accident under influence 3 years', 1, '2022-06-06', '2025-06-06', '2022-06-06', NULL, 'O+', 6);

-- Employees
INSERT INTO Prison_employee (Employee_ID, Shift_number, Job_title, Allowed_to_assign_job, 
	Allowed_to_permit_visits, Allowed_to_give_prison_passes, Is_a_doctor, Allowed_to_move_prisoner, Person_ID)
VALUES
	(1, 1, 'Doctor', 0, 0, 0, 1, 0, 7),
	(2, 2, 'Administrator', 1, 1, 1, 0, 1, 8),
	(3, 3, 'Security Guard', 0, 1, 0, 0, 1, 9);

-- Visitor
INSERT INTO Visitor (Visitor_ID, Agreed_to_visitation_status, Declaration_of_criminal_liability)
VALUES
	(10, 1, 1);
--Current Residency in Cells
INSERT INTO Residency_in_cell (Residency_ID, Starting_date, Ending_date, Prisoner_ID, Cell_number)
VALUES
	(1, '2019-01-01', NULL, 1, 101),
	(2, '2020-02-02', NULL, 2, 102),
	(3, '2010-03-03', NULL, 3, 103),
	(4, '2007-01-01', NULL, 4, 101),
	(5, '2018-05-05', NULL, 5, 102),
	(6, '2022-09-06', NULL, 6, 105);

-- Finished Residency in Cells
INSERT INTO Residency_in_cell (Residency_ID, Starting_date, Ending_date, Prisoner_ID, Cell_number)
VALUES
	(7, '2015-01-01', '2019-01-01', 1, 103),
	(8, '2005-04-04', '2007-01-01', 4, 102),
	(9, '2022-06-06', '2022-09-06', 6, 104);

-- Prison Passes
INSERT INTO Prison_pass (Pass_ID, Date_of_the_decision, Planned_starting_date, 
Planned_ending_date, Real_starting_date, Real_ending_date, Prisoner_ID, Employee_ID)
VALUES
	(1, '2023-01-01', '2023-01-10', '2023-01-20', '2023-01-10', '2023-01-20', 1, 2),
	(2, '2023-02-01', '2023-02-10', '2023-02-20', NULL, NULL, 2, 2),
	(3, '2023-03-01', '2023-03-10', '2023-03-20', NULL, NULL, 3, 2),
	(4, '2023-04-01', '2023-04-10', '2023-04-20', NULL, NULL, 4, 2);

-- Add Note to Prison Pass
INSERT INTO Note (Note_ID, Date_of_the_note, Note, Employee_ID)
VALUES
	(1, '2023-04-15', 'Prisoner went out of permited area but gave as a call and got a permission', 3);
INSERT INTO Note_Pass (Note_ID, Pass_ID)
VALUES
	(1, 1);

-- Prisoner Jobs
INSERT INTO Prisoner_Job (Job_ID, Job_title, Location_within_the_prison, Responsibilities, 
	Planned_starting_date, Planned_ending_date, Real_starting_date, Real_ending_date, Prisoner_ID, Employee_ID)
VALUES
	(1, 'Kitchen Assistant', 'Kitchen', 'Assist in meal preparation.', '2023-01-01', '2023-12-31', '2023-01-01', NULL, 1, 2),
	(2, 'Janitor', 'Hallways', 'Cleaning and maintenance.', '2023-02-01', '2023-12-31', '2023-02-01', NULL, 3, 2),
	(3, 'Library Assistant', 'Library', 'Catalog books and help inmates.', '2023-03-01', '2023-12-31', '2023-03-01', NULL, 4, 2);

-- Add Notes to Jobs
INSERT INTO Note (Note_ID, Date_of_the_note, Note, Employee_ID)
VALUES
	(2, '2023-02-15', 'Janitor job performance was satisfactory.', 3),
	(3, '2023-03-20', 'Library Assistant requested additional resources.', 3);
INSERT INTO Note_Job (Note_ID, Job_ID)
VALUES
	(2, 2),
	(3, 3);

-- Visits to the Doctor
INSERT INTO Visit_to_the_doctor (Doctors_visit_ID, Date_of_the_visit, Note_from_the_visit, Prisoner_ID)
VALUES
	(1, '2023-01-05', 'Routine check-up.', 1),
	(2, '2023-01-15', 'Minor injury treatment.', 2),
	(3, '2023-02-01', 'Routine check-up.', 3),
	(4, '2023-02-15', 'Back pain evaluation.', 4),
	(5, '2023-03-01', 'Dental check-up.', 5),
	(6, '2023-03-15', 'Vaccination.', 6),
	(7, '2023-04-01', 'Vision test.', 1),
	(8, '2023-04-10', 'Hearing test.', 3);

-- Doctor Visitsdoctor
INSERT INTO Supervision_of_medical_visit (Employee_ID, Doctors_visit_ID)
VALUES
    (1, 1), 
    (1, 2), 
    (1, 3), 
    (1, 4), 
    (1, 5),
    (1, 6), 
    (1, 7), 
    (1, 8); 

-- Security Escort for Doctor Visits
INSERT INTO Supervision_of_medical_visit (Employee_ID, Doctors_visit_ID)
VALUES
    (3, 1), 
    (3, 2), 
	(3, 3),
    (3, 4),
    (3, 5), 
    (3, 6),
	(3, 7), 
    (3, 8); 

-- Unique Medical Information
INSERT INTO Unique_medical_info (Medical_ID, Condition_Name, Details, Prisoner_ID)
VALUES
	(1, 'Hypertension', 'Monitored regularly.', 1),
	(2, 'Diabetes', 'Insulin-dependent.', 3),
	(3, 'Asthma', 'Uses an inhaler.', 4),
	(4, 'Chronic back pain', 'Requires physiotherapy.', 5),
	(5, 'Glaucoma', 'Requires regular eye drops.', 6);

-- Contacts and Visits
INSERT INTO Prisoner_Contact (Contact_ID, Role_to_prisoner, Visitor_ID, Prisoner_ID)
VALUES
	(1, 'Brother', 10, 1),
	(2, 'Friend', 10, 2),
	(3, 'Neighbor', 10, 3);

INSERT INTO Visit (Visit_ID, Visitation_Date, Visit_begginging, Visit_length, Prisoner_ID)
VALUES
	(1, '2023-01-05', '16:20:00', '00:30:00', 1),
	(2, '2023-01-15', '17:20:00', '00:45:00', 1),
	(3, '2023-02-01', '19:20:00','01:00:00', 2),
	(4, '2023-02-15', '16:50:00', '00:30:00', 3),
	(5, '2023-03-01', '13:20:00', '01:00:00', 3),
	(6, '2023-03-15', '16:20:00', '00:45:00', 4),
	(7, '2023-04-01', '16:35:00', '01:30:00', 5),
	(8, '2023-04-10', '15:20:00', '00:30:00', 6),
	(9, '2023-04-15', '16:10:00', '01:15:00', 2),
	(10, '2023-04-20','15:50:00', '01:00:00', 1),
	(11, '2023-04-25','10:20:00','00:45:00', 3);

INSERT INTO Participation_in_visits (Visitor_ID, Visit_ID)
VALUES
	(10, 1), (10, 2), (10, 3), (10, 4), (10, 5), (10, 6), (10, 7), (10, 8), (10, 9), (10, 10), (10, 11);

-- Add Notes to Visits
INSERT INTO Note (Note_ID, Date_of_the_note, Note, Employee_ID)
VALUES
	(4, '2023-01-06', 'Visitor brought gifts.', 3),
	(5, '2023-02-16', 'Visitor arrived late.', 3),
	(6, '2023-03-02', 'Discussion about prisoner behavior.', 3),
	(7, '2023-04-16', 'Visitor expressed concern about health.', 3);

INSERT INTO Note_Visitation (Note_ID, Visit_ID)
VALUES
	(4, 1), (5, 4), (6, 5), (7, 9);


INSERT INTO Note (Note_ID, Date_of_the_note, Note, Employee_ID)
VALUES
    (8, '2024-12-01', 'Prisoner showed exemplary behavior.', 1),
    (9, '2024-12-05', 'Prisoner required additional counseling session.', 3); 


INSERT INTO Note_Prisoner (Note_ID, Prisoner_ID)
VALUES
    (8, 1), 
    (9, 2); 
