USE [Aseni]
GO
/****** Object:  StoredProcedure [dbo].[Califica]    Script Date: 3/22/2022 8:49:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Califica]
	@Usuario INT 
AS
BEGIN
	DECLARE @Canton INT = (SELECT IdCanton FROM CantonesPorUsuario WHERE IdUsuario = @Usuario)
	DECLARE @Tablatemp TABLE(ID INT IDENTITY(1,1),IdEntregable INT)
	INSERT INTO @TablaTemp
	SELECT E.IdEntregable FROM Entregables E WHERE E.IdCanton = @Canton

	DECLARE @Calificacion INT 
	DECLARE @Primero INT, @Ultimo INT
	DECLARE @IdEntregable INT

	SET @Ultimo = (SELECT MAX(ID) FROM @TablaTemp)
	SET @Primero = 1

	WHILE(@Primero < @Ultimo)
	BEGIN
		SET @Calificacion = RAND()*(10-1)+1;
		SET @IdEntregable = (SELECT IdEntregable FROM @TablaTemp WHERE ID = @Primero)

		IF NOT EXISTS( SELECT @Usuario, @Canton FROM Calificaciones as C WHERE C.IdUsuario=@Usuario and C.IdEntregable=@IdEntregable)
		INSERT INTO Calificaciones
		VALUES(@Usuario, @Canton,@IdEntregable, @Calificacion,NULL,getdate())
		SET @Primero = @Primero+1
	END
	
END
