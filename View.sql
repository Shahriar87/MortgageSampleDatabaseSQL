ALTER VIEW Mortgage.V_LoanDetails
AS

SELECT A.[Loan No],A.[Loan Amount],A.[Interest Rate],
B.FullName AS PrimaryBorrower, C.FullName AS CoBorrower,
D."First Name"+' '+D."Middle Name"+' '+D."Last Name" AS NBS
FROM Mortgage.LoanInfo A 
JOIN Mortgage.BorrowerInfo E ON A.[Loan No]=E.[Loan No]
RIGHT JOIN Mortgage.PriBorrowerInfo B ON E.ID = B.ID
FULL JOIN Mortgage.CoBorrowerInfo C ON B.[Loan No] = C.[Loan No]
FULL JOIN Mortgage.NonBorrowerInfo D ON D.[Spouse ID]=E.ID


