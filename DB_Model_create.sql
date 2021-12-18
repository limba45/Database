-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-18 08:16:36.283

-- tables
-- Table: Admission
CREATE TABLE Admission (
    Admit_ID int  NOT NULL,
    Admit_Date date  NOT NULL,
    Doctor_ID int  NOT NULL,
    Patient_ID int  NOT NULL,
    CONSTRAINT Admission_pk PRIMARY KEY (Admit_ID)
);

-- Table: Building
CREATE TABLE Building (
    Building_ID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Building_Size int  NOT NULL,
    Hospital_Name varchar(100)  NOT NULL,
    CONSTRAINT Building_pk PRIMARY KEY (Building_ID)
);

-- Table: Department
CREATE TABLE Department (
    Department_ID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Phone_Number int  NOT NULL,
    Hospital_Name varchar(100)  NOT NULL,
    CONSTRAINT Department_pk PRIMARY KEY (Department_ID)
);

-- Table: Doctors
CREATE TABLE Doctors (
    Doctor_ID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Specialization varchar(100)  NOT NULL,
    Field varchar(100)  NOT NULL,
    Department_ID int  NOT NULL,
    CONSTRAINT Doctors_pk PRIMARY KEY (Doctor_ID)
);

-- Table: Employees
CREATE TABLE Employees (
    Employee_ID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Salary int  NOT NULL,
    Working_hours int  NOT NULL,
    Phone_Number int  NOT NULL,
    Hospital_Name varchar(100)  NOT NULL,
    Building_Building_ID int  NOT NULL,
    CONSTRAINT Employees_pk PRIMARY KEY (Employee_ID)
);

-- Table: General_Wards
CREATE TABLE General_Wards (
    Ward_ID int  NOT NULL,
    Ward_Name varchar(50)  NOT NULL,
    Floor_Number int  NOT NULL,
    Building_ID int  NOT NULL,
    CONSTRAINT General_Wards_pk PRIMARY KEY (Ward_ID)
);

-- Table: Hospital
CREATE TABLE Hospital (
    Name varchar(100)  NOT NULL,
    Address varchar(100)  NOT NULL,
    Phone_Number int  NOT NULL,
    CONSTRAINT Hospital_pk PRIMARY KEY (Name)
);

-- Table: In_Patient
CREATE TABLE In_Patient (
    Days int  NOT NULL,
    Start_Date date  NOT NULL,
    Admit_ID int  NOT NULL
);

-- Table: Medicine
CREATE TABLE Medicine (
    Product_ID int  NOT NULL,
    Name varchar(100)  NOT NULL,
    Quantity int  NOT NULL,
    Price int  NOT NULL,
    Patient_ID int  NOT NULL,
    CONSTRAINT Medicine_pk PRIMARY KEY (Product_ID)
);

-- Table: Nurse
CREATE TABLE Nurse (
    Nurse_ID int  NOT NULL,
    Name varchar(100)  NOT NULL,
    Role varchar(100)  NOT NULL,
    Doctor_ID int  NOT NULL,
    CONSTRAINT Nurse_pk PRIMARY KEY (Nurse_ID)
);

-- Table: Out_Patient
CREATE TABLE Out_Patient (
    Days int  NOT NULL,
    End_Date date  NOT NULL,
    Admit_ID int  NOT NULL
);

-- Table: Patient
CREATE TABLE Patient (
    Patient_ID int  NOT NULL,
    Name varchar(100)  NOT NULL,
    Address varchar(100)  NOT NULL,
    Age int  NOT NULL,
    Weight int  NOT NULL,
    Nurse_ID int  NOT NULL,
    Doctor_ID int  NOT NULL,
    CONSTRAINT Patient_pk PRIMARY KEY (Patient_ID)
);

-- Table: Record
CREATE TABLE Record (
    Patient_Details varchar(100)  NOT NULL,
    Admit_ID int  NOT NULL
);

-- Table: Reports
CREATE TABLE Reports (
    Report_ID int  NOT NULL,
    Name varchar(100)  NOT NULL,
    Report_Date date  NOT NULL,
    Amount int  NOT NULL,
    Category varchar(100)  NOT NULL,
    Doctor_ID int  NOT NULL,
    Department_ID int  NOT NULL,
    Patient_ID int  NOT NULL,
    Admit_ID int  NOT NULL,
    CONSTRAINT Reports_pk PRIMARY KEY (Report_ID)
);

