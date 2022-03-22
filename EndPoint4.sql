SELECT Nombre, RANK() OVER(ORDER BY SUM(Resultado) desc) as Rank, SUM(Resultado) as Suma FROM
(
SELECT Temporal2.Nombre,(SELECT SUM(Temporal2.Puntuacion) WHERE ranking <Temporal2.Porcentaje) Resultado FROM
	(
	SELECT Partidos.Nombre, Temporal.Porcentaje, Row_Number () OVER(Partition by Partidos.Nombre ORDER BY Calificaciones.Puntuacion Desc  ) Ranking, Calificaciones.Puntuacion
	FROM 
	(
		SELECT P.IdPartido, COUNT(C.IdCalificacion)*0.3 Porcentaje FROM Calificaciones C
		INNER JOIN Entregables E ON C.IdEntregable = E.IdEntregable
		INNER JOIN Partidos P ON P.IdPartido = E.IdPartido
		Group by P.IdPartido
	) Temporal
	INNER JOIN Partidos ON Partidos.IdPartido = Temporal.IdPartido
	INNER JOIN Entregables ON Entregables.IdPartido = Partidos.IdPartido
	INNER JOIN Calificaciones ON Calificaciones.IdEntregable = Entregables.IdEntregable
	) Temporal2
	GROUP BY Temporal2.Nombre, Temporal2.Ranking, Temporal2.Porcentaje
) Temporal3
GROUP BY Nombre


	SELECT P.Nombre as Partido,CT.Nombre,A.Descripcion, COUNT(C.IdCalificacion)*0.3 CalifEnCuenta FROM Calificaciones C 
	INNER JOIN Entregables E ON C.IdEntregable = E.IdEntregable
	INNER JOIN Partidos P ON P.IdPartido= E.IdPartido
	INNER JOIN Acciones A ON A.IdAccion = E.IdAccion
	INNER JOIN Cantones CT ON CT.IdCanton = E.IdCanton
	GROUP BY A.Descripcion,CT.Nombre,P.Nombre
	ORDER BY P.Nombre

