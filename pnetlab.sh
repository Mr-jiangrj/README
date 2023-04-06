apt install -y lzma
rm -rf /opt/pnetlab
mkdir -p /opt/pnetlab/
cd /opt/pnetlab/
rm -rf /opt/repo/pnetlab/*
install_pnetlab_v6=https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/install_pnetlab_v6.sh
wget --content-disposition -q --no-check-certificate $install_pnetlab_v6
sed -i 's#--show-progress    #--show-progress --no-check-certificate #g' install_pnetlab_v6.sh
cat install_pnetlab_v6.sh | grep -E "^URL_|^wget " > download_pnetlab_v6.sh
# sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/L/linux-5.17.15-pnetlab-uksm/#https://repo.xiaobeing.cn/pnetlab/#g' install_pnetlab_v6.sh
# sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/D/#https://repo.xiaobeing.cn/pnetlab/#g' install_pnetlab_v6.sh
# sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_GUACAMOLE/#https://repo.xiaobeing.cn/pnetlab/#g' install_pnetlab_v6.sh
# sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_DYNAMIPS/#https://repo.xiaobeing.cn/pnetlab/#g' install_pnetlab_v6.sh
# sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_SCHEMA/#https://repo.xiaobeing.cn/pnetlab/#g' install_pnetlab_v6.sh
# sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_VPC/#https://repo.xiaobeing.cn/pnetlab/#g' install_pnetlab_v6.sh
# sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_QEMU/#https://repo.xiaobeing.cn/pnetlab/#g' install_pnetlab_v6.sh
# sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_DOCKER/#https://repo.xiaobeing.cn/pnetlab/#g' install_pnetlab_v6.sh
# sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_PNETLAB/#https://repo.xiaobeing.cn/pnetlab/#g' install_pnetlab_v6.sh
# sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_WIRESHARK/#https://repo.xiaobeing.cn/pnetlab/#g' install_pnetlab_v6.sh
echo ""
echo "--------------------  PNETLAB File Download Shell --------------------"
echo ""
cat download_pnetlab_v6.sh
echo ""
bash download_pnetlab_v6.sh
echo ""
echo "--------------------  PNETLAB New Install Shell --------------------"
echo ""
cat install_pnetlab_v6.sh | grep -E "^URL_|^wget "
echo ""
# cd /opt/repo/pnetlab/ && unzip pnetlab_kernel.zip && unzip pre-docker.zip
# dpkg-scanpackages /opt/repo/pnetlab/ | gzip -9c > /opt/repo/pnetlab/Packages.gz
echo "--------------------  Upload to Github Repo --------------------"
cd /opt/pnetlab/
tar -c --lzma . | split -b 50m -d - pnetlab.tar.lzma.
mkdir -p /opt/pnetlab/tar
mv pnetlab.tar.lzma.* /opt/pnetlab/tar/
cd /opt/pnetlab/tar/
echo "cat pnetlab.tar.lzma.* > pnetlab.tar.lzma<br>" > README.md
echo "unlzma pnetlab.tar.lzma<br>" >> README.md
echo "tar xf pnetlab.tar<br>" >> README.md
git config --global user.name "Mr-jiangrj"
git config --global user.email "1326890495@qq.com"
git init
git add .
git commit -m "pnetlab"
git remote add origin git@github.com:Mr-jiangrj/pnetlab.git
git push origin master:main --force
