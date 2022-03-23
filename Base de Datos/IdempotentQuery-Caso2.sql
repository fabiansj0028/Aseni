
IF NOT EXISTS (SELECT name FROM master.sys.databases WHERE name = N'Aseni')
BEGIN
	CREATE DATABASE [Aseni];
END
GO
USE Aseni

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Usuarios') 
BEGIN
	CREATE TABLE Usuarios( IdUsuario INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
						   Nombre VARCHAR(16) NOT NULL,
						   Apellidos VARCHAR(32) NOT NULL,
						   Contraseña VARCHAR(16) NOT NULL,
						   CreationDate DATE DEFAULT(getdate()),
						   Cedula VARCHAR(9) NOT NULL,
						   Tipo BIT DEFAULT(0)
						 );
END

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='UsuarioJefeCampaña') 
BEGIN
	CREATE TABLE UsuarioJefeCampaña( IdUsuario INT FOREIGN KEY References Usuarios(IdUsuario) NOT NULL,
					       UrlFoto varchar(150) NOT NULL,
						   Partido varchar(80) NOT NULL,
						   UrlBandera varchar(150) NOT NULL,
						   Biografia varchar(1000) NOT NULL,
						   checksum VARBINARY(120) NULL,
						   UltimaActualizacion DATE DEFAULT(getdate())
						 );
END


IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Provincias') 
BEGIN
	CREATE TABLE Provincias(IdProvincia INT IDENTITY(1,1) PRIMARY KEY,
							Nombre VARCHAR(16) NOT NULL)
END
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'San José') INSERT INTO Provincias Values('San José')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Cartago') INSERT INTO Provincias Values('Cartago')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Alajuela') INSERT INTO Provincias Values('Alajuela')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Puntarenas') INSERT INTO Provincias Values('Puntarenas')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Limón') INSERT INTO Provincias Values('Limón')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Guanacaste') INSERT INTO Provincias Values('Guanacaste')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Heredia') INSERT INTO Provincias Values('Heredia')

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Cantones') 
BEGIN
	CREATE TABLE Cantones(IdCanton INT IDENTITY(1,1) PRIMARY KEY,
							Nombre VARCHAR(32) NOT NULL,
							IdProvincia INT FOREIGN KEY References Provincias(IdProvincia) NOT NULL
						 );
END
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Abangares' AND C.IdProvincia = 6)
INSERT INTO Cantones VALUES('Abangares',6)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Bagaces' AND C.IdProvincia =6 )
INSERT INTO Cantones VALUES('Bagaces',6)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Acosta' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Acosta',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Alajuelita' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Alajuelita',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Barva' AND C.IdProvincia =7 )
INSERT INTO Cantones VALUES('Barva',7)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Atenas' AND C.IdProvincia =3 )
INSERT INTO Cantones VALUES('Atenas',3)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Cartago' AND C.IdProvincia =2 )
INSERT INTO Cantones VALUES('Cartago',2)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Esparza' AND C.IdProvincia = 4 )
INSERT INTO Cantones VALUES('Esparza',4)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Guácimo' AND C.IdProvincia =5 )
INSERT INTO Cantones VALUES('Guácimo',5)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Matina' AND C.IdProvincia =5 )
INSERT INTO Cantones VALUES('Matina',5)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Álvarado' AND C.IdProvincia =2 )
INSERT INTO Cantones VALUES('Álvarado',2)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Aserri' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Aserri',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Belén' AND C.IdProvincia =7 )
INSERT INTO Cantones VALUES('Belén',7)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Buenos Aires' AND C.IdProvincia =4 )
INSERT INTO Cantones VALUES('Buenos Aires',4)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Cañas' AND C.IdProvincia =6 )
INSERT INTO Cantones VALUES('Cañas',6)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Carrillo' AND C.IdProvincia =6 )
INSERT INTO Cantones VALUES('Carrillo',6)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Corredores' AND C.IdProvincia =4 )
INSERT INTO Cantones VALUES('Corredores',4)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Curridabat' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Curridabat',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Desamparados' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Desamparados',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Dota' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Dota',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'El Guarco' AND C.IdProvincia =2 )
INSERT INTO Cantones VALUES('El Guarco',2)

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Partidos') 
BEGIN
	CREATE TABLE Partidos(IdPartido INT IDENTITY(1,1) PRIMARY KEY,
							Nombre VARCHAR(32) NOT NULL,
							urlFlag NCHAR(10) null,
							CreationDate DATE DEFAULT(getdate())
						 );
