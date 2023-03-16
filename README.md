# 军事化
用于保证线下渗透演练或者工控比赛中的行动一致性
附带的 命令[https://github.com/jindaxia/militarization/blob/main/commands.md]

## 军事化

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
