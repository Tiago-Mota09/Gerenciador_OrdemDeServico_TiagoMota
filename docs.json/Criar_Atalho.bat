DOS
@echo off
chcp 65001 >nul
echo Criando atalho na Area de Trabalho com o icone do seu logo...

set SCRIPT_DIR=%~dp0
set HTML_PATH=%SCRIPT_DIR%Gerenciador_OrdemDeServico_TiagoMota.html
set ICO_PATH=%SCRIPT_DIR%logo.ico
set VBS_SCRIPT=%TEMP%\create_os_shortcut.vbs

echo Set oWS = WScript.CreateObject("WScript.Shell") > "%VBS_SCRIPT%"
echo sLinkFile = oWS.SpecialFolders("Desktop") ^& "\Gerenciador de OS - Tiago Mota.lnk" >> "%VBS_SCRIPT%"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%VBS_SCRIPT%"
echo oLink.TargetPath = "%HTML_PATH%" >> "%VBS_SCRIPT%"
echo oLink.IconLocation = "%ICO_PATH%" >> "%VBS_SCRIPT%"
echo oLink.Save >> "%VBS_SCRIPT%"

cscript //nologo "%VBS_SCRIPT%"
del "%VBS_SCRIPT%"

echo.
echo =======================================================
echo ATALHO CRIADO COM SUCESSO NA SUA AREA DE TRABALHO!
echo =======================================================
echo.
pause