END
IF NOT EXISTS(SELECT P.Nombre FROM Partidos P WHERE P.Nombre = 'PLN')INSERT INTO Partidos VALUES('PLN',NULL,'1982-10-12')
IF NOT EXISTS(SELECT P.Nombre FROM Partidos P WHERE P.Nombre = 'PAC')INSERT INTO Partidos VALUES('PAC',NULL,'1982-12-03')
IF NOT EXISTS(SELECT P.Nombre FROM Partidos P WHERE P.Nombre = 'PUSC')INSERT INTO Partidos VALUES('PUSC',NULL,'1983-12-17')
IF NOT EXISTS(SELECT P.Nombre FROM Partidos P WHERE P.Nombre = 'PIN')INSERT INTO Partidos VALUES('PIN',NULL,'1996-01-30')
IF NOT EXISTS(SELECT P.Nombre FROM Partidos P WHERE P.Nombre = 'PRC')INSERT INTO Partidos VALUES('PRC',NULL,'1995-03-06')
IF NOT EXISTS(SELECT P.Nombre FROM Partidos P WHERE P.Nombre = 'PNR')INSERT INTO Partidos VALUES('PNR',NULL,'2019-01-30')

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Planes') 
BEGIN
	CREATE TABLE Planes(IdPlan INT IDENTITY(1,1) PRIMARY KEY,
							Titulo VARCHAR(MAX) NOT NULL,
							Descripcion VARCHAR(MAX) NOT NULL,
							IdPartido INT FOREIGN KEY References Partidos(IdPartido) NOT NULL
						 );
END
IF NOT EXISTS(SELECT P.Titulo FROM Planes P WHERE P.Titulo = 'La Via Costarricense al Bienvivir') INSERT INTO Planes VALUES('La Via Costarricense al Bienvivir','Gobernar con éxito exige un propósito superior. El nuestro es el bienvivir de las personas  en Costa Rica.',1)
IF NOT EXISTS(SELECT P.Titulo FROM Planes P WHERE P.Titulo = 'Propuesta Programática') INSERT INTO Planes VALUES('Propuesta Programática','Tomamos como base la visión de sociedad y las prioridades de política pública que históricamente el Partido Acción Ciudadana ha venido planteando desde sus Congresos Ciudadanos.',2)
IF NOT EXISTS(SELECT P.Titulo FROM Planes P WHERE P.Titulo = 'La Ruta de la Activación') INSERT INTO Planes VALUES('La Ruta de la Activación','El compromiso de la Presidencia será gobernar de la mano con el sector privado',3)
IF NOT EXISTS(SELECT P.Titulo FROM Planes P WHERE P.Titulo = 'Salvando a Costa Rica en tiempos de Sindemia') INSERT INTO Planes VALUES('Salvando a Costa Rica en tiempos de Sindemia','Costa Rica cuenta con suficiente institucionalidad y legislación para promover la inversión nacional y extranjera',4)
IF NOT EXISTS(SELECT P.Titulo FROM Planes P WHERE P.Titulo = 'Un país comprometido con el bienestar de de las familias') INSERT INTO Planes VALUES('Un país comprometido con el bienestar de de las familias','Apoyo a la familia costarricense, especialmente a las más desfavorecidas',5)
IF NOT EXISTS(SELECT P.Titulo FROM Planes P WHERE P.Titulo = 'Plan Esperanza') INSERT INTO Planes VALUES('Plan Esperanza','Recuperar nuestra cultura, forma de pensar y vivir',6)

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Acciones') 
BEGIN
	CREATE TABLE Acciones(IdAccion INT IDENTITY(1,1) PRIMARY KEY,
							Descripcion VARCHAR(120) NOT NULL,
							IdPlan INT FOREIGN KEY References Planes(IdPlan) NOT NULL
						 );
