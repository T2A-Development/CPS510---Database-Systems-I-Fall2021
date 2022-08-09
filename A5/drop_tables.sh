#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "tazmat/08220278@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

DROP TABLE JB_Users CASCADE CONSTRAINTS;
DROP TABLE JB_Members CASCADE CONSTRAINTS;
DROP TABLE Recruiters CASCADE CONSTRAINTS;
DROP TABLE JB_Postings;
DROP TABLE Qualifications;
DROP TABLE Memberships;
DROP TABLE Connections;
DROP TABLE Departments;

exit;
EOF