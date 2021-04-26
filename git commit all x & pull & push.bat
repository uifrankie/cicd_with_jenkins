call "git find.bat"
@echo on

git add --all .
git commit --message "commit message?" --dry-run

git commit --message "x"

git pull -v --progress origin

git push --progress origin HEAD
pause