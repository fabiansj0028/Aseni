USE [Aseni]
GO
/****** Object:  StoredProcedure [dbo].[EndPoint4]    Script Date: 3/22/2022 8:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[EndPoint4] 
AS
BEGIN

SELECT Partido, AVG(PorcentajeAceptacion) porcentaje, RANK() OVER(Order by AVG(PorcentajeAceptacion) desc) as rank,
(SELECT MAX( Puntuacion) top1 FROM Calificaciones C 
                    INNER JOIN Entregables E ON E.IdEntregable=C.IdEntregable
                    INNER JOIN Partidos P ON P.IdPartido=E.IdPartido
                    WHERE P.Nombre=Tab4.Partido ) as NotaMaximaObtenida
FROM 
(
    SELECT Partido, Accion,
    (
        SELECT AVG(CAST(abc as decimal))*10  promedio FROM(SELECT TOP (30) PERCENT Puntuacion abc FROM Calificaciones C 
                    INNER JOIN Entregables E ON E.IdEntregable=C.IdEntregable
                    INNER JOIN Partidos P ON P.IdPartido=E.IdPartido
                    INNER JOIN Acciones A ON A.IdAccion = Tab3.Accion
                    WHERE P.Nombre=Tab3.Partido and A.IdAccion=E.IdAccion 
                    ORDER BY Puntuacion desc) as tr
    ) PorcentajeAceptacion FROM
        (
            SELECT Partido,Accion,Promedio FROM
                (
                    SELECT Partido,Canton,Accion,AVG(cal) promedio, MAX(AVG(cal)) OVER (PARTITION BY Partido, Accion ORDER BY Accion) maxim, MIN(AVG(cal)) OVER (PARTITION BY Partido, Accion ORDER BY Accion) minim  FROM
                    (
                        SELECT P.Nombre Partido,CT.IdCanton Canton,C.Puntuacion cal,A.IdAccion Accion, ROW_Number() OVER (Partition by A.IdACcion,CT.IdCanton,P.IdPartido order by C.Puntuacion desc) as Num,
                        COUNT(*) OVER(Partition by A.IdACcion,CT.IdCanton,P.IdPartido) as Tot
                        FROM Calificaciones C
                        INNER JOIN Entregables E ON E.IdEntregable=C.IdEntregable
                        INNER JOIN Partidos P ON P.IdPartido=E.IdPartido
                        INNER JOIN Acciones A ON A.IdAccion=E.IdAccion
                        INNER JOIN Cantones CT ON CT.IdCanton=E.IdCanton
                    ) as tab1
                WHERE Num<=(SELECT ceiling(CAST(tot as decimal)*30/100))
                GROUP BY Partido,Accion,Canton
        ) as tab2
                WHERE (maxim-minim)<=2
        ) as tab3
    GROUP BY tab3.Partido, tab3.Accion
) as tab4
GROUP BY tab4.Partido


END

