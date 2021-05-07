CREATE DATABASE  IF NOT EXISTS `my_blog_db` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `my_blog_db`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: my_blog_db
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `generator_test`
--

DROP TABLE IF EXISTS `generator_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generator_test` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `test` varchar(100) NOT NULL COMMENT '測試字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generator_test`
--

LOCK TABLES `generator_test` WRITE;
/*!40000 ALTER TABLE `generator_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `generator_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jdbc_test`
--

DROP TABLE IF EXISTS `jdbc_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jdbc_test` (
  `type` varchar(100) DEFAULT NULL COMMENT '類型',
  `name` varchar(100) DEFAULT NULL COMMENT '名稱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jdbc_test`
--

LOCK TABLES `jdbc_test` WRITE;
/*!40000 ALTER TABLE `jdbc_test` DISABLE KEYS */;
INSERT INTO `jdbc_test` VALUES ('com.zaxxer.hikari.HikariDataSource','hikari數據源'),('org.apache.commons.dbcp2.BasicDataSource','dbcp2數據源'),('test','測試類'),('類別2','測試類2');
/*!40000 ALTER TABLE `jdbc_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_admin_user`
--

DROP TABLE IF EXISTS `tb_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_admin_user` (
  `admin_user_id` int NOT NULL AUTO_INCREMENT COMMENT '管理員id',
  `login_user_name` varchar(50) NOT NULL COMMENT '管理員登入名稱',
  `login_password` varchar(50) NOT NULL COMMENT '管理員登入密碼',
  `nick_name` varchar(50) NOT NULL COMMENT '管理員顯示昵稱',
  `locked` tinyint DEFAULT '0' COMMENT '是否鎖定 0未鎖定 1已鎖定無法登入',
  PRIMARY KEY (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin_user`
--

LOCK TABLES `tb_admin_user` WRITE;
/*!40000 ALTER TABLE `tb_admin_user` DISABLE KEYS */;
INSERT INTO `tb_admin_user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','admin',0);
/*!40000 ALTER TABLE `tb_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog`
--

DROP TABLE IF EXISTS `tb_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog` (
  `blog_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'blog表主鍵id',
  `blog_title` varchar(200) NOT NULL COMMENT 'blog標題',
  `blog_sub_url` varchar(200) NOT NULL COMMENT 'blog自定義路徑url',
  `blog_cover_image` varchar(200) NOT NULL COMMENT 'blog封面圖',
  `blog_content` mediumtext NOT NULL COMMENT 'blog內容',
  `blog_category_id` int NOT NULL COMMENT 'blog分類id',
  `blog_category_name` varchar(50) NOT NULL COMMENT 'blog分類(冗余字段)',
  `blog_tags` varchar(200) NOT NULL COMMENT 'blog標籤',
  `blog_status` tinyint NOT NULL DEFAULT '0' COMMENT '0-草稿 1-發布',
  `blog_views` bigint NOT NULL DEFAULT '0' COMMENT '閱讀量',
  `enable_comment` tinyint NOT NULL DEFAULT '0' COMMENT '0-允許評論 1-不允許評論',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否刪除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改時間',
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog`
--

LOCK TABLES `tb_blog` WRITE;
/*!40000 ALTER TABLE `tb_blog` DISABLE KEYS */;
INSERT INTO `tb_blog` VALUES (2,'文章總目錄','','/admin/dist/img/rand/13.jpg','<h2 id=\"springboot2\">23 個實驗帶你輕鬆玩轉 Spring Boot</h2>\n\n- [**開篇詞：《23 個實驗帶你輕鬆玩轉 Spring Boot》導讀**](https://www.shiyanlou.com/courses/1274)\n- [第02課：Spring Boot 項目開發環境搭建](https://www.shiyanlou.com/courses/1274)\n- [第03課：快速構建 Spring Boot 應用](https://www.shiyanlou.com/courses/1274)\n- [第04課：Spring Boot 基礎功能開發](https://www.shiyanlou.com/courses/1274)\n- [第05課：Spring Boot 項目開發之 web 項目開發講解](https://www.shiyanlou.com/courses/1274)\n- [第06課：Spring Boot 整合 JSP 開發 web 項目](https://www.shiyanlou.com/courses/1274)\n- [第07課：模板引擎介紹及 Spring Boot 整合 Thymeleaf](https://www.shiyanlou.com/courses/1274)\n- [第08課：Thymeleaf 語法詳解](https://www.shiyanlou.com/courses/1274)\n- [第09課：FreeMarker 模板引擎整合使用教程](https://www.shiyanlou.com/courses/1274)\n- [第10課：Spring Boot 處理文件上傳及路徑回顯](https://www.shiyanlou.com/courses/1274)\n- [第11課：Spring Boot 自動配置數據源及操作數據庫](https://www.shiyanlou.com/courses/1274)\n- [第12課：Spring Boot 整合 Druid 數據源](https://www.shiyanlou.com/courses/1274)\n- [第13課：Spring Boot 整合 MyBatis 操作數據庫](https://www.shiyanlou.com/courses/1274)\n- [第14課：Spring Boot 中的事務處理](https://www.shiyanlou.com/courses/1274)\n- [第15課：Spring Boot 整合 Redis 操作緩存模塊](https://www.shiyanlou.com/courses/1274)\n- [第16課：Spring Boot 項目開發之實現定時任務](https://www.shiyanlou.com/courses/1274)\n- [第17課：Spring Boot 自定義錯誤頁面](https://www.shiyanlou.com/courses/1274)\n- [第18課：Spring Boot 集成 Swagger 生成接口文檔](https://www.shiyanlou.com/courses/1274)\n- [第19課：Spring Boot 項目打包部署介紹](https://www.shiyanlou.com/courses/1274)\n- [第20課：Spring Boot Admin 介紹及整合使用](https://www.shiyanlou.com/courses/1274)\n- [第21課：Spring Boot 資訊管理信息系統開發實戰(一)](https://www.shiyanlou.com/courses/1274)\n- [第22課：Spring Boot 資訊管理信息系統開發實戰(二)](https://www.shiyanlou.com/courses/1274)\n- [第23課：Spring Boot 資訊管理信息系統開發實戰(三)](https://www.shiyanlou.com/courses/1274)\n- [第24課：Spring Boot 資訊管理信息系統開發實戰(四)](https://www.shiyanlou.com/courses/1274)\n\n<h2 id=\"springboot1\">Spring Boot 入門及前後端分離項目實踐</h2>\n\n* [開篇詞：SpringBoot入門及前後端分離項目實踐導讀](https://www.shiyanlou.com/courses/1244)\n* [第02課：快速認識 Spring Boot 技術棧](https://www.shiyanlou.com/courses/1244)\n* [第03課：開發環境搭建](https://www.shiyanlou.com/courses/1244)\n* [第04課：快速構建 Spring Boot 應用](https://www.shiyanlou.com/courses/1244)\n* [第05課：Spring Boot 之基礎 web 功能開發](https://www.shiyanlou.com/courses/1244)\n* [第06課：Spring Boot 之數據庫連接操作](https://www.shiyanlou.com/courses/1244)\n* [第07課：Spring Boot 整合 MyBatis 操作數據庫](https://www.shiyanlou.com/courses/1244)\n* [第08課：Spring Boot 處理文件上傳及路徑回顯](https://www.shiyanlou.com/courses/1244)\n* [第09課：Spring Boot 項目實踐之前後端分離詳解](https://www.shiyanlou.com/courses/1244)\n* [第10課：Spring Boot 項目實踐之 API 設計](https://www.shiyanlou.com/courses/1244)\n* [第11課：Spring Boot 項目實踐之登錄模塊實現](https://www.shiyanlou.com/courses/1244)\n* [第12課：Spring Boot 項目實踐之分頁功能實現](https://www.shiyanlou.com/courses/1244)\n* [第13課：Spring Boot 項目實踐之jqgrid分頁整合](https://www.shiyanlou.com/courses/1244)\n* [第14課：Spring Boot 項目實踐之編輯功能實現](https://www.shiyanlou.com/courses/1244)\n* [第15課：Spring Boot 項目實踐之用戶管理模塊實現](https://www.shiyanlou.com/courses/1244)\n* [第16課：Spring Boot 項目實踐之圖片管理模塊](https://www.shiyanlou.com/courses/1244)\n* [第17課：Spring Boot 項目實踐之富文本編輯器介紹及整合](https://www.shiyanlou.com/courses/1244)\n* [第18課：Spring Boot 項目實踐之信息管理模塊實現](https://www.shiyanlou.com/courses/1244)\n\n<h2 id=\"ssm4\">從零開始搭建一個精美且實用的管理後台</h2>\n\n- [SSM 搭建精美實用的管理系統](http://gitbook.cn/m/mazi/comp/column?columnId=5b4dae389bcda53d07056bc9&sceneId=22778a708b0f11e8974b497483da0812)\n- [導讀：自己動手實現 JavaWeb 後台管理系統](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4db47e9bcda53d07056f5f)\n- [第01課：Spring MVC+ Spring + Mybatis “三大框架”介紹](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4db5b89bcda53d070590de)\n- [第02課：前期準備工作及基礎環境搭建](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4eb8e701d18a561f341b72)\n- [第03課：三大框架的整合](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4ee11c01d18a561f342c0f)\n- [第04課：Tomcat 8 安裝部署及功能改造](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1335dbb1436093a6ca17)\n- [第05課：產品設計之搭建精美實用的後台管理系統](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b35dbb1436093a6cc7a)\n- [第06課：前端選型 AdminLTE3](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b70dbb1436093a6cc87)\n- [第07課：登錄模塊的系統設計和實現](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b80dbb1436093a6cc8e)\n- [第08課：使用 JqGrid 插件實現分頁功能](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1b92dbb1436093a6cc93)\n- [第09課：彈框組件整合——完善添加和修改功能](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1bbddbb1436093a6cc9b)\n- [第10課：圖片管理模塊](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1bd0dbb1436093a6cca1)\n- [第11課：多圖上傳與大文件分片上傳、斷點續傳](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1bdedbb1436093a6cca2)\n- [第12課：文件導入導出功能](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1beddbb1436093a6cca8)\n- [第13課：富文本信息管理模塊](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c00dbb1436093a6ccae)\n- [第14課：SweetAlert 插件整合及搜索功能實現](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c11dbb1436093a6ccb1)\n- [第15課：項目發布——Linux 命令及發布流程](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c21dbb1436093a6ccb6)\n- [第16課：項目優化篇之日誌輸出](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c30dbb1436093a6ccbb)\n- [第17課：項目優化之單元測試](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c3fdbb1436093a6ccc1)\n- [第18課：項目優化之數據庫連接池](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c50dbb1436093a6ccca)\n- [第19課：項目優化之 Druid 整合](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c65dbb1436093a6cccd)\n- [第20課：項目優化之緩存整合](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c7cdbb1436093a6ccd6)\n- [第21課：網站架構演進及 Nginx 介紹](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c8bdbb1436093a6ccda)\n- [第22課：Nginx + Tomcat 集群搭建](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1c9ddbb1436093a6cce2)\n- [第23課：Nginx 動靜分離](https://gitbook.cn/gitchat/column/5b4dae389bcda53d07056bc9/topic/5b4f1cb7dbb1436093a6cceb)\n\n<h2 id=\"ssm3\">SSM整合進階篇</h2>\n\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（一）設計一套好的RESTful API](http://www.cnblogs.com/han-1034683568/p/7196345.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（二）RESTful API實戰筆記(接口設計及Java後端實現)](http://www.cnblogs.com/han-1034683568/p/7300547.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（三）使用ajax方法實現form表單的提交](http://www.cnblogs.com/han-1034683568/p/7199168.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（四）RESTful實戰(前端代碼修改)](http://www.cnblogs.com/han-1034683568/p/7552007.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（五）記錄一下從懵懂到理解RESTful的過程](http://www.cnblogs.com/han-1034683568/p/7569870.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（六）一定要RESTful嗎？](http://www.cnblogs.com/han-1034683568/p/7663641.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（七）一次線上Mysql數據庫崩潰事故的記錄](http://www.cnblogs.com/han-1034683568/p/7787659.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（八）線上Mysql數據庫崩潰事故的原因和處理](http://www.cnblogs.com/han-1034683568/p/7822237.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（九）Linux下安裝redis及redis的常用命令和操作](http://www.cnblogs.com/han-1034683568/p/7862188.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（十）easyUI整合KindEditor詳細教程](http://www.cnblogs.com/han-1034683568/p/7930542.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（十一）redis密碼設置、安全設置](http://www.cnblogs.com/han-1034683568/p/7978577.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（十二）Spring集成Redis緩存](http://www.cnblogs.com/han-1034683568/p/7994231.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（十三）MyBatis+MySQL返回插入的主鍵id](http://www.cnblogs.com/han-1034683568/p/8305122.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（十四）Redis正確的使用姿勢](http://www.cnblogs.com/han-1034683568/p/8406497.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合進階篇（十五）階段總結](http://www.cnblogs.com/han-1034683568/p/9069008.html)\n\n<h2 id=\"idea\">Intellij IDEA相關筆記</h2>\n\n- [如何查看IntelliJ IDEA的版本信息](http://www.cnblogs.com/han-1034683568/p/9135192.html)\n- [Plugin \'Lombok Plugin\' is incompatible with this installation](http://www.cnblogs.com/han-1034683568/p/9135074.html)\n- [IDEA安裝Lombok插件失敗的解決方案](http://www.cnblogs.com/han-1034683568/p/9134980.html)\n- [Intellij IDEA debug模式下項目啟動慢/無法啟動的事件解決過程記錄](http://www.cnblogs.com/han-1034683568/p/8603588.html)\n- [Intellij IDEA查看所有斷點](http://www.cnblogs.com/han-1034683568/p/8603110.html)\n- [IntelliJ IDEA 報錯：Error:java: 未結束的字符串文字](http://www.cnblogs.com/han-1034683568/p/6439723.html)\n- [IntelliJ IDEA 常用快捷鍵mac版](http://www.cnblogs.com/han-1034683568/p/6492342.html)\n\n<h2 id=\"diary\">日常手記</h2>\n\n- [開啟mac上印象筆記的代碼塊](http://www.cnblogs.com/han-1034683568/p/9021263.html)\n- [程序員，你怎麼這麼忙？](http://www.cnblogs.com/han-1034683568/p/8968959.html)\n- [新購阿里雲服務器ECS創建之後無法ssh連接的問題處理](http://www.cnblogs.com/han-1034683568/p/8856560.html)\n- [CentOS 7.2:Failed to start IPv4 firewall with iptables](http://www.cnblogs.com/han-1034683568/p/8854613.html)\n- [JDK8 stream toMap() java.lang.IllegalStateException: Duplicate key異常解決(key重複)](http://www.cnblogs.com/han-1034683568/p/8624447.html)\n- [我在blog園的這一年小記](http://www.cnblogs.com/han-1034683568/p/8443428.html)\n- [記錄一下我的2017年閱讀書單](http://www.cnblogs.com/han-1034683568/p/8432261.html)\n- [2017總結](http://www.cnblogs.com/han-1034683568/p/8337394.html)\n- [微信公眾號問題：{\"errcode\":40125,\"errmsg\":\"invalid appsecret, view more at http:\\/\\/t.cn\\/LOEdzVq, hints: [ req_id: kL8J90219sg58 ]\"}](http://www.cnblogs.com/han-1034683568/p/8286777.html)\n- [git刪除本地分支](http://www.cnblogs.com/han-1034683568/p/8241369.html)\n- [阿里巴巴Java開發規約插件p3c詳細教程及使用感受](http://www.cnblogs.com/han-1034683568/p/7682594.html)\n- [阿里官方Java代碼規範標準《阿里巴巴Java開發手冊 終極版 v1.3.0》下載](http://www.cnblogs.com/han-1034683568/p/7680354.html)\n- [程序員視角：鹿■公布戀情是如何把微博搞炸的？](http://www.cnblogs.com/han-1034683568/p/7642213.html)\n- [could not resolve host: github.com 問題解決辦法](http://www.cnblogs.com/han-1034683568/p/6457894.html)\n- [使用git恢復未提交的誤刪數據](http://www.cnblogs.com/han-1034683568/p/6444937.html)\n- [springboot開啟access_log日誌輸出](http://www.cnblogs.com/han-1034683568/p/6963144.html)\n- [Error: Cannot find module \'gulp-clone\'問題的解決](http://www.cnblogs.com/han-1034683568/p/6479288.html)\n- [Markdown語法講解及MWeb使用教程](http://www.cnblogs.com/han-1034683568/p/6556348.html)\n- [javax.net.ssl.SSLHandshakeException: No appropriate protocol (protocol is disabled or cipher suites are inappropriate)](http://www.cnblogs.com/han-1034683568/p/7009096.html)\n- [org.springframework.data.redis.serializer.SerializationException: Cannot serialize;](http://www.cnblogs.com/han-1034683568/p/7994322.html)\n\n<h2 id=\"13blog\">My Blog</h2>\n\n- [Docker+SpringBoot+Mybatis+thymeleaf的Javablog系統開源啦](http://www.cnblogs.com/han-1034683568/p/6840493.html)\n- [My-Blog搭建過程：如何讓一個網站從零到可以上線訪問](http://www.cnblogs.com/han-1034683568/p/6885545.html)\n- [將數據的初始化放到docker中的整個工作過程(問題記錄)](http://www.cnblogs.com/han-1034683568/p/6941313.html)\n- [利用Dockerfile構建mysql鏡像並實現數據的初始化及權限設置](http://www.cnblogs.com/han-1034683568/p/6941337.html)\n- [解決Docker容器時區及時間不同步的問題](http://www.cnblogs.com/han-1034683568/p/6957132.html)\n- [Java開源blogMy-Blog之docker容器組件化修改](http://www.cnblogs.com/han-1034683568/p/7102765.html)\n- [運行shell腳本時報錯\"\\[\\[ : not found\"解決方法](http://www.cnblogs.com/han-1034683568/p/7211392.html)\n- [shell腳本中字符串的常見操作及\"command not found\"報錯處理(附源碼)](http://www.cnblogs.com/han-1034683568/p/7217047.html)\n- [Java開源blogMy-Blog之mysql容器重複初始化的嚴重bug修復過程](http://www.cnblogs.com/han-1034683568/p/7231895.html)\n- [Mybatis-Generator生成Mapper文件中if test=\"criteria.valid\"的問題解答](http://www.cnblogs.com/han-1034683568/p/7281474.html)\n- [Springboot與Thymeleaf模板引擎整合基礎教程](http://www.cnblogs.com/han-1034683568/p/7520012.html)\n- [thymeleaf模板引擎調用java類中的方法](http://www.cnblogs.com/han-1034683568/p/7527564.html)\n\n<h2 id=\"message-attack\">短信接口攻擊事件</h2>\n\n- [短信發送接口被惡意訪問的網絡攻擊事件(一)緊張的遭遇戰險勝](http://www.cnblogs.com/han-1034683568/p/6973269.html)\n- [短信發送接口被惡意訪問的網絡攻擊事件(二)肉搏戰-阻止惡意請求](http://www.cnblogs.com/han-1034683568/p/7001785.html)\n- [短信發送接口被惡意訪問的網絡攻擊事件(三)定位惡意IP的日誌分析腳本](http://www.cnblogs.com/han-1034683568/p/7040417.html)\n- [短信發送接口被惡意訪問的網絡攻擊事件(四)完結篇--搭建WAF清理戰場](http://www.cnblogs.com/han-1034683568/p/7090409.html)\n\n<h2 id=\"read\">讀書筆記</h2>\n\n- [《實戰java高併發程序設計》源碼整理及讀書筆記](http://www.cnblogs.com/han-1034683568/p/6918160.html)\n- [《大型網站技術架構:核心原理與案例分析》讀書筆記](http://www.cnblogs.com/han-1034683568/p/7597564.html)\n- [大型網站技術架構(二)--大型網站架構演化](http://www.cnblogs.com/han-1034683568/p/8423447.html)\n- [大型網站技術架構(三)--架構模式](http://www.cnblogs.com/han-1034683568/p/8677349.html)\n- [大型網站技術架構(四)--核心架構要素](http://www.cnblogs.com/han-1034683568/p/9049758.html)\n\n<h2 id=\"ssm2\">SSM整合優化篇</h2>\n\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（一）System.out.print與Log](http://www.cnblogs.com/han-1034683568/p/6637914.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（二）Log4j講解與整合](http://www.cnblogs.com/han-1034683568/p/6641808.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（三）代碼測試](http://www.cnblogs.com/han-1034683568/p/6642306.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（四）單元測試實例](http://www.cnblogs.com/han-1034683568/p/6649077.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（五）結合MockMvc進行服務端的單元測試](http://www.cnblogs.com/han-1034683568/p/6653620.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（六）easyUI與富文本編輯器UEditor整合](http://www.cnblogs.com/han-1034683568/p/6664660.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（七）圖片上傳功能](http://www.cnblogs.com/han-1034683568/p/6692150.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（八）代碼優化整理小記及個人吐槽](http://www.cnblogs.com/han-1034683568/p/6706158.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（九）數據層優化-jdbc連接池簡述、druid簡介](http://www.cnblogs.com/han-1034683568/p/6719298.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（十）數據層優化-整合druid](http://www.cnblogs.com/han-1034683568/p/6725191.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（十一）數據層優化-druid監控及慢sql記錄](http://www.cnblogs.com/han-1034683568/p/6730869.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（十二）數據層優化-explain關鍵字及慢sql優化](http://www.cnblogs.com/han-1034683568/p/6758578.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（十三）數據層優化-表規範、索引優化](http://www.cnblogs.com/han-1034683568/p/6768807.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合優化篇（十四）談談寫blog的原因和項目優化](http://www.cnblogs.com/han-1034683568/p/6782019.html)\n\n<h2 id=\"ssm1\">SSM整合基礎篇</h2>\n\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（一）項目簡述及技術選型介紹](http://www.cnblogs.com/han-1034683568/p/6440090.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（二）牛刀小試](http://www.cnblogs.com/han-1034683568/p/6440157.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（三）搭建步驟](http://www.cnblogs.com/han-1034683568/p/6476827.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（四）代碼簡化](http://www.cnblogs.com/han-1034683568/p/6476852.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（五）講一下maven](http://www.cnblogs.com/han-1034683568/p/6486117.html)\n- [Maven構建項目速度太慢的解決辦法](http://www.cnblogs.com/han-1034683568/p/6498637.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（六）maven整合SSM](http://www.cnblogs.com/han-1034683568/p/6507186.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（七）JDBC url的連接參數](http://www.cnblogs.com/han-1034683568/p/6512215.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（八）mysql中文查詢bug修復](http://www.cnblogs.com/han-1034683568/p/6517344.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（九）版本控制](http://www.cnblogs.com/han-1034683568/p/6540079.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（十）SVN搭建](http://www.cnblogs.com/han-1034683568/p/6545751.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（十一）SVN服務器進階](http://www.cnblogs.com/han-1034683568/p/6551498.html)\n- [Spring+SpringMVC+MyBatis+easyUI整合基礎篇（十二）階段總結](http://www.cnblogs.com/han-1034683568/p/6562092.html)',24,'4444','目錄',1,16,0,0,'2019-04-24 15:42:23','2019-04-24 15:42:23');
/*!40000 ALTER TABLE `tb_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog_category`
--

DROP TABLE IF EXISTS `tb_blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog_category` (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '分類表主鍵',
  `category_name` varchar(50) NOT NULL COMMENT '分類的名稱',
  `category_icon` varchar(50) NOT NULL COMMENT '分類的圖標',
  `category_rank` int NOT NULL DEFAULT '1' COMMENT '分類的排序值 被使用的越多數值越大',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否刪除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog_category`
