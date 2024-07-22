CREATE DATABASE  IF NOT EXISTS `ry` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ry`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ry
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (4,'t_custom','客户信息',NULL,NULL,'TCustom','crud','com.ruoyi.biz','system','custom','客户信息','ruoyi','0','/','{\"parentMenuId\":2008}','admin','2023-11-03 18:48:04','','2023-11-03 18:57:16',NULL),(5,'t_file_info','上传文件信息',NULL,NULL,'TFileInfo','crud','com.ruoyi.system','system','info','上传文件信息','ruoyi','0','/',NULL,'admin','2023-11-03 18:48:04','',NULL,NULL),(6,'n_customer','客户信息',NULL,NULL,'NCustomer','crud','com.ruoyi.wujie','customer','customer','客户信息','zdx','0','/','{}','admin','2023-11-05 22:20:12','','2023-11-05 22:22:57',NULL),(7,'n_file_info','上传文件信息',NULL,NULL,'NFileInfo','crud','com.ruoyi.wujie','wujie','file','上传文件信息','ruoyi','0','/','{}','admin','2023-11-06 15:23:49','','2023-11-06 15:24:34',NULL),(8,'n_contract','合同信息',NULL,NULL,'NContract','crud','com.ruoyi.wujie','wujie','contract','合同信息','ruoyi','0','/','{}','admin','2023-11-12 21:27:11','','2023-11-12 21:41:10',NULL),(9,'n_finance','财务信息',NULL,NULL,'NFinance','crud','com.ruoyi.wujie','wujie','finance','合同信息','ruoyi','0','/','{}','admin','2023-11-12 21:27:11','','2023-11-12 21:34:26',NULL),(10,'n_knowledge','知识信息',NULL,NULL,'NKnowledge','crud','com.ruoyi.system','system','knowledge','知识信息','ruoyi','0','/',NULL,'admin','2023-11-12 21:27:11','',NULL,NULL),(11,'n_share','分享信息',NULL,NULL,'NShare','crud','com.ruoyi.system','system','share','分享信息','ruoyi','0','/',NULL,'admin','2023-11-12 21:27:11','',NULL,NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (42,4,'id','主键id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-03 18:48:04','','2023-11-03 18:57:16'),(43,4,'name','客户姓名','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2023-11-03 18:48:04','','2023-11-03 18:57:16'),(44,4,'phone','电话','varchar(255)','String','phone','0','0','1','1','1','1','1','EQ','input','',3,'admin','2023-11-03 18:48:04','','2023-11-03 18:57:16'),(45,4,'address','地址','varchar(1024)','String','address','0','0',NULL,'1','1','1','1','EQ','textarea','',4,'admin','2023-11-03 18:48:04','','2023-11-03 18:57:16'),(46,4,'del','删除标记，1已删除','char(1)','String','del','0','0',NULL,'0','0','0','0','EQ','input','',5,'admin','2023-11-03 18:48:04','','2023-11-03 18:57:16'),(47,4,'create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',6,'admin','2023-11-03 18:48:04','','2023-11-03 18:57:16'),(48,4,'create_time','创建时间','timestamp','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2023-11-03 18:48:04','','2023-11-03 18:57:16'),(49,4,'update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','0',NULL,NULL,'EQ','input','',8,'admin','2023-11-03 18:48:04','','2023-11-03 18:57:16'),(50,4,'update_time','修改时间','timestamp','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',9,'admin','2023-11-03 18:48:04','','2023-11-03 18:57:16'),(51,5,'id','主键id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-03 18:48:04','',NULL),(52,5,'custom_id','客户ID','bigint','Long','customId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-11-03 18:48:04','',NULL),(53,5,'file_name','文件名称','varchar(255)','String','fileName','0','0',NULL,'1','1','1','1','LIKE','input','',3,'admin','2023-11-03 18:48:04','',NULL),(54,5,'file_type','文件类型','varchar(255)','String','fileType','0','0',NULL,'1','1','1','1','EQ','select','',4,'admin','2023-11-03 18:48:04','',NULL),(55,5,'file_size','文件大小(byte)','bigint','Long','fileSize','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-03 18:48:04','',NULL),(56,5,'file_path','文件服务器存储绝对路径','varchar(255)','String','filePath','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-11-03 18:48:04','',NULL),(57,5,'del','删除标记，1已删除','char(1)','String','del','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-11-03 18:48:04','',NULL),(58,5,'create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',8,'admin','2023-11-03 18:48:04','',NULL),(59,5,'create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2023-11-03 18:48:04','',NULL),(60,5,'update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',10,'admin','2023-11-03 18:48:04','',NULL),(61,5,'update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',11,'admin','2023-11-03 18:48:04','',NULL),(62,6,'id','主键id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(63,6,'name','客户姓名','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(64,6,'contract_phone','联系电话','varchar(255)','String','contractPhone','0','0','1','1','1','1','1','EQ','input','',3,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(65,6,'contract_address','联系地址','varchar(1024)','String','contractAddress','0','0',NULL,'1','1','1','1','EQ','textarea','',4,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(66,6,'type','客户类别，0联系人，1案源人，2服务成员','char(1)','String','type','0','0',NULL,'1','1','1','1','EQ','radio','',5,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(67,6,'bank_username','银行信息','varchar(255)','String','bankUsername','0','0',NULL,'1','1','1','1','LIKE','input','',6,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(68,6,'bank_name','开户行','varchar(255)','String','bankName','0','0',NULL,'1','1','1','1','LIKE','input','',7,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(69,6,'bank_account','银行账号','varchar(255)','String','bankAccount','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(70,6,'tax_name','名称/单位名称','varchar(255)','String','taxName','0','0',NULL,'1','1','1','1','LIKE','input','',9,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(71,6,'tax_number','纳税人识别号','varchar(255)','String','taxNumber','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(72,6,'office_phone','单位电话','varchar(255)','String','officePhone','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(73,6,'office_address','单位地址','varchar(255)','String','officeAddress','0','0',NULL,'1','1','1','1','EQ','input','',12,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(74,6,'del','删除标记，1已删除','char(1)','String','del','0','0',NULL,'1','0','0','0','EQ','input','',13,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(75,6,'create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',14,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(76,6,'create_time','创建时间','timestamp','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',15,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(77,6,'update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',16,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(78,6,'update_time','修改时间','timestamp','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',17,'admin','2023-11-05 22:20:12','','2023-11-05 22:22:57'),(79,7,'id','主键id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(80,7,'use_type','文件关联内容类型，1客户，2合同，3财务，4案件，5知识','varchar(2)','String','useType','0','0',NULL,'1','1','1','1','EQ','select','',2,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(81,7,'customer_id','客户ID','bigint','Long','customerId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(82,7,'contract_id','合同ID','bigint','Long','contractId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(83,7,'finance_id','财务ID','bigint','Long','financeId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(84,7,'case_id','案件ID','bigint','Long','caseId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(85,7,'knowledge_id','知识ID','bigint','Long','knowledgeId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(86,7,'file_name','文件名称','varchar(255)','String','fileName','0','0',NULL,'1','1','1','1','LIKE','input','',8,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(87,7,'file_type','文件类型','varchar(255)','String','fileType','0','0',NULL,'1','1','1','1','EQ','select','',9,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(88,7,'file_size','文件大小(byte)','bigint','Long','fileSize','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(89,7,'file_path','文件服务器存储绝对路径','varchar(255)','String','filePath','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(90,7,'del','删除标记，1已删除','char(1)','String','del','0','0',NULL,'1','1','1','1','EQ','input','',12,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(91,7,'create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',13,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(92,7,'create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',14,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(93,7,'update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',15,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(94,7,'update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',16,'admin','2023-11-06 15:23:49','','2023-11-06 15:24:34'),(95,8,'id','主键id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-12 21:27:11','','2023-11-12 21:41:10'),(96,8,'customer_id','客户ID','bigint','Long','customerId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-11-12 21:27:11','','2023-11-12 21:41:10'),(97,8,'state','合同状态，0待审核，1审核通过','char(1)','String','state','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-11-12 21:27:11','','2023-11-12 21:41:10'),(98,8,'del','删除标记，1已删除','char(1)','String','del','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-12 21:27:11','','2023-11-12 21:41:10'),(99,8,'create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',5,'admin','2023-11-12 21:27:11','','2023-11-12 21:41:10'),(100,8,'create_time','创建时间','timestamp','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2023-11-12 21:27:11','','2023-11-12 21:41:10'),(101,8,'update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',7,'admin','2023-11-12 21:27:11','','2023-11-12 21:41:10'),(102,8,'update_time','修改时间','timestamp','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',8,'admin','2023-11-12 21:27:11','','2023-11-12 21:41:10'),(103,9,'id','主键id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-12 21:27:11','','2023-11-12 21:34:26'),(104,9,'contract_id','合同ID','bigint','Long','contractId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-11-12 21:27:11','','2023-11-12 21:34:26'),(105,9,'type','类别，0付款，1收款','char(1)','String','type','0','0',NULL,'1','1','1','1','EQ','select','',3,'admin','2023-11-12 21:27:11','','2023-11-12 21:34:26'),(106,9,'paypeople','付款/收款方','varchar(64)','String','paypeople','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-12 21:27:11','','2023-11-12 21:34:26'),(107,9,'count','金额','bigint','Long','count','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-12 21:27:11','','2023-11-12 21:34:26'),(108,9,'state','财务状态，0未收/付款，1已收/付款，2已开票','char(1)','String','state','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-11-12 21:27:11','','2023-11-12 21:34:26'),(109,9,'del','删除标记，1已删除','char(1)','String','del','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-11-12 21:27:11','','2023-11-12 21:34:26'),(110,9,'create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',8,'admin','2023-11-12 21:27:11','','2023-11-12 21:34:26'),(111,9,'create_time','创建时间','timestamp','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2023-11-12 21:27:11','','2023-11-12 21:34:26'),(112,9,'update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',10,'admin','2023-11-12 21:27:11','','2023-11-12 21:34:26'),(113,9,'update_time','修改时间','timestamp','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',11,'admin','2023-11-12 21:27:11','','2023-11-12 21:34:26'),(114,10,'id','主键id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-12 21:27:11','',NULL),(115,10,'title','知识标题','varchar(255)','String','title','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-11-12 21:27:11','',NULL),(116,10,'secret_type','初始隐私类别，0仅自己，1部门可见，2所有人可见','char(1)','String','secretType','0','0',NULL,'1','1','1','1','EQ','select','',3,'admin','2023-11-12 21:27:11','',NULL),(117,10,'origin','来源，0内部，1外部','char(1)','String','origin','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-12 21:27:11','',NULL),(118,10,'del','删除标记，1已删除','char(1)','String','del','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-12 21:27:11','',NULL),(119,10,'create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',6,'admin','2023-11-12 21:27:11','',NULL),(120,10,'create_time','创建时间','timestamp','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2023-11-12 21:27:11','',NULL),(121,10,'update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',8,'admin','2023-11-12 21:27:11','',NULL),(122,10,'update_time','修改时间','timestamp','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',9,'admin','2023-11-12 21:27:11','',NULL),(123,11,'id','主键id','bigint','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-12 21:27:11','',NULL),(124,11,'knowledge_id','知识id','bigint','Long','knowledgeId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-11-12 21:27:11','',NULL),(125,11,'shared_id','被分享人的ID','bigint','Long','sharedId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-11-12 21:27:11','',NULL),(126,11,'del','删除标记，1已删除','char(1)','String','del','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-12 21:27:11','',NULL),(127,11,'create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',5,'admin','2023-11-12 21:27:11','',NULL),(128,11,'create_time','创建时间','timestamp','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2023-11-12 21:27:11','',NULL),(129,11,'update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',7,'admin','2023-11-12 21:27:11','',NULL),(130,11,'update_time','修改时间','timestamp','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',8,'admin','2023-11-12 21:27:11','',NULL);
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_contract`
--