END
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Asfaltar Carreteras' AND A.IdPlan = 1) INSERT INTO Acciones VALUES('Asfaltar Carreteras',1)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Aumentar el alcance de agua potable' AND A.IdPlan = 1) INSERT INTO Acciones VALUES('Aumentar el alcance de agua potable',1)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Expansion de EBAIS en comunidades' AND A.IdPlan = 1) INSERT INTO Acciones VALUES('Expansion de EBAIS en comunidades',1)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Bono a PYMES de todo el pais para impulsar sus proyectos' AND A.IdPlan = 1) INSERT INTO Acciones VALUES('Bono a PYMES de todo el pais para impulsar sus proyectos',1)

IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Crear viviendas bono para necesitados' AND A.IdPlan = 2) INSERT INTO Acciones VALUES('Crear viviendas bono para necesitados',2)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Ampliar el acueducto metropolitano' AND A.IdPlan = 2) INSERT INTO Acciones VALUES('Ampliar el acueducto metropolitano',2)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Establecer estructura de fibra optica en todas las regiones' AND A.IdPlan = 2) INSERT INTO Acciones VALUES('Establecer estructura de fibra optica en todas las regiones',2)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Producir empleos para la poblacion para mejorar la economia' AND A.IdPlan = 2) INSERT INTO Acciones VALUES('Producir empleos para la poblacion para mejorar la economia',2)

IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Ciclovias' AND A.IdPlan = 3) INSERT INTO Acciones VALUES('Ciclovias',3)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Asfaltar Carreteras' AND A.IdPlan = 3) INSERT INTO Acciones VALUES('Asfaltar Carreteras',3)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Educacion bilingue en todas las escuelas del pais' AND A.IdPlan = 3) INSERT INTO Acciones VALUES('Educacion bilingue en todas las escuelas del pais',3)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Impulsar el uso de la quinta generacion de comunicacion 5G' AND A.IdPlan = 3) INSERT INTO Acciones VALUES('Impulsar el uso de la quinta generacion de comunicacion 5G',3)


IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Rampas para personas con discapacidad' AND A.IdPlan = 4) INSERT INTO Acciones VALUES('Rampas para personas con discapacidad',4)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Fortalecer un cuido infantil asequible' AND A.IdPlan = 4) INSERT INTO Acciones VALUES('Fortalecer un cuido infantil asequible',4)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Plan para el desarrollo de poblaciones indigenas' AND A.IdPlan = 4) INSERT INTO Acciones VALUES('Plan para el desarrollo de poblaciones indigenas',4)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Fortalecimiento de la policia nacional' AND A.IdPlan = 4) INSERT INTO Acciones VALUES('Fortalecimiento de la policia nacional',4)

IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Impulso del sector turistico con inversion extranjera directa' AND A.IdPlan = 5) INSERT INTO Acciones VALUES('Impulso del sector turistico con inversion extranjera directa',5)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Sistema de electrificacion rural' AND A.IdPlan = 5) INSERT INTO Acciones VALUES('Sistema de electrificacion rural',5)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Educacion adulto mayores' AND A.IdPlan = 5) INSERT INTO Acciones VALUES('Educacion adulto mayores',5)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Fortalecimiento de la policia nacional' AND A.IdPlan = 5) INSERT INTO Acciones VALUES('Fortalecimiento de la policia nacional',5)

IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Crear viviendas bono para necesitados' AND A.IdPlan = 6) INSERT INTO Acciones VALUES('Crear viviendas bono para necesitados',6)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Producir empleos para la poblacion para mejorar la economia' AND A.IdPlan = 6) INSERT INTO Acciones VALUES('Producir empleos para la poblacion para mejorar la economia',6)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Rampas para personas con discapacidad' AND A.IdPlan = 6) INSERT INTO Acciones VALUES('Rampas para personas con discapacidad',6)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Expansion de EBAIS en comunidades' AND A.IdPlan = 6) INSERT INTO Acciones VALUES('Expansion de EBAIS en comunidades',6)

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Entregables') 
BEGIN
	CREATE TABLE Entregables (IdEntregable INT IDENTITY(1,1) PRIMARY KEY,
							 IdPlan INT FOREIGN KEY REFERENCES Planes(IdPlan) NOT NULL,
							 IdAccion INT FOREIGN KEY REFERENCES Acciones(IdAccion) NOT NULL,
							 IdCanton INT FOREIGN KEY REFERENCES Cantones(IdCanton) NOT NULL,
							 IdPartido INT FOREIGN KEY REFERENCES Partidos(IdPartido) NOT NULL,
							 kpitype VARCHAR(16) NOT NULL,
							 kpivalue INT NOT NULL,
							 Fecha DATE NOT NULL,
							 checksum VARBINARY(120) NULL
						 );
