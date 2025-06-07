@echo off

REM Git Bashのインストールパス (環境に合わせて変更してください)
set "GIT_BASH_PATH="D:\Software\Git\git-bash.exe""
REM 実行したいGit Bashコマンド (例: git status)
set "GIT_COMMAND=npx quartz sync; sleep 3; open https://vs-memo.github.io"
REM 複数のコマンドを実行する場合は、セミコロンで区切ります (例: "git pull; git status")
REM set "GIT_COMMAND=git pull; git status"

REM ==========================================================
REM バッチファイルが置かれているディレクトリに移動
pushd "%~dp0"
REM ==========================================================

REM 管理者権限でGit Bashを実行し、コマンドを実行、その後閉じる
powershell -Command "Start-Process '%GIT_BASH_PATH%' -Verb RunAs -ArgumentList '-c \"%GIT_COMMAND%; exit\"'"

REM ==========================================================
REM 元のディレクトリに戻る (オプション)
popd
REM ==========================================================

echo.
echo Git Bashでの処理が完了しました。
pause