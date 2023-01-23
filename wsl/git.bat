@echo off
set datetimef="%date:~-4%-%date:~3,2%-%date:~0,2%_%time:~0,2%:%time:~3,2%_ICT+7"
git.exe add .
git.exe commit -m "%datetimef%"
git.exe push -u origin main