CREATE PROCEDURE dbo.EndPoint1 AS
BEGIN
    SELECT Cantones.Nombre, Entregables.kpivalue FROM(
    SELECT Cantones.Nombre FROM Entregables
    INNER JOIN Cantones ON Cantones.IdCanton=Entregables.IdCanton
    WHERE Fecha<DATEADD(DAY,100,'2022-05-08')
    EXCEPT
    SELECT Cantones.Nombre FROM Entregables
    INNER JOIN Cantones ON Cantones.IdCanton=Entregables.IdCanton
    WHERE Fecha>DATEADD(DAY,-100,'2026-05-08')) as subq1
    inner join Cantones ON Cantones.Nombre= subq1.Nombre
    INner join Entregables on Entregables.IdCanton=Cantones.IdCanton
    WHERE Fecha<DATEADD(DAY,100,'2022-05-08') and Cantones.Nombre=subq1.Nombre
END
GO