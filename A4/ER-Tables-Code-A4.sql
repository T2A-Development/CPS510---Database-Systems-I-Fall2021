DROP TABLE JB_Users CASCADE CONSTRAINTS;
DROP TABLE JB_Members CASCADE CONSTRAINTS;
DROP TABLE Recruiters CASCADE CONSTRAINTS;
DROP TABLE JB_Postings;
DROP TABLE Qualifications;
DROP TABLE Connections;
DROP TABLE Departments;



CREATE TABLE JB_Users (
		login_id VARCHAR2(25 CHAR),
		user_password VARCHAR2(25 CHAR),
		CONSTRAINT user_login_id_pk PRIMARY KEY(login_id)		
);
		
		INSERT INTO JB_Users VALUES ('User01','Madhi-123');

        INSERT INTO JB_Users VALUES ('User02','Ankit-123');

        INSERT INTO JB_Users VALUES ('User03','Tusaif-123');
		
		INSERT INTO JB_Users VALUES ('User04','Org01-123');
		
		INSERT INTO JB_Users VALUES ('User05','Org02-123');

		INSERT INTO JB_Users VALUES ('User06','Org03-123');
		
		INSERT INTO JB_Users VALUES ('User010','Org04-123');
		
		INSERT INTO JB_Users VALUES ('User11','Org05-123');

		INSERT INTO JB_Users VALUES ('User12','Org06-123');
		
		INSERT INTO JB_Users VALUES ('User07','Seeker01-123');
 
 		INSERT INTO JB_Users VALUES ('User08','Seeker02-123');
		
		INSERT INTO JB_Users VALUES ('User09','Seeker03-123');
 
        SELECT * FROM JB_Users;
		
        SELECT login_id, '\'s password is :', user_password FROM JB_users;

CREATE TABLE JB_Members (
	member_id VARCHAR2(25 CHAR),
	member_type VARCHAR2(25 CHAR),
	address VARCHAR2(50 CHAR),
	email VARCHAR2(25 CHAR),
	date_Created VARCHAR2(25 CHAR),
	member_name VARCHAR2 (25 CHAR),
	subscriptions VARCHAR2(50 CHAR),
	CONSTRAINT member_pk PRIMARY KEY(member_id),
	CONSTRAINT JBUser_fk FOREIGN KEY (member_name) REFERENCES JB_Users(login_id) -- Foreign Key
);

	INSERT INTO JB_Members VALUES ('Member01', 'job seeker', '123 park street, Toronto', 'seeker01@gmail.com', 'oct18 2021', 'User07', 'n/a');
	INSERT INTO JB_Members VALUES ('Member02', 'job seeker/member', '225 high park street, Toronto', 'seeker02@gmail.com', 'oct18 2021', 'User03', 'Gold');
	INSERT INTO JB_Members VALUES ('Member03', 'Organization HR memeber', '1122 Young street, Toronto', 'hr-manager01@gmail.com', 'oct18 2021', 'User04','Gold');
	INSERT INTO JB_Members VALUES ('Member04', 'job seeker/member', '789 waterdown road, Toronto', 'seeker03@gmail.com', 'oct18 2021', 'User01','Platinum');
	INSERT INTO JB_Members VALUES ('Member05', 'job seeker', '555 lockdown street, Toronto', 'seeker04@gmail.com', 'oct19 2021', 'User08','n/a');
	INSERT INTO JB_Members VALUES ('Member06', 'job seeker/member', '124 hunter blvd., Toronto','seeker05@gmail.com', 'oct20 2021', 'User02','Platinum');
	INSERT INTO JB_Members VALUES ('Member07', 'job seeker', '5000 hiking road, Toronto','seeker06@gmail.com', 'oct21 2021', 'User07','n/a');
	INSERT INTO JB_Members VALUES ('Member08', 'Organization HR memeber', '6600 mississauga road, Mississauga,ON L0A L0A', 'hr-manager02@gmail.com', 'oct22 2021', 'User05','platinum');
	INSERT INTO JB_Members VALUES ('Member09', 'Organization HR memeber', '987 hospital road, Toronto', 'hr-manager03@gmail.com', 'oct23 2021', 'User010','silver');
	INSERT INTO JB_Members VALUES ('Member10', 'Organization HR memeber', '321 anystreet road, Toronto', 'hr-manager04@gmail.com', 'oct23 2021', 'User11','gold');
	INSERT INTO JB_Members VALUES ('Member11', 'Organization HR memeber', '852 anyroad road, Toronto', 'hr-manager05@gmail.com', 'oct23 2021', 'User12','silver');
	INSERT INTO JB_Members VALUES ('Member12', 'Organization HR memeber', '2233 xyzxyz road, Toronto','hr-manager06@gmail.com', 'oct23 2021', 'User06','Platinum');
	
	SELECT * FROM JB_Members;


