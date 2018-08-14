Use Sample_Mortgage;

INSERT INTO Mortgage.LoanInfo Values 
--(20005,215000,3.75,0)
(20008, 170000, 4.0, 0)
;


INSERT INTO Mortgage.BorrowerInfo Values
(12,'Kevin','Ross','Murray',777777777,'mra@gmail.com',7890123456,1,20008,0);
INSERT INTO Mortgage.BorrowerInfo Values
(13,'Ava', '', 'Murray', 999999999, 'sh@yahoo.com', 4567891234, 1, 20008 ,1)

;



--INSERT INTO Mortgage.BorrowerInfo Values
--(8,'Susan','','Water',888888888,'sw@gmail.com',8901234567,1,20005,1)
;




INSERT INTO Mortgage.NonBorrowerInfo Values 
(6,'Ava','','Murray',12)





INSERT INTO Mortgage.T_LoanDetails SELECT * FROM Mortgage.V_LoanDetails 
EXCEPT SELECT * FROM Mortgage.T_LoanDetails;









select * from Mortgage.BorrowerInfo
select * from Mortgage.CoBorrowerInfo
select * from Mortgage.NonBorrowerInfo
select * from Mortgage.PriBorrowerInfo
select * from Mortgage.LoanInfo
select * from Mortgage.T_LoanDetails
select * from Mortgage.V_LoanDetails
select * from Mortgage.NameAudit

