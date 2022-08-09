#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "tazmat/08220278@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF


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
 

	INSERT INTO JB_Members VALUES ('Member01', 'job seeker', '123 park street, Toronto', 'n/a', 'seeker01@gmail.com', 'oct18 2021', 'User07');
	INSERT INTO JB_Members VALUES ('Member02', 'job seeker/member', '225 high park street, Toronto', 'Gold', 'seeker02@gmail.com', 'oct18 2021', 'User03');
	INSERT INTO JB_Members VALUES ('Member03', 'Organization HR memeber', '1122 Young street, Toronto', 'Silver', 'hr-manager01@gmail.com', 'oct18 2021', 'User04');
	INSERT INTO JB_Members VALUES ('Member04', 'job seeker/member', '789 waterdown road, Toronto', 'Platinum', 'seeker03@gmail.com', 'oct18 2021', 'User01');
	INSERT INTO JB_Members VALUES ('Member05', 'job seeker', '555 lockdown street, Toronto', 'n/a', 'seeker04@gmail.com', 'oct19 2021', 'User08');
	INSERT INTO JB_Members VALUES ('Member06', 'job seeker/member', '124 hunter blvd., Toronto', 'Platinum', 'seeker05@gmail.com', 'oct20 2021', 'User02');
	INSERT INTO JB_Members VALUES ('Member07', 'job seeker', '5000 hiking road, Toronto', 'n/a', 'seeker06@gmail.com', 'oct21 2021', 'User07');
	INSERT INTO JB_Members VALUES ('Member08', 'Organization HR memeber', '6600 mississauga road, Mississauga,ON L0A L0A', 'Gold', 'hr-manager02@gmail.com', 'oct22 2021', 'User05');
	INSERT INTO JB_Members VALUES ('Member09', 'Organization HR memeber', '987 hospital road, Toronto', 'Platinum', 'hr-manager03@gmail.com', 'oct23 2021', 'User010');
	INSERT INTO JB_Members VALUES ('Member10', 'Organization HR memeber', '321 anystreet road, Toronto', 'Platinum', 'hr-manager04@gmail.com', 'oct23 2021', 'User11');
	INSERT INTO JB_Members VALUES ('Member11', 'Organization HR memeber', '852 anyroad road, Toronto', 'Silver', 'hr-manager05@gmail.com', 'oct23 2021', 'User12');
	INSERT INTO JB_Members VALUES ('Member12', 'Organization HR memeber', '2233 xyzxyz road, Toronto', 'Platinum', 'hr-manager06@gmail.com', 'oct23 2021', 'User06');


INSERT INTO Recruiters VALUES ('Org01', 'Member03', 'oct18 2021', 'org01@somemail.com', '416-111-2222', '111-1122 young street toronto');
INSERT INTO Recruiters VALUES ('Org02', 'Member08', 'oct19 2021', 'org02@somemail.com', '416-222-3333', '6600 mississauga road, Mississauga,ON L0A L0A');
INSERT INTO Recruiters VALUES ('Org03', 'Member09', 'oct20 2021', 'org02@somemail.com', '416-333-4444', '987 hospital road, Toronto');
INSERT INTO Recruiters VALUES ('Org04', 'Member10', 'oct18 2021', 'org04@somemail.com', '416-444-5555', '321 anystreet road, Toronto');
INSERT INTO Recruiters VALUES ('Org05', 'Member11', 'oct19 2021', 'org05@somemail.com', '416-555-6666', '852 anyroad road, Toronto');
INSERT INTO Recruiters VALUES ('Org06', 'Member12', 'oct20 2021', 'org06@somemail.com', '416-666-7777', '2233 xyzxyz road, Toronto');



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



INSERT INTO Qualifications VALUES ('QID#01','Undergraduate','User01',3,'CoverTitle','G');
INSERT INTO Qualifications VALUES ('QID#02','Masters','User02',7,'CoverTitle2','Smart Serve');
INSERT INTO Qualifications VALUES ('QID#03','Bachelors','User03',4,'CoverTitle3','G2');
INSERT INTO Qualifications VALUES ('QID#04','Undergraduate','User07',8,'CoverTitle4','G');
INSERT INTO Qualifications VALUES ('QID#05','Masters','User08',14,'CoverTitle5','Smart Serve');
INSERT INTO Qualifications VALUES ('QID#06','Bachelors','User09',5,'CoverTitle6','G2');



	INSERT INTO Memberships VALUES ('PID01', 'User01', 'Platinum', 'one year paid', 'oct18,2021', 'oct18,2022');
	INSERT INTO Memberships VALUES ('PID02', 'User02', 'Platinum', 'one year paid', 'oct18,2021', 'oct18,2022');
	INSERT INTO Memberships VALUES ('PID03', 'User03', 'Gold', 'one year paid', 'oct18,2021', 'oct18,2022');
	INSERT INTO Memberships VALUES ('PID04', 'User04', 'Silver', 'one year paid', 'oct18,2021', 'oct18,2022');
	INSERT INTO Memberships VALUES ('PID05', 'User05', 'Platinum', 'one year paid', 'oct18,2021', 'oct18,2022');
	INSERT INTO Memberships VALUES ('PID06', 'User06', 'Platinum', 'one year paid', 'oct18,2021', 'oct18,2022');
	INSERT INTO Memberships VALUES ('PID07', 'User10', 'Platinum', 'one year paid', 'oct18,2021', 'oct18,2022');
	INSERT INTO Memberships VALUES ('PID08', 'User11', 'Gold', 'one year paid', 'oct18,2021', 'oct18,2022');
	INSERT INTO Memberships VALUES ('PID09', 'User12', 'Silver', 'one year paid', 'oct18,2021', 'oct18,2022');



INSERT INTO Connections VALUES ('ConId01','Member02','Oct18,2021','REFERENCES');
INSERT INTO Connections VALUES ('ConId02','Member04','Oct18,2021','REFERENCES');
INSERT INTO Connections VALUES ('ConId03','Member06','Oct18,2021','REFERENCES');
INSERT INTO Connections VALUES ('ConId04','Member02','Oct18,2021','REFERENCES');
	

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

exit;
EOF