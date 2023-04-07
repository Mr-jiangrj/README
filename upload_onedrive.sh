wget https://github.com/MoeClub/OneList/raw/master/OneDriveUploader/amd64/linux/OneDriveUploader
chmod 777 OneDriveUploader
mv OneDriveUploader /usr/bin/
wget https://github.com/Mr-jiangrj/website_build/raw/main/onedrive.zip
unzip onedrive.zip
rm -rf onedrive.zip
OneDriveUploader -t 18 -s "*" -r "Share"
