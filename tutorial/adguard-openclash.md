# 如何共存ADGuard Home+OpenClash?

### 对于ADGuard Home的设置
1. 在管理设置中把53重定向设置为使用53端口替换dnsmasq
2. 设置好ADGuard Home，在控制台上设置-DNS设置，上游 DNS 服务器填入`127.0.0.1:7874`(openclash默认使用的DNS端口)即可。
3. 如果全部设置好发现连不了网可尝试设置Bootstrap DNS服务器为自已运营商的DNS服务器。
![image](https://user-images.githubusercontent.com/67815438/234561559-20dad298-a8ef-41ca-837e-fbed74192f31.png)

### 对于openclash的设置
1. 请确保处于Redir-Host模式中（如果Redir-Host不行请设置Fake-IP再试试，都不行我也没辙了）。
2. 在插件设置-DNS设置中停用本地DNS劫持。
3. 在复写设置-DNS设置中勾选自定义上游 DNS 服务器，取消勾线两个追加** DNS的选项（如果勾选的话）。
4. 勾选完自定义上游 DNS 服务器后，如果自己有私有DNS的话请自行填入（当然不填入保持默认也可以）。

这样设置基本可以共存了。（至少本仓库的固件亲测可以，其它固件自行测试。）
### 效果图
![image](https://user-images.githubusercontent.com/67815438/234561736-10f3bdd8-1670-4a70-be57-a0d9389865bc.png)
![image](https://user-images.githubusercontent.com/67815438/234561805-6307d907-8fc6-4e8e-90fb-e3368328ee46.png)

## 如果iOS设备上不了网
1. 找到你的WiFi，然后设置DNS为路由器的IP地址即可(比如你路由器IP为192.168.2.1那就填这个)。
![22C28F6223B70F87DCAA37FC79251076](https://user-images.githubusercontent.com/67815438/234564845-6476336c-7154-4a36-8f44-0f2c34e856ce.png)
