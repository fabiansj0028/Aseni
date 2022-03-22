
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE dbo.EndPoint2

AS
BEGIN

	SET NOCOUNT ON;

		SELECT Nombre,Descripcion,[1] as Tercio1, [2] as Tercio2, [3] as Tercio3 
		FROM
		( SELECT P.Nombre, A.Descripcion, C.Puntuacion,
				 DENSE_RANK() OVER ( ORDER BY ((C.Puntuacion/3)%3)) AS TERCIOS
		  FROM Calificaciones C
		  INNER JOIN Entregables E ON E.IdEntregable = C.IdEntregable
		  INNER JOIN Acciones A ON A.IdAccion = E.IdAccion
		  INNER JOIN Partidos P ON P.IdPartido = E.IdPartido	
		) AS DR
		PIVOT
		(
		  COUNT(Puntuacion)
		  FOR TERCIOS IN
		  ([1],[2],[3])
		)
		AS PIVOTE

	SET NOCOUNT OFF;
END
GO
