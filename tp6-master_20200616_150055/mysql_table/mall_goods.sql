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

 Date: 22/02/2020 11:58:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标题',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品分类',
  `category_path_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目ID path',
  `promotion_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品促销语',
  `goods_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品单位',
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `sub_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '副标题',
  `stock` int unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '现价',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `sku_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品默认的sku_id',
  `is_show_stock` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否显示库存',
  `production_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '生产日期',
  `goods_specs_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '商品规则 1统一，2多规格',
  `big_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '大图',
  `recommend_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品推荐图',
  `carousel_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情页轮播图',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
  `is_index_recommend` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否首页推荐大图商品',
  `goods_specs_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所有规则属性存放json',
  `create_time` int unsigned NOT NULL DEFAULT '0',
  `update_time` int unsigned NOT NULL DEFAULT '0',
  `operate_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `listorder` int unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `category_path_id` (`category_path_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