CREATE TABLE Recruiters (
        recr_id VARCHAR2(25 CHAR),
		member_id VARCHAR2(25 CHAR),
		Company_name VARCHAR2(50 CHAR),
		Manager_name VARCHAR2(30 CHAR),
		phone VARCHAR2(12 CHAR) DEFAULT '(000)-000-0000',
		CONSTRAINT Recruiters_pk PRIMARY KEY(recr_id),
        FOREIGN KEY (member_id) REFERENCES JB_Members (member_id)
);

	INSERT INTO Recruiters VALUES ('Org01', 'Member03', 'Google Inc.', 'Mr. KLM ABC', '416-111-2222');
	INSERT INTO Recruiters VALUES ('Org02', 'Member08', 'ABC Company', 'Ms. C. R. Rollings', '416-222-3333');
	INSERT INTO Recruiters VALUES ('Org03', 'Member09', 'HP Inc.', 'Mr. John Smith', '416-333-4444');
	INSERT INTO Recruiters VALUES ('Org04', 'Member10', 'Apple Inc.', 'Ms. H. Walters ', '416-444-5555');
	INSERT INTO Recruiters VALUES ('Org05', 'Member11', 'CN Rail Inc.', 'Mr. Herry S.', '416-555-6666');
	INSERT INTO Recruiters VALUES ('Org06', 'Member12', 'Air Canada', 'Mr. Joe Jackson', '416-666-7777');
	
	SELECT * FROM Recruiters;

	
