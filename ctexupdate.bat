@echo off
:: BatchGotAdmin  
::-------------------------------------  
REM  --> Check for permissions  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  
  
REM --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' (  
    echo Requesting administrative privileges...  
    goto UACPrompt  
) else ( goto gotAdmin )  
  
:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"  
  
    "%temp%\getadmin.vbs"  
    exit /B  
  
:gotAdmin  
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )  
    pushd "%CD%"  
    CD /D "%~dp0"  
::--------------------------------------  
set nStep=0
:cleanTemp
dir %temp%\mik* /a /b > %temp%\dirlist.txt 2>nul
for /f %%i in (%temp%\dirlist.txt) do rd /S /Q %temp%\%%i
del %temp%\dirlist.txt
if %nStep%==1 goto 2edup
if %nStep%==2 goto repairPack
if %nStep%==3 goto DBRen

echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo     联网升级需要较长时间，请不要关闭本窗口！
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.

mpm --set-repository http://mirrors.ustc.edu.cn/CTAN/systems/win32/miktex/tm/packages/
::mpm --set-repository ftp://ftp.ctex.org/mirrors/CTAN/systems/win32/miktex/tm/packages/
echo 源设置成功
mpm --admin --update --verbose
ping -n 10 127.0.0.1 1>nul 2>nul
set nStep=1
goto cleanTemp

:2edup
mpm --admin --update --verbose
echo 升级完毕
set nStep=2
goto cleanTemp

:repairPack
mpm --admin --install=amslatex-primer
mpm --admin --install=amsmath
mpm --admin --install=amscls
mpm --admin --install=tex-gyre-math
echo 修复完毕
set nStep=3
goto cleanTemp


:DBRen
mpm --admin --update-db
initexmf --admin --update-fndb
echo 刷新数据库完毕


pause