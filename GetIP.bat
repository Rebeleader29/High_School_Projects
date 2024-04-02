@echo off
title Network Scanner
set secondip=1
echo "Enter the first 3 number sets of your ip.
echo "Include the periods between the numbers.
echo "IP: [S1.S2.S3.S4] -> S1.S2.S3
echo "IP: [xx.xx.xx.xx] -> xx.xx.xx
echo "IE: IP: [192.168.0.1] -> 192.168.0
set /p baseip=:

:loop
If %secondip%==1000 (goto q)
echo Scanning for %baseip%.%secondip%
ping -n 1 %baseip%.%secondip% | find "TTL=" >nul
IF errorlevel 1 (goto noexist)
echo *************[Stats for %baseip%.%secondip%]************* >>IPList.txt
ping %baseip%.%secondip% -n 1 >>IPList.txt
wmic.exe /node:%baseip%.%secondip% computersystem get username >>IPList.txt
nslookup %baseip%.%secondip% >>IPList.txt
echo >>IPList.txt
echo ********************************************************* >>IPList.txt

:addvalues
set /a secondipset=%secondip%+1
set secondip=%secondipset%
goto loop

:noexist
echo %baseip%.%secondip% does not exist or is not avalable. >>IPList.txt
goto addvalues

:q
echo Scan finished.
ping 127.0.0.1 -n 2 >nul