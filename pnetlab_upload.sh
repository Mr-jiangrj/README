mkdir -p /opt/pnetlab/
cd /opt/pnetlab/
install_pnetlab_v6=https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/install_pnetlab_v6.sh
wget --content-disposition -q --show-progress $install_pnetlab_v6
cat install_pnetlab_v6.sh | grep -E "^URL_|^wget " > download_pnetlab_v6.sh
sed -i 's#https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/L/linux-5.17.15-pnetlab-uksm/#https://qiniu.xiaobeing.cn/#g' install_pnetlab_v6.sh
sed -i 's#https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/D/#https://qiniu.xiaobeing.cn/#g' install_pnetlab_v6.sh
sed -i 's#https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_GUACAMOLE/#https://qiniu.xiaobeing.cn/#g' install_pnetlab_v6.sh
sed -i 's#https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_DYNAMIPS/#https://qiniu.xiaobeing.cn/#g' install_pnetlab_v6.sh
sed -i 's#https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_SCHEMA/#https://qiniu.xiaobeing.cn/#g' install_pnetlab_v6.sh
sed -i 's#https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_VPC/#https://qiniu.xiaobeing.cn/#g' install_pnetlab_v6.sh
sed -i 's#https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_QEMU/#https://qiniu.xiaobeing.cn/#g' install_pnetlab_v6.sh
sed -i 's#https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_DOCKER/#https://qiniu.xiaobeing.cn/#g' install_pnetlab_v6.sh
sed -i 's#https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_PNETLAB/#https://qiniu.xiaobeing.cn/#g' install_pnetlab_v6.sh
sed -i 's#https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_WIRESHARK/#https://qiniu.xiaobeing.cn/#g' install_pnetlab_v6.sh
bash download_pnetlab_v6.sh
wget https://github.com/MoeClub/OneList/raw/master/OneDriveUploader/amd64/linux/OneDriveUploader
chmod 777 OneDriveUploader
mv OneDriveUploader /usr/bin/
wget https://github.com/Mr-jiangrj/website_build/raw/main/onedrive.zip
unzip onedrive.zip
OneDriveUploader -t 18 -s "install_pnetlab_v6.sh" -r "Share"
rm -rf /opt/pnetlab/onedrive.zip
rm -rf /opt/pnetlab/auth.json
rm -rf /opt/pnetlab/download_pnetlab_v6.sh
cd /tmp/
wget https://devtools.qiniu.com/qshell-v2.10.0-linux-amd64.tar.gz
tar xf qshell-v2.10.0-linux-amd64.tar.gz
mv qshell /usr/bin/
wget https://github.com/Mr-jiangrj/website_build/raw/main/qiniu.zip
unzip qiniu.zip
bash qiniu.sh
qshell qupload qupload.conf
cat /opt/pnetlab/install_pnetlab_v6.sh | grep "^URL_"
