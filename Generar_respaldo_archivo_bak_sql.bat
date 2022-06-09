@ECHO OFF
SET LOCAL
SET vNombre=Nombre_Base_de_Datos
set vDir= Aqui_tu_Direccion_Servidor_NAS_o_Local

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
set vFecha=Full_%mydate%_%mytime%
set vArchivo=%vNombre%_%vFecha%

If not exist C:\Backups\ mkdir C:\Backups\

echo Creando Respaldo Nombre_Base_de_Datos
SqlCmd -E -S IPServidorDB\VersionDB -Q "BACKUP DATABASE [Nombre_Base_de_Datos] TO Disk ='C:\Backups\%vArchivo%.bak'"
Move C:\Backups\*.bak %vDir%
ECHO Archivos Movidos.

REM Clean up the temp file
ENDLOCAL
