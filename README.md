1. Eclipse中dbconfig.properties文件不能打中文或乱码问题！  
   https://blog.csdn.net/l358366885/article/details/85248738
2. 解决org.apache.ibatis.binding.BindingException: Invalid bound statement (not found)问题  
   https://blog.csdn.net/sundacheng1989/article/details/81630370
3. 静态资源获取不到解决办法
   <mvc:default-servlet-handler />  
   <mvc:resources location="/WEB-INF/static/" mapping="/static/**" />
4. 解决中文乱码问题(GET)
   F:\apache-tomcat-9.0.0.M15\apache-tomcat-9.0.0.M15\conf  中的server.xml修改如下:  
   Connecor  ->   URIEncoding="UTF-8"  
   POST请求:Web.xml里面增加配置
5.  Data truncation: Incorrect string value: '\xE6\xB5\x8B\xE8\xAF\x95...' for column 'content' at row 错误  
        修改数据库的字符编码为utf-8 
6. Tomcat部署javaweb项目
   https://www.cnblogs.com/jiangxifanzhouyudu/p/6859879.html?utm_source=itdadao&utm_medium=referral
7. 如何将Tomcat注册成系统服务
   https://www.cnblogs.com/Liang-Haishan216/p/7808580.html