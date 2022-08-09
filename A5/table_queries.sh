#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "tazmat/08220278@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF	
-----------------------------------------------------------
---- *********    Querries     ************* --------------
-----------------------------------------------------------

-- Table Views

CREATE VIEW MEMBER_DETAILS AS 
    SELECT MEMBER_ID, LOGIN_ID, MEMBER_TYPE, MEMBER_NAME
    FROM JB_MEMBERS, JB_USERS
    WHERE JB_USERS.LOGIN_ID = JB_MEMBERS.MEMBER_NAME;

CREATE VIEW MEMBER_WITH_MEMBERSHIPS AS 
    SELECT MEMBER_ID, MEMBER_TYPE, MEMBER_NAME, M_TYPE
    FROM JB_MEMBERS, MEMBERSHIPS
    WHERE JB_MEMBERS.MEMBER_NAME = MEMBERSHIPS.USER_ID;
    
select * from member_with_memberships;
	
CREATE VIEW ORGANIZATIONS_WITH_DEPARTMENTS AS 
    SELECT RECR_ID, DEPART_NAME, NO_EMPLOYEES
    FROM RECRUITERS, DEPARTMENTS
    WHERE RECR_ID = ORG_ID;
    
select * from ORGANIZATIONS_WITH_DEPARTMENTS;

CREATE VIEW posting_by_recruiter as 
	SELECT job_id,job_title,job_location FROM JB_Postings
	WHERE company = 'org01';

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

-- advanced Querries

SELECT *
from jb_members
where member_name IN (select jb_user_id from qualifications);

SELECT *
from jb_members
where member_name NOT IN (select jb_user_id from qualifications);
 

exit;
EOF