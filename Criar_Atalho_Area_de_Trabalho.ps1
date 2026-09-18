# Script em PowerShell para criar Atalho na Área de Trabalho com Ícone do Logo
$desktopPath = [Environment]::GetFolderPath("Desktop")
$shortcutPath = Join-Path -Path $desktopPath -ChildPath "Gerenciador de OS - Tiago Mota.lnk"

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($shortcutPath)

# Caminho do arquivo HTML na mesma pasta do script
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$htmlPath = Join-Path -Path $scriptDir -ChildPath "Gerenciador_OrdemDeServico_TiagoMota_ComFavicon.html"
$icoPath = Join-Path -Path $scriptDir -ChildPath "logo.ico"

$Shortcut.TargetPath = $htmlPath
if (Test-Path $icoPath) {
    $Shortcut.IconLocation = $icoPath
}
$Shortcut.Save()

Write-Host "Atalho criado com sucesso na Area de Trabalho!" -ForegroundColor Green