CREATE TABLE JB_Postings (
		job_id VARCHAR2 (20 CHAR),
        work_period NUMBER NOT NULL,
        company VARCHAR2(25 CHAR),
        salary NUMBER,
        job_title VARCHAR2(25 CHAR) NOT NULL,
        job_location VARCHAR2(25 CHAR) NOT NULL,
        job_type VARCHAR2(25 CHAR) NOT NULL,
		effective_date VARCHAR2(25 CHAR) NOT NULL,
		end_date VARCHAR2(25 CHAR) NOT NULL,
        CONSTRAINT jobs_pk PRIMARY KEY (job_id),--primary key
		FOREIGN KEY (company) REFERENCES recruiters (recr_id) --Foreign Key
);

	INSERT INTO JB_Postings VALUES ('job#01', 1, 'org01', 55000, 'Assistant Manager', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#02', 2, 'org02', 65000, 'HR Staff', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#03', 3, 'org03', 75000, 'Assistant HR Manager', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#04', 5, 'org04', 85000, 'General Manager', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#05', 5, 'org05', 95000, 'Data Base Developer', 'Downtown Toronto', 'remote', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#06', 4, 'org06', 100000, 'Data Base Developer', 'Downtown Toronto', 'remote', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#07', 2, 'org01', 35000, 'help desk agent', 'Downtown Toronto', 'remote', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#08', 2, 'org02', 45000, 'help desk agent', 'Downtown Toronto', 'remote', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#09', 2, 'org03', 125000, 'General Manager', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#10', 5, 'org04', 110000, 'Assistant Manager', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#11', 4, 'org05', 115000, 'Software Engineer', 'Downtown Toronto', 'remote', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#12', 2, 'org06', 100000, 'General Manager', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#13', 1, 'org01', 95000, 'Data Base Developer', 'Downtown Toronto', 'remote', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#14', 4, 'org02', 105000, 'Assistant Manager', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#15', 1, 'org03', 115000, 'help desk agent', 'Downtown Toronto', 'remote', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#16', 2, 'org04', 125000, 'Software Engineer', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#17', 1, 'org05', 135000, 'General Manager', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#18', 1, 'org06', 145000, 'Software Engineer', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#19', 2, 'org01', 15000, 'help desk agent', 'Downtown Toronto', 'remote', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#20', 5, 'org02', 25000, 'help desk agent', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#21', 1, 'org03', 30000, 'help desk agent', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#22', 1, 'org04', 28000, 'help desk agent', 'Downtown Toronto', 'remote', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#23', 2, 'org05', 32000, 'help desk agent', 'Downtown Toronto', 'In person', 'oct18 2021', 'dec18 2021');
	INSERT INTO JB_Postings VALUES ('job#24', 1, 'org06', 42000, 'HR Staff', 'Downtown Toronto', 'remote', 'oct18 2021', 'dec18 2021');	
	
	SELECT * FROM JB_Postings;
	
CREATE TABLE Qualifications(
            qualification_id VARCHAR2(10 CHAR),
            edu_level VARCHAR2(50 CHAR) DEFAULT 'Undergraduate',
            JB_User_id VARCHAR2(25 CHAR) NOT NULL,
            years_experience NUMBER CHECK (years_experience BETWEEN 0 AND 30),
            coverLetter VARCHAR2(1000 CHAR),
            Certi_license VARCHAR2(25 CHAR),
            CONSTRAINT qualification_pk PRIMARY KEY (qualification_id),--Primary ID
            FOREIGN KEY (JB_user_id) REFERENCES JB_Users (login_id) --Foreign Key
);

	INSERT INTO Qualifications VALUES ('QID#01','Undergraduate','User01',3,'CoverTitle','G');
    INSERT INTO Qualifications VALUES ('QID#02','Masters','User02',7,'CoverTitle2','Smart Serve');
    INSERT INTO Qualifications VALUES ('QID#03','Bachelors','User03',4,'CoverTitle3','G2');
    INSERT INTO Qualifications VALUES ('QID#04','Undergraduate','User07',8,'CoverTitle4','G');
    INSERT INTO Qualifications VALUES ('QID#05','Masters','User08',14,'CoverTitle5','Smart Serve');
    INSERT INTO Qualifications VALUES ('QID#06','Bachelors','User09',5,'CoverTitle6','G2');
    
	SELECT * FROM Qualifications;
	
    SELECT * FROM Qualifications WHERE years_experience >= 5;

	
CREATE TABLE Connections (
		conn_id VARCHAR2(12 CHAR),
		member_id VARCHAR2(25 CHAR),
		date_made VARCHAR2(25 CHAR),
		conn_details VARCHAR2(150 CHAR),
		CONSTRAINT conn_pk PRIMARY KEY(conn_id),
		FOREIGN KEY (member_id) REFERENCES JB_Members (member_id)
);

	INSERT INTO Connections VALUES ('ConId01','Member02','Oct18,2021','REFERENCES');
	INSERT INTO Connections VALUES ('ConId02','Member04','Oct18,2021','REFERENCES');
	INSERT INTO Connections VALUES ('ConId03','Member06','Oct18,2021','REFERENCES');
	INSERT INTO Connections VALUES ('ConId04','Member02','Oct18,2021','REFERENCES');
	
		
	SELECT * FROM Connections;
	
CREATE TABLE Departments (
		depart_id VARCHAR2(25 CHAR),
		org_id VARCHAR2(25 CHAR),
		depart_name VARCHAR2(50 CHAR),
		hr_manager VARCHAR2(50 CHAR),
		no_employees NUMBER  NOT NULL,
		CONSTRAINT depart_pk PRIMARY KEY(depart_id),
		FOREIGN KEY (org_id) REFERENCES Recruiters (recr_id)
);

    INSERT INTO Departments VALUES ('Admin01','Org01','HR', 'Mahdi',9);
    INSERT INTO Departments VALUES ('Admin02','Org02','HR', 'Ankit',10);
    INSERT INTO Departments VALUES ('Admin03','Org03','HR', 'Tusaif',12);
	INSERT INTO Departments VALUES ('Admin04','Org04','HR', 'name one',14);
	INSERT INTO Departments VALUES ('Admin05','Org05','HR', 'name two',20);
	INSERT INTO Departments VALUES ('Admin06','Org06','HR', 'name three',5);
	INSERT INTO Departments VALUES ('Admin07','Org01','Administration', 'name04',10);
	INSERT INTO Departments VALUES ('Admin08','Org02','Administration', 'name05',7);
	INSERT INTO Departments VALUES ('Admin09','Org03','Administration', 'name06',4);
	INSERT INTO Departments VALUES ('Admin10','Org04','Administration', 'name07',9);
	INSERT INTO Departments VALUES ('Admin11','Org05','Administration', 'name08',6);
	INSERT INTO Departments VALUES ('Admin12','Org06','Administration', 'name09',12);
	INSERT INTO Departments VALUES ('Admin13','Org01','Accounting and Finance', 'name abc01',4);
	INSERT INTO Departments VALUES ('Admin14','Org02','Accounting and Finance', 'name abc02',3);
	INSERT INTO Departments VALUES ('Admin15','Org03','Accounting and Finance', 'name abc03',7);
	INSERT INTO Departments VALUES ('Admin16','Org04','Accounting and Finance', 'name abc04',9);
	INSERT INTO Departments VALUES ('Admin17','Org05','Accounting and Finance', 'name abc05',5);
	INSERT INTO Departments VALUES ('Admin18','Org06','Accounting and Finance', 'name abc06',8);

    SELECT * FROM Departments;
	
-----------------------------------------------------------
---- *********    Querries     ************* --------------
-----------------------------------------------------------

-- Table Views

CREATE VIEW MEMBER_DETAILS AS 
    SELECT MEMBER_ID, LOGIN_ID, MEMBER_TYPE, MEMBER_NAME
    FROM JB_MEMBERS, JB_USERS
    WHERE JB_USERS.LOGIN_ID = JB_MEMBERS.MEMBER_NAME;
	
CREATE VIEW ORGANIZATIONS_WITH_DEPARTMENTS AS 
    SELECT RECR_ID, DEPART_NAME, NO_EMPLOYEES
    FROM RECRUITERS, DEPARTMENTS
    WHERE RECR_ID = ORG_ID;
    
select * from ORGANIZATIONS_WITH_DEPARTMENTS;

CREATE VIEW posting_by_recruiter as 
	SELECT job_id,job_title,job_location FROM JB_Postings
	WHERE company = 'org01';

-- advanced Queries
-- Join Queries

SELECT JB_Members.member_type, JB_Members.member_name FROM JB_Members 
FULL OUTER Join Connections ON JB_Members.member_id=Connections.member_id
ORDER BY JB_Members.member_name;

SELECT JB_users.login_id AS UserID, Qualifications.user_degree AS EducationLevel,
Qualifications.coverLetter AS Details, Qualifications.years_experience
FROM JB_Users, Qualifications
Where JB_Users.login_id <> Qualifications.JB_User_id
ORDER BY JB_Users.login_id;

--DISTINCT Queries

SELECT DISTINCT organization_id from HR_Department;

SELECT COUNT(DISTINCT organization_id) from HR_Department;

SELECT DISTINCT company FROM JB_Postings;

--Grouping/Sorting Commands

SELECT COUNT(member_id),member_type FROM JB_Members GROUP BY member_type;

SELECT COUNT(job_id), Company, job_title, job_location FROM JB_Postings
GROUP BY company ORDER BY COUNT(job_id) DESC;

SELECT *
from jb_members
where member_name IN (select jb_user_id from qualifications);

SELECT *
from jb_members
where member_name NOT IN (select jb_user_id from qualifications);
 
