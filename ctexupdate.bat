@echo off
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo     联网升级需要较长时间，请不要关闭本窗口！
echo.
echo        本文件请右键“管理员权限”运行！
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.


mpm --set-repository http://mirrors.ustc.edu.cn/CTAN/systems/win32/miktex/tm/packages/
::mpm --set-repository ftp://ftp.ctex.org/mirrors/CTAN/systems/win32/miktex/tm/packages/
echo 源设置成功
mpm --admin --update --verbose
mpm --admin --update --verbose
echo 升级完毕
mpm --admin --install=amslatex-primer
mpm --admin --install=amsmath
mpm --admin --install=amscls
mpm --admin --install=tex-gyre-math
echo 修复完毕
mpm --admin --update-db
initexmf --admin --update-fndb
echo 刷新数据库完毕

pause