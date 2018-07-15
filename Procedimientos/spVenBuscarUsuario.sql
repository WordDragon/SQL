-----------------------------------------------------------------------------------------------------------------------------------------
-- CREA SP spVenBuscaUsuario
-- VER. AUTOR   :     Darwin Cantuta Zegobia
-- VER. FECHA   :     2018 - Julio - 12
-- VER. DESCR   :     Procedimiento almacenado "spVenBuscaUsuario" el cual busca el usuario para autenticar el acceso al sistema
-----------------------------------------------------------------------------------------------------------------------------------------

--USE LABIC

--EXEC spVenBuscaUsuario 'darwin','12345'

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spVenBuscaUsuario')
	DROP PROCEDURE spVenBuscaUsuario
GO

CREATE PROCEDURE spVenBuscaUsuario
	@usrId VARCHAR(50),
	@usrPassword VARCHAR(50)
WITH ENCRYPTION
AS BEGIN
	-- DEFINE OPCIONES DE EJECUCION
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	-- DECLARA VARIABLES
	DECLARE @strNombreSP VARCHAR(200) = 'spVenBuscaUsuario - ' + ISNULL(@usrId,'');
	DECLARE @strMensajeError VARCHAR(500);
	DECLARE @strMensajeSalida VARCHAR(5000);

	BEGIN TRY
		SELECT usrId FROM usuario WHERE usrId = @usrId AND usrPassword = @usrPassword
	END TRY
	BEGIN CATCH
		DECLARE @ErrorNumber    INT				= ERROR_NUMBER(); 
		DECLARE @ErrorMessage   NVARCHAR(4000)	= ERROR_MESSAGE();   
		DECLARE @ErrorSeverity	INT				= ERROR_SEVERITY();
        DECLARE @ErrorState		INT				= ERROR_STATE(); 
		DECLARE @ErrorProcedure NVARCHAR(4000)	= ERROR_PROCEDURE();     
		DECLARE @ErrorLine      INT				= ERROR_LINE();
		SET @strMensajeSalida = ISNULL(@strMensajeError, '') + ' - ' + @ErrorMessage;
	END CATCH;
END;