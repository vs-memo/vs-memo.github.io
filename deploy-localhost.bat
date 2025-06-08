@echo off

REM Git Bashのインストールパス(個々人で異なる)
set "GIT_BASH_PATH="D:\Software\Git\git-bash.exe""
REM 実行したいGit Bashコマンド(例: "git pull; git status")
set "GIT_COMMAND=npx quartz build --serve"
REM Webページを開くURL
set "WEB_URL=http://localhost:8080"


REM バッチファイルが置かれているディレクトリに移動
pushd "%~dp0"
REM 管理者権限でGit Bashを実行し、コマンドを実行、その後閉じる
powershell -Command "Start-Process '%GIT_BASH_PATH%' -Verb RunAs -ArgumentList '-c \"%GIT_COMMAND%; exit\"'"

REM 元のディレクトリに戻る (オプション)
popd

REM 3秒間待機する
timeout /t 3 /nobreak

REM 指定したWebページを開く
start "" "%WEB_URL%"

REM echo.
REM echo Git Bashでの処理が完了しました。
REM pause