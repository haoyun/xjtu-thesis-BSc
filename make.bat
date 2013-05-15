@echo off
::这个文件用作用户界面，就这么愉快的决定了~~
set mainpath=%~dp0
:init
cd %mainpath%
cls
echo  ----------------------------------------
echo          主人你来了~~~！！！
echo  ----------------------------------------
echo.
echo         1、查看帮助文档
echo         2、编译论文
echo         3、升级CTEX
echo         4、我要走了，你自己玩吧T_T
echo.
echo  ----------------------------------------
set /p choice= 动手吧( ⊙ o ⊙ )：
if not "%choice%"=="" set choice=%choice:~0,1%
if /i %choice%==1 goto help
if /i %choice%==2 goto makepdf
if /i %choice%==3 goto updatectex
if /i %choice%==4 goto end
echo 不要乱来！
pause
echo.
goto init

:makepdf
xelatex main.tex
bibtex  main.tex
xelatex main.tex
xelatex main.tex
goto clean

:help
if not exist doc\main.pdf goto makehelp
start doc\main.pdf
goto init

:makehelp
cd doc
xelatex main.tex
bibtex  main.tex
xelatex main.tex
xelatex main.tex
goto clean


:clean
del *.aux
del *.log
del *.out
del *.toc
goto read

:read
start main.pdf
goto init


:updatectex
call ctexupdate.bat
goto init

:end
