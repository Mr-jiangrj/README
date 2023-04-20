# 🕮 基于 Ubuntu 20.04 的 PNETLAB v6 部署教程 🕮

❌ ❌ ❌ 尝鲜版本（未发布）：[PNETLAB v6.0.0-42（ 基于 Ubuntu 20.04 ）](https://labhub.eu.org/zh-CN/UNETLAB%20I/upgrades_pnetlab/Focal/P/PNET_PNETLAB/)

✔︎ ✔︎ ✔︎ 稳定版本（已发布）：[PNETLAB v5.3.13（ 基于 Ubuntu 18.04 ）](https://labhub.eu.org/zh-CN/UNETLAB%20I/upgrades_pnetlab/bionic/)

### 🖊︎ 第一步：操作系统下载、分区及安装

- Ubuntu 20.04 下载地址：[https://releases.ubuntu.com/20.04/](https://releases.ubuntu.com/20.04/)
- Ubuntu 18.04 下载地址：[https://releases.ubuntu.com/18.04/](https://releases.ubuntu.com/18.04/)
- 安装过程略 ··· ，建议选择自定义分区（除 /boot 及 /boot/efi 分区外，剩余分区全部挂载到 / 根目录上）

```shell
[root@xiaobeing ~]# lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda               8:0    0  500G  0 disk
├─sda2            8:2    0    2G  0 part /boot
├─sda3            8:3    0  496G  0 part
│ └─centos-root 253:0    0  496G  0 lvm  /
└─sda1            8:1    0    2G  0 part /boot/efi
```

### 🖊︎ 第二步：执行安装脚本

- <u>**PNETLAB v6（尝鲜版本）**</u>

```shell
curl -fsSL https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/Focal/install_pnetlab_v6.sh | bash
```

- <u>**PNETLAB v5（稳定版本）**</u>

```shell
curl -fsSL https://labhub.eu.org/api/raw/?path=/UNETLAB%20I/upgrades_pnetlab/bionic/install_pnetlab_latest_v5.sh | bash
```

### 🖊︎ 第三步：重启系统并访问web

访问地址：http://ip （ 选择 Offline 方式即可，默认账号密码 admin/pnet ）

![https://www.xiaobeing.cn/api/raw/?path=/%5Bsrc%5D%20%E7%AB%99%E7%82%B9%E8%B5%84%E6%BA%90/pnetlab.png](https://www.xiaobeing.cn/api/raw/?path=/%5Bsrc%5D%20%E7%AB%99%E7%82%B9%E8%B5%84%E6%BA%90/pnetlab.png)

### 🖊︎ 第四步：下载并上传镜像

#### 📤 推荐使用ishare2方式进行下载（国内可用）

```shell
rm -rf /usr/sbin/ishare2
wget https://raw.iqiq.io/pnetlabrepo/ishare2/main/ishare2 && mv ishare2 /usr/sbin/ishare2 && chmod +x /usr/sbin/ishare2
curl -fsSL https://raw.iqiq.io/Mr-jiangrj/ishare2/main/ishare2_sed.sh | sh
```

📝 关于 ishare2 的使用方法，请参照 [https://github.com/pnetlabrepo/ishare2](https://github.com/pnetlabrepo/ishare2) 官方说明

#### 📤 手动下载上传方式

镜像下载地址：[下载站点1（首选）](https://labhub.eu.org/zh-CN/UNETLAB%20II/)、[下载站点2（备选）](https://pan.eve-ng.cn/)

镜像上传路径：/opt/unetlab/addons/

```shell
root@pnetlab:~# cd /opt/unetlab/addons
root@pnetlab:/opt/unetlab/addons# ll
total 0
drwxr-xr-x 1 1000 1000   42 Apr 12 11:54 ./
drwxrwxrwx 1 1000 1000  246 Apr 12 11:54 ../
drwxr-xr-x 1 1000 1000   16 Apr 12 11:54 docker/
drwxr-xr-x 1 1000 1000  520 Mar 31 10:32 dynamips/
drwxr-xr-x 1 root root   12 Mar 18  2020 iol/
drwxr-xr-x 1 1000 1000 1692 Apr  1 12:28 qemu/
root@pnetlab:/opt/unetlab/addons#
```

### 🖊︎ 第五步：刷新并检查拓扑是否可以识别新上传的镜像

![https://www.xiaobeing.cn/api/raw/?path=/%5Bsrc%5D%20%E7%AB%99%E7%82%B9%E8%B5%84%E6%BA%90/pnetlab-topology.png](https://www.xiaobeing.cn/api/raw/?path=/%5Bsrc%5D%20%E7%AB%99%E7%82%B9%E8%B5%84%E6%BA%90/pnetlab-topology.png)

