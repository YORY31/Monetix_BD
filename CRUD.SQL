----SP FOR CRUD
---INSERT USERR
USE MONETIX_APP;
GO
-------------------------------------------------------------------------------------------	
CREATE PROC INSERT_USER
@NAME NVARCHAR (100),
@LASTNAME NVARCHAR (100),
@EMAIL NVARCHAR (255),
@PASSWORDHASH NVARCHAR(255)
AS
BEGIN
	BEGIN TRANSACTION;
	BEGIN TRY
		INSERT INTO USERS (NAME_USER, LAST_NAME, EMAIL, PASSWORDHASH)
        VALUES (@Name, @LastName, @Email, @PasswordHash);
			
			SELECT SCOPE_IDENTITY() AS NEWUSERID;
			COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH;
END;
-----------------------------------------------------------------------------------
GO
CREATE PROC GET_USER
@USERID INT = NULL
AS
BEGIN
		IF @USERID IS NULL
			SELECT * FROM USERS WHERE ISVERIFICATED = 1;
	ELSE
			SELECT * FROM USERS WHERE ID_USER  = @USERID  AND  ISVERIFICATED = 1;
END;
--------------------------------------------------------------------------------
GO
CREATE PROC UPDATE_USER
@USERID INT,
@NAME NVARCHAR(100) = NULL,
@LASTNAMEE NVARCHAR(100) = NULL,
@EMAIL NVARCHAR(255) = NULL,
@PASSWORD NVARCHAR(255) = NULL
AS
BEGIN
	BEGIN TRANSACTION;
	BEGIN TRY
		UPDATE USERS
		SET
			NAME_USER = ISNULL(@NAME, NAME_USER),
			LAST_NAME = ISNULL(@LASTNAMEE, LAST_NAME),
			EMAIL = ISNULL(@EMAIL, EMAIL),
			PASSWORDHASH = ISNULL(@PASSWORD, PASSWORDHASH),
			LAST_LOGIN = GETDATE()
		WHERE ID_USER = @USERID;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH;
END;

----------------------------------------------------------------
GO
CREATE PROC DISABLE_USER
	@USERID INT
AS
BEGIN
	BEGIN TRANSACTION;
	BEGIN TRY
		UPDATE USERS
		SET ISVERIFICATED = 0
		WHERE ID_USER = @USERID

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH;
END;
------------------------------------------------------------------------------
