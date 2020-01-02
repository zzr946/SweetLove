# SweetLove
*基于SSM实现的网上糕点预定点餐（也可以理解成为电商项目，自己都傻傻分不清）*

**开发环境**： Eclipse+Tomcat8.0+My SQL5.5

**主要技术**： Spring ，SpringMVC，MyBatis，BootStrap，Ajax ，JQuery，Layui等



**项目描述**：随着互联网的发展，足不出户的点餐模式已经成为主流，所以开发本系统非常有必要。该项目基于B/S架构，采用了SSM框架开发。该项目类似于哈根达斯的专营模式，主要模块有用户模块，商家模块。

*用户端口*：登录注册（调用短信接口验证），个人信息管理，浏览菜品，搜索菜品，查看菜品详情，购买菜品等。

*商家端口*：菜品类别管理（添加类别，修改类别，删除类别等），菜品管理（添加菜品，删除菜品，修改菜品信息等），订单管理（采用Ajax技术实时接单，安排配送等）。

**商家端口由于时间原因没有做，不想做了，逻辑都是差不多的。**

**说明**

~~~text
1、SweetLove图片文件夹必须放在D盘根目录下，并删除文件夹名字后的括号
2、sweetlove.sql为数据库（MySQL）脚本文件
3、虚拟路径及常量中，定义了tomcat访问的虚拟路径及短信验证码验证功能的相关信息
  （短信验证码使用我自己的阿里云账号注册的，涉及隐私问题，感兴趣可以参考我的博客
  https://blog.csdn.net/Mr_zzr/article/details/100168118 手把手教学调用短信接口，
  然后将项目中常量声明的信息换成自己的即可完美运行。）
~~~
