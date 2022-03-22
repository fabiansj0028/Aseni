ALTER PROCEDURE dbo.EndPoint5
AS
BEGIN
	SELECT Partidos.Nombre, Cantones.Nombre, 
	COUNT(CASE WHEN Calificaciones.Puntuacion < 3.33 THEN 1 END)*100/(SELECT COUNT(IdCalificacion)) Insatisfecho,
	COUNT(CASE WHEN Calificaciones.Puntuacion > 3.33 AND Calificaciones.Puntuacion < 6.66 THEN 1 END)*100/(SELECT COUNT(IdCalificacion)) Medianamente,
	COUNT(CASE WHEN Calificaciones.Puntuacion > 6.66 THEN 1 END)*100/(SELECT COUNT(IdCalificacion)) Altamente
	FROM Entregables
	INNER JOIN Acciones ON Acciones.IdAccion = Entregables.IdAccion
	INNER JOIN Planes ON Planes.IdPlan = Acciones.IdPlan
	INNER JOIN Partidos ON Partidos.IdPartido = Planes.IdPartido
	INNER JOIN Calificaciones ON Calificaciones.IdEntregable = Entregables.IdEntregable
	INNER JOIN Cantones ON Cantones.IdCanton = Entregables.IdCanton
	GROUP BY ROLLUP (Partidos.Nombre,Cantones.Nombre)
END
GO

