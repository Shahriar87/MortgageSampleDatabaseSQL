
SELECT *FROM Mortgage.V_LoanDetails
WHERE CoBorrower IN (Select NBS from Mortgage.V_LoanDetails)

--After Trigger for Audit data

CREATE TRIGGER tr_checkNBS_AfterInsert
ON Mortgage.T_LoanDetails
FOR INSERT
AS
BEGIN
	declare @LoanNo int
	declare @Name nvarchar(50)
	declare @Name2 nvarchar(50)
	
	select @LoanNo =  "Loan No" From inserted
	Select @Name = NBS from inserted
	Select @Name2 = CoBorrower from inserted

	IF (@Name IN (Select CoBorrower from inserted))
		
		INSERT INTO Mortgage.NameAudit 
		Values (@LoanNo, @Name, Cast(Getdate() as nvarchar(50)))
		
	Else IF (@Name2 IN (Select NBS from inserted))
		
		INSERT INTO Mortgage.NameAudit 
		Values (@LoanNo, @Name, Cast(Getdate() as nvarchar(50)))

	Else

		PRINT 'No Duplicate NBS entry'

END



--After Trigger for Insert from Borrower to PriBorrower & CoBorrower

CREATE TRIGGER tr_PrimaryCoBorower_AfterInsert
on Mortgage.BorrowerInfo
FOR INSERT
AS
BEGIN

	declare @BP bit
	select @BP = "Borrower Priority" from inserted
	
	declare @ID nvarchar(50)
	declare @FN nvarchar(50)
	declare @LN nvarchar(50)

	Select @ID = "ID" from inserted
	Select @FN = (SELECT "First Name"+' '+"Middle Name"+' '+"Last Name" AS FullName from inserted)
	Select @LN = [Loan No] from inserted

	IF (@BP=0)
		
		INSERT INTO Mortgage.PriBorrowerInfo 
		Values (@ID,@FN,@LN)

		
	ELSE IF (@BP=1)
			
		INSERT INTO Mortgage.CoBorrowerInfo 
		Values (@ID,@FN,@LN)

	ELSE 
		Print 'Invalid Borrower Priority'

END	


