/*
MySQL Backup
Source Server Version: 5.6.17
Source Database: xiaowei
Date: 2016/9/28 14:29:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `xiaowei_contact`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_contact`;
CREATE TABLE `xiaowei_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `letter` varchar(50) NOT NULL DEFAULT '' COMMENT '拼音',
  `company` varchar(30) NOT NULL DEFAULT '' COMMENT '公司',
  `dept` varchar(20) NOT NULL DEFAULT '' COMMENT '部门',
  `position` varchar(20) NOT NULL DEFAULT '' COMMENT '职位',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '办公电话',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '移动电话',
  `website` varchar(50) NOT NULL DEFAULT '' COMMENT '网站',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '即时通讯',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `remark` text COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='think_user_info';

-- ----------------------------
--  Table structure for `xiaowei_customer`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_customer`;
CREATE TABLE `xiaowei_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `letter` varchar(50) NOT NULL DEFAULT '' COMMENT '拼音',
  `biz_license` varchar(30) NOT NULL DEFAULT '' COMMENT '营业许可',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '简称',
  `contact` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件地址',
  `office_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '办公电话',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '移动电话',
  `fax` varchar(20) NOT NULL DEFAULT '' COMMENT '传真',
  `salesman` varchar(50) NOT NULL DEFAULT '' COMMENT '业务员',
  `im` varchar(20) NOT NULL DEFAULT '' COMMENT '即时通讯',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `remark` text COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `payment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_dept`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_dept`;
CREATE TABLE `xiaowei_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `dept_no` varchar(20) NOT NULL DEFAULT '' COMMENT '部门编号',
  `dept_grade_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门等级ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '简称',
  `sort` varchar(20) NOT NULL DEFAULT '' COMMENT '排序',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `company_id` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_dept_grade`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_dept_grade`;
CREATE TABLE `xiaowei_dept_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_no` varchar(10) NOT NULL DEFAULT '' COMMENT '部门级别编码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` varchar(10) NOT NULL DEFAULT '' COMMENT '排序',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_doc`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_doc`;
CREATE TABLE `xiaowei_doc` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_duty`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_duty`;
CREATE TABLE `xiaowei_duty` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `duty_no` varchar(20) NOT NULL DEFAULT '' COMMENT '职责编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` varchar(20) NOT NULL DEFAULT '' COMMENT '排序',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_file`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_file`;
CREATE TABLE `xiaowei_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
--  Table structure for `xiaowei_finance`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_finance`;
CREATE TABLE `xiaowei_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(10) DEFAULT NULL COMMENT '单据编号',
  `remark` varchar(255) DEFAULT NULL,
  `input_date` date DEFAULT NULL COMMENT '录入日期',
  `account_id` int(11) DEFAULT NULL COMMENT '帐号ID',
  `account_name` varchar(20) DEFAULT NULL COMMENT '帐号名',
  `income` int(11) DEFAULT NULL COMMENT '收入',
  `payment` int(11) DEFAULT NULL COMMENT '支出',
  `amount` int(11) DEFAULT NULL COMMENT '合计',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `partner` varchar(50) DEFAULT NULL COMMENT '来往处',
  `actor_name` varchar(10) DEFAULT NULL COMMENT '经办人',
  `user_id` int(11) DEFAULT NULL COMMENT '登陆人',
  `user_name` varchar(10) DEFAULT NULL COMMENT '登录名',
  `create_time` int(11) DEFAULT NULL COMMENT '创建日期',
  `update_time` int(11) DEFAULT NULL COMMENT '更新日期',
  `add_file` varchar(255) DEFAULT NULL COMMENT '附件',
  `doc_type` tinyint(3) DEFAULT NULL COMMENT '类型',
  `is_del` tinyint(3) DEFAULT '0' COMMENT '删除标记',
  `related_account_id` int(11) DEFAULT NULL COMMENT '相关帐号ID',
  `related_account_name` varchar(20) DEFAULT NULL COMMENT '相关帐号名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_finance_account`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_finance_account`;
CREATE TABLE `xiaowei_finance_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '帐号名称',
  `bank` varchar(20) DEFAULT NULL COMMENT '银行',
  `no` varchar(50) DEFAULT NULL COMMENT '银行帐号',
  `init` int(11) DEFAULT NULL COMMENT '初始帐号',
  `balance` int(11) DEFAULT NULL COMMENT '余额',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `is_del` tinyint(3) DEFAULT '0' COMMENT '删除标记',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_flow`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_flow`;
CREATE TABLE `xiaowei_flow` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `confirm` varchar(200) NOT NULL DEFAULT '' COMMENT '裁决数据',
  `confirm_name` text NOT NULL COMMENT '裁决显示内容',
  `consult` varchar(200) NOT NULL DEFAULT '' COMMENT '协商数据',
  `consult_name` text NOT NULL COMMENT '协商显示内容',
  `refer` varchar(200) NOT NULL DEFAULT '' COMMENT '抄送数据',
  `refer_name` text NOT NULL COMMENT '抄送显示内容',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '流程类型',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `emp_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `dept_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门ID',
  `dept_name` varchar(20) NOT NULL DEFAULT '' COMMENT '部门名称',
  `create_date` varchar(10) NOT NULL DEFAULT '' COMMENT '创建日期',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `step` int(11) NOT NULL DEFAULT '0' COMMENT '目前阶段状态',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `udf_data` text COMMENT '用户自定义数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_flow_log`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_flow_log`;
CREATE TABLE `xiaowei_flow_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL DEFAULT '0' COMMENT '流程ID',
  `emp_no` varchar(20) NOT NULL DEFAULT '' COMMENT '员工编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(20) DEFAULT '' COMMENT '用户名称',
  `step` int(11) NOT NULL DEFAULT '0' COMMENT '当前步骤',
  `result` int(11) DEFAULT NULL COMMENT '审批结果',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `comment` text COMMENT '意见',
  `is_read` tinyint(3) NOT NULL DEFAULT '0' COMMENT '已读',
  `from` varchar(20) DEFAULT NULL COMMENT '传阅人',
  `is_del` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_flow_type`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_flow_type`;
CREATE TABLE `xiaowei_flow_type` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(20) NOT NULL DEFAULT '' COMMENT '分组',
  `doc_no_format` varchar(50) NOT NULL DEFAULT '' COMMENT '文档编码格式',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `short` varchar(20) NOT NULL DEFAULT '' COMMENT '简称',
  `content` text NOT NULL COMMENT '内容',
  `confirm` varchar(100) NOT NULL DEFAULT '' COMMENT '裁决数据',
  `confirm_name` text NOT NULL COMMENT '裁决显示内容',
  `consult` varchar(100) NOT NULL DEFAULT '' COMMENT '协商数据',
  `consult_name` text NOT NULL COMMENT '协商显示内容',
  `refer` varchar(100) NOT NULL DEFAULT '' COMMENT '抄送数据',
  `refer_name` text NOT NULL COMMENT '抄送显示内容',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_edit` tinyint(3) NOT NULL DEFAULT '0' COMMENT '可编辑标记',
  `is_lock` tinyint(3) NOT NULL DEFAULT '0' COMMENT '锁定标记',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `request_duty` int(11) DEFAULT NULL COMMENT '申请权限',
  `report_duty` int(11) DEFAULT NULL COMMENT '报告权限',
  `udf_tpl` varchar(20) DEFAULT NULL,
  `is_show` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_form`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_form`;
CREATE TABLE `xiaowei_form` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `udf_data` text COMMENT '自定义字段数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_group`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_group`;
CREATE TABLE `xiaowei_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `is_public` tinyint(3) DEFAULT NULL COMMENT '是否公开',
  `remark` text COMMENT '备注',
  `user_id` int(11) DEFAULT NULL COMMENT '登陆人ID',
  `user_name` varchar(20) DEFAULT NULL COMMENT '登录用户名称',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_group_user`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_group_user`;
CREATE TABLE `xiaowei_group_user` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_info`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_info`;
CREATE TABLE `xiaowei_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(20) NOT NULL DEFAULT '' COMMENT '文档编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '分类',
  `is_sign` tinyint(3) DEFAULT '0' COMMENT '是否需要签收',
  `is_public` tinyint(3) DEFAULT NULL COMMENT '是否公开',
  `scope_user_id` text COMMENT '发布范围ID',
  `scope_user_name` text COMMENT '发布范围名称',
  `add_file` varchar(200) NOT NULL DEFAULT '' COMMENT '附件',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '登陆人ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '登陆人名称',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `dept_name` varchar(20) DEFAULT NULL COMMENT '部门名称',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_info_scope`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_info_scope`;
CREATE TABLE `xiaowei_info_scope` (
  `info_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `info_id` (`info_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_info_sign`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_info_sign`;
CREATE TABLE `xiaowei_info_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_id` int(11) NOT NULL DEFAULT '0' COMMENT '信息ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '登录用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '登录用户名称',
  `is_sign` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否签收',
  `sign_time` int(11) unsigned DEFAULT NULL COMMENT '签收时间',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `dept_name` varchar(20) DEFAULT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_mail`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_mail`;
CREATE TABLE `xiaowei_mail` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `folder` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹',
  `mid` varchar(200) DEFAULT NULL COMMENT '邮件唯一id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `add_file` varchar(200) DEFAULT NULL COMMENT '附件',
  `from` varchar(255) DEFAULT NULL COMMENT '发件人',
  `to` varchar(255) DEFAULT NULL COMMENT '收件人',
  `reply_to` varchar(255) DEFAULT NULL COMMENT '回复到',
  `cc` varchar(255) DEFAULT NULL COMMENT '抄送',
  `read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '已读',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_mail_account`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_mail_account`;
CREATE TABLE `xiaowei_mail_account` (
  `id` mediumint(6) NOT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '邮件地址',
  `mail_name` varchar(50) NOT NULL DEFAULT '' COMMENT '邮件显示名称',
  `pop3svr` varchar(50) NOT NULL DEFAULT '' COMMENT 'pop服务器',
  `smtpsvr` varchar(50) NOT NULL DEFAULT '' COMMENT 'smtp服务器',
  `mail_id` varchar(50) NOT NULL DEFAULT '' COMMENT '邮件ID',
  `mail_pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '邮件密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='think_user_info';

-- ----------------------------
--  Table structure for `xiaowei_mail_organize`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_mail_organize`;
CREATE TABLE `xiaowei_mail_organize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `sender_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认发件人',
  `sender_option` int(11) NOT NULL DEFAULT '0' COMMENT '发件人选项',
  `sender_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认发件人值',
  `domain_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认域名',
  `domain_option` int(11) NOT NULL DEFAULT '0' COMMENT '域名选项',
  `domain_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认域名值',
  `recever_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认收件人',
  `recever_option` int(11) NOT NULL DEFAULT '0' COMMENT '收件人选项',
  `recever_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认收信人值',
  `title_check` int(11) NOT NULL DEFAULT '0' COMMENT '是否确认标题',
  `title_option` int(11) NOT NULL DEFAULT '0' COMMENT '确认标题选项',
  `title_key` varchar(50) NOT NULL DEFAULT '' COMMENT '确认标题值',
  `to` int(11) NOT NULL DEFAULT '0' COMMENT '移动到',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_message`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_message`;
CREATE TABLE `xiaowei_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '内容',
  `add_file` varchar(200) DEFAULT NULL COMMENT '附件',
  `sender_id` int(11) DEFAULT NULL COMMENT '发送人',
  `sender_name` varchar(20) DEFAULT NULL COMMENT '发送人名称',
  `receiver_id` int(11) DEFAULT NULL COMMENT '接收人',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '接收人名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `owner_id` int(11) DEFAULT NULL COMMENT '拥有者',
  `is_del` tinyint(3) DEFAULT '0' COMMENT '删除标记',
  `is_read` tinyint(3) DEFAULT '0' COMMENT '是否已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_node`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_node`;
CREATE TABLE `xiaowei_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT 'URL地址',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `sub_folder` varchar(20) DEFAULT NULL COMMENT '子文件夹',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` varchar(20) DEFAULT NULL COMMENT '排序',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `badge_function` varchar(50) DEFAULT NULL COMMENT '统计函数',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `status` (`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_position`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_position`;
CREATE TABLE `xiaowei_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_no` varchar(10) NOT NULL DEFAULT '' COMMENT '编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` varchar(10) NOT NULL DEFAULT '' COMMENT '排序',
  `is_del` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_push`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_push`;
CREATE TABLE `xiaowei_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `data` text NOT NULL,
  `status` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_role`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_role`;
CREATE TABLE `xiaowei_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `pid` smallint(6) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` varchar(20) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`) USING BTREE,
  KEY `ename` (`sort`) USING BTREE,
  KEY `status` (`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_role_duty`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_role_duty`;
CREATE TABLE `xiaowei_role_duty` (
  `role_id` smallint(6) unsigned NOT NULL,
  `duty_id` smallint(6) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_role_node`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_role_node`;
CREATE TABLE `xiaowei_role_node` (
  `role_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `write` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_role_user`;
CREATE TABLE `xiaowei_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_schedule`;
CREATE TABLE `xiaowei_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `content` text,
  `location` varchar(50) DEFAULT '',
  `priority` int(11) DEFAULT NULL,
  `actor` varchar(200) DEFAULT '',
  `user_id` int(11) DEFAULT '0',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `add_file` varchar(200) DEFAULT '',
  `is_del` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_supplier`;
CREATE TABLE `xiaowei_supplier` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `letter` varchar(50) DEFAULT '',
  `short` varchar(30) DEFAULT '',
  `account` varchar(20) DEFAULT '',
  `tax_no` varchar(20) DEFAULT '',
  `payment` varchar(20) DEFAULT NULL,
  `contact` varchar(20) NOT NULL DEFAULT '',
  `office_tel` varchar(20) DEFAULT NULL,
  `mobile_tel` varchar(20) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `im` varchar(20) DEFAULT '',
  `address` varchar(50) DEFAULT '',
  `user_id` int(11) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` text,
  `fax` varchar(255) DEFAULT NULL,
  `user_name` varchar(21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_system_config`;
CREATE TABLE `xiaowei_system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `val` varchar(255) DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `sort` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_system_folder`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_system_folder`;
CREATE TABLE `xiaowei_system_folder` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `controller` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `admin` varchar(200) NOT NULL,
  `write` varchar(200) NOT NULL,
  `read` varchar(200) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_system_log`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_system_log`;
CREATE TABLE `xiaowei_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `data` float DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_system_tag`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_system_tag`;
CREATE TABLE `xiaowei_system_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_system_tag_data`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_system_tag_data`;
CREATE TABLE `xiaowei_system_tag_data` (
  `row_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) NOT NULL DEFAULT '',
  KEY `row_id` (`row_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_task`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_task`;
CREATE TABLE `xiaowei_task` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `task_no` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `executor` varchar(200) DEFAULT NULL,
  `add_file` varchar(255) DEFAULT NULL,
  `expected_time` datetime DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `user_name` varchar(20) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `update_user_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `is_del` tinyint(3) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `udf_data` text,
  `company_id` int(11) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_task_log`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_task_log`;
CREATE TABLE `xiaowei_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  `assigner` int(11) DEFAULT NULL COMMENT '分配任务的人',
  `executor` varchar(20) DEFAULT NULL COMMENT '执行人',
  `executor_name` varchar(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `plan_time` datetime DEFAULT NULL,
  `transactor_name` varchar(20) DEFAULT NULL,
  `transactor` int(11) DEFAULT NULL COMMENT '由谁处理的',
  `finish_rate` tinyint(3) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `feed_back` text,
  `add_file` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_todo`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_todo`;
CREATE TABLE `xiaowei_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `end_date` varchar(10) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `add_file` varchar(200) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_udf_field`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_udf_field`;
CREATE TABLE `xiaowei_udf_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `row_type` int(11) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `msg` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `validate` varchar(20) DEFAULT NULL,
  `controller` varchar(20) DEFAULT NULL,
  `is_del` tinyint(3) DEFAULT '0',
  `config` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_user`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_user`;
CREATE TABLE `xiaowei_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL,
  `letter` varchar(10) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` int(8) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `duty` varchar(2000) NOT NULL,
  `office_tel` varchar(20) NOT NULL,
  `mobile_tel` varchar(20) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `openid` varchar(50) DEFAULT NULL,
  `westatus` tinyint(3) DEFAULT '0',
  `company_id` int(8) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`emp_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_user_config`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_user_config`;
CREATE TABLE `xiaowei_user_config` (
  `id` int(11) NOT NULL DEFAULT '0',
  `home_sort` varchar(255) DEFAULT NULL,
  `list_rows` int(11) DEFAULT '20',
  `readed_info` text,
  `push_web` varchar(255) DEFAULT NULL,
  `push_wechat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_user_folder`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_user_folder`;
CREATE TABLE `xiaowei_user_folder` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `controller` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_user_tag`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_user_tag`;
CREATE TABLE `xiaowei_user_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` varchar(20) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_user_tag_data`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_user_tag_data`;
CREATE TABLE `xiaowei_user_tag_data` (
  `row_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `controller` varchar(20) NOT NULL DEFAULT '',
  KEY `row_id` (`row_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xiaowei_work_log`
-- ----------------------------
DROP TABLE IF EXISTS `xiaowei_work_log`;
CREATE TABLE `xiaowei_work_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(20) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `content` text,
  `plan` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_del` tinyint(3) NOT NULL DEFAULT '0',
  `add_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `xiaowei_dept` VALUES ('1','0','A2','18','小微企业','小微','','','0','1'), ('2','29','YYB','18','运营部','运营','5','','0','29'), ('3','29','XXB','18','IT部','IT','4','','0','29'), ('5','29','ZJB','20','总经办','总经','1','','0','29'), ('6','29','GLB','18','管理部','管理','2','','0','29'), ('7','29','XSB','18','销售部','销售','3','','0','29'), ('8','29','CWB','18','财务部','财务','2','','0','29'), ('21','29','XSB','18','采购部','采购','3','','0','29'), ('23','6','HR','16','人事科','人事','','','0','29'), ('24','6','ZWK','16','总务科','总务','','','0','29'), ('25','8','KJK','16','会计科','会计','','','0','29'), ('26','8','JRK','16','金融科','金融','','','0','29'), ('29','1','','18','企业A','A','','','0','29'), ('30','1','','18','企业B','B','','','0','30'), ('33','30','','20','董事会','会','1','','0','30'), ('34','29','','20','物业部','物业','','','0','29'), ('35','34','','19','水电组','水电','','','0','29'), ('36','34','','19','安防组','安防','','','0','29'), ('37','35','','16','水电1','水电1','','','0','29');
INSERT INTO `xiaowei_dept_grade` VALUES ('16','DG1','科','1','0'), ('18','DG2','部','4','0'), ('19','','处','2','0'), ('20','','局','3','0');
INSERT INTO `xiaowei_duty` VALUES ('14','P001','普通员工','','0',''), ('15','S001','财务','','0',''), ('16','W001','人事','','0',''), ('17','','报修','','0',''), ('18','','施工','','0',''), ('19','','汇报','','0',''), ('20','','审核','','0',''), ('21','','派工','','0',''), ('22','','验收','','0','');
INSERT INTO `xiaowei_file` VALUES ('1','Desert.jpg','560b467fd929c.jpg','popup/2015-09/','jpg','image/jpeg','845941','ba45c8f60456a672e003a875e469d0eb','30420d1a9afb2bcb60335812569af4435a59ce17','0','','1443579519'), ('2','Chrysanthemum.jpg','560b4f5e8c790.jpg','popup/2015-09/','jpg','image/jpeg','879394','076e3caed758a1c18c91a0e9cae3368f','f5f8ad26819a471318d24631fa5055036712a87e','0','','1443581789'), ('3','Desert.jpg','560b5d2510608.jpg','popup/2015-09/','jpg','image/jpeg','845941','ba45c8f60456a672e003a875e469d0eb','30420d1a9afb2bcb60335812569af4435a59ce17','0','','1443585316'), ('4','Chrysanthemum.jpg','560b5d43b0f61.jpg','popup/2015-09/','jpg','image/jpeg','879394','076e3caed758a1c18c91a0e9cae3368f','f5f8ad26819a471318d24631fa5055036712a87e','0','','1443585347'), ('5','Lighthouse.jpg','560b5da4b638e.jpg','popup/2015-09/','jpg','image/jpeg','561276','8969288f4245120e7c3870287cce0ff3','1b4605b0e20ceccf91aa278d10e81fad64e24e27','0','','1443585444'), ('6','Penguins.jpg','560b5e45cfaa5.jpg','popup/2015-09/','jpg','image/jpeg','777835','9d377b10ce778c4938b3c7e2c63a229a','df7be9dc4f467187783aca68c7ce98e4df2172d0','0','','1443585605'), ('7','Tulips.jpg','560b5e570aa3c.jpg','popup/2015-09/','jpg','image/jpeg','620888','fafa5efeaf3cbe3b23b2748d13e629a1','54c2f1a1eb6f12d681a5c7078421a5500cee02ad','0','','1443585622'), ('8','Koala.jpg','56172768f1380.jpg','popup/2015-10/','jpg','image/jpeg','780831','2b04df3ecc1d94afddff082d139c6f15','9c3dcb1f9185a314ea25d51aed3b5881b32f420c','0','','1444357992'), ('9','Koala.jpg','561727b252934.jpg','popup/2015-10/','jpg','image/jpeg','780831','2b04df3ecc1d94afddff082d139c6f15','9c3dcb1f9185a314ea25d51aed3b5881b32f420c','0','','1444358066'), ('10','Lighthouse.jpg','56172803a252f.jpg','popup/2015-10/','jpg','image/jpeg','561276','8969288f4245120e7c3870287cce0ff3','1b4605b0e20ceccf91aa278d10e81fad64e24e27','0','','1444358147'), ('11','Koala.jpg','561728ab3bed8.jpg','popup/2015-10/','jpg','image/jpeg','780831','2b04df3ecc1d94afddff082d139c6f15','9c3dcb1f9185a314ea25d51aed3b5881b32f420c','0','','1444358314'), ('12','Penguins.jpg','5617291c9eadf.jpg','popup/2015-10/','jpg','image/jpeg','777835','9d377b10ce778c4938b3c7e2c63a229a','df7be9dc4f467187783aca68c7ce98e4df2172d0','0','','1444358428'), ('13','Hydrangeas.jpg','5617294ccdbd3.jpg','popup/2015-10/','jpg','image/jpeg','595284','bdf3bf1da3405725be763540d6601144','d997e1c37edc05ad87d03603e32ad495ee2cfce1','0','','1444358476'), ('14','Jellyfish.jpg','562f2020a06ed.jpg','task/2015-10/','jpg','image/jpeg','775702','5a44c7ba5bbe4ec867233d67e4806848','3b15be84aff20b322a93c0b9aaa62e25ad33b4b4','0','','1445928991'), ('15','Desert.jpg','562f21cb84756.jpg','task/2015-10/','jpg','image/jpeg','845941','ba45c8f60456a672e003a875e469d0eb','30420d1a9afb2bcb60335812569af4435a59ce17','0','','1445929418'), ('16','Penguins.jpg','562f21cd9a75d.jpg','task/2015-10/','jpg','image/jpeg','777835','9d377b10ce778c4938b3c7e2c63a229a','df7be9dc4f467187783aca68c7ce98e4df2172d0','0','','1445929421'), ('17','Penguins.jpg','5642a2bc803e2.jpg','task/2015-11/','jpg','image/jpeg','777835','9d377b10ce778c4938b3c7e2c63a229a','df7be9dc4f467187783aca68c7ce98e4df2172d0','0','','1447207611'), ('18','UC_Photo_001.jpg','5653c2f4071d7.jpg','worklog/2015-11/','jpg','image/jpeg','50109','d674e578ce819ce164ee00e0f84991ac','f6fcda0358caab54ae01f71dd9af8223beb2bf8f','0','','1448329971'), ('19','UC_Photo_002.jpg','5653c3b18c02e.jpg','task/2015-11/','jpg','image/jpeg','49013','43e5eaa173b97e3299ecf9ba74f78847','c44d37c7b76f506c40f3cf3405402161658e9652','0','','1448330161'), ('20','1448330709620.jpg','5653c6100e95d.jpg','task/2015-11/','jpg','image/jpeg','1483221','caac786fbe07eca78d36c381e7ac890a','0f8fef55aecee58b28ba19435ae0b35c99c629b5','0','','1448330766'), ('21','1448331890362.jpg','5653cabb6c063.jpg','task/2015-11/','jpg','image/jpeg','1277909','9b02c44f9daf01b7563d1fbf25c2014b','924e9a22311d7767bb186a3fb53e64222c2672cd','0','','1448331962'), ('22','IMG_20151120_140227.jpg','5653cae6300c4.jpg','task/2015-11/','jpg','image/jpeg','1962581','2580655b3f45a2164e05d419452bfba9','e57a766fc3dc87ea824071d9460fd229d64bc71f','0','','1448332005'), ('23','capturedvideo.MOV','5653ce1a7bfe7.MOV','task/2015-11/','MOV','video/quicktime','1173401','0ed354baec8ab27ef641d95f138d18a1','9a4d25c7b78cc41dc5f62f063b132e49e0f81359','0','','1448332824'), ('24','s7ic.ico','5653d958beaea.ico','flow/2015-11/','ico','image/x-icon','55614','f720b03b4974930ca539912ca4d4566d','c259984390e94de16de625b3d500d5d118fd8767','0','','1448335704'), ('25','mmexport1448110020582.jpg','56544c174e237.jpg','task/2015-11/','jpg','image/jpeg','93521','32a2c8345bf56910a8d765acb6d3a3a6','841df1336c9f09a80447f6f5694188649507d9c3','0','','1448365079'), ('26','Chrysanthemum.jpg','56569754eb62e.jpg','task/2015-11/','jpg','image/jpeg','879394','076e3caed758a1c18c91a0e9cae3368f','f5f8ad26819a471318d24631fa5055036712a87e','0','','1448515412'), ('27','VID_20151130_143120.mp4','565bed8fc6bf7.mp4','task/2015-11/','mp4','video/mp4','706480','bab9dea25d72e7769fcdf903ed3af45a','120f9765a3dbffd36b30c126a5c77ea516694d93','0','','1448865166'), ('28','VID_20151201_090339.mp4','565cf245527ed.mp4','task/2015-12/','mp4','video/mp4','821416','28d95946c815c35dc2deb686ba8d1c8a','b1114e58c0b68d7275404cd4499f4420ead47586','0','','1448931907'), ('29','Koala.jpg','565cf4b569c69.jpg','task/2015-12/','jpg','image/jpeg','780831','2b04df3ecc1d94afddff082d139c6f15','9c3dcb1f9185a314ea25d51aed3b5881b32f420c','0','','1448932533'), ('30','Desert.jpg','565cf4b7630c4.jpg','task/2015-12/','jpg','image/jpeg','845941','ba45c8f60456a672e003a875e469d0eb','30420d1a9afb2bcb60335812569af4435a59ce17','0','','1448932535'), ('31','Tulips.jpg','565cf4d2ebe69.jpg','task/2015-12/','jpg','image/jpeg','620888','fafa5efeaf3cbe3b23b2748d13e629a1','54c2f1a1eb6f12d681a5c7078421a5500cee02ad','0','','1448932562'), ('32','Penguins.jpg','565cf4d4cda7a.jpg','task/2015-12/','jpg','image/jpeg','777835','9d377b10ce778c4938b3c7e2c63a229a','df7be9dc4f467187783aca68c7ce98e4df2172d0','0','','1448932564'), ('33','Hydrangeas.jpg','565cf4eb5c80b.jpg','task/2015-12/','jpg','image/jpeg','595284','bdf3bf1da3405725be763540d6601144','d997e1c37edc05ad87d03603e32ad495ee2cfce1','0','','1448932586'), ('34','Desert.jpg','565cf4ed21d24.jpg','task/2015-12/','jpg','image/jpeg','845941','ba45c8f60456a672e003a875e469d0eb','30420d1a9afb2bcb60335812569af4435a59ce17','0','','1448932588'), ('35','Tulips.jpg','565cf562821a4.jpg','task/2015-12/','jpg','image/jpeg','620888','fafa5efeaf3cbe3b23b2748d13e629a1','54c2f1a1eb6f12d681a5c7078421a5500cee02ad','0','','1448932706'), ('36','Koala.jpg','565cf8083ec0a.jpg','task/2015-12/','jpg','image/jpeg','780831','2b04df3ecc1d94afddff082d139c6f15','9c3dcb1f9185a314ea25d51aed3b5881b32f420c','0','','1448933383'), ('37','Lighthouse.jpg','565cf85301eba.jpg','task/2015-12/','jpg','image/jpeg','561276','8969288f4245120e7c3870287cce0ff3','1b4605b0e20ceccf91aa278d10e81fad64e24e27','0','','1448933458'), ('38','Hydrangeas.jpg','565cf941bcec1.jpg','task/2015-12/','jpg','image/jpeg','595284','bdf3bf1da3405725be763540d6601144','d997e1c37edc05ad87d03603e32ad495ee2cfce1','0','','1448933697'), ('39','Penguins.jpg','565cfb4b2126a.jpg','task/2015-12/','jpg','image/jpeg','777835','9d377b10ce778c4938b3c7e2c63a229a','df7be9dc4f467187783aca68c7ce98e4df2172d0','0','','1448934218'), ('40','Lighthouse.jpg','565cfb69ebc75.jpg','task/2015-12/','jpg','image/jpeg','561276','8969288f4245120e7c3870287cce0ff3','1b4605b0e20ceccf91aa278d10e81fad64e24e27','0','','1448934249'), ('41','Koala.jpg','565cfd21ab709.jpg','task/2015-12/','jpg','image/jpeg','780831','2b04df3ecc1d94afddff082d139c6f15','9c3dcb1f9185a314ea25d51aed3b5881b32f420c','0','','1448934689'), ('42','Hydrangeas.jpg','565cfda3efa52.jpg','task/2015-12/','jpg','image/jpeg','595284','bdf3bf1da3405725be763540d6601144','d997e1c37edc05ad87d03603e32ad495ee2cfce1','0','','1448934819'), ('43','Lighthouse.jpg','565cfe0f3bbb9.jpg','task/2015-12/','jpg','image/jpeg','561276','8969288f4245120e7c3870287cce0ff3','1b4605b0e20ceccf91aa278d10e81fad64e24e27','0','','1448934926'), ('44','Koala.jpg','565cff057ff8f.jpg','task/2015-12/','jpg','image/jpeg','780831','2b04df3ecc1d94afddff082d139c6f15','9c3dcb1f9185a314ea25d51aed3b5881b32f420c','0','','1448935173'), ('45','Penguins.jpg','565cff80c6543.jpg','task/2015-12/','jpg','image/jpeg','777835','9d377b10ce778c4938b3c7e2c63a229a','df7be9dc4f467187783aca68c7ce98e4df2172d0','0','','1448935296'), ('46','Hydrangeas.jpg','565cff8400510.jpg','task/2015-12/','jpg','image/jpeg','595284','bdf3bf1da3405725be763540d6601144','d997e1c37edc05ad87d03603e32ad495ee2cfce1','0','','1448935299'), ('47','VID_20151201_100611.mp4','565d0105ae013.mp4','task/2015-12/','mp4','video/mp4','22229078','b3af321714050a31d8631c53c42e2f71','08183e19d7328f099a85a657cc990c33ba29557b','0','','1448935684'), ('48','R20151201100655.aac','565d01175d6b6.aac','task/2015-12/','aac','video/3gpp','56695','67f4ee91139381ab4d4ebcea8053b3ef','e19717dbb5b90e48e45b28a91e6c0ac3bc4ee266','0','','1448935703'), ('49','VID_20151201_100923.mp4','565d01ab649f7.mp4','task/2015-12/','mp4','video/mp4','573508','bc13537849a7f611f608ba8eacc3d371','8be4133a83b9c2d35e01487067d611962b5802fc','0','','1448935850'), ('50','VID_20151201_100944.mp4','565d01c11929c.mp4','task/2015-12/','mp4','video/mp4','1151293','7dc9eaf6690dd3d192b64286e7ea9064','be71249257105138298f3ca0c6ca810ba366781f','0','','1448935871'), ('51','UC_Photo_003.jpg','565d029ce87f3.jpg','task/2015-12/','jpg','image/jpeg','49717','fe4550803a5fa4a560ee779d0bbb0d20','0d121e6fe7ec3a4843424b7f043c8d9fc464f806','0','','1448936092'), ('52','示例图片_01.jpg','565d031a2b115.jpg','task/2015-12/','jpg','image/jpeg','97609','e1a076c5b5c60c9a53110ebb7adc62ad','5c021e09c6599a148bd555a80a3d927f60c5fced','0','','1448936217'), ('53','示例图片_02.jpg','565d031a65982.jpg','task/2015-12/','jpg','image/jpeg','89100','7e6a2731829994afa36e1ed1397fd210','f72848e6bb39de5fa20080c3025fa4e21ec478b7','0','','1448936218'), ('54','示例图片_03.jpg','565d031a9f7ae.jpg','task/2015-12/','jpg','image/jpeg','86879','16448cd6ec7af958e948e07267798042','fd6d8d31c8dc583f083737a0c783eed5c75d912b','0','','1448936218'), ('55','capturedvideo.MOV','565d37eeab0f6.MOV','task/2015-12/','MOV','video/quicktime','471788','f400cbf4437f79d90b67709da9916f99','786a57a37bcadb3ca49339eda2c58649b25cb0e0','0','','1448949741'), ('56','周笔畅-片羽时光[68mtv.com].mp4','565d3fb96a311.mp4','task/2015-12/','mp4','video/mp4','25717622','a4dda66e164465d66f428b2f69cecf36','9c19a883db2ac7985fd6e5a10ff2e5ef316dfa54','0','','1448951737'), ('57','1449642426714.jpg','5668eb5a3618f.jpg','popup/2015-12/','jpg','image/jpeg','792939','aad85233f4971a687aba3c381ad4e3e2','b8bbc8196fe6887be767204ee530b6a1bbe7b4cc','0','','1449716568'), ('58','1449642426714.jpg','5668ebfa61412.jpg','task/2015-12/','jpg','image/jpeg','792939','aad85233f4971a687aba3c381ad4e3e2','b8bbc8196fe6887be767204ee530b6a1bbe7b4cc','0','','1449716729'), ('59','1450229284007.jpg','5670bebab1a8d.jpg','task/2015-12/','jpg','image/jpeg','755451','9e5e62ede1b73da6f2d2913947b8cc99','e47b39c4698f9635e3a6cf20f41c995f8b446845','0','','1450229433'), ('60','1450229491543.jpg','5670bf8bbeb88.jpg','task/2015-12/','jpg','image/jpeg','783351','42526f568745c41180baf6d1ebac4735','a59b58703de732195516741c06c7be2daf0a52d8','0','','1450229642'), ('61','IMG_20151018_103451.jpg','5670d9ef0b550.jpg','task/2015-12/','jpg','image/jpeg','3321146','1b8c53d44476890717d5884523a5d258','cd4b2f7e4849b46e7d5564f12e9a43a7c6ef97b3','0','','1450236398'), ('62','IMG_20151018_103451.jpg','5670da09dd16c.jpg','task/2015-12/','jpg','image/jpeg','3321146','1b8c53d44476890717d5884523a5d258','cd4b2f7e4849b46e7d5564f12e9a43a7c6ef97b3','0','','1450236425'), ('63','img-4ac0f91a2784d63e900ce075df','5670f4439df6e.jpg','task/2015-12/','jpg','image/jpeg','64661','c0902ffea2aefa4f211e808c565af335','530bb8c5ce0d8cdde7e59f36fb6ac495b01d99af','0','','1450243139'), ('64','Penguins.jpg','5671011ac1808.jpg','task/2015-12/','jpg','image/jpeg','777835','9d377b10ce778c4938b3c7e2c63a229a','df7be9dc4f467187783aca68c7ce98e4df2172d0','0','','1450246426'), ('65','img-1e1ca3f6a20940416ee1b99c66','567108ea5fec9.jpg','task/2015-12/','jpg','image/jpeg','71828','b5a0f8c4038f81682e90d8bccf3d632a','7bb3f0f6bf3c92f1e823630d3b9b85d6195d2b15','0','','1450248426'), ('66','img-1e1ca3f6a20940416ee1b99c66','567109b5b5dac.jpg','task/2015-12/','jpg','image/jpeg','71828','b5a0f8c4038f81682e90d8bccf3d632a','7bb3f0f6bf3c92f1e823630d3b9b85d6195d2b15','0','','1450248629'), ('67','2015-12-18_09.38.15.jpg','5673643314564.jpg','task/2015-12/','jpg','image/jpeg','2240340','212394b979f4fd9f82b9f4dad395ecbb','c25a638c59dfed88e0bc24c5d6364c8dd589348c','0','','1450402866');
INSERT INTO `xiaowei_flow` VALUES ('1','01','加个班','<p>加班申请</p>','001|','<span data=\"dept_23\" id=\"dept_23\"><nobr><b title=\"人事科<dept@group>\">人事科<dept@group></dept@group></b></nobr></span>','','','','','1','','2','001','张三','23','人事科','','1443581299','0','40','0','{\"56\":\"\"}'), ('2','002','灯泡坏了','<p>打发打发打发地方 顶顶顶顶</p>','007|007,010,012|','\r\n					<span data=\"emp_007\" id=\"emp_007\"><nobr><b title=\"安防主管/主管<>\">安防主管/主管&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"dept_36\" id=\"dept_36\"><nobr><b title=\"安防组\">安防组</b></nobr></span>				','012|','\r\n					<span data=\"emp_012\" id=\"emp_012\"><nobr><b title=\"安防2/办事员<>\">安防2/办事员&lt;&gt;</b></nobr></span>				','','\r\n									','2','','13','007','安防主管','36','安防组','','1445580828','0','40','0','{\"56\":\"二楼灯泡全坏了\",\"57\":\"审核中\"}'), ('3','002','水管坏了','<p>第三方斯蒂芬收到fs</p>','007|007,010,012|','\r\n					<span data=\"emp_007\" id=\"emp_007\"><nobr><b title=\"安防主管/主管<>\">安防主管/主管&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"dept_36\" id=\"dept_36\"><nobr><b title=\"安防组\">安防组</b></nobr></span>				','','\r\n									','','\r\n									','2','','16','011','水电2','35','水电组','','1445581504','0','40','0','{\"56\":\"水管坏了\",\"57\":\"审核中\"}'), ('4','002','水管灯泡坏了','<p>打发打发打发地方&nbsp;</p>','007|007,010,012|','\r\n					<span data=\"emp_007\" id=\"emp_007\"><nobr><b title=\"安防主管/主管<>\">安防主管/主管&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"dept_36\" id=\"dept_36\"><nobr><b title=\"安防组\">安防组</b></nobr></span>				','','\r\n									','','\r\n									','2','','16','011','水电2','35','水电组','','1445581708','0','40','0','{\"56\":\"水管灯泡坏了\",\"57\":\"审核中\"}'), ('5','002','空调电话坏了','<p>打发打发打发地方&nbsp;</p>','007|007,010,012|','<span data=\"012\" id=\"012\"><nobr><b title=\"安防2/办事员\">安防2/办事员</b></nobr></span>','','','','','2','','16','011','水电2','35','水电组','','1445581968','1445581997','40','0','{\"56\":\"空调电话坏了\",\"57\":\"审核中\"}'), ('6','002','电灯电话坏了','<p>打发打发打发地方&nbsp;</p>','007|007,010,012|','<span data=\"012\" id=\"012\"><nobr><b title=\"安防2/办事员\">安防2/办事员</b></nobr></span>','','','','','2','','16','011','水电2','35','水电组','','1445582383','1445582414','40','0','{\"56\":\"电灯电话坏了\",\"57\":\"审核中\"}'), ('7','002','3而发打发打发地方水电费','<p>打发打发打发地方&nbsp;</p>','007|007,010,012|','\r\n					<span data=\"emp_007\" id=\"emp_007\"><nobr><b title=\"安防主管/主管<>\">安防主管/主管&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"dept_36\" id=\"dept_36\"><nobr><b title=\"安防组\">安防组</b></nobr></span>				','','\r\n									','','\r\n									','2','','16','011','水电2','35','水电组','','1445914144','0','40','0','{\"56\":\"对方答复 \",\"57\":\"审核中\"}'), ('8','002','23而发生的发生的冯绍峰水电费 ','<p>打发打发打发地方&nbsp;</p>','007|007,010,012|','<span data=\"012\" id=\"012\"><nobr><b title=\"安防2/办事员\">安防2/办事员</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"007\" id=\"007\"><nobr><b title=\"安防主管/主管\">安防主管/主管</b></nobr></span>','','','','','2','','16','011','水电2','35','水电组','','1445914354','1445914385','40','0','{\"56\":\"地方撒旦飞洒地方水电费舒服收到\",\"57\":\"审核中\"}'), ('9','002','的发生的冯绍峰收到是','<p>打发打发打发地方&nbsp;</p>','007|007,010,012|','<span data=\"012\" id=\"012\"><nobr><b title=\"安防2/办事员\">安防2/办事员</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"007\" id=\"007\"><nobr><b title=\"安防主管/主管\">安防主管/主管</b></nobr></span>','','','','','2','','16','011','水电2','35','水电组','','1445923515','1445923566','40','0','{\"56\":\"打发斯蒂芬是风扇\",\"57\":\"审核中\"}'), ('10','003','打发第三方斯蒂芬','<p>打发第三方</p>','007|','<span data=\"012\" id=\"012\"><nobr><b title=\"安防2/办事员\">安防2/办事员</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"007\" id=\"007\"><nobr><b title=\"安防主管/主管\">安防主管/主管</b></nobr></span>','','','','','3','','16','011','水电2','35','水电组','','1445923941','1445923987','40','0',NULL), ('11','002','ddfdfdddd','<p>打发打发打发地方&nbsp;</p>','007|012|','<span data=\"007\" id=\"007\"><nobr><b title=\"安防主管/主管\">安防主管/主管</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"012\" id=\"012\"><nobr><b title=\"安防2/办事员\">安防2/办事员</b></nobr></span>','','','','','2','','16','011','水电2','35','水电组','','1445925554','0','40','0','{\"56\":\"sdffdsdfsdfs\",\"57\":\"审核中\"}');
INSERT INTO `xiaowei_flow_log` VALUES ('1','2','012','17','安防2','31','1','1445580829','1445580954','的放松放松大神','0',NULL,'0'), ('2','2','007','13','安防主管','100','1','1445581004','1445581133','打发斯蒂芬收到 ','1','安防2','0'), ('3','3','007','13','安防主管','21','1','1445581505','1445581569','抓紧办事','0',NULL,'0'), ('4','4','007','13','安防主管','21','1','1445581708','1445581784','安防2抓紧办','0',NULL,'0'), ('5','5','007','13','安防主管','21','1','1445581969','1445582008','打发斯蒂芬斯蒂芬收到','0',NULL,'0'), ('6','6','007','13','安防主管','21','1','1445582383','1445582498','安防2办理','0',NULL,'0'), ('7','6','012','17','安防2','100','1','1445911250','1445914065','打发打发斯蒂芬','1','安防主管','0'), ('8','7','007','13','安防主管','21','1','1445914145','1445914229','办理','0',NULL,'0'), ('9','8','007','13','安防主管','21','1','1445914354','1445914397','的地地道道的','0',NULL,'0'), ('10','8','012','17','安防2','100','1','1445914677','1445914855','范德萨发生法第三方','1','安防主管','0'), ('11','9','007','13','安防主管','21','1','1445923516','1445923580','办理','0',NULL,'0'), ('12','10','007','13','安防主管','21','1','1445923941','1445924000','的发打发打发','0',NULL,'0'), ('13','11','007','13','安防主管','21','1','1445925554','1445925581','banli','0',NULL,'0'), ('14','11','012','17','安防2','22','1','1445925582','1445925603','dfdfdfdfdfd','0',NULL,'0');
INSERT INTO `xiaowei_flow_type` VALUES ('1','70','01','加班申请','加班申请','<p>加班申请</p>','dept_24|dept_6|dept_5|','<span data=\"dept_24\" id=\"dept_24\"><nobr><b title=\"总务科\">总务科</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"dept_6\" id=\"dept_6\"><nobr><b title=\"管理部\">管理部</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"dept_5\" id=\"dept_5\"><nobr><b title=\"总经办\">总经办</b></nobr></span>','dept_2|','<span data=\"dept_2\" id=\"dept_2\"><nobr><b title=\"运营部\">运营部</b></nobr></span>','','','1443581254','1444443628','0','1','1','0','14','14','','1'), ('2','81','002','维修','维修','<p>打发打发打发地方&nbsp;</p>','emp_007|dept_36|','<span data=\"emp_007\" id=\"emp_007\"><nobr><b title=\"安防主管/主管<>\">安防主管/主管&lt;&gt;</b></nobr><b><i class=\"fa fa-arrow-right\"></i></b></span><span data=\"dept_36\" id=\"dept_36\"><nobr><b title=\"安防组\">安防组</b></nobr></span>','','','','','1445570374','1445581412','1','1','0','0','17','17','','1'), ('3','81','003','新维修','新维修','<p>打发第三方</p>','','','','','','','1445915006','0','0','1','0','0','14','14','','1');
INSERT INTO `xiaowei_node` VALUES ('84','管理','System/index','fa fa-cogs','','','999','0','0',''), ('85','邮件','Mail/index','fa fa-envelope-o bc-mail','','','1','0','0','badge_sum'), ('87','审批','Flow/index','fa fa-pencil bc-flow','','','2','0','0','badge_sum'), ('88','信息','Info/index##','fa fa-file-o','InfoFolder','','4','0','0','badge_sum'), ('91','日程','Schedule/index','fa fa-calendar bc-personal-schedule','','','9','198','0','badge_count_schedule'), ('94','职位','Position/index',NULL,NULL,'','','1','0',NULL), ('100','写信','Mail/add',NULL,'','','1','85','0',NULL), ('101','收件箱','Mail/folder?fid=inbox','bc-mail-inbox','','','3','85','0','badge_count_mail_inbox'), ('102','邮件设置','',NULL,NULL,NULL,'9','85','0',NULL), ('104','垃圾箱','Mail/folder?fid=spambox','','','','5','85','0',NULL), ('105','发件箱','Mail/folder?fid=outbox','','','','6','85','0',NULL), ('106','已删除','Mail/folder?fid=delbox','','','','4','85','0',NULL), ('107','草稿箱','Mail/folder?fid=darftbox','','','','7','85','0',NULL), ('108','邮件帐户设置','MailAccount/index',NULL,'','','1','102','0',NULL), ('110','公司信息管理','',NULL,NULL,'','1','84','0',NULL), ('112','权限管理','',NULL,NULL,'','3','84','0',NULL), ('113','系统设定','',NULL,NULL,'','4','84','0',NULL), ('114','系统参数设置','SystemConfig/index','','','','2','113','0',''), ('115','组织图','Dept/index','','','','1','110','0',NULL), ('116','员工登记','User/index',NULL,'','','5','110','0',NULL), ('118','权限组管理','Role/index','','','','1','112','0',NULL), ('119','权限设置','Role/node','','','','2','112','0',NULL), ('120','权限分配','Role/user','','','','3','112','0',NULL), ('121','菜单管理','Node/index','','','','1','113','0',NULL), ('123','职位','Position/index',NULL,'','','2','110','0',NULL), ('124','文件夹设置','Mail/folder_manage','','','','2','102','0',''), ('125','联系人','Contact/index','','','','1','198','0',NULL), ('126','信息搜索','Info/index','','','','1','88','0',NULL), ('143','邮件分类','MailOrganize/index',NULL,'','','','102','0',NULL), ('144','发起','Flow/index','','','','1','87','0',NULL), ('146','流程管理','FlowType/index','','','','9','87','0',NULL), ('147','待审批','Flow/folder?fid=confirm','bc-flow-confirm','','','4','87','0','badge_count_flow_todo'), ('148','已审批','Flow/folder?fid=finish','','','','5','87','0',''), ('149','草稿箱','Flow/folder?fid=darft','','','','2','87','0',''), ('150','已提交','Flow/folder?fid=submit','','','','3','87','0',''), ('152','待办','Todo/index','fa fa-tasks bc-personal-todo','','','9','198','0','badge_count_todo'), ('153','部门级别','DeptGrade/index','','','','4','110','0',NULL), ('156','客户','Customer/index',NULL,'','','2','157','0',NULL), ('157','通讯录','Staff/index','fa fa-group','','','7','0','0','badge_sum'), ('158','供应商','Supplier/index',NULL,'','','3','157','0',NULL), ('169','职员','Staff/index',NULL,'','','','157','0',NULL), ('177','我的文件夹','##mail','bc-mail-myfolder','MailFolder','','8','85','0','badge_count_mail_user_folder'), ('184','流程分组','FlowType/tag_manage','','','','8','87','0',NULL), ('185','审批报告','Flow/folder?fid=report','bc-flow-receive','','','6','87','0','badge_count_flow_receive'), ('189','信息分类','Info/folder_manage','','','','C1','88','0',''), ('190','消息','Message/index','fa fa-inbox bc-message','','','99','198','0','badge_count_message'), ('191','用户设置','','','','','','198','0',NULL), ('192','用户资料','Profile/index','','','','','191','0',NULL), ('193','修改密码','Profile/password','','','','','191','0',NULL), ('194','用户设置','UserConfig/index','','','','999','191','0',NULL), ('198','个人','Contact/index','fa fa-user bc-personal','','','9','0','0','badge_sum'), ('205','业务角色管理','Duty/index','','','','4','112','0',''), ('206','业务权限分配','Role/duty','','','','5','112','0',''), ('214','记账','Finance/index','fa fa-jpy','','','3','217','0',''), ('216','日报','WorkLog/index','fa fa-book','','','1','217','0',''), ('217','工作','WorkLog/index','fa fa-book','','','6','0','0','badge_sum'), ('219','我的信息','Info/my_info','','','','B1','88','0',NULL), ('220','我的签收','Info/my_sign','','','','B2','88','0',NULL), ('221','文档','Doc/index##','fa fa-inbox','DocFolder','','4','0','0','badge_sum'), ('222','文档管理','Doc/folder_manage','fa fa-inbox','','','4','221','0','badge_sum'), ('224','任务','Task/index','fa fa-book','','','2','217','0','badge_count_task'), ('226','报表','Form/index##','fa fa-table','FormFolder','','5','0','0','badge_sum'), ('227','项目管理','Form/folder_manage','fa fa-inbox','','','4','226','0','badge_sum'), ('228','项目字段类型','Form/field_type','fa fa-inbox','','','4','226','0','badge_sum'), ('229','群组','Group/index','fa fa-group','','','7','157','0','badge_sum'), ('234','参阅箱','Flow/folder?fid=receive','bc-flow-receive','','','6','87','0','badge_count_flow_receive'), ('235','接管任务','Task/folder?fid=no_assign',NULL,NULL,NULL,NULL,'224','0','badge_count_no_assign_task'), ('236','工作验收','Task/folder?fid=ys',NULL,NULL,NULL,NULL,'224','0','badge_count_ys_task'), ('237','表单管理','Task/tfield_manage',NULL,NULL,NULL,NULL,'224','0',NULL), ('238','任务统计','Task/tongji',NULL,NULL,NULL,NULL,'224','0',NULL);
INSERT INTO `xiaowei_position` VALUES ('1','011','主管','5','0'), ('2','04','经理','4','0'), ('3','03','总监','3','0'), ('4','02','副总','2','0'), ('5','01','总经理','1','0'), ('6','06','助理','6','0'), ('7','','办事员','7','0');
INSERT INTO `xiaowei_push` VALUES ('36','12','{\"type\":\"任务\",\"action\":\"需要执行\",\"title\":\"来自：企业A-王五\",\"content\":\"标题：拍照测试\",\"url\":\"\\/index.php?m=&c=Task&a=read&id=11\"}','0','1448330164',NULL), ('37','12','{\"type\":\"任务\",\"action\":\"需要执行\",\"title\":\"来自：企业A-王五\",\"content\":\"标题：guide\",\"url\":\"\\/index.php?m=&c=Task&a=read&id=12\"}','0','1448330771',NULL), ('39','12','{\"type\":\"任务\",\"action\":\"需要执行\",\"title\":\"来自：企业A-王五\",\"content\":\"标题：Ghhd\",\"url\":\"\\/index.php?m=&c=Task&a=read&id=14\"}','0','1448365082',NULL);
INSERT INTO `xiaowei_role` VALUES ('1','公司管理员','0','','1','1208784792','1368507168','0'), ('2','基本权限','0','','2','1215496283','1368507164','0'), ('7','领导','0','','2','1254325787','1401288337','0'), ('8','物业部管理',NULL,'','','1445569024','1445569042','0'), ('9','工人',NULL,'','','1445569086','0','0');
INSERT INTO `xiaowei_role_duty` VALUES ('1','15'), ('7','14'), ('1','14'), ('7','15'), ('2','14'), ('2','15'), ('8','17'), ('8','18'), ('8','19'), ('8','20'), ('8','21'), ('8','22'), ('9','14'), ('9','17'), ('9','18'), ('9','19'), ('9','20'), ('9','21'), ('9','22');
INSERT INTO `xiaowei_role_node` VALUES ('2','136',NULL,NULL,NULL), ('2','135',NULL,NULL,NULL), ('1','94',NULL,NULL,NULL), ('1','97',NULL,NULL,NULL), ('1','98',NULL,NULL,NULL), ('1','99',NULL,NULL,NULL), ('1','69',NULL,NULL,NULL), ('1','6',NULL,NULL,NULL), ('1','2',NULL,NULL,NULL), ('1','7',NULL,NULL,NULL), ('1','131','1','1','1'), ('1','130',NULL,NULL,NULL), ('1','133',NULL,NULL,NULL), ('1','132',NULL,NULL,NULL), ('1','135',NULL,NULL,NULL), ('1','136',NULL,NULL,NULL), ('1','117',NULL,NULL,NULL), ('1','134',NULL,NULL,NULL), ('2','103',NULL,NULL,NULL), ('2','133',NULL,NULL,NULL), ('2','130',NULL,NULL,NULL), ('2','134',NULL,NULL,NULL), ('2','132',NULL,NULL,NULL), ('2','103',NULL,NULL,NULL), ('2','103',NULL,NULL,NULL), ('2','109',NULL,NULL,NULL), ('1','117',NULL,NULL,NULL), ('1','117',NULL,NULL,NULL), ('1','117',NULL,NULL,NULL), ('1','117',NULL,NULL,NULL), ('1','103',NULL,NULL,NULL), ('1','109',NULL,NULL,NULL), ('1','117',NULL,NULL,NULL), ('1','117',NULL,NULL,NULL), ('1','163',NULL,NULL,NULL), ('1','170',NULL,NULL,NULL), ('1','164',NULL,NULL,NULL), ('1','155',NULL,NULL,NULL), ('1','154','1','1','1'), ('1','111',NULL,NULL,NULL), ('1','168',NULL,NULL,NULL), ('1','162',NULL,NULL,NULL), ('1','166',NULL,NULL,NULL), ('1','161',NULL,NULL,NULL), ('1','171',NULL,NULL,NULL), ('1','165',NULL,NULL,NULL), ('1','174',NULL,NULL,NULL), ('1','172',NULL,NULL,NULL), ('1','173',NULL,NULL,NULL), ('1','160',NULL,NULL,NULL), ('1','175',NULL,NULL,NULL), ('1','176',NULL,NULL,NULL), ('1','167',NULL,NULL,NULL), ('1','128',NULL,NULL,NULL), ('2','85','1','1','1'), ('2','100',NULL,NULL,NULL), ('2','101',NULL,NULL,NULL), ('2','106',NULL,NULL,NULL), ('2','104',NULL,NULL,NULL), ('2','105',NULL,NULL,NULL), ('2','107',NULL,NULL,NULL), ('2','177','1','1','1'), ('2','102',NULL,NULL,NULL), ('2','143','1','1','1'), ('2','108','1','1','1'), ('2','124',NULL,NULL,NULL), ('2','88',NULL,'1','1'), ('2','126',NULL,'1','1'), ('2','219',NULL,NULL,NULL), ('2','220',NULL,NULL,NULL), ('2','226',NULL,'1','1'), ('2','217',NULL,'1','1'), ('2','216',NULL,'1','1'), ('2','224',NULL,'1','1'), ('2','157','1','1','1'), ('2','169','1','1','1'), ('2','156','1','1','1'), ('2','158','1','1','1'), ('2','229',NULL,'1','1'), ('2','198','1','1','1'), ('2','191',NULL,NULL,NULL), ('2','193',NULL,NULL,NULL), ('2','192','1','1','1'), ('2','194','1','1','1'), ('2','125','1','1','1'), ('2','91','1','1','1'), ('2','152','1','1','1'), ('2','190','1','1','1'), ('2','87','1','1','1'), ('2','144','1','1','1'), ('2','149',NULL,NULL,NULL), ('2','150',NULL,NULL,NULL), ('2','147',NULL,NULL,NULL), ('2','148',NULL,NULL,NULL), ('2','185',NULL,NULL,NULL), ('2','221',NULL,'1',NULL), ('9','87','1','1','1'), ('9','144','1','1','1'), ('9','149',NULL,NULL,NULL), ('9','150',NULL,NULL,NULL);
INSERT INTO `xiaowei_role_node` VALUES ('9','147',NULL,NULL,NULL), ('9','148',NULL,NULL,NULL), ('9','185',NULL,NULL,NULL), ('9','234',NULL,NULL,NULL), ('9','184',NULL,NULL,NULL), ('9','217','1','1','1'), ('9','216','1','1','1'), ('9','224',NULL,'1','1'), ('7','236',NULL,NULL,NULL), ('7','235',NULL,NULL,NULL), ('7','237',NULL,NULL,NULL), ('7','85',NULL,'1','1'), ('7','100',NULL,NULL,NULL), ('7','101',NULL,NULL,NULL), ('7','106',NULL,NULL,NULL), ('7','104',NULL,NULL,NULL), ('7','105',NULL,NULL,NULL), ('7','107',NULL,NULL,NULL), ('7','177',NULL,NULL,NULL), ('7','102',NULL,NULL,NULL), ('7','143',NULL,NULL,NULL), ('7','108',NULL,NULL,NULL), ('7','124',NULL,NULL,NULL), ('7','87','1','1','1'), ('7','144','1','1','1'), ('7','149',NULL,NULL,NULL), ('7','150',NULL,NULL,NULL), ('7','147',NULL,NULL,NULL), ('7','148',NULL,NULL,NULL), ('7','185',NULL,NULL,NULL), ('7','234',NULL,NULL,NULL), ('7','184',NULL,NULL,NULL), ('7','146','1','1','1'), ('7','88','1','1','1'), ('7','126','1','1','1'), ('7','219',NULL,NULL,NULL), ('7','220',NULL,NULL,NULL), ('7','189',NULL,NULL,NULL), ('7','221','1','1','1'), ('7','222',NULL,NULL,NULL), ('7','226','1','1','1'), ('7','228',NULL,NULL,NULL), ('7','227',NULL,NULL,NULL), ('7','217','1','1','1'), ('7','216','1','1','1'), ('7','224','1','1','1'), ('7','236',NULL,NULL,NULL), ('7','235',NULL,NULL,NULL), ('7','237',NULL,NULL,NULL), ('7','214','1','1','1'), ('7','157','1','1','1'), ('7','169','1','1','1'), ('7','156','1','1','1'), ('7','158','1','1','1'), ('7','229','1','1','1'), ('7','198','1','1','1'), ('7','191',NULL,NULL,NULL), ('7','193',NULL,NULL,NULL), ('7','192','1','1','1'), ('7','194','1','1','1'), ('7','125','1','1','1'), ('7','152','1','1','1'), ('7','91','1','1','1'), ('7','190','1','1','1'), ('8','238',NULL,NULL,NULL), ('8','85',NULL,NULL,NULL), ('8','100',NULL,NULL,NULL), ('8','101',NULL,NULL,NULL), ('8','106',NULL,NULL,NULL), ('8','104',NULL,NULL,NULL), ('8','105',NULL,NULL,NULL), ('8','107',NULL,NULL,NULL), ('8','177','1','1','1'), ('8','102',NULL,NULL,NULL), ('8','143','1','1','1'), ('8','108','1','1','1'), ('8','124',NULL,NULL,NULL), ('8','87','1','1','1'), ('8','144','1','1','1'), ('8','149',NULL,NULL,NULL), ('8','150',NULL,NULL,NULL), ('8','147',NULL,NULL,NULL), ('8','148',NULL,NULL,NULL), ('8','234',NULL,NULL,NULL), ('8','185',NULL,NULL,NULL), ('8','184',NULL,NULL,NULL), ('8','146','1','1','1'), ('8','88',NULL,NULL,NULL), ('8','126',NULL,NULL,NULL), ('8','219',NULL,NULL,NULL), ('8','220',NULL,NULL,NULL), ('8','189',NULL,NULL,NULL), ('8','221',NULL,NULL,NULL), ('8','222',NULL,NULL,NULL), ('8','226','1','1','1'), ('8','227',NULL,NULL,NULL), ('8','228',NULL,NULL,NULL), ('8','217',NULL,NULL,NULL), ('8','216',NULL,NULL,NULL), ('8','224','1','1','1');
INSERT INTO `xiaowei_role_node` VALUES ('8','238',NULL,NULL,NULL), ('8','235',NULL,NULL,NULL), ('8','236',NULL,NULL,NULL), ('8','237',NULL,NULL,NULL), ('8','214',NULL,NULL,NULL), ('8','157',NULL,NULL,NULL), ('8','169',NULL,NULL,NULL), ('8','156',NULL,NULL,NULL), ('8','158',NULL,NULL,NULL), ('8','229',NULL,NULL,NULL), ('8','198',NULL,NULL,NULL), ('8','191',NULL,NULL,NULL), ('8','192',NULL,NULL,NULL), ('8','193',NULL,NULL,NULL), ('8','194',NULL,NULL,NULL), ('8','125',NULL,NULL,NULL), ('8','91',NULL,NULL,NULL), ('8','152',NULL,NULL,NULL), ('8','190',NULL,NULL,NULL), ('8','84',NULL,NULL,NULL), ('8','110',NULL,NULL,NULL), ('8','115',NULL,NULL,NULL), ('8','123',NULL,NULL,NULL), ('8','153',NULL,NULL,NULL), ('8','116',NULL,NULL,NULL), ('8','112',NULL,NULL,NULL), ('8','118',NULL,NULL,NULL), ('8','119',NULL,NULL,NULL), ('8','120',NULL,NULL,NULL), ('8','205',NULL,NULL,NULL), ('8','206',NULL,NULL,NULL), ('8','113',NULL,NULL,NULL), ('8','121',NULL,NULL,NULL), ('8','114',NULL,NULL,NULL), ('1','85','1','1','1'), ('1','100',NULL,NULL,NULL), ('1','101',NULL,NULL,NULL), ('1','106',NULL,NULL,NULL), ('1','104',NULL,NULL,NULL), ('1','105',NULL,NULL,NULL), ('1','107',NULL,NULL,NULL), ('1','177','1','1','1'), ('1','102',NULL,NULL,NULL), ('1','143','1','1','1'), ('1','108','1','1','1'), ('1','124',NULL,NULL,NULL), ('1','87','1','1','1'), ('1','144','1','1','1'), ('1','149',NULL,NULL,NULL), ('1','150',NULL,NULL,NULL), ('1','147',NULL,NULL,NULL), ('1','148',NULL,NULL,NULL), ('1','234',NULL,NULL,NULL), ('1','185',NULL,NULL,NULL), ('1','184',NULL,NULL,NULL), ('1','146','1','1','1'), ('1','88','1','1','1'), ('1','126','1','1','1'), ('1','219',NULL,NULL,NULL), ('1','220',NULL,NULL,NULL), ('1','189',NULL,NULL,NULL), ('1','221','1','1','1'), ('1','222',NULL,NULL,NULL), ('1','226','1','1','1'), ('1','227',NULL,NULL,NULL), ('1','228',NULL,NULL,NULL), ('1','217','1','1','1'), ('1','216','1','1','1'), ('1','224','1','1','1'), ('1','238',NULL,NULL,NULL), ('1','235',NULL,NULL,NULL), ('1','236',NULL,NULL,NULL), ('1','237',NULL,NULL,NULL), ('1','214','1','1','1'), ('1','157','1','1','1'), ('1','169','1','1','1'), ('1','156','1','1','1'), ('1','158','1','1','1'), ('1','229','1','1','1'), ('1','198','1','1','1'), ('1','191',NULL,NULL,NULL), ('1','192','1','1','1'), ('1','193',NULL,NULL,NULL), ('1','194','1','1','1'), ('1','125','1','1','1'), ('1','91','1','1','1'), ('1','152','1','1','1'), ('1','190','1','1','1'), ('1','84','1','1','1'), ('1','110',NULL,NULL,NULL), ('1','115','1','1','1'), ('1','123','1','1','1'), ('1','153','1','1','1'), ('1','116','1','1','1'), ('1','112',NULL,NULL,NULL), ('1','118','1','1','1'), ('1','119',NULL,NULL,NULL), ('1','120',NULL,NULL,NULL), ('1','205','1','1','1'), ('1','206',NULL,NULL,NULL);
INSERT INTO `xiaowei_role_node` VALUES ('1','113',NULL,NULL,NULL), ('1','121','1','1','1'), ('1','114','1','1','1');
INSERT INTO `xiaowei_role_user` VALUES ('4','27'), ('4','26'), ('5','31'), ('3','22'), ('1','4'), ('1','3'), ('1','35'), ('1','36'), ('1','54'), ('2','3'), ('1','53'), ('7','36'), ('1','2'), ('2','2'), ('7','2'), ('1','63'), ('1','64'), ('2','41'), ('2','68'), ('1','44'), ('2','44'), ('7','44'), ('1','67'), ('2','67'), ('7','67'), ('1','48'), ('2','48'), ('7','48'), ('1','42'), ('2','42'), ('7','42'), ('1','43'), ('2','43'), ('7','43'), ('1','49'), ('2','49'), ('7','49'), ('1','50'), ('2','50'), ('7','50'), ('1','51'), ('2','51'), ('7','51'), ('1','52'), ('2','52'), ('7','52'), ('1','55'), ('2','55'), ('7','55'), ('1','57'), ('2','57'), ('7','57'), ('1','58'), ('2','58'), ('7','58'), ('1','59'), ('2','59'), ('7','59'), ('1','60'), ('2','60'), ('7','60'), ('1','61'), ('2','61'), ('7','61'), ('1','56'), ('2','56'), ('7','56'), ('1','62'), ('2','62'), ('7','62'), ('1','65'), ('2','65'), ('7','65'), ('1','66'), ('2','66'), ('7','66'), ('2','83'), ('2','84'), ('2','87'), ('2','88'), ('2','89'), ('2','90'), ('2','91'), ('2','92'), ('2','93'), ('2','94'), ('2','95'), ('2','96'), ('2','97'), ('2','98'), ('1','1'), ('7','12'), ('7','13'), ('8','12'), ('8','13'), ('9','14'), ('9','15'), ('9','16'), ('9','17');
INSERT INTO `xiaowei_system_config` VALUES ('1','SYSTEM_NAME','系统名称','JLOA','0','','0'), ('7','UPLOAD_FILE_TYPE','上传文件类型','doc,docx,xls,xlsx,ppt,pptx,pdf,gif,png,tif,zip,rar,jpg,jpeg,txt,mp4','0','','0'), ('8','IS_VERIFY_CODE','验证码','0','0','','0'), ('15','FINANCE_INCOME_TYPE','办公费','办公费','0','1','28'), ('16','FINANCE_INCOME_TYPE','通讯费','通讯费','0','2','28'), ('17','FINANCE_PAYMENT_TYPE','办公费','办公费','0','','29'), ('18','FINANCE_PAYMENT_TYPE','通讯费','通讯费','0','','29'), ('19','WEIXIN_CORP_ID','WEIXIN_CORP_ID','wx4124a601419ba115','0','','27'), ('20','WEIXIN_SECRET','WEIXIN_SECRET','TlnidZYom5z8T-pE0y_O7IXm7dSPgPDtI3nQ7RyqLQePiyUXzWo8F-qum1n4i_QM','0','','27'), ('21','WEIXIN_TOKEN','WEIXIN_TOKEN','xiaowei','0','','27'), ('22','WEIXIN_ENCODING_AES_KEY','WEIXIN_ENCODING_AES_KEY','lsBzWprOjjdbkMatbg54wwMC2H9ZXmi1aEdDmUQ2nPq','0','','27'), ('23','WEIXIN_SITE_URL','WEIXIN_SITE_URL','http://xiaowei.smeoa.com','0','','27'), ('24','FINANCE_PAYMENT_TYPE','餐费','餐费','0','','29'), ('25','OA_AGENT_ID','OA_AGENT_ID','5','0','','27'), ('26','WEIXIN_SUBSCRIBE_MSG','WEIXIN_SUBSCRIBE_MSG','欢迎使用微信办公系统。','0','','27'), ('27','微信设置','微信设置','微信设置','0','','0'), ('28','记账-收入','记账-收入','记账-收入','0','','0'), ('29','记账-支出','记账-支出','记账-支出','0','','0'), ('31','WS_PUSH_CONFIG','WS_PUSH_CONFIG','消息','0','','0'), ('32','TASK_TYPE','紧急','紧急','0','','0'), ('33','TASK_TYPE','重要','重要','0','','0'), ('34','TASK_TYPE','重要','重要','0','','0'), ('35','TASK_TYPE','TASK_TYPE','一般','0','','0');
INSERT INTO `xiaowei_system_folder` VALUES ('1','1','Form','dddd','总经办|dept_5;王五/总经理|003;','张三/办事员|001;','张三/办事员|001;','','0','');
INSERT INTO `xiaowei_system_log` VALUES ('31','1','1443506210','0',NULL), ('32','2','1443506210','0',NULL), ('33','1','1444353961','7',NULL), ('34','2','1444353961','5.16002',NULL), ('35','1','1444440735','13',NULL), ('36','2','1444440735','9.23877',NULL), ('37','1','1444615139','13',NULL), ('38','2','1444615139','9.23877',NULL), ('39','1','1444702094','13',NULL), ('40','2','1444702094','9.23877',NULL), ('41','1','1444788760','13',NULL), ('42','2','1444788760','9.23877',NULL), ('43','1','1444875549','13',NULL), ('44','2','1444875549','9.23877',NULL), ('45','1','1444961999','13',NULL), ('46','2','1444961999','9.23877',NULL), ('47','1','1445222991','13',NULL), ('48','2','1445222991','9.23877',NULL), ('49','1','1445309502','13',NULL), ('50','2','1445309502','9.23877',NULL), ('51','1','1445395999','13',NULL), ('52','2','1445395999','9.23877',NULL), ('53','1','1445483003','13',NULL), ('54','2','1445483003','9.23877',NULL), ('55','1','1445569446','13',NULL), ('56','2','1445569446','9.23877',NULL), ('57','1','1445827208','13',NULL), ('58','2','1445827208','9.23877',NULL), ('59','1','1445913914','13',NULL), ('60','2','1445913914','9.23877',NULL), ('61','1','1446009396','16',NULL), ('62','2','1446009396','11.5271',NULL), ('63','1','1446096025','16',NULL), ('64','2','1446096025','11.5271',NULL), ('65','1','1446514724','16',NULL), ('66','2','1446514724','11.5271',NULL), ('67','1','1446601291','16',NULL), ('68','2','1446601291','11.5271',NULL), ('69','1','1446688875','16',NULL), ('70','2','1446688875','11.5271',NULL), ('71','1','1446775556','16',NULL), ('72','2','1446775556','11.5271',NULL), ('73','1','1447038314','16',NULL), ('74','2','1447038314','11.5271',NULL), ('75','1','1447124751','16',NULL), ('76','2','1447124751','11.5271',NULL), ('77','1','1447811529','17',NULL), ('78','2','1447811529','12.2689',NULL), ('79','1','1448253374','17',NULL), ('80','2','1448253374','12.2689',NULL), ('81','1','1448348034','24',NULL), ('82','2','1448348034','18.0404',NULL), ('83','1','1448434435','25',NULL), ('84','2','1448434435','18.1296',NULL), ('85','1','1448853266','26',NULL), ('86','2','1448853266','18.9682',NULL), ('87','1','1448939724','54',NULL), ('88','2','1448939724','55.5104',NULL), ('89','1','1449026197','56',NULL), ('90','2','1449026197','80.4866',NULL), ('91','1','1449232814','56',NULL), ('92','2','1449232814','80.4866',NULL), ('93','1','1449472667','56',NULL), ('94','2','1449472667','80.4866',NULL), ('95','1','1449625159','56',NULL), ('96','2','1449625159','80.4866',NULL), ('97','1','1449712034','56',NULL), ('98','2','1449712034','80.4866',NULL), ('99','1','1449799771','58',NULL), ('100','2','1449799771','81.999',NULL), ('101','1','1450071164','58',NULL), ('102','2','1450071164','81.999',NULL), ('103','1','1450159621','58',NULL), ('104','2','1450159621','81.999',NULL), ('105','1','1450246246','63',NULL), ('106','2','1450246246','89.8627',NULL), ('107','1','1450332789','66',NULL), ('108','2','1450332789','90.7415',NULL), ('109','1','1450661758','67',NULL), ('110','2','1450661758','92.8781',NULL), ('111','1','1451377585','67',NULL), ('112','2','1451377585','92.8781',NULL), ('113','1','1451540345','67',NULL), ('114','2','1451540345','92.8781',NULL), ('115','1','1451971177','67',NULL), ('116','2','1451971177','92.8781',NULL), ('117','1','1452756878','67',NULL), ('118','2','1452756878','92.8781',NULL), ('119','1','1453167706','67',NULL), ('120','2','1453167706','92.8781',NULL), ('121','1','1453273000','67',NULL), ('122','2','1453273000','92.8781',NULL), ('123','1','1453427567','67',NULL), ('124','2','1453427567','92.8781',NULL), ('125','1','1453791300','67',NULL), ('126','2','1453791300','92.8781',NULL), ('127','1','1455852735','67',NULL), ('128','2','1455852735','92.8781',NULL), ('129','1','1462499947','67',NULL), ('130','2','1462499947','92.8781',NULL);
INSERT INTO `xiaowei_system_log` VALUES ('131','1','1465283350','67',NULL), ('132','2','1465283350','92.8781',NULL);
INSERT INTO `xiaowei_system_tag` VALUES ('58','0','Supplier','123','',''), ('59','0','Doc','123123','123123',''), ('60','0','Doc','123123','',''), ('61','0','Doc','abc','',''), ('65','0','Customer','22222','',''), ('66','0','Flow','人事','',''), ('67','0','Flow','IT','',''), ('68','0','Flow','公告','',''), ('69','0','FlowType','人事','1',''), ('70','0','FlowType','行政','2',''), ('71','0','FlowType','采购','3',''), ('72','0','FlowType','出差','4',''), ('80','0','FlowType','车辆管理','5',''), ('81','0','FlowType','维修','6','');
INSERT INTO `xiaowei_system_tag_data` VALUES ('18','58','Supplier'), ('64','59','Doc'), ('64','60','Doc'), ('64','61','Doc'), ('65','61','Doc'), ('33','14','Video'), ('17','66','Flow'), ('18','66','Flow'), ('19','66','Flow'), ('20','66','Flow'), ('21','66','Flow'), ('22','66','Flow'), ('23','66','Flow'), ('17','66','Flow'), ('18','66','Flow'), ('19','66','Flow'), ('20','66','Flow'), ('21','66','Flow'), ('22','66','Flow'), ('23','66','Flow'), ('17','70','FlowType'), ('23','72','FlowType'), ('22','72','FlowType'), ('21','72','FlowType'), ('20','72','FlowType'), ('24','70','FlowType'), ('32','65','Customer'), ('18','71','FlowType'), ('19','71','FlowType'), ('33','71','FlowType'), ('34','71','FlowType'), ('35','71','FlowType'), ('36','71','FlowType'), ('42','70','FlowType'), ('46','70','FlowType'), ('47','70','FlowType'), ('48','70','FlowType'), ('49','70','FlowType'), ('50','70','FlowType');
INSERT INTO `xiaowei_task` VALUES ('16','2015-0001',NULL,'不方便方便放不方便','<p>防守打法收到发斯蒂芬</p>','安防2|17;','MDAwMDAwMDAwMIPdoXM;','2015-12-10 09:42:00','4','王五','29','企业A','1448934220',NULL,NULL,NULL,'10','0',NULL,'{\"214\":\"烦烦烦\",\"215\":\"反反复复凤飞飞\"}','29',NULL), ('17','2015-0002',NULL,'你备注','<p>MSN祝您</p>','安防2|17;','MDAwMDAwMDAwMISnmXM;MDAwMDAwMDAwMISnnXM;','2015-12-04 10:05:00','15','安防1','36','安防组','1448935738',NULL,NULL,NULL,'10','0',NULL,'{\"214\":\"里脊\",\"215\":\"匿名\"}','29',NULL), ('18','2015-0003',NULL,'弄','<p>理解</p>','水电1|14;','MDAwMDAwMDAwMIS3e3M;','0000-00-00 00:00:00','15','安防1','36','安防组','1448936122',NULL,NULL,NULL,'0','0',NULL,'{\"214\":\"\",\"215\":\"\"}','29',NULL), ('19','2015-0004',NULL,'啊','<p>我</p>','水电2|16;','MDAwMDAwMDAwMIS3i3M;','0000-00-00 00:00:00','4','王五','29','企业A','1448949744',NULL,NULL,NULL,'0','0',NULL,'{\"214\":\"\",\"215\":\"\"}','29',NULL), ('20','2015-0005',NULL,'非官方的个地方官低跟低跟','<p>地方所得税法士大夫士大夫水电费水电费</p>','','MDAwMDAwMDAwMIS3j3M;','2015-12-10 14:33:00','4','王五','29','企业A','1448951739',NULL,NULL,NULL,'0','0',NULL,'{\"214\":\"\",\"215\":\"\"}','29',NULL), ('21','2015-0006',NULL,'fhhc','<p>jdjxjbd</p>','安防主管|13;','','2015-12-16 15:20:00','1','管理员','1','小微企业','1449472968',NULL,NULL,NULL,'0','0',NULL,NULL,'1',NULL), ('22','2015-0007',NULL,'放假快乐水电费第三方','<p>地方地方大幅度</p>','安防主管|13','','2015-12-10 11:59:00','4','王五','29','企业A','1449543720',NULL,NULL,NULL,'10','0',NULL,'{\"214\":\"\",\"215\":\"\"}','29',NULL), ('23','2015-0008',NULL,'家里','<p>进口</p>','水电1|14;','','0000-00-00 00:00:00','4','王五','29','企业A','1449644815',NULL,NULL,NULL,'0','0',NULL,'{\"214\":\"\",\"215\":\"\"}','29',NULL), ('24','2015-0009',NULL,'ttyy','<p>husuw</p>','安防主管|13;','','0000-00-00 00:00:00','17','安防2','36','安防组','1450164334',NULL,NULL,NULL,'0','0',NULL,'{\"214\":\"\",\"215\":\"uxjsj\"}','29',NULL), ('25','2015-0010',NULL,'‘把kill','<p>比较困难</p>','安防组|dept_36;','MDAwMDAwMDAwMITNf3M;','0000-00-00 00:00:00','17','安防2','36','安防组','1450236459',NULL,NULL,NULL,'0','0',NULL,'{\"214\":\"\",\"215\":\"\"}','29',NULL), ('26','2015-0011',NULL,'寂寞欧锦赛','<p>寂寞OOXX规模没有图</p>','安防主管|13','','0000-00-00 00:00:00','4','王五','29','企业A','1450333477',NULL,NULL,NULL,'10','0',NULL,'{\"214\":\"\",\"215\":\"\"}','29','1450333312756.jpg'), ('27','2015-0012',NULL,'国际魔域','<p>可能忙忙碌碌投资者</p>','王五|4;','','0000-00-00 00:00:00','13','安防主管','36','安防组','1450337284','1450405122',NULL,NULL,'10','0',NULL,'{\"214\":\"\",\"215\":\"\"}','29','1450404957242.jpg'), ('28','2016-0001',NULL,'ffffffff','<p>fgfgfgdgdgfgdg</p>','安防2|17;','','2016-01-16 10:08:00','13','安防主管','36','安防组','1452823871',NULL,NULL,NULL,'0','0',NULL,'{\"214\":\"ffffff\",\"215\":\"fffff\"}','29','');
INSERT INTO `xiaowei_task_log` VALUES ('31','16','1','4','17','安防2','10','2015-12-10 10:00:00','安防2','17','80',NULL,'<p>萨德路口附近阿莱克法兰克点附近拉锯</p>','MDAwMDAwMDAwMISnj3M;MDAwMDAwMDAwMIS3f3M;MDAwMDAwMDAwMIS3g3M;MDAwMDAwMDAwMIS3h3M;MDAwMDAwMDAwMIS3nXM;',NULL), ('32','17','1','15','17','安防2','10','2015-12-16 11:18:00','安防2','17','49',NULL,'<p>透露家</p>','',NULL), ('33','18','1','15','14','水电1','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('34','19','1','4','16','水电2','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('35','21','1','1','13','安防主管','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('36','22','1',NULL,'13','安防主管','10','2015-12-17 11:06:00','安防主管','13','47',NULL,'<p>zhengziachuli</p>','',NULL), ('37','23','1','4','14','水电1','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('38','24','1','17','13','安防主管','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('39','25','2','17','36','安防组','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('40','27','1',NULL,'4','王五','10','2015-12-19 09:38:00','王五','4','78',NULL,'<p>该喝喝</p>','MDAwMDAwMDAwMITNmXM;',''), ('41','27','1',NULL,'4','王五','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL), ('42','26','1',NULL,'13','安防主管','10','2015-12-19 10:19:00','安防主管','13','37',NULL,'<p>根据模具</p>','','1450405172883.jpg'), ('43','28','1','13','17','安防2','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `xiaowei_udf_field` VALUES ('56','问题描述','2','','','textarea','2','','require','Flow','0',''), ('57','结果反馈','2','','','select','1','审核中|审核中,受理中|受理中,已完成|已完成','require','Flow','0',''), ('59','姓名','33','','','text','1','','','Flow','0',''), ('60','申请日期','33','','','date','1','','','Flow','0',''), ('61','所属部门','33','','','text','1','','','Flow','0',''), ('62','所属科室','33','','','select','1','SYSTEM_CONFIG:FINANCE_INCOME_TYPE','','Flow','0',''), ('64','B1','76','','','text','1','','','Flow','0',NULL), ('65','B2','76','','','text','1','','','Flow','0',NULL), ('66','兑现日期','76','','','date','1','','','Form','0','show|col-10'), ('67','剩余期限','76','','','text','1','','','Form','0','show|col-10'), ('68','项目状态','76','','','radio','2','提交|提交,审核中|审核中,审核失败|审核失败','','Form','0','show|col-10'), ('69','姓名','34','','请填写姓名','datetime','1','','require','Flow','0',''), ('71','申请日期','34','','请填写联系电话','text','1','','require','Flow','0',''), ('72','请假开始时间','34','','请选择开始时间','datetime','1','','require','Flow','0',''), ('73','请假结束时间','34','','请选择束时间','datetime','1','','require','Flow','0',''), ('74','请假原因','34','','请填写请假原因','textarea','2','','require','Flow','0',''), ('76','姓名','38','','','text','1','','','Flow','0',''), ('77','申请日期','38','','','date','1','','','Flow','0',''), ('78','所属部门','38','','','text','1','','','Flow','0',''), ('79','所属科室','38','','','text','1','','','Flow','0',''), ('80','姓名','36','','','text','1','','','Flow','0',''), ('82','申请日期','36','','','date','1','','','Flow','0',''), ('83','所属部门、科室','36','','','text','1','','','Flow','0',''), ('85','姓名','44','','','text','1','','','Flow','0',''), ('86','部门/科室','44','','','text','1','','','Flow','0',''), ('87','离职申请日期','44','','','date','2','','','Flow','0',''), ('88','离职理由','44','','','editor','2','','','Flow','0',''), ('89','培训申请人','54','1','','text','1','','','Flow','0',''), ('90','部门/科室','54','2','','text','1','','','Flow','0',''), ('91','培训地点','54','3','','text','1','','','Flow','0',''), ('92','培训开始时间','54','4','','datetime','1','','','Flow','0',''), ('93','培训目的','54','6','','editor','2','','','Flow','0',''), ('94','培训内容','54','7','','editor','2','','','Flow','0',''), ('95','姓名','41','1','','text','1','','','Flow','0',''), ('96','部门/科室','41','2','','text','1','','','Flow','0',''), ('97','出差地点','41','3','','text','1','','','Flow','0',''), ('98','出差开始时间','41','5','','datetime','1','','','Flow','0',''), ('99','预计费用','41','4','','text','1','','','Flow','0',''), ('100','出差事由/目的','41','7','','editor','2','','','Flow','0',''), ('103','姓名','40','','','text','1','','','Flow','0',''), ('104','部门/科室','40','','','text','1','','','Flow','0',''), ('105','请假开始时间','40','','','datetime','1','','','Flow','0',''), ('106','请假结束时间','40','','','datetime','1','','','Flow','0',''), ('107','请假事由','40','','','editor','2','','','Flow','0',''), ('108','培训结束时间','54','5','','datetime','2','','','Flow','0',''), ('109','出差结束时间','41','6','','datetime','1','','','Flow','0',''), ('110','申请人','43','','','text','1','','','Flow','0',''), ('112','部门/科室','43','2','','text','1','','','Flow','0',''), ('114','用途','43','3','','editor','2','','','Flow','0',''), ('115','申请人','55','1','','text','1','','','Flow','0',''), ('116','部门/科室','55','2','','text','1','','','Flow','0',''), ('117','预算依据','55','4','','editor','2','','','Flow','0',''), ('118','预算用途','55','3','','editor','2','','','Flow','0',''), ('119','预算明细请参考附件','55','5','','text','2','','','Flow','0',''), ('120','申请人','45','1','','text','1','','','Flow','0',''), ('121','部门/科室','45','2','','text','1','','','Flow','0',''), ('122','出差地点','45','4','','text','1','','','Flow','0',''), ('123','出差开始时间','45','5','','datetime','1','','','Flow','0',''), ('124','出差结束时间','45','6','','datetime','1','','','Flow','0',''), ('125','住宿费用','45','7','','text','1','','','Flow','0',''), ('126','交通费用','45','8','','text','1','','','Flow','0',''), ('127','餐费','45','9','','text','1','','','Flow','0',''), ('128','补贴','45','91','','text','1','','','Flow','0',''), ('129','申请人','19','1','','text','1','','','Flow','0',''), ('130','部门/科室','19','2','','text','1','','','Flow','0',''), ('131','招待地点','19','4','','text','1','','','Flow','0',''), ('132','招待时间','19','5','','datetime','1','','','Flow','0',''), ('133','招待费用','19','7','','text','2','','','Flow','0',''), ('134','招待目的','19','8','','editor','2','','','Flow','0',''), ('135','招待对象','19','3','','text','1','','','Flow','0',''), ('136','参加人员','19','6','','text','1','','','Flow','0',''), ('137','出差目的','45','3','','text','1','','','Flow','0',''), ('138','申请人','53','1','','text','1','','','Flow','0',''), ('139','部门/科室','53','2','','text','1','','','Flow','0',''), ('140','辅设备名','53','3','','text','1','','','Flow','0',''), ('141','数量','53','4','','text','1','','','Flow','0',''), ('142','型号规格','53','5','','text','1','','','Flow','0',''), ('143','预计费用','53','6','','text','1','','','Flow','0',''), ('144','申请理由','53','7','','editor','2','','','Flow','0',''), ('145','申请人','51','1','','text','1','','','Flow','0',''), ('146','部门/科室','51','2','','text','1','','','Flow','0',''), ('147','设备名称','51','3','','text','1','','','Flow','0',''), ('148','数量','51','4','','text','1','','','Flow','0',''), ('149','型号规格','51','5','','text','1','','','Flow','0',''), ('150','预计费用','51','6','','text','1','','','Flow','0',''), ('151','申请理由','51','7','','editor','2','','','Flow','0',''), ('152','申请人','52','1','','text','1','','','Flow','0',''), ('153','部门/科室','52','2','','text','1','','','Flow','0',''), ('154','辅材名称','52','3','','text','1','','','Flow','0',''), ('155','数量','52','4','','text','1','','','Flow','0',''), ('156','型号规格','52','5','','text','1','','','Flow','0',''), ('157','预计费用','52','6','','text','1','','','Flow','0',''), ('158','申请理由','52','7','','editor','2','','','Flow','0',''), ('159','申请人','39','1','','text','1','','','Flow','0',''), ('160','部门/科室','39','2','','text','1','','','Flow','0',''), ('161','原材料名称','39','3','','text','1','','','Flow','0',''), ('162','数量','39','4','','text','1','','','Flow','0',''), ('163','型号规格','39','5','','text','1','','','Flow','0',''), ('164','预计费用','39','6','','text','1','','','Flow','0',''), ('165','申请理由','39','7','','editor','2','','','Flow','0','');
INSERT INTO `xiaowei_udf_field` VALUES ('166','申请人','50','1','','text','1','','','Flow','0',''), ('167','部门/科室','50','2','','text','1','','','Flow','0',''), ('168','申请时间','50','3','','datetime','1','','','Flow','0',''), ('169','出差地点','50','4','','text','1','','','Flow','0',''), ('170','出差事由','50','9','','editor','2','','','Flow','0',''), ('171','去程','50','6','','text','1','','','Flow','0',''), ('172','回程','50','7','','text','1','','','Flow','0',''), ('173','出差开始时间','50','51','','datetime','1','','','Flow','0',''), ('176','出差结束时间','50','52','','datetime','1','','','Flow','0',''), ('177','申请人','49','1','','text','1','','','Flow','0',''), ('178','部门/科室','49','2','','text','1','','','Flow','0',''), ('179','目的/用途','49','3','','text','1','','','Flow','0',''), ('180','使用开始时间','49','4','','datetime','1','','','Flow','0',''), ('181','使用结束时间','49','5','','datetime','1','','','Flow','0',''), ('182','申请时间','49','21','','datetime','1','','','Flow','0',''), ('183','参会人','49','6','','text','2','','','Flow','0',''), ('184','申请人','42','1','','text','1','','','Flow','0',''), ('185','部门/科室','42','2','','text','1','','','Flow','0',''), ('186','申请理由','42','3','','text','1','','','Flow','0',''), ('187','办公用品名称以及数量','42','4','','editor','2','','','Flow','0',''), ('189','申请时间','42','21','','text','1','','','Flow','0',''), ('190','申请人','46','1','','text','1','','','Flow','0',''), ('191','部门/科室','46','2','','text','1','','','Flow','0',''), ('192','申请时间','46','3','','datetime','1','','','Flow','0',''), ('193','申请事由','46','5','','text','2','','','Flow','0',''), ('194','通讯报销金额','46','4','','text','1','','','Flow','0',''), ('195','申请人','47','1','','text','1','','','Flow','0',''), ('196','部门/科室','47','2','','text','1','','','Flow','0',''), ('197','申请日期','47','3','','datetime','1','','','Flow','0',''), ('199','出差开始时间','47','4','','datetime','1','','','Flow','0',''), ('200','出差结束时间','47','5','','datetime','1','','','Flow','0',''), ('201','出差事由','47','31','','text','1','','','Flow','0',''), ('202','实际使用费用','47','6','','text','1','','','Flow','0',''), ('203','标准费用','47','7','','text','1','','','Flow','0',''), ('204','交通费用明细','47','8','','editor','2','','','Flow','0',''), ('205','申请人','48','1','','text','1','','','Flow','0',''), ('206','部门/科室','48','2','','text','1','','','Flow','0',''), ('207','申请时间','48','3','','datetime','1','','','Flow','0',''), ('208','实际费用','48','4','','text','1','','','Flow','0',''), ('209','参加人员','48','5','','text','2','','','Flow','0',''), ('210','申请事由','48','41','','text','2','','','Flow','0',''), ('211','11111','37','','','link_select','1','dept','','Flow','0',''), ('212','11111111111','0','','','text','1','','','Crm','0',''), ('213','自定义字段','2','','','text','1','自定义字段','','Crm','0',''), ('214','任务补充','29','','','text','2','','','Task','0',''), ('215','任务地点','29','','','text','2','','','Task','0','');
INSERT INTO `xiaowei_user` VALUES ('1','admin','管理员','GLY','21232f297a57a5a743894a0e4a801fc3','1','5','male','2013-09-18','211.155.1.13','3131','Uploads/emp_pic/1.jpeg','smeoa@qq.com','1231254123123','5086-2222-2222','12123123','1222907803','1445409097','0','','1','1'), ('2','001','张三','ZS','21232f297a57a5a743894a0e4a801fc3','34','2','male','2015-09-30','127.0.0.1',NULL,'Uploads/emp_pic/2.jpeg','zhangsan@163.com','','123456788','12458874416','1443579353','1445566962','0','001','0','29'), ('3','002','李四','LS','21232f297a57a5a743894a0e4a801fc3','30','5','male','2015-10-01','127.0.0.1',NULL,'Uploads/emp_pic/3.jpeg','','','','','1444355626','1445409041','0','002','0','30'), ('4','003','王五','WW','e88a49bccde359f0cabb40db83ba6080','29','5','male','2015-10-09','221.214.54.122',NULL,'','wang@163.com','全负责','053112345678','13512345678','1444369577','1445409088','0','003','0','29'), ('10','004','004','','11364907cf269dd2183b64287156072a','30','3','male','2015-10-13',NULL,NULL,'','','','','','1444717182','1445409093','0','004','0','30'), ('11','005','大爷','DY','ce08becc73195df12d99d761bfbba68d','33','7','male','2015-09-29',NULL,NULL,NULL,'1215456654@163.com','只对董事会负责','126544551','1215456654','1445409234','0','0','005','0','30'), ('12','006','水电经理','SDJL','568628e0d993b1973adc718237da6e93','35','1','male','2015-10-01',NULL,NULL,NULL,'','','','','1445567011','0','0','006','0','29'), ('13','007','安防主管','AFZG','9e94b15ed312fa42232fd87a55db0d39','36','1','male','2015-10-01','202.110.253.130',NULL,NULL,'','','','','1445567042','0','0','007','0','29'), ('14','009','水电1','SD','dc5e819e186f11ef3f59e6c7d6830c35','35','7','male','2015-10-01','202.110.253.130',NULL,NULL,'','','','','1445567076','0','0','009','0','29'), ('15','010','安防1','AF','ea20a043c08f5168d4409ff4144f32e2','36','7','male','2015-10-01','221.214.54.122',NULL,NULL,'','','','','1445567109','0','0','010','0','29'), ('16','011','水电2','SD','84eb13cfed01764d9c401219faa56d53','35','7','male','2015-09-30','202.110.253.130',NULL,NULL,'','','','','1445567147','0','0','011','0','29'), ('17','012','安防2','AF','d2490f048dc3b77a457e3e450ab4eb38','36','7','male','2015-09-30','202.110.253.130',NULL,NULL,'','','','','1445567172','0','0','012','0','29');
INSERT INTO `xiaowei_user_config` VALUES ('1','undefined11,12,|21,22,','10','139','mail,flow,message','mail,flow,message'), ('2',NULL,'20',NULL,NULL,NULL), ('3',NULL,'20',NULL,NULL,NULL), ('4',NULL,'20',NULL,NULL,NULL), ('5',NULL,'20',NULL,NULL,NULL), ('6',NULL,'20',NULL,NULL,NULL), ('7',NULL,'20',NULL,NULL,NULL), ('8',NULL,'20',NULL,NULL,NULL), ('9',NULL,'20',NULL,NULL,NULL), ('10',NULL,'20',NULL,NULL,NULL), ('11',NULL,'20',NULL,NULL,NULL), ('12',NULL,'20',NULL,NULL,NULL), ('13',NULL,'20',NULL,NULL,NULL), ('14',NULL,'20',NULL,NULL,NULL), ('15',NULL,'20',NULL,NULL,NULL), ('16',NULL,'20',NULL,NULL,NULL), ('17',NULL,'20',NULL,NULL,NULL), ('33',NULL,'20',NULL,NULL,NULL), ('34',NULL,'20',NULL,NULL,NULL);
INSERT INTO `xiaowei_user_tag` VALUES ('21','0','Contact','1','123','','');
INSERT INTO `xiaowei_work_log` VALUES ('1','4','王五','29','企业A','1448329989','<p>热死人了几十块钱</p>','<p>饿了咳咳TOTO个咯是老婆婆咯了</p>','0000-00-00','0000-00-00','0','MDAwMDAwMDAwMIO3nXM;');
