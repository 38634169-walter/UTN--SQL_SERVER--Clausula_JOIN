
GO
USE Larabox

--1
SELECT dp.Nombres, dp.Apellidos, l.nombre AS Localidad FROM DatosPersonales AS dp
INNER JOIN Localidades AS l ON l.ID = dp.IDLocalidad;

--2
SELECT dp.Nombres, dp.Apellidos,l.Nombre AS Localidad FROM DatosPersonales AS dp
LEFT JOIN Localidades AS l ON l.ID = dp.IDLocalidad

--3
SELECT dp.Nombres, dp.Apellidos, l.Nombre AS Localidad FROM DatosPersonales AS dp
RIGHT JOIN Localidades AS l ON l.ID = dp.IDLocalidad

--4
SELECT dp.Nombres, dp.Apellidos, l.Nombre AS Localidad, p.Nombre AS Pais 
FROM DatosPersonales AS dp
INNER JOIN Localidades AS l ON l.ID = dp.IDLocalidad
INNER JOIN Paises AS p ON p.ID = l.IDPais;

--5
SELECT l.Nombre AS Localidad, p.Nombre AS Pais
FROM Localidades AS l
RIGHT JOIN Paises AS p
ON p.ID = L.IDPais
ORDER BY p.Nombre ASC, L.Nombre asc

--6
SELECT a.Nombre, a.Extension, a.Modificacion, u.Nombreusuario, dp.Email
FROM Usuarios AS u
INNER JOIN Archivos AS a ON a.IDUsuario = u.ID
INNER JOIN DatosPersonales AS dp ON dp.ID = u.ID;

--7
SELECT u.Nombreusuario, isnull(p.Nombre, 'Sin Pais') AS Pais FROM Usuarios AS u
LEFT JOIN DatosPersonales AS dp ON u.ID = dp.ID
LEFT JOIN Localidades AS l ON dp.IDLocalidad = l.ID
LEFT JOIN Paises AS p ON p.ID = l.IDPais;

--8
SELECT dp.Nombres, dp.Apellidos, dp.Email, dp.Telefono, dp.Domicilio 
FROM DatosPersonales AS dp
INNER JOIN Localidades AS l ON l.ID = dp.IDLocalidad
WHERE l.Nombre LIKE('%San%')

--9
SELECT TOP 1 U.Nombreusuario, a.Tamaño FROM Usuarios AS u
INNER JOIN DatosPersonales AS dp on DP.ID = u.ID
INNER JOIN Archivos AS a ON a.IDUsuario = u.ID
ORDER BY a.Tamaño ASC;

--10
SELECT TOP 1 dp.Nombres, p.Nombre AS Pais, l.Nombre AS Localidad FROM DatosPersonales AS dp
INNER JOIN Localidades AS l ON dp.IDLocalidad=l.ID
INNER JOIN Paises AS p ON p.ID = l.IDPais
ORDER BY dp.Nacimiento DESC;

--11
SELECT u.Nombreusuario, dp.Nombres, dp.Apellidos FROM DatosPersonales AS dp
LEFT JOIN Usuarios AS u ON u.ID = dp.ID
LEFT JOIN Archivos AS a ON a.IDUsuario = u.ID
WHERE a.ID IS NULL

--12 
SELECT dp.Nombres, dp.Apellidos, a.Tamaño , a.Tamaño/1024.0 AS [Tamaño en MB] FROM Usuarios AS u
INNER JOIN DatosPersonales AS dp ON dp.ID = u.ID
INNER JOIN Archivos AS a ON u.ID = a.IDUsuario
WHERE a.Tamaño/1024.0 > 450

--13
SELECT u.Nombreusuario, dp.Nombres, dp.Apellidos, l.Nombre AS Localidad,
p.Nombre AS Pais, a.Nombre AS [Nombre archivo], a.Extension, a.Tamaño, 
DATEDIFF(DAY,a.Creacion,a.Modificacion) AS [Diferencia en dias]
FROM Usuarios AS u
INNER JOIN Archivos AS a ON u.ID = a.IDUsuario
INNER JOIN DatosPersonales AS dp ON dp.ID = u.ID
INNER JOIN Localidades AS l ON l.ID = dp.IDLocalidad
INNER JOIN Paises AS p ON p.ID = l.IDPais
ORDER BY u.Nombreusuario ASC;

--14
SELECT DISTINCT dp.Nombres, dp.Apellidos FROM Usuarios AS u
INNER JOIN DatosPersonales AS dP ON dp.ID = u.ID
INNER JOIN Archivos AS a ON a.IDUsuario = u.ID
WHERE a.Modificacion = a.Creacion;


--15
SELECT DISTINCT p.Nombre FROM DatosPersonales AS dp
RIGHT JOIN Localidades AS l ON l.ID = dp.IDLocalidad
RIGHT JOIN Paises AS p ON p.ID = l.IDPais
WHERE dp.ID IS NULL;
