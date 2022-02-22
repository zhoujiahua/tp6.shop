/*
 Navicat MySQL Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 02/06/2020 19:43:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mall_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ltype` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '登录方式 默认0 手机号码登录 1用户名密码登录',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会话保存天数',
  `sex` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `operate_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `usernme` (`username`),
  KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
