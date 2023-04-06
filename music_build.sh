mkdir -p /opt/
cd /opt/
git clone https://github.com/maomao1996/Vue-mmPlayer
cd /opt/Vue-mmPlayer/
apt install -y nodejs npm 
npm install

grep "http://localhost:3000" -rl ./ | xargs sed -i "s#http://localhost:3000#https://netease-cloud-music-api-six-flame.vercel.app#g"

npm run build

cd ./dist/
echo "music.xiaobeing.cn" > CNAME
rm -rf .git
git rm --cached -r *
git config --global user.name "Mr-jiangrj"
git config --global user.email "1326890495@qq.com"
git init
git add -A
git remote add origin git@github.com:Mr-jiangrj/music.git
git commit -m "change user info"
git push origin master:main --force
