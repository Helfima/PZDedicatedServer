@ECHO off
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

rem *********************************
REM -- Recup de l'emplacement du fichier
SET cdir=%~dp0
SET cdir=%cdir:~0,-1%

SET Zomboid=C:\Users\Helfima\Zomboid
SET PZDedicatedServer=C:\Steam\steamapps\common\Project Zomboid Dedicated Server

:menuMain
cls
echo.****************************************************************
echo.* Project Zomboid Dedicated Server (Steam)
echo.****************************************************************
echo.* PZDedicatedServer=%PZDedicatedServer%
echo.* Zomboid=%Zomboid%
echo.*---------------------------------------------------------------

for /f "tokens=1,2,* delims=_ " %%A in ('"findstr /b /c:":menuMain_" "%~f0""') do echo.  %%B  %%C
SET choice=
echo.&set /p choice=Choisir une option ou ENTER pour quitter : ||GOTO:END
echo.&call:menuMain_%choice%
GOTO:menuMain

:menuMain_4  Survival_4
	call:start_server Survival_4
GOTO:EOF

:start_server
  start "%PZDedicatedServer%\StartServer64.bat" -servername %1
GOTO:EOF

:error
echo.***********************************************************************
echo.* ERROR: %1
echo.***********************************************************************
pause
GOTO:EOF

:END