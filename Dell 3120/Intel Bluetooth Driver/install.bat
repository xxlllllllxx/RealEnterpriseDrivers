::************************************************************************
::Author:     Wistron(Kunshan) RD SW spec
::Purpose:    Detect Wireless and invoke the corresponding setup.exe 
::Project:    Lenovo IPG
::Build Date: 2013.10.19

::Version:    0.1
::Update History:
::       0.1: First release.
::************************************************************************

@echo off
:Wireless

devcon find @USB\VID_8087*PID_07DC* | find /N "No matching"
if %ERRORLEVEL%==1  goto 3160

devcon find @USB\VID_8087*PID_0A2A* | find /N "No matching"
if %ERRORLEVEL%==1  goto 7265

goto end0

:7265
.\7265\Win8.1\Win64\Install\setup.exe
goto end

:3160
.\3160\Win8.1\Win64\Install\setup.exe
goto end

:end
ECHO Install Finish!!
goto end1

:end0
echo "No Matched Wireless Device In This System." > C:\swwork\IPGLOGS\NOBI.log

:end1
