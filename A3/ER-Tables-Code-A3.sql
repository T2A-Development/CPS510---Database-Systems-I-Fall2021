DROP TABLE JB_Users CASCADE CONSTRAINTS;
DROP TABLE JB_Members CASCADE CONSTRAINTS;
DROP TABLE Recruiters CASCADE CONSTRAINTS;
DROP TABLE JB_Postings;
DROP TABLE Qualifications;
DROP TABLE Memberships;
DROP TABLE Connections;
DROP TABLE HR_Department;



CREATE TABLE JB_Users (
		login_id VARCHAR2(25 CHAR),
		user_password VARCHAR2(25 CHAR),
		CONSTRAINT user_login_id_pk PRIMARY KEY(login_id)		
);

CREATE TABLE JB_Members (
	member_id VARCHAR2(25 CHAR),
	member_type VARCHAR2(25 CHAR),
	address VARCHAR2(25 CHAR),
	org_id VARCHAR2(25 CHAR),
	email VARCHAR2(25 CHAR),
	date_Created VARCHAR2(25 CHAR),
	member_name VARCHAR2 (25 CHAR),
	CONSTRAINT member_pk PRIMARY KEY(member_id),
	CONSTRAINT JBUser_fk FOREIGN KEY (member_name) REFERENCES JB_Users(login_id) -- Foreign Key
);

CREATE TABLE Recruiters (
        recr_id VARCHAR2(25 CHAR),
		member_id VARCHAR2(25 CHAR),
		job_id VARCHAR2(25 CHAR),
		date_created VARCHAR2(25 CHAR),
		email VARCHAR2(25 CHAR),
		phone VARCHAR2(12 CHAR) DEFAULT '(000)-000-0000',
		address VARCHAR2(25 CHAR),
		CONSTRAINT Recruiters_pk PRIMARY KEY(recr_id),
        FOREIGN KEY (member_id) REFERENCES JB_Members (member_id)
);

CREATE TABLE JB_Postings (
		job_id VARCHAR2 (20 CHAR),
        work_period NUMBER,
        company VARCHAR2(25 CHAR),
        salary NUMBER,
        job_title VARCHAR2(25 CHAR),
        job_location VARCHAR2(25 CHAR),
        job_type VARCHAR2(25 CHAR),
		effective_date VARCHAR2(25 CHAR),
		end_date VARCHAR2(25 CHAR),
        CONSTRAINT jobs_pk PRIMARY KEY (job_id),--primary key
		FOREIGN KEY (company) REFERENCES recruiters (recr_id) --Foreign Key
);

CREATE TABLE Qualifications(
            qualification_id VARCHAR2(10 CHAR),
            user_degree VARCHAR2(50 CHAR) DEFAULT 'Undergraduate',
            JB_User_id VARCHAR2(25 CHAR) NOT NULL,
            years_experience NUMBER CHECK (years_experience BETWEEN 0 AND 30),
            coverLetter VARCHAR2(1000 CHAR),
            license VARCHAR2(25 CHAR),
            CONSTRAINT qualification_pk PRIMARY KEY (qualification_id),--Primary ID
            FOREIGN KEY (JB_user_id) REFERENCES JB_Users (login_id) --Foreign Key
);

CREATE TABLE Memberships (
		permission_id VARCHAR2(10 CHAR),
		user_id VARCHAR2(25 CHAR),
		Type VARCHAR2(25 CHAR),
		Description VARCHAR2(25 CHAR),
		Start_date VARCHAR2(25 CHAR),
		End_date VARCHAR2(25 CHAR),
		CONSTRAINT permission_pk PRIMARY KEY(permission_id),
		FOREIGN KEY (user_id) REFERENCES JB_Users (login_id)
);

CREATE TABLE Connections (
		conn_id VARCHAR2(12 CHAR),
		user_id VARCHAR2(25 CHAR),
		date_made VARCHAR2(25 CHAR),
		details VARCHAR2(150 CHAR),
		CONSTRAINT conn_pk PRIMARY KEY(conn_id),
		FOREIGN KEY (user_id) REFERENCES JB_Users (login_id)
);

CREATE TABLE HR_Department (
		depart_id VARCHAR2(25 CHAR),
		organization_id VARCHAR2(25 CHAR),
		depart_name VARCHAR2(50 CHAR),
		hr_manager VARCHAR2(50 CHAR),
		no_employees NUMBER,
		CONSTRAINT depart_pk PRIMARY KEY(depart_id),
		FOREIGN KEY (organization_id) REFERENCES Recruiters (recr_id)
);

            INSERT INTO HR_Department 
            VALUES ('HR01-01', 'company-id01','Adminstration','Mahdi',10);


            SELECT * FROM Department;