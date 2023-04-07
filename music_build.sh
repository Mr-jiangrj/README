cd /root/
rm -rf .ssh
wget https://github.com/Mr-jiangrj/website_build/raw/main/ssh.zip
unzip ssh.zip
mkdir -p /opt/
cd /opt/
git clone https://github.com/maomao1996/Vue-mmPlayer
cd /opt/Vue-mmPlayer/
apt install -y nodejs npm 
npm install

grep "http://localhost:3000" -rl ./ | xargs sed -i "s#http://localhost:3000#https://musicapi.xiaobeing.cn#g"
grep "茂茂" -rl ./ | xargs sed -i "s#茂茂#@小江不emo#g"
grep "https://github.com/maomao1996" -rl ./ | xargs sed -i "s#https://github.com/maomao1996#https://github.com/Mr-jiangrj#g"
grep "\"author\": \"maomao1996 <1714487678@qq.com>\"" -rl ./ | xargs sed -i "s#\"author\": \"maomao1996 <1714487678@qq.com>\"#\"author\": \"@小江不emo <1326890495@qq.com>\"#g"
grep "mmPlayer在线音乐播放器" -rl ./ | xargs sed -i "s#mmPlayer在线音乐播放器#Radios在线音乐播放器#g"
grep "死鬼去哪里了！" -rl ./ | xargs sed -i "s#死鬼去哪里了！#客官这么快就要走了嘛~#g"
grep "(つェ⊂)咦!又好了!" -rl ./ | xargs sed -i "s#(つェ⊂)咦!又好了!#客官来点音乐嘛~#g"

npm run build

cd ./dist/
grep "mmPlayer 在线音乐播放器" -rl ./ | xargs sed -i "s#mmPlayer 在线音乐播放器#Radios 在线音乐播放器#g"
echo "music.xiaobeing.cn" > CNAME
rm -rf .git
git rm --cached -r *
git config --global user.name "Mr-jiangrj"
git config --global user.email "1326890495@qq.com"
git init
git add -A
git remote add origin git@github.com:Mr-jiangrj/music.git
git commit -m "music"
git push origin master:main --force
