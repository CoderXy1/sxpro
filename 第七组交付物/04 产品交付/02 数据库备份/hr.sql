/*
 Navicat Premium Data Transfer

 Source Server         : Linux服务器
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 47.103.60.221:3306
 Source Schema         : hr

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 31/05/2019 16:27:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_dept
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept`  (
  `did` int(255) NOT NULL COMMENT '部门表',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_dept
-- ----------------------------
INSERT INTO `tb_dept` VALUES (1, '技术部', '技术部');
INSERT INTO `tb_dept` VALUES (2, '运营部', '运营部');
INSERT INTO `tb_dept` VALUES (3, '财务部', '财务部');

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice`  (
  `nid` int(255) NOT NULL COMMENT '公告表',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `tb_notice_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES (1, '放假', '放假一天', '2019/5/27 17:29:12', 'xy');
INSERT INTO `tb_notice` VALUES (2, '开会', '下午17:00开会', '2019/5/27 17:29:35', 'xy');
INSERT INTO `tb_notice` VALUES (3, '表扬', '因工作认真表扬XXX', '2019/5/27 17:29:54', 'xy');

-- ----------------------------
-- Table structure for tb_post
-- ----------------------------
DROP TABLE IF EXISTS `tb_post`;
CREATE TABLE `tb_post`  (
  `pid` int(255) NOT NULL COMMENT '职位表',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_post
-- ----------------------------
INSERT INTO `tb_post` VALUES (1, '总经理', '总经理');
INSERT INTO `tb_post` VALUES (3, '前端工程师', '负责前端界面');
INSERT INTO `tb_post` VALUES (4, '项目经理', '负责管理项目进度');
INSERT INTO `tb_post` VALUES (5, 'java工程师', 'java');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户表',
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `power` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('123', '123', '123', '1', '2019/5/27', '普通用户');
INSERT INTO `tb_user` VALUES ('admin', 'admin', 'admin', '1', '2019/5/27', '管理员');
INSERT INTO `tb_user` VALUES ('xy', '管理员1', 'xy', '1', '2019/5/27', '普通用户');

-- ----------------------------
-- Table structure for tb_workers
-- ----------------------------
DROP TABLE IF EXISTS `tb_workers`;
CREATE TABLE `tb_workers`  (
  `wId` int(255) NOT NULL COMMENT '员工表',
  `wName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(255) NULL DEFAULT NULL,
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `idNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interests` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '兴趣',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `political` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `postcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `family` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名族',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `did` int(255) NULL DEFAULT NULL,
  `creatTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`wId`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `did`(`did`) USING BTREE,
  CONSTRAINT `tb_workers_ibfk_2` FOREIGN KEY (`did`) REFERENCES `tb_dept` (`did`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_workers_ibfk_3` FOREIGN KEY (`pid`) REFERENCES `tb_post` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_workers
-- ----------------------------
INSERT INTO `tb_workers` VALUES (1, '小明', '男', '312', '123@qq.com', 1, '本科', '123', '重庆', '1998.1.1', '读书', '2354', '群众', '40000', '汉族', '计算机', '无', 1, '2019/05/26 23:05:28');
INSERT INTO `tb_workers` VALUES (2, '小红', '男', '456', 'dsa', 1, '本科', '1234', '重庆', '1998.1.8', '跑步', '123', '团员', '400000', '汉族', '计算机', '没有', 3, '2019/05/27 16:05:33');
INSERT INTO `tb_workers` VALUES (3, '小强', '男', '456', '112@qq.com', 1, '专科', '3431', '北京', '03/04/1998', '羽毛球', '145', '群众', '400000', '苗族', '工商管理', '无', 2, '2019/05/27 16:05:07');

SET FOREIGN_KEY_CHECKS = 1;
