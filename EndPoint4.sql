ALTER PROCEDURE dbo.EndPoint4

AS BEGIN
	DECLARE @Por2 int= (SELECT COUNT(Calificaciones.IdCalificacion) FROM Calificaciones)*0.3
	SELECT  Cal.Nombre Partido ,100 *CAST(COUNT(Cal.IdPartido) as decimal)/(SELECT COUNT(Calificaciones.IdCalificacion) FROM Calificaciones) PorcentajeAceptacion,
	RANK() OVER(ORDER BY Cal.IdPartido ) Posicion,
	MAX(Cal.Puntuacion) MaximaNotaObtenida
	FROM(
		SELECT TOP (@Por2) Entregables.IdPartido,Partidos.Nombre,Entregables.IdEntregable,Puntuacion  FROM Entregables
		INNER JOIN Calificaciones ON Calificaciones.IdEntregable=Entregables.IdEntregable
		INNER JOIN Partidos ON Partidos.IdPartido = Entregables.IdPartido
		Group BY Entregables.IdPartido,Entregables.IdEntregable,Puntuacion, Partidos.Nombre
		ORDER BY Calificaciones.Puntuacion DESC
	) as Cal
	GROUP BY Cal.Nombre, Cal.IdPartido
END

