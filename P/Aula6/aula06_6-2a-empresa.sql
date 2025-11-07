USE Empresa;

CREATE TABLE Department (
    Dname VARCHAR(16) NOT NULL,
    Dnumber INT PRIMARY KEY,
    Mgr_ssn CHAR(9),
    Mgr_start_date DATE,
);

CREATE TABLE EMPLOYEE (
	Fname varchar(16) NOT NULL,
	Minit char(1) NOT NULL,
	Lname varchar(16) NOT NULL,
	Ssn char(9) PRIMARY KEY NOT NULL,
	Bdate DATE,
	Adress varchar(100),
	Sex char(1),
	Salary decimal(10,2),
	Super_ssn char(9),
	Dno INT,
		FOREIGN KEY (Super_ssn) REFERENCES Employee(Ssn),
		FOREIGN KEY (Dno) REFERENCES Department(Dnumber)
);

ALTER TABLE Department
	ADD CONSTRAINT fk_mgr_ssn
		FOREIGN KEY (Mgr_ssn) REFERENCES Employee(Ssn);

CREATE TABLE Dept_location (
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(20) NOT NULL

	Primary key (Dnumber, Dlocation),
	Foreign key (Dnumber) REFERENCES Department(Dnumber)
);

CREATE TABLE Project (
	Pname varchar(20) NOT NULL,
	Pnumber int PRIMARY KEY,
	Plocation varchar(20),
	Dnum int NOT NULL,

	FOREIGN KEY (Dnum)
		REFERENCES Department(Dnumber)
);

CREATE TABLE Works_on (
    Essn CHAR(9),
    Pno INT,
    Hours DECIMAL(5,2),
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES Employee(Ssn),
    FOREIGN KEY (Pno) REFERENCES Project(Pnumber)
);

CREATE TABLE Dependent(
	Essn char(9),
	Dependent_name varchar(20) not null,
	Sex char(1),
	Bdate DATE,
	Relationship varchar(20),

	PRIMARY KEY (Essn, Dependent_name),

	FOREIGN KEY (Essn)
		REFERENCES Employee(Ssn)
);