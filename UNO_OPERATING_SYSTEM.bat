@echo off

cls
echo Welcome To UNO Operating System %unamel% :)
echo.
pause

color B
IF NOT EXIST "c:\uname.txt" goto SIGNUP
IF NOT EXIST "c:\password.txt" goto SIGNUP
goto LOGIN

:SIGNUP
title SignUp
cls
echo -------------------------------------------------------------
echo                        Sign Up 
echo -------------------------------------------------------------
echo.
set/p "unamesu=Enter Username : "
set/p "passsu=Enter Password : "
echo.
echo.
IF ["%unamesu%"] == [""] goto SIGNUPERROR
IF ["%passsu%"] ==[""] goto SIGNUPERROR
goto CREATEACC

:SIGNUPERROR
echo -------------------------------------------------------------
echo                         Error
echo -------------------------------------------------------------
echo Invalid Username or password
pause
goto SIGNUP

:CREATEACC
echo %unamesu% >> C:\uname.txt
echo %passsu% >> C:\password.txt
attrib "C:\uname.txt" +s +h
attrib "C:\password.txt" +s +h

:LOGIN
set/p uname= < C:\uname.txt
set/p pass=< C:\password.txt
title Login
cls
echo -------------------------------------------------------------
echo                         Log In
echo -------------------------------------------------------------
echo.
echo.
set/p "unamel=_               Username : "
set/p "passwordl=_               Password : "
echo.
IF "%unamel%"=="" goto LOGINERROR
IF "%passwordl"=="" goto LOGINERROR
IF NOT %unamel%==%uname% goto LOGINERROR
IF NOT %passwordl%==%pass% goto LOGINERROR
goto LOADING

echo -------------------------------------------------------------
echo                         Error
echo -------------------------------------------------------------
echo Invalid Username or password
pause
goto LOGIN


:LOADING
title Loading...
set load=%load%!!!!!!!
cls
echo -------------------------------------------------------------
echo                         Log In
echo -------------------------------------------------------------
echo.
echo.
echo                 Username : %unamel%
echo                 Password : %passwordl%
echo.
echo.
echo          Logging in...
echo          ===================================
echo          %load%
echo          ===================================
echo.                              Please Wait...
echo.
ping localhost -n 2 >nul
set/a loadnum=%loadnum% +1
if %loadnum%==3 goto DONE
goto LOADING

:DONE
title Done
cls
echo -------------------------------------------------------------
echo                         Done
echo -------------------------------------------------------------
echo     *****     *****    *****         ****        ******** 
echo     *****     *****    ******        ****      ****     ****
echo     *****     *****    *******       ****     ****       ****     
echo     *****     *****    ********      ****    *****       ***** 
echo     *****     *****                          *****       *****
echo     *****     *****  -LOG-IN SUCCESSFULLY-   *****       ***** 
echo     *****     *****                          *****       ***** 
echo     *****     *****    ****    ****  ****    *****       *****
echo     *****     *****    ****     *********    *****       ***** 
echo     *****     *****    ****      ********    *****       *****
echo      ****     ****     ****       *******     ****      **** 
echo       ****   ****      ****        ******      ****    ****  
echo         *******        ****         *****        ******** 
echo -------------------------------------------------------------
pause

:menu
cls
echo What Would You Like To Do? Type the number.
echo.
echo 1.File Management
echo 2.System Admin
echo 3.Network and Internet
echo 4.Disk Operation
echo 5.Game
echo 6.Calculator
echo 7.Prank
echo 8.Exit

set /p input=
if %input% == 1 goto fileManagement
if %input% == 2 goto systemAdmin
if %input% == 3 goto networkAndInternet
if %input% == 4 goto diskOperation
if %input% == 5 goto game
if %input% == 6 goto calculator
if %input% == 7 call "prank.bat"
if %input% == 8 goto exit

:fileManagement
cls
echo 		=============== FILE MANAGEMENT =================
echo.
echo 				1. Manage File
echo 				2. Manage Folder
echo 				3. Menu
echo. 
echo 		=================================================
				set /p choose=

if %choose% == 1 goto :manageFile
if %choose% == 2 goto :manageFolder
if %choose% == 3 goto :menu


