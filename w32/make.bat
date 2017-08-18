;= @echo off
rem this is comment
xcopy /y .gitconfig %USERPROFILE%\

del c:\cmder\config /s /q /f
rd /s /q c:\cmder\config
md c:\cmder
xcopy /y /e cmder_config c:\cmder\config\

noAdriver.reg
copyto.reg
user-env.reg
pause