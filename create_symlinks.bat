@ECHO OFF
Set _Destination=E:\dragonrealms\lich\scripts

FOR /f %%a IN (
 'dir /b *.lic'
 ) DO (
 call:symlink %%a
)

cd custom-scripts

FOR /f %%a IN (
 'dir /b *.lic'
 ) DO (
 call:symlink %%a
)

cd .. 
copy .\profiles\base.yaml .\profiles-custom\
rmdir %_Destination%\profiles
mklink /h /j %_Destination%\profiles .\profiles-custom
rmdir %_Destination%\data
mklink /h /j %_Destination%\data .\data

goto:eof

:symlink
del %_Destination%\%~1
mklink /h %_Destination%\%~1 .\%~1
