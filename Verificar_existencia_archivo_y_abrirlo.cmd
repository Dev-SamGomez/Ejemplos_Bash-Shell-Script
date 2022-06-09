echo off

If exist "C:\Users\samuel.gomez\Desktop\Sam\CambioSem.xlsx" (

   echo Si existe
start  /d  "C:\Users\samuel.gomez\Desktop\Sam" CambioSem.xlsx

)
ELSE (

   echo No existe

)
exit