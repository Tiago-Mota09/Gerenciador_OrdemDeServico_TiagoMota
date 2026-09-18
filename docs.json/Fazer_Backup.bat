@echo off
chcp 65001 >nul
echo 🔄 Iniciando o backup do sistema...

:: Define a data e hora para o nome do arquivo (formato seguro para nomes)
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set ano=%datetime:~0,4%
set mes=%datetime:~4,2%
set dia=%datetime:~6,2%
set hora=%datetime:~8,2%
set min=%datetime:~10,2%
set seg=%datetime:~12,2%
set timestamp=%ano%-%mes%-%dia%_%hora%-%min%-%seg%

:: Cria uma pasta de backups se ela não existir
if not exist "Backup_Docs" mkdir "Backup_Docs"

:: Compacta ou copia a pasta docs.json com data/hora
xcopy "docs.json" "Backup_Docs\docs_%timestamp%\" /E /I /H /C /Y

echo.
echo ✅ Backup concluído com sucesso na pasta "Backup_Docs"!
timeout /t 5