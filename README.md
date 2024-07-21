# 常用 Docker 镜像

包括 Redis、 MySQL 等。

进入对应目录后，执行

```bash
# 启动
docker-compose up -d
# 停止
docker-compose down
```

初始化网络

```bash
docker network create dev_network
```

## Windows WSL 配置说明

## 自动配置脚本

直接在 `bin` 目录下运行 `hosts.bat` 或以管理员身份运行 `hosts.ps1` 脚本。

p.s. 目前 Windows 11 可能存在安全性限制，不报错却无法写入 `hosts` 文件。

## 手动配置

首先需要在 Windows 命令行里运行 `ipconfig /all`

得到以下信息：

```bash
以太网适配器 vEthernet (WSL (Hyper-V firewall)):

   连接特定的 DNS 后缀 . . . . . . . :
   描述. . . . . . . . . . . . . . . : Hyper-V Virtual Ethernet Adapter
   物理地址. . . . . . . . . . . . . : 00-15-5D-BE-26-8F
   DHCP 已启用 . . . . . . . . . . . : 否
   自动配置已启用. . . . . . . . . . : 是
   本地链接 IPv6 地址. . . . . . . . : fe80::36a:d78f:5af4:a66c%41(首选)
   IPv4 地址 . . . . . . . . . . . . : 172.30.240.1(首选)
   子网掩码  . . . . . . . . . . . . : 255.255.240.0
   默认网关. . . . . . . . . . . . . :
   DHCPv6 IAID . . . . . . . . . . . : 687871325
   DHCPv6 客户端 DUID  . . . . . . . : 00-01-00-01-2D-D9-AD-C1-00-FD-6B-09-0F-26
   TCPIP 上的 NetBIOS  . . . . . . . : 已启用
```

然后可以使用 [PowerToys](https://github.com/microsoft/PowerToys) 或者手动编辑 `C:\Windows\System32\drivers\etc\hosts` 文件，添加：

```bash
172.30.240.1 redis.local
172.30.240.1 mysql.local
# 如有其他，需要把 hostname 添加进来
```