:manageFile
cls
echo 		=============== MANAGE FILE =================
echo.
echo 				1. Create File
echo 				2. Delete file 
echo 				3. Empty File
echo 				4. Back
echo. 
echo 		=================================================
				set /p choose=

if %choose% == 1 goto :createFolder
if %choose% == 2 goto :deleteFolder
if %choose% == 3 goto :emptyFolder
if %choose% == 4 goto :fileManagement

:createFolder
cls
echo Enter file name: 
set /p filename=
C:\Users\Asus\Desktop\146> %filename%.txt
echo File created succesfully!
goto fileManagement

:deleteFolder
cls
echo Enter file name:
set /p filenamedel=
del "C:\Users\Asus\Desktop\146\%filenamedel%.txt"
echo File deleted succesfully!
goto fileManagement

:emptyFolder
cls
set /p filenameEmp=
@echo break>"C:\Users\Asus\Desktop\146\%filenameEmp%.txt"
goto fileManagement


:manageFolder
cls
:FF 
cls
echo 		=============== MANAGE FOLDER =================
echo.
echo 				1. Open Folder
echo 				2. Delete Folder
echo 				3. Create Folder
echo 				4. Back
echo. 
echo 		=================================================
echo Enter the number?
set /p input=
echo Enter the file?
set /p file=
echo.

if %input% == 1 goto open 
if %input% == 2 goto del 
if %input% == 3 goto create 
if %input% == 4 goto fileManagement

:open
cls
start %file%
echo open succesfully
pause
goto manageFolder
:del
cls
if not exist %file% echo Can't find the folder
if not exist %file% pause
if not exist %file% goto File Management
rd %file%
echo deleted succesfully
goto manageFolder
:create
cls
md %file%
echo created succesfully
goto manageFolder

:systemAdmin
cls
echo 1. Shut Down
echo 2. Restart
echo 3. Hibernate
echo 4. Menu

set /p input=
if %input% == 1 goto shutdown
if %input% == 2 goto restart
if %input% == 3 goto hibernate
if %input% == 4 goto menu

:shutdown
C:\windows\system32\shutdown -s -f -t 00

:restart
C:\windows\system32\shutdown -r -t 00

:hibernate
C:\windows\system32\shutdown /h

:networkAndInternet
cls
echo 		============ NETWORK AND INTERNET ===============
echo.
echo 				1. Ping
echo 				2. Show Wi-fi Information
echo 				3. Open A Website
echo 				4. Menu
echo. 
echo 		=================================================
				set /p choose=

if %choose% == 1 goto :ping
if %choose% == 2 goto :wifiInfo
if %choose% == 3 goto :openWebsite
if %choose% == 4 goto :menu

:ping
cls
echo Enter Website to Ping
set /p input= Enter URL:
if %input% == goto A if NOT B
echo Processing request
ping localhost>nul
echo -------------------------------------------------
echo                Pinging Website
echo -------------------------------------------------
ping localhost>nul
ping %input%
echo. 
echo Press 1 to go back.
set /p cback=
if %cback% == 1 goto :networkAndInternet

:wifiInfo
cls
echo Enter Wi-fi name:
set /p wfnamek=
netsh wlan show profile %wfnamek% key=clear
echo. 
echo Press 1 to go back.
set /p cback=
if %cback% == 1 goto :networkAndInternet

:openWebsite
cls
:top
echo ***************************************************************
echo.
echo Site Selector
echo.
echo ***************************************************************
echo.
echo Key: [1] Google - Search Engine
echo [2] Hotmail - Mail Server
echo [3] Yahoo - Search Engine/Mail Server
echo [4] Facebook - Social Networking
echo [5] Myspace - Social Networking
echo [6] CNN - News
echo [7] Weather - Weather
echo [8] WikiHow - A How-To Website
echo [9] Instructables - A How-To Website
echo [10] YouTube - Online Videos
echo [11] Answers - Online Encyclopedia
echo [12] Wikipedia - Online Encyclopedia
echo [e] Menu
echo.
echo ***************************************************************
echo Enter the number of the website which you would like to go to:
echo.
set /p udefine= 
echo.
echo ***************************************************************
if %udefine%==1 start www.google.com
if %udefine%==2 start www.hotmail.com
if %udefine%==3 start www.yahoo.com
if %udefine%==4 start www.facebook.com
if %udefine%==5 start www.myspace.com
if %udefine%==6 start www.cnn.com
if %udefine%==7 start www.weather.com
if %udefine%==7 start www.wikihow.com
if %udefine%==9 start www.instructables.com
if %udefine%==10 start www.youtube.com
if %udefine%==11 start www.answers.com
if %udefine%==12 start www.wikipedia.com
if %udefine%==e goto :menu

