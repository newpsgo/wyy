chcp 65001

start "C:\Windows\System32\cmd.exe"
git add .
git commit -m "From Auto Updata"
git push
pause
taskkill /f /im cmd.exe