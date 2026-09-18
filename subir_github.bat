@echo off
chcp 65001 > nul
echo ========================================================
echo    AUTOMATIZADOR DE UPLOAD PARA O GITHUB - TIAGO MOTA
echo ========================================================
echo.

echo [1/6] Inicializando o repositorio local...
git init

echo [2/6] Adicionando todos os arquivos (codigo, docs e imagens)...
git add .

echo [3/6] Criando o commit inicial atualizado...
git commit -m "feat: atualiza codigo fonte, documentacao README e assets"

echo [4/6] Verificando conexao com o repositorio remoto...
git remote remove origin 2>nul
git remote add origin https://github.com/Tiago-Mota09/Gerenciador_OrdemDeServico_TiagoMota.git

echo [5/6] Definindo a branch principal como main...
git branch -M main

echo [6/6] Enviando os arquivos para o GitHub (forçando a sincronizacao)...
git push -u origin main --force

echo.
echo ========================================================
echo    PROCESSO CONCLUIDO COM SUCESSO! BUON LAVORO!
echo ========================================================
pause