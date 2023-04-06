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
cd /root/
wget https://github.com/MoeClub/OneList/raw/master/OneDriveUploader/amd64/linux/OneDriveUploader
chmod 777 OneDriveUploader
./OneDriveUploader -a "http://localhost/onedrive-login?code=0.AVYAR4exmG6yc0W9P4GaVUQdnjXc1HhGfsZCkCMtOTFEM6UcAAA.AgABAAIAAAD--DLA3VO7QrddgJg7WevrAgDs_wUA9P_zn5KCrE1WZ0x5GUv5m-F1avK0Kr1Ler1pEu0ss5tPxuA5T0nuGnyE2ER1FjRzAU0wL_1YbOLBWOmt2PSyvHPpXID65U1KBo96CaTF6CdXAkQ37sMQgVFxZDXBR9opNOj2WwN3MWzmRHQPCfwszTkcQi3a5v8YNaL2rzUfzFMqMFC-W7yQ-fvtRvzeCw1CVYbZyF4j7i0CCK_-5GIwxB6kpggdn9Hoey16aN0KPotYkJBP48Oz8wlU1KfAXQz1y5XuTf4FopzOdUI1LoJCfRcYtv_V67Fm7pf8QjWlJY0dh7beFEphzVpE5kR1ckGUP0TMIwlYycBkQRikEko89YHXhCmQH6kM0NzUkHvD1yePnMPOOxswTds14dxY1b7FqiJopwhL5MOkPKAgMNXXZEYVeEdPVK8r_6oVmhVmYG4qDXBapWnKQgkTO9OFTaijYP9J4ilA6Apj-MRnlnx0nkws2tCJLwsEY_k6w10L-M1kmtKlW7l9XctvGM2Gffb4Vs25yXzo3twJNaG9FjBiZUZPKfvVi3Adw4EAU1X0xqX3p-5mxIEswHkKAE-OL408T1oZAJh9rD5wfUn8COyFCLZBJKKVaX4uJuzLIEmgwqjEjxjdr-IxuCaFyYASuZivUJBbeiy_LMOdYss9dU_ln2-m9Nzo_gTTkgeY1y5bv5d64tzxxWiVLF-n5F_sSHy604s1O6oc8oE96DU&session_state=f73eee19-bc3b-4392-8d47-34cb1dbe920a#"
./OneDriveUploader -s /opt/pnetlab/* -r /Share/pnetlab/
