基于开源若依微服务(ruoyi-cloud)框架的会议投稿系统



### 环境部署
***
```
JDK >= 1.8 (推荐1.8版本)
Mysql >= 5.7.0 (推荐5.7版本)
Redis >= 3.0
Maven >= 3.0
Node >= 12
nacos >= 2.0.4 (ruoyi-cloud < 3.0 需要下载nacos >= 1.4.x版本)
sentinel >= 1.6.0
```
### 快速开始
***
#### 1、配置虚拟机
##### 虚拟机地址
配置虚拟机地址为192.168.101.65（如果你不希望修改虚拟机地址，可以全局搜索192.168.101.65，将文档中的地址修改为自己虚拟机的ip或localhost）。
##### 下载安装并使用docker
执行下面的代码下载安装并打开docker
```
#默认安装
yum install docker-ce docker-ce-cli containerd.io
```

```
#指定版本
yum install docker-ce-20.10.9-3.el7 \ 
docker-ce-cli-20.10.9-3.el7 \  
containerd.io
```

```
#启动和查看 
systemctl start docker
systemctl status docker
docker --version
docker info
```

##### 下载所需环境的镜像
```
docker pull mysql:5.7
docker pull nacos/nacos-server:v2.0.3
docker pull redis
```
##### 创建容器
```
#MYSQL_ROOT_PASSWORD为自己设置的密码
docker run --name mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7
docker run --rm -d --name redis -p 6379:6379 redis --requirepass ""
```
###### 配置并启动nacos
```
#新建.properties文件进行配置
vi /home/nacos/conf/application.properties
```
在文件中输入以下内容
```
server.contextPath=/nacos
server.servlet.contextPath=/nacos
server.port=8848

spring.datasource.platform=mysql

db.num=1
#修改为自己的虚拟机ip或localhost
db.url.0=jdbc:mysql://192.168.101.65:3306/ry-config?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=UTC
#修改为自己的mysql用户名和密码
db.user=root
db.password=123456


nacos.cmdb.dumpTaskInterval=3600
nacos.cmdb.eventTaskInterval=10
nacos.cmdb.labelTaskInterval=300
nacos.cmdb.loadDataAtStart=false

management.metrics.export.elastic.enabled=false
management.metrics.export.influx.enabled=false


server.tomcat.accesslog.enabled=true
server.tomcat.accesslog.pattern=%h %l %u %t "%r" %s %b %D %{User-Agent}i


nacos.security.ignore.urls=/,/**/*.css,/**/*.js,/**/*.html,/**/*.map,/**/*.svg,/**/*.png,/**/*.ico,/console-fe/public/**,/v1/auth/login,/v1/console/health/**,/v1/cs/**,/v1/ns/**,/v1/cmdb/**,/actuator/**,/v1/console/server/**
nacos.naming.distro.taskDispatchThreadCount=1
nacos.naming.distro.taskDispatchPeriod=200
nacos.naming.distro.batchSyncKeyCount=1000
nacos.naming.distro.initDataRatio=0.9
nacos.naming.distro.syncRetryDelay=5000
nacos.naming.data.warmup=true
nacos.naming.expireInstance=true
```

```
#新建nacos启动项
vi /home/nacos/startup.sh
```

```
docker run --name nacos -d \
-p 8848:8848 \
-p 9848:9848 \
-p 9849:9849 \
--privileged=true \
--restart=always \
-e JVM_XMS=256m \
-e JVM_XMX=256m \
-e MODE=standalone \
-e TIME_ZONE='Asia/Shanghai' \
-v /home/nacos/logs:/home/nacos/logs \
-v /home/nacos/conf/application.properties:/home/nacos/conf/application.properties \
nacos/nacos-server:v2.0.3
```
启动nacos镜像
```
sh /home/nacos/startup.sh
```
#### 2、将sql文件导入数据库

#### 3、访问nacos修改配置
```
192.168.101.65:8848
```

#### 4、运行后端

#### 5、运行前端
```
npm install
npm run dev
```