$sqlite3
.mode csv

.import prueba-formularios.csv Formularios
.import prueba-redirecciones.csv Redirecciones
.import prueba-resultados.csv Resultados

# SELECT COUNT(*) FROM Formularios;
# SELECT COUNT(*) FROM Redirecciones;
# SELECT COUNT(*) FROM Redirecciones;

.output NuevoArchivoKarla.csv

SELECT Formularios.contxid, Formularios.response,
Formularios.user_type, Redirecciones.credit_card, Redirecciones.origin, Resultados.bcc
FROM Formularios
LEFT JOIN Redirecciones
ON Formularios.contxid=Redirecciones.contxid
LEFT JOIN Resultados
ON Formularios.contxid=Resultados.contxid;