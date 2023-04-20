sed -i "s#=https://raw.githubusercontent.com/#=https://raw.iqiq.io/#g" /usr/sbin/ishare2
sed -i "s#BIN_URL=\$URL_PREFIX\$BIN_GID\$URL_POSTFIX#BIN_URL=https://raw.iqiq.io/Mr-jiangrj/website_build/main/ishare2/bin.csv#g" /usr/sbin/ishare2
sed -i "s#QEMU_URL=\$URL_PREFIX\$QEMU_GID\$URL_POSTFIX#QEMU_URL=https://raw.iqiq.io/Mr-jiangrj/website_build/main/ishare2/bin.csv#g" /usr/sbin/ishare2
sed -i "s#DYNAMIPS_URL=\$URL_PREFIX\$DYNAMIPS_GID\$URL_POSTFIX#DYNAMIPS_URL=https://raw.iqiq.io/Mr-jiangrj/website_build/main/ishare2/bin.csv#g" /usr/sbin/ishare2