--

LOCK TABLES `tb_blog_category` WRITE;
/*!40000 ALTER TABLE `tb_blog_category` DISABLE KEYS */;
INSERT INTO `tb_blog_category` VALUES (20,'About','/admin/dist/img/category/10.png',8,0,'2018-11-12 00:28:49'),(22,'123','/admin/dist/img/category/00.png',19,0,'2018-11-12 10:42:25'),(24,'4444','/admin/dist/img/category/02.png',22,0,'2018-11-12 10:43:21');
/*!40000 ALTER TABLE `tb_blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog_comment`
--

DROP TABLE IF EXISTS `tb_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog_comment` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主鍵id',
  `blog_id` bigint NOT NULL DEFAULT '0' COMMENT '關聯的blog主鍵',
  `commentator` varchar(50) NOT NULL DEFAULT '' COMMENT '評論者名稱',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '評論人的郵箱',
  `website_url` varchar(50) NOT NULL DEFAULT '' COMMENT '網址',
  `comment_body` varchar(200) NOT NULL DEFAULT '' COMMENT '評論內容',
  `comment_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '評論提交時間',
  `commentator_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '評論時的ip地址',
  `reply_body` varchar(200) NOT NULL DEFAULT '' COMMENT '回覆內容',
  `reply_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回覆時間',
  `comment_status` tinyint NOT NULL DEFAULT '0' COMMENT '是否審核通過 0-未審核 1-審核通過',
  `is_deleted` tinyint DEFAULT '0' COMMENT '是否刪除 0-未刪除 1-已刪除',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog_comment`
--

LOCK TABLES `tb_blog_comment` WRITE;
/*!40000 ALTER TABLE `tb_blog_comment` DISABLE KEYS */;
INSERT INTO `tb_blog_comment` VALUES (26,4,'fasdq','vsae8538@gmail.com','','第一條評論','2019-05-13 10:12:19','','','2019-05-12 21:13:31',1,1);
/*!40000 ALTER TABLE `tb_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog_tag`
--

DROP TABLE IF EXISTS `tb_blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog_tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT COMMENT '標籤表主鍵id',
  `tag_name` varchar(100) NOT NULL COMMENT '標籤名稱',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否刪除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog_tag`
--

LOCK TABLES `tb_blog_tag` WRITE;
/*!40000 ALTER TABLE `tb_blog_tag` DISABLE KEYS */;
INSERT INTO `tb_blog_tag` VALUES (57,'世界上有一個很可愛的人',0,'2018-11-12 00:31:15'),(58,'現在這個人就在看這句話',0,'2018-11-12 00:31:15'),(66,'Spring',0,'2018-11-12 10:55:14'),(67,'SpringMVC',0,'2018-11-12 10:55:14'),(68,'MyBatis',0,'2018-11-12 10:55:14'),(69,'easyUI',0,'2018-11-12 10:55:14'),(127,'目錄',0,'2019-04-24 15:41:39'),(128,'AdminLte3',0,'2019-04-24 15:46:16'),(130,'SpringBoot',0,'2019-05-13 09:58:54'),(131,'入門教程',0,'2019-05-13 09:58:54'),(132,'實戰教程',0,'2019-05-13 09:58:54'),(133,'spring-boot企業級開發',0,'2019-05-13 09:58:54');
/*!40000 ALTER TABLE `tb_blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog_tag_relation`
--

DROP TABLE IF EXISTS `tb_blog_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog_tag_relation` (
  `relation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '關係表id',
  `blog_id` bigint NOT NULL COMMENT 'blogid',
  `tag_id` int NOT NULL COMMENT '標籤id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog_tag_relation`
--

LOCK TABLES `tb_blog_tag_relation` WRITE;
/*!40000 ALTER TABLE `tb_blog_tag_relation` DISABLE KEYS */;
INSERT INTO `tb_blog_tag_relation` VALUES (266,1,57,'2019-05-13 09:45:42'),(267,1,58,'2019-05-13 09:45:42'),(269,2,127,'2019-05-13 09:56:49'),(270,4,130,'2019-05-13 09:58:54'),(271,4,131,'2019-05-13 09:58:54'),(272,4,132,'2019-05-13 09:58:54'),(273,4,133,'2019-05-13 09:58:54'),(274,3,66,'2019-05-13 10:07:27'),(275,3,67,'2019-05-13 10:07:27'),(276,3,68,'2019-05-13 10:07:27'),(277,3,69,'2019-05-13 10:07:27'),(278,3,128,'2019-05-13 10:07:27');
/*!40000 ALTER TABLE `tb_blog_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_config`
--

DROP TABLE IF EXISTS `tb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_config` (
  `config_name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置項的名稱',
  `config_value` varchar(200) NOT NULL DEFAULT '' COMMENT '配置項的值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '創建時間',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改時間',
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_config`
--

LOCK TABLES `tb_config` WRITE;
/*!40000 ALTER TABLE `tb_config` DISABLE KEYS */;
INSERT INTO `tb_config` VALUES ('footerAbout','have fun.','2018-11-11 20:33:23','2020-09-16 13:33:29'),('footerCopyRight','2020 vsae','2018-11-11 20:33:31','2020-09-16 13:33:29'),('footerICP','12345678','2018-11-11 20:33:27','2020-09-16 13:33:29'),('footerPoweredBy','https://github.com/vsae8538','2018-11-11 20:33:36','2020-09-16 13:33:29'),('footerPoweredByURL','https://github.com/vsae8538','2018-11-11 20:33:39','2020-09-16 13:33:29'),('websiteDescription','12345testt','2018-11-11 20:33:04','2020-09-16 13:33:34'),('websiteIcon','/admin/dist/img/favicon.png','2018-11-11 20:33:11','2020-09-16 13:33:34'),('websiteLogo','/admin/dist/img/logo2.png','2018-11-11 20:33:08','2020-09-16 13:33:34'),('websiteName','my blog','2018-11-11 20:33:01','2020-09-16 13:33:34'),('yourAvatar','/admin/dist/img/13.png','2018-11-11 20:33:14','2020-09-16 13:33:32'),('yourEmail','vsae8538@gmail.com','2018-11-11 20:33:17','2020-09-16 13:33:32'),('yourName','vsae','2018-11-11 20:33:20','2020-09-16 13:33:32');
/*!40000 ALTER TABLE `tb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_link`
--

DROP TABLE IF EXISTS `tb_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_link` (
  `link_id` int NOT NULL AUTO_INCREMENT COMMENT '友鏈表主鍵id',
  `link_type` tinyint NOT NULL DEFAULT '0' COMMENT '友鏈類別 0-友鏈 1-推薦 2-個人網站',
  `link_name` varchar(50) NOT NULL COMMENT '網站名稱',
  `link_url` varchar(100) NOT NULL COMMENT '網站鏈接',
  `link_description` varchar(100) NOT NULL COMMENT '網站描述',
  `link_rank` int NOT NULL DEFAULT '0' COMMENT '用於列表排序',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否刪除 0-未刪除 1-已刪除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加時間',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_link`
--

LOCK TABLES `tb_link` WRITE;
/*!40000 ALTER TABLE `tb_link` DISABLE KEYS */;
INSERT INTO `tb_link` VALUES (20,0,'github','http://www.github.com','github',1,0,'2020-09-16 21:36:44');
/*!40000 ALTER TABLE `tb_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_test`
--

DROP TABLE IF EXISTS `tb_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_test` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主鍵',
  `test_info` varchar(50) NOT NULL COMMENT '測試內容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_test`
--

LOCK TABLES `tb_test` WRITE;
/*!40000 ALTER TABLE `tb_test` DISABLE KEYS */;
INSERT INTO `tb_test` VALUES (1,'SpringBoot-MyBatis測試');
/*!40000 ALTER TABLE `tb_test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-16 21:52:18
