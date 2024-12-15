
--1
CREATE TABLE Person (
    Person_ID INT PRIMARY KEY CHECK (Person_ID > 0 AND Person_ID < 100000000),
	Peron_Name VARCHAR(250) NOT NULL CHECK (Peron_Name NOT LIKE '%[^a-zA-Z¹æê³ñóœŸ¿¥ÆÊ£ÑÓŒ¯ ]%'), 
    Surname VARCHAR(250) NOT NULL CHECK (Surname NOT LIKE'%[^a-zA-Z¹æê³ñóœŸ¿¥ÆÊ£ÑÓŒ¯ ]%'),
    Birth_date DATE NOT NULL, 
    Pesel BIGINT NOT NULL CHECK (Pesel >= 0 AND Pesel < 100000000000), 
    Nationality VARCHAR(255) NOT NULL CHECK (Nationality NOT LIKE'%[^a-zA-Z¹æê³ñóœŸ¿¥ÆÊ£ÑÓŒ¯ ]%'),
    Physical_address VARCHAR(500) NOT NULL,
	Phone_number VARCHAR(14) NOT NULL CHECK (Phone_number LIKE '+[0-9]%')
);
--2
CREATE TABLE Prisoner (
    Prisoner_ID INT PRIMARY KEY CHECK (Prisoner_ID > 0 AND Prisoner_ID < 10000000),
    Sentence VARCHAR(1000) NOT NULL,
    Is_allowed_to_work BIT NOT NULL,
    Planned_starting_date DATE NOT NULL,
    Planned_ending_date DATE NOT NULL,
    Real_starting_date DATE,
    Real_ending_date DATE,
	Blood_type CHAR(3) NOT NULL CHECK (Blood_type IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),

    Person_ID INT NOT NULL,
    FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);
--3
CREATE TABLE Visitor (
    Visitor_ID INT PRIMARY KEY , 
    Agreed_to_visitation_status BIT NOT NULL, 
    Declaration_of_criminal_liability BIT NOT NULL,

    FOREIGN KEY (Visitor_ID) REFERENCES Person(Person_ID) 
);
--4
CREATE TABLE Prison_employee (
    Employee_ID INT PRIMARY KEY CHECK (Employee_ID > 0 AND Employee_ID < 1000000),
    Shift_number TINYINT NOT NULL CHECK (Shift_number > 0 AND Shift_number < 10),
    Job_title VARCHAR(255) NOT NULL,
    Allowed_to_assign_job BIT NOT NULL, 
    Allowed_to_permit_visits BIT NOT NULL,
    Allowed_to_give_prison_passes BIT NOT NULL,
    Is_a_doctor BIT NOT NULL,
    Allowed_to_move_prisoner BIT NOT NULL,

    Person_ID INT NOT NULL,
    FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID)
);
--5
CREATE TABLE Prison_pass (
    Pass_ID INT PRIMARY KEY CHECK (Pass_ID > 0 AND Pass_ID < 100000000),
    Date_of_the_decision DATE NOT NULL,
    Planned_starting_date DATE NOT NULL,
    Planned_ending_date DATE NOT NULL,
    Real_starting_date DATE,
    Real_ending_date DATE,

    Prisoner_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Prison_employee(Employee_ID)
);
--7
CREATE TABLE Prison_cell (
    Cell_number INT PRIMARY KEY CHECK (Cell_number > 0 AND Cell_number < 1000),
    Count_Of_Inmates TINYINT NOT NULL, -- automatyzacja
    Capacity TINYINT NOT NULL 
);
--6
CREATE TABLE Residency_in_cell (
    Residency_ID INT PRIMARY KEY CHECK (Residency_ID > 0 AND Residency_ID < 100000000),
    Starting_date DATE NOT NULL,
    Ending_date DATE,

    Prisoner_ID INT NOT NULL,
    Cell_number INT NOT NULL,
    FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID),
    FOREIGN KEY (Cell_number) REFERENCES Prison_cell(Cell_number)
);
--8
CREATE TABLE Prisoner_Job (
    Job_ID INT PRIMARY KEY CHECK (Job_ID > 0 AND Job_ID < 100000000), 
    Job_title VARCHAR(255) NOT NULL, 
    Location_within_the_prison VARCHAR(255) NOT NULL, 
    Responsibilities VARCHAR(1000) NOT NULL, 
    Planned_starting_date DATE NOT NULL,
    Planned_ending_date DATE NOT NULL,
    Real_starting_date DATE,
    Real_ending_date DATE,

    Prisoner_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Prison_employee(Employee_ID)
);
--9
CREATE TABLE Visit (
    Visit_ID INT PRIMARY KEY CHECK (Visit_ID > 0 AND Visit_ID < 100000000),
    Visitation_Date DATE NOT NULL,
	Visit_begginging TIME NOT NULL,
    Visit_length TIME NOT NULL,

    Prisoner_ID INT NOT NULL,
    FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID)
);
--10
CREATE TABLE Prisoner_Contact (
    Contact_ID INT PRIMARY KEY CHECK (Contact_ID > 0 AND Contact_ID < 100000000),
	Role_to_prisoner VARCHAR(255) NOT NULL,

    Visitor_ID INT NOT NULL,
    Prisoner_ID INT NOT NULL,
    FOREIGN KEY (Visitor_ID) REFERENCES Visitor(Visitor_ID),
    FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID)
);
--11
CREATE TABLE Unique_medical_info (
    Medical_ID INT PRIMARY KEY CHECK (Medical_ID > 0 AND Medical_ID < 100000000),
    Condition_Name VARCHAR(255) NOT NULL,
    Details VARCHAR(5000) NOT NULL,

    Prisoner_ID INT NOT NULL,
    FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID)
);
--12
CREATE TABLE Visit_to_the_doctor (
    Doctors_visit_ID INT PRIMARY KEY CHECK (Doctors_visit_ID > 0 AND Doctors_visit_ID < 100000000), 
    Date_of_the_visit DATE NOT NULL,
    Note_from_the_visit VARCHAR(5000) NOT NULL,

    Prisoner_ID INT NOT NULL,
    FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID)
);
--13
CREATE TABLE Note (
    Note_ID INT PRIMARY KEY CHECK (Note_ID > 0 AND Note_ID < 1000000000),
    Date_of_the_note DATE NOT NULL,
    Note VARCHAR(5000) NOT NULL,

    Employee_ID INT NOT NULL,
    FOREIGN KEY (Employee_ID) REFERENCES Prison_employee(Employee_ID)
);

