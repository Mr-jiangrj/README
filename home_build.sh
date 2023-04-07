cd /root/
wget https://github.com/Mr-jiangrj/website_build/raw/main/ssh.zip
unzip ssh.zip
mkdir -p /opt/
cd /opt/
git clone https://github.com/imsyy/home.git
cd /opt/home/
apt install -y nodejs npm 
npm install -g yarn
yarn install

grep "無名の主页" -rl ./ | xargs sed -i "s/無名の主页/@小江不emoの主页/g"
grep "無名" -rl ./ | xargs sed -i "s/無名/@小江不emo/g"
grep "豫ICP备2022018134号-1" -rl ./ | xargs sed -i "s/豫ICP备2022018134号-1/粤ICP备17134711号-1/g"
sed -i "s#imsyy.top/#xiaobeing.cn/#g" ./src/components/Links/index.vue
sed -i "s/博客/摄影/g" ./src/components/Links/index.vue
sed -i "s/起始页/Evolution/g" ./src/components/Links/index.vue
sed -i "s/网址集/小红书/g" ./src/components/Links/index.vue
sed -i "s/今日热榜/软件源/g" ./src/components/Links/index.vue
sed -i "s#blog.xiaobeing.cn#v.douyin.com/Agjg976#g" ./src/components/Links/index.vue
sed -i "s/nav.xiaobeing.cn/evolution-host.com/g" ./src/components/Links/index.vue
sed -i "s/web.xiaobeing.cn/canon.xiaobeing.cn/g" ./src/components/Links/index.vue
sed -i "s/hot.xiaobeing.cn/repo.xiaobeing.cn/g" ./src/components/Links/index.vue
sed -i "s/2020-10-24/1994-10-30/g" ./.env
grep "https://github.com/imsyy" -rl ./ | xargs sed -i "s#https://github.com/imsyy#https://github.com/Mr-jiangrj#g"
grep "https://space.bilibili.com/98544142" -rl ./ | xargs sed -i "s#https://space.bilibili.com/98544142#https://space.bilibili.com/109490148#g"
grep "https://res.abeim.cn/api/qq/?qq=1539250352" -rl ./ | xargs sed -i "s#https://res.abeim.cn/api/qq/?qq=1539250352#https://res.abeim.cn/api/qq/?qq=1326890495#g"
grep "mailto:one@imsyy.top" -rl ./ | xargs sed -i "s#mailto:one@imsyy.top#mailto:1326890495@qq.com#g"
grep "https://twitter.com/iimmsyy" -rl ./ | xargs sed -i "s#https://twitter.com/iimmsyy#https://twitter.com/MRJOYBO#g"
grep "https://t.me/bottom_user" -rl ./ | xargs sed -i "s#https://t.me/bottom_user#https://t.me/MRJOYBO#g"
grep "https://www.imsyy.top/" -rl ./ | xargs sed -i "s#https://www.imsyy.top/#https://www.xiaobeing.cn/#g"
grep "作者: imsyy" -rl ./ | xargs sed -i "s#作者: imsyy#作者: @小江不emo#g"
grep "Copyright (c) 2022 imsyy" -rl ./ | xargs sed -i "s#Copyright (c) 2022 imsyy#Copyright (c) 2022 @小江不emo#g"
grep "\"author\": \"imsyy\"" -rl ./ | xargs sed -i "s#\"author\": \"imsyy\"#\"author\": \"@小江不emo\"#g"
grep "主页：https://www.imsyy.top/" -rl ./ | xargs sed -i "s#主页：https://www.imsyy.top/#主页：https://www.xiaobeing.cn/#g"
grep "https://cdn.imsyy.top/gh/imsyy/file/font/HarmonyOS_Sans/regular.min.css" -rl ./ | xargs sed -i "s#https://cdn.imsyy.top/gh/imsyy/file/font/HarmonyOS_Sans/regular.min.css#https://s1.hdslb.com/bfs/static/jinkela/long/font/regular.css#g"
grep "VITE_SITE_URL = \"imsyy.top\"" -rl ./ | xargs sed -i "s#VITE_SITE_URL = \"imsyy.top\"#VITE_SITE_URL = \"xiaobeing.cn\"#g"
grep "本站已经苟活了" -rl ./ | xargs sed -i "s#本站已经苟活了#本宝宝已经出生了#g"

yarn build

cd ./dist/
echo "xiaobeing.cn" > CNAME
echo "www.xiaobeing.cn" >> CNAME
rm -rf .git
git rm --cached -r *
git config --global user.name "Mr-jiangrj"
git config --global user.email "1326890495@qq.com"
git init
git add -A
git remote add origin git@github.com:Mr-jiangrj/home.git
git commit -m "index"
git push origin master:main --force