echo. 
echo Press 1 to go back.
set /p cback=
if %cback% == 1 goto :networkAndInternet

:diskOperation
cls
echo 		=============== DISK OPERATION =================
echo.
echo 				1. Hard Drive Space
echo 				2. Service Tag
echo 				3. CPU
echo 				4. BACK
echo.
echo 		================================================
				
				set /p choose=

if %choose% == 1 goto :hardDrive
if %choose% == 2 goto :service
if %choose% == 3 goto :cpu
if %choose% == 4 goto :menu

:hardDrive
cls
wmic diskdrive get size
echo.
echo Press 1 to go back.
set /p cback=
if %cback% == 1 goto :diskOperation
:service
cls
wmic bios get serialnumber
echo.
echo Press 1 to go back.
set /p cback=
if %cback% == 1 goto :diskOperation
:cpu
cls
wmic cpu get name
echo.
echo Press 1 to go back.

set /p cback=
if %cback% == 1 goto :diskOperation

:game
cls
:StartofProgram
set counter=0
set secretNumber=0
set guess=0

echo %counter%
echo %secretNumber%
echo %guess%

echo Number Guessing Game
echo Cris Agtang

:playAgain
set /a secretNumber = %random%%%10
set counter=0
echo I am thinking of a number 0 and 100.
echo Can you guess the number in 6 tries or less?


:guess
set /p guess="Enter Your Number(0-10):"
if %guess%==%secretNumber% goto :win
if %guess% LSS %secretNumber% echo too low
if %guess% GTR %secretNumber% echo too high
set /a counter=%counter%+1
if %counter%==6 goto :lose


goto :guess
:win
echo You Win! 
goto :end
:lose
echo You Lose
goto :end
:end
set /p PlayAgain="Try Again (Y/N):"
if %PlayAgain%==y goto :StartofProgram
if %PlayAgain%==n goto :menu
pause

:calculator
echo Basic Arithmetic Calculator
:st
cls
echo What would you like to do?
echo (1) Add
echo (2) Subtract
echo (3) Multiply
echo (4) Divide
echo (5) Menu
set /p math=
IF '%math%' == '1' GOTO ADD
IF '%math%' == '2' GOTO SUB
IF '%math%' == '3' GOTO MULTIPLY
IF '%math%' == '4' GOTO DIVIDE
IF '%math%' == '5' GOTO menu
Exit

:ADD
Cls
GOTO NUMBERSADD
pause
exit

:SUB
Cls
GOTO NUMBERSSUB
pause
exit

:MULTIPLY
Cls
GOTO NUMBERSMULTIPLY
pause
exit

:DIVIDE
Cls
GOTO NUMBERSDIVIDE
pause
exit

:NUMBERSADD
echo First Number 
set /p number1=
echo Second Number 
set /p number2=

GOTO ADD2
exit

:NUMBERSSUB
echo First Number = 
set /p number1=
echo Second Number =
set /p number2=
GOTO SUB2
exit

:NUMBERSMULTIPLY
echo First Number = 
set /p number1=
echo Second Number =
set /p number2=
GOTO MULTIPLY2
exit

:NUMBERSDIVIDE
echo First Number = 
set /p number1=
echo Second Number =
set /p number2=
GOTO DIVIDE2
exit

:ADD2
Set /A result = %number1% + %number2%
echo The answer is %result%.
Pause
GOTO st
exit

:SUB2
Set /A result = %number1% - %number2%
echo The answer is %result%.
pause
GOTO st
exit

:MULTIPLY2
Set /A result = %number1% * %number2%
echo The answer is %result%.
pause
GOTO st
exit

:DIVIDE2
Set /A result = %number1% / %number2%
echo The answer is %result%.
pause
GOTO st

pause

:exit
exit