-- Info necesery to create relations

CREATE TABLE Participation_in_visits (
    Visitor_ID INT NOT NULL,
    Visit_ID INT NOT NULL,
    PRIMARY KEY (Visitor_ID, Visit_ID),
    FOREIGN KEY (Visitor_ID) REFERENCES Visitor(Visitor_ID),
    FOREIGN KEY (Visit_ID) REFERENCES Visit(Visit_ID)
);

CREATE TABLE Involved_in_visit (
    Employee_ID INT NOT NULL,
    Visit_ID INT NOT NULL,
    PRIMARY KEY (Employee_ID, Visit_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Prison_employee(Employee_ID),
    FOREIGN KEY (Visit_ID) REFERENCES Visit(Visit_ID)
);

CREATE TABLE Supervision_of_medical_visit (
    Employee_ID INT NOT NULL,
    Doctors_visit_ID INT NOT NULL,
    PRIMARY KEY (Employee_ID, Doctors_visit_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Prison_employee(Employee_ID),
    FOREIGN KEY (Doctors_visit_ID) REFERENCES Visit_to_the_doctor(Doctors_visit_ID)
);

CREATE TABLE Conduct_prisoner_allocation (
    Residency_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    PRIMARY KEY (Residency_ID, Employee_ID),
    FOREIGN KEY (Residency_ID) REFERENCES Residency_in_cell(Residency_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Prison_employee(Employee_ID)
);

CREATE TABLE Note_Visitation (
    Note_ID INT NOT NULL,
    Visit_ID INT NOT NULL,
    PRIMARY KEY (Note_ID, Visit_ID),
    FOREIGN KEY (Note_ID) REFERENCES Note(Note_ID),
    FOREIGN KEY (Visit_ID) REFERENCES Visit(Visit_ID)
);

CREATE TABLE Note_Prisoner (
    Note_ID INT NOT NULL,
    Prisoner_ID INT NOT NULL,
    PRIMARY KEY (Note_ID, Prisoner_ID),
    FOREIGN KEY (Note_ID) REFERENCES Note(Note_ID),
    FOREIGN KEY (Prisoner_ID) REFERENCES Prisoner(Prisoner_ID)
);

CREATE TABLE Note_Job (
    Note_ID INT NOT NULL,
    Job_ID INT NOT NULL,
    PRIMARY KEY (Note_ID, Job_ID),
    FOREIGN KEY (Note_ID) REFERENCES Note(Note_ID),
    FOREIGN KEY (Job_ID) REFERENCES Prisoner_Job(Job_ID)
);

CREATE TABLE Note_Pass (
    Note_ID INT NOT NULL,
    Pass_ID INT NOT NULL,
    PRIMARY KEY (Note_ID, Pass_ID),
    FOREIGN KEY (Note_ID) REFERENCES Note(Note_ID),
    FOREIGN KEY (Pass_ID) REFERENCES Prison_pass(Pass_ID)
);





















