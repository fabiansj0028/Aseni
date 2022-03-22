ALTER PROCEDURE EndPoint3 @palabras varchar(max)
AS
BEGIN
	SET LANGUAGE Spanish
	SELECT Ranks.Nombre Partido,Ranks.año2 AS AÑO,DateName( month , DateAdd( month ,Ranks.mes2, -1 )) MES,
	(
	SELECT CAST((SELECT COUNT(Entregables.IdEntregable) FROM Entregables 
		WHERE DATEPART(YEAR,Entregables.Fecha)=Ranks.año2 AND DATEPART(MONTH,Entregables.Fecha)=Ranks.mes2 AND Entregables.IdPartido=Ranks.IdPartido ) AS DECIMAL) * 100
	/
	(SELECT COUNT(Entregables.IdEntregable) FROM Entregables WHERE DATEPART(YEAR,Fecha)=Ranks.año2 AND Entregables.IdPartido=Ranks.IdPartido)) Porcentaje, Ranks.ranking
	FROM(
	SELECT Partidos.IdPartido,Partidos.Nombre,DATEPART(YEAR,Fecha) año2,DATEPART(month,Fecha) mes2 , DENSE_RANK() OVER(PARTITION BY Partidos.Nombre,DATEPART(YEAR,Fecha) ORDER BY DATEPART(YEAR,Fecha),DATEPART(month,Fecha)) AS ranking
	FROM Entregables
	INNER JOIN Partidos ON Partidos.IdPartido=Entregables.IdPartido
	INNER JOIN Acciones ON Acciones.IdAccion=Entregables.IdAccion
	WHERE FREETEXT (Acciones.Descripcion,@palabras)
	) as Ranks
	WHERE Ranks.ranking=1 OR Ranks.ranking=2 OR Ranks.ranking=3
	GROUP BY Ranks.Nombre, Ranks.IdPartido, Ranks.año2, Ranks.mes2, Ranks.ranking

END
