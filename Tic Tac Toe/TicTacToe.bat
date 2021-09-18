@echo off
mode con: cols=50 lines=30
title TicTacToe
set Turn=1
set Tile1=1
set Tile2=2
set Tile3=3
set Tile4=4
set Tile5=5
set Tile6=6
set Tile7=7
set Tile8=8
set Tile9=9
set AILevel=2
set choosingmenu=1
set PVPmode=0
set P1Wins=0
set P2Wins=0

:mainmenu (
set P1Wins=0
set P2Wins=0
cls
echo  ^*---------------^*
if %choosingmenu%==1 echo  ^| [+] Play PVP  ^|
if not %choosingmenu%==1 echo  ^| [-] Play PVP  ^|
if %choosingmenu%==2 echo  ^| [+] Play PVE  ^|
if not %choosingmenu%==2 echo  ^| [-] Play PVE  ^|
if %choosingmenu%==3 echo  ^| [+] Exit      ^|
if not %choosingmenu%==3 echo  ^| [-] Exit      ^|
echo  ^*---------------^*
echo  [W] - up
echo  [S] - down
echo  [E] - select
choice /c wse /n /m "Choose:"
if %ERRORLEVEL%==1 set /a choosingmenu-=1
if %ERRORLEVEL%==2 set /a choosingmenu+=1
if %choosingmenu%==4 set /a choosingmenu=1
if %choosingmenu%==0 set /a choosingmenu=3
if %ERRORLEVEL%==3 if %choosingmenu%==1 set PVPmode=1& set AILevel=0& goto ResetChart
if %ERRORLEVEL%==3 if %choosingmenu%==2 set PVPmode=0& goto DifficultyMenu
if %ERRORLEVEL%==3 if %choosingmenu%==3 cls& echo Thank you for playing! :)& pause& exit 
goto mainmenu
)
:DifficultyMenu (
cls
echo  ^*---------------^*
if %choosingmenu%==1 echo  ^| [+] Easy      ^|
if not %choosingmenu%==1 echo  ^| [-] Easy      ^|
if %choosingmenu%==2 echo  ^| [+] Normal    ^|
if not %choosingmenu%==2 echo  ^| [-] Normal    ^|
if %choosingmenu%==3 echo  ^| [+] Hard      ^|
if not %choosingmenu%==3 echo  ^| [-] Hard      ^|
if %choosingmenu%==4 echo  ^| [+] Back      ^|
if not %choosingmenu%==4 echo  ^| [-] Back      ^|
echo  ^*---------------^*
echo  [W] - up
echo  [S] - down
echo  [E] - select
choice /c wse /n /m "Choose:"
if %ERRORLEVEL%==1 set /a choosingmenu-=1
if %ERRORLEVEL%==2 set /a choosingmenu+=1
if %choosingmenu%==5 set /a choosingmenu=1
if %choosingmenu%==0 set /a choosingmenu=4
if %ERRORLEVEL%==3 if %choosingmenu%==1 set AILevel=0& goto ResetChart
if %ERRORLEVEL%==3 if %choosingmenu%==2 set AILevel=1& goto ResetChart
if %ERRORLEVEL%==3 if %choosingmenu%==3 set AILevel=2& goto ResetChart
if %ERRORLEVEL%==3 if %choosingmenu%==4 set choosingmenu=1& goto mainmenu
goto DifficultyMenu
)
:Chart (
cls
echo Wins:        ^*-------^*
echo              ^| %P1Wins% ^| %P2Wins% ^|
echo             ^*---------^*
echo             ^| %Tile1%  %Tile2%  %Tile3% ^|
echo             ^|---------^|
echo             ^| %Tile4%  %Tile5%  %Tile6% ^|
echo             ^|---------^|
echo             ^| %Tile7%  %Tile8%  %Tile9% ^|
echo             ^*---------^*
echo ===================================
echo  [E]  - Exit to main menu
if %PVPmode%==0 echo [1-9] - Choose where to place X
if %PVPmode%==1 if %Turn%==1 echo [1-9] - Choose where to place X
if %PVPmode%==1 if %Turn%==2 echo [1-9] - Choose where to place O
if %ERRORLEVEL%==10 pause& set choosingmenu=1& goto mainmenu
goto CheckGameStats
:PlayerTurn (
if %PVPmode%==0 choice /c 123456789e /n /m "Your turn:"
if %PVPmode%==1 choice /c 123456789e /n /m "[Player1]Your turn:"
if %ERRORLEVEL%==1 if %Tile1%==1 (set Tile%ERRORLEVEL%=X& set Turn=2& goto Chart) else goto Chart
if %ERRORLEVEL%==2 if %Tile2%==2 (set Tile%ERRORLEVEL%=X& set Turn=2& goto Chart) else goto Chart
if %ERRORLEVEL%==3 if %Tile3%==3 (set Tile%ERRORLEVEL%=X& set Turn=2& goto Chart) else goto Chart
if %ERRORLEVEL%==4 if %Tile4%==4 (set Tile%ERRORLEVEL%=X& set Turn=2& goto Chart) else goto Chart
if %ERRORLEVEL%==5 if %Tile5%==5 (set Tile%ERRORLEVEL%=X& set Turn=2& goto Chart) else goto Chart
if %ERRORLEVEL%==6 if %Tile6%==6 (set Tile%ERRORLEVEL%=X& set Turn=2& goto Chart) else goto Chart
if %ERRORLEVEL%==7 if %Tile7%==7 (set Tile%ERRORLEVEL%=X& set Turn=2& goto Chart) else goto Chart
if %ERRORLEVEL%==8 if %Tile8%==8 (set Tile%ERRORLEVEL%=X& set Turn=2& goto Chart) else goto Chart
if %ERRORLEVEL%==9 if %Tile9%==9 (set Tile%ERRORLEVEL%=X& set Turn=2& goto Chart) else goto Chart
goto Chart
)
:PlayerTurn2 (
choice /c 123456789e /n /m "[Player2]Your turn:"
if %ERRORLEVEL%==1 if %Tile1%==1 (set Tile%ERRORLEVEL%=O& set Turn=1& goto Chart) else goto Chart
if %ERRORLEVEL%==2 if %Tile2%==2 (set Tile%ERRORLEVEL%=O& set Turn=1& goto Chart) else goto Chart
if %ERRORLEVEL%==3 if %Tile3%==3 (set Tile%ERRORLEVEL%=O& set Turn=1& goto Chart) else goto Chart
if %ERRORLEVEL%==4 if %Tile4%==4 (set Tile%ERRORLEVEL%=O& set Turn=1& goto Chart) else goto Chart
if %ERRORLEVEL%==5 if %Tile5%==5 (set Tile%ERRORLEVEL%=O& set Turn=1& goto Chart) else goto Chart
if %ERRORLEVEL%==6 if %Tile6%==6 (set Tile%ERRORLEVEL%=O& set Turn=1& goto Chart) else goto Chart
if %ERRORLEVEL%==7 if %Tile7%==7 (set Tile%ERRORLEVEL%=O& set Turn=1& goto Chart) else goto Chart
if %ERRORLEVEL%==8 if %Tile8%==8 (set Tile%ERRORLEVEL%=O& set Turn=1& goto Chart) else goto Chart
if %ERRORLEVEL%==9 if %Tile9%==9 (set Tile%ERRORLEVEL%=O& set Turn=1& goto Chart) else goto Chart
goto Chart
)
:AiTurn (
if %AILevel%==0 goto RandomPlay
if %AILevel%==1 set /a RanStatus=%random% %%2 + 1
if %AILevel%==2 set /a RanStatus=2
if %RanStatus%==1 goto RandomPlay
rem this program file was made by achiev4ble
rem https://steamcommunity.com/id/achiev4ble/
if %RanStatus%==2 goto SmartPlay
:SmartPlay (
if %Tile1%==O if %Tile2%==O if %Tile3%==3 set Tile3=O& set Turn=1& goto Chart
if %Tile4%==O if %Tile5%==O if %Tile6%==6 set Tile6=O& set Turn=1& goto Chart
if %Tile7%==O if %Tile8%==O if %Tile9%==9 set Tile9=O& set Turn=1& goto Chart

if %Tile1%==O if %Tile3%==O if %Tile2%==2 set Tile2=O& set Turn=1& goto Chart
if %Tile4%==O if %Tile6%==O if %Tile5%==5 set Tile5=O& set Turn=1& goto Chart
if %Tile7%==O if %Tile9%==O if %Tile8%==8 set Tile8=O& set Turn=1& goto Chart

if %Tile3%==O if %Tile2%==O if %Tile1%==1 set Tile1=O& set Turn=1& goto Chart
if %Tile6%==O if %Tile5%==O if %Tile4%==4 set Tile4=O& set Turn=1& goto Chart
if %Tile9%==O if %Tile8%==O if %Tile7%==7 set Tile7=O& set Turn=1& goto Chart

if %Tile1%==O if %Tile4%==O if %Tile7%==7 set Tile7=O& set Turn=1& goto Chart
if %Tile2%==O if %Tile5%==O if %Tile8%==8 set Tile8=O& set Turn=1& goto Chart
if %Tile3%==O if %Tile6%==O if %Tile9%==9 set Tile9=O& set Turn=1& goto Chart

if %Tile1%==O if %Tile7%==O if %Tile4%==4 set Tile4=O& set Turn=1& goto Chart
if %Tile2%==O if %Tile8%==O if %Tile5%==5 set Tile5=O& set Turn=1& goto Chart
if %Tile3%==O if %Tile9%==O if %Tile6%==6 set Tile6=O& set Turn=1& goto Chart

if %Tile7%==O if %Tile4%==O if %Tile1%==1 set Tile1=O& set Turn=1& goto Chart
if %Tile8%==O if %Tile5%==O if %Tile2%==2 set Tile2=O& set Turn=1& goto Chart
if %Tile9%==O if %Tile6%==O if %Tile3%==3 set Tile3=O& set Turn=1& goto Chart

if %Tile1%==O if %Tile5%==O if %Tile9%==9 set Tile9=O& set Turn=1& goto Chart
if %Tile3%==O if %Tile5%==O if %Tile7%==7 set Tile7=O& set Turn=1& goto Chart

if %Tile1%==O if %Tile9%==O if %Tile5%==5 set Tile5=O& set Turn=1& goto Chart
if %Tile3%==O if %Tile7%==O if %Tile5%==5 set Tile5=O& set Turn=1& goto Chart

if %Tile9%==O if %Tile5%==O if %Tile1%==1 set Tile1=O& set Turn=1& goto Chart
if %Tile7%==O if %Tile5%==O if %Tile3%==3 set Tile3=O& set Turn=1& goto Chart




if %Tile1%==X if %Tile2%==X if %Tile3%==3 set Tile3=O& set Turn=1& goto Chart
if %Tile4%==X if %Tile5%==X if %Tile6%==6 set Tile6=O& set Turn=1& goto Chart
if %Tile7%==X if %Tile8%==X if %Tile9%==9 set Tile9=O& set Turn=1& goto Chart

if %Tile1%==X if %Tile3%==X if %Tile2%==2 set Tile2=O& set Turn=1& goto Chart
if %Tile4%==X if %Tile6%==X if %Tile5%==5 set Tile5=O& set Turn=1& goto Chart
if %Tile7%==X if %Tile9%==X if %Tile8%==8 set Tile8=O& set Turn=1& goto Chart

if %Tile3%==X if %Tile2%==X if %Tile1%==1 set Tile1=O& set Turn=1& goto Chart
if %Tile6%==X if %Tile5%==X if %Tile4%==4 set Tile4=O& set Turn=1& goto Chart
if %Tile9%==X if %Tile8%==X if %Tile7%==7 set Tile7=O& set Turn=1& goto Chart

if %Tile1%==X if %Tile4%==X if %Tile7%==7 set Tile7=O& set Turn=1& goto Chart
if %Tile2%==X if %Tile5%==X if %Tile8%==8 set Tile8=O& set Turn=1& goto Chart
if %Tile3%==X if %Tile6%==X if %Tile9%==9 set Tile9=O& set Turn=1& goto Chart

if %Tile1%==X if %Tile7%==X if %Tile4%==4 set Tile4=O& set Turn=1& goto Chart
if %Tile2%==X if %Tile8%==X if %Tile5%==5 set Tile5=O& set Turn=1& goto Chart
if %Tile3%==X if %Tile9%==X if %Tile6%==6 set Tile6=O& set Turn=1& goto Chart

if %Tile7%==X if %Tile4%==X if %Tile1%==1 set Tile1=O& set Turn=1& goto Chart
if %Tile8%==X if %Tile5%==X if %Tile2%==2 set Tile2=O& set Turn=1& goto Chart
if %Tile9%==X if %Tile6%==X if %Tile3%==3 set Tile3=O& set Turn=1& goto Chart

if %Tile1%==X if %Tile5%==X if %Tile9%==9 set Tile9=O& set Turn=1& goto Chart
if %Tile3%==X if %Tile5%==X if %Tile7%==7 set Tile7=O& set Turn=1& goto Chart

if %Tile1%==X if %Tile9%==X if %Tile5%==5 set Tile5=O& set Turn=1& goto Chart
if %Tile3%==X if %Tile7%==X if %Tile5%==5 set Tile5=O& set Turn=1& goto Chart

if %Tile9%==X if %Tile5%==X if %Tile1%==1 set Tile1=O& set Turn=1& goto Chart
if %Tile7%==X if %Tile5%==X if %Tile3%==3 set Tile3=O& set Turn=1& goto Chart
)
:RandomPlay
set /a RanChoice=%random% %%9 + 1
if %RanChoice%==1 if %Tile1%==1 (set Tile%RanChoice%=O& set Turn=1& goto Chart) else goto Chart
if %RanChoice%==2 if %Tile2%==2 (set Tile%RanChoice%=O& set Turn=1& goto Chart) else goto Chart
if %RanChoice%==3 if %Tile3%==3 (set Tile%RanChoice%=O& set Turn=1& goto Chart) else goto Chart
if %RanChoice%==4 if %Tile4%==4 (set Tile%RanChoice%=O& set Turn=1& goto Chart) else goto Chart
if %RanChoice%==5 if %Tile5%==5 (set Tile%RanChoice%=O& set Turn=1& goto Chart) else goto Chart
if %RanChoice%==6 if %Tile6%==6 (set Tile%RanChoice%=O& set Turn=1& goto Chart) else goto Chart
if %RanChoice%==7 if %Tile7%==7 (set Tile%RanChoice%=O& set Turn=1& goto Chart) else goto Chart
if %RanChoice%==8 if %Tile8%==8 (set Tile%RanChoice%=O& set Turn=1& goto Chart) else goto Chart
if %RanChoice%==9 if %Tile9%==9 (set Tile%RanChoice%=O& set Turn=1& goto Chart) else goto Chart
pause
goto Chart
)
)
:CheckGameStats (
if %PVPmode%==0 (
if %Tile1%==X if %Tile2%==X if %Tile3%==X echo Player Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile4%==X if %Tile5%==X if %Tile6%==X echo Player Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile7%==X if %Tile8%==X if %Tile9%==X echo Player Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile1%==X if %Tile4%==X if %Tile7%==X echo Player Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile2%==X if %Tile5%==X if %Tile8%==X echo Player Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile3%==X if %Tile6%==X if %Tile9%==X echo Player Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile1%==X if %Tile5%==X if %Tile9%==X echo Player Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile3%==X if %Tile5%==X if %Tile7%==X echo Player Wins!& set /a P1Wins+=1& pause& goto ResetChart

if %Tile1%==O if %Tile2%==O if %Tile3%==O echo Computer Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile4%==O if %Tile5%==O if %Tile6%==O echo Computer Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile7%==O if %Tile8%==O if %Tile9%==O echo Computer Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile1%==O if %Tile4%==O if %Tile7%==O echo Computer Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile2%==O if %Tile5%==O if %Tile8%==O echo Computer Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile3%==O if %Tile6%==O if %Tile9%==O echo Computer Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile1%==O if %Tile5%==O if %Tile9%==O echo Computer Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile3%==O if %Tile5%==O if %Tile7%==O echo Computer Wins!& set /a P2Wins+=1& pause& goto ResetChart
)
if %PVPmode%==1 (
if %Tile1%==X if %Tile2%==X if %Tile3%==X echo Player 1 Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile4%==X if %Tile5%==X if %Tile6%==X echo Player 1 Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile7%==X if %Tile8%==X if %Tile9%==X echo Player 1 Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile1%==X if %Tile4%==X if %Tile7%==X echo Player 1 Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile2%==X if %Tile5%==X if %Tile8%==X echo Player 1 Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile3%==X if %Tile6%==X if %Tile9%==X echo Player 1 Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile1%==X if %Tile5%==X if %Tile9%==X echo Player 1 Wins!& set /a P1Wins+=1& pause& goto ResetChart
if %Tile3%==X if %Tile5%==X if %Tile7%==X echo Player 1 Wins!& set /a P1Wins+=1& pause& goto ResetChart

if %Tile1%==O if %Tile2%==O if %Tile3%==O echo Player 2 Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile4%==O if %Tile5%==O if %Tile6%==O echo Player 2 Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile7%==O if %Tile8%==O if %Tile9%==O echo Player 2 Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile1%==O if %Tile4%==O if %Tile7%==O echo Player 2 Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile2%==O if %Tile5%==O if %Tile8%==O echo Player 2 Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile3%==O if %Tile6%==O if %Tile9%==O echo Player 2 Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile1%==O if %Tile5%==O if %Tile9%==O echo Player 2 Wins!& set /a P2Wins+=1& pause& goto ResetChart
if %Tile3%==O if %Tile5%==O if %Tile7%==O echo Player 2 Wins!& set /a P2Wins+=1& pause& goto ResetChart
)

if not %Tile1%==1 if not %Tile2%==2 if not %Tile3%==3 if not %Tile4%==4 if not %Tile5%==5 if not %Tile6%==6 if not %Tile7%==7 if not %Tile8%==8 if not %Tile9%==9 echo Draw!& pause& goto ResetChart
if %Turn%==1 goto PlayerTurn
if %Turn%==2 if %PVPmode%==0 goto AiTurn
if %Turn%==2 if %PVPmode%==1 goto PlayerTurn2
)
:ResetChart (
set Turn=1
set Tile1=1
set Tile2=2
set Tile3=3
set Tile4=4
set Tile5=5
set Tile6=6
set Tile7=7
set Tile8=8
set Tile9=9
goto Chart
)
echo [[[It appears theres an error!]]]
pause