END

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =1 AND E.IdCanton =1 )
INSERT INTO Entregables VALUES(1,1,1,1,'Kilometros',30,'2022-04-02',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =1 AND E.IdCanton =5 )
INSERT INTO Entregables VALUES(1,1,5,1,'Kilometros',25,'2022-03-25',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =1 AND E.IdCanton =7 )
INSERT INTO Entregables VALUES(1,1,7,1,'Kilometros',48,'2023-06-22',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =1 AND E.IdCanton =9 )
INSERT INTO Entregables VALUES(1,1,9,1,'Kilometros',52,'2023-04-07',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =1 AND E.IdCanton =14 )
INSERT INTO Entregables VALUES(1,1,14,1,'Kilometros',34,'2022-04-15',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =2 AND E.IdCanton =10 )
INSERT INTO Entregables VALUES(1,2,10,1,'Kilometros',58,'2022-03-11',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =2 AND E.IdCanton =11 )
INSERT INTO Entregables VALUES(1,2,11,1,'Kilometros',48,'2023-03-01',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =2 AND E.IdCanton =15 )
INSERT INTO Entregables VALUES(1,2,15,1,'Kilometros',33,'2023-04-15',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =2 AND E.IdCanton =19 )
INSERT INTO Entregables VALUES(1,2,19,1,'Kilometros',47,'2026-04-21',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =3 AND E.IdCanton =2 )
INSERT INTO Entregables VALUES(1,3,2,1,'Comunidades',2,'2022-12-11',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =3 AND E.IdCanton =4 )
INSERT INTO Entregables VALUES(1,3,4,1,'Comunidades',2,'2023-05-01',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =3 AND E.IdCanton =6 )
INSERT INTO Entregables VALUES(1,3,6,1,'Comunidades',3,'2023-10-15',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =3 AND E.IdCanton =8 )
INSERT INTO Entregables VALUES(1,3,8,1,'Comunidades',1,'2025-07-28',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =4 AND E.IdCanton =7 )
INSERT INTO Entregables VALUES(1,4,7,1,'Dolares',15000,'2026-04-23',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =4 AND E.IdCanton =13 )
INSERT INTO Entregables VALUES(1,4,13,1,'Dolares',35800,'2024-08-22',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =4 AND E.IdCanton =16 )
INSERT INTO Entregables VALUES(1,4,16,1,'Dolares',22222,'2023-09-28',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =4 AND E.IdCanton =19 )
INSERT INTO Entregables VALUES(1,4,19,1,'Dolares',25571,'2023-09-28',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =5 AND E.IdCanton =2 )
INSERT INTO Entregables VALUES(2,5,2,2,'Viviendas',3,'2022-04-17',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =5 AND E.IdCanton =3 )
INSERT INTO Entregables VALUES(2,5,3,2,'Viviendas',3,'2023-09-28',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =5 AND E.IdCanton =4 )
INSERT INTO Entregables VALUES(2,5,4,2,'Viviendas',3,'2023-09-28',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =5 AND E.IdCanton =7 )
INSERT INTO Entregables VALUES(2,5,7,2,'Viviendas',3,'2026-08-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =6 AND E.IdCanton =3 )
INSERT INTO Entregables VALUES(2,6,3,2,'Kilometros',50,'2022-12-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =6 AND E.IdCanton =4 )
INSERT INTO Entregables VALUES(2,6,4,2,'Kilometros',30,'2023-10-19',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =6 AND E.IdCanton =12 )
INSERT INTO Entregables VALUES(2,6,12,2,'Kilometros',23,'2024-11-20',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =6 AND E.IdCanton =18 )
INSERT INTO Entregables VALUES(2,6,18,2,'Kilometros',51,'2025-12-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =7 AND E.IdCanton =11 )
INSERT INTO Entregables VALUES(2,7,11,2,'Kilometros',27,'2023-12-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =7 AND E.IdCanton =13 )
INSERT INTO Entregables VALUES(2,7,13,2,'Kilometros',43,'2024-09-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =7 AND E.IdCanton =14 )
INSERT INTO Entregables VALUES(2,7,14,2,'Kilometros',55,'2025-05-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =7 AND E.IdCanton =16 )
INSERT INTO Entregables VALUES(2,7,16,2,'Kilometros',21,'2026-04-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =8 AND E.IdCanton =1 )
INSERT INTO Entregables VALUES(2,8,1,2,'Empleos',121,'2022-07-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =8 AND E.IdCanton =2 )
INSERT INTO Entregables VALUES(2,8,2,2,'Empleos',87,'2024-01-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =8 AND E.IdCanton =21 )
INSERT INTO Entregables VALUES(2,8,21,2,'Empleos',96,'2023-08-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =8 AND E.IdCanton =20 )
INSERT INTO Entregables VALUES(2,8,20,2,'Empleos',148,'2025-03-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =9 AND E.IdCanton = 1 )
INSERT INTO Entregables VALUES(3,9,1,3,'Ciclovias',8,'2022-04-27',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =9 AND E.IdCanton = 2 )
INSERT INTO Entregables VALUES(3,9,2,3,'Ciclovias',5,'2022-03-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =9 AND E.IdCanton = 3 )
INSERT INTO Entregables VALUES(3,9,3,3,'Ciclovias',4,'2024-10-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =9 AND E.IdCanton = 6 )
INSERT INTO Entregables VALUES(3,9,6,3,'Ciclovias',6,'2025-03-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =10 AND E.IdCanton = 8 )
INSERT INTO Entregables VALUES(3,10,8,3,'Kilometros',15,'2022-03-17',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =10 AND E.IdCanton = 9 )
INSERT INTO Entregables VALUES(3,10,9,3,'Kilometros',25,'2024-11-24',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =10 AND E.IdCanton = 13 )
INSERT INTO Entregables VALUES(3,10,13,3,'Kilometros',25,'2026-03-26',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =10 AND E.IdCanton = 17 )
INSERT INTO Entregables VALUES(3,10,17,3,'Kilometros',18,'2025-03-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =11 AND E.IdCanton = 18 )
INSERT INTO Entregables VALUES(3,11,18,3,'Escuelas',7,'2022-04-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =11 AND E.IdCanton = 19 )
INSERT INTO Entregables VALUES(3,11,19,3,'Escuelas',11,'2022-04-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =11 AND E.IdCanton = 20 )
INSERT INTO Entregables VALUES(3,11,20,3,'Escuelas',10,'2022-04-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =11 AND E.IdCanton = 21 )
INSERT INTO Entregables VALUES(3,11,21,3,'Escuelas',8,'2023-04-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =12 AND E.IdCanton = 5 )
INSERT INTO Entregables VALUES(3,12,5,3,'Antenas',4,'2022-04-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =12 AND E.IdCanton = 8 )
INSERT INTO Entregables VALUES(3,12,8,3,'Antenas',4,'2023-07-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =12 AND E.IdCanton = 12 )
INSERT INTO Entregables VALUES(3,12,12,3,'Antenas',4,'2025-10-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =12 AND E.IdCanton = 14 )
INSERT INTO Entregables VALUES(3,12,14,3,'Antenas',4,'2026-04-20',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =13 AND E.IdCanton = 1 )
INSERT INTO Entregables VALUES(4,13,1,4,'Rampas',7,'2023-04-17',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =13 AND E.IdCanton = 2 )
INSERT INTO Entregables VALUES(4,13,2,4,'Rampas',10,'2023-10-23',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =13 AND E.IdCanton = 3 )
INSERT INTO Entregables VALUES(4,13,3,4,'Rampas',7,'2023-12-05',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =13 AND E.IdCanton = 4 )
INSERT INTO Entregables VALUES(4,13,4,4,'Rampas',9,'2024-05-29',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =14 AND E.IdCanton = 5 )
INSERT INTO Entregables VALUES(4,14,5,4,'Donaciones',40,'2022-05-9',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =14 AND E.IdCanton = 6 )
INSERT INTO Entregables VALUES(4,14,6,4,'Donaciones',52,'2025-05-09',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =14 AND E.IdCanton = 7 )
INSERT INTO Entregables VALUES(4,14,7,4,'Donaciones',70,'2026-05-09',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =14 AND E.IdCanton = 8 )
INSERT INTO Entregables VALUES(4,14,8,4,'Donaciones',55,'2023-05-15',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =15 AND E.IdCanton = 9 )
INSERT INTO Entregables VALUES(4,15,9,4,'Dolares',60001,'2023-05-15',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =15 AND E.IdCanton = 10 )
INSERT INTO Entregables VALUES(4,15,10,4,'Dolares',61000,'2023-05-15',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =15 AND E.IdCanton = 11 )
INSERT INTO Entregables VALUES(4,15,11,4,'Dolares',60001,'2023-05-15',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =15 AND E.IdCanton = 12 )
INSERT INTO Entregables VALUES(4,15,12,4,'Dolares',61000,'2023-05-15',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =16 AND E.IdCanton = 14 )
INSERT INTO Entregables VALUES(4,16,14,4,'Dolares',41000,'2022-05-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =16 AND E.IdCanton = 15 )
INSERT INTO Entregables VALUES(4,16,15,4,'Dolares',23000,'2023-09-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =16 AND E.IdCanton = 17 )
INSERT INTO Entregables VALUES(4,16,17,4,'Empleos',190,'2024-12-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =16 AND E.IdCanton = 19 )
INSERT INTO Entregables VALUES(4,16,19,4,'Empleos',200,'2025-02-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =17 AND E.IdCanton = 20 )
INSERT INTO Entregables VALUES(5,17,20,5,'Donaciones',50000,'2022-02-27',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =17 AND E.IdCanton = 21 )
INSERT INTO Entregables VALUES(5,17,21,5,'Donaciones',62500,'2024-11-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =17 AND E.IdCanton = 15 )
INSERT INTO Entregables VALUES(5,17,15,5,'Donaciones',68759,'2023-08-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =17 AND E.IdCanton = 9 )
INSERT INTO Entregables VALUES(5,17,9,5,'Donaciones',47952,'2026-12-15',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =18 AND E.IdCanton = 3 )
INSERT INTO Entregables VALUES(5,18,3,5,'Postes',47952,'2022-05-11',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =18 AND E.IdCanton = 6 )
INSERT INTO Entregables VALUES(5,18,6,5,'Postes',60,'2023-10-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =18 AND E.IdCanton = 11 )
INSERT INTO Entregables VALUES(5,18,11,5,'Postes',60,'2023-10-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =18 AND E.IdCanton = 17 )
INSERT INTO Entregables VALUES(5,18,17,5,'Postes',60,'2026-01-31',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =19 AND E.IdCanton = 5 )
INSERT INTO Entregables VALUES(5,19,5,5,'Institucion',2,'2023-03-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =19 AND E.IdCanton = 7 )
INSERT INTO Entregables VALUES(5,19,7,5,'Institucion',2,'2024-04-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =19 AND E.IdCanton = 12 )
INSERT INTO Entregables VALUES(5,19,12,5,'Institucion',2,'2025-05-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =19 AND E.IdCanton = 17 )
INSERT INTO Entregables VALUES(5,19,17,5,'Institucion',2,'2025-06-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =20 AND E.IdCanton = 3 )
INSERT INTO Entregables VALUES(5,20,3,5,'Dolares',45880,'2024-05-14',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =20 AND E.IdCanton = 16 )
INSERT INTO Entregables VALUES(5,20,16,5,'Dolares',47000,'2024-01-14',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =20 AND E.IdCanton = 2 )
INSERT INTO Entregables VALUES(5,20,2,5,'Dolares',45000,'2023-07-14',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =5  AND E.IdAccion =20 AND E.IdCanton = 13 )
INSERT INTO Entregables VALUES(5,20,13,5,'Empleos',70,'2025-10-14',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =21 AND E.IdCanton = 14 )
INSERT INTO Entregables VALUES(6,21,14,6,'Viviendas',7,'2024-03-14',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =21 AND E.IdCanton = 10 )
INSERT INTO Entregables VALUES(6,21,10,6,'Viviendas',9,'2024-03-14',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =21 AND E.IdCanton = 11 )
INSERT INTO Entregables VALUES(6,21,11,6,'Viviendas',10,'2025-03-14',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =21 AND E.IdCanton = 9 )
INSERT INTO Entregables VALUES(6,21,9,6,'Viviendas',5,'2025-09-14',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =22 AND E.IdCanton = 1 )
INSERT INTO Entregables VALUES(6,22,1,6,'Empleos',150,'2022-08-26',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =22 AND E.IdCanton = 10 )
INSERT INTO Entregables VALUES(6,22,10,6,'Empleos',150,'2022-08-26',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =22 AND E.IdCanton = 6 )
INSERT INTO Entregables VALUES(6,22,6,6,'Empleos',150,'2022-08-26',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =22 AND E.IdCanton = 16 )
INSERT INTO Entregables VALUES(6,22,16,6,'Empleos',150,'2022-08-26',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =23 AND E.IdCanton = 8 )
INSERT INTO Entregables VALUES(6,23,8,6,'Rampas',10,'2024-02-26',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =23 AND E.IdCanton = 11 )
INSERT INTO Entregables VALUES(6,23,11,6,'Rampas',12,'2024-02-26',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =23 AND E.IdCanton = 21 )
INSERT INTO Entregables VALUES(6,23,21,6,'Rampas',8,'2025-02-26',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =23 AND E.IdCanton = 15 )
INSERT INTO Entregables VALUES(6,23,15,6,'Rampas',7,'2025-02-26',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =24 AND E.IdCanton = 12 )
INSERT INTO Entregables VALUES(6,24,12,6,'Comunidades',3,'2023-07-23',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =24 AND E.IdCanton = 17 )
INSERT INTO Entregables VALUES(6,24,17,6,'Comunidades',3,'2023-05-23',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =24 AND E.IdCanton = 5 )
INSERT INTO Entregables VALUES(6,24,5,6,'Comunidades',2,'2023-04-23',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =6  AND E.IdAccion =24 AND E.IdCanton = 20 )
INSERT INTO Entregables VALUES(6,24,20,6,'Comunidades',2,'2023-09-23',NULL)

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='CantonesPorUsuario') 
BEGIN
	CREATE TABLE CantonesPorUsuario(IdUsuario INT FOREIGN KEY References Usuarios(IdUsuario) NOT NULL,
							IdCanton INT FOREIGN KEY References Cantones(IdCanton) NOT NULL,
							CreationDate DATE DEFAULT(getdate())
						 );
END


IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Calificaciones') 
BEGIN
	CREATE TABLE Calificaciones(IdCalificacion INT IDENTITY(1,1) PRIMARY KEY,
							IdUsuario INT FOREIGN KEY References Usuarios(IdUsuario) NOT NULL,
							IdCanton INT FOREIGN KEY References Cantones(IdCanton) NOT NULL,
							IdEntregable INT FOREIGN KEY References Entregables(IdEntregable) NOT NULL,
							Puntuacion TINYINT NOT NULL,
							checksum VARBINARY(120) NULL,
							CreationDate DATE DEFAULT(getdate())
						 );
END

