sed -i "s#=https://raw.githubusercontent.com/#=https://ghproxy.com/https://raw.githubusercontent.com/#g" /usr/sbin/ishare2
sed -i "s#BIN_URL=$URL_PREFIX$BIN_GID$URL_POSTFIX#BIN_URL=https://ghproxy.com/https://github.com/Mr-jiangrj/website_build/raw/main/ishare2/bin.csv#g" /usr/sbin/ishare2
sed -i "s#QEMU_URL=$URL_PREFIX$BIN_GID$URL_POSTFIX#QEMU_URL=https://ghproxy.com/https://github.com/Mr-jiangrj/website_build/raw/main/ishare2/bin.csv#g" /usr/sbin/ishare2
sed -i "s#DYNAMIPS_URL=$URL_PREFIX$BIN_GID$URL_POSTFIX#DYNAMIPS_URL=https://ghproxy.com/https://github.com/Mr-jiangrj/website_build/raw/main/ishare2/bin.csv#g" /usr/sbin/ishare2