DROP TABLE IF EXISTS `n_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_contract` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `customer_id` bigint DEFAULT NULL COMMENT '客户ID',
  `state` char(1) DEFAULT '0' COMMENT '合同状态，0待审核，1审核通过',
  `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='合同信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_contract`
--

LOCK TABLES `n_contract` WRITE;
/*!40000 ALTER TABLE `n_contract` DISABLE KEYS */;
INSERT INTO `n_contract` VALUES (2,2,'0','0','','2023-11-13 09:16:42','','2023-11-13 12:29:17'),(3,1,'0','0','','2023-11-13 09:16:43','','2023-11-13 09:16:43'),(4,1,'0','0','','2023-11-13 09:16:44','','2023-11-13 09:16:44');
/*!40000 ALTER TABLE `n_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_customer`
--

DROP TABLE IF EXISTS `n_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL COMMENT '客户姓名',
  `contract_phone` varchar(255) NOT NULL COMMENT '联系电话',
  `contract_address` varchar(1024) DEFAULT NULL COMMENT '联系地址',
  `type` char(1) DEFAULT '0' COMMENT '客户类别，0联系人，1案源人，2服务成员',
  `bank_username` varchar(255) DEFAULT NULL COMMENT '银行信息',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '开户行',
  `bank_account` varchar(255) DEFAULT NULL COMMENT '银行账号',
  `tax_name` varchar(255) DEFAULT NULL COMMENT '名称/单位名称',
  `tax_number` varchar(255) DEFAULT NULL COMMENT '纳税人识别号',
  `office_phone` varchar(255) DEFAULT NULL COMMENT '单位电话',
  `office_address` varchar(255) DEFAULT NULL COMMENT '单位地址',
  `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_customer`
--

LOCK TABLES `n_customer` WRITE;
/*!40000 ALTER TABLE `n_customer` DISABLE KEYS */;
INSERT INTO `n_customer` VALUES (2,'updated2','13915947262','ceshi','1','ceshizhanghu','ceshiyinghangming','12332112332112332','nashuiren','111111111111','13388866666','办公地址','0','','2023-11-06 03:47:37','','2023-11-21 02:28:28'),(4,'testcustomer','13915947262','ceshi','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','','2023-11-08 13:02:59','','2023-11-08 13:02:58'),(5,'testcustomer','13915947262','ceshi','1','ceshizhanghu','ceshiyinghangming','12332112332112332','nashuiren','111111111111','13388866666','办公地址','0','','2023-11-08 13:07:27','','2023-11-08 13:07:27'),(6,'testcustomer2','13915947262','ceshi','1','ceshizhanghu','ceshiyinghangming','12332112332112332','nashuiren','111111111111','13388866666','办公地址','0','admin','2023-11-08 13:09:05','','2023-11-08 13:09:05'),(7,'testcustomer3','13915947262','ceshi','1','ceshizhanghu','ceshiyinghangming','12332112332112332','nashuiren','111111111111','13388866666','办公地址','0','admin','2023-11-10 03:29:15','','2023-11-10 03:29:15'),(8,'testcustomer3','13915947262','ceshi','1','ceshizhanghu','ceshiyinghangming','12332112332112332','nashuiren','111111111111','13388866666','办公地址','0','admin','2023-11-10 06:40:30','','2023-11-10 06:40:29'),(9,'zdx','13153968237','1','0','1','12','2','3','4','5','6','0','admin','2023-11-16 02:42:15','','2023-11-16 02:42:15'),(10,'123','123','123','0','123','123','123','123','123','123','123','0','admin','2023-11-19 13:45:50','','2023-11-19 13:45:49'),(11,'123','234','345','0','456','567','678','789','890','098','987','0','admin','2023-11-21 02:23:25','','2023-11-21 02:23:25');
/*!40000 ALTER TABLE `n_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_file_info`
--

DROP TABLE IF EXISTS `n_file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_file_info` (
  `file_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `use_type` varchar(2) DEFAULT NULL COMMENT '文件关联内容类型，1客户，2合同，3财务，4案件，5知识',
  `customer_id` bigint DEFAULT NULL COMMENT '客户ID',
  `contract_id` bigint DEFAULT NULL COMMENT '合同ID',
  `finance_id` bigint DEFAULT NULL COMMENT '财务ID',
  `case_id` bigint DEFAULT NULL COMMENT '案件ID',
  `knowledge_id` bigint DEFAULT NULL COMMENT '知识ID',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小(byte)',
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件服务器存储绝对路径',
  `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='上传文件信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_file_info`
--

LOCK TABLES `n_file_info` WRITE;
/*!40000 ALTER TABLE `n_file_info` DISABLE KEYS */;
INSERT INTO `n_file_info` VALUES (1,'1',2,NULL,NULL,NULL,NULL,'password.txt','txt',353,'http://localhost:8080/profile/upload/2023/11/16/password_20231116112629A008.txt','1','admin','2023-11-16 11:26:30','',NULL),(2,'1',2,NULL,NULL,NULL,NULL,'你好222','png',10024,'http://127.0.0.1:8080/profile/upload/2023/11/02/1_20231102221100A001.xlsx','1','admin','2023-11-21 12:00:13','',NULL),(3,'1',2,NULL,NULL,NULL,NULL,'你好222','png',10024,'http://127.0.0.1:8080/profile/upload/2023/11/02/1_20231102221100A001.xlsx','1','admin','2023-11-22 17:22:18','',NULL),(4,'1',2,NULL,NULL,NULL,NULL,'你好222','png',10024,'http://127.0.0.1:8080/profile/upload/2023/11/02/1_20231102221100A001.xlsx','1','admin','2023-11-22 17:39:35','',NULL),(5,'1',2,NULL,NULL,NULL,NULL,'undefined.undefined',NULL,NULL,NULL,'1','admin','2023-11-22 17:40:19','',NULL),(6,'1',2,NULL,NULL,NULL,NULL,'双人.jpg','jpg',11007993,'http://localhost:8080/profile/upload/2023/11/22/双人_20231122174341A001.jpg','1','admin','2023-11-22 17:43:41','',NULL),(7,'1',2,NULL,NULL,NULL,NULL,'双人.jpg','jpg',11007993,'http://localhost:8080/profile/upload/2023/11/22/双人_20231122174419A002.jpg','1','admin','2023-11-22 17:44:20','',NULL),(8,'1',2,NULL,NULL,NULL,NULL,'双人.jpg','jpg',11007993,'http://localhost:8080/profile/upload/2023/11/22/双人_20231122174711A001.jpg','1','admin','2023-11-22 17:47:12','',NULL),(9,'1',2,NULL,NULL,NULL,NULL,'password.txt','txt',493,'http://localhost:8080/profile/upload/2023/11/22/password_20231122174801A002.txt','1','admin','2023-11-22 17:48:02','',NULL),(10,'1',2,NULL,NULL,NULL,NULL,'体重记录.xlsx','xlsx',17420,'http://localhost:8080/profile/upload/2023/11/22/体重记录_20231122200555A003.xlsx','1','admin','2023-11-22 20:05:56','',NULL),(11,'1',2,NULL,NULL,NULL,NULL,'体重记录.xlsx','xlsx',17420,'http://localhost:8080/profile/upload/2023/11/22/体重记录_20231122200725A004.xlsx','1','admin','2023-11-22 20:07:26','',NULL),(12,'1',2,NULL,NULL,NULL,NULL,'体重记录.xlsx','xlsx',17420,'http://localhost:8080/profile/upload/2023/11/22/体重记录_20231122200831A005.xlsx','1','admin','2023-11-22 20:08:32','',NULL),(13,'1',2,NULL,NULL,NULL,NULL,'todo.txt','txt',137,'http://localhost:8080/profile/upload/2023/11/22/todo_20231122201200A006.txt','1','admin','2023-11-22 20:12:01','',NULL),(14,'1',2,NULL,NULL,NULL,NULL,'password.txt','txt',493,'http://localhost:8080/profile/upload/2023/11/22/password_20231122201709A007.txt','1','admin','2023-11-22 20:17:10','',NULL),(15,'1',2,NULL,NULL,NULL,NULL,'todo.txt','txt',137,'http://localhost:8080/profile/upload/2023/11/22/todo_20231122201720A008.txt','1','admin','2023-11-22 20:17:21','',NULL),(16,'1',2,NULL,NULL,NULL,NULL,'password.txt','txt',493,'http://localhost:8080/profile/upload/2023/11/22/password_20231122201727A009.txt','1','admin','2023-11-22 20:17:28','',NULL),(17,'1',2,NULL,NULL,NULL,NULL,'todo.txt','txt',137,'/profile/upload/2023/11/22/todo_20231122201838A010.txt','1','admin','2023-11-22 20:18:39','',NULL),(18,'1',2,NULL,NULL,NULL,NULL,'体重记录.xlsx','xlsx',17420,'http://localhost:8080/profile/upload/2023/11/22/体重记录_20231122203105A011.xlsx','1','admin','2023-11-22 20:31:06','',NULL),(19,'1',2,NULL,NULL,NULL,NULL,'todo.txt','txt',137,'http://localhost:8080/profile/upload/2023/11/22/todo_20231122203237A012.txt','1','admin','2023-11-22 20:32:38','',NULL),(20,'1',2,NULL,NULL,NULL,NULL,'password.txt','txt',493,'http://localhost:8080/profile/upload/2023/11/22/password_20231122205006A013.txt.txt','1','admin','2023-11-22 20:50:06','',NULL),(21,'1',2,NULL,NULL,NULL,NULL,'password.txt','txt',493,'http://localhost:8080/profile/upload/2023/11/22/password_20231122205053A014.txt.txt','1','admin','2023-11-22 20:50:53','',NULL),(22,'1',2,NULL,NULL,NULL,NULL,'password.txt','txt',493,'http://localhost:8080/profile/upload/2023/11/22/password_20231122205158A015.txt','1','admin','2023-11-22 20:51:58','',NULL),(23,'1',2,NULL,NULL,NULL,NULL,'7.5.png','png',267428,'http://localhost:8080/profile/upload/2023/11/22/7.5_20231122211225A016.png','1','admin','2023-11-22 21:12:26','',NULL),(24,'1',2,NULL,NULL,NULL,NULL,'云服务器.txt','txt',207,'http://localhost:8080/profile/upload/2023/11/24/云服务器_20231124204704A001.txt','0','admin','2023-11-24 20:47:05','',NULL),(25,'1',2,1,NULL,NULL,NULL,'测试','txt',207,'http://localhost:8080/profile/upload/2023/11/24/云服务器_20231124204704A001.txt','0','admin','2023-11-24 20:57:55','',NULL),(26,'1',NULL,2,NULL,NULL,NULL,'测试','txt',207,'http://localhost:8080/profile/upload/2023/11/24/云服务器_20231124204704A001.txt','0','admin','2023-11-24 20:58:26','',NULL),(27,'1',NULL,2,NULL,NULL,NULL,'todo.txt','txt',323,'http://localhost:8080/profile/upload/2023/11/25/todo_20231125085639A001.txt','0','admin','2023-11-25 08:56:40','',NULL);
/*!40000 ALTER TABLE `n_file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_finance`
--

DROP TABLE IF EXISTS `n_finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_finance` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `contract_id` bigint DEFAULT NULL COMMENT '合同ID',
  `type` char(1) DEFAULT NULL COMMENT '类别，0付款，1收款',
  `paypeople` varchar(64) DEFAULT NULL COMMENT '付款/收款方',
  `count` bigint DEFAULT '0' COMMENT '金额',
  `state` char(1) DEFAULT '0' COMMENT '财务状态，0未收/付款，1已收/付款，2已开票',
  `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='合同信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_finance`
--

LOCK TABLES `n_finance` WRITE;
/*!40000 ALTER TABLE `n_finance` DISABLE KEYS */;
INSERT INTO `n_finance` VALUES (1,1,'0','dexin',0,'0','0','','2023-11-15 03:00:11','','2023-11-15 03:01:54'),(2,1,'0','dexin',0,'0','0','','2023-11-15 03:01:20','','2023-11-15 03:01:19');
/*!40000 ALTER TABLE `n_finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_knowledge`
--

DROP TABLE IF EXISTS `n_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_knowledge` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) DEFAULT '' COMMENT '知识标题',
  `secret_type` char(1) DEFAULT NULL COMMENT '初始隐私类别，0仅自己，1部门可见，2所有人可见',
  `origin` char(1) DEFAULT NULL COMMENT '来源，0内部，1外部',
  `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='知识信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_knowledge`
--

LOCK TABLES `n_knowledge` WRITE;
/*!40000 ALTER TABLE `n_knowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `n_knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_share`
--

DROP TABLE IF EXISTS `n_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_share` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `knowledge_id` bigint DEFAULT NULL COMMENT '知识id',
  `shared_id` bigint DEFAULT NULL COMMENT '被分享人的ID',
  `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分享信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_share`
--

LOCK TABLES `n_share` WRITE;
/*!40000 ALTER TABLE `n_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `n_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pill_drug`
--

DROP TABLE IF EXISTS `pill_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pill_drug` (
  `drug_id` bigint NOT NULL AUTO_INCREMENT COMMENT '药品ID',
  `drug_name` varchar(50) DEFAULT NULL COMMENT '药品名称',
  `drug_code` varchar(50) DEFAULT NULL COMMENT '药品编码',
  `factory_id` bigint DEFAULT NULL COMMENT '生产厂家',
  `drug_type` char(1) DEFAULT NULL COMMENT '药品类型',
  `prescription_type` char(1) DEFAULT NULL COMMENT '处方类型',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `price` int DEFAULT NULL COMMENT '价格',
  `num` int DEFAULT NULL COMMENT '库存量',
  `warn_value` int DEFAULT NULL COMMENT '预警值',
  `conversion` int DEFAULT NULL COMMENT '换算量',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3 COMMENT='药品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pill_drug`
--

LOCK TABLES `pill_drug` WRITE;
/*!40000 ALTER TABLE `pill_drug` DISABLE KEYS */;
INSERT INTO `pill_drug` VALUES (101,'十全大补丸','dbw0001',101,'0','0','瓶',200,100,50,1,'0','admin','2022-08-27 16:03:29',NULL,NULL,NULL),(102,'阿莫西林','zcy0002',102,'1','1','盒',15,300,50,1,'0','admin','2022-09-15 16:03:29',NULL,NULL,NULL),(103,'1','2',3,'0','0','4',5,6,7,8,'0',NULL,'2023-10-29 10:57:33',NULL,NULL,'10'),(104,'123','4',5,'0','1','6',7,9,8,5,'0',NULL,'2023-10-29 11:00:15',NULL,NULL,'4');
/*!40000 ALTER TABLE `pill_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pill_factory`
--

DROP TABLE IF EXISTS `pill_factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pill_factory` (
  `factory_id` bigint NOT NULL AUTO_INCREMENT COMMENT '厂家ID',
  `factory_name` varchar(50) DEFAULT NULL COMMENT '厂家名称',
  `factory_code` varchar(50) DEFAULT NULL COMMENT '厂家编码',
  `contact` varchar(30) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(30) DEFAULT NULL COMMENT '电话',
  `keyword` varchar(20) DEFAULT NULL COMMENT '关键字',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`factory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3 COMMENT='生产厂家信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pill_factory`
--

LOCK TABLES `pill_factory` WRITE;
/*!40000 ALTER TABLE `pill_factory` DISABLE KEYS */;
INSERT INTO `pill_factory` VALUES (101,'云南白药集团股份有限公司','000011','admin','023-88887777','ynby','0','admin','2022-09-26 16:15:29',NULL,NULL,NULL),(102,'哈药集团股份有限公司','000022','admin','023-88887777','hyjt','0','admin','2022-09-26 16:15:29','admin','2022-09-26 20:34:01',NULL),(103,'太极集团有限公司','000033','admin','023-88887777','tjjt','0','admin','2022-09-26 16:15:29',NULL,NULL,NULL),(104,'上海医药集团有限公司','000033','admin','023-99998888','shyy','0','admin','2022-09-26 20:12:57',NULL,NULL,NULL);
/*!40000 ALTER TABLE `pill_factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2023-10-23 19:31:44','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-10-23 19:31:44','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2023-10-23 19:31:44','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','false','Y','admin','2023-10-23 19:31:44','admin','2023-10-25 10:16:29','是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2023-10-23 19:31:44','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2023-10-23 19:31:44','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','无界',0,'','15888888888','ry@qq.com','0','0','admin','2023-10-23 19:31:43','admin','2023-11-25 11:08:34'),(101,100,'0,100','总部门',1,'','15888888888','ry@qq.com','0','0','admin','2023-10-23 19:31:43','admin','2023-11-25 11:09:56'),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','2','admin','2023-10-23 19:31:43','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-10-23 19:31:43','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2023-10-23 19:31:43','',NULL),(105,101,'0,100,101','测试部门',3,'','15888888888','ry@qq.com','0','0','admin','2023-10-23 19:31:43','admin','2023-11-25 11:09:52'),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','2','admin','2023-10-23 19:31:43','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','2','admin','2023-10-23 19:31:43','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','2','admin','2023-10-23 19:31:43','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2023-10-23 19:31:43','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-10-23 19:31:44','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2023-10-23 19:31:44','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2023-10-23 19:31:44','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-10-23 19:31:44','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-10-23 19:31:44','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-10-23 19:31:44','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-10-23 19:31:44','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2023-10-23 19:31:44','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2023-10-23 19:31:44','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2023-10-23 19:31:44','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2023-10-23 19:31:44','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-10-23 19:31:44','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-10-23 19:31:44','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-10-23 19:31:44','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-10-23 19:31:44','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-10-23 19:31:44','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-10-23 19:31:44','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2023-10-23 19:31:44','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-10-23 19:31:44','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-10-23 19:31:44','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-10-23 19:31:44','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-10-23 19:31:44','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-10-23 19:31:44','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-10-23 19:31:44','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-10-23 19:31:44','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-10-23 19:31:44','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-10-23 19:31:44','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-10-23 19:31:44','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-10-23 19:31:44','',NULL,'停用状态'),(100,1,'中草药','0','pill_drug_dt',NULL,'default','N','0','admin','2023-10-28 10:53:51','',NULL,NULL),(101,2,'西药','1','pill_drug_dt',NULL,'default','N','0','admin','2023-10-28 10:54:07','',NULL,NULL),(102,1,'中药处方','0','pill_drug_pt',NULL,'default','N','0','admin','2023-10-28 10:55:02','',NULL,NULL),(103,2,'西药处方','1','pill_drug_pt',NULL,'default','N','0','admin','2023-10-28 10:55:10','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2023-10-23 19:31:43','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2023-10-23 19:31:43','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2023-10-23 19:31:43','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2023-10-23 19:31:43','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2023-10-23 19:31:43','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2023-10-23 19:31:43','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2023-10-23 19:31:43','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2023-10-23 19:31:43','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2023-10-23 19:31:43','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2023-10-23 19:31:43','',NULL,'登录状态列表'),(100,'药品类型','pill_drug_dt','0','admin','2023-10-28 10:52:43','',NULL,'药品类型列表'),(101,'处方类型','pill_drug_pt','0','admin','2023-10-28 10:54:29','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_info`
--

DROP TABLE IF EXISTS `sys_file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file_info` (
  `file_id` int NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_name` varchar(50) DEFAULT '' COMMENT '文件名称',
  `file_path` varchar(255) DEFAULT '' COMMENT '文件路径',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='文件信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_info`
--

LOCK TABLES `sys_file_info` WRITE;
/*!40000 ALTER TABLE `sys_file_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2023-10-23 19:31:44','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2023-10-23 19:31:44','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2023-10-23 19:31:44','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-25 10:14:24'),(101,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 10:14:29'),(102,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-25 10:14:57'),(103,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 10:15:03'),(104,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-25 10:15:56'),(105,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 10:16:02'),(106,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-25 10:16:32'),(107,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 10:16:34'),(108,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-27 11:05:27'),(109,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-27 20:42:16'),(110,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-27 22:29:55'),(111,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-28 10:51:33'),(112,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-28 11:47:15'),(113,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-28 23:20:45'),(114,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-29 10:16:35'),(115,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-31 11:06:36'),(116,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-31 17:01:43'),(117,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 11:36:01'),(118,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-03 11:36:12'),(119,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-03 17:55:57'),(120,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-03 18:41:59'),(121,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 18:47:49'),(122,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 19:38:35'),(123,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-03 19:39:25'),(124,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-03 21:21:29'),(125,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 21:26:59'),(126,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-04 08:38:56'),(127,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-04 08:39:47'),(128,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-04 14:44:25'),(129,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-04 22:25:42'),(130,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-05 22:18:00'),(131,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-06 11:12:33'),(132,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-06 11:45:58'),(133,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-06 14:34:10'),(134,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-06 14:35:23'),(135,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-06 15:06:46'),(136,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-06 15:22:06'),(137,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-08 16:45:46'),(138,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-08 17:12:56'),(139,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-08 17:41:59'),(140,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-08 20:59:36'),(141,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-09 11:39:48'),(142,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-10 11:17:12'),(143,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-10 14:40:06'),(144,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-10 15:37:28'),(145,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-11 17:07:06'),(146,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-11 17:44:12'),(147,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-12 15:08:15'),(148,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-12 21:26:21'),(149,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-12 21:28:32'),(150,'ry','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-12 21:28:37'),(151,'ry','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-12 21:28:51'),(152,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-12 21:28:52'),(153,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-12 21:29:21'),(154,'ry','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-12 21:29:25'),(155,'ry','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-12 21:29:35'),(156,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-12 21:29:39'),(157,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-12 21:30:09'),(158,'ry','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-12 21:30:12'),(159,'ry','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-12 21:32:50'),(160,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-12 21:32:52'),(161,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-12 22:00:42'),(162,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-13 17:16:26'),(163,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-13 17:56:37'),(164,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-13 19:36:08'),(165,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-13 20:11:26'),(166,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-13 20:34:13'),(167,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-15 11:14:37'),(168,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-16 10:38:29'),(169,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-19 21:34:54'),(170,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-21 10:13:58'),(171,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-21 11:53:23'),(172,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-22 17:18:45'),(173,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-22 17:21:58'),(174,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-22 20:38:56'),(175,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-23 20:07:28'),(176,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-11-24 20:41:17'),(177,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-25 11:04:48'),(178,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-25 11:04:56');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2039 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2023-10-23 19:31:43','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2023-10-23 19:31:43','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2023-10-23 19:31:43','',NULL,'系统工具目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2023-10-23 19:31:43','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2023-10-23 19:31:43','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2023-10-23 19:31:43','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2023-10-23 19:31:43','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2023-10-23 19:31:43','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2023-10-23 19:31:43','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2023-10-23 19:31:43','',NULL,'参数设置菜单'),(107,'通知公告',2038,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2023-10-23 19:31:43','admin','2023-11-25 11:06:29','通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2023-10-23 19:31:43','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2023-10-23 19:31:43','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2023-10-23 19:31:43','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2023-10-23 19:31:43','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2023-10-23 19:31:43','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2023-10-23 19:31:43','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2023-10-23 19:31:43','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2023-10-23 19:31:43','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2023-10-23 19:31:43','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2023-10-23 19:31:43','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2023-10-23 19:31:43','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2023-10-23 19:31:43','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2023-10-23 19:31:43','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2023-10-23 19:31:43','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2023-10-23 19:31:43','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2023-10-23 19:31:43','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2023-10-23 19:31:43','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2023-10-23 19:31:43','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2023-10-23 19:31:43','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2023-10-23 19:31:43','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2023-10-23 19:31:43','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2023-10-23 19:31:43','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2023-10-23 19:31:43','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2023-10-23 19:31:43','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2023-10-23 19:31:43','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2023-10-23 19:31:43','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2023-10-23 19:31:43','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2023-10-23 19:31:43','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2023-10-23 19:31:43','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2023-10-23 19:31:43','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2023-10-23 19:31:43','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2023-10-23 19:31:43','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2023-10-23 19:31:43','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2023-10-23 19:31:43','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2023-10-23 19:31:43','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2023-10-23 19:31:43','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2023-10-23 19:31:43','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2023-10-23 19:31:43','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2023-10-23 19:31:43','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2023-10-23 19:31:43','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2023-10-23 19:31:43','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2023-10-23 19:31:43','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2023-10-23 19:31:43','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2023-10-23 19:31:43','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2023-10-23 19:31:43','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2023-10-23 19:31:43','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2023-10-23 19:31:43','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2023-10-23 19:31:43','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2023-10-23 19:31:43','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2023-10-23 19:31:43','',NULL,''),(2021,'客户管理',0,4,'customer',NULL,NULL,1,0,'M','0','0',NULL,'peoples','admin','2023-11-06 11:15:51','',NULL,''),(2022,'客户信息',2021,1,'customer','customer/index',NULL,1,0,'C','0','0','','user','admin','2023-11-06 11:16:44','admin','2023-11-06 11:18:00',''),(2023,'合同信息',2035,1,'contract','wujie/contract/index',NULL,1,0,'C','0','0','wujie:contract:list','#','admin','2023-11-12 21:43:02','admin','2023-11-15 11:16:01','合同信息菜单'),(2024,'合同信息查询',2023,1,'#','',NULL,1,0,'F','0','0','wujie:contract:query','#','admin','2023-11-12 21:43:02','',NULL,''),(2025,'合同信息新增',2023,2,'#','',NULL,1,0,'F','0','0','wujie:contract:add','#','admin','2023-11-12 21:43:02','',NULL,''),(2026,'合同信息修改',2023,3,'#','',NULL,1,0,'F','0','0','wujie:contract:edit','#','admin','2023-11-12 21:43:02','',NULL,''),(2027,'合同信息删除',2023,4,'#','',NULL,1,0,'F','0','0','wujie:contract:remove','#','admin','2023-11-12 21:43:02','',NULL,''),(2028,'合同信息导出',2023,5,'#','',NULL,1,0,'F','0','0','wujie:contract:export','#','admin','2023-11-12 21:43:02','',NULL,''),(2029,'财务信息',2036,1,'finance','wujie/finance/index',NULL,1,0,'C','0','0','wujie:finance:list','#','admin','2023-11-12 21:43:48','admin','2023-11-15 11:17:18','财务信息菜单'),(2030,'财务信息查询',2029,1,'#','',NULL,1,0,'F','0','0','wujie:finance:query','#','admin','2023-11-12 21:43:48','',NULL,''),(2031,'财务信息新增',2029,2,'#','',NULL,1,0,'F','0','0','wujie:finance:add','#','admin','2023-11-12 21:43:48','',NULL,''),(2032,'财务信息修改',2029,3,'#','',NULL,1,0,'F','0','0','wujie:finance:edit','#','admin','2023-11-12 21:43:48','',NULL,''),(2033,'财务信息删除',2029,4,'#','',NULL,1,0,'F','0','0','wujie:finance:remove','#','admin','2023-11-12 21:43:48','',NULL,''),(2034,'财务信息导出',2029,5,'#','',NULL,1,0,'F','0','0','wujie:finance:export','#','admin','2023-11-12 21:43:48','',NULL,''),(2035,'合同管理',0,5,'contract',NULL,NULL,1,0,'M','0','0',NULL,'clipboard','admin','2023-11-15 11:15:51','',NULL,''),(2036,'财务管理',0,6,'finance',NULL,NULL,1,0,'M','0','0','','money','admin','2023-11-15 11:16:50','admin','2023-11-15 11:21:18',''),(2037,'客户详情',2021,2,'customer/detail','customer/detail',NULL,1,0,'C','1','0','','build','admin','2023-11-21 10:42:56','admin','2023-11-21 10:44:37',''),(2038,'通知公告',0,8,'system',NULL,NULL,1,0,'M','0','0','','wechat','admin','2023-11-25 11:06:00','admin','2023-11-25 11:06:20','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (10,'test公告','1',_binary '<p>111</p>','1','admin','2023-11-12 21:28:01','admin','2023-11-25 10:54:05',NULL),(11,'测试公告','2',_binary '<p>这是一条测试公告，看到这条公告说明通知系统正常运行了！</p>','0','admin','2023-11-12 21:29:16','admin','2023-11-25 10:59:43',NULL);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"N\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-10-23 19:31:44\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-25 10:14:53',19),(101,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-10-23 19:31:44\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-25 10:14:53\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-25 10:16:22',25),(102,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2023-10-23 19:31:44\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-10-25 10:16:22\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-25 10:16:29',11),(103,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"pill_factory\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-27 11:06:19',102),(104,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-27 11:09:17',27),(105,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"pill_factory\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-27 11:09:20',81),(106,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"pill_factory\"}',NULL,0,NULL,'2023-10-27 11:09:37',72),(107,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"pill_factory\"}',NULL,0,NULL,'2023-10-27 11:09:59',51),(108,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/4','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2023-10-27 20:42:26',34),(109,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-10-23 19:31:43\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-27 20:42:51',35),(110,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-27 20:42:56',12),(111,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"药品进销存\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"pill\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-27 22:33:01',22),(112,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"生产厂家\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"factory\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-27 22:33:44',9),(113,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pill/factory/index\",\"createTime\":\"2023-10-27 22:33:44\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"生产厂家\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"factory\",\"perms\":\"pill:factory:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-27 22:35:35',7),(114,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"药品类型\",\"dictType\":\"pill_drug_dt\",\"params\":{},\"remark\":\"药品类型列表\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-28 10:52:43',27),(115,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"中草药\",\"dictSort\":1,\"dictType\":\"pill_drug_dt\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-28 10:53:51',10),(116,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"西药\",\"dictSort\":2,\"dictType\":\"pill_drug_dt\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-28 10:54:07',8),(117,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"处方类型\",\"dictType\":\"pill_drug_pt\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-28 10:54:29',7),(118,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"中药处方\",\"dictSort\":1,\"dictType\":\"pill_drug_pt\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-28 10:55:02',7),(119,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"西药处方\",\"dictSort\":2,\"dictType\":\"pill_drug_pt\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-28 10:55:10',7),(120,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"pill_drug\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-28 10:58:17',74),(121,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"drug\",\"className\":\"PillDrug\",\"columns\":[{\"capJavaField\":\"DrugId\",\"columnComment\":\"药品ID\",\"columnId\":25,\"columnName\":\"drug_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 10:58:17\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"drugId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DrugName\",\"columnComment\":\"药品名称\",\"columnId\":26,\"columnName\":\"drug_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 10:58:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"drugName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DrugCode\",\"columnComment\":\"药品编码\",\"columnId\":27,\"columnName\":\"drug_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 10:58:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"drugCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FactoryId\",\"columnComment\":\"生产厂家\",\"columnId\":28,\"columnName\":\"factory_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 10:58:17\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"factoryId\",\"javaType\":\"L','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-28 11:53:32',66),(122,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"pill_drug\"}',NULL,0,NULL,'2023-10-28 11:54:31',309),(123,'药品信息',1,'com.ruoyi.web.controller.PillDrugController.add()','POST',1,'admin',NULL,'/pill/drug','127.0.0.1','内网IP','{\"conversion\":8,\"createTime\":\"2023-10-29 10:57:33\",\"drugCode\":\"2\",\"drugId\":103,\"drugName\":\"1\",\"drugType\":\"0\",\"factoryId\":3,\"num\":6,\"params\":{},\"prescriptionType\":\"0\",\"price\":5,\"remark\":\"10\",\"status\":\"0\",\"unit\":\"4\",\"warnValue\":7}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-29 10:57:33',45),(124,'药品信息',1,'com.ruoyi.web.controller.PillDrugController.add()','POST',1,'admin',NULL,'/pill/drug','127.0.0.1','内网IP','{\"conversion\":5,\"createTime\":\"2023-10-29 11:00:15\",\"drugCode\":\"4\",\"drugId\":104,\"drugName\":\"123\",\"drugType\":\"0\",\"factoryId\":5,\"num\":9,\"params\":{},\"prescriptionType\":\"1\",\"price\":7,\"remark\":\"4\",\"status\":\"0\",\"unit\":\"6\",\"warnValue\":8}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-10-29 11:00:15',6),(125,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"t_custom,t_file_info\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:48:04',134),(126,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"/customer\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:49:53',26),(127,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:51:06',12),(128,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:51:11',10),(129,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2000','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-11-03 18:53:39',5),(130,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2001','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:53:42',11),(131,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2002','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-11-03 18:53:44',2),(132,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2003','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:53:49',7),(133,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2004','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:53:51',12),(134,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2005','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:53:53',17),(135,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2006','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:53:55',11),(136,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2007','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:53:57',9),(137,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2002','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:53:58',10),(138,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2000','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:54:00',13),(139,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"custom\",\"className\":\"TCustom\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":42,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 18:48:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"客户姓名\",\"columnId\":43,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 18:48:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"电话\",\"columnId\":44,\"columnName\":\"phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 18:48:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"phone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"地址\",\"columnId\":45,\"columnName\":\"address\",\"columnType\":\"varchar(1024)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-03 18:48:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"address\",\"javaType\":\"String\",\"list\":true,\"params\":{},','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 18:57:16',55),(140,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_custom\"}',NULL,0,NULL,'2023-11-03 18:59:03',59),(141,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2009','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-11-03 19:04:30',4),(142,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2010','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 19:04:34',9),(143,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2011','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 19:04:40',9),(144,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2012','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 19:04:42',8),(145,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2013','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 19:04:44',9),(146,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2014','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 19:04:45',13),(147,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2009','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 19:04:47',8),(148,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"biz/index\",\"createTime\":\"2023-11-03 19:03:07\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"客户信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"custom\",\"perms\":\"system:custom:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-03 19:08:10',9),(149,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_custom\"}',NULL,0,NULL,'2023-11-03 21:30:55',79),(150,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2015','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-11-05 22:19:42',41),(151,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2016','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-05 22:19:46',23),(152,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2017','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-05 22:19:48',13),(153,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2018','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-05 22:19:50',13),(154,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2019','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-05 22:19:51',10),(155,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2020','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-05 22:19:53',9),(156,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2015','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-05 22:19:54',12),(157,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2008','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-05 22:19:56',12),(158,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"n_customer\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-05 22:20:12',196),(159,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"n_customer\"}',NULL,0,NULL,'2023-11-05 22:20:15',297),(160,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"customer\",\"className\":\"NCustomer\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":62,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 22:20:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"客户姓名\",\"columnId\":63,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 22:20:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContractPhone\",\"columnComment\":\"联系电话\",\"columnId\":64,\"columnName\":\"contract_phone\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 22:20:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contractPhone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContractAddress\",\"columnComment\":\"联系地址\",\"columnId\":65,\"columnName\":\"contract_address\",\"columnType\":\"varchar(1024)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 22:20:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"con','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-05 22:22:57',104),(161,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"t_custom\"}',NULL,0,NULL,'2023-11-05 22:23:00',56),(162,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"n_customer\"}',NULL,0,NULL,'2023-11-05 22:23:48',58),(163,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"customer\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-06 11:15:51',28),(164,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户信息\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2021,\"path\":\"customer/customer\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-06 11:16:44',9),(165,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"customer/index\",\"createTime\":\"2023-11-06 11:16:44\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"客户信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2021,\"path\":\"customer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-06 11:18:00',9),(166,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"4\",\"bankName\":\"3\",\"bankUsername\":\"2\",\"contractAddress\":\"1\",\"contractPhone\":\"234\",\"createTime\":\"2023-11-06 11:46:20\",\"del\":\"0\",\"id\":1,\"name\":\"123\",\"officeAddress\":\"8\",\"officePhone\":\"7\",\"params\":{},\"taxName\":\"5\",\"taxNumber\":\"6\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-06 11:46:20',21),(167,'客户信息',3,'com.ruoyi.web.controller.wujie.NCustomerController.remove()','DELETE',1,'admin',NULL,'/customer/customer/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-06 11:46:23',9),(168,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"1\",\"bankName\":\"1\",\"bankUsername\":\"1\",\"contractAddress\":\"1\",\"contractPhone\":\"234\",\"createTime\":\"2023-11-06 11:47:37\",\"del\":\"1\",\"id\":2,\"name\":\"123\",\"officeAddress\":\"1\",\"officePhone\":\"1\",\"params\":{},\"taxName\":\"1\",\"taxNumber\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-06 11:47:37',6),(169,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"n_file_info\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-06 15:23:49',96),(170,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"file\",\"className\":\"NFileInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":79,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 15:23:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UseType\",\"columnComment\":\"文件关联内容类型，1客户，2合同，3财务，4案件，5知识\",\"columnId\":80,\"columnName\":\"use_type\",\"columnType\":\"varchar(2)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 15:23:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"useType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"客户ID\",\"columnId\":81,\"columnName\":\"customer_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 15:23:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"customerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContractId\",\"columnComment\":\"合同ID\",\"columnId\":82,\"columnName\":\"contract_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 15:23:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"contractId\",\"javaType\":\"Long\",\"list\":true,\"pa','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-06 15:24:34',59),(171,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"createTime\":\"2023-11-08 21:01:37\",\"name\":\"test\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'contract_phone\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projects\\filedownload\\RuoYi-Vue\\RuoYi-Vue\\ruoyi-wujie\\target\\classes\\mapper\\customer\\NCustomerMapper.xml]\r\n### The error may involve com.ruoyi.wujie.mapper.NCustomerMapper.insertNCustomer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into n_customer          ( name,                                                                                                                                                                         create_time )           values ( ?,                                                                                                                                                                         ? )\r\n### Cause: java.sql.SQLException: Field \'contract_phone\' doesn\'t have a default value\n; Field \'contract_phone\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'contract_phone\' doesn\'t have a default value','2023-11-08 21:01:37',137),(172,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"createTime\":\"2023-11-08 21:02:47\",\"name\":\"testcustomer\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'contract_phone\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projects\\filedownload\\RuoYi-Vue\\RuoYi-Vue\\ruoyi-wujie\\target\\classes\\mapper\\customer\\NCustomerMapper.xml]\r\n### The error may involve com.ruoyi.wujie.mapper.NCustomerMapper.insertNCustomer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into n_customer          ( name,                                                                                                                                                                         create_time )           values ( ?,                                                                                                                                                                         ? )\r\n### Cause: java.sql.SQLException: Field \'contract_phone\' doesn\'t have a default value\n; Field \'contract_phone\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'contract_phone\' doesn\'t have a default value','2023-11-08 21:02:47',6),(173,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"contractPhone\":\"13915947262\",\"createTime\":\"2023-11-08 21:02:54\",\"id\":3,\"name\":\"testcustomer\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-08 21:02:54',8),(174,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"contractAddress\":\"ceshi\",\"contractPhone\":\"13915947262\",\"createTime\":\"2023-11-08 21:02:58\",\"id\":4,\"name\":\"testcustomer\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-08 21:02:58',6),(175,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"12332112332112332\",\"bankName\":\"ceshiyinghangming\",\"bankUsername\":\"ceshizhanghu\",\"contractAddress\":\"ceshi\",\"contractPhone\":\"13915947262\",\"createTime\":\"2023-11-08 21:07:27\",\"del\":\"0\",\"id\":5,\"name\":\"testcustomer\",\"officeAddress\":\"办公地址\",\"officePhone\":\"13388866666\",\"params\":{},\"taxName\":\"nashuiren\",\"taxNumber\":\"111111111111\",\"type\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-08 21:07:27',8),(176,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"12332112332112332\",\"bankName\":\"ceshiyinghangming\",\"bankUsername\":\"ceshizhanghu\",\"contractAddress\":\"ceshi\",\"contractPhone\":\"13915947262\",\"createBy\":\"admin\",\"createTime\":\"2023-11-08 21:09:05\",\"del\":\"0\",\"id\":6,\"name\":\"testcustomer2\",\"officeAddress\":\"办公地址\",\"officePhone\":\"13388866666\",\"params\":{},\"taxName\":\"nashuiren\",\"taxNumber\":\"111111111111\",\"type\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-08 21:09:05',18),(177,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"12332112332112332\",\"bankName\":\"ceshiyinghangming\",\"bankUsername\":\"ceshizhanghu\",\"contractAddress\":\"ceshi\",\"contractPhone\":\"13915947262\",\"createBy\":\"admin\",\"createTime\":\"2023-11-10 11:29:15\",\"del\":\"0\",\"id\":7,\"name\":\"testcustomer3\",\"officeAddress\":\"办公地址\",\"officePhone\":\"13388866666\",\"params\":{},\"taxName\":\"nashuiren\",\"taxNumber\":\"111111111111\",\"type\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-10 11:29:15',40),(178,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"12332112332112332\",\"bankName\":\"ceshiyinghangming\",\"bankUsername\":\"ceshizhanghu\",\"contractAddress\":\"ceshi\",\"contractPhone\":\"13915947262\",\"createBy\":\"admin\",\"createTime\":\"2023-11-10 14:40:29\",\"del\":\"0\",\"id\":8,\"name\":\"testcustomer3\",\"officeAddress\":\"办公地址\",\"officePhone\":\"13388866666\",\"params\":{},\"taxName\":\"nashuiren\",\"taxNumber\":\"111111111111\",\"type\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-10 14:40:29',19),(179,'客户信息',2,'com.ruoyi.web.controller.wujie.NCustomerController.edit()','PUT',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"12332112332112332\",\"bankName\":\"ceshiyinghangming\",\"bankUsername\":\"ceshizhanghu\",\"contractAddress\":\"ceshi\",\"contractPhone\":\"13915947262\",\"del\":\"0\",\"id\":2,\"name\":\"updated2\",\"officeAddress\":\"办公地址\",\"officePhone\":\"13388866666\",\"params\":{},\"taxName\":\"nashuiren\",\"taxNumber\":\"111111111111\",\"type\":\"1\",\"updateTime\":\"2023-11-11 17:46:13\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-11 17:46:13',63),(180,'客户信息',3,'com.ruoyi.web.controller.wujie.NCustomerController.remove()','DELETE',1,'admin',NULL,'/customer/customer/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-11 17:47:08',10),(181,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"n_contract,n_finance,n_knowledge,n_share\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-12 21:27:11',273),(182,'通知公告',3,'com.ruoyi.web.controller.system.SysNoticeController.remove()','DELETE',1,'admin',NULL,'/system/notice/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-12 21:27:48',7),(183,'通知公告',3,'com.ruoyi.web.controller.system.SysNoticeController.remove()','DELETE',1,'admin',NULL,'/system/notice/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-12 21:27:50',6),(184,'通知公告',1,'com.ruoyi.web.controller.system.SysNoticeController.add()','POST',1,'admin',NULL,'/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"noticeContent\":\"<p>111</p>\",\"noticeTitle\":\"test公告\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-12 21:28:01',13),(185,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','PUT',1,'admin',NULL,'/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-12 21:28:27',82),(186,'通知公告',1,'com.ruoyi.web.controller.system.SysNoticeController.add()','POST',1,'admin',NULL,'/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"noticeContent\":\"<p>111111</p>\",\"noticeTitle\":\"测试公告\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-12 21:29:16',6),(187,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-10-23 19:31:43\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-12 21:30:06',30),(188,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"finance\",\"className\":\"NFinance\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":103,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContractId\",\"columnComment\":\"合同ID\",\"columnId\":104,\"columnName\":\"contract_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"contractId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"类别，0付款，1收款\",\"columnId\":105,\"columnName\":\"type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Paypeople\",\"columnComment\":\"付款/收款方\",\"columnId\":106,\"columnName\":\"paypeople\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"paypeople\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-12 21:33:32',69),(189,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"finance\",\"className\":\"NFinance\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":103,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-11-12 21:33:32\",\"usableColumn\":false},{\"capJavaField\":\"ContractId\",\"columnComment\":\"合同ID\",\"columnId\":104,\"columnName\":\"contract_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"contractId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-11-12 21:33:32\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"类别，0付款，1收款\",\"columnId\":105,\"columnName\":\"type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-11-12 21:33:32\",\"usableColumn\":false},{\"capJavaField\":\"Paypeople\",\"columnComment\":\"付款/收款方\",\"columnId\":106,\"columnName\":\"paypeople\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-12 21:34:26',32),(190,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"contract\",\"className\":\"NContract\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":95,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"客户ID\",\"columnId\":96,\"columnName\":\"customer_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"customerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"State\",\"columnComment\":\"合同状态，0待审核，1审核通过\",\"columnId\":97,\"columnName\":\"state\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"state\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Del\",\"columnComment\":\"删除标记，1已删除\",\"columnId\":98,\"columnName\":\"del\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:27:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"del\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-12 21:41:10',23),(191,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"n_contract,n_finance\"}',NULL,0,NULL,'2023-11-12 21:41:15',266),(192,'合同信息',1,'com.ruoyi.web.controller.wujie.NContractController.add()','POST',1,'admin',NULL,'/wujie/contract','127.0.0.1','内网IP','{\"createTime\":\"2023-11-12 22:16:57\",\"customerId\":1,\"id\":1,\"params\":{},\"state\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-12 22:16:57',81),(193,'合同信息',3,'com.ruoyi.web.controller.wujie.NContractController.remove()','DELETE',1,'admin',NULL,'/wujie/contract/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-13 17:16:35',37),(194,'合同信息',1,'com.ruoyi.web.controller.wujie.NContractController.add()','POST',1,'admin',NULL,'/wujie/contract','127.0.0.1','内网IP','{\"createTime\":\"2023-11-13 17:16:42\",\"customerId\":1,\"id\":2,\"params\":{},\"state\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-13 17:16:42',11),(195,'合同信息',1,'com.ruoyi.web.controller.wujie.NContractController.add()','POST',1,'admin',NULL,'/wujie/contract','127.0.0.1','内网IP','{\"createTime\":\"2023-11-13 17:16:43\",\"customerId\":1,\"id\":3,\"params\":{},\"state\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-13 17:16:43',12),(196,'合同信息',1,'com.ruoyi.web.controller.wujie.NContractController.add()','POST',1,'admin',NULL,'/wujie/contract','127.0.0.1','内网IP','{\"createTime\":\"2023-11-13 17:16:44\",\"customerId\":1,\"id\":4,\"params\":{},\"state\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-13 17:16:44',8),(197,'合同信息',2,'com.ruoyi.web.controller.wujie.NContractController.edit()','PUT',1,'admin',NULL,'/wujie/contract','127.0.0.1','内网IP','{\"customerId\":3,\"id\":2,\"params\":{},\"state\":\"0\",\"updateTime\":\"2023-11-13 17:20:52\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-13 17:20:52',15),(198,'合同信息',2,'com.ruoyi.web.controller.wujie.NContractController.edit()','PUT',1,'admin',NULL,'/wujie/contract','127.0.0.1','内网IP','{\"customerId\":2,\"id\":2,\"params\":{},\"state\":\"0\",\"updateTime\":\"2023-11-13 20:28:47\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-13 20:28:47',22),(199,'合同信息',2,'com.ruoyi.web.controller.wujie.NContractController.edit()','PUT',1,'admin',NULL,'/wujie/contract','127.0.0.1','内网IP','{\"customerId\":2,\"id\":2,\"params\":{},\"state\":\"0\",\"updateTime\":\"2023-11-13 20:29:16\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-13 20:29:16',6),(200,'合同信息',1,'com.ruoyi.web.controller.wujie.NFinanceController.add()','POST',1,'admin',NULL,'/wujie/finance','127.0.0.1','内网IP','{\"createTime\":\"2023-11-15 11:00:10\",\"id\":1,\"params\":{},\"state\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-15 11:00:11',186),(201,'合同信息',1,'com.ruoyi.web.controller.wujie.NFinanceController.add()','POST',1,'admin',NULL,'/wujie/finance','127.0.0.1','内网IP','{\"contractId\":1,\"createTime\":\"2023-11-15 11:01:19\",\"id\":2,\"params\":{},\"paypeople\":\"dexin\",\"type\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-15 11:01:19',8),(202,'合同信息',2,'com.ruoyi.web.controller.wujie.NFinanceController.edit()','PUT',1,'admin',NULL,'/wujie/finance','127.0.0.1','内网IP','{\"contractId\":1,\"id\":1,\"params\":{},\"paypeople\":\"dexin\",\"type\":\"0\",\"updateTime\":\"2023-11-15 11:01:54\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-15 11:01:54',15),(203,'合同信息',3,'com.ruoyi.web.controller.wujie.NFinanceController.remove()','DELETE',1,'admin',NULL,'/wujie/finance/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-11-15 11:09:23',10),(204,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"合同管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"contract\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-15 11:15:51',31),(205,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"wujie/contract/index\",\"createTime\":\"2023-11-12 21:43:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"合同信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2035,\"path\":\"contract\",\"perms\":\"wujie:contract:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-15 11:16:01',10),(206,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"财务管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"finance\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-15 11:16:50',9),(207,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-11-15 11:16:50\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"财务管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"finance\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-15 11:16:59',8),(208,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"wujie/finance/index\",\"createTime\":\"2023-11-12 21:43:48\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"财务信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2036,\"path\":\"finance\",\"perms\":\"wujie:finance:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-15 11:17:18',7),(209,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-11-15 11:16:50\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"财务管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"finance\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-15 11:21:18',8),(210,'客户信息',5,'com.ruoyi.web.controller.wujie.NCustomerController.export()','POST',1,'admin',NULL,'/customer/customer/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2023-11-16 10:40:35',1518),(211,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"2\",\"bankName\":\"12\",\"bankUsername\":\"1\",\"contractAddress\":\"1\",\"contractPhone\":\"13153968237\",\"createBy\":\"admin\",\"createTime\":\"2023-11-16 10:42:15\",\"id\":9,\"name\":\"zdx\",\"officeAddress\":\"6\",\"officePhone\":\"5\",\"params\":{},\"taxName\":\"3\",\"taxNumber\":\"4\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-16 10:42:15',34),(212,'客户信息',2,'com.ruoyi.web.controller.wujie.NCustomerController.edit()','PUT',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"12332112332112332\",\"bankName\":\"ceshiyinghangming\",\"bankUsername\":\"ceshizhanghu\",\"contractAddress\":\"ceshi\",\"contractPhone\":\"13915947262\",\"createBy\":\"\",\"createTime\":\"2023-11-06 11:47:37\",\"del\":\"0\",\"id\":2,\"name\":\"updated2\",\"officeAddress\":\"办公地址\",\"officePhone\":\"13388866666\",\"params\":{},\"taxName\":\"nashuiren\",\"taxNumber\":\"111111111111\",\"type\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-11-16 10:51:07\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-16 10:51:07',6),(213,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"123\",\"bankName\":\"123\",\"bankUsername\":\"123\",\"contractAddress\":\"123\",\"contractPhone\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2023-11-19 21:45:49\",\"id\":10,\"name\":\"123\",\"officeAddress\":\"123\",\"officePhone\":\"123\",\"params\":{},\"taxName\":\"123\",\"taxNumber\":\"123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-19 21:45:49',23),(214,'客户信息',1,'com.ruoyi.web.controller.wujie.NCustomerController.add()','POST',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"678\",\"bankName\":\"567\",\"bankUsername\":\"456\",\"contractAddress\":\"345\",\"contractPhone\":\"234\",\"createBy\":\"admin\",\"createTime\":\"2023-11-21 10:23:25\",\"id\":11,\"name\":\"123\",\"officeAddress\":\"987\",\"officePhone\":\"098\",\"params\":{},\"taxName\":\"789\",\"taxNumber\":\"890\",\"type\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-21 10:23:25',22),(215,'客户信息',2,'com.ruoyi.web.controller.wujie.NCustomerController.edit()','PUT',1,'admin',NULL,'/customer/customer','127.0.0.1','内网IP','{\"bankAccount\":\"12332112332112332\",\"bankName\":\"ceshiyinghangming\",\"bankUsername\":\"ceshizhanghu\",\"contractAddress\":\"ceshi\",\"contractPhone\":\"13915947262\",\"createBy\":\"\",\"createTime\":\"2023-11-06 11:47:37\",\"del\":\"0\",\"id\":2,\"name\":\"updated2\",\"officeAddress\":\"办公地址\",\"officePhone\":\"13388866666\",\"params\":{},\"taxName\":\"nashuiren\",\"taxNumber\":\"111111111111\",\"type\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2023-11-21 10:28:27\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-21 10:28:27',8),(216,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户详情\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":2021,\"path\":\"customer/detail\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-21 10:42:56',26),(217,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"customer/detail\",\"createTime\":\"2023-11-21 10:42:56\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2037,\"menuName\":\"客户详情\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2021,\"path\":\"customer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-21 10:43:22',10),(218,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"customer/detail\",\"createTime\":\"2023-11-21 10:42:56\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2037,\"menuName\":\"客户详情\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2021,\"path\":\"customer/detail\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-21 10:43:45',7),(219,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"customer/detail\",\"createTime\":\"2023-11-21 10:42:56\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2037,\"menuName\":\"客户详情\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2021,\"path\":\"customer/detail\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-21 10:44:37',8),(220,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin',NULL,'/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:28:01\",\"noticeContent\":\"<p>111</p>\",\"noticeId\":10,\"noticeTitle\":\"test公告\",\"noticeType\":\"1\",\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 10:54:05',52),(221,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin',NULL,'/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-11-12 21:29:16\",\"noticeContent\":\"<p>这是一条测试公告，看到这条公告说明通知系统正常运行了！</p>\",\"noticeId\":11,\"noticeTitle\":\"测试公告\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 10:59:43',7),(222,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-10-23 19:31:43\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@163.com\",\"loginDate\":\"2023-11-22 20:38:57\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"无界\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:02:04',55),(223,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通知公告\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"notice\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:06:00',17),(224,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-11-25 11:06:00\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2038,\"menuName\":\"通知公告\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:06:21',9),(225,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2023-10-23 19:31:43\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":2038,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:06:29',7),(226,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无界\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:08:34',18),(227,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/101','127.0.0.1','内网IP','{}','{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}',0,NULL,'2023-11-25 11:08:41',4),(228,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/103','127.0.0.1','内网IP','{}','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2023-11-25 11:08:44',6),(229,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/104','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:08:47',21),(230,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/105','127.0.0.1','内网IP','{}','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2023-11-25 11:08:49',6),(231,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/106','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:08:51',8),(232,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/108','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:08:53',15),(233,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/109','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:08:55',13),(234,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:08:57',15),(235,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"总部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"无界\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:09:39',29),(236,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/102','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:09:42',13),(237,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"总部门\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:09:52',20),(238,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"总部门\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"无界\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-11-25 11:09:57',22);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2023-10-23 19:31:43','',NULL,''),(2,'se','项目经理',2,'0','admin','2023-10-23 19:31:43','',NULL,''),(3,'hr','人力资源',3,'0','admin','2023-10-23 19:31:43','',NULL,''),(4,'user','普通员工',4,'0','admin','2023-10-23 19:31:43','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2023-10-23 19:31:43','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2023-10-23 19:31:43','admin','2023-11-12 21:30:06','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','无界','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-11-25 11:04:57','admin','2023-10-23 19:31:43','','2023-11-25 11:04:56','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$ARCV.BbeOU1OnRW7qgwIFeXa0gKl8MPHmxdCy5OXQyAfHUrTZNUea','0','0','127.0.0.1','2023-11-12 21:30:12','admin','2023-10-23 19:31:43','admin','2023-11-12 21:30:12','测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='在线用户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
INSERT INTO `sys_user_online` VALUES ('0a5ac24f-9dc4-42c7-bc53-309213580fc8','admin','研发部门','127.0.0.1','内网IP','Chrome 11','Windows 10','on_line','2023-10-22 21:36:38','2023-10-22 21:36:43',1800000);
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_custom`
--

DROP TABLE IF EXISTS `t_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_custom` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL COMMENT '客户姓名',
  `phone` varchar(255) NOT NULL COMMENT '电话',
  `address` varchar(1024) DEFAULT NULL COMMENT '地址',
  `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_custom`
--

LOCK TABLES `t_custom` WRITE;
/*!40000 ALTER TABLE `t_custom` DISABLE KEYS */;
INSERT INTO `t_custom` VALUES (1,'test2','13915944260',NULL,'0','admin','2023-11-03 10:42:29','admin','2023-11-03 10:44:45'),(2,'test','13915947262','333','0','admin','2023-11-03 11:44:19','admin','2023-11-04 00:40:01');
/*!40000 ALTER TABLE `t_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_file_info`
--

DROP TABLE IF EXISTS `t_file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_file_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `custom_id` bigint DEFAULT NULL COMMENT '客户ID',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小(byte)',
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件服务器存储绝对路径',
  `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='上传文件信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_file_info`
--

LOCK TABLES `t_file_info` WRITE;
/*!40000 ALTER TABLE `t_file_info` DISABLE KEYS */;
INSERT INTO `t_file_info` VALUES (1,1,'你好','png',NULL,'http://127.0.0.1:8080/profile/upload/2023/11/02/1_20231102221100A001.xlsx','0',NULL,NULL,NULL,NULL),(2,2,'vi_vim键盘图','png',NULL,'http://localhost:8080/profile/upload/2023/11/03/vi_vim键盘图_20231103224412A014.png','0',NULL,NULL,NULL,NULL),(3,2,'木叶狐2.0','png',NULL,'http://localhost:8080/profile/upload/2023/11/04/木叶狐2.0_20231104144446A001.png','0','admin','2023-11-04 14:44:47',NULL,NULL),(4,1,'你好','png',NULL,'http://127.0.0.1:8080/profile/upload/2023/11/02/1_20231102221100A001.xlsx','0','admin','2023-11-06 14:34:25',NULL,NULL),(5,1,'你好','png',10024,'http://127.0.0.1:8080/profile/upload/2023/11/02/1_20231102221100A001.xlsx','0','admin','2023-11-06 15:06:56',NULL,NULL),(6,1,'你好','png',10024,'http://127.0.0.1:8080/profile/upload/2023/11/02/1_20231102221100A001.xlsx','0','admin','2023-11-08 16:45:59',NULL,NULL),(7,1,'你好222','png',10024,'http://127.0.0.1:8080/profile/upload/2023/11/02/1_20231102221100A001.xlsx','0','admin','2023-11-08 17:42:18',NULL,NULL),(8,1,'你好222','png',10024,'http://127.0.0.1:8080/profile/upload/2023/11/02/1_20231102221100A001.xlsx','0','admin','2023-11-08 17:45:14',NULL,NULL),(9,1,'你好222','png',NULL,'http://127.0.0.1:8080/profile/upload/2023/11/02/1_20231102221100A001.xlsx','0','admin','2023-11-10 15:53:22',NULL,NULL);
/*!40000 ALTER TABLE `t_file_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-25 11:14:31
