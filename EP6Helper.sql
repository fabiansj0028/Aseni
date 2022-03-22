ALTER PROCEDURE dbo.EP6Helper
	@inUsuario INT,
	@inIdPlan INT,
	@ListaEntreg VARCHAR(max),
	@ListaCalif VARCHAR(max)
AS
BEGIN
	
	DECLARE @TablaEntregables AS TABLE(ID INT IDENTITY, IdEntregable INT)
	
	DECLARE @TablaCalificaciones AS TABLE(ID INT IDENTITY, Calificacion INT)

	DECLARE @TablaType EndPoint6Type

	INSERT INTO @TablaEntregables(IdEntregable)
	SELECT VALUE as Valor1 FROM string_split(@ListaEntreg,',')

	INSERT INTO @TablaCalificaciones(Calificacion)
	SELECT VALUE FROM string_split(@ListaCalif,',')
	
	INSERT INTO @TablaType(EntregableID, Puntuacion)
	SELECT A.IdEntregable,B.Calificacion 
	FROM @TablaEntregables A
	INNER JOIN @TablaCalificaciones B ON A.ID = B.ID

	EXEC dbo.EndPoint6 @IdUsuario = @inUsuario, @IdPlan = @inIdPlan, @ListEntregables = @TablaType
END
