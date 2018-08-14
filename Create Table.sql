Create Table Mortgage.LoanInfo (

"Loan No" nvarchar(50) primary key,
"Loan Amount" nvarchar(50),
"Interest Rate" nvarchar(50),
"Multiple Borrower" bit
)

Create Table Mortgage.BorrowerInfo (

"ID" nvarchar(50) primary key,
"First Name" nvarchar(50),
"Middle Name" nvarchar(50),
"Last Name" nvarchar(50),
SSN nvarchar(50) NOT NULL,
Email nvarchar(50),
"Phone Number" nvarchar(50),
"Marital Status" nvarchar(50),
)

/*
Alter Table Mortgage.BorrowerInfo
Drop Column "Spouse ID" 
*/


Create Table Mortgage.NonBorrowerInfo (

"ID" nvarchar(50) primary key,
"First Name" nvarchar(50),
"Middle Name" nvarchar(50),
"Last Name" nvarchar(50)
"Spouse ID" nvarchar(50)
)

CREATE TABLE Mortgage.CoBorrowerInfo (
ID  nvarchar(50),
FullName nvarchar(50)
"Loan No" nvarchar(50)
)

CREATE TABLE Mortgage.PriBorrowerInfo (
ID  nvarchar(50),
FullName nvarchar(50)
"Loan No" nvarchar(50)
)

CREATE TABLE Mortgage.NameAudit (
LoanNo nvarchar(50),
Name nvarchar(50),
"Date" nvarchar(50)
)


SELECT  * INTO Mortgage.T_LoanDetails FROM Mortgage.V_LoanDetails