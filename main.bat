::=====setting environment=====
@ECHO OFF
set mod_desc=typus-renewed.mod
set mod_dir=typus-renewed
::=====setting environment end=====
::=====checking=====
ECHO Time:%date%
ECHO Checking the required folder...
if not exist output\ ( mkdir output\ ) else ( del /F /S /Q output\ & rmdir /S /Q output\ & mkdir output\ )
if not exist output\%mod_dir% mkdir output\%mod_dir%\
if exist mod.zip del /F /S /Q mod.zip
if exist mod-cn-loc.zip del /F /S /Q mod-cn-loc.zip
::=====checking end=====
::=====processing=====
xcopy %mod_dir%\ output\%mod_dir% /E /Q /C /Y
xcopy mod_descriptor\%mod_desc% output\ /E /Q /C /Y
ECHO path="mod/%mod_dir%" >> output\%mod_desc%
xcopy mod_descriptor\%mod_desc% output\%mod_dir%\ /Q /C /Y
ren output\%mod_dir%\%mod_desc% descriptor.mod
xcopy CHANGELOG.md output\%mod_dir%\ /Q /C /Y
xcopy thumbnail.png output\%mod_dir%\ /Q /C /Y
ECHO.
ECHO Compressing the mod files...
7z.exe a mod.zip .\output\typus-renewed*
::=====processing end=====

::=====cn processing=====
set cn_mod_desc=typus-cn-loc.mod
set cn_mod_dir=typus-cn-loc
if not exist output\%cn_mod_dir% mkdir output\%cn_mod_dir%\

xcopy %cn_mod_dir%\ output\%cn_mod_dir% /E /Q /C /Y
xcopy mod_descriptor\%cn_mod_desc% output\ /E /Q /C /Y
ECHO path="mod/%cn_mod_dir%" >> output\%cn_mod_desc%
xcopy mod_descriptor\%cn_mod_desc% output\%cn_mod_dir%\ /Q /C /Y
ren output\%cn_mod_dir%\%cn_mod_desc% descriptor.mod
::xcopy CHANGELOG.md output\%cn_mod_dir%\ /Q /C /Y
xcopy thumbnail.png output\%cn_mod_dir%\ /Q /C /Y
ECHO.
ECHO Compressing the mod files...
7z.exe a mod-cn-loc.zip .\output\typus-cn-loc*
::=====cn processing end=====
ECHO.
ECHO End of script running.