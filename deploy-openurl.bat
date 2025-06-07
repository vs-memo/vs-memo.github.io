@echo off

REM Git Bashのインストールパス(個々人で異なる)
set "GIT_BASH_PATH="D:\Software\Git\git-bash.exe""
REM 実行したいGit Bashコマンド(例: "git pull; git status")
set "GIT_COMMAND=npx quartz sync"
REM Webページを開くURL
set "WEB_URL=https://vs-memo.github.io"


REM バッチファイルが置かれているディレクトリに移動
pushd "%~dp0"
REM 管理者権限でGit Bashを実行し、コマンドを実行、その後閉じる
powershell -Command "Start-Process '%GIT_BASH_PATH%' -Verb RunAs -ArgumentList '-c \"%GIT_COMMAND%; exit\"'"

REM 3秒間待機する
echo 3秒間待機します...
timeout /t 3 /nobreak

REM 指定したWebページを開く
echo Webページを開きます: %WEB_URL%
start "" "%WEB_URL%"

REM 元のディレクトリに戻る (オプション)
popd

echo.
echo Git Bashでの処理が完了しました。
pause