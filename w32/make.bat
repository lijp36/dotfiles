;= @echo off
rem this is comment
xcopy /y .gitconfig %USERPROFILE%\

del c:\cmder\config /s /q /f
rd /s /q c:\cmder\config
md c:\cmder
#  /j directory link
mklink /j  c:\cmder\config cmder_config     
mklink  %USERPROFILE%\.bashrc .bashrc    
rem  xcopy /y /e c:\cmder\config\ cmder_config\ 

noAdriver.reg
copyto.reg
user-env.reg
pause