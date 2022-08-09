#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "tazmat/08220278@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

CREATE TABLE JB_Users (
		login_id VARCHAR2(25 CHAR),
		user_password VARCHAR2(25 CHAR),
		CONSTRAINT user_login_id_pk PRIMARY KEY(login_id)		
);

CREATE TABLE JB_Members (
	member_id VARCHAR2(25 CHAR),
	member_type VARCHAR2(25 CHAR),
	address VARCHAR2(50 CHAR),
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
		date_created VARCHAR2(25 CHAR),
		email VARCHAR2(25 CHAR),
		phone VARCHAR2(12 CHAR) DEFAULT '(000)-000-0000',
		address VARCHAR2(50 CHAR),
		CONSTRAINT Recruiters_pk PRIMARY KEY(recr_id),
        FOREIGN KEY (member_id) REFERENCES JB_Members (member_id)
);

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
		M_type VARCHAR2(25 CHAR) NOT NULL,
		Description VARCHAR2(25 CHAR),
		Start_date VARCHAR2(25 CHAR) NOT NULL,
		End_date VARCHAR2(25 CHAR) NOT NULL,
		CONSTRAINT permission_pk PRIMARY KEY(permission_id),
		FOREIGN KEY (user_id) REFERENCES JB_Users (login_id)
);

CREATE TABLE Connections (
		conn_id VARCHAR2(12 CHAR),
		member_id VARCHAR2(25 CHAR),
		date_made VARCHAR2(25 CHAR),
		details VARCHAR2(150 CHAR),
		CONSTRAINT conn_pk PRIMARY KEY(conn_id),
		FOREIGN KEY (member_id) REFERENCES JB_Members (member_id)
);

CREATE TABLE Departments (
		depart_id VARCHAR2(25 CHAR),
		org_id VARCHAR2(25 CHAR),
		depart_name VARCHAR2(50 CHAR),
		hr_manager VARCHAR2(50 CHAR),
		no_employees NUMBER  NOT NULL,
		CONSTRAINT depart_pk PRIMARY KEY(depart_id),
		FOREIGN KEY (org_id) REFERENCES Recruiters (recr_id)
);

exit;
EOF