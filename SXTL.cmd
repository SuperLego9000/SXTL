set InFolder=0
goto start



S^X theme loader by SuperLego9000#4891

                   ⬇⬇⬇ !!!HEY YOU!!! ⬇⬇⬇
    
you need to put this in the same folder as your S^X launcher/executable
if you have done that and it still is not working when it should be, set the variable at the top of this document to 1


                            TO USE

when the program starts it will show themes and ask what theme to load
if you do not see any theme names or some are missing please verify that the folder is valid


                             TO REGISTER A NEW THEME

to make a theme, make a new folder in the themes folder named what you know the theme as, ie: "8BitX"
NOTE:when loading themes from this program, theme names ARE case-sensitive AND MUST NOT CONTAIN WHITESPACES
now put all the theme files from that theme into the folder you just made
next time you start SXTL you should see it in the list


                                    Happy theme loading!


:start
@echo off
cls


if exist "./S^X.exe" set InFolder=1

if not %InFolder%==1 goto No_SY
if NOT exist ./themes/default  goto setup
goto run

:setup
echo change your current theme to default now
echo ask on discord for default theme if you did not keep it around

@choice /c:NL /n /m:"Now/Later: "
IF ERRORLEVEL 2 goto run
rem if we are gonna do it later skip the setup

mkdir themes
mkdir default
move default themes

xcopy bin\Editor.html themes\default /Y /Q
xcopy bin\Theme-wpf.json themes\default /Y /Q

echo setup complete
echo open file in notepad for info on how to make a new theme
goto exit

:GetTheme
set /P theme="load: "
goto load

:run
echo SXTL by superlego9000
echo.
echo themes availible:
echo.
dir /b /ad themes
echo.

cd themes
rem goto themes that way you get auto-complete
goto GetTheme
:load
cd ..
rem now back out so we can transfer cleanly
xcopy themes\%theme% bin /Y /Q
:end
echo restart SX for it to show
echo enjoy!
echo.
echo exiting in 3...
timeout 3
goto exit
:No_SY
echo no SX detected, open this file in text editor for more info
timeout 60
:exit
echo bye!