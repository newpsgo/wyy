chcp 65001

git init
git add .
git commit -m “%date:~0,10%,%time:~0,8%”
git remote add origin https://github.com/466034505/wyy.git
git push -f origin master
pause