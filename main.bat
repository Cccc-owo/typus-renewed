:check
@ECHO OFF
ECHO Time:%date%
ECHO Checking...
if not exist output\ ( mkdir output\ ) else ( del /F /S /Q output\ & rmdir /S /Q output\ & mkdir output\ )
if exist *.zip del /F /S /Q *.zip
goto select

:select
if exist output/typus-renewed.mod ( ECHO. ) else ( goto set_typus-renewed )
if exist output/typus-cn-loc.mod ( ECHO. ) else ( goto set_typus-cn-loc )
goto end

:set_typus-renewed
set mod_desc=typus-renewed.mod
set mod_dir=typus-renewed
goto process

:set_typus-cn-loc
set mod_desc=typus-cn-loc.mod
set mod_dir=typus-cn-loc
goto process

:process
if not exist output\%mod_dir% mkdir output\%mod_dir%\
xcopy %mod_dir%\ output\%mod_dir% /E /Q /C /Y
xcopy mod_descriptor\%mod_desc% output\ /E /Q /C /Y
ECHO path="mod/%mod_dir%">> output\%mod_desc%
xcopy CHANGELOG.md output\%mod_dir%\ /Q /C /Y
xcopy thumbnail.png output\%mod_dir%\ /Q /C /Y
xcopy mod_descriptor\%mod_desc% output\%mod_dir%\ /Q /C /Y
ren output\%mod_dir%\%mod_desc% descriptor.mod
ECHO.
ECHO Compressing the mod files...
7z.exe a %mod_dir%.zip .\output\%mod_dir%*
goto select

:end
ECHO.
ECHO End of script running.