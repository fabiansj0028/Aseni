ALTER PROCEDURE dbo.EndPoint6
	@IdUsuario INT,
	@IdPlan INT,
	@ListEntregables EndPoint6Type READONLY
AS
BEGIN
	DECLARE @CantonUsuario INT

	SET NOCOUNT ON SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	BEGIN TRY

		SET @CantonUsuario = (SELECT IdCanton FROM CantonesPorUsuario WHERE IdUsuario = @IdUsuario)

		BEGIN TRANSACTION InsertarCalificaciones

			INSERT INTO Calificaciones
			SELECT @IdUsuario, @CantonUsuario,IdEntregable, Puntuacion, NULL, GETDATE() 
			FROM @ListEntregables L
			INNER JOIN Entregables E ON E.IdEntregable = EntregableID AND E.IdPlan = @IdPlan

		COMMIT TRANSACTION InsertarCalificaciones
		SELECT '200 OK'
	END TRY
	BEGIN CATCH
		SELECT
            ERROR_NUMBER()    AS  NumeroError,
            ERROR_STATE()     AS  EstadoError,
            ERROR_SEVERITY()  AS  SeveridadError,
            ERROR_PROCEDURE() AS  ErrorDeProcedimiento,
            ERROR_LINE()      AS  LineaError,
            ERROR_MESSAGE()   AS  MensajeError

        -- Non committable transaction.
        IF (XACT_STATE()) = -1
            ROLLBACK TRANSACTION InsertarCalificaciones

        -- Committable transaction.
        IF (XACT_STATE()) = 1
            COMMIT TRANSACTION InsertarCalificaciones
	END CATCH

END
GO
