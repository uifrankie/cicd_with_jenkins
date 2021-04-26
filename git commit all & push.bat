call "git find.bat"
@echo on

git add --all .
git commit --message "commit message?" --dry-run

set /p commit_message="Commit message: " %=%
REM replaces all instances of " with \"
set commit_message=%commit_message:"=\"%

git commit --message "%commit_message%"

git push --progress origin HEAD
pause