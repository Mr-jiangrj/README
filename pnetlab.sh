mkdir -p /opt/pnetlab/
cd /opt/pnetlab/
install_pnetlab_v6=https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/install_pnetlab_v6.sh
wget --content-disposition -q --no-check-certificate $install_pnetlab_v6
sed -i 's#--show-progress    #--show-progress --no-check-certificate #g' install_pnetlab_v6.sh
cat install_pnetlab_v6.sh | grep -E "^URL_|^wget " > download_pnetlab_v6.sh
sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/L/linux-5.17.15-pnetlab-uksm/#https://pan.xiaobeing.cn/api/raw/?path=/#g' install_pnetlab_v6.sh
sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/D/#https://pan.xiaobeing.cn/api/raw/?path=/#g' install_pnetlab_v6.sh
sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_GUACAMOLE/#https://pan.xiaobeing.cn/api/raw/?path=/#g' install_pnetlab_v6.sh
sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_DYNAMIPS/#https://pan.xiaobeing.cn/api/raw/?path=/#g' install_pnetlab_v6.sh
sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_SCHEMA/#https://pan.xiaobeing.cn/api/raw/?path=/#g' install_pnetlab_v6.sh
sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_VPC/#https://pan.xiaobeing.cn/api/raw/?path=/#g' install_pnetlab_v6.sh
sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_QEMU/#https://pan.xiaobeing.cn/api/raw/?path=/#g' install_pnetlab_v6.sh
sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_DOCKER/#https://pan.xiaobeing.cn/api/raw/?path=/#g' install_pnetlab_v6.sh
sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_PNETLAB/#https://pan.xiaobeing.cn/api/raw/?path=/#g' install_pnetlab_v6.sh
sed -i 's#https://unetlab.cloud/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_WIRESHARK/#https://pan.xiaobeing.cn/api/raw/?path=/#g' install_pnetlab_v6.sh
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
echo "--------------------  Upload to Github Repo --------------------"
cd /opt/pnetlab/