-- Table: Rooms
CREATE TABLE Rooms (
    Room_ID int  NOT NULL,
    Floor int  NOT NULL,
    Beds int  NOT NULL,
    Ward_ID int  NOT NULL,
    CONSTRAINT Rooms_pk PRIMARY KEY (Room_ID)
);

-- foreign keys
-- Reference: Admission_Doctors (table: Admission)
ALTER TABLE Admission ADD CONSTRAINT Admission_Doctors
    FOREIGN KEY (Doctor_ID)
    REFERENCES Doctors (Doctor_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Admission_Patient (table: Admission)
ALTER TABLE Admission ADD CONSTRAINT Admission_Patient
    FOREIGN KEY (Patient_ID)
    REFERENCES Patient (Patient_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Building_Hospital (table: Building)
ALTER TABLE Building ADD CONSTRAINT Building_Hospital
    FOREIGN KEY (Hospital_Name)
    REFERENCES Hospital (Name)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Department_Hospital (table: Department)
ALTER TABLE Department ADD CONSTRAINT Department_Hospital
    FOREIGN KEY (Hospital_Name)
    REFERENCES Hospital (Name)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Doctors_Department (table: Doctors)
ALTER TABLE Doctors ADD CONSTRAINT Doctors_Department
    FOREIGN KEY (Department_ID)
    REFERENCES Department (Department_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Employees_Building (table: Employees)
ALTER TABLE Employees ADD CONSTRAINT Employees_Building
    FOREIGN KEY (Building_Building_ID)
    REFERENCES Building (Building_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Employees_Hospital (table: Employees)
ALTER TABLE Employees ADD CONSTRAINT Employees_Hospital
    FOREIGN KEY (Hospital_Name)
    REFERENCES Hospital (Name)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: General_Wards_Building (table: General_Wards)
ALTER TABLE General_Wards ADD CONSTRAINT General_Wards_Building
    FOREIGN KEY (Building_ID)
    REFERENCES Building (Building_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: In_Patient_Admission (table: In_Patient)
ALTER TABLE In_Patient ADD CONSTRAINT In_Patient_Admission
    FOREIGN KEY (Admit_ID)
    REFERENCES Admission (Admit_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Medicine_Patient (table: Medicine)
ALTER TABLE Medicine ADD CONSTRAINT Medicine_Patient
    FOREIGN KEY (Patient_ID)
    REFERENCES Patient (Patient_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Nurse_Doctors (table: Nurse)
ALTER TABLE Nurse ADD CONSTRAINT Nurse_Doctors
    FOREIGN KEY (Doctor_ID)
    REFERENCES Doctors (Doctor_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Out_Patient_Admission (table: Out_Patient)
ALTER TABLE Out_Patient ADD CONSTRAINT Out_Patient_Admission
    FOREIGN KEY (Admit_ID)
    REFERENCES Admission (Admit_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Patient_Doctors (table: Patient)
ALTER TABLE Patient ADD CONSTRAINT Patient_Doctors
    FOREIGN KEY (Doctor_ID)
    REFERENCES Doctors (Doctor_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Patient_Nurse (table: Patient)
ALTER TABLE Patient ADD CONSTRAINT Patient_Nurse
    FOREIGN KEY (Nurse_ID)
    REFERENCES Nurse (Nurse_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Record_Admission (table: Record)
ALTER TABLE Record ADD CONSTRAINT Record_Admission
    FOREIGN KEY (Admit_ID)
    REFERENCES Admission (Admit_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Reports_Admission (table: Reports)
ALTER TABLE Reports ADD CONSTRAINT Reports_Admission
    FOREIGN KEY (Admit_ID)
    REFERENCES Admission (Admit_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Reports_Department (table: Reports)
ALTER TABLE Reports ADD CONSTRAINT Reports_Department
    FOREIGN KEY (Department_ID)
    REFERENCES Department (Department_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Reports_Doctors (table: Reports)
ALTER TABLE Reports ADD CONSTRAINT Reports_Doctors
    FOREIGN KEY (Doctor_ID)
    REFERENCES Doctors (Doctor_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Reports_Patient (table: Reports)
ALTER TABLE Reports ADD CONSTRAINT Reports_Patient
    FOREIGN KEY (Patient_ID)
    REFERENCES Patient (Patient_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Rooms_General_Wards (table: Rooms)
ALTER TABLE Rooms ADD CONSTRAINT Rooms_General_Wards
    FOREIGN KEY (Ward_ID)
    REFERENCES General_Wards (Ward_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

