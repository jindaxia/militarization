2023/01/13

推荐使用ubuntu运行TeamServer.

需Java11运行，运行前请先配置CatServer.properties
sudo apt install openjdk-11-jre-headless
sudo apt install openjdk-11-jdk

更多说明请看Github.

https://github.com/TryGOTry/CobaltStrike_Cat_4.5


运行服务端:
chmod 755 teamserver
./teamserver

获取google二次验证配置:
java -jar cat_server.jar goole

运行cna脚本

(如果没开启二次验证)
java -jar cat_server.jar script [host] [port] [user] [password] [cna脚本]

(如果开启二次验证)
java -jar cat_server.jar script [host] [port] [user] [password] [二次验证的密码] [cna脚本]