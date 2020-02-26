@echo off
echo Script Envoie Github 
echo Auteur : Christopher Vermersch
echo Version : Beta 1.0 
:choix
echo =============-menu-=================
echo 1) Faire un commit et l'envoyer sur github
echo 2) charger un commit 
echo 3) faire une branch
echo 4) quitter
echo.
echo Choix action : 
set /p action=
if "%action%"=="1" goto:firstcommit
if "%action%"=="2" goto:loadcommit
if "%action%"=="3" goto:branch
if "%action%"=="4" exit

:firstcommit
echo ===============================
echo.
echo /!\ N'oublier pas de vous placer dans le bon dossier /!\
echo Rentre la destination du dossier (sans mettre cd juste le chemin):
set /p dossier=
echo. 
echo ===============================
echo Veuillez saisir votre nom d'utilisateur : 
set /p user=
echo Veuillez saisir votre adresse E-mail : 
set /p email=
echo veuillez saisir votre liens github disponible a la creation d'un nouveau repository : 
set /p githublink= 

cd %dossier%
git init
git config --global user.name "%user%"
git config --global user.email "%email%"
git add .
echo Comment voulez vous appeller votre 1er commit ?
set /p commit=
git commit -m "%commit%"
echo Partage sur github en cours :) 
%githublink%
git push -u origin master
echo Le 1er commit "%commit%" a était envoyé avec succés !! 
echo Merci d'avoir utiliser Mon script :) :)
pause
exit

:branch
echo Vous avez choisis de faire une branche
echo Assurez vous d'avoir charger ou cree un commit avant
echo.
echo qu'elle nom voulez vous donner a votre branche? 
set /p nombranch=
git branch %nombranch%
git push --set-upstream origin %nombranch%
echo.
echo Bravo vous avez cree votre branche au nom de %nombranch%.

goto :menubranch


:menubranch
echo. Que voulez vous faire maintenant ? 
echo.
echo 1) Retourner sur le MAIN
echo 2) Retouner au menu
echo 3) Mettre a jour la branche
echo Choix action : 
set /p action=
if "%action%"=="1" git checkout master
if "%action%"=="2" goto:choix
if "%action%"=="3" goto:update

:update
echo Qu'elle branche voulez vous verifier ? 
set /p nombranch=
git release %nombranch%

pause>nul

echo voulez vous revenir en arriére ? 
choice /c on 
if %errorlevel%==2 goto :non
if %errorlevel%==1 goto :oui

:non 
exit

:oui
goto :menubranch



:loadcommit
echo vous voulez charger un commit
echo Saisir le clone : 
set /p clone= 
echo Saisir le dossier de destination : 
set /p destination=
cd %destination%

git clone %clone%

goto :choix

