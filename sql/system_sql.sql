drop table if exists n_customer;
CREATE TABLE `n_customer` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
                            `name` varchar(255) NOT NULL COMMENT '客户姓名',
                            `contract_phone` varchar(255) NOT NULL COMMENT '联系电话',
                            `contract_address` varchar(1024) DEFAULT NULL COMMENT '联系地址',
							`type` char(1) DEFAULT '0' COMMENT '客户类别，0联系人，1案源人，2服务成员',
                            `bank_username` varchar(255) COMMENT '银行信息',
                            `bank_name` varchar(255) COMMENT '开户行',
                            `bank_account` varchar(255) COMMENT '银行账号',
                            `tax_name` varchar(255) COMMENT '名称/单位名称',
                            `tax_number` varchar(255) COMMENT '纳税人识别号',
                            `office_phone` varchar(255) COMMENT '单位电话',
                            `office_address` varchar(255) COMMENT '单位地址',
                            `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='客户信息';

drop table if exists n_contract;
CREATE TABLE `n_contract` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
							`customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
							`state` char(1) DEFAULT '0' COMMENT '合同状态，0待审核，1审核通过',
                            `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='合同信息';

drop table if exists n_finance;
CREATE TABLE `n_finance` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
							`contract_id` bigint(20) DEFAULT NULL COMMENT '合同ID',
                            `type` char(1) DEFAULT NULL COMMENT '类别，0付款，1收款',
                            `paypeople` varchar(64) COMMENT '付款/收款方',
                            `count` bigint(20) DEFAULT 0 COMMENT '金额', 
							`state` char(1) DEFAULT '0' COMMENT '财务状态，0未收/付款，1已收/付款，2已开票',
                            `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='合同信息';

drop table if exists n_file_info;
CREATE TABLE `n_file_info` (
                               `file_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
							   `use_type` varchar(2) COMMENT '文件关联内容类型，1客户，2合同，3财务，4案件，5知识',
                               `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
							   `contract_id` bigint(20) DEFAULT NULL COMMENT '合同ID',
                               `finance_id` bigint(20) DEFAULT NULL COMMENT '财务ID',
                               `case_id` bigint(20) DEFAULT NULL COMMENT '案件ID',
                               `knowledge_id` bigint(20) DEFAULT NULL COMMENT '知识ID',
                               `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
                               `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
                               `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小(byte)',
                               `file_path` varchar(255) DEFAULT NULL COMMENT '文件服务器存储绝对路径',
                               `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
                               `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                               `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                               PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='上传文件信息';

drop table if exists n_knowledge;
CREATE TABLE `n_knowledge` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
                            `title` varchar(255) DEFAULT '' COMMENT '知识标题',
                            `secret_type` char(1) COMMENT '初始隐私类别，0仅自己，1部门可见，2所有人可见',
                            `origin` char(1) COMMENT '来源，0内部，1外部',
                            `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='知识信息';

drop table if exists n_share;
CREATE TABLE `n_knowledge` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
                            `knowledge_id` BIGINT(20) COMMENT '知识id',
                            `shared_id` BIGINT(20) COMMENT '被分享人的ID',
                            `del` char(1) DEFAULT '0' COMMENT '删除标记，1已删除',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='分享信息';



