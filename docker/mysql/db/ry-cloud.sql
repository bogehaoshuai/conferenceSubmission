/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.101.65
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 192.168.101.65:3306
 Source Schema         : ry-cloud

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 13/12/2023 20:43:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for base_allocation
-- ----------------------------
DROP TABLE IF EXISTS `base_allocation`;
CREATE TABLE `base_allocation`  (
  `allocation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分配id',
  `pc_id` bigint(20) NULL DEFAULT NULL COMMENT '审稿人id',
  `pc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审稿人名',
  `article_id` bigint(20) NULL DEFAULT NULL COMMENT '论文id',
  `article_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '论文名',
  `review_status_code` int(11) NULL DEFAULT NULL COMMENT '审核状态码',
  `review_status_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `comment` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '稿件评语',
  `confidence_code` int(11) NULL DEFAULT NULL COMMENT 'confidence_code',
  `confidence_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'confidence名',
  `score_code` int(11) NULL DEFAULT NULL COMMENT '稿件评分码',
  `score_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '稿件评分',
  PRIMARY KEY (`allocation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_allocation
-- ----------------------------
INSERT INTO `base_allocation` VALUES (158, 22, 'xiaoming123', 24, 'Good Paper', 1, '已审稿', 'This is not a good paper.', 2, NULL, 2, NULL);
INSERT INTO `base_allocation` VALUES (159, 23, 'zhangsan', 24, 'Good Paper', 1, '已审稿', 'this is a bad paper', 2, NULL, 2, NULL);
INSERT INTO `base_allocation` VALUES (160, 25, 'xiaohua', 24, 'Good Paper', 1, '已审稿', 'this is a good paper', 1, NULL, 1, NULL);
INSERT INTO `base_allocation` VALUES (161, 22, 'xiaoming123', 26, 'RestNet', 1, '已审稿', 'This is a good paper', -2, NULL, -2, NULL);
INSERT INTO `base_allocation` VALUES (162, 23, 'zhangsan', 26, 'RestNet', 1, '已审稿', 'this is a good paper', -2, NULL, -2, NULL);
INSERT INTO `base_allocation` VALUES (163, 25, 'xiaohua', 26, 'RestNet', 1, '已审稿', 'this is a bad paper', -1, NULL, -1, NULL);
INSERT INTO `base_allocation` VALUES (164, 22, 'xiaoming123', 27, 'Machine Learning', 1, '已审稿', 'this is a good paper', 2, NULL, 2, NULL);
INSERT INTO `base_allocation` VALUES (165, 23, 'zhangsan', 27, 'Machine Learning', 1, '已审稿', 'this is a good paper', 2, NULL, 2, NULL);
INSERT INTO `base_allocation` VALUES (166, 25, 'xiaohua', 27, 'Machine Learning', 1, '已审稿', 'this is a good paper', 2, NULL, 2, NULL);
INSERT INTO `base_allocation` VALUES (167, 22, 'xiaoming123', 29, 'Normal Paper', 1, '已审稿', '1', 1, NULL, 1, NULL);
INSERT INTO `base_allocation` VALUES (168, 23, 'zhangsan', 29, 'Normal Paper', 1, '已审稿', '1', -2, NULL, -2, NULL);
INSERT INTO `base_allocation` VALUES (169, 25, 'xiaohua', 29, 'Normal Paper', 1, '已审稿', '1', 2, NULL, 2, NULL);
INSERT INTO `base_allocation` VALUES (170, 22, 'xiaoming123', 25, 'Bad Paper', 1, '已审稿', '1', 1, NULL, 1, NULL);
INSERT INTO `base_allocation` VALUES (171, 23, 'zhangsan', 25, 'Bad Paper', 1, '已审稿', '1', 1, NULL, 2, NULL);
INSERT INTO `base_allocation` VALUES (172, 24, 'zhangliang', 25, 'Bad Paper', 1, '已审稿', '1', 1, NULL, 1, NULL);
INSERT INTO `base_allocation` VALUES (173, 25, 'xiaohua', 28, 'PC Management', 1, '已审稿', '1', 2, NULL, 2, NULL);
INSERT INTO `base_allocation` VALUES (174, 22, 'xiaoming123', 28, 'PC Management', 1, '已审稿', '1', 1, NULL, 1, NULL);
INSERT INTO `base_allocation` VALUES (175, 23, 'zhangsan', 28, 'PC Management', 1, '已审稿', '1', 2, NULL, 2, NULL);
INSERT INTO `base_allocation` VALUES (176, 24, 'zhangliang', 30, 'Software', 1, '已审稿', '1', 1, NULL, 1, NULL);
INSERT INTO `base_allocation` VALUES (177, 25, 'xiaohua', 30, 'Software', 1, '已审稿', '1', 2, NULL, 2, NULL);
INSERT INTO `base_allocation` VALUES (178, 22, 'xiaoming123', 30, 'Software', 1, '已审稿', '1', 1, NULL, 1, NULL);

-- ----------------------------
-- Table structure for base_article
-- ----------------------------
DROP TABLE IF EXISTS `base_article`;
CREATE TABLE `base_article`  (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `article_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章名',
  `article_abstract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章摘要',
  `article` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章',
  `conference_id` bigint(20) NOT NULL COMMENT '会议id',
  `conference_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议名',
  `article_status_code` int(11) NULL DEFAULT NULL COMMENT '文章状态码',
  `article_status_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章状态',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建用户id',
  `creator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户名',
  `topic_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章主题代码（逗号分隔）',
  `topic_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章主题标签（逗号分隔）',
  `topic_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章主题值（逗号分隔）',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_article
-- ----------------------------
INSERT INTO `base_article` VALUES (24, 'Good Paper', 'This is a good paper', 'http://127.0.0.1:9300/statics/2023/11/10/1001_20231110164703A001.pdf', 18, 'International Conference on Interconnected Research in Science and Technology', 4, '已录用', 26, 'huahua', '12,13', '机器学习,社会科学', 'ml,Soc');
INSERT INTO `base_article` VALUES (25, 'Bad Paper', 'This is a Bad Paper', 'http://127.0.0.1:9300/statics/2023/11/10/1001_20231110164703A001.pdf', 18, 'International Conference on Interconnected Research in Science and Technology', 4, '已录用', 26, 'huahua', '13,14', '社会科学,艺术', 'Soc,Art');
INSERT INTO `base_article` VALUES (26, 'RestNet', 'This is a paper about RestNet', 'http://127.0.0.1:9300/statics/2023/11/10/1001_20231110164703A001.pdf', 18, 'International Conference on Interconnected Research in Science and Technology', 99, '不录用', 26, 'huahua', '12,13,14', '机器学习,社会科学,艺术', 'ml,Soc,Art');
INSERT INTO `base_article` VALUES (27, 'Machine Learning', 'This is a paper about Machine Learning', 'http://127.0.0.1:9300/statics/2023/11/10/1001_20231110164703A001.pdf', 18, 'International Conference on Interconnected Research in Science and Technology', 4, '已录用', 26, 'huahua', '12', '机器学习', 'ml');
INSERT INTO `base_article` VALUES (28, 'PC Management', 'This is a paper about PC Management', 'http://127.0.0.1:9300/statics/2023/11/10/1001_20231110164703A001.pdf', 18, 'International Conference on Interconnected Research in Science and Technology', 4, '已录用', 26, 'huahua', '13', '社会科学', 'Soc');
INSERT INTO `base_article` VALUES (29, 'Normal Paper', 'This is a normal paper', 'http://127.0.0.1:9300/statics/2023/11/10/1001_20231110164703A001.pdf', 18, 'International Conference on Interconnected Research in Science and Technology', 99, '不录用', 26, 'huahua', '12', '机器学习', 'ml');
INSERT INTO `base_article` VALUES (30, 'Software', 'This is a paper about software.', 'http://127.0.0.1:9300/statics/2023/11/10/1001_20231110164703A001.pdf', 18, 'International Conference on Interconnected Research in Science and Technology', 4, '待审稿', 26, 'huahua', '13,14', '社会科学,艺术', 'Soc,Art');
INSERT INTO `base_article` VALUES (31, 'real normal paper', 'real normal paper', NULL, 17, 'International Conference on Cross-Disciplinary Advances in Technology and Innovation', 0, '待提交', 26, 'huahua', '9,10', '人工智能,环境', 'AI,Env');
INSERT INTO `base_article` VALUES (32, 'real normal paper', 'real normal paper', NULL, 17, 'International Conference on Cross-Disciplinary Advances in Technology and Innovation', 0, '待提交', 26, 'huahua', '9,10', '人工智能,环境', 'AI,Env');

-- ----------------------------
-- Table structure for base_author
-- ----------------------------
DROP TABLE IF EXISTS `base_author`;
CREATE TABLE `base_author`  (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '作者id',
  `author_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者姓名',
  `author_affiliation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者单位',
  `author_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家/地区',
  `author_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者邮箱',
  `article_id` bigint(20) NULL DEFAULT NULL COMMENT '文章id',
  `article_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章名',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`author_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_author
-- ----------------------------
INSERT INTO `base_author` VALUES (5, 'Lisi', 'fudan', 'shanghai', '11@123.com', 24, 'Good Paper', 0);
INSERT INTO `base_author` VALUES (6, 'wangwu', 'fudan', 'shanghai', '22@11.com', 24, 'Good Paper', 1);
INSERT INTO `base_author` VALUES (7, 'Lisi', 'fudan', 'shanghai', '11@123.com', 25, 'Bad Paper', 0);
INSERT INTO `base_author` VALUES (8, 'Lisi', 'fudan', 'shanghai', '11@123.com', 26, 'RestNet', 0);
INSERT INTO `base_author` VALUES (9, 'Lisi', 'fudan', 'shanghai', '11@123.com', 27, 'Machine Learning', 0);
INSERT INTO `base_author` VALUES (10, 'Lisi', 'fudan', 'shanghai', '11@123.com', 28, 'PC Management', 0);
INSERT INTO `base_author` VALUES (11, 'Lisi', 'fudan', 'shanghai', '11@123.com', 29, 'Normal Paper', 0);
INSERT INTO `base_author` VALUES (12, 'Lisi', 'fudan', 'shanghai', '11@123.com', 30, 'Software', 0);
INSERT INTO `base_author` VALUES (13, 'Lisi', 'fudan', 'shanghai', '11@123.com', 31, 'Good Paper', 0);
INSERT INTO `base_author` VALUES (14, 'Lisi', 'fudan', 'shanghai', '11@123.com', 32, 'Good Paper', 0);
INSERT INTO `base_author` VALUES (15, 'Lisi', 'fudan', 'shanghai', '11@123.com', 33, 'Good Paper', 0);
INSERT INTO `base_author` VALUES (16, 'Lisi', 'fudan', 'shanghai', '11@123.com', 34, 'Good Paper', 0);

-- ----------------------------
-- Table structure for base_confer_topic
-- ----------------------------
DROP TABLE IF EXISTS `base_confer_topic`;
CREATE TABLE `base_confer_topic`  (
  `topic_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主题编码',
  `topic_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题标签',
  `topic_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题键值',
  `conference_id` bigint(20) NULL DEFAULT NULL COMMENT '会议id',
  `conference_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议名',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（0正常 1停用）',
  PRIMARY KEY (`topic_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_confer_topic
-- ----------------------------
INSERT INTO `base_confer_topic` VALUES (9, '人工智能', 'AI', 17, 'International Conference on Cross-Disciplinary Advances in Technology and Innovation', '0');
INSERT INTO `base_confer_topic` VALUES (10, '环境', 'Env', 17, 'International Conference on Cross-Disciplinary Advances in Technology and Innovation', '0');
INSERT INTO `base_confer_topic` VALUES (11, '生物医学工程', 'BME', 17, 'International Conference on Cross-Disciplinary Advances in Technology and Innovation', '0');
INSERT INTO `base_confer_topic` VALUES (12, '机器学习', 'ml', 18, 'International Conference on Interconnected Research in Science and Technology', '0');
INSERT INTO `base_confer_topic` VALUES (13, '社会科学', 'Soc', 18, 'International Conference on Interconnected Research in Science and Technology', '0');
INSERT INTO `base_confer_topic` VALUES (14, '艺术', 'Art', 18, 'International Conference on Interconnected Research in Science and Technology', '0');
INSERT INTO `base_confer_topic` VALUES (15, '健康', 'Hea', 19, 'International Symposium on Integrative Research Across Disciplines', '0');

-- ----------------------------
-- Table structure for base_conference
-- ----------------------------
DROP TABLE IF EXISTS `base_conference`;
CREATE TABLE `base_conference`  (
  `conference_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会议id',
  `conference_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议全称',
  `conference_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议简称',
  `hold_date` date NULL DEFAULT NULL COMMENT '举办时间',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '举办地点',
  `deadline_date` date NULL DEFAULT NULL COMMENT '截止日期',
  `result_date` date NULL DEFAULT NULL COMMENT '结果日期',
  `chair_id` bigint(20) NOT NULL COMMENT '会议主席',
  `chair_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `conference_status_code` int(11) NULL DEFAULT NULL COMMENT '会议状态码',
  `conference_status_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议状态',
  PRIMARY KEY (`conference_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_conference
-- ----------------------------
INSERT INTO `base_conference` VALUES (17, 'International Conference on Cross-Disciplinary Advances in Technology and Innovation', 'ICCATI', '2023-12-26', 'ShangHai', '2023-11-28', '2023-12-05', 22, 'xiaoming123', 3, '投稿中');
INSERT INTO `base_conference` VALUES (18, 'International Conference on Interconnected Research in Science and Technology', 'ICIRST', '2023-12-28', 'Hangzhou', '2023-11-29', '2023-11-30', 22, 'xiaoming123', 5, '发布结果');
INSERT INTO `base_conference` VALUES (19, 'International Symposium on Integrative Research Across Disciplines', 'ISIRAD', '2024-11-20', 'Suzhou', '2023-11-30', '2023-12-14', 22, 'xiaoming123', 0, '待提交');

-- ----------------------------
-- Table structure for base_count
-- ----------------------------
DROP TABLE IF EXISTS `base_count`;
CREATE TABLE `base_count`  (
  `count_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '计数id',
  `pcId` bigint(20) NOT NULL COMMENT '审稿人id',
  `pcName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审稿人名',
  `conferenceId` bigint(20) NULL DEFAULT NULL COMMENT '会议id',
  `conferenceName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议名',
  `count` int(11) NULL DEFAULT NULL COMMENT '待审数量',
  PRIMARY KEY (`count_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_count
-- ----------------------------

-- ----------------------------
-- Table structure for base_invite
-- ----------------------------
DROP TABLE IF EXISTS `base_invite`;
CREATE TABLE `base_invite`  (
  `invite_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '邀请id',
  `conference_id` bigint(20) NOT NULL COMMENT '会议id',
  `conference_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议名',
  `chair_id` bigint(20) NULL DEFAULT NULL COMMENT '主席id',
  `chair_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主席名',
  `pc_id` bigint(20) NOT NULL COMMENT '审稿id',
  `pc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审稿名',
  `pc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审稿邮箱',
  `pc_affiliation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审稿单位',
  `pc_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审稿区域',
  `invite_status_code` int(11) NULL DEFAULT NULL COMMENT '邀请状态码',
  `invite_status_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请状态',
  `topic_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核主题编码（逗号分隔）',
  `topic_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核主题标签（逗号分隔）',
  `topic_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核主题键值（逗号分隔）',
  PRIMARY KEY (`invite_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_invite
-- ----------------------------
INSERT INTO `base_invite` VALUES (32, 17, 'International Conference on Cross-Disciplinary Advances in Technology and Innovation', 22, 'xiaoming123', 22, 'xiaoming123', '7666@fdu.cn', 'fudan', 'shanghai', 1, '已确认', '9,10,11', '人工智能,环境,生物医学工程', 'AI,Env,BME');
INSERT INTO `base_invite` VALUES (33, 18, 'International Conference on Interconnected Research in Science and Technology', 22, 'xiaoming123', 22, 'xiaoming123', '7666@fdu.cn', 'fudan', 'shanghai', 1, '已确认', '12,13,14', '机器学习,社会科学,艺术', 'ml,Soc,Art');
INSERT INTO `base_invite` VALUES (34, 18, 'International Conference on Interconnected Research in Science and Technology', 22, 'xiaoming123', 23, 'zhangsan', '5676879@fdu.cn', 'fdu', 'shanghai', 1, '待确认', '12,13,14', '机器学习,社会科学,艺术', 'ml,Soc,Art');
INSERT INTO `base_invite` VALUES (35, 18, 'International Conference on Interconnected Research in Science and Technology', 22, 'xiaoming123', 24, 'zhangliang', 's76@fdu.cn', 'fudan', 'shanghai', 1, '待确认', '13', '社会科学', 'Soc');
INSERT INTO `base_invite` VALUES (36, 18, 'International Conference on Interconnected Research in Science and Technology', 22, 'xiaoming123', 25, 'xiaohua', '4567@fdu.cn', 'fudan', 'shanghai', 1, '待确认', '13,12', '社会科学,机器学习', 'Soc,ml');
INSERT INTO `base_invite` VALUES (37, 17, 'International Conference on Cross-Disciplinary Advances in Technology and Innovation', 22, 'xiaoming123', 23, 'zhangsan', '5676879@fdu.cn', 'fdu', 'shanghai', 0, '待确认', NULL, NULL, NULL);
INSERT INTO `base_invite` VALUES (38, 17, 'International Conference on Cross-Disciplinary Advances in Technology and Innovation', 22, 'xiaoming123', 24, 'zhangliang', 's76@fdu.cn', 'fudan', 'shanghai', 0, '待确认', NULL, NULL, NULL);
INSERT INTO `base_invite` VALUES (39, 17, 'International Conference on Cross-Disciplinary Advances in Technology and Innovation', 22, 'xiaoming123', 25, 'xiaohua', '4567@fdu.cn', 'fudan', 'shanghai', 0, '待确认', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for base_rebuttal
-- ----------------------------
DROP TABLE IF EXISTS `base_rebuttal`;
CREATE TABLE `base_rebuttal`  (
  `rebuttal_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'rebuttal_id',
  `article_id` bigint(20) NULL DEFAULT NULL COMMENT '文章id',
  `article_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章名',
  `accept_code` bigint(20) NULL DEFAULT NULL COMMENT '录用码',
  `accept_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录用标签',
  `rebuttal_message` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'rebuttal消息',
  PRIMARY KEY (`rebuttal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_rebuttal
-- ----------------------------
INSERT INTO `base_rebuttal` VALUES (10, 24, 'Good Paper', NULL, NULL, 'This is a good paper');
INSERT INTO `base_rebuttal` VALUES (11, 26, 'RestNet', NULL, NULL, 'this is a good paper');

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP', 'spring:\n  autoconfigure:\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n', 'aaa73b809cfd4d0058893aa13da57806', '2020-05-20 12:00:00', '2022-04-24 10:26:34', 'nacos', '0:0:0:0:0:0:0:1', '', '', '通用配置', 'null', 'null', 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (2, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    # host: localhost\n    host: 192.168.101.65\n    port: 6379\n    password:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n        # 会议服务\n        - id: ruoyi-base\n          uri: lb://ruoyi-base\n          predicates:\n            - Path=/base/**\n          filters:\n            - StripPrefix=1    \n        # 投稿服务\n        - id: ruoyi-contribute\n          uri: lb://ruoyi-contribute\n          predicates:\n            - Path=/contribute/**\n          filters:\n            - StripPrefix=1 \n        # 审稿服务\n        - id: ruoyi-review\n          uri: lb://ruoyi-review\n          predicates:\n            - Path=/review/**\n          filters:\n            - StripPrefix=1 \n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', 'd2dcf132fe5d751e18431290249c27a8', '2020-05-14 14:17:55', '2023-11-18 11:37:07', NULL, '192.168.101.5', '', '', '网关模块', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (3, 'ruoyi-auth-dev.yml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password:\n', '8f9ee2f9545ca0fe38f21c8aeaf79220', '2020-11-20 00:00:00', '2023-11-05 02:11:03', NULL, '192.168.101.5', '', '', '认证中心', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (4, 'ruoyi-monitor-dev.yml', 'DEFAULT_GROUP', '# spring\nspring:\n  security:\n    user:\n      name: ruoyi\n      password: 123456\n  boot:\n    admin:\n      ui:\n        title: 若依服务状态监控\n', '6f122fd2bfb8d45f858e7d6529a9cd44', '2020-11-20 00:00:00', '2022-09-29 02:48:54', 'nacos', '0:0:0:0:0:0:0:1', '', '', '监控中心', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (5, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring:\n  redis:\n    # host: localhost\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: system API document\n  # title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', 'ad38a4629392361ebf1e17343cdbc289', '2020-11-20 00:00:00', '2023-11-09 12:08:08', NULL, '192.168.101.5', '', '', '系统模块', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (6, 'ruoyi-gen-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: 123456\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.gen.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 代码生成接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n\n# 代码生成\ngen:\n  # 作者\n  author: ruoyi\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\n  packageName: com.ruoyi.system\n  # 自动去除表前缀，默认是false\n  autoRemovePre: false\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\n  tablePrefix: sys_\n', '4d40d0b32142d850c98947a9facc8c26', '2020-11-20 00:00:00', '2023-11-05 05:07:18', NULL, '192.168.101.5', '', '', '代码生成', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (7, 'ruoyi-job-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: 123456\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.job.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n', '67cf6cae17280f7d2d4d9a305b32374d', '2020-11-20 00:00:00', '2023-11-05 05:00:55', NULL, '192.168.101.5', '', '', '定时任务', 'null', 'null', 'yaml', '', '');
INSERT INTO `config_info` VALUES (8, 'ruoyi-file-dev.yml', 'DEFAULT_GROUP', '# 本地文件上传    \r\nfile:\r\n    domain: http://127.0.0.1:9300\r\n    path: D:/ruoyi/uploadPath\r\n    prefix: /statics\r\n\r\n# FastDFS配置\r\nfdfs:\r\n  domain: http://8.129.231.12\r\n  soTimeout: 3000\r\n  connectTimeout: 2000\r\n  trackerList: 8.129.231.12:22122\r\n\r\n# Minio配置\r\nminio:\r\n  url: http://8.129.231.12:9000\r\n  accessKey: minioadmin\r\n  secretKey: minioadmin\r\n  bucketName: test', '5382b93f3d8059d6068c0501fdd41195', '2020-11-20 00:00:00', '2020-12-21 21:01:59', NULL, '0:0:0:0:0:0:0:1', '', '', '文件服务', 'null', 'null', 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (9, 'sentinel-ruoyi-gateway', 'DEFAULT_GROUP', '[\r\n    {\r\n        \"resource\": \"ruoyi-auth\",\r\n        \"count\": 500,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"ruoyi-system\",\r\n        \"count\": 1000,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"ruoyi-gen\",\r\n        \"count\": 200,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"ruoyi-job\",\r\n        \"count\": 300,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    }\r\n]', '9f3a3069261598f74220bc47958ec252', '2020-11-20 00:00:00', '2020-11-20 00:00:00', NULL, '0:0:0:0:0:0:0:1', '', '', '限流策略', 'null', 'null', 'json', NULL, '');
INSERT INTO `config_info` VALUES (10, 'ruoyi-base-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.base.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n', '9507329daebc14025c08086c289e718c', '2023-11-07 01:35:06', '2023-11-16 11:06:53', 'nacos', '192.168.101.1', '', '', '', '', '', 'yaml', '', NULL);
INSERT INTO `config_info` VALUES (28, 'ruoyi-review-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.review.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '4453f59ec43285f2aab1196f18114627', '2023-11-18 07:51:27', '2023-11-18 07:52:36', 'nacos', '192.168.101.1', '', '', '', '', '', 'yaml', '', NULL);
INSERT INTO `config_info` VALUES (31, 'ruoyi-contribute-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.contribute.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '24c1a29e8d8d3d6a83d1a2b50d475bc2', '2023-11-18 11:35:46', '2023-11-18 11:36:12', NULL, '192.168.101.5', '', '', '', '', '', 'yaml', '', NULL);

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'base_conference', '会议表', NULL, NULL, 'BaseConference', 'crud', 'com.ruoyi.base', 'base', 'conference', '会议管理', 'null', '0', '/', '{\"parentMenuId\":\"1061\"}', 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55', NULL);
INSERT INTO `gen_table` VALUES (3, 'base_article', '文章管理', NULL, NULL, 'BaseArticle', 'crud', 'com.ruoyi.contribute', 'contribute', 'article', '文章管理', 'null', '0', '/', '{\"parentMenuId\":\"1061\"}', 'admin', '2023-11-06 13:11:06', '', '2023-11-19 07:38:37', NULL);
INSERT INTO `gen_table` VALUES (6, 'base_invite', '邀请表', NULL, NULL, 'BaseInvite', 'crud', 'com.ruoyi.base', 'base', 'invite', '邀请审稿', 'null', '0', '/', '{\"parentMenuId\":\"1061\"}', 'admin', '2023-11-08 14:35:36', '', '2023-11-09 02:09:47', NULL);
INSERT INTO `gen_table` VALUES (9, 'base_confer_topic', '主题表', NULL, NULL, 'BaseConferTopic', 'crud', 'com.ruoyi.base', 'base', 'topic', '会议主题', 'null', '0', '/', '{}', 'admin', '2023-11-16 12:34:52', '', '2023-11-16 12:36:22', NULL);
INSERT INTO `gen_table` VALUES (11, 'base_author', '作者信息表', NULL, NULL, 'BaseAuthor', 'crud', 'com.ruoyi.article', 'article', 'author', '作者信息', 'null', '0', '/', '{}', 'admin', '2023-11-18 08:17:48', '', '2023-11-18 08:23:48', NULL);
INSERT INTO `gen_table` VALUES (13, 'base_allocation', '稿件分配表', NULL, NULL, 'BaseAllocation', 'crud', 'com.ruoyi.review', 'review', 'allocation', '稿件分配', 'null', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32', NULL);
INSERT INTO `gen_table` VALUES (14, 'base_count', '审稿数量表', NULL, NULL, 'BaseCount', 'crud', 'com.ruoyi.review', 'review', 'count', '审稿数量', 'null', '0', '/', '{}', 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:43:40', NULL);
INSERT INTO `gen_table` VALUES (15, 'base_rebuttal', 'rebuttal表', NULL, NULL, 'BaseRebuttal', 'crud', 'com.ruoyi.review', 'review', 'rebuttal', 'rebuttal', 'null', '0', '/', '{}', 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:44:53', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (10, 2, 'conference_id', '会议id', 'bigint(20)', 'Long', 'conferenceId', '1', '0', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55');
INSERT INTO `gen_table_column` VALUES (11, 2, 'conference_name', '会议全称', 'varchar(255)', 'String', 'conferenceName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55');
INSERT INTO `gen_table_column` VALUES (12, 2, 'conference_nickname', '会议简称', 'varchar(255)', 'String', 'conferenceNickname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55');
INSERT INTO `gen_table_column` VALUES (13, 2, 'hold_date', '举办时间', 'date', 'Date', 'holdDate', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 4, 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55');
INSERT INTO `gen_table_column` VALUES (14, 2, 'place', '举办地点', 'varchar(255)', 'String', 'place', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55');
INSERT INTO `gen_table_column` VALUES (15, 2, 'deadline_date', '截止日期', 'date', 'Date', 'deadlineDate', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 6, 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55');
INSERT INTO `gen_table_column` VALUES (16, 2, 'result_date', '结果日期', 'date', 'Date', 'resultDate', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 7, 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55');
INSERT INTO `gen_table_column` VALUES (17, 2, 'chair_id', '会议主席', 'bigint(20)', 'Long', 'chairId', '0', '0', '1', '1', '0', '0', '1', 'EQ', 'input', '', 8, 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55');
INSERT INTO `gen_table_column` VALUES (18, 2, 'chair_name', '主席名', 'varchar(255)', 'String', 'chairName', '0', '0', NULL, '1', '0', '0', '1', 'LIKE', 'input', '', 9, 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55');
INSERT INTO `gen_table_column` VALUES (19, 2, 'conference_status_code', '会议状态码', 'int(4)', 'Integer', 'conferenceStatusCode', '0', '0', NULL, '1', '0', '0', '1', 'EQ', 'select', 'conference_status_code', 10, 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55');
INSERT INTO `gen_table_column` VALUES (20, 2, 'conference_status_name', '会议状态', 'varchar(255)', 'String', 'conferenceStatusName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'select', 'conference_status_code', 11, 'admin', '2023-11-06 13:11:01', '', '2023-11-07 09:59:55');
INSERT INTO `gen_table_column` VALUES (21, 3, 'article_id', '文章id', 'bigint(20)', 'Long', 'articleId', '1', '0', '0', '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2023-11-06 13:11:06', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (22, 3, 'article_name', '文章名', 'varchar(255)', 'String', 'articleName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-11-06 13:11:06', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (23, 3, 'article_abstract', '文章摘要', 'varchar(255)', 'String', 'articleAbstract', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-06 13:11:06', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (24, 3, 'article', '文章', 'varchar(255)', 'String', 'article', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-06 13:11:06', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (25, 3, 'conference_id', '会议id', 'bigint(20)', 'Long', 'conferenceId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-06 13:11:07', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (26, 3, 'conference_name', '会议名', 'varchar(255)', 'String', 'conferenceName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-11-06 13:11:07', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (53, 6, 'invite_id', '邀请id', 'bigint(20)', 'Long', 'inviteId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (54, 6, 'conference_id', '会议id', 'bigint(20)', 'Long', 'conferenceId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (55, 6, 'conference_name', '会议名', 'varchar(255)', 'String', 'conferenceName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (56, 6, 'chair_id', '主席id', 'bigint(20)', 'Long', 'chairId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (57, 6, 'chair_name', '主席名', 'varchar(255)', 'String', 'chairName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (58, 6, 'pc_id', '审稿id', 'bigint(20)', 'Long', 'pcId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (59, 6, 'pc_name', '审稿名', 'varchar(255)', 'String', 'pcName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (60, 6, 'pc_email', '审稿邮箱', 'varchar(255)', 'String', 'pcEmail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (61, 6, 'pc_affiliation', '审稿单位', 'varchar(255)', 'String', 'pcAffiliation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (62, 6, 'pc_place', '审稿区域', 'varchar(255)', 'String', 'pcPlace', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (63, 6, 'invite_status_code', '邀请状态码', 'int(4)', 'Long', 'inviteStatusCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'invite_status_code', 11, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (64, 6, 'invite_status_name', '邀请状态', 'varchar(255)', 'String', 'inviteStatusName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', 'invite_status_code', 12, 'admin', '2023-11-08 14:35:36', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (76, 9, 'topic_code', '主题编码', 'bigint(20)', 'Long', 'topicCode', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-16 12:34:52', '', '2023-11-16 12:36:22');
INSERT INTO `gen_table_column` VALUES (77, 9, 'topic_label', '主题标签', 'varchar(100)', 'String', 'topicLabel', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-11-16 12:34:52', '', '2023-11-16 12:36:22');
INSERT INTO `gen_table_column` VALUES (78, 9, 'topic_value', '主题键值', 'varchar(100)', 'String', 'topicValue', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-11-16 12:34:52', '', '2023-11-16 12:36:22');
INSERT INTO `gen_table_column` VALUES (79, 9, 'conference_id', '会议id', 'bigint(20)', 'Long', 'conferenceId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-16 12:34:52', '', '2023-11-16 12:36:22');
INSERT INTO `gen_table_column` VALUES (80, 9, 'conference_name', '会议名', 'varchar(100)', 'String', 'conferenceName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-11-16 12:34:52', '', '2023-11-16 12:36:22');
INSERT INTO `gen_table_column` VALUES (81, 9, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 6, 'admin', '2023-11-16 12:34:52', '', '2023-11-16 12:36:22');
INSERT INTO `gen_table_column` VALUES (90, 11, 'author_id', '作者id', 'bigint(20)', 'Long', 'authorId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-18 08:17:48', '', '2023-11-18 08:23:48');
INSERT INTO `gen_table_column` VALUES (91, 11, 'author_name', '作者姓名', 'varchar(255)', 'String', 'authorName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-11-18 08:17:48', '', '2023-11-18 08:23:48');
INSERT INTO `gen_table_column` VALUES (92, 11, 'author_affiliation', '作者单位', 'varchar(255)', 'String', 'authorAffiliation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-18 08:17:48', '', '2023-11-18 08:23:48');
INSERT INTO `gen_table_column` VALUES (93, 11, 'author_place', '国家/地区', 'varchar(255)', 'String', 'authorPlace', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-18 08:17:48', '', '2023-11-18 08:23:48');
INSERT INTO `gen_table_column` VALUES (94, 11, 'author_email', '作者邮箱', 'varchar(255)', 'String', 'authorEmail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-18 08:17:48', '', '2023-11-18 08:23:48');
INSERT INTO `gen_table_column` VALUES (95, 11, 'article_id', '文章id', 'bigint(20)', 'Long', 'articleId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-18 08:17:48', '', '2023-11-18 08:23:48');
INSERT INTO `gen_table_column` VALUES (96, 11, 'article_name', '文章名', 'varchar(255)', 'String', 'articleName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2023-11-18 08:17:48', '', '2023-11-18 08:23:48');
INSERT INTO `gen_table_column` VALUES (97, 11, 'order_num', '顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2023-11-18 08:17:48', '', '2023-11-18 08:23:48');
INSERT INTO `gen_table_column` VALUES (108, 13, 'allocation_id', '分配id', 'bigint(20)', 'Long', 'allocationId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (109, 13, 'pc_id', '审稿人id', 'bigint(20)', 'Long', 'pcId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (110, 13, 'pc_name', '审稿人名', 'varchar(255)', 'String', 'pcName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (111, 13, 'article_id', '论文id', 'bigint(20)', 'Long', 'articleId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (112, 13, 'article_name', '论文名', 'varchar(255)', 'String', 'articleName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (113, 13, 'review_status_code', '审稿状态码', 'int(11)', 'Long', 'reviewStatusCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'review_status_code', 6, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (114, 13, 'review_status_name', '审稿状态', 'varchar(255)', 'String', 'reviewStatusName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'select', 'review_status_code', 7, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (115, 13, 'comment', '稿件评语', 'varchar(800)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 8, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (116, 13, 'confidence_code', 'confidence_code', 'int(11)', 'Long', 'confidenceCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'confidence_code', 9, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (117, 13, 'confidence_name', 'confidence名', 'varchar(255)', 'String', 'confidenceName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'select', 'confidence_code', 10, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (118, 13, 'score_code', '稿件评分码', 'int(11)', 'Long', 'scoreCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'score_code', 11, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (119, 13, 'score_name', '稿件评分', 'varchar(255)', 'String', 'scoreName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'select', 'score_code', 12, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:42:32');
INSERT INTO `gen_table_column` VALUES (120, 14, 'count_id', '计数id', 'bigint(20)', 'Long', 'countId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:43:40');
INSERT INTO `gen_table_column` VALUES (121, 14, 'pcId', '审稿人id', 'bigint(20)', 'Long', 'pcId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:43:40');
INSERT INTO `gen_table_column` VALUES (122, 14, 'pcName', '审稿人名', 'varchar(255)', 'String', 'pcName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:43:40');
INSERT INTO `gen_table_column` VALUES (123, 14, 'conferenceId', '会议id', 'bigint(20)', 'Long', 'conferenceId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:43:40');
INSERT INTO `gen_table_column` VALUES (124, 14, 'conferenceName', '会议名', 'varchar(255)', 'String', 'conferenceName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:43:40');
INSERT INTO `gen_table_column` VALUES (125, 14, 'count', '待审数量', 'int(20)', 'Long', 'count', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:43:40');
INSERT INTO `gen_table_column` VALUES (126, 15, 'rebuttal_id', 'rebuttal_id', 'bigint(20)', 'Long', 'rebuttalId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:44:53');
INSERT INTO `gen_table_column` VALUES (127, 15, 'article_id', '文章id', 'bigint(20)', 'Long', 'articleId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:44:53');
INSERT INTO `gen_table_column` VALUES (128, 15, 'article_name', '文章名', 'varchar(255)', 'String', 'articleName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:44:53');
INSERT INTO `gen_table_column` VALUES (129, 15, 'accept_code', '录用码', 'bigint(20)', 'Long', 'acceptCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'accept_code', 4, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:44:53');
INSERT INTO `gen_table_column` VALUES (130, 15, 'accept_label', '录用标签', 'varchar(255)', 'String', 'acceptLabel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'accept_code', 5, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:44:53');
INSERT INTO `gen_table_column` VALUES (131, 15, 'rebuttal_message', 'rebuttal消息', 'varchar(800)', 'String', 'rebuttalMessage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2023-11-19 05:21:32', '', '2023-11-19 05:44:53');
INSERT INTO `gen_table_column` VALUES (132, 3, 'article_status_code', '文章状态码', 'int(10)', 'Long', 'articleStatusCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'article_status_code', 7, '', '2023-11-19 07:36:44', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (133, 3, 'article_status_name', '文章状态', 'varchar(255)', 'String', 'articleStatusName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'select', 'article_status_code', 8, '', '2023-11-19 07:36:44', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (134, 3, 'creator_id', '创建用户id', 'bigint(20)', 'Long', 'creatorId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2023-11-19 07:53:48', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (135, 3, 'creator_name', '创建用户名', 'varchar(255)', 'String', 'creatorName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 10, '', '2023-11-19 07:53:48', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (144, 6, 'topic_code', '审核主题编码（逗号分隔）', 'bigint(20)', 'String', 'topicCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, '', '2023-11-20 06:23:31', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (145, 6, 'topic_label', '审核主题标签（逗号分隔）', 'varchar(255)', 'String', 'topicLabel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, '', '2023-11-20 06:23:31', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (146, 6, 'topic_value', '审核主题键值（逗号分隔）', 'varchar(255)', 'String', 'topicValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, '', '2023-11-20 06:23:31', '', '2023-11-20 10:56:23');
INSERT INTO `gen_table_column` VALUES (147, 3, 'topic_code', '文章主题代码（逗号分隔）', 'bigint(20)', 'String', 'topicCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, '', '2023-11-20 06:23:39', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (148, 3, 'topic_label', '文章主题标签（逗号分隔）', 'varchar(255)', 'String', 'topicLabel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, '', '2023-11-20 06:23:39', '', '2023-11-20 10:56:20');
INSERT INTO `gen_table_column` VALUES (149, 3, 'topic_value', '文章主题值（逗号分隔）', 'varchar(255)', 'String', 'topicValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, '', '2023-11-20 06:23:39', '', '2023-11-20 10:56:20');

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (5, 1, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: password\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '48e0ed4a040c402bdc2444213a82c910', '2023-11-05 02:10:20', '2023-11-05 02:10:13', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (2, 2, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '57cec5abd0e0a6b77d853750344a9dc0', '2023-11-05 02:10:45', '2023-11-05 02:10:46', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (3, 3, 'ruoyi-auth-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n', '8bd9dada9a94822feeab40de55efced6', '2023-11-05 02:11:03', '2023-11-05 02:11:03', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (6, 4, 'ruoyi-gen-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: password\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.gen.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 代码生成接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n\n# 代码生成\ngen:\n  # 作者\n  author: ruoyi\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\n  packageName: com.ruoyi.system\n  # 自动去除表前缀，默认是false\n  autoRemovePre: false\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\n  tablePrefix: sys_\n', 'eb592420b3fceae1402881887b8a6a0d', '2023-11-05 02:11:46', '2023-11-05 02:11:47', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (7, 5, 'ruoyi-job-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: password\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.job.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n', 'edcf0e3fe13fea07b4ec08b1088f30b3', '2023-11-05 02:12:26', '2023-11-05 02:12:27', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (5, 6, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '64a79614ffe2dd80a56f695a90111f5e', '2023-11-05 02:52:16', '2023-11-05 02:52:17', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (5, 7, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            # driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '28e971af591b163361784f0873b32e8c', '2023-11-05 02:52:41', '2023-11-05 02:52:42', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (5, 8, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            # driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '28e971af591b163361784f0873b32e8c', '2023-11-05 02:58:41', '2023-11-05 02:58:40', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (5, 9, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.jdbc.Driver\n            # driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '2078bd481b26b2256ddd0aafdd3f21bd', '2023-11-05 03:00:24', '2023-11-05 03:00:25', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (2, 10, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '9886dc335ba566534b2ea866d9dd5ad8', '2023-11-05 03:27:00', '2023-11-05 03:27:01', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (2, 11, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    # host: 192.168.101.65\n    port: 6379\n    password:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '9132d027af5c34ecfc7712b1613ec65c', '2023-11-05 03:27:42', '2023-11-05 03:27:43', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (5, 12, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '1ff6cef15c17371b2de388433674d774', '2023-11-05 03:29:27', '2023-11-05 03:29:28', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (5, 13, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: localhost\n    # host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '5f78a6a7ae4b1443cd93b7439954d478', '2023-11-05 03:52:22', '2023-11-05 03:52:22', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (5, 14, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    # host: localhost\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '15ecb167936bdf458fb1337ab27d6b95', '2023-11-05 04:13:50', '2023-11-05 04:13:50', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (7, 15, 'ruoyi-job-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: 123456\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.job.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n', '6b7821bc0afc577f349184a613da6a4e', '2023-11-05 05:00:55', '2023-11-05 05:00:55', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (6, 16, 'ruoyi-gen-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: 123456\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.gen.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 代码生成接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n\n# 代码生成\ngen:\n  # 作者\n  author: ruoyi\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\n  packageName: com.ruoyi.system\n  # 自动去除表前缀，默认是false\n  autoRemovePre: false\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\n  tablePrefix: sys_\n', '108695754ee12e56ef5d399e79d0bed7', '2023-11-05 05:07:17', '2023-11-05 05:07:18', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (0, 17, 'ruoyi-base-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\r\nspring:\r\n  redis:\r\n    host: 192.168.101.65\r\n    port: 6379\r\n    password: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: 123456\r\n\r\n# mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.ruoyi.base.domain\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml\r\n\r\n# swagger配置\r\nswagger:\r\n  title: 定时任务接口文档\r\n  license: Powered By ruoyi\r\n  licenseUrl: https://ruoyi.vip\r\n', '05ee664bca352b1b783bbede46531a1c', '2023-11-07 01:35:05', '2023-11-07 01:35:06', NULL, '192.168.101.5', 'I', '', NULL);
INSERT INTO `his_config_info` VALUES (2, 18, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    # host: localhost\n    host: 192.168.101.65\n    port: 6379\n    password:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', 'e8ecd06d08931595670ee0162606d5f6', '2023-11-07 02:12:29', '2023-11-07 02:12:27', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (10, 19, 'ruoyi-base-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\r\nspring:\r\n  redis:\r\n    host: 192.168.101.65\r\n    port: 6379\r\n    password: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: 123456\r\n\r\n# mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.ruoyi.base.domain\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml\r\n\r\n# swagger配置\r\nswagger:\r\n  title: 定时任务接口文档\r\n  license: Powered By ruoyi\r\n  licenseUrl: https://ruoyi.vip\r\n', '05ee664bca352b1b783bbede46531a1c', '2023-11-09 07:47:03', '2023-11-09 07:47:02', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (10, 20, 'ruoyi-base-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.base.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n', '306d3a73ec659e88581aea54fbb9a9c0', '2023-11-09 08:26:18', '2023-11-09 08:26:18', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (10, 21, 'ruoyi-base-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    dynamic:\n      primary: master\n    master:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n         url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n         username: root\n         password: 123456\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.base.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n', '7d183fa4bff68870b0b9a0eea31f2672', '2023-11-09 08:28:28', '2023-11-09 08:28:28', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (10, 22, 'ruoyi-base-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    dynamic:\n      primary: master\n    datasource:\n      master:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n        username: root\n        password: 123456\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.base.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n', '7660d8020a2c9b2cae8ce65bd3cd4475', '2023-11-09 08:29:54', '2023-11-09 08:29:55', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (10, 23, 'ruoyi-base-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.base.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n', '4e4e6cbdc75683af054a79238d5b9c14', '2023-11-09 08:30:35', '2023-11-09 08:30:36', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (5, 24, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    # host: localhost\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: system API document\n  # title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', 'ad38a4629392361ebf1e17343cdbc289', '2023-11-09 12:05:56', '2023-11-09 12:05:56', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (5, 25, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    # host: localhost\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*\n\n# swagger配置\nswagger:\n  title: system API document\n  # title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '8bafcaf60f3717fb24a09928bee5ff76', '2023-11-09 12:07:24', '2023-11-09 12:07:24', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (5, 26, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    # host: localhost\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mybatis/mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: system API document\n  # title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '02f92218fe74166c9fc2988d10d47678', '2023-11-09 12:08:08', '2023-11-09 12:08:08', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (10, 27, 'ruoyi-base-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.base.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n', '9507329daebc14025c08086c289e718c', '2023-11-16 19:02:30', '2023-11-16 11:02:29', 'nacos', '192.168.101.1', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (10, 28, 'ruoyi-base-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      primary: master\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.base.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n', 'ccca7b4151ef0554f20075606b29ef7f', '2023-11-16 19:06:53', '2023-11-16 11:06:53', 'nacos', '192.168.101.1', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (0, 29, 'ruoyi-article-dev', 'DEFAULT_GROUP', '', '# spring配置\r\nspring:\r\n  redis:\r\n    host: 192.168.101.65\r\n    port: 6379\r\n    password: \r\n  datasource:\r\n    druid:\r\n      stat-view-servlet:\r\n        enabled: true\r\n        loginUsername: admin\r\n        loginPassword: 123456\r\n    dynamic:\r\n      druid:\r\n        initial-size: 5\r\n        min-idle: 5\r\n        maxActive: 20\r\n        maxWait: 60000\r\n        timeBetweenEvictionRunsMillis: 60000\r\n        minEvictableIdleTimeMillis: 300000\r\n        validationQuery: SELECT 1 FROM DUAL\r\n        testWhileIdle: true\r\n        testOnBorrow: false\r\n        testOnReturn: false\r\n        poolPreparedStatements: true\r\n        maxPoolPreparedStatementPerConnectionSize: 20\r\n        filters: stat,slf4j\r\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\r\n      datasource:\r\n          # 主库数据源\r\n          master:\r\n            driver-class-name: com.mysql.cj.jdbc.Driver\r\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n            username: root\r\n            password: 123456\r\n          # 从库数据源\r\n          # slave:\r\n            # username: \r\n            # password: \r\n            # url: \r\n            # driver-class-name: \r\n\r\n# mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.ruoyi.article.domain\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml\r\n\r\n# swagger配置\r\nswagger:\r\n  title: 定时任务接口文档\r\n  license: Powered By ruoyi\r\n  licenseUrl: https://ruoyi.vip', 'f8d04eb952ff0eb4d0d0f971f1543867', '2023-11-16 20:46:41', '2023-11-16 12:46:40', NULL, '192.168.101.1', 'I', '', NULL);
INSERT INTO `his_config_info` VALUES (2, 30, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    # host: localhost\n    host: 192.168.101.65\n    port: 6379\n    password:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-base\n          uri: lb://ruoyi-base\n          predicates:\n            - Path=/base/**\n          filters:\n            - StripPrefix=1    \n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', 'd841d8105b296d51a13f009e5d27af09', '2023-11-16 21:01:14', '2023-11-16 13:01:12', 'nacos', '192.168.101.1', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (21, 31, 'ruoyi-article-dev', 'DEFAULT_GROUP', '', '# spring配置\r\nspring:\r\n  redis:\r\n    host: 192.168.101.65\r\n    port: 6379\r\n    password: \r\n  datasource:\r\n    druid:\r\n      stat-view-servlet:\r\n        enabled: true\r\n        loginUsername: admin\r\n        loginPassword: 123456\r\n    dynamic:\r\n      druid:\r\n        initial-size: 5\r\n        min-idle: 5\r\n        maxActive: 20\r\n        maxWait: 60000\r\n        timeBetweenEvictionRunsMillis: 60000\r\n        minEvictableIdleTimeMillis: 300000\r\n        validationQuery: SELECT 1 FROM DUAL\r\n        testWhileIdle: true\r\n        testOnBorrow: false\r\n        testOnReturn: false\r\n        poolPreparedStatements: true\r\n        maxPoolPreparedStatementPerConnectionSize: 20\r\n        filters: stat,slf4j\r\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\r\n      datasource:\r\n          # 主库数据源\r\n          master:\r\n            driver-class-name: com.mysql.cj.jdbc.Driver\r\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n            username: root\r\n            password: 123456\r\n          # 从库数据源\r\n          # slave:\r\n            # username: \r\n            # password: \r\n            # url: \r\n            # driver-class-name: \r\n\r\n# mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.ruoyi.article.domain\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml\r\n\r\n# swagger配置\r\nswagger:\r\n  title: 定时任务接口文档\r\n  license: Powered By ruoyi\r\n  licenseUrl: https://ruoyi.vip', 'f8d04eb952ff0eb4d0d0f971f1543867', '2023-11-16 22:41:35', '2023-11-16 14:41:33', 'nacos', '192.168.101.1', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (21, 32, 'ruoyi-article-dev', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.article.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '5572b6c108cb59e4db80785758d30b08', '2023-11-16 23:24:56', '2023-11-16 15:24:54', 'nacos', '192.168.101.1', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (21, 33, 'ruoyi-article-dev', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: 123456\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.article.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', '7b86afefa630b6c94528a64f6609d89a', '2023-11-17 00:04:31', '2023-11-16 16:04:30', 'nacos', '192.168.101.1', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (21, 34, 'ruoyi-article-dev', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.article.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', 'ab023d60f143b80b29f17781ab1081be', '2023-11-17 12:08:25', '2023-11-17 04:08:25', NULL, '192.168.101.1', 'D', '', NULL);
INSERT INTO `his_config_info` VALUES (0, 35, 'ruoyi-article-dev.yml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-11-17 12:09:08', '2023-11-17 04:09:07', NULL, '192.168.101.1', 'I', '', NULL);
INSERT INTO `his_config_info` VALUES (26, 36, 'ruoyi-article-dev.yml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-11-17 12:10:08', '2023-11-17 04:10:08', 'nacos', '192.168.101.1', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (0, 37, 'ruoyi-review-dev.yml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-11-18 15:51:27', '2023-11-18 07:51:27', NULL, '192.168.101.1', 'I', '', NULL);
INSERT INTO `his_config_info` VALUES (28, 38, 'ruoyi-review-dev.yml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-11-18 15:52:36', '2023-11-18 07:52:36', 'nacos', '192.168.101.1', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (2, 39, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    # host: localhost\n    host: 192.168.101.65\n    port: 6379\n    password:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-base\n          uri: lb://ruoyi-base\n          predicates:\n            - Path=/base/**\n          filters:\n            - StripPrefix=1    \n        # 论文服务服务\n        - id: ruoyi-article\n          uri: lb://ruoyi-article\n          predicates:\n            - Path=/article/**\n          filters:\n            - StripPrefix=1 \n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '66048a38c20c6e1f4792b495fbe8312b', '2023-11-18 15:55:18', '2023-11-18 07:55:18', 'nacos', '192.168.101.1', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (0, 40, 'ruoyi-contribute-dev.yml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-11-18 11:35:46', '2023-11-18 11:35:46', NULL, '192.168.101.5', 'I', '', NULL);
INSERT INTO `his_config_info` VALUES (31, 41, 'ruoyi-contribute-dev.yml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-11-18 11:36:12', '2023-11-18 11:36:12', NULL, '192.168.101.5', 'U', '', NULL);
INSERT INTO `his_config_info` VALUES (26, 42, 'ruoyi-article-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring:\n  redis:\n    host: 192.168.101.65\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://192.168.101.65:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # username: \n            # password: \n            # url: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.article.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip', 'ab023d60f143b80b29f17781ab1081be', '2023-11-18 11:36:19', '2023-11-18 11:36:20', NULL, '192.168.101.5', 'D', '', NULL);
INSERT INTO `his_config_info` VALUES (2, 43, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    # host: localhost\n    host: 192.168.101.65\n    port: 6379\n    password:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n        # 会议服务\n        - id: ruoyi-base\n          uri: lb://ruoyi-base\n          predicates:\n            - Path=/base/**\n          filters:\n            - StripPrefix=1    \n        # 论文服务\n        - id: ruoyi-article\n          uri: lb://ruoyi-article\n          predicates:\n            - Path=/article/**\n          filters:\n            - StripPrefix=1 \n        # 论文审稿服务\n        - id: ruoyi-review\n          uri: lb://ruoyi-review\n          predicates:\n            - Path=/review/**\n          filters:\n            - StripPrefix=1 \n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n', '4bebcf85bb698ea4c6608afc211fd040', '2023-11-18 11:37:07', '2023-11-18 11:37:07', NULL, '192.168.101.5', 'U', '', NULL);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '审稿id',
  `pc_id` bigint(20) NULL DEFAULT NULL COMMENT '审稿人id',
  `article_id` bigint(20) NULL DEFAULT NULL COMMENT '论文id',
  `score` int(11) NULL DEFAULT NULL COMMENT '稿件评分',
  `comment` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '稿件评语',
  `confidence_code` int(11) NULL DEFAULT NULL,
  `review_status_code` int(11) NULL DEFAULT NULL COMMENT '审核状态码',
  `review_status_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `confidence_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `article_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '论文名',
  PRIMARY KEY (`review_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (2, 2, NULL, NULL, 'ghjk', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-11-05 01:52:18', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-11-05 01:52:18', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-11-05 01:52:18', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2023-11-05 01:52:18', 'admin', '2023-11-05 07:40:55', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-11-05 01:52:18', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 01:52:18', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 01:52:18', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 01:52:18', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 01:52:18', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 01:52:18', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 01:52:18', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 01:52:18', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 01:52:18', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 01:52:18', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-05 01:52:18', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '待审核', '1', 'conference_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-06 13:08:07', 'xiaoming123', '2023-11-16 02:21:28', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 2, '已审核', '2', 'conference_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-06 13:08:31', 'xiaoming123', '2023-11-16 02:21:33', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 3, '投稿中', '3', 'conference_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-06 13:08:48', 'xiaoming123', '2023-11-16 02:21:37', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 6, '已拒绝', '99', 'conference_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-06 13:09:05', 'admin', '2023-11-21 06:47:40', NULL);
INSERT INTO `sys_dict_data` VALUES (34, 7, '结束', '-1', 'conference_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-06 13:09:27', 'admin', '2023-11-21 06:47:54', NULL);
INSERT INTO `sys_dict_data` VALUES (35, 1, '待确认', '0', 'invite_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-06 13:09:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 2, '已同意', '1', 'invite_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-06 13:10:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (37, 3, '已拒绝', '99', 'invite_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-06 13:10:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (38, 0, '待提交', '0', 'conference_status_code', NULL, 'default', 'N', '0', 'xiaoming123', '2023-11-16 02:21:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 4, '审稿中', '4', 'conference_status_code', NULL, 'default', 'N', '0', 'xiaoming123', '2023-11-18 06:44:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 0, '待审稿', '0', 'review_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:24:53', 'admin', '2023-11-19 05:26:18', NULL);
INSERT INTO `sys_dict_data` VALUES (41, 0, '已审稿', '1', 'review_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:25:11', 'admin', '2023-11-19 05:26:26', NULL);
INSERT INTO `sys_dict_data` VALUES (42, 0, 'reject', '-2', 'score_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:28:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (43, 0, 'weak reject', '-1', 'score_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:29:16', 'admin', '2023-11-19 05:29:25', NULL);
INSERT INTO `sys_dict_data` VALUES (44, 0, 'weak accept', '1', 'score_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:29:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (45, 0, 'accept', '2', 'score_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:29:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (46, 0, 'very low', '-2', 'confidence_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:37:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (47, 0, 'low', '-1', 'confidence_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:38:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (48, 0, 'high', '1', 'confidence_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:38:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (49, 0, 'very high', '2', 'confidence_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:38:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (50, 0, '已录用', '1', 'accept_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:38:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (51, 0, '未录用', '99', 'accept_code', NULL, 'default', 'N', '0', 'admin', '2023-11-19 05:39:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (52, 0, '待提交', '0', 'article_status_code', NULL, 'default', 'N', '0', 'xiaoming123', '2023-11-19 07:22:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (53, 0, '已提交', '1', 'article_status_code', NULL, 'default', 'N', '0', 'xiaoming123', '2023-11-19 07:22:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (54, 0, '待审稿', '2', 'article_status_code', NULL, 'default', 'N', '0', 'xiaoming123', '2023-11-19 07:22:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (55, 0, 'rebuttal', '3', 'article_status_code', NULL, 'default', 'N', '0', 'xiaoming123', '2023-11-19 07:24:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (56, 0, '已录用', '4', 'article_status_code', NULL, 'default', 'N', '0', 'xiaoming123', '2023-11-19 07:24:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (57, 0, '不录用', '99', 'article_status_code', NULL, 'default', 'N', '0', 'xiaoming123', '2023-11-19 07:25:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (58, 5, '发布结果', '5', 'conference_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-21 06:47:34', 'admin', '2023-11-21 06:47:59', NULL);
INSERT INTO `sys_dict_data` VALUES (59, 7, '未提交', '-1', 'article_status_code', NULL, 'default', 'N', '0', 'xiaoming123', '2023-11-21 07:41:09', 'xiaoming123', '2023-11-21 07:41:19', NULL);
INSERT INTO `sys_dict_data` VALUES (60, 4, '已失效', '-1', 'invite_status_code', NULL, 'default', 'N', '0', 'admin', '2023-11-22 01:02:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (61, 2, 'rebuttal', '2', 'review_status_code', NULL, 'default', 'N', '0', 'xiaoming123', '2023-11-29 06:00:22', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '会议状态', 'conference_status_code', '0', 'admin', '2023-11-06 12:49:06', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (12, '邀请状态', 'invite_status_code', '0', 'admin', '2023-11-06 12:59:28', 'admin', '2023-11-09 01:56:08', NULL);
INSERT INTO `sys_dict_type` VALUES (13, '审稿状态', 'review_status_code', '0', 'admin', '2023-11-19 05:23:58', 'admin', '2023-11-19 05:24:11', NULL);
INSERT INTO `sys_dict_type` VALUES (14, '分数码', 'score_code', '0', 'admin', '2023-11-19 05:26:59', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (15, 'confidence_code', 'confidence_code', '0', 'admin', '2023-11-19 05:27:33', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (16, '录用码', 'accept_code', '0', 'admin', '2023-11-19 05:28:01', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (17, '文章状态', 'article_status_code', '0', 'xiaoming123', '2023-11-19 07:21:36', 'xiaoming123', '2023-11-19 07:25:34', NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-11-05 01:52:19', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-11-05 01:52:19', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-11-05 01:52:19', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`access_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 457 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-05 05:05:41');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-05 05:13:21');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-05 05:13:41');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-05 05:13:47');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-05 05:14:03');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-05 07:35:47');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-05 07:40:26');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-05 07:41:12');
INSERT INTO `sys_logininfor` VALUES (9, 'boge', '127.0.0.1', '0', '注册成功', '2023-11-05 07:41:40');
INSERT INTO `sys_logininfor` VALUES (10, 'boge', '127.0.0.1', '0', '登录成功', '2023-11-05 07:41:55');
INSERT INTO `sys_logininfor` VALUES (11, 'boge', '127.0.0.1', '0', '退出成功', '2023-11-05 08:27:12');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2023-11-05 08:27:23');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '1', '密码输入错误2次', '2023-11-05 08:27:32');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '1', '密码输入错误3次', '2023-11-05 08:28:06');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-05 08:29:57');
INSERT INTO `sys_logininfor` VALUES (16, '11', '127.0.0.1', '0', '注册成功', '2023-11-06 01:31:15');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-06 01:31:51');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-06 01:37:40');
INSERT INTO `sys_logininfor` VALUES (19, '12345', '127.0.0.1', '0', '注册成功', '2023-11-06 01:45:01');
INSERT INTO `sys_logininfor` VALUES (20, '123456', '127.0.0.1', '0', '注册成功', '2023-11-06 01:47:56');
INSERT INTO `sys_logininfor` VALUES (21, '111111', '127.0.0.1', '0', '注册成功', '2023-11-06 01:48:28');
INSERT INTO `sys_logininfor` VALUES (22, '1234567', '127.0.0.1', '0', '注册成功', '2023-11-06 02:06:20');
INSERT INTO `sys_logininfor` VALUES (23, '11111111', '127.0.0.1', '0', '注册成功', '2023-11-06 03:30:52');
INSERT INTO `sys_logininfor` VALUES (24, '123456789', '127.0.0.1', '0', '注册成功', '2023-11-06 07:43:54');
INSERT INTO `sys_logininfor` VALUES (25, '12312', '127.0.0.1', '0', '注册成功', '2023-11-06 07:51:28');
INSERT INTO `sys_logininfor` VALUES (26, '55555', '127.0.0.1', '0', '注册成功', '2023-11-06 07:54:04');
INSERT INTO `sys_logininfor` VALUES (27, '33333', '127.0.0.1', '0', '注册成功', '2023-11-06 07:54:56');
INSERT INTO `sys_logininfor` VALUES (28, '1111111111111', '127.0.0.1', '0', '注册成功', '2023-11-06 08:08:47');
INSERT INTO `sys_logininfor` VALUES (29, '123123123', '127.0.0.1', '0', '注册成功', '2023-11-06 08:34:46');
INSERT INTO `sys_logininfor` VALUES (30, '00000000', '127.0.0.1', '0', '注册成功', '2023-11-06 08:42:24');
INSERT INTO `sys_logininfor` VALUES (31, '88888', '127.0.0.1', '0', '注册成功', '2023-11-06 10:38:02');
INSERT INTO `sys_logininfor` VALUES (32, '99999', '127.0.0.1', '0', '注册成功', '2023-11-06 10:47:02');
INSERT INTO `sys_logininfor` VALUES (33, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-06 12:09:13');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-06 12:16:13');
INSERT INTO `sys_logininfor` VALUES (35, '0000000000', '127.0.0.1', '0', '注册成功', '2023-11-06 12:16:44');
INSERT INTO `sys_logininfor` VALUES (36, '77777', '127.0.0.1', '0', '注册成功', '2023-11-06 12:27:20');
INSERT INTO `sys_logininfor` VALUES (37, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-06 12:29:31');
INSERT INTO `sys_logininfor` VALUES (38, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 00:34:53');
INSERT INTO `sys_logininfor` VALUES (39, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 05:18:25');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-07 05:27:26');
INSERT INTO `sys_logininfor` VALUES (41, '1', '127.0.0.1', '1', '用户密码不在指定范围', '2023-11-07 05:51:37');
INSERT INTO `sys_logininfor` VALUES (42, 'admin', '127.0.0.1', '1', '用户密码不在指定范围', '2023-11-07 05:51:55');
INSERT INTO `sys_logininfor` VALUES (43, 'admin111', '127.0.0.1', '1', '登录用户不存在', '2023-11-07 05:56:45');
INSERT INTO `sys_logininfor` VALUES (44, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2023-11-07 05:59:44');
INSERT INTO `sys_logininfor` VALUES (45, 'admin11', '127.0.0.1', '1', '登录用户不存在', '2023-11-07 06:00:07');
INSERT INTO `sys_logininfor` VALUES (46, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 06:00:24');
INSERT INTO `sys_logininfor` VALUES (47, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-07 06:00:49');
INSERT INTO `sys_logininfor` VALUES (48, 'test1', '127.0.0.1', '0', '注册成功', '2023-11-07 06:02:22');
INSERT INTO `sys_logininfor` VALUES (49, 'test1', '127.0.0.1', '1', '密码输入错误1次', '2023-11-07 06:02:35');
INSERT INTO `sys_logininfor` VALUES (50, 'test1', '127.0.0.1', '0', '登录成功', '2023-11-07 06:02:44');
INSERT INTO `sys_logininfor` VALUES (51, 'test1', '127.0.0.1', '0', '退出成功', '2023-11-07 06:05:12');
INSERT INTO `sys_logininfor` VALUES (52, 'test1', '127.0.0.1', '0', '登录成功', '2023-11-07 06:05:17');
INSERT INTO `sys_logininfor` VALUES (53, 'test1', '127.0.0.1', '0', '退出成功', '2023-11-07 06:05:42');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 06:05:49');
INSERT INTO `sys_logininfor` VALUES (55, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-07 06:07:02');
INSERT INTO `sys_logininfor` VALUES (56, 'test1', '127.0.0.1', '0', '登录成功', '2023-11-07 06:07:14');
INSERT INTO `sys_logininfor` VALUES (57, 'test1', '127.0.0.1', '0', '退出成功', '2023-11-07 06:07:48');
INSERT INTO `sys_logininfor` VALUES (58, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 06:07:54');
INSERT INTO `sys_logininfor` VALUES (59, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-07 06:08:45');
INSERT INTO `sys_logininfor` VALUES (60, 'test1', '127.0.0.1', '0', '登录成功', '2023-11-07 06:09:03');
INSERT INTO `sys_logininfor` VALUES (61, 'test1', '127.0.0.1', '0', '退出成功', '2023-11-07 06:11:54');
INSERT INTO `sys_logininfor` VALUES (62, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 06:12:02');
INSERT INTO `sys_logininfor` VALUES (63, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-07 06:14:16');
INSERT INTO `sys_logininfor` VALUES (64, 'test1', '127.0.0.1', '0', '登录成功', '2023-11-07 06:14:29');
INSERT INTO `sys_logininfor` VALUES (65, 'test1', '127.0.0.1', '0', '退出成功', '2023-11-07 06:25:19');
INSERT INTO `sys_logininfor` VALUES (66, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 06:25:28');
INSERT INTO `sys_logininfor` VALUES (67, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 09:53:05');
INSERT INTO `sys_logininfor` VALUES (68, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 09:53:54');
INSERT INTO `sys_logininfor` VALUES (69, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 13:31:58');
INSERT INTO `sys_logininfor` VALUES (70, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-07 13:43:53');
INSERT INTO `sys_logininfor` VALUES (71, 'test1', '127.0.0.1', '0', '登录成功', '2023-11-07 13:44:04');
INSERT INTO `sys_logininfor` VALUES (72, 'test1', '127.0.0.1', '0', '退出成功', '2023-11-07 13:45:14');
INSERT INTO `sys_logininfor` VALUES (73, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 13:45:20');
INSERT INTO `sys_logininfor` VALUES (74, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-07 14:12:26');
INSERT INTO `sys_logininfor` VALUES (75, 'test1', '127.0.0.1', '0', '登录成功', '2023-11-07 14:12:50');
INSERT INTO `sys_logininfor` VALUES (76, 'test1', '127.0.0.1', '0', '退出成功', '2023-11-07 14:13:06');
INSERT INTO `sys_logininfor` VALUES (77, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-07 14:13:14');
INSERT INTO `sys_logininfor` VALUES (78, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-08 01:17:31');
INSERT INTO `sys_logininfor` VALUES (79, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-08 05:45:00');
INSERT INTO `sys_logininfor` VALUES (80, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-08 08:03:55');
INSERT INTO `sys_logininfor` VALUES (81, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-08 14:06:19');
INSERT INTO `sys_logininfor` VALUES (82, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-09 01:09:19');
INSERT INTO `sys_logininfor` VALUES (83, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-09 05:44:12');
INSERT INTO `sys_logininfor` VALUES (84, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-09 07:17:59');
INSERT INTO `sys_logininfor` VALUES (85, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-09 07:18:11');
INSERT INTO `sys_logininfor` VALUES (86, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-09 11:03:02');
INSERT INTO `sys_logininfor` VALUES (87, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-09 11:20:22');
INSERT INTO `sys_logininfor` VALUES (88, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-10 01:24:32');
INSERT INTO `sys_logininfor` VALUES (89, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-10 05:13:36');
INSERT INTO `sys_logininfor` VALUES (90, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-10 05:25:37');
INSERT INTO `sys_logininfor` VALUES (91, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-10 05:26:06');
INSERT INTO `sys_logininfor` VALUES (92, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-10 06:13:48');
INSERT INTO `sys_logininfor` VALUES (93, 'xiaoming123', '127.0.0.1', '0', '注册成功', '2023-11-10 06:49:51');
INSERT INTO `sys_logininfor` VALUES (94, 'zhangsan', '127.0.0.1', '0', '注册成功', '2023-11-10 07:01:15');
INSERT INTO `sys_logininfor` VALUES (95, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-10 07:11:46');
INSERT INTO `sys_logininfor` VALUES (96, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-10 07:12:31');
INSERT INTO `sys_logininfor` VALUES (97, 'xiaoming123', '127.0.0.1', '1', '密码输入错误1次', '2023-11-10 07:12:40');
INSERT INTO `sys_logininfor` VALUES (98, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-10 07:13:05');
INSERT INTO `sys_logininfor` VALUES (99, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-10 07:13:36');
INSERT INTO `sys_logininfor` VALUES (100, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-10 07:14:17');
INSERT INTO `sys_logininfor` VALUES (101, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-10 07:15:13');
INSERT INTO `sys_logininfor` VALUES (102, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-10 07:15:57');
INSERT INTO `sys_logininfor` VALUES (103, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-10 07:16:07');
INSERT INTO `sys_logininfor` VALUES (104, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-10 07:19:35');
INSERT INTO `sys_logininfor` VALUES (105, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-10 07:34:02');
INSERT INTO `sys_logininfor` VALUES (106, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-11-10 07:34:14');
INSERT INTO `sys_logininfor` VALUES (107, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-11-10 07:39:15');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2023-11-10 07:39:27');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-10 07:39:41');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-10 07:45:29');
INSERT INTO `sys_logininfor` VALUES (111, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-10 07:45:45');
INSERT INTO `sys_logininfor` VALUES (112, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-10 08:36:03');
INSERT INTO `sys_logininfor` VALUES (113, 'zhangliang', '127.0.0.1', '0', '注册成功', '2023-11-10 08:36:46');
INSERT INTO `sys_logininfor` VALUES (114, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-10 08:36:57');
INSERT INTO `sys_logininfor` VALUES (115, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-10 08:39:42');
INSERT INTO `sys_logininfor` VALUES (116, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-11-10 08:39:58');
INSERT INTO `sys_logininfor` VALUES (117, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-11-10 08:41:59');
INSERT INTO `sys_logininfor` VALUES (118, 'xiaohua', '127.0.0.1', '0', '注册成功', '2023-11-10 08:42:31');
INSERT INTO `sys_logininfor` VALUES (119, 'xiaohua', '127.0.0.1', '0', '登录成功', '2023-11-10 08:42:43');
INSERT INTO `sys_logininfor` VALUES (120, 'xiaohua', '127.0.0.1', '0', '退出成功', '2023-11-10 08:50:41');
INSERT INTO `sys_logininfor` VALUES (121, 'zhangliang', '127.0.0.1', '0', '登录成功', '2023-11-10 08:50:56');
INSERT INTO `sys_logininfor` VALUES (122, 'zhangliang', '127.0.0.1', '0', '退出成功', '2023-11-10 08:52:35');
INSERT INTO `sys_logininfor` VALUES (123, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-10 08:53:29');
INSERT INTO `sys_logininfor` VALUES (124, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-15 07:50:35');
INSERT INTO `sys_logininfor` VALUES (125, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-16 02:14:28');
INSERT INTO `sys_logininfor` VALUES (126, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-16 02:15:24');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-16 02:15:49');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-16 02:19:45');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-16 02:19:51');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-16 02:19:58');
INSERT INTO `sys_logininfor` VALUES (131, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-16 02:20:03');
INSERT INTO `sys_logininfor` VALUES (132, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-16 02:39:38');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-16 02:39:45');
INSERT INTO `sys_logininfor` VALUES (134, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-16 06:19:13');
INSERT INTO `sys_logininfor` VALUES (135, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-16 08:08:26');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-16 08:08:34');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-16 10:13:47');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-16 13:31:30');
INSERT INTO `sys_logininfor` VALUES (139, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-16 13:31:41');
INSERT INTO `sys_logininfor` VALUES (140, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-16 13:47:09');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-16 13:47:15');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-16 13:47:35');
INSERT INTO `sys_logininfor` VALUES (143, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-16 13:47:40');
INSERT INTO `sys_logininfor` VALUES (144, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-17 01:16:23');
INSERT INTO `sys_logininfor` VALUES (145, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-17 01:27:47');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-17 01:27:56');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-17 01:33:37');
INSERT INTO `sys_logininfor` VALUES (148, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-17 01:33:44');
INSERT INTO `sys_logininfor` VALUES (149, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-17 07:52:42');
INSERT INTO `sys_logininfor` VALUES (150, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-17 07:53:37');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-18 01:09:25');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-18 01:40:47');
INSERT INTO `sys_logininfor` VALUES (153, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-18 01:40:56');
INSERT INTO `sys_logininfor` VALUES (154, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-18 05:03:49');
INSERT INTO `sys_logininfor` VALUES (155, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-18 05:03:54');
INSERT INTO `sys_logininfor` VALUES (156, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-18 05:03:58');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-18 05:04:02');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-18 05:08:17');
INSERT INTO `sys_logininfor` VALUES (159, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-18 05:09:05');
INSERT INTO `sys_logininfor` VALUES (160, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-18 05:12:35');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-18 05:12:44');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-18 05:13:14');
INSERT INTO `sys_logininfor` VALUES (163, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-18 05:13:19');
INSERT INTO `sys_logininfor` VALUES (164, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-18 08:17:07');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-18 08:17:18');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-19 03:17:23');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-19 03:17:39');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-19 06:06:35');
INSERT INTO `sys_logininfor` VALUES (169, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-19 06:06:43');
INSERT INTO `sys_logininfor` VALUES (170, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-20 01:08:14');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-20 06:22:17');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-21 13:34:22');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-21 13:34:22');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-21 13:34:39');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-21 07:08:23');
INSERT INTO `sys_logininfor` VALUES (176, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-21 07:08:30');
INSERT INTO `sys_logininfor` VALUES (177, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-21 07:45:52');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-21 07:45:57');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-22 00:49:13');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-22 00:52:10');
INSERT INTO `sys_logininfor` VALUES (181, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 00:52:39');
INSERT INTO `sys_logininfor` VALUES (182, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 00:55:00');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-22 00:55:13');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-22 04:42:45');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-22 14:21:29');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-22 14:21:35');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-22 14:31:03');
INSERT INTO `sys_logininfor` VALUES (188, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 14:31:14');
INSERT INTO `sys_logininfor` VALUES (189, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 14:37:11');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-22 14:37:39');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-22 14:40:34');
INSERT INTO `sys_logininfor` VALUES (192, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 14:40:40');
INSERT INTO `sys_logininfor` VALUES (193, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 16:35:13');
INSERT INTO `sys_logininfor` VALUES (194, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 16:35:31');
INSERT INTO `sys_logininfor` VALUES (195, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 16:37:14');
INSERT INTO `sys_logininfor` VALUES (196, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 16:47:17');
INSERT INTO `sys_logininfor` VALUES (197, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 16:47:58');
INSERT INTO `sys_logininfor` VALUES (198, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 16:48:13');
INSERT INTO `sys_logininfor` VALUES (199, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 16:53:07');
INSERT INTO `sys_logininfor` VALUES (200, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 16:53:55');
INSERT INTO `sys_logininfor` VALUES (201, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 16:54:09');
INSERT INTO `sys_logininfor` VALUES (202, 'xiaoming123', '127.0.0.1', '1', '登录用户不存在', '2023-11-22 18:43:08');
INSERT INTO `sys_logininfor` VALUES (203, 'xiaoming123', '127.0.0.1', '1', '登录用户不存在', '2023-11-22 18:43:08');
INSERT INTO `sys_logininfor` VALUES (204, 'xiaoming123', '127.0.0.1', '1', '登录用户不存在', '2023-11-22 18:43:08');
INSERT INTO `sys_logininfor` VALUES (205, 'xiaoming123', '127.0.0.1', '1', '登录用户不存在', '2023-11-22 18:43:08');
INSERT INTO `sys_logininfor` VALUES (206, 'xiaoming123', '127.0.0.1', '1', '登录用户不存在', '2023-11-22 18:43:12');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-22 18:43:54');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-22 18:44:09');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-22 18:44:20');
INSERT INTO `sys_logininfor` VALUES (210, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 18:45:02');
INSERT INTO `sys_logininfor` VALUES (211, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 18:49:02');
INSERT INTO `sys_logininfor` VALUES (212, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 19:02:56');
INSERT INTO `sys_logininfor` VALUES (213, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 19:03:05');
INSERT INTO `sys_logininfor` VALUES (214, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 19:30:26');
INSERT INTO `sys_logininfor` VALUES (215, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 19:30:28');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-22 19:33:10');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-22 19:33:11');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-22 19:33:11');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-22 19:33:13');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-22 19:33:20');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-22 19:42:45');
INSERT INTO `sys_logininfor` VALUES (222, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 19:43:09');
INSERT INTO `sys_logininfor` VALUES (223, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 19:53:14');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-22 19:53:37');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-22 20:06:18');
INSERT INTO `sys_logininfor` VALUES (226, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 20:06:44');
INSERT INTO `sys_logininfor` VALUES (227, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 20:06:51');
INSERT INTO `sys_logininfor` VALUES (228, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 20:23:14');
INSERT INTO `sys_logininfor` VALUES (229, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-22 20:23:28');
INSERT INTO `sys_logininfor` VALUES (230, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-22 20:23:54');
INSERT INTO `sys_logininfor` VALUES (231, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-23 01:00:28');
INSERT INTO `sys_logininfor` VALUES (232, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-23 01:01:12');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-23 01:01:28');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-23 01:01:43');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-23 01:19:51');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-23 01:19:52');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-23 01:23:25');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-23 01:23:40');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-23 01:27:28');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-23 01:27:30');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-23 01:27:50');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-23 01:32:40');
INSERT INTO `sys_logininfor` VALUES (243, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-23 01:32:49');
INSERT INTO `sys_logininfor` VALUES (244, 'xiaoming123', '127.0.0.1', '1', '登录用户不存在', '2023-11-23 13:09:01');
INSERT INTO `sys_logininfor` VALUES (245, 'xiaoming123', '127.0.0.1', '1', '登录用户不存在', '2023-11-23 13:09:01');
INSERT INTO `sys_logininfor` VALUES (246, 'xiaoming123', '127.0.0.1', '1', '登录用户不存在', '2023-11-23 13:09:01');
INSERT INTO `sys_logininfor` VALUES (247, 'xiaoming123', '127.0.0.1', '1', '登录用户不存在', '2023-11-23 13:09:01');
INSERT INTO `sys_logininfor` VALUES (248, 'xiaoming123', '127.0.0.1', '1', '登录用户不存在', '2023-11-23 13:09:01');
INSERT INTO `sys_logininfor` VALUES (249, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-23 13:09:10');
INSERT INTO `sys_logininfor` VALUES (250, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-23 13:09:31');
INSERT INTO `sys_logininfor` VALUES (251, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-23 13:09:47');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-23 13:10:09');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-23 13:14:44');
INSERT INTO `sys_logininfor` VALUES (254, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-23 13:15:27');
INSERT INTO `sys_logininfor` VALUES (255, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-23 14:43:50');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-23 14:44:17');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-23 14:44:58');
INSERT INTO `sys_logininfor` VALUES (258, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-23 14:45:10');
INSERT INTO `sys_logininfor` VALUES (259, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-23 22:19:35');
INSERT INTO `sys_logininfor` VALUES (260, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-23 22:21:21');
INSERT INTO `sys_logininfor` VALUES (261, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-23 22:21:21');
INSERT INTO `sys_logininfor` VALUES (262, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-23 23:13:56');
INSERT INTO `sys_logininfor` VALUES (263, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-23 23:13:56');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-23 23:14:16');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-23 23:14:43');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-23 23:17:38');
INSERT INTO `sys_logininfor` VALUES (267, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-23 23:17:45');
INSERT INTO `sys_logininfor` VALUES (268, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-23 23:18:18');
INSERT INTO `sys_logininfor` VALUES (269, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-23 23:18:33');
INSERT INTO `sys_logininfor` VALUES (270, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-23 23:19:15');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-23 23:19:20');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-23 23:20:48');
INSERT INTO `sys_logininfor` VALUES (273, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-23 23:20:54');
INSERT INTO `sys_logininfor` VALUES (274, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 00:09:26');
INSERT INTO `sys_logininfor` VALUES (275, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 00:14:57');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-24 00:15:04');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 13:30:15');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 13:30:37');
INSERT INTO `sys_logininfor` VALUES (279, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-24 13:31:11');
INSERT INTO `sys_logininfor` VALUES (280, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-24 13:31:28');
INSERT INTO `sys_logininfor` VALUES (281, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 13:31:43');
INSERT INTO `sys_logininfor` VALUES (282, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-24 13:32:56');
INSERT INTO `sys_logininfor` VALUES (283, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 13:40:39');
INSERT INTO `sys_logininfor` VALUES (284, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 13:41:43');
INSERT INTO `sys_logininfor` VALUES (285, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-24 13:43:42');
INSERT INTO `sys_logininfor` VALUES (286, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 13:44:01');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-24 13:44:27');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 13:59:51');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 14:00:04');
INSERT INTO `sys_logininfor` VALUES (290, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-24 14:00:26');
INSERT INTO `sys_logininfor` VALUES (291, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 14:01:44');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-24 14:01:52');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 14:18:34');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 14:18:34');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 14:18:34');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 14:18:54');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-24 14:19:08');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 14:25:53');
INSERT INTO `sys_logininfor` VALUES (299, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-24 14:26:06');
INSERT INTO `sys_logininfor` VALUES (300, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 14:27:03');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-24 14:27:11');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 14:28:30');
INSERT INTO `sys_logininfor` VALUES (303, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-24 14:28:41');
INSERT INTO `sys_logininfor` VALUES (304, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 14:34:39');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-24 14:34:46');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 14:35:31');
INSERT INTO `sys_logininfor` VALUES (307, 'zhangliang', '127.0.0.1', '0', '登录成功', '2023-11-24 14:35:38');
INSERT INTO `sys_logininfor` VALUES (308, 'zhangliang', '127.0.0.1', '0', '退出成功', '2023-11-24 14:44:26');
INSERT INTO `sys_logininfor` VALUES (309, 'zhangliang', '127.0.0.1', '0', '退出成功', '2023-11-24 14:44:31');
INSERT INTO `sys_logininfor` VALUES (310, 'zhangliang', '127.0.0.1', '0', '退出成功', '2023-11-24 14:44:50');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-24 14:47:08');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 14:48:07');
INSERT INTO `sys_logininfor` VALUES (313, 'zhangliang', '127.0.0.1', '0', '登录成功', '2023-11-24 14:48:19');
INSERT INTO `sys_logininfor` VALUES (314, 'zhangliang', '127.0.0.1', '0', '退出成功', '2023-11-24 14:57:17');
INSERT INTO `sys_logininfor` VALUES (315, 'zhangliang', '127.0.0.1', '0', '退出成功', '2023-11-24 14:58:21');
INSERT INTO `sys_logininfor` VALUES (316, 'zhangliang', '127.0.0.1', '0', '登录成功', '2023-11-24 14:58:34');
INSERT INTO `sys_logininfor` VALUES (317, 'zhangliang', '127.0.0.1', '0', '退出成功', '2023-11-24 14:59:40');
INSERT INTO `sys_logininfor` VALUES (318, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-24 14:59:49');
INSERT INTO `sys_logininfor` VALUES (319, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 15:00:40');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-24 15:00:44');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 15:01:17');
INSERT INTO `sys_logininfor` VALUES (322, 'zhangliang', '127.0.0.1', '0', '登录成功', '2023-11-24 15:01:23');
INSERT INTO `sys_logininfor` VALUES (323, 'zhangliang', '127.0.0.1', '0', '退出成功', '2023-11-24 15:01:56');
INSERT INTO `sys_logininfor` VALUES (324, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-24 15:02:03');
INSERT INTO `sys_logininfor` VALUES (325, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 15:20:09');
INSERT INTO `sys_logininfor` VALUES (326, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 15:20:11');
INSERT INTO `sys_logininfor` VALUES (327, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 15:20:11');
INSERT INTO `sys_logininfor` VALUES (328, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-24 15:21:40');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-24 15:22:17');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-24 15:22:33');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 16:46:51');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-24 16:47:24');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-24 16:47:50');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-26 22:44:57');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-26 22:44:57');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-26 22:44:57');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-26 22:44:57');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-26 22:44:57');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-26 22:44:57');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-26 22:45:03');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-26 22:45:19');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-26 22:45:32');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-26 22:45:44');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-26 22:45:56');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 00:47:28');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 00:52:30');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 00:52:47');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-27 11:36:16');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-27 11:36:16');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 11:36:28');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 11:36:35');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 11:36:48');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 11:37:01');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 13:16:08');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 13:16:43');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 13:36:14');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 13:36:25');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 14:36:52');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 14:36:50');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 14:36:53');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 14:38:41');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 14:39:17');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 14:53:27');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 14:54:01');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 14:54:23');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 15:38:20');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 15:38:20');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 16:29:08');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 16:32:16');
INSERT INTO `sys_logininfor` VALUES (370, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 16:32:37');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 16:44:35');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 16:45:05');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 16:45:13');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 20:42:38');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '127.0.0.1', '1', '登录用户不存在', '2023-11-27 20:42:38');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 20:42:55');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 20:43:06');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 21:15:13');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 22:20:47');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 22:39:21');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 22:41:24');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 22:41:40');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 22:45:31');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 22:45:34');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-27 23:48:30');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-27 23:48:45');
INSERT INTO `sys_logininfor` VALUES (387, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-28 02:44:26');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '0', '登录成功', '2023-11-28 02:44:51');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '0', '退出成功', '2023-11-28 02:45:13');
INSERT INTO `sys_logininfor` VALUES (390, 'huahua', '127.0.0.1', '0', '注册成功', '2023-11-28 02:45:47');
INSERT INTO `sys_logininfor` VALUES (391, 'huahua', '127.0.0.1', '0', '登录成功', '2023-11-28 02:45:56');
INSERT INTO `sys_logininfor` VALUES (392, 'huahua', '127.0.0.1', '0', '退出成功', '2023-11-28 02:46:09');
INSERT INTO `sys_logininfor` VALUES (393, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-28 02:46:15');
INSERT INTO `sys_logininfor` VALUES (394, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-28 04:06:49');
INSERT INTO `sys_logininfor` VALUES (395, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-11-28 04:07:59');
INSERT INTO `sys_logininfor` VALUES (396, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-11-28 04:08:36');
INSERT INTO `sys_logininfor` VALUES (397, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-28 04:08:43');
INSERT INTO `sys_logininfor` VALUES (398, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-28 04:11:46');
INSERT INTO `sys_logininfor` VALUES (399, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-11-28 04:12:03');
INSERT INTO `sys_logininfor` VALUES (400, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-11-28 04:15:47');
INSERT INTO `sys_logininfor` VALUES (401, 'zhangliang', '127.0.0.1', '0', '登录成功', '2023-11-28 04:16:04');
INSERT INTO `sys_logininfor` VALUES (402, 'zhangliang', '127.0.0.1', '0', '退出成功', '2023-11-28 04:16:34');
INSERT INTO `sys_logininfor` VALUES (403, 'xiaohua', '127.0.0.1', '0', '登录成功', '2023-11-28 04:16:47');
INSERT INTO `sys_logininfor` VALUES (404, 'xiaohua', '127.0.0.1', '0', '退出成功', '2023-11-28 04:17:03');
INSERT INTO `sys_logininfor` VALUES (405, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-28 04:17:11');
INSERT INTO `sys_logininfor` VALUES (406, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-28 04:19:28');
INSERT INTO `sys_logininfor` VALUES (407, 'huahua', '127.0.0.1', '0', '登录成功', '2023-11-28 04:19:37');
INSERT INTO `sys_logininfor` VALUES (408, 'huahua', '127.0.0.1', '0', '退出成功', '2023-11-28 04:30:29');
INSERT INTO `sys_logininfor` VALUES (409, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-28 04:30:36');
INSERT INTO `sys_logininfor` VALUES (410, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-28 04:33:48');
INSERT INTO `sys_logininfor` VALUES (411, 'huahua', '127.0.0.1', '0', '登录成功', '2023-11-28 04:33:54');
INSERT INTO `sys_logininfor` VALUES (412, 'huahua', '127.0.0.1', '0', '登录成功', '2023-11-28 12:58:00');
INSERT INTO `sys_logininfor` VALUES (413, 'huahua', '127.0.0.1', '0', '退出成功', '2023-11-28 13:07:06');
INSERT INTO `sys_logininfor` VALUES (414, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-28 13:07:13');
INSERT INTO `sys_logininfor` VALUES (415, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-28 13:28:39');
INSERT INTO `sys_logininfor` VALUES (416, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-28 13:31:05');
INSERT INTO `sys_logininfor` VALUES (417, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-28 13:31:09');
INSERT INTO `sys_logininfor` VALUES (418, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-28 13:32:46');
INSERT INTO `sys_logininfor` VALUES (419, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-11-28 13:32:59');
INSERT INTO `sys_logininfor` VALUES (420, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-11-29 04:52:29');
INSERT INTO `sys_logininfor` VALUES (421, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-11-29 04:54:11');
INSERT INTO `sys_logininfor` VALUES (422, 'zhangliang', '127.0.0.1', '0', '登录成功', '2023-11-29 04:54:21');
INSERT INTO `sys_logininfor` VALUES (423, 'zhangliang', '127.0.0.1', '0', '退出成功', '2023-11-29 04:55:30');
INSERT INTO `sys_logininfor` VALUES (424, 'xiaohua', '127.0.0.1', '0', '登录成功', '2023-11-29 04:55:41');
INSERT INTO `sys_logininfor` VALUES (425, 'xiaohua', '127.0.0.1', '0', '退出成功', '2023-11-29 04:56:23');
INSERT INTO `sys_logininfor` VALUES (426, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-29 04:56:42');
INSERT INTO `sys_logininfor` VALUES (427, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-29 05:43:33');
INSERT INTO `sys_logininfor` VALUES (428, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-11-29 05:43:48');
INSERT INTO `sys_logininfor` VALUES (429, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-11-29 05:44:29');
INSERT INTO `sys_logininfor` VALUES (430, 'zhangliang', '127.0.0.1', '0', '登录成功', '2023-11-29 05:44:38');
INSERT INTO `sys_logininfor` VALUES (431, 'zhangliang', '127.0.0.1', '0', '退出成功', '2023-11-29 05:44:50');
INSERT INTO `sys_logininfor` VALUES (432, 'xiaohua', '127.0.0.1', '0', '登录成功', '2023-11-29 05:45:03');
INSERT INTO `sys_logininfor` VALUES (433, 'xiaohua', '127.0.0.1', '0', '退出成功', '2023-11-29 05:45:43');
INSERT INTO `sys_logininfor` VALUES (434, 'huahua', '127.0.0.1', '0', '登录成功', '2023-11-29 05:45:50');
INSERT INTO `sys_logininfor` VALUES (435, 'huahua', '127.0.0.1', '0', '退出成功', '2023-11-29 05:58:40');
INSERT INTO `sys_logininfor` VALUES (436, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-29 05:58:52');
INSERT INTO `sys_logininfor` VALUES (437, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-29 06:27:54');
INSERT INTO `sys_logininfor` VALUES (438, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-11-29 06:28:08');
INSERT INTO `sys_logininfor` VALUES (439, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-11-29 06:28:43');
INSERT INTO `sys_logininfor` VALUES (440, 'xiaohua', '127.0.0.1', '0', '登录成功', '2023-11-29 06:28:53');
INSERT INTO `sys_logininfor` VALUES (441, 'xiaohua', '127.0.0.1', '0', '退出成功', '2023-11-29 06:29:24');
INSERT INTO `sys_logininfor` VALUES (442, 'huahua', '127.0.0.1', '0', '登录成功', '2023-11-29 06:29:33');
INSERT INTO `sys_logininfor` VALUES (443, 'huahua', '127.0.0.1', '0', '退出成功', '2023-11-29 06:30:41');
INSERT INTO `sys_logininfor` VALUES (444, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-29 06:30:48');
INSERT INTO `sys_logininfor` VALUES (445, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-11-29 06:32:43');
INSERT INTO `sys_logininfor` VALUES (446, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-11-29 06:32:57');
INSERT INTO `sys_logininfor` VALUES (447, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-11-29 06:33:49');
INSERT INTO `sys_logininfor` VALUES (448, 'xiaohua', '127.0.0.1', '0', '登录成功', '2023-11-29 06:33:59');
INSERT INTO `sys_logininfor` VALUES (449, 'xiaohua', '127.0.0.1', '0', '退出成功', '2023-11-29 06:34:35');
INSERT INTO `sys_logininfor` VALUES (450, 'huahua', '127.0.0.1', '0', '登录成功', '2023-11-29 06:34:41');
INSERT INTO `sys_logininfor` VALUES (451, 'huahua', '127.0.0.1', '0', '退出成功', '2023-11-29 06:37:59');
INSERT INTO `sys_logininfor` VALUES (452, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-11-29 06:38:06');
INSERT INTO `sys_logininfor` VALUES (453, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-12-13 12:15:56');
INSERT INTO `sys_logininfor` VALUES (454, 'xiaoming123', '127.0.0.1', '0', '登录成功', '2023-12-13 12:16:03');
INSERT INTO `sys_logininfor` VALUES (455, 'xiaoming123', '127.0.0.1', '0', '退出成功', '2023-12-13 12:18:57');
INSERT INTO `sys_logininfor` VALUES (456, 'huahua', '127.0.0.1', '0', '登录成功', '2023-12-13 12:19:17');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1069 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-11-05 01:52:18', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-11-05 01:52:18', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-11-05 01:52:18', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '1', '', 'guide', 'admin', '2023-11-05 01:52:18', 'admin', '2023-11-05 07:08:28', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-11-05 01:52:18', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-11-05 01:52:18', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-11-05 01:52:18', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-11-05 01:52:18', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-11-05 01:52:18', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-11-05 01:52:18', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-11-05 01:52:18', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-11-05 01:52:18', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-11-05 01:52:18', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-11-05 01:52:18', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-11-05 01:52:18', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2023-11-05 01:52:18', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2023-11-05 01:52:18', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-11-05 01:52:18', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-11-05 01:52:18', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-11-05 01:52:18', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-11-05 01:52:18', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2023-11-05 01:52:18', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2023-11-05 01:52:18', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '基本功能', 0, 4, 'base', NULL, NULL, 1, 0, 'M', '0', '0', '', 'build', 'admin', '2023-11-05 07:10:20', 'admin', '2023-11-07 01:51:08', '');
INSERT INTO `sys_menu` VALUES (1063, '全部会议', 1061, 1, 'conference', 'base/conference/index', NULL, 1, 0, 'C', '0', '0', 'base:conference:list', 'client', 'admin', '2023-11-07 01:50:03', 'xiaoming123', '2023-11-16 13:45:37', '');
INSERT INTO `sys_menu` VALUES (1064, '我的投稿', 1061, 2, 'article', 'base/article/index', NULL, 1, 0, 'C', '0', '0', 'base:article:list', 'server', 'admin', '2023-11-07 02:33:28', 'xiaoming123', '2023-11-16 13:45:51', '');
INSERT INTO `sys_menu` VALUES (1065, '邀请审稿', 1061, 3, 'invite', 'base/invite/index', NULL, 1, 0, 'C', '0', '0', 'base:invite:list', 'guide', 'admin', '2023-11-07 02:35:00', 'xiaoming123', '2023-11-16 13:46:00', '');
INSERT INTO `sys_menu` VALUES (1066, '我的会议', 1061, 1, 'myconfer', 'base/myconfer/index', NULL, 1, 0, 'C', '0', '0', 'base:myconfer:list', 'dict', 'admin', '2023-11-07 06:53:23', 'xiaoming123', '2023-11-16 13:45:20', '');
INSERT INTO `sys_menu` VALUES (1067, '邀请通知', 1061, 5, 'myinvite', 'base/myinvite/index', NULL, 1, 0, 'C', '0', '0', 'base:myinvite:list', 'example', 'admin', '2023-11-08 14:25:54', 'xiaoming123', '2023-11-16 13:46:15', '');
INSERT INTO `sys_menu` VALUES (1068, '全部稿件', 1061, 6, 'allocation', 'base/allocation/index', NULL, 1, 0, 'C', '0', '0', 'review:allocation:list', 'client', 'admin', '2023-11-20 15:26:08', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-11-05 01:52:19', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-11-05 01:52:19', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 424 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleKey\":\"common\",\"roleName\":\"chair\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"新增角色\'chair\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2023-11-05 05:21:06', 90);
INSERT INTO `sys_oper_log` VALUES (2, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":3,\"roleKey\":\"chair\",\"roleName\":\"会议主席\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 05:21:53', 123);
INSERT INTO `sys_oper_log` VALUES (3, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 05:21:53\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":3,\"roleKey\":\"chair\",\"roleName\":\"会议主席\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 05:22:01', 55);
INSERT INTO `sys_oper_log` VALUES (4, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 05:21:53\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":3,\"roleKey\":\"chair\",\"roleName\":\"会议主席\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 05:22:07', 31);
INSERT INTO `sys_oper_log` VALUES (5, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":4,\"roleKey\":\"program committee member\",\"roleName\":\"审稿人\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 05:23:01', 23);
INSERT INTO `sys_oper_log` VALUES (6, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 05:23:01\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":4,\"roleKey\":\"PCmember\",\"roleName\":\"审稿人\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 06:57:52', 87);
INSERT INTO `sys_oper_log` VALUES (7, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":5,\"roleKey\":\"author\",\"roleName\":\"作者\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 06:58:55', 28);
INSERT INTO `sys_oper_log` VALUES (8, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 05:23:01\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":4,\"roleKey\":\"PCmember\",\"roleName\":\"审稿人\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 06:59:01', 26);
INSERT INTO `sys_oper_log` VALUES (9, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/role/5', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:02:56', 205);
INSERT INTO `sys_oper_log` VALUES (10, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/role/3', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:02:59', 21);
INSERT INTO `sys_oper_log` VALUES (11, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/role/4', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:03:01', 26);
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-11-05 07:07:49', 11);
INSERT INTO `sys_oper_log` VALUES (13, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-11-05 07:08:03', 10);
INSERT INTO `sys_oper_log` VALUES (14, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-11-05 01:52:18\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:08:28', 76);
INSERT INTO `sys_oper_log` VALUES (15, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-11-05 07:08:42', 5);
INSERT INTO `sys_oper_log` VALUES (16, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基本功能\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"base\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:10:20', 17);
INSERT INTO `sys_oper_log` VALUES (17, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-11-05 07:10:20\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"基本功能\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"base\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:10:35', 20);
INSERT INTO `sys_oper_log` VALUES (18, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会议申请\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"base\\\\application\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:12:34', 43);
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-11-05 07:12:33\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"会议管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"base\\\\management\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:13:13', 24);
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base\\\\management\",\"createTime\":\"2023-11-05 07:12:33\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"会议管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"management\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:13:58', 10);
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base\\\\management\\\\index\",\"createTime\":\"2023-11-05 07:12:33\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"会议管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"management\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:14:40', 14);
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base\\\\management\\\\index\",\"createTime\":\"2023-11-05 07:12:33\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"会议管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"management\",\"perms\":\"base:management:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:15:07', 26);
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base\\\\management\\\\index\",\"createTime\":\"2023-11-05 07:12:33\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"会议管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"management\",\"perms\":\"base:management:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:16:24', 14);
INSERT INTO `sys_oper_log` VALUES (24, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-11-05 07:12:33\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"会议管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"management\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:16:42', 14);
INSERT INTO `sys_oper_log` VALUES (25, '参数管理', 2, 'com.ruoyi.system.controller.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/config', '127.0.0.1', '', '{\"configId\":4,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 01:52:18\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 07:40:56', 135);
INSERT INTO `sys_oper_log` VALUES (26, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_conference\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 08:32:10', 473);
INSERT INTO `sys_oper_log` VALUES (27, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-11-06 12:42:29', 62);
INSERT INTO `sys_oper_log` VALUES (28, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1062', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 12:42:32', 24);
INSERT INTO `sys_oper_log` VALUES (29, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"会议状态\",\"dictType\":\"conference_status_code\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 12:49:06', 76);
INSERT INTO `sys_oper_log` VALUES (30, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"邀请状态\",\"dictType\":\"pc_status_code\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 12:59:28', 30);
INSERT INTO `sys_oper_log` VALUES (31, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待审核\",\"dictSort\":1,\"dictType\":\"conference_status_code\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 13:08:07', 29);
INSERT INTO `sys_oper_log` VALUES (32, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"通过\",\"dictSort\":2,\"dictType\":\"conference_status_code\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 13:08:31', 25);
INSERT INTO `sys_oper_log` VALUES (33, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"投稿中\",\"dictSort\":3,\"dictType\":\"conference_status_code\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 13:08:48', 19);
INSERT INTO `sys_oper_log` VALUES (34, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"不通过\",\"dictSort\":4,\"dictType\":\"conference_status_code\",\"dictValue\":\"99\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 13:09:05', 17);
INSERT INTO `sys_oper_log` VALUES (35, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"结束\",\"dictSort\":5,\"dictType\":\"conference_status_code\",\"dictValue\":\"-1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 13:09:28', 23);
INSERT INTO `sys_oper_log` VALUES (36, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待确认\",\"dictSort\":1,\"dictType\":\"pc_status_code\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 13:09:53', 16);
INSERT INTO `sys_oper_log` VALUES (37, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已同意\",\"dictSort\":2,\"dictType\":\"pc_status_code\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 13:10:09', 17);
INSERT INTO `sys_oper_log` VALUES (38, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已拒绝\",\"dictSort\":3,\"dictType\":\"pc_status_code\",\"dictValue\":\"99\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 13:10:29', 14);
INSERT INTO `sys_oper_log` VALUES (39, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 13:10:54', 248);
INSERT INTO `sys_oper_log` VALUES (40, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_conference\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 13:11:01', 142);
INSERT INTO `sys_oper_log` VALUES (41, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_pc_confer,base_article\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 13:11:07', 144);
INSERT INTO `sys_oper_log` VALUES (42, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_conference,base_article,base_pc_confer\"}', NULL, 0, NULL, '2023-11-07 00:45:15', 245);
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/conference/index\",\"createBy\":\"admin\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会议管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"conference\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 01:50:03', 82);
INSERT INTO `sys_oper_log` VALUES (44, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-11-05 07:10:20\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"基本功能\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"base\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 01:51:08', 28);
INSERT INTO `sys_oper_log` VALUES (45, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/conference/index\",\"createTime\":\"2023-11-07 01:50:03\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"会议管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"conference\",\"perms\":\"base:conference:index\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 01:51:24', 11);
INSERT INTO `sys_oper_log` VALUES (46, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":11,\"chairName\":\"111\",\"conferenceName\":\"1111\",\"conferenceNickname\":\"11\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"0\",\"deadlineDate\":\"2023-11-08\",\"holdDate\":\"2023-11-07\",\"params\":{},\"place\":\"11\",\"resultDate\":\"2023-11-09\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\WorkSpace\\RuoYi-Cloud\\ruoyi-modules\\ruoyi-base\\target\\classes\\mapper\\base\\BaseConferenceMapper.xml]\r\n### The error may involve com.ruoyi.base.mapper.BaseConferenceMapper.insertBaseConference-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_conference          ( conference_name,             conference_nickname,             hold_date,             place,             deadline_date,             result_date,             chair_id,             chair_name,             conference_status_code,             conference_status_name )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value\n; Field \'conference_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value', '2023-11-07 02:17:58', 283);
INSERT INTO `sys_oper_log` VALUES (47, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":11,\"chairName\":\"111\",\"conferenceName\":\"1111\",\"conferenceNickname\":\"11\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"0\",\"deadlineDate\":\"2023-11-08\",\"holdDate\":\"2023-11-07\",\"params\":{},\"place\":\"11\",\"resultDate\":\"2023-11-09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 02:26:20', 144);
INSERT INTO `sys_oper_log` VALUES (48, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/article/index\",\"createBy\":\"admin\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"投稿管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"article\",\"perms\":\"base:article:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 02:33:28', 73);
INSERT INTO `sys_oper_log` VALUES (49, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/pcconfer/index\",\"createBy\":\"admin\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"邀请管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"pcconfer\",\"perms\":\"base:pcconfer:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 02:35:00', 14);
INSERT INTO `sys_oper_log` VALUES (50, '文章管理', 1, 'com.ruoyi.base.controller.BaseArticleController.add()', 'POST', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"article\":\"1111\",\"articleAbstract\":\"111\",\"articleName\":\"11\",\"authorId\":1111,\"authorName\":\"1111\",\"conferenceId\":111,\"conferenceName\":\"1111\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 02:35:36', 39);
INSERT INTO `sys_oper_log` VALUES (51, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_conference\"}', NULL, 0, NULL, '2023-11-07 02:53:27', 538);
INSERT INTO `sys_oper_log` VALUES (52, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_conference,base_article\"}', NULL, 0, NULL, '2023-11-07 02:53:44', 195);
INSERT INTO `sys_oper_log` VALUES (53, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_conference,base_article,base_pc_confer\"}', NULL, 0, NULL, '2023-11-07 02:56:32', 374);
INSERT INTO `sys_oper_log` VALUES (54, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1061,1063,1064,1065],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 03:15:34', 324);
INSERT INTO `sys_oper_log` VALUES (55, '角色管理', 4, 'com.ruoyi.system.controller.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', NULL, '/role/authUser/selectAll', '127.0.0.1', '', '{\"roleId\":\"2\",\"userIds\":\"3,4,5,6,7,8,9,10,11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 06:06:22', 88);
INSERT INTO `sys_oper_log` VALUES (56, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1061,1063,1064,1065],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 06:06:53', 167);
INSERT INTO `sys_oper_log` VALUES (57, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 06:08:40', 30);
INSERT INTO `sys_oper_log` VALUES (58, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,103,104,105,106,107,102,108,109],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 06:13:03', 49);
INSERT INTO `sys_oper_log` VALUES (59, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/conference/index\",\"createTime\":\"2023-11-07 01:50:03\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"会议管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"conference\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 06:13:58', 41);
INSERT INTO `sys_oper_log` VALUES (60, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/article/index\",\"createTime\":\"2023-11-07 02:33:28\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"投稿管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"article\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 06:14:03', 30);
INSERT INTO `sys_oper_log` VALUES (61, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/pcconfer/index\",\"createTime\":\"2023-11-07 02:35:00\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"邀请管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"pcconfer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 06:14:07', 17);
INSERT INTO `sys_oper_log` VALUES (62, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceName\":\"1231\",\"conferenceNickname\":\"1234\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"0\",\"deadlineDate\":\"2023-11-08\",\"holdDate\":\"2023-11-07\",\"params\":{},\"place\":\"12\",\"resultDate\":\"2023-11-09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 06:37:51', 208);
INSERT INTO `sys_oper_log` VALUES (63, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceName\":\"1231\",\"conferenceNickname\":\"123\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"0\",\"deadlineDate\":\"2023-11-08\",\"holdDate\":\"2023-11-07\",\"params\":{},\"place\":\"12312\",\"resultDate\":\"2023-11-09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 06:41:19', 152);
INSERT INTO `sys_oper_log` VALUES (64, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/myconfer/index\",\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的会议\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"myconfer\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 06:53:23', 140);
INSERT INTO `sys_oper_log` VALUES (65, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-06 13:08:31\",\"default\":false,\"dictCode\":31,\"dictLabel\":\"已审核\",\"dictSort\":2,\"dictType\":\"conference_status_code\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 10:22:31', 152);
INSERT INTO `sys_oper_log` VALUES (66, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-06 13:09:05\",\"default\":false,\"dictCode\":33,\"dictLabel\":\"已拒绝\",\"dictSort\":4,\"dictType\":\"conference_status_code\",\"dictValue\":\"99\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 10:22:42', 29);
INSERT INTO `sys_oper_log` VALUES (67, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":11,\"chairName\":\"111\",\"conferenceId\":1,\"conferenceName\":\"1111\",\"conferenceNickname\":\"11\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-11-08\",\"holdDate\":\"2023-11-07\",\"params\":{},\"place\":\"11\",\"resultDate\":\"2023-11-09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 13:42:30', 259);
INSERT INTO `sys_oper_log` VALUES (68, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1061,1063,1066,1064,1065],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 13:45:41', 311);
INSERT INTO `sys_oper_log` VALUES (69, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,103,104,105,106,107,102,108,109],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 13:46:12', 34);
INSERT INTO `sys_oper_log` VALUES (70, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"conferenceNickname\":\"1234\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-11-08\",\"holdDate\":\"2023-11-07\",\"params\":{},\"place\":\"12\",\"resultDate\":\"2023-11-09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 14:14:28', 200);
INSERT INTO `sys_oper_log` VALUES (71, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":3,\"conferenceName\":\"1231\",\"conferenceNickname\":\"123\",\"conferenceStatusCode\":99,\"conferenceStatusName\":\"已拒绝\",\"deadlineDate\":\"2023-11-08\",\"holdDate\":\"2023-11-07\",\"params\":{},\"place\":\"12312\",\"resultDate\":\"2023-11-09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 14:57:39', 84);
INSERT INTO `sys_oper_log` VALUES (72, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceName\":\"222\",\"conferenceNickname\":\"2222\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-11-09\",\"holdDate\":\"2023-11-09\",\"params\":{},\"place\":\"3444\",\"resultDate\":\"2023-11-16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 06:24:09', 39);
INSERT INTO `sys_oper_log` VALUES (73, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceName\":\"222\",\"conferenceNickname\":\"2222\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-11-09\",\"holdDate\":\"2023-11-09\",\"params\":{},\"place\":\"3444\",\"resultDate\":\"2023-11-16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 06:24:09', 517);
INSERT INTO `sys_oper_log` VALUES (74, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":4,\"conferenceName\":\"222\",\"conferenceNickname\":\"2222\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-11-09\",\"holdDate\":\"2023-11-09\",\"params\":{},\"place\":\"3444\",\"resultDate\":\"2023-11-16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 06:24:12', 24);
INSERT INTO `sys_oper_log` VALUES (75, '文章管理', 1, 'com.ruoyi.base.controller.BaseArticleController.add()', 'POST', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"authorId\":1,\"authorName\":\"admin\",\"conferenceId\":1,\"conferenceName\":\"1111\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 09:09:14', 300);
INSERT INTO `sys_oper_log` VALUES (76, '文章管理', 1, 'com.ruoyi.base.controller.BaseArticleController.add()', 'POST', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"我杀了你\",\"articleName\":\"我爱你\",\"authorId\":1,\"authorName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 09:09:53', 14);
INSERT INTO `sys_oper_log` VALUES (77, '文章管理', 1, 'com.ruoyi.base.controller.BaseArticleController.add()', 'POST', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"水水水水水\",\"articleName\":\"水水水水\",\"authorId\":1,\"authorName\":\"admin\",\"conferenceId\":4,\"conferenceName\":\"222\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 09:11:21', 10);
INSERT INTO `sys_oper_log` VALUES (78, '文章管理', 1, 'com.ruoyi.base.controller.BaseArticleController.add()', 'POST', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"水水水\",\"articleName\":\"太水了太水了\",\"authorId\":1,\"authorName\":\"admin\",\"conferenceId\":3,\"conferenceName\":\"1231\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 09:12:38', 17);
INSERT INTO `sys_oper_log` VALUES (79, '文章管理', 1, 'com.ruoyi.base.controller.BaseArticleController.add()', 'POST', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"authorId\":1,\"authorName\":\"admin\",\"conferenceId\":1,\"conferenceName\":\"1111\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 11:14:51', 67);
INSERT INTO `sys_oper_log` VALUES (80, '文章管理', 1, 'com.ruoyi.base.controller.BaseArticleController.add()', 'POST', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"authorId\":1,\"authorName\":\"admin\",\"conferenceId\":1,\"conferenceName\":\"1111\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 11:37:46', 156);
INSERT INTO `sys_oper_log` VALUES (81, '文章管理', 1, 'com.ruoyi.base.controller.BaseArticleController.add()', 'POST', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"水水水水水水水水\",\"articleName\":\"少时诵诗书s\",\"authorId\":1,\"authorName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 11:54:39', 73);
INSERT INTO `sys_oper_log` VALUES (82, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"conferenceNickname\":\"1234\",\"conferenceStatusCode\":2,\"conferenceStatusName\":\"投稿中\",\"deadlineDate\":\"2023-11-08\",\"holdDate\":\"2023-11-07\",\"params\":{},\"place\":\"12\",\"resultDate\":\"2023-11-09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 12:26:12', 411);
INSERT INTO `sys_oper_log` VALUES (83, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":4,\"conferenceName\":\"222\",\"conferenceNickname\":\"2222\",\"conferenceStatusCode\":2,\"conferenceStatusName\":\"投稿中\",\"deadlineDate\":\"2023-11-09\",\"holdDate\":\"2023-11-09\",\"params\":{},\"place\":\"3444\",\"resultDate\":\"2023-11-16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 12:26:13', 21);
INSERT INTO `sys_oper_log` VALUES (84, '文章管理', 1, 'com.ruoyi.base.controller.BaseArticleController.add()', 'POST', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"11111\",\"articleName\":\"111\",\"authorId\":1,\"authorName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 12:27:24', 52);
INSERT INTO `sys_oper_log` VALUES (85, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/conference/index\",\"createTime\":\"2023-11-07 01:50:03\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"全部会议\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"conference\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 14:23:55', 183);
INSERT INTO `sys_oper_log` VALUES (86, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/article/index\",\"createTime\":\"2023-11-07 02:33:28\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"我的投稿\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"article\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 14:24:31', 17);
INSERT INTO `sys_oper_log` VALUES (87, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/pcconfer/index\",\"createTime\":\"2023-11-07 02:35:00\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"邀请审稿\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"pcconfer\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 14:24:49', 14);
INSERT INTO `sys_oper_log` VALUES (88, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/myInvite/index\",\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"邀请通知\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1061,\"path\":\"myInvite\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 14:25:54', 23);
INSERT INTO `sys_oper_log` VALUES (89, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/4', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 14:30:27', 320);
INSERT INTO `sys_oper_log` VALUES (90, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_invite\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 14:34:38', 130);
INSERT INTO `sys_oper_log` VALUES (91, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/5', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 14:34:46', 43);
INSERT INTO `sys_oper_log` VALUES (92, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_invite\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 14:35:36', 90);
INSERT INTO `sys_oper_log` VALUES (93, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_invite\"}', NULL, 0, NULL, '2023-11-09 01:11:15', 426);
INSERT INTO `sys_oper_log` VALUES (94, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/invite/index\",\"createTime\":\"2023-11-07 02:35:00\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"邀请审稿\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"invite\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 01:22:13', 111);
INSERT INTO `sys_oper_log` VALUES (95, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/myinvite/index\",\"createTime\":\"2023-11-08 14:25:54\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1067,\"menuName\":\"邀请通知\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1061,\"path\":\"myinvite\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 01:24:06', 85);
INSERT INTO `sys_oper_log` VALUES (96, '字典类型', 2, 'com.ruoyi.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-06 12:59:28\",\"dictId\":12,\"dictName\":\"邀请状态\",\"dictType\":\"invite_status_code\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 01:56:08', 216);
INSERT INTO `sys_oper_log` VALUES (97, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_invite\"}', NULL, 0, NULL, '2023-11-09 01:58:48', 111);
INSERT INTO `sys_oper_log` VALUES (98, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_invite\"}', NULL, 0, NULL, '2023-11-09 02:08:27', 161);
INSERT INTO `sys_oper_log` VALUES (99, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":5,\"conferenceName\":\"222\",\"conferenceNickname\":\"2222\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-11-09\",\"holdDate\":\"2023-11-09\",\"params\":{},\"place\":\"3444\",\"resultDate\":\"2023-11-16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 02:49:14', 279);
INSERT INTO `sys_oper_log` VALUES (100, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3,4,5]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysUserMapper.selectUserById', '2023-11-09 11:47:55', 936);
INSERT INTO `sys_oper_log` VALUES (101, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysUserMapper.selectUserById', '2023-11-09 11:48:47', 5);
INSERT INTO `sys_oper_log` VALUES (102, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysUserMapper.selectUserById', '2023-11-09 11:51:08', 7);
INSERT INTO `sys_oper_log` VALUES (103, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysUserMapper.selectUserById', '2023-11-09 11:51:43', 5);
INSERT INTO `sys_oper_log` VALUES (104, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysUserMapper.selectUserById', '2023-11-09 11:52:17', 5);
INSERT INTO `sys_oper_log` VALUES (105, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysUserMapper.selectUserById', '2023-11-09 12:10:37', 67);
INSERT INTO `sys_oper_log` VALUES (106, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysUserMapper.selectUserById', '2023-11-09 12:11:11', 4);
INSERT INTO `sys_oper_log` VALUES (107, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3,4]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysUserMapper.selectUserById', '2023-11-09 13:14:31', 23);
INSERT INTO `sys_oper_log` VALUES (108, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3,4]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\WorkSpace\\huiyitougao\\ruoyi-modules\\ruoyi-base\\target\\classes\\mapper\\base\\BaseInviteMapper.xml]\r\n### The error may involve com.ruoyi.base.mapper.BaseInviteMapper.insertBaseInvite-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_invite          ( chair_id,             chair_name,             pc_id,                                                                 invite_status_code,             invite_status_name )           values ( ?,             ?,             ?,                                                                 ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value\n; Field \'conference_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value', '2023-11-09 13:23:59', 2710);
INSERT INTO `sys_oper_log` VALUES (109, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3,4]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\WorkSpace\\huiyitougao\\ruoyi-modules\\ruoyi-base\\target\\classes\\mapper\\base\\BaseInviteMapper.xml]\r\n### The error may involve com.ruoyi.base.mapper.BaseInviteMapper.insertBaseInvite-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_invite          ( chair_id,             chair_name,             pc_id,                                                                 invite_status_code,             invite_status_name )           values ( ?,             ?,             ?,                                                                 ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value\n; Field \'conference_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value', '2023-11-09 13:24:00', 2710);
INSERT INTO `sys_oper_log` VALUES (110, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\WorkSpace\\huiyitougao\\ruoyi-modules\\ruoyi-base\\target\\classes\\mapper\\base\\BaseInviteMapper.xml]\r\n### The error may involve com.ruoyi.base.mapper.BaseInviteMapper.insertBaseInvite-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_invite          ( chair_id,             chair_name,             pc_id,                                                                 invite_status_code,             invite_status_name )           values ( ?,             ?,             ?,                                                                 ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value\n; Field \'conference_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'conference_id\' doesn\'t have a default value', '2023-11-09 13:24:11', 23);
INSERT INTO `sys_oper_log` VALUES (111, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 13:32:50', 682);
INSERT INTO `sys_oper_log` VALUES (112, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":4,\"conferenceName\":\"222\",\"params\":{},\"pcId\":5,\"pcMemberIds\":[5]}', NULL, 1, '[404] during [GET] to [http://ruoyi-system/user/getUserById/2] [UserService#getUser(Long)]: [{\"timestamp\":\"2023-11-09T21:39:33.212+08:00\",\"status\":404,\"error\":\"Not Found\",\"path\":\"/user/getUserById/2\"}]', '2023-11-09 13:39:31', 515);
INSERT INTO `sys_oper_log` VALUES (113, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":4,\"conferenceName\":\"222\",\"params\":{},\"pcId\":5,\"pcMemberIds\":[5]}', NULL, 1, '[404] during [GET] to [http://ruoyi-system/user/getUserById/2] [UserService#getUser(Long)]: [{\"timestamp\":\"2023-11-09T21:42:50.240+08:00\",\"status\":404,\"error\":\"Not Found\",\"path\":\"/user/getUserById/2\"}]', '2023-11-09 13:42:48', 70);
INSERT INTO `sys_oper_log` VALUES (114, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":4,\"conferenceName\":\"222\",\"params\":{},\"pcId\":5,\"pcMemberIds\":[5]}', NULL, 1, '[404] during [GET] to [http://ruoyi-system/user/getUserById/2] [UserService#getUserById(Long)]: [{\"timestamp\":\"2023-11-09T21:47:53.398+08:00\",\"status\":404,\"error\":\"Not Found\",\"path\":\"/user/getUserById/2\"}]', '2023-11-09 13:47:52', 997);
INSERT INTO `sys_oper_log` VALUES (115, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"params\":{},\"pcId\":5,\"pcMemberIds\":[5]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 13:50:18', 1716);
INSERT INTO `sys_oper_log` VALUES (116, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":2,\"conferenceName\":\"1231\",\"inviteId\":3,\"inviteStatusCode\":1,\"inviteStatusName\":\"待确认\",\"params\":{},\"pcEmail\":\"\",\"pcId\":1,\"pcName\":\"12345\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 14:26:59', 212);
INSERT INTO `sys_oper_log` VALUES (117, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":4,\"conferenceName\":\"222\",\"params\":{},\"pcId\":2,\"pcMemberIds\":[2,3]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 05:28:38', 1020);
INSERT INTO `sys_oper_log` VALUES (118, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceName\":\"International Conference Software Engineering\",\"conferenceNickname\":\"ICSE\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2024-01-31\",\"params\":{},\"place\":\"SHANGHAI\",\"resultDate\":\"2023-12-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:24:17', 174);
INSERT INTO `sys_oper_log` VALUES (119, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceName\":\"IEEE Conference on Computer Vision and Pattern Recognition\",\"conferenceNickname\":\"CVPR\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-12-31\",\"holdDate\":\"2024-11-01\",\"params\":{},\"place\":\"shanghai\",\"resultDate\":\"2024-01-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:25:21', 18);
INSERT INTO `sys_oper_log` VALUES (120, '会议管理', 3, 'com.ruoyi.base.controller.BaseConferenceController.remove()', 'DELETE', 1, 'xiaoming123', NULL, '/conference/7', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:25:52', 47);
INSERT INTO `sys_oper_log` VALUES (121, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceName\":\"IEEE Conference on Computer Vision and Pattern Recognition\",\"conferenceNickname\":\"CVPR\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-12-31\",\"holdDate\":\"2024-11-01\",\"params\":{},\"place\":\"shanghai\",\"resultDate\":\"2024-01-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:27:34', 15);
INSERT INTO `sys_oper_log` VALUES (122, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceName\":\"IEEE Conference on Computer Vision and Pattern Recognition\",\"conferenceNickname\":\"CVPR\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2025-11-13\",\"params\":{},\"place\":\"BEIJING\",\"resultDate\":\"2023-12-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:28:01', 17);
INSERT INTO `sys_oper_log` VALUES (123, '会议管理', 3, 'com.ruoyi.base.controller.BaseConferenceController.remove()', 'DELETE', 1, 'xiaoming123', NULL, '/conference/9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:28:08', 56);
INSERT INTO `sys_oper_log` VALUES (124, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'zhangsan', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":23,\"chairName\":\"zhangsan\",\"conferenceName\":\"Conference and Workshop on Neural Information Processing Systems\",\"conferenceNickname\":\"NIPS\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-12-31\",\"holdDate\":\"2024-03-01\",\"params\":{},\"place\":\"beijing\",\"resultDate\":\"2024-01-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:36:24', 30);
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1061,1063,1066,1064,1065,1067],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:40:20', 190);
INSERT INTO `sys_oper_log` VALUES (126, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":6,\"conferenceName\":\"International Conference Software Engineering\",\"conferenceNickname\":\"ICSE\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2024-01-31\",\"params\":{},\"place\":\"SHANGHAI\",\"resultDate\":\"2023-12-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:41:34', 19);
INSERT INTO `sys_oper_log` VALUES (127, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":23,\"chairName\":\"zhangsan\",\"conferenceId\":10,\"conferenceName\":\"Conference and Workshop on Neural Information Processing Systems\",\"conferenceNickname\":\"NIPS\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-12-31\",\"holdDate\":\"2024-03-01\",\"params\":{},\"place\":\"beijing\",\"resultDate\":\"2024-01-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:41:40', 10);
INSERT INTO `sys_oper_log` VALUES (128, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":6,\"conferenceName\":\"International Conference Software Engineering\",\"conferenceNickname\":\"ICSE\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2024-01-31\",\"params\":{},\"place\":\"SHANGHAI\",\"resultDate\":\"2023-12-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:42:58', 17);
INSERT INTO `sys_oper_log` VALUES (129, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":8,\"conferenceName\":\"IEEE Conference on Computer Vision and Pattern Recognition\",\"conferenceNickname\":\"CVPR\",\"conferenceStatusCode\":99,\"conferenceStatusName\":\"已拒绝\",\"deadlineDate\":\"2023-12-31\",\"holdDate\":\"2024-11-01\",\"params\":{},\"place\":\"shanghai\",\"resultDate\":\"2024-01-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:43:25', 12);
INSERT INTO `sys_oper_log` VALUES (130, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":23,\"chairName\":\"zhangsan\",\"conferenceId\":10,\"conferenceName\":\"Conference and Workshop on Neural Information Processing Systems\",\"conferenceNickname\":\"NIPS\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-12-31\",\"holdDate\":\"2024-03-01\",\"params\":{},\"place\":\"beijing\",\"resultDate\":\"2024-01-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:44:03', 14);
INSERT INTO `sys_oper_log` VALUES (131, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":6,\"conferenceName\":\"International Conference Software Engineering\",\"conferenceNickname\":\"ICSE\",\"conferenceStatusCode\":2,\"conferenceStatusName\":\"投稿中\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2024-01-31\",\"params\":{},\"place\":\"SHANGHAI\",\"resultDate\":\"2023-12-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 07:55:40', 274);
INSERT INTO `sys_oper_log` VALUES (132, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'xiaoming123', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":6,\"conferenceName\":\"International Conference Software Engineering\",\"params\":{},\"pcId\":23,\"pcMemberIds\":[23,24]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:38:50', 1712);
INSERT INTO `sys_oper_log` VALUES (133, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'zhangsan', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":6,\"conferenceName\":\"International Conference Software Engineering\",\"inviteId\":6,\"inviteStatusCode\":1,\"inviteStatusName\":\"待确认\",\"params\":{},\"pcAffiliation\":\"fdu\",\"pcEmail\":\"5676879@fdu.cn\",\"pcId\":23,\"pcName\":\"zhangsan\",\"pcPlace\":\"shanghai\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:40:55', 46);
INSERT INTO `sys_oper_log` VALUES (134, '文章管理', 1, 'com.ruoyi.base.controller.BaseArticleController.add()', 'POST', 1, 'xiaohua', NULL, '/article', '127.0.0.1', '', '{\"article\":\"http://127.0.0.1:9300/statics/2023/11/10/1001_20231110164703A001.pdf\",\"articleAbstract\":\"good abstract\",\"articleName\":\"good paper\",\"authorId\":25,\"authorName\":\"xiaohua\",\"conferenceId\":6,\"conferenceName\":\"International Conference Software Engineering\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:48:57', 357);
INSERT INTO `sys_oper_log` VALUES (135, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'zhangliang', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":6,\"conferenceName\":\"International Conference Software Engineering\",\"inviteId\":7,\"inviteStatusCode\":99,\"inviteStatusName\":\"已拒绝\",\"params\":{},\"pcAffiliation\":\"fudan\",\"pcEmail\":\"s76@fdu.cn\",\"pcId\":24,\"pcName\":\"zhangliang\",\"pcPlace\":\"shanghai\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:51:06', 41);
INSERT INTO `sys_oper_log` VALUES (136, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待审核\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:53:59', 96);
INSERT INTO `sys_oper_log` VALUES (137, '会议管理', 3, 'com.ruoyi.base.controller.BaseConferenceController.remove()', 'DELETE', 1, 'xiaoming123', NULL, '/conference/11', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:54:20', 64);
INSERT INTO `sys_oper_log` VALUES (138, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,114,115,1055,1056,1058,1057,1059,1060,116,1061,1063,1066,1064,1065,1067],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 02:19:38', 404);
INSERT INTO `sys_oper_log` VALUES (139, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"default\":false,\"dictLabel\":\"待提交\",\"dictSort\":0,\"dictType\":\"conference_status_code\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 02:21:21', 82);
INSERT INTO `sys_oper_log` VALUES (140, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-06 13:08:07\",\"default\":false,\"dictCode\":30,\"dictLabel\":\"待审核\",\"dictSort\":1,\"dictType\":\"conference_status_code\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"xiaoming123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 02:21:28', 16);
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-06 13:08:31\",\"default\":false,\"dictCode\":31,\"dictLabel\":\"已审核\",\"dictSort\":2,\"dictType\":\"conference_status_code\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"xiaoming123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 02:21:33', 19);
INSERT INTO `sys_oper_log` VALUES (142, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-06 13:08:48\",\"default\":false,\"dictCode\":32,\"dictLabel\":\"投稿中\",\"dictSort\":3,\"dictType\":\"conference_status_code\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"xiaoming123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 02:21:37', 12);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'xiaoming123', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_confer_topic\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 04:40:46', 142);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'xiaoming123', NULL, '/gen/7', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 04:46:10', 66);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'xiaoming123', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_confer_topic\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 04:48:37', 83);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'xiaoming123', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_confer_topic\"}', NULL, 0, NULL, '2023-11-16 04:51:39', 488);
INSERT INTO `sys_oper_log` VALUES (147, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceName\":\"bobobobo\",\"conferenceNickname\":\"bbbb\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待提交\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"浦东\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 05:01:44', 368);
INSERT INTO `sys_oper_log` VALUES (148, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceName\":\"aoeiuv\",\"conferenceNickname\":\"ele\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待提交\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"luzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 08:10:29', 420);
INSERT INTO `sys_oper_log` VALUES (149, '会议主题', 1, 'com.ruoyi.base.controller.BaseConferTopicController.add()', 'POST', 1, 'admin', NULL, '/topic', '127.0.0.1', '', '{\"conferenceName\":\"aoeiuv\",\"params\":{},\"status\":\"0\",\"topicCode\":1,\"topicLabel\":\"元音\",\"topicValue\":\"vowel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 10:47:15', 274);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/8', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 12:34:46', 111);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_confer_topic\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 12:34:52', 112);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_confer_topic\"}', NULL, 0, NULL, '2023-11-16 12:36:30', 145);
INSERT INTO `sys_oper_log` VALUES (153, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":13,\"conferenceName\":\"aoeiuv\",\"conferenceNickname\":\"ele\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"luzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:12:15', 479);
INSERT INTO `sys_oper_log` VALUES (154, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceName\":\"lajiqikan\",\"conferenceNickname\":\"lj\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待提交\",\"deadlineDate\":\"2023-11-23\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:16:42', 95);
INSERT INTO `sys_oper_log` VALUES (155, '会议主题', 1, 'com.ruoyi.base.controller.BaseConferTopicController.add()', 'POST', 1, 'admin', NULL, '/topic', '127.0.0.1', '', '{\"conferenceName\":\"lajiqikan\",\"params\":{},\"status\":\"0\",\"topicCode\":2,\"topicLabel\":\"huozhe\",\"topicValue\":\"siqu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:17:18', 109);
INSERT INTO `sys_oper_log` VALUES (156, '会议主题', 1, 'com.ruoyi.base.controller.BaseConferTopicController.add()', 'POST', 1, 'admin', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"status\":\"0\",\"topicCode\":3,\"topicLabel\":\"死去\",\"topicValue\":\"huozhe\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:20:24', 49);
INSERT INTO `sys_oper_log` VALUES (157, '会议主题', 2, 'com.ruoyi.base.controller.BaseConferTopicController.edit()', 'PUT', 1, 'admin', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"status\":\"0\",\"topicCode\":2,\"topicLabel\":\"活着\",\"topicValue\":\"siqu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:20:32', 56);
INSERT INTO `sys_oper_log` VALUES (158, '会议主题', 2, 'com.ruoyi.base.controller.BaseConferTopicController.edit()', 'PUT', 1, 'admin', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"status\":\"1\",\"topicCode\":2,\"topicLabel\":\"活着\",\"topicValue\":\"siqu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:21:00', 23);
INSERT INTO `sys_oper_log` VALUES (159, '会议主题', 2, 'com.ruoyi.base.controller.BaseConferTopicController.edit()', 'PUT', 1, 'admin', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"status\":\"1\",\"topicCode\":3,\"topicLabel\":\"死去\",\"topicValue\":\"huozhe\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:21:04', 6);
INSERT INTO `sys_oper_log` VALUES (160, '会议主题', 2, 'com.ruoyi.base.controller.BaseConferTopicController.edit()', 'PUT', 1, 'admin', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"status\":\"0\",\"topicCode\":2,\"topicLabel\":\"活着\",\"topicValue\":\"siqu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:21:26', 17);
INSERT INTO `sys_oper_log` VALUES (161, '会议主题', 2, 'com.ruoyi.base.controller.BaseConferTopicController.edit()', 'PUT', 1, 'admin', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"status\":\"0\",\"topicCode\":3,\"topicLabel\":\"死去\",\"topicValue\":\"huozhe\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:21:31', 5);
INSERT INTO `sys_oper_log` VALUES (162, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceName\":\"shuikan\",\"conferenceNickname\":\"water\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待提交\",\"deadlineDate\":\"2023-11-17\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"suzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:23:29', 23);
INSERT INTO `sys_oper_log` VALUES (163, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"conferenceNickname\":\"lj\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-11-23\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:23:34', 22);
INSERT INTO `sys_oper_log` VALUES (164, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"conferenceNickname\":\"lj\",\"conferenceStatusCode\":2,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-11-23\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:25:33', 25);
INSERT INTO `sys_oper_log` VALUES (165, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"conferenceNickname\":\"lj\",\"conferenceStatusCode\":3,\"conferenceStatusName\":\"投稿中\",\"deadlineDate\":\"2023-11-23\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:25:54', 11);
INSERT INTO `sys_oper_log` VALUES (166, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"pcId\":22,\"pcMemberIds\":[22,23,24]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:30:30', 660);
INSERT INTO `sys_oper_log` VALUES (167, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,114,115,1055,1058,1056,1057,1059,1060,116,1061,1066,1063,1064,1065,1067],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"xiaoming123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:38:17', 282);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/myconfer/index\",\"createTime\":\"2023-11-07 06:53:23\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1066,\"menuName\":\"我的会议\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"myconfer\",\"perms\":\"base:myconfer:list\",\"status\":\"0\",\"updateBy\":\"xiaoming123\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:45:20', 124);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/conference/index\",\"createTime\":\"2023-11-07 01:50:03\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"全部会议\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"conference\",\"perms\":\"base:conference:list\",\"status\":\"0\",\"updateBy\":\"xiaoming123\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:45:37', 8);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/article/index\",\"createTime\":\"2023-11-07 02:33:28\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"我的投稿\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"article\",\"perms\":\"base:article:list\",\"status\":\"0\",\"updateBy\":\"xiaoming123\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:45:51', 19);
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/invite/index\",\"createTime\":\"2023-11-07 02:35:00\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"邀请审稿\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"invite\",\"perms\":\"base:invite:list\",\"status\":\"0\",\"updateBy\":\"xiaoming123\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:46:01', 9);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/myinvite/index\",\"createTime\":\"2023-11-08 14:25:54\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1067,\"menuName\":\"邀请通知\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1061,\"path\":\"myinvite\",\"perms\":\"base:myinvite:list\",\"status\":\"0\",\"updateBy\":\"xiaoming123\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:46:15', 41);
INSERT INTO `sys_oper_log` VALUES (173, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,114,115,1055,1058,1056,1057,1059,1060,116],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"xiaoming123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:46:45', 61);
INSERT INTO `sys_oper_log` VALUES (174, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,114,115,1055,1056,1058,1057,1059,1060,116,1061,1063,1066,1064,1065,1067],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-16 13:47:31', 36);
INSERT INTO `sys_oper_log` VALUES (175, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-17 01:28:22', 229);
INSERT INTO `sys_oper_log` VALUES (176, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,114,115,1055,1056,1058,1057,1059,1060,116,1061,1063,1066,1064,1065,1067],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-17 01:28:30', 45);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_pc_topic\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 01:12:11', 186);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_pc_topic\"}', NULL, 0, NULL, '2023-11-18 01:14:06', 577);
INSERT INTO `sys_oper_log` VALUES (179, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"inviteId\":8,\"inviteStatusCode\":1,\"inviteStatusName\":\"待确认\",\"params\":{},\"pcAffiliation\":\"fudan\",\"pcEmail\":\"7666@fdu.cn\",\"pcId\":22,\"pcName\":\"xiaoming123\",\"pcPlace\":\"shanghai\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 01:54:25', 170);
INSERT INTO `sys_oper_log` VALUES (180, '审核人主题', 1, 'com.ruoyi.base.controller.BasePcTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/pcTopic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\"}', NULL, 1, '', '2023-11-18 01:54:25', 275);
INSERT INTO `sys_oper_log` VALUES (181, '审核人主题', 1, 'com.ruoyi.base.controller.BasePcTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/pcTopic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\"}', NULL, 1, '', '2023-11-18 01:56:25', 37);
INSERT INTO `sys_oper_log` VALUES (182, '审核人主题', 1, 'com.ruoyi.base.controller.BasePcTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/pcTopic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\"}', NULL, 1, '', '2023-11-18 02:01:35', 122);
INSERT INTO `sys_oper_log` VALUES (183, '审核人主题', 1, 'com.ruoyi.base.controller.BasePcTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/pcTopic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\",\"topicList\":[2]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 02:04:03', 166);
INSERT INTO `sys_oper_log` VALUES (184, '审核人主题', 1, 'com.ruoyi.base.controller.BasePcTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/pcTopic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\",\"topicList\":[2,3]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 02:04:57', 47);
INSERT INTO `sys_oper_log` VALUES (185, '审核人主题', 1, 'com.ruoyi.base.controller.BasePcTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/pcTopic', '127.0.0.1', '', '{\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\",\"topicList\":[2,3]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 02:06:31', 54);
INSERT INTO `sys_oper_log` VALUES (186, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"inviteId\":8,\"inviteStatusCode\":1,\"inviteStatusName\":\"待确认\",\"params\":{},\"pcAffiliation\":\"fudan\",\"pcEmail\":\"7666@fdu.cn\",\"pcId\":22,\"pcName\":\"xiaoming123\",\"pcPlace\":\"shanghai\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 02:06:31', 83);
INSERT INTO `sys_oper_log` VALUES (187, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'xiaoming123', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":6,\"conferenceName\":\"International Conference Software Engineering\",\"params\":{},\"pcId\":23,\"pcMemberIds\":[23,24,25,22]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 04:58:48', 441);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":1063,\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 05:04:34', 145);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1068', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 05:05:03', 43);
INSERT INTO `sys_oper_log` VALUES (190, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceName\":\"test\",\"conferenceNickname\":\"test111\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待提交\",\"deadlineDate\":\"2023-11-16\",\"holdDate\":\"2023-11-15\",\"params\":{},\"place\":\"huzhou\",\"resultDate\":\"2023-11-22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 05:10:22', 79);
INSERT INTO `sys_oper_log` VALUES (191, '会议主题', 1, 'com.ruoyi.base.controller.BaseConferTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":12,\"conferenceName\":\"bobobobo\",\"params\":{},\"status\":\"0\",\"topicCode\":4,\"topicLabel\":\"博士哥\",\"topicValue\":\"bo\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 05:11:21', 102);
INSERT INTO `sys_oper_log` VALUES (192, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":12,\"conferenceName\":\"bobobobo\",\"conferenceNickname\":\"bbbb\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"浦东\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 05:11:43', 19);
INSERT INTO `sys_oper_log` VALUES (193, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":12,\"conferenceName\":\"bobobobo\",\"conferenceNickname\":\"bbbb\",\"conferenceStatusCode\":2,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"浦东\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 05:12:56', 8);
INSERT INTO `sys_oper_log` VALUES (194, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":12,\"conferenceName\":\"bobobobo\",\"conferenceNickname\":\"bbbb\",\"conferenceStatusCode\":3,\"conferenceStatusName\":\"投稿中\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"浦东\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 05:13:44', 7);
INSERT INTO `sys_oper_log` VALUES (195, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'xiaoming123', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":12,\"conferenceName\":\"bobobobo\",\"params\":{},\"pcId\":22,\"pcMemberIds\":[22]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 05:14:10', 271);
INSERT INTO `sys_oper_log` VALUES (196, '审核人主题', 1, 'com.ruoyi.base.controller.BasePcTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/pcTopic', '127.0.0.1', '', '{\"conferenceId\":12,\"conferenceName\":\"bobobobo\",\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\",\"topicList\":[4]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 05:15:35', 50);
INSERT INTO `sys_oper_log` VALUES (197, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":12,\"conferenceName\":\"bobobobo\",\"inviteId\":15,\"inviteStatusCode\":1,\"inviteStatusName\":\"待确认\",\"params\":{},\"pcAffiliation\":\"fudan\",\"pcEmail\":\"7666@fdu.cn\",\"pcId\":22,\"pcName\":\"xiaoming123\",\"pcPlace\":\"shanghai\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 05:15:35', 19);
INSERT INTO `sys_oper_log` VALUES (198, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"default\":false,\"dictLabel\":\"审稿中\",\"dictSort\":4,\"dictType\":\"conference_status_code\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 06:44:28', 170);
INSERT INTO `sys_oper_log` VALUES (199, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-06 13:09:05\",\"default\":false,\"dictCode\":33,\"dictLabel\":\"已拒绝\",\"dictSort\":5,\"dictType\":\"conference_status_code\",\"dictValue\":\"99\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"xiaoming123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 06:44:39', 23);
INSERT INTO `sys_oper_log` VALUES (200, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":6,\"conferenceName\":\"International Conference Software Engineering\",\"conferenceNickname\":\"ICSE\",\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2024-01-31\",\"params\":{},\"place\":\"SHANGHAI\",\"resultDate\":\"2023-12-31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 07:14:52', 27);
INSERT INTO `sys_oper_log` VALUES (201, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":12,\"conferenceName\":\"bobobobo\",\"conferenceNickname\":\"bbbb\",\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"浦东\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 07:16:45', 7);
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_author\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 08:17:48', 123);
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_author\"}', NULL, 0, NULL, '2023-11-18 08:25:39', 164);
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_review\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-18 13:24:04', 328);
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/12', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:21:22', 477);
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_rebuttal,base_allocation,base_count\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:21:32', 226);
INSERT INTO `sys_oper_log` VALUES (207, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"审稿状态\",\"dictType\":\"review_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:23:58', 66);
INSERT INTO `sys_oper_log` VALUES (208, '字典类型', 2, 'com.ruoyi.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-19 05:23:58\",\"dictId\":13,\"dictName\":\"审稿状态\",\"dictType\":\"review_status_code\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:24:11', 61);
INSERT INTO `sys_oper_log` VALUES (209, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待审核\",\"dictSort\":0,\"dictType\":\"review_status_code\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:24:53', 22);
INSERT INTO `sys_oper_log` VALUES (210, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已审核\",\"dictSort\":0,\"dictType\":\"review_status_code\",\"dictValue\":\"已审核\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:25:11', 15);
INSERT INTO `sys_oper_log` VALUES (211, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-19 05:25:11\",\"default\":false,\"dictCode\":41,\"dictLabel\":\"已审核\",\"dictSort\":0,\"dictType\":\"review_status_code\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:25:18', 17);
INSERT INTO `sys_oper_log` VALUES (212, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-19 05:24:53\",\"default\":false,\"dictCode\":40,\"dictLabel\":\"待审稿\",\"dictSort\":0,\"dictType\":\"review_status_code\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:26:18', 22);
INSERT INTO `sys_oper_log` VALUES (213, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-19 05:25:11\",\"default\":false,\"dictCode\":41,\"dictLabel\":\"已审稿\",\"dictSort\":0,\"dictType\":\"review_status_code\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:26:26', 16);
INSERT INTO `sys_oper_log` VALUES (214, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"分数码\",\"dictType\":\"score_code\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:26:59', 17);
INSERT INTO `sys_oper_log` VALUES (215, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"confidence_code\",\"dictType\":\"confidence_code\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:27:33', 21);
INSERT INTO `sys_oper_log` VALUES (216, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"录用码\",\"dictType\":\"accept_code\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:28:01', 12);
INSERT INTO `sys_oper_log` VALUES (217, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"reject\",\"dictSort\":0,\"dictType\":\"score_code\",\"dictValue\":\"-2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:28:53', 16);
INSERT INTO `sys_oper_log` VALUES (218, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"-1\",\"dictSort\":0,\"dictType\":\"score_code\",\"dictValue\":\"weak reject\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:29:16', 14);
INSERT INTO `sys_oper_log` VALUES (219, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-19 05:29:16\",\"default\":false,\"dictCode\":43,\"dictLabel\":\"weak reject\",\"dictSort\":0,\"dictType\":\"score_code\",\"dictValue\":\"-1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:29:25', 15);
INSERT INTO `sys_oper_log` VALUES (220, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"weak accept\",\"dictSort\":0,\"dictType\":\"score_code\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:29:40', 11);
INSERT INTO `sys_oper_log` VALUES (221, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"accept\",\"dictSort\":0,\"dictType\":\"score_code\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:29:50', 13);
INSERT INTO `sys_oper_log` VALUES (222, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"very low\",\"dictSort\":0,\"dictType\":\"confidence_code\",\"dictValue\":\"-2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:37:50', 130);
INSERT INTO `sys_oper_log` VALUES (223, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"low\",\"dictSort\":0,\"dictType\":\"confidence_code\",\"dictValue\":\"-1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:38:02', 11);
INSERT INTO `sys_oper_log` VALUES (224, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"high\",\"dictSort\":0,\"dictType\":\"confidence_code\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:38:12', 11);
INSERT INTO `sys_oper_log` VALUES (225, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"very high\",\"dictSort\":0,\"dictType\":\"confidence_code\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:38:21', 15);
INSERT INTO `sys_oper_log` VALUES (226, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已录用\",\"dictSort\":0,\"dictType\":\"accept_code\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:38:56', 13);
INSERT INTO `sys_oper_log` VALUES (227, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未录用\",\"dictSort\":0,\"dictType\":\"accept_code\",\"dictValue\":\"99\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 05:39:11', 21);
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_allocation,base_count,base_rebuttal\"}', NULL, 0, NULL, '2023-11-19 05:45:03', 737);
INSERT INTO `sys_oper_log` VALUES (229, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'xiaoming123', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"dictName\":\"文章状态码\",\"dictType\":\"article_status_code\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 07:21:36', 43);
INSERT INTO `sys_oper_log` VALUES (230, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"default\":false,\"dictLabel\":\"待提交\",\"dictSort\":0,\"dictType\":\"article_status_code\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 07:22:02', 28);
INSERT INTO `sys_oper_log` VALUES (231, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"default\":false,\"dictLabel\":\"已提交\",\"dictSort\":0,\"dictType\":\"article_status_code\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 07:22:22', 14);
INSERT INTO `sys_oper_log` VALUES (232, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"default\":false,\"dictLabel\":\"待审稿\",\"dictSort\":0,\"dictType\":\"article_status_code\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 07:22:34', 12);
INSERT INTO `sys_oper_log` VALUES (233, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"default\":false,\"dictLabel\":\"rebuttal\",\"dictSort\":0,\"dictType\":\"article_status_code\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 07:24:30', 40);
INSERT INTO `sys_oper_log` VALUES (234, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"default\":false,\"dictLabel\":\"已录用\",\"dictSort\":0,\"dictType\":\"article_status_code\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 07:24:44', 10);
INSERT INTO `sys_oper_log` VALUES (235, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"default\":false,\"dictLabel\":\"不录用\",\"dictSort\":0,\"dictType\":\"article_status_code\",\"dictValue\":\"99\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 07:25:03', 14);
INSERT INTO `sys_oper_log` VALUES (236, '字典类型', 2, 'com.ruoyi.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"createTime\":\"2023-11-19 07:21:36\",\"dictId\":17,\"dictName\":\"文章状态\",\"dictType\":\"article_status_code\",\"params\":{},\"status\":\"0\",\"updateBy\":\"xiaoming123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 07:25:34', 31);
INSERT INTO `sys_oper_log` VALUES (237, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.synchDb()', 'GET', 1, 'xiaoming123', NULL, '/gen/synchDb/base_article', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 07:36:45', 213);
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.synchDb()', 'GET', 1, 'xiaoming123', NULL, '/gen/synchDb/base_article', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 07:53:49', 164);
INSERT INTO `sys_oper_log` VALUES (239, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'xiaoming123', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"111111\",\"articleName\":\"test1111\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"creatorId\":22,\"creatorName\":\"xiaoming123\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 08:20:57', 134);
INSERT INTO `sys_oper_log` VALUES (240, '作者信息', 1, 'com.ruoyi.contribute.controller.BaseAuthorController.add()', 'POST', 1, 'xiaoming123', NULL, '/author', '127.0.0.1', '', '{\"articleId\":11,\"articleName\":\"test1111\",\"authorAffiliation\":\"fudan\",\"authorEmail\":\"123@11.com\",\"authorId\":1,\"authorName\":\"test0001\",\"authorPlace\":\"shanghai\",\"orderNum\":0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 09:04:23', 383);
INSERT INTO `sys_oper_log` VALUES (241, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'xiaoming123', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"bobobobo\\n\",\"articleName\":\"test0002\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"creatorId\":22,\"creatorName\":\"xiaoming123\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 09:05:15', 38);
INSERT INTO `sys_oper_log` VALUES (242, '作者信息', 1, 'com.ruoyi.contribute.controller.BaseAuthorController.add()', 'POST', 1, 'xiaoming123', NULL, '/author', '127.0.0.1', '', '{\"articleId\":12,\"articleName\":\"test0002\",\"authorAffiliation\":\"fdu\",\"authorEmail\":\"123@11.com\",\"authorId\":2,\"authorName\":\"test0009\",\"authorPlace\":\"zhongguo\",\"orderNum\":0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 09:05:46', 12);
INSERT INTO `sys_oper_log` VALUES (243, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'xiaoming123', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"base_article_topic\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-19 10:15:56', 84);
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'xiaoming123', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"base_article_topic\"}', NULL, 0, NULL, '2023-11-19 10:17:02', 155);
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/10', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 06:23:21', 128);
INSERT INTO `sys_oper_log` VALUES (246, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/16', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 06:23:25', 11);
INSERT INTO `sys_oper_log` VALUES (247, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/base_invite', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 06:23:31', 183);
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/base_article', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 06:23:39', 88);
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"base/allocation/index\",\"createBy\":\"admin\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"全部稿件\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1061,\"path\":\"allocation\",\"perms\":\"review:allocation:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 15:26:09', 180);
INSERT INTO `sys_oper_log` VALUES (250, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceName\":\"-1\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreName\":\"-1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 15:37:54', 451);
INSERT INTO `sys_oper_log` VALUES (251, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-2,\"confidenceName\":\"-1\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2,\"scoreName\":\"-1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 15:53:13', 81);
INSERT INTO `sys_oper_log` VALUES (252, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-2,\"confidenceName\":\"aaa\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":1,\"scoreName\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 16:12:31', 20);
INSERT INTO `sys_oper_log` VALUES (253, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-2,\"confidenceName\":\"1\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":1,\"scoreName\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 16:26:32', 11);
INSERT INTO `sys_oper_log` VALUES (254, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-2,\"confidenceName\":\"1\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreName\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 16:31:25', 16);
INSERT INTO `sys_oper_log` VALUES (255, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-2,\"confidenceName\":\"1\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2,\"scoreName\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 16:33:51', 24);
INSERT INTO `sys_oper_log` VALUES (256, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceName\":\"2\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreName\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 16:35:26', 12);
INSERT INTO `sys_oper_log` VALUES (257, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/base_article', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 10:56:21', 98);
INSERT INTO `sys_oper_log` VALUES (258, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/base_invite', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 10:56:23', 76);
INSERT INTO `sys_oper_log` VALUES (259, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceName\":\"-2\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreName\":\"-2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 19:21:39', 52);
INSERT INTO `sys_oper_log` VALUES (260, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-2,\"confidenceName\":\"-2\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreName\":\"-2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 19:25:11', 46);
INSERT INTO `sys_oper_log` VALUES (261, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-2,\"confidenceName\":\"-2\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2,\"scoreName\":\"-2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 19:26:58', 35);
INSERT INTO `sys_oper_log` VALUES (262, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-2,\"confidenceName\":\"-2\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2,\"scoreName\":\"-2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 19:27:05', 8);
INSERT INTO `sys_oper_log` VALUES (263, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-1,\"confidenceName\":\"\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":1,\"scoreName\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 19:28:32', 10);
INSERT INTO `sys_oper_log` VALUES (264, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-1,\"confidenceName\":\"\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":1,\"scoreName\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 19:31:42', 7);
INSERT INTO `sys_oper_log` VALUES (265, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-2,\"confidenceName\":\"\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":1,\"scoreName\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 19:31:57', 9);
INSERT INTO `sys_oper_log` VALUES (266, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-1,\"confidenceName\":\"\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-1,\"scoreName\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 19:35:04', 14);
INSERT INTO `sys_oper_log` VALUES (267, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":-1,\"confidenceName\":\"\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2,\"scoreName\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 19:43:03', 186);
INSERT INTO `sys_oper_log` VALUES (268, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":1,\"articleId\":10,\"articleName\":\"good paper\",\"comment\":\"it should be better\",\"confidenceCode\":1,\"confidenceName\":\"\",\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2,\"scoreName\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-20 19:43:10', 30);
INSERT INTO `sys_oper_log` VALUES (269, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,114,115,1055,1056,1058,1057,1059,1060,116,1061,1063,1066,1064,1065,1067,1068],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 13:55:27', 2658);
INSERT INTO `sys_oper_log` VALUES (270, '作者信息', 1, 'com.ruoyi.contribute.controller.BaseAuthorController.add()', 'POST', 1, 'admin', NULL, '/author', '127.0.0.1', '', '{\"articleId\":10,\"articleName\":\"good paper\",\"authorAffiliation\":\"fudan\",\"authorEmail\":\"11@123.com\",\"authorId\":3,\"authorName\":\"test001\",\"authorPlace\":\"shanghai\",\"orderNum\":0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:06:45', 211);
INSERT INTO `sys_oper_log` VALUES (271, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"article\":\"http://127.0.0.1:9300/statics/2023/11/10/1001_20231110164703A001.pdf\",\"articleAbstract\":\"good abstract\",\"articleId\":10,\"articleName\":\"good paper\",\"articleStatusCode\":1,\"articleStatusName\":\"已投稿\",\"conferenceId\":6,\"conferenceName\":\"International Conference Software Engineering\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:06:50', 84);
INSERT INTO `sys_oper_log` VALUES (272, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"conferenceNickname\":\"lj\",\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"deadlineDate\":\"2023-11-23\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:37:18', 376);
INSERT INTO `sys_oper_log` VALUES (273, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"conferenceNickname\":\"lj\",\"conferenceStatusCode\":2,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-11-23\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:39:38', 64);
INSERT INTO `sys_oper_log` VALUES (274, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"inviteId\":16,\"inviteStatusCode\":1,\"inviteStatusName\":\"已确认\",\"params\":{},\"pcEmail\":\"ry@163.com\",\"pcId\":1,\"pcMemberIds\":[1],\"pcName\":\"admin\",\"topicCode\":\"2,3\",\"topicCodeList\":[2,3],\"topicLabel\":\"活着,死去\",\"topicValue\":\"siqu,huozhe\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:39:39', 963);
INSERT INTO `sys_oper_log` VALUES (275, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"conferenceNickname\":\"lj\",\"conferenceStatusCode\":3,\"conferenceStatusName\":\"投稿中\",\"deadlineDate\":\"2023-11-23\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:40:42', 9);
INSERT INTO `sys_oper_log` VALUES (276, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"conferenceNickname\":\"lj\",\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"deadlineDate\":\"2023-11-23\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:40:51', 9);
INSERT INTO `sys_oper_log` VALUES (277, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"发布结果\",\"dictSort\":4,\"dictType\":\"conference_status_code\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:47:35', 79);
INSERT INTO `sys_oper_log` VALUES (278, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-06 13:09:05\",\"default\":false,\"dictCode\":33,\"dictLabel\":\"已拒绝\",\"dictSort\":6,\"dictType\":\"conference_status_code\",\"dictValue\":\"99\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:47:40', 16);
INSERT INTO `sys_oper_log` VALUES (279, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-06 13:09:27\",\"default\":false,\"dictCode\":34,\"dictLabel\":\"结束\",\"dictSort\":6,\"dictType\":\"conference_status_code\",\"dictValue\":\"-1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:47:49', 18);
INSERT INTO `sys_oper_log` VALUES (280, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-06 13:09:27\",\"default\":false,\"dictCode\":34,\"dictLabel\":\"结束\",\"dictSort\":7,\"dictType\":\"conference_status_code\",\"dictValue\":\"-1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:47:54', 9);
INSERT INTO `sys_oper_log` VALUES (281, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-21 06:47:34\",\"default\":false,\"dictCode\":58,\"dictLabel\":\"发布结果\",\"dictSort\":5,\"dictType\":\"conference_status_code\",\"dictValue\":\"5\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 06:47:59', 11);
INSERT INTO `sys_oper_log` VALUES (282, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'xiaoming123', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"121212\",\"articleName\":\"test00012\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"creatorId\":22,\"creatorName\":\"xiaoming123\",\"params\":{},\"topicCode\":\"2,3\",\"topicCodeList\":[2,3],\"topicLabel\":\"活着,死去\",\"topicValue\":\"siqu,huozhe\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 07:19:18', 1125);
INSERT INTO `sys_oper_log` VALUES (283, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"121212\",\"articleId\":13,\"articleName\":\"test00012\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"creatorId\":22,\"creatorName\":\"xiaoming123\",\"params\":{},\"topicCode\":\"2\",\"topicCodeList\":[2],\"topicLabel\":\"活着\",\"topicValue\":\"siqu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 07:19:32', 38);
INSERT INTO `sys_oper_log` VALUES (284, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"default\":false,\"dictLabel\":\"-1\",\"dictSort\":7,\"dictType\":\"article_status_code\",\"dictValue\":\"未提交\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 07:41:09', 49);
INSERT INTO `sys_oper_log` VALUES (285, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"createTime\":\"2023-11-21 07:41:09\",\"default\":false,\"dictCode\":59,\"dictLabel\":\"未提交\",\"dictSort\":7,\"dictType\":\"article_status_code\",\"dictValue\":\"-1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"xiaoming123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-21 07:41:19', 26);
INSERT INTO `sys_oper_log` VALUES (286, '作者信息', 1, 'com.ruoyi.contribute.controller.BaseAuthorController.add()', 'POST', 1, 'xiaoming123', NULL, '/author', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"authorAffiliation\":\"复旦\",\"authorEmail\":\"11@123.com\",\"authorId\":4,\"authorName\":\"test0001\",\"authorPlace\":\"上海\",\"orderNum\":0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-22 00:54:50', 138);
INSERT INTO `sys_oper_log` VALUES (287, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"121212\",\"articleId\":13,\"articleName\":\"test00012\",\"articleStatusCode\":1,\"articleStatusName\":\"已投稿\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"creatorId\":22,\"creatorName\":\"xiaoming123\",\"params\":{},\"topicCode\":\"2\",\"topicLabel\":\"活着\",\"topicValue\":\"siqu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-22 00:54:54', 72);
INSERT INTO `sys_oper_log` VALUES (288, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleId\":13,\"articleStatusCode\":2,\"articleStatusName\":\"待审稿\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-22 00:56:33', 39);
INSERT INTO `sys_oper_log` VALUES (289, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"conferenceNickname\":\"lj\",\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"deadlineDate\":\"2023-11-23\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-22 00:56:34', 210);
INSERT INTO `sys_oper_log` VALUES (290, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已失效\",\"dictSort\":4,\"dictType\":\"invite_status_code\",\"dictValue\":\"-1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-22 01:02:30', 60);
INSERT INTO `sys_oper_log` VALUES (291, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":2,\"articleId\":13,\"articleName\":\"test00012\",\"comment\":\"bad paper\",\"confidenceCode\":-1,\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-22 14:39:54', 709);
INSERT INTO `sys_oper_log` VALUES (292, '稿件分配', 1, 'com.ruoyi.review.controller.BaseAllocationController.add()', 'POST', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [S:\\group14_new\\conferenceSubmission\\ruoyi-modules\\ruoyi-review\\target\\classes\\mapper\\review\\BaseAllocationMapper.xml]\r\n### The error may involve com.ruoyi.review.mapper.BaseAllocationMapper.insertBaseAllocation-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_allocation\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-11-22 14:59:37', 4948);
INSERT INTO `sys_oper_log` VALUES (293, '稿件分配', 1, 'com.ruoyi.review.controller.BaseAllocationController.add()', 'POST', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [S:\\group14_new\\conferenceSubmission\\ruoyi-modules\\ruoyi-review\\target\\classes\\mapper\\review\\BaseAllocationMapper.xml]\r\n### The error may involve com.ruoyi.review.mapper.BaseAllocationMapper.insertBaseAllocation-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_allocation\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-11-22 15:00:34', 112);
INSERT INTO `sys_oper_log` VALUES (294, '稿件分配', 1, 'com.ruoyi.review.controller.BaseAllocationController.add()', 'POST', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [S:\\group14_new\\conferenceSubmission\\ruoyi-modules\\ruoyi-review\\target\\classes\\mapper\\review\\BaseAllocationMapper.xml]\r\n### The error may involve com.ruoyi.review.mapper.BaseAllocationMapper.insertBaseAllocation-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_allocation\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-11-22 15:10:23', 641);
INSERT INTO `sys_oper_log` VALUES (295, '稿件分配', 1, 'com.ruoyi.review.controller.BaseAllocationController.add()', 'POST', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":4,\"articleId\":13,\"articleName\":\"test00012\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-23 14:19:18', 629);
INSERT INTO `sys_oper_log` VALUES (296, '稿件分配', 1, 'com.ruoyi.review.controller.BaseAllocationController.add()', 'POST', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":3,\"articleId\":13,\"articleName\":\"test00012\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-23 14:19:18', 6969);
INSERT INTO `sys_oper_log` VALUES (297, '稿件分配', 1, 'com.ruoyi.review.controller.BaseAllocationController.add()', 'POST', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":6,\"articleId\":13,\"articleName\":\"test00012\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-23 14:35:36', 45);
INSERT INTO `sys_oper_log` VALUES (298, '稿件分配', 1, 'com.ruoyi.review.controller.BaseAllocationController.add()', 'POST', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":7,\"articleId\":13,\"articleName\":\"test00012\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-23 14:40:18', 133);
INSERT INTO `sys_oper_log` VALUES (299, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"zxcvbn\"}', NULL, 1, 'review:rebuttal:add', '2023-11-23 14:43:13', 541);
INSERT INTO `sys_oper_log` VALUES (300, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"zxcvbn\"}', NULL, 1, 'review:rebuttal:add', '2023-11-23 14:43:20', 18);
INSERT INTO `sys_oper_log` VALUES (301, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"zxcvbn\"}', NULL, 1, 'review:rebuttal:add', '2023-11-23 14:43:25', 23);
INSERT INTO `sys_oper_log` VALUES (302, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-11-05 01:52:18\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,114,115,1055,1056,1058,1057,1059,1060,116,1061,1063,1066,1064,1065,1067,1068],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-23 14:45:24', 9231);
INSERT INTO `sys_oper_log` VALUES (303, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"hh\"}', NULL, 1, 'review:rebuttal:add', '2023-11-23 14:45:39', 47);
INSERT INTO `sys_oper_log` VALUES (304, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"hh\"}', NULL, 1, 'review:rebuttal:add', '2023-11-23 14:45:39', 1);
INSERT INTO `sys_oper_log` VALUES (305, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"kjhgfd\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'rebuttal_id\' doesn\'t have a default value\r\n### The error may exist in file [S:\\group14_new\\conferenceSubmission\\ruoyi-modules\\ruoyi-review\\target\\classes\\mapper\\review\\BaseRebuttalMapper.xml]\r\n### The error may involve com.ruoyi.review.mapper.BaseRebuttalMapper.insertBaseRebuttal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_rebuttal          ( article_id,             article_name,                                       rebuttal_message )           values ( ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'rebuttal_id\' doesn\'t have a default value\n; Field \'rebuttal_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'rebuttal_id\' doesn\'t have a default value', '2023-11-23 14:50:08', 1381);
INSERT INTO `sys_oper_log` VALUES (306, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"kjhgfd\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-23 14:51:02', 79);
INSERT INTO `sys_oper_log` VALUES (307, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalId\":2,\"rebuttalMessage\":\"my paper is really good！\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'base_rebuttal.PRIMARY\'\r\n### The error may exist in file [S:\\group14_new\\conferenceSubmission\\ruoyi-modules\\ruoyi-review\\target\\classes\\mapper\\review\\BaseRebuttalMapper.xml]\r\n### The error may involve com.ruoyi.review.mapper.BaseRebuttalMapper.insertBaseRebuttal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_rebuttal          ( rebuttal_id,             article_id,             article_name,                                       rebuttal_message )           values ( ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'base_rebuttal.PRIMARY\'\n; Duplicate entry \'2\' for key \'base_rebuttal.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'base_rebuttal.PRIMARY\'', '2023-11-23 15:02:23', 634);
INSERT INTO `sys_oper_log` VALUES (308, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"my paper is really good！\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-23 15:03:06', 78);
INSERT INTO `sys_oper_log` VALUES (309, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalId\":4,\"rebuttalMessage\":\"my paper is really good！\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'4\' for key \'base_rebuttal.PRIMARY\'\r\n### The error may exist in file [S:\\group14_new\\conferenceSubmission\\ruoyi-modules\\ruoyi-review\\target\\classes\\mapper\\review\\BaseRebuttalMapper.xml]\r\n### The error may involve com.ruoyi.review.mapper.BaseRebuttalMapper.insertBaseRebuttal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_rebuttal          ( rebuttal_id,             article_id,             article_name,                                       rebuttal_message )           values ( ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'4\' for key \'base_rebuttal.PRIMARY\'\n; Duplicate entry \'4\' for key \'base_rebuttal.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'4\' for key \'base_rebuttal.PRIMARY\'', '2023-11-23 22:55:43', 11251);
INSERT INTO `sys_oper_log` VALUES (310, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"asdfghj\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-23 22:56:37', 116);
INSERT INTO `sys_oper_log` VALUES (311, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"2525\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-23 23:00:08', 524);
INSERT INTO `sys_oper_log` VALUES (312, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"asdfg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-23 23:18:10', 183);
INSERT INTO `sys_oper_log` VALUES (313, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":2,\"articleId\":13,\"articleName\":\"test00012\",\"comment\":\"bad paper\",\"confidenceCode\":2,\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-23 23:20:40', 284);
INSERT INTO `sys_oper_log` VALUES (314, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":2,\"articleName\":\"test00012\",\"comment\":\"bad paper\",\"confidenceCode\":-2,\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 14:02:41', 137);
INSERT INTO `sys_oper_log` VALUES (315, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":2,\"articleName\":\"test00012\",\"comment\":\"bad paper\",\"confidenceCode\":-2,\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 14:09:16', 7122);
INSERT INTO `sys_oper_log` VALUES (316, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":2,\"articleId\":13,\"articleName\":\"test00012\",\"comment\":\"bad paper\",\"confidenceCode\":-2,\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 14:22:25', 7048);
INSERT INTO `sys_oper_log` VALUES (317, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"my paper is good!\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 14:26:48', 246);
INSERT INTO `sys_oper_log` VALUES (318, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":2,\"articleId\":13,\"articleName\":\"test00012\",\"comment\":\"bad paper\",\"confidenceCode\":-2,\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 14:27:49', 180);
INSERT INTO `sys_oper_log` VALUES (319, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":2,\"articleId\":13,\"articleName\":\"test00012\",\"comment\":\"bad paper\",\"confidenceCode\":-2,\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 14:35:09', 136);
INSERT INTO `sys_oper_log` VALUES (320, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'zhangliang', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":3,\"articleId\":13,\"articleName\":\"test00012\",\"comment\":\"good\",\"confidenceCode\":1,\"params\":{},\"pcId\":24,\"pcName\":\"zhangliang\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 14:59:17', 1495);
INSERT INTO `sys_oper_log` VALUES (321, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'xiaoming123', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":13,\"articleName\":\"test00012\",\"params\":{},\"rebuttalMessage\":\"my paper is good!\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 15:00:21', 462);
INSERT INTO `sys_oper_log` VALUES (322, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'admin', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":2,\"articleId\":13,\"articleName\":\"test00012\",\"comment\":\"bad paper\",\"confidenceCode\":1,\"params\":{},\"pcId\":1,\"pcName\":\"admin\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 15:01:04', 361);
INSERT INTO `sys_oper_log` VALUES (323, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'zhangliang', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":3,\"articleId\":13,\"articleName\":\"test00012\",\"comment\":\"good\",\"confidenceCode\":1,\"params\":{},\"pcId\":24,\"pcName\":\"zhangliang\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 15:01:38', 562);
INSERT INTO `sys_oper_log` VALUES (324, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"conferenceNickname\":\"lj\",\"conferenceStatusCode\":5,\"conferenceStatusName\":\"发布结果\",\"deadlineDate\":\"2023-11-23\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 15:33:29', 6007);
INSERT INTO `sys_oper_log` VALUES (325, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":14,\"conferenceName\":\"lajiqikan\",\"conferenceNickname\":\"lj\",\"conferenceStatusCode\":5,\"conferenceStatusName\":\"发布结果\",\"deadlineDate\":\"2023-11-23\",\"holdDate\":\"2023-11-17\",\"params\":{},\"place\":\"hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-24 15:34:34', 469);
INSERT INTO `sys_oper_log` VALUES (326, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":13,\"conferenceName\":\"aoeiuv\",\"conferenceNickname\":\"ele\",\"conferenceStatusCode\":3,\"conferenceStatusName\":\"投稿中\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"luzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 00:55:29', 468);
INSERT INTO `sys_oper_log` VALUES (327, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":13,\"conferenceName\":\"aoeiuv\",\"conferenceNickname\":\"ele\",\"conferenceStatusCode\":3,\"conferenceStatusName\":\"投稿中\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"luzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 00:55:29', 19569);
INSERT INTO `sys_oper_log` VALUES (328, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"inviteId\":22,\"inviteStatusCode\":-1,\"inviteStatusName\":\"已失效\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.CommunicationsException: Communications link failure\n\nThe last packet successfully received from the server was 10,059 milliseconds ago. The last packet sent successfully to the server was 10,203 milliseconds ago.\r\n### The error may exist in file [S:\\group14_new\\conferenceSubmission\\ruoyi-modules\\ruoyi-base\\target\\classes\\mapper\\base\\BaseInviteMapper.xml]\r\n### The error may involve com.ruoyi.base.mapper.BaseInviteMapper.updateBaseInvite-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update base_invite          SET invite_status_code = ?,             invite_status_name = ?          where invite_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.CommunicationsException: Communications link failure\n\nThe last packet successfully received from the server was 10,059 milliseconds ago. The last packet sent successfully to the server was 10,203 milliseconds ago.\n; Communications link failure\n\nThe last packet successfully received from the server was 10,059 milliseconds ago. The last packet sent successfully to the server was 10,203 milliseconds ago.; nested exception is com.mysql.cj.jdbc.exceptions.CommunicationsException: Communications link failure\n\nThe last packet successfully received from the server was 10,059 milliseconds ago. The last packet sent successfully to the server was 10,203 milliseconds ago.', '2023-11-27 12:35:40', 11993);
INSERT INTO `sys_oper_log` VALUES (329, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleId\":16,\"articleStatusCode\":2,\"articleStatusName\":\"待审稿\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 12:35:40', 20681);
INSERT INTO `sys_oper_log` VALUES (330, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleId\":15,\"articleStatusCode\":2,\"articleStatusName\":\"待审稿\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 12:35:40', 19688);
INSERT INTO `sys_oper_log` VALUES (331, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":13,\"conferenceName\":\"aoeiuv\",\"conferenceNickname\":\"ele\",\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"luzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 12:35:41', 24674);
INSERT INTO `sys_oper_log` VALUES (332, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":13,\"conferenceName\":\"aoeiuv\",\"conferenceNickname\":\"ele\",\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"luzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 12:43:02', 1431);
INSERT INTO `sys_oper_log` VALUES (333, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"inviteId\":22,\"inviteStatusCode\":-1,\"inviteStatusName\":\"已失效\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 12:43:02', 3261);
INSERT INTO `sys_oper_log` VALUES (334, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleId\":16,\"articleStatusCode\":2,\"articleStatusName\":\"待审稿\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 12:43:04', 2746);
INSERT INTO `sys_oper_log` VALUES (335, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleId\":15,\"articleStatusCode\":2,\"articleStatusName\":\"待审稿\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 12:43:04', 2746);
INSERT INTO `sys_oper_log` VALUES (336, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleId\":15,\"articleStatusCode\":2,\"articleStatusName\":\"待审稿\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 12:50:35', 4913);
INSERT INTO `sys_oper_log` VALUES (337, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleId\":16,\"articleStatusCode\":2,\"articleStatusName\":\"待审稿\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 12:50:35', 5342);
INSERT INTO `sys_oper_log` VALUES (338, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"inviteId\":22,\"inviteStatusCode\":-1,\"inviteStatusName\":\"已失效\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 12:50:40', 4224);
INSERT INTO `sys_oper_log` VALUES (339, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":13,\"conferenceName\":\"aoeiuv\",\"conferenceNickname\":\"ele\",\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"luzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 12:50:40', 4213);
INSERT INTO `sys_oper_log` VALUES (340, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleId\":15,\"articleStatusCode\":2,\"articleStatusName\":\"待审稿\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 13:37:35', 2037);
INSERT INTO `sys_oper_log` VALUES (341, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleId\":16,\"articleStatusCode\":2,\"articleStatusName\":\"待审稿\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 13:37:38', 2970);
INSERT INTO `sys_oper_log` VALUES (342, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":13,\"conferenceName\":\"aoeiuv\",\"conferenceNickname\":\"ele\",\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"luzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 13:39:40', 7972);
INSERT INTO `sys_oper_log` VALUES (343, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":1,\"chairName\":\"admin\",\"conferenceId\":13,\"conferenceName\":\"aoeiuv\",\"conferenceNickname\":\"ele\",\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2023-11-16\",\"params\":{},\"place\":\"luzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 14:42:24', 1698);
INSERT INTO `sys_oper_log` VALUES (344, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleId\":15,\"articleStatusCode\":2,\"articleStatusName\":\"待审稿\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 14:42:30', 7043);
INSERT INTO `sys_oper_log` VALUES (345, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'admin', NULL, '/article', '127.0.0.1', '', '{\"articleId\":16,\"articleStatusCode\":2,\"articleStatusName\":\"待审稿\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 14:42:32', 6857);
INSERT INTO `sys_oper_log` VALUES (346, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":13,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 16:43:35', 2663);
INSERT INTO `sys_oper_log` VALUES (347, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":13,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 20:47:38', 926);
INSERT INTO `sys_oper_log` VALUES (348, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":15,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 23:30:42', 832);
INSERT INTO `sys_oper_log` VALUES (349, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":13,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 23:49:14', 410);
INSERT INTO `sys_oper_log` VALUES (350, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":15,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 23:49:29', 32);
INSERT INTO `sys_oper_log` VALUES (351, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":15,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 23:53:26', 32);
INSERT INTO `sys_oper_log` VALUES (352, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":15,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-27 23:58:18', 159);
INSERT INTO `sys_oper_log` VALUES (353, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":15,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 00:16:03', 52);
INSERT INTO `sys_oper_log` VALUES (354, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":15,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 00:33:19', 399);
INSERT INTO `sys_oper_log` VALUES (355, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":15,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 00:33:19', 399);
INSERT INTO `sys_oper_log` VALUES (356, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":15,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 00:37:48', 10);
INSERT INTO `sys_oper_log` VALUES (357, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"conferenceNickname\":\"ICCATI\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待提交\",\"deadlineDate\":\"2023-11-28\",\"holdDate\":\"2023-12-26\",\"params\":{},\"place\":\"ShangHai\",\"resultDate\":\"2023-12-05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:18:56', 364);
INSERT INTO `sys_oper_log` VALUES (358, '会议主题', 1, 'com.ruoyi.base.controller.BaseConferTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":17,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"params\":{},\"status\":\"0\",\"topicCode\":9,\"topicLabel\":\"人工智能\",\"topicValue\":\"AI\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:29:22', 93);
INSERT INTO `sys_oper_log` VALUES (359, '会议主题', 1, 'com.ruoyi.base.controller.BaseConferTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":17,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"params\":{},\"status\":\"0\",\"topicCode\":10,\"topicLabel\":\"环境\",\"topicValue\":\"Env\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:29:46', 18);
INSERT INTO `sys_oper_log` VALUES (360, '会议主题', 1, 'com.ruoyi.base.controller.BaseConferTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":17,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"params\":{},\"status\":\"0\",\"topicCode\":11,\"topicLabel\":\"生物医学工程\",\"topicValue\":\"BME\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:30:26', 11);
INSERT INTO `sys_oper_log` VALUES (361, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":17,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"conferenceNickname\":\"ICCATI\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-11-28\",\"holdDate\":\"2023-12-26\",\"params\":{},\"place\":\"ShangHai\",\"resultDate\":\"2023-12-05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:30:38', 25);
INSERT INTO `sys_oper_log` VALUES (362, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"conferenceNickname\":\"ICCATI\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待提交\",\"deadlineDate\":\"2023-11-29\",\"holdDate\":\"2023-12-28\",\"params\":{},\"place\":\"Hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:41:39', 61);
INSERT INTO `sys_oper_log` VALUES (363, '会议管理', 1, 'com.ruoyi.base.controller.BaseConferenceController.add()', 'POST', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceName\":\"International Symposium on Integrative Research Across Disciplines\",\"conferenceNickname\":\"ISIRAD\",\"conferenceStatusCode\":0,\"conferenceStatusName\":\"待提交\",\"deadlineDate\":\"2023-11-30\",\"holdDate\":\"2024-11-20\",\"params\":{},\"place\":\"Suzhou\",\"resultDate\":\"2023-12-14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:42:19', 7);
INSERT INTO `sys_oper_log` VALUES (364, '会议主题', 1, 'com.ruoyi.base.controller.BaseConferTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":18,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"params\":{},\"status\":\"0\",\"topicCode\":12,\"topicLabel\":\"机器学习\",\"topicValue\":\"ml\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:42:47', 31);
INSERT INTO `sys_oper_log` VALUES (365, '会议主题', 1, 'com.ruoyi.base.controller.BaseConferTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":18,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"params\":{},\"status\":\"0\",\"topicCode\":13,\"topicLabel\":\"社会科学\",\"topicValue\":\"Soc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:43:03', 11);
INSERT INTO `sys_oper_log` VALUES (366, '会议主题', 1, 'com.ruoyi.base.controller.BaseConferTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":18,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"params\":{},\"status\":\"0\",\"topicCode\":14,\"topicLabel\":\"艺术\",\"topicValue\":\"Art\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:43:13', 8);
INSERT INTO `sys_oper_log` VALUES (367, '会议主题', 1, 'com.ruoyi.base.controller.BaseConferTopicController.add()', 'POST', 1, 'xiaoming123', NULL, '/topic', '127.0.0.1', '', '{\"conferenceId\":19,\"conferenceName\":\"International Symposium on Integrative Research Across Disciplines\",\"params\":{},\"status\":\"0\",\"topicCode\":15,\"topicLabel\":\"健康\",\"topicValue\":\"Hea\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:44:12', 6);
INSERT INTO `sys_oper_log` VALUES (368, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"conferenceNickname\":\"ICCATI\",\"conferenceStatusCode\":1,\"conferenceStatusName\":\"待审核\",\"deadlineDate\":\"2023-11-29\",\"holdDate\":\"2023-12-28\",\"params\":{},\"place\":\"Hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:44:19', 19);
INSERT INTO `sys_oper_log` VALUES (369, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":17,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"conferenceNickname\":\"ICCATI\",\"conferenceStatusCode\":2,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-11-28\",\"holdDate\":\"2023-12-26\",\"params\":{},\"place\":\"ShangHai\",\"resultDate\":\"2023-12-05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:45:00', 9);
INSERT INTO `sys_oper_log` VALUES (370, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":17,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"inviteId\":32,\"inviteStatusCode\":1,\"inviteStatusName\":\"已确认\",\"params\":{},\"pcAffiliation\":\"fudan\",\"pcEmail\":\"7666@fdu.cn\",\"pcId\":22,\"pcMemberIds\":[22],\"pcName\":\"xiaoming123\",\"pcPlace\":\"shanghai\",\"topicCode\":\"9,10,11\",\"topicCodeList\":[9,10,11],\"topicLabel\":\"人工智能,环境,生物医学工程\",\"topicValue\":\"AI,Env,BME\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:45:01', 364);
INSERT INTO `sys_oper_log` VALUES (371, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'admin', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"conferenceNickname\":\"ICCATI\",\"conferenceStatusCode\":2,\"conferenceStatusName\":\"已审核\",\"deadlineDate\":\"2023-11-29\",\"holdDate\":\"2023-12-28\",\"params\":{},\"place\":\"Hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:45:06', 6);
INSERT INTO `sys_oper_log` VALUES (372, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'admin', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"inviteId\":33,\"inviteStatusCode\":1,\"inviteStatusName\":\"已确认\",\"params\":{},\"pcAffiliation\":\"fudan\",\"pcEmail\":\"7666@fdu.cn\",\"pcId\":22,\"pcMemberIds\":[22],\"pcName\":\"xiaoming123\",\"pcPlace\":\"shanghai\",\"topicCode\":\"12,13,14\",\"topicCodeList\":[12,13,14],\"topicLabel\":\"机器学习,社会科学,艺术\",\"topicValue\":\"ml,Soc,Art\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:45:06', 83);
INSERT INTO `sys_oper_log` VALUES (373, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":17,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"conferenceNickname\":\"ICCATI\",\"conferenceStatusCode\":3,\"conferenceStatusName\":\"投稿中\",\"deadlineDate\":\"2023-11-28\",\"holdDate\":\"2023-12-26\",\"params\":{},\"place\":\"ShangHai\",\"resultDate\":\"2023-12-05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:46:22', 10);
INSERT INTO `sys_oper_log` VALUES (374, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"conferenceNickname\":\"ICCATI\",\"conferenceStatusCode\":3,\"conferenceStatusName\":\"投稿中\",\"deadlineDate\":\"2023-11-29\",\"holdDate\":\"2023-12-28\",\"params\":{},\"place\":\"Hangzhou\",\"resultDate\":\"2023-11-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:46:26', 6);
INSERT INTO `sys_oper_log` VALUES (375, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'xiaoming123', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"inviteId\":36,\"inviteStatusCode\":0,\"inviteStatusName\":\"待确认\",\"params\":{},\"pcAffiliation\":\"fudan\",\"pcEmail\":\"4567@fdu.cn\",\"pcId\":25,\"pcMemberIds\":[23,24,25],\"pcName\":\"xiaohua\",\"pcPlace\":\"shanghai\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:55:38', 714);
INSERT INTO `sys_oper_log` VALUES (376, '邀请审稿', 1, 'com.ruoyi.base.controller.BaseInviteController.add()', 'POST', 1, 'xiaoming123', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":17,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"inviteId\":39,\"inviteStatusCode\":0,\"inviteStatusName\":\"待确认\",\"params\":{},\"pcAffiliation\":\"fudan\",\"pcEmail\":\"4567@fdu.cn\",\"pcId\":25,\"pcMemberIds\":[23,24,25],\"pcName\":\"xiaohua\",\"pcPlace\":\"shanghai\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 02:56:39', 87);
INSERT INTO `sys_oper_log` VALUES (377, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'zhangsan', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"inviteId\":34,\"inviteStatusCode\":1,\"inviteStatusName\":\"待确认\",\"params\":{},\"pcAffiliation\":\"fdu\",\"pcEmail\":\"5676879@fdu.cn\",\"pcId\":23,\"pcName\":\"zhangsan\",\"pcPlace\":\"shanghai\",\"topicCode\":\"12,13,14\",\"topicCodeList\":[12,13,14],\"topicLabel\":\"机器学习,社会科学,艺术\",\"topicValue\":\"ml,Soc,Art\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 04:14:27', 55);
INSERT INTO `sys_oper_log` VALUES (378, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'zhangliang', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"inviteId\":35,\"inviteStatusCode\":1,\"inviteStatusName\":\"待确认\",\"params\":{},\"pcAffiliation\":\"fudan\",\"pcEmail\":\"s76@fdu.cn\",\"pcId\":24,\"pcName\":\"zhangliang\",\"pcPlace\":\"shanghai\",\"topicCode\":\"13\",\"topicCodeList\":[13],\"topicLabel\":\"社会科学\",\"topicValue\":\"Soc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 04:16:29', 18);
INSERT INTO `sys_oper_log` VALUES (379, '邀请审稿', 2, 'com.ruoyi.base.controller.BaseInviteController.edit()', 'PUT', 1, 'xiaohua', NULL, '/invite', '127.0.0.1', '', '{\"chairId\":22,\"chairName\":\"xiaoming123\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"inviteId\":36,\"inviteStatusCode\":1,\"inviteStatusName\":\"待确认\",\"params\":{},\"pcAffiliation\":\"fudan\",\"pcEmail\":\"4567@fdu.cn\",\"pcId\":25,\"pcName\":\"xiaohua\",\"pcPlace\":\"shanghai\",\"topicCode\":\"13,12\",\"topicCodeList\":[13,12],\"topicLabel\":\"社会科学,机器学习\",\"topicValue\":\"Soc,ml\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 04:16:58', 15);
INSERT INTO `sys_oper_log` VALUES (380, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a good paper\",\"articleName\":\"Good Paper\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"12,13\",\"topicCodeList\":[12,13],\"topicLabel\":\"机器学习,社会科学\",\"topicValue\":\"ml,Soc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 04:20:39', 1144);
INSERT INTO `sys_oper_log` VALUES (381, '作者信息', 1, 'com.ruoyi.contribute.controller.BaseAuthorController.add()', 'POST', 1, 'huahua', NULL, '/author', '127.0.0.1', '', '{\"articleId\":24,\"articleName\":\"Good Paper\",\"authorAffiliation\":\"fudan\",\"authorEmail\":\"11@123.com\",\"authorId\":5,\"authorName\":\"Lisi\",\"authorPlace\":\"shanghai\",\"orderNum\":0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 04:25:51', 491);
INSERT INTO `sys_oper_log` VALUES (382, '作者信息', 1, 'com.ruoyi.contribute.controller.BaseAuthorController.add()', 'POST', 1, 'huahua', NULL, '/author', '127.0.0.1', '', '{\"articleId\":24,\"articleName\":\"Good Paper\",\"authorAffiliation\":\"fudan\",\"authorEmail\":\"22@11.com\",\"authorId\":6,\"authorName\":\"wangwu\",\"authorPlace\":\"shanghai\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 04:27:10', 19);
INSERT INTO `sys_oper_log` VALUES (383, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a good paper\",\"articleId\":24,\"articleName\":\"Good Paper\",\"articleStatusCode\":1,\"articleStatusName\":\"已投稿\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"12,13\",\"topicLabel\":\"机器学习,社会科学\",\"topicValue\":\"ml,Soc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 04:27:24', 17);
INSERT INTO `sys_oper_log` VALUES (384, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a Bad Paper\",\"articleName\":\"Bad Paper\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"13,14\",\"topicCodeList\":[13,14],\"topicLabel\":\"社会科学,艺术\",\"topicValue\":\"Soc,Art\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 04:34:27', 282);
INSERT INTO `sys_oper_log` VALUES (385, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a paper about RestNet\",\"articleName\":\"RestNet\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"12,13,14\",\"topicCodeList\":[12,13,14],\"topicLabel\":\"机器学习,社会科学,艺术\",\"topicValue\":\"ml,Soc,Art\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 04:34:59', 64);
INSERT INTO `sys_oper_log` VALUES (386, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a paper about Machine Learning\",\"articleName\":\"Machine Learning\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"12\",\"topicCodeList\":[12],\"topicLabel\":\"机器学习\",\"topicValue\":\"ml\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 04:35:38', 30);
INSERT INTO `sys_oper_log` VALUES (387, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a paper about PC Management\",\"articleName\":\"PC Management\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"13\",\"topicCodeList\":[13],\"topicLabel\":\"社会科学\",\"topicValue\":\"Soc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 04:36:23', 26);
INSERT INTO `sys_oper_log` VALUES (388, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a normal paper\",\"articleName\":\"Normal Paper\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"12\",\"topicCodeList\":[12],\"topicLabel\":\"机器学习\",\"topicValue\":\"ml\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 12:59:08', 637);
INSERT INTO `sys_oper_log` VALUES (389, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a paper about software.\",\"articleName\":\"Software\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"13,14\",\"topicCodeList\":[13,14],\"topicLabel\":\"社会科学,艺术\",\"topicValue\":\"Soc,Art\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 13:00:27', 106);
INSERT INTO `sys_oper_log` VALUES (390, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a Bad Paper\",\"articleId\":25,\"articleName\":\"Bad Paper\",\"articleStatusCode\":1,\"articleStatusName\":\"已投稿\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"13,14\",\"topicLabel\":\"社会科学,艺术\",\"topicValue\":\"Soc,Art\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 13:04:11', 48);
INSERT INTO `sys_oper_log` VALUES (391, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a paper about RestNet\",\"articleId\":26,\"articleName\":\"RestNet\",\"articleStatusCode\":1,\"articleStatusName\":\"已投稿\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"12,13,14\",\"topicLabel\":\"机器学习,社会科学,艺术\",\"topicValue\":\"ml,Soc,Art\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 13:04:13', 10);
INSERT INTO `sys_oper_log` VALUES (392, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a paper about Machine Learning\",\"articleId\":27,\"articleName\":\"Machine Learning\",\"articleStatusCode\":1,\"articleStatusName\":\"已投稿\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"12\",\"topicLabel\":\"机器学习\",\"topicValue\":\"ml\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 13:04:15', 8);
INSERT INTO `sys_oper_log` VALUES (393, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a paper about PC Management\",\"articleId\":28,\"articleName\":\"PC Management\",\"articleStatusCode\":1,\"articleStatusName\":\"已投稿\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"13\",\"topicLabel\":\"社会科学\",\"topicValue\":\"Soc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 13:04:18', 8);
INSERT INTO `sys_oper_log` VALUES (394, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a normal paper\",\"articleId\":29,\"articleName\":\"Normal Paper\",\"articleStatusCode\":1,\"articleStatusName\":\"已投稿\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"12\",\"topicLabel\":\"机器学习\",\"topicValue\":\"ml\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 13:04:20', 9);
INSERT INTO `sys_oper_log` VALUES (395, '文章管理', 2, 'com.ruoyi.contribute.controller.BaseArticleController.edit()', 'PUT', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"This is a paper about software.\",\"articleId\":30,\"articleName\":\"Software\",\"articleStatusCode\":1,\"articleStatusName\":\"已投稿\",\"conferenceId\":18,\"conferenceName\":\"International Conference on Interconnected Research in Science and Technology\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"13,14\",\"topicLabel\":\"社会科学,艺术\",\"topicValue\":\"Soc,Art\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 13:04:22', 9);
INSERT INTO `sys_oper_log` VALUES (396, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":18,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 13:31:36', 323);
INSERT INTO `sys_oper_log` VALUES (397, '会议管理', 2, 'com.ruoyi.base.controller.BaseConferenceController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/conference', '127.0.0.1', '', '{\"conferenceId\":18,\"conferenceStatusCode\":4,\"conferenceStatusName\":\"审稿中\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 13:31:36', 14);
INSERT INTO `sys_oper_log` VALUES (398, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":158,\"articleId\":24,\"articleName\":\"Good Paper\",\"comment\":\"This is not a good paper.\",\"confidenceCode\":-2,\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 05:42:48', 429);
INSERT INTO `sys_oper_log` VALUES (399, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":161,\"articleId\":26,\"articleName\":\"RestNet\",\"comment\":\"This is a good paper\",\"confidenceCode\":2,\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 05:43:20', 47);
INSERT INTO `sys_oper_log` VALUES (400, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'zhangsan', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":159,\"articleId\":24,\"articleName\":\"Good Paper\",\"comment\":\"this is a bad paper\",\"confidenceCode\":-2,\"params\":{},\"pcId\":23,\"pcName\":\"zhangsan\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 05:44:11', 13);
INSERT INTO `sys_oper_log` VALUES (401, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'zhangsan', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":162,\"articleId\":26,\"articleName\":\"RestNet\",\"comment\":\"this is a good paper\",\"confidenceCode\":2,\"params\":{},\"pcId\":23,\"pcName\":\"zhangsan\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 05:44:25', 10);
INSERT INTO `sys_oper_log` VALUES (402, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaohua', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":160,\"articleId\":24,\"articleName\":\"Good Paper\",\"comment\":\"this is a good paper\",\"confidenceCode\":1,\"params\":{},\"pcId\":25,\"pcName\":\"xiaohua\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 05:45:23', 614);
INSERT INTO `sys_oper_log` VALUES (403, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaohua', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":163,\"articleId\":26,\"articleName\":\"RestNet\",\"comment\":\"this is a bad paper\",\"confidenceCode\":-1,\"params\":{},\"pcId\":25,\"pcName\":\"xiaohua\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 05:45:35', 27);
INSERT INTO `sys_oper_log` VALUES (404, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'huahua', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":24,\"articleName\":\"Good Paper\",\"params\":{},\"rebuttalMessage\":\"This is a good paper\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 05:53:36', 117);
INSERT INTO `sys_oper_log` VALUES (405, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'xiaoming123', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"xiaoming123\",\"default\":false,\"dictLabel\":\"rebuttal\",\"dictSort\":2,\"dictType\":\"review_status_code\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:00:23', 102);
INSERT INTO `sys_oper_log` VALUES (406, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":158,\"articleId\":24,\"articleName\":\"Good Paper\",\"comment\":\"This is not a good paper.\",\"confidenceCode\":2,\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:27:26', 1401);
INSERT INTO `sys_oper_log` VALUES (407, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":164,\"articleId\":27,\"articleName\":\"Machine Learning\",\"comment\":\"this is a good paper\",\"confidenceCode\":2,\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:27:48', 12);
INSERT INTO `sys_oper_log` VALUES (408, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'zhangsan', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":165,\"articleId\":27,\"articleName\":\"Machine Learning\",\"comment\":\"this is a good paper\",\"confidenceCode\":2,\"params\":{},\"pcId\":23,\"pcName\":\"zhangsan\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:28:31', 37);
INSERT INTO `sys_oper_log` VALUES (409, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'zhangsan', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":159,\"articleId\":24,\"articleName\":\"Good Paper\",\"comment\":\"this is a bad paper\",\"confidenceCode\":2,\"params\":{},\"pcId\":23,\"pcName\":\"zhangsan\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:28:38', 27);
INSERT INTO `sys_oper_log` VALUES (410, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaohua', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":166,\"articleId\":27,\"articleName\":\"Machine Learning\",\"comment\":\"this is a good paper\",\"confidenceCode\":2,\"params\":{},\"pcId\":25,\"pcName\":\"xiaohua\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:29:11', 72);
INSERT INTO `sys_oper_log` VALUES (411, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaohua', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":160,\"articleId\":24,\"articleName\":\"Good Paper\",\"comment\":\"this is a good paper\",\"confidenceCode\":1,\"params\":{},\"pcId\":25,\"pcName\":\"xiaohua\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:29:16', 22);
INSERT INTO `sys_oper_log` VALUES (412, 'rebuttal', 1, 'com.ruoyi.review.controller.BaseRebuttalController.add()', 'POST', 1, 'huahua', NULL, '/rebuttal', '127.0.0.1', '', '{\"articleId\":26,\"articleName\":\"RestNet\",\"params\":{},\"rebuttalMessage\":\"this is a good paper\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:30:36', 31);
INSERT INTO `sys_oper_log` VALUES (413, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaoming123', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":161,\"articleId\":26,\"articleName\":\"RestNet\",\"comment\":\"This is a good paper\",\"confidenceCode\":-2,\"params\":{},\"pcId\":22,\"pcName\":\"xiaoming123\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:32:38', 128);
INSERT INTO `sys_oper_log` VALUES (414, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'zhangsan', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":162,\"articleId\":26,\"articleName\":\"RestNet\",\"comment\":\"this is a good paper\",\"confidenceCode\":-2,\"params\":{},\"pcId\":23,\"pcName\":\"zhangsan\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:33:11', 42);
INSERT INTO `sys_oper_log` VALUES (415, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'zhangsan', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":168,\"articleId\":29,\"articleName\":\"Normal Paper\",\"comment\":\"1\",\"confidenceCode\":-2,\"params\":{},\"pcId\":23,\"pcName\":\"zhangsan\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:33:26', 14);
INSERT INTO `sys_oper_log` VALUES (416, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'zhangsan', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":171,\"articleId\":25,\"articleName\":\"Bad Paper\",\"comment\":\"1\",\"confidenceCode\":1,\"params\":{},\"pcId\":23,\"pcName\":\"zhangsan\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:33:33', 39);
INSERT INTO `sys_oper_log` VALUES (417, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'zhangsan', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":175,\"articleId\":28,\"articleName\":\"PC Management\",\"comment\":\"1\",\"confidenceCode\":2,\"params\":{},\"pcId\":23,\"pcName\":\"zhangsan\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:33:40', 22);
INSERT INTO `sys_oper_log` VALUES (418, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaohua', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":163,\"articleId\":26,\"articleName\":\"RestNet\",\"comment\":\"this is a bad paper\",\"confidenceCode\":-1,\"params\":{},\"pcId\":25,\"pcName\":\"xiaohua\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":-1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:34:09', 68);
INSERT INTO `sys_oper_log` VALUES (419, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaohua', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":169,\"articleId\":29,\"articleName\":\"Normal Paper\",\"comment\":\"1\",\"confidenceCode\":2,\"params\":{},\"pcId\":25,\"pcName\":\"xiaohua\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:34:17', 16);
INSERT INTO `sys_oper_log` VALUES (420, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaohua', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":173,\"articleId\":28,\"articleName\":\"PC Management\",\"comment\":\"1\",\"confidenceCode\":2,\"params\":{},\"pcId\":25,\"pcName\":\"xiaohua\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:34:23', 12);
INSERT INTO `sys_oper_log` VALUES (421, '稿件分配', 2, 'com.ruoyi.review.controller.BaseAllocationController.edit()', 'PUT', 1, 'xiaohua', NULL, '/allocation', '127.0.0.1', '', '{\"allocationId\":177,\"articleId\":30,\"articleName\":\"Software\",\"comment\":\"1\",\"confidenceCode\":2,\"params\":{},\"pcId\":25,\"pcName\":\"xiaohua\",\"reviewStatusCode\":1,\"reviewStatusName\":\"已审稿\",\"scoreCode\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 06:34:28', 29);
INSERT INTO `sys_oper_log` VALUES (422, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"real normal paper\",\"articleName\":\"real normal paper\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":17,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"9,10\",\"topicCodeList\":[9,10],\"topicLabel\":\"人工智能,环境\",\"topicValue\":\"AI,Env\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 12:20:54', 14243);
INSERT INTO `sys_oper_log` VALUES (423, '文章管理', 1, 'com.ruoyi.contribute.controller.BaseArticleController.add()', 'POST', 1, 'huahua', NULL, '/article', '127.0.0.1', '', '{\"articleAbstract\":\"real normal paper\",\"articleName\":\"real normal paper\",\"articleStatusCode\":0,\"articleStatusName\":\"待提交\",\"conferenceId\":17,\"conferenceName\":\"International Conference on Cross-Disciplinary Advances in Technology and Innovation\",\"creatorId\":26,\"creatorName\":\"huahua\",\"params\":{},\"topicCode\":\"9,10\",\"topicCodeList\":[9,10],\"topicLabel\":\"人工智能,环境\",\"topicValue\":\"AI,Env\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 12:20:54', 5227);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-11-05 01:52:18', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-11-05 01:52:18', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-11-05 01:52:18', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-11-05 01:52:18', 'admin', '2023-11-23 14:45:10', '普通角色');
INSERT INTO `sys_role` VALUES (3, '会议主席', 'chair', 3, '1', 1, 1, '0', '2', 'admin', '2023-11-05 05:21:53', 'admin', '2023-11-05 05:22:07', NULL);
INSERT INTO `sys_role` VALUES (4, '审稿人', 'PCmember', 3, '1', 1, 1, '0', '2', 'admin', '2023-11-05 05:23:01', 'admin', '2023-11-05 06:59:01', NULL);
INSERT INTO `sys_role` VALUES (5, '作者', 'author', 3, '1', 1, 1, '0', '2', 'admin', '2023-11-05 06:58:55', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 102);
INSERT INTO `sys_role_dept` VALUES (2, 103);
INSERT INTO `sys_role_dept` VALUES (2, 104);
INSERT INTO `sys_role_dept` VALUES (2, 105);
INSERT INTO `sys_role_dept` VALUES (2, 106);
INSERT INTO `sys_role_dept` VALUES (2, 107);
INSERT INTO `sys_role_dept` VALUES (2, 108);
INSERT INTO `sys_role_dept` VALUES (2, 109);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (2, 1063);
INSERT INTO `sys_role_menu` VALUES (2, 1064);
INSERT INTO `sys_role_menu` VALUES (2, 1065);
INSERT INTO `sys_role_menu` VALUES (2, 1066);
INSERT INTO `sys_role_menu` VALUES (2, 1067);
INSERT INTO `sys_role_menu` VALUES (2, 1068);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `affiliation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', NULL, NULL, '0', '127.0.0.1', '2023-11-05 01:52:18', 'admin', '2023-11-05 01:52:18', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', NULL, NULL, '1', '127.0.0.1', '2023-11-05 01:52:18', 'admin', '2023-11-05 01:52:18', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, NULL, 'boge', 'boge', '00', '', '', '0', '', '$2a$10$qOUlRl6HcTi31NiEzx3i3eSzjlI5b6AWSoIZc/fTCTOZ6jQ5DAdza', '0', NULL, NULL, '1', '', NULL, '', '2023-11-05 07:41:40', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (4, NULL, '11', '11', '00', '', '', '0', '', '$2a$10$BRbLFbp1QwqGSe1IwgrUfuFAwlRMMc1Bg8ueLFb3kwzsSPHJ6GWxy', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 01:31:14', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (5, NULL, '12345', '12345', '00', '', '', '0', '', '$2a$10$QtZtIahdWShs9zbFgmNcj.J2jZjDvSa8PQOCE4JOPrBcrES3/2laS', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 01:45:01', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (6, NULL, '123456', '123456', '00', '', '', '0', '', '$2a$10$22awWaw0G00MLQhdo1CnX.vCxRfUWu7URYLaD6sZJU8.XCJ39ODne', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 01:47:56', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (7, NULL, '111111', '111111', '00', '', '', '0', '', '$2a$10$BFXLMTRkr1d7O./oJ9ATqejPfMdFSg6sTeVceU868t8BNCAw4F/ci', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 01:48:28', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (8, NULL, '1234567', '1234567', '00', '', '', '0', '', '$2a$10$y48IuJrR8evMJIVv064SBOdWDXBZYmonpbVweNn1XQsrzCpcgO9HC', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 02:06:20', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (9, NULL, '11111111', '11111111', '00', '', '', '0', '', '$2a$10$ajNmdE2Y84zYoEU.LR3ws.6q1ZZ/rHytBhNEtwftHXrLPttLRp72.', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 03:30:51', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (10, NULL, '123456789', '123456789', '00', '', '', '0', '', '$2a$10$ROhDb/BRqf5AnWiAga8bNuZr6VlvvoJWzk3goLELFniOB1zqVztje', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 07:43:54', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (11, NULL, '12312', '12312', '00', '', '', '0', '', '$2a$10$irl4TjNirc3iNRuO6aJBN.idMjPNDzKm6LKcWK0Dusiw3apEYuAhG', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 07:51:28', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (12, NULL, '55555', '55555', '00', '', '', '0', '', '$2a$10$OYguuodqtArXwOWEBc2JD.uc.kcH54tg.g8fX/bkKaTA7eYXrYxs.', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 07:54:04', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (13, NULL, '33333', '33333', '00', '', '', '0', '', '$2a$10$LFxdS8fapWf/DyQckpn1reAW10T.Kohg/qiRrsGUl6EJGAGXes28y', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 07:54:56', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (14, NULL, '1111111111111', '1111111111111', '00', '', '', '0', '', '$2a$10$AQa7uXRI4a2GFAozVLYWZOjg83vO7C0N7yIZ.0Vj2AG6CyrA92zRS', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 08:08:47', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (15, NULL, '123123123', '123123123', '00', '', '', '0', '', '$2a$10$IGrWqDrl9glieJSp1mUjR.EfSs2wez8v0YXfr9u9BgU/nenMEFSp6', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 08:34:46', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (16, NULL, '00000000', '00000000', '00', '', '', '0', '', '$2a$10$aMwB8hdHceYnyNmxAqvJw.FBeB.sAA1.awh77a4hDaWdQuj5kBtkq', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 08:42:23', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (17, NULL, '88888', '88888', '00', '11@11.com', '', '0', '', '$2a$10$YkTCbBBKKr54lFjjxt.3nu5Ot446PjzDRUrGnvmRg2pj0gQ1zm9Ke', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 10:38:01', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (18, NULL, '99999', '99999', '00', '22@11.com', '', '0', '', '$2a$10$p3OHDSfALMgSUnoTpH7oxOj5KUk3hfiFv.VORQ8mdn6PK6/2hRSOW', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 10:47:02', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (19, NULL, '0000000000', '0000000000', '00', '00@00.com', '', '0', '', '$2a$10$olfRyvUH1V5WZIZJ3AzqJ.YAOtm.O0zpra2O5MGZ.7VX4VZhke6bq', '0', NULL, NULL, '1', '', NULL, '', '2023-11-06 12:16:44', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (20, NULL, '77777', '77777', '00', '', '', '0', '', '$2a$10$Ut.wAcfVCGLRds/NPFmobeyd.TS7krdLwtO4Xw1K0/OQ8E6ux91ZG', '0', '1111', '1111', '1', '', NULL, '', '2023-11-06 12:27:20', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (21, NULL, 'test1', 'test1', '00', '', '', '0', '', '$2a$10$cS/GcC6YnKgBP1R0E84gD.MHXl4ORCaJDquRYquvKhNaEne5LLgZG', '0', NULL, NULL, '1', '', NULL, '', '2023-11-07 06:02:22', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (22, NULL, 'xiaoming123', 'xiaoming123', '00', '7666@fdu.cn', '', '0', '', '$2a$10$WRChhNz.wTRuNUJcR1QKjeas7LsZ3yoSYCatGKCJxUlKQdMnyj2Vu', '0', 'fudan', 'shanghai', '0', '', NULL, '', '2023-11-10 06:49:51', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (23, NULL, 'zhangsan', 'zhangsan', '00', '5676879@fdu.cn', '', '0', '', '$2a$10$6nka1b3oIpetHshQPVUxKud8mCycjDAS0iPtQh5UhvnvqJeMWUgme', '0', 'fdu', 'shanghai', '0', '', NULL, '', '2023-11-10 07:01:15', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (24, NULL, 'zhangliang', 'zhangliang', '00', 's76@fdu.cn', '', '0', '', '$2a$10$RSQDLyzrxi9rThsJ1LzrIOgMM10yNxX3axOAlpzlAQCz3h1dehgPG', '0', 'fudan', 'shanghai', '0', '', NULL, '', '2023-11-10 08:36:46', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (25, NULL, 'xiaohua', 'xiaohua', '00', '4567@fdu.cn', '', '0', '', '$2a$10$nIs41QeK2OvJl2SHyW8XOODvlMkc83BgL6bQQRSUV2MGRlxfqa5Ju', '0', 'fudan', 'shanghai', '0', '', NULL, '', '2023-11-10 08:42:31', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (26, NULL, 'huahua', 'huahua', '00', '11@123.com', '', '0', '', '$2a$10$ByKSYWkjwn.KLGMO4usqAeUPSvJ6.j5nwnMlNJinMrfMFtmcDqN9a', '0', 'Fudan', 'Shanghai', '0', '', NULL, '', '2023-11-28 02:45:47', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (4, 2);
INSERT INTO `sys_user_role` VALUES (5, 2);
INSERT INTO `sys_user_role` VALUES (6, 2);
INSERT INTO `sys_user_role` VALUES (7, 2);
INSERT INTO `sys_user_role` VALUES (8, 2);
INSERT INTO `sys_user_role` VALUES (9, 2);
INSERT INTO `sys_user_role` VALUES (10, 2);
INSERT INTO `sys_user_role` VALUES (11, 2);
INSERT INTO `sys_user_role` VALUES (21, 2);
INSERT INTO `sys_user_role` VALUES (22, 2);
INSERT INTO `sys_user_role` VALUES (23, 2);
INSERT INTO `sys_user_role` VALUES (24, 2);
INSERT INTO `sys_user_role` VALUES (25, 2);
INSERT INTO `sys_user_role` VALUES (26, 2);

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
