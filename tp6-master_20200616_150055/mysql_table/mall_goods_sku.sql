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

 Date: 22/02/2020 11:58:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mall_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_sku`;
CREATE TABLE `mall_goods_sku` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品Id',
  `specs_value_ids` varchar(255) NOT NULL COMMENT '每行规则属性ID 按逗号连接',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '现价',
  `cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `stock` int unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int unsigned NOT NULL DEFAULT '0',
  `update_time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
