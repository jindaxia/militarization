# 军事化
用于保证线下渗透演练或者工控比赛中的行动一致性

如何理解军事化？

```
小A：第一个目的靶机我已经拿到webshell，请小Q在第一目标上建立一个socks代理和HTTP隧道，小B接着扫内网做信息收集。
小Q：好的，但是你留的shell路径是啥？连接密码是啥?发我下。
小A：连接方式发给你了。
小Q：socks代理和HTTP隧道建好，
小B：建好了你倒是把代理地址端口密码发出来啊，HTTP隧道怎么连接？
小Q：发出来了。
小B：密码不对啊？
小Q：少了个符号。
```

军事化的思想就为了解决上面的问题，使线下比赛沟通最顺畅

附带的 [命令](https://github.com/jindaxia/militarization/blob/main/commands.md)

## 统一思想

- 统一工具版本
  - msf6： metasploit v6.3.4-dev
  - cobalt Strike：CS4.5 cats
- 统一webshell路径
  - http://xxxxx/pubac.php  (一句话)
  - http://xxxxx/pubacbh.php(asp,jsp)  （冰蝎） 使用 default xor
  - http://xxxxx/pubacbig.php  (大马)
- 统一的密码
  - user：synb123
  - pass：qqNBNo.1
- 统一的端口，反弹和代理
  - msf bind tcp：54444
  - msf reverse_tcp：38777
  - reverse_http： 39800
  - socks4/5：41080， 41088（noauth）
  - CS
    - team Server：53344
    - TCP Beacon: 42585
    - HTTP Beacon: 53272
    - Web delivery 配置 Attacks-->Web Drive-By-->Script Web Delivery:   
      - uri: /bugs
      - Localport:  33211
      - type:  powershell IEX
- 协同作战工具
  - 需求资产信息实时同步
  - 内网聊天工具（内网通）
  - 二层聊天工具（qqchat）
