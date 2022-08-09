DROP TABLE JB_Users CASCADE CONSTRAINTS;

CREATE TABLE JB_Users (
		login_id VARCHAR2(25 CHAR),
		user_password VARCHAR2(25 CHAR),
		CONSTRAINT user_login_id_pk PRIMARY KEY(login_id)		
);

		INSERT INTO JB_User 
        VALUES ('User01','Madhi-123');

        INSERT INTO JB_User
        VALUES ('User02','Ankit-123');

        INSERT INTO JB_User 
        VALUES ('User03','Tusaif-123');
            
        SELECT login_id, '\'s password is :', user_password FROM JB_users;
	
DROP TABLE JB_Members CASCADE CONSTRAINTS;

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

	INSERT INTO JB_Members VALUES ('Member01', 'job seeker', '123 park street Toronto, n/a', 'seeker01@gmail.com', 'oct18 2021', 'John Doe one');
	

DROP TABLE Recruiters CASCADE CONSTRAINTS;
CREATE TABLE Recruiters (
        recr_id VARCHAR2(25 CHAR)  UNIQUE,
		member_id VARCHAR2(25 CHAR),
		job_id VARCHAR2(25 CHAR),
		date_created VARCHAR2(25 CHAR),
		email VARCHAR2(25 CHAR),
		phone VARCHAR2(12 CHAR) DEFAULT '(000)-000-0000',
		address VARCHAR2(25 CHAR),
		CONSTRAINT Recruiters_pk PRIMARY KEY(recr_id),
		FOREIGN KEY member_id REFERENCES JB_Members (recr_id),
		FOREIGN KEY job_id REFERENCES JB_Postings (job_id),
);

	INSERT INTO Recruiters VALUES ('Org01', 'Member02', 'Job#01', 'oct18 2021', 'org01@somemail.com', '(416)-111-2222', '111-2222 young street toronto');
	

DROP TABLE JB_Postings;
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
        CONSTRAINT jobs_pk PRIMARY KEY (job_id)--primary key
		FOREIGN KEY company REFERENCES recruiters (recr_id) --Foreign Key
);

	INSERT INTO JB_Postings VALUES ('job#01', 01, 'organization01', 55000, 'help desk agent', 'Downtown Toronto', 'remote', 'oct18 2021', 'dec18 2021');
	

DROP TABLE Qualifications;
CREATE TABLE Qualifications(
            qualification_id VARCHAR2(10 CHAR),
            user_degree VARCHAR2(50 CHAR) DEFAULT 'Undergraduate',
            JB_User_id VARCHAR2(25 CHAR) NOT NULL,
            years_experience NUMBER CHECK (years_experience BETWEEN 0 AND 30),
            coverLetter VARCHAR2(1000 CHAR),
            license VARCHAR2(25 CHAR),
            CONSTRAINT qualification_pk PRIMARY KEY (qualification_id),--Primary ID
            FOREIGN KEY JB_user_id REFERENCES JB_Users (user_id) --Foreign Key
);

            INSERT INTO Qualifications 
            VALUES ('QID#01','Undergraduate','User01',6,'CoverTitle','G');

            INSERT INTO Qualifications 
            VALUES ('QID#02','Masters','User02',14,'CoverTitle2','Smart Serve');

            INSERT INTO Qualifications 
            VALUES ('QID#03','Bachelors','User03',2,'CoverTitle3','G2');
            
            SELECT * FROM Qualifications WHERE years_experience >= 5;
	
DROP TABLE Memberships;
CREATE TABLE Memberships (
		permission_id VARCHAR2(10 CHAR),
		user_id VARCHAR2(25 CHAR),
		M_type VARCHAR2(25 CHAR),
		Description VARCHAR2(25 CHAR),
		Start_date VARCHAR2(25 CHAR),
		End_date VARCHAR2(25 CHAR),
		CONSTRAINT permission_pk PRIMARY KEY(permission_id),
		FOREIGN KEY user_id REFERENCES JB_Users (user_id)
);

	INSERT INTO Memberships VALUES ('PID01', 'User01', 'Gold', 'one year paid', 'oct18,2021', 'oct18,2022');

DROP TABLE Connections;
CREATE TABLE Connections (
		conn_id VARCHAR2(12 CHAR),
		user_id VARCHAR2(25 CHAR),
		date_made VARCHAR2(25 CHAR),
		details VARCHAR2(150 CHAR),
		CONSTRAINT conn_pk PRIMARY KEY(conn_id),
		FOREIGN KEY user_id REFERENCES JB_Users (user_id)
);

	INSERT INTO Connections VALUES ('ConId01','User01','Oct18,2021','Software Manager');


DROP TABLE HR_Department;
CREATE TABLE HR_Department (
		depart_id VARCHAR2(25 CHAR),
		organization_id VARCHAR2(25 CHAR),
		depart_name VARCHAR2(50 CHAR),
		hr_manager VARCHAR2(50 CHAR),
		no_employees NUMBER,
		CONSTRAINT depart_pk PRIMARY KEY(depart_id),
		FOREIGN KEY organization_id REFERENCES Recruiters (recr_id)
);

			INSERT INTO HR_Department 
            VALUES ('Admin1','Org01','HR Adminstration', 'Mahdi',20);

            INSERT INTO HR_Department 
            VALUES ('Admin1','Org02','HR Adminstration', 'Ankit',20);

            INSERT INTO HR_Department 
            VALUES ('Admin1','Org03','HR Manager', 'Tusaif',20);

            SELECT * FROM HR_Department;