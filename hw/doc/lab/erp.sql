/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : seec_erp

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 25/03/2022 11:48:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for warehouse_input_sheet
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_input_sheet`;
CREATE TABLE `warehouse_input_sheet`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'RKD + 日期 + index = 入库单编号',
  `batch_id` int(11) NOT NULL COMMENT '批次',
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作员',
  `update_time` datetime(0) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_input_sheet
-- ----------------------------
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220316-00000', 0, 'lxs', '2022-03-16 22:23:33');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220316-00001', 1, 'yzh', '2022-03-16 22:31:44');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220316-00002', 2, 'zxr', '2022-03-16 22:35:13');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220317-00000', 3, 'zr', '2022-03-17 03:06:09');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220317-00004', 4, 'abc', '2022-03-17 03:30:13');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220321-00000', 5, 'Leonezhurui', '2022-03-21 17:12:03');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220321-00006', 6, 'Leonezhurui', '2022-03-21 17:33:31');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220321-00007', 7, 'Leonezhurui', '2022-03-21 17:43:50');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220321-00008', 8, 'Leonezhurui', '2022-03-21 17:44:29');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220321-00009', 9, 'Leonezhurui', '2022-03-21 18:08:21');

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : seec_erp

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 25/03/2022 11:48:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户身份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'seecoder', '123456', 'INVENTORY_MANAGER');
INSERT INTO `user` VALUES (2, 'uncln', '123456', 'INVENTORY_MANAGER');

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : seec_erp

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 25/03/2022 11:45:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类id(11位) + 位置(5位) = 编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名字',
  `category_id` int(11) NOT NULL COMMENT '商品分类id',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品型号',
  `quantity` int(11) NOT NULL COMMENT '商品数量',
  `purchase_price` decimal(10, 2) NOT NULL COMMENT '进价',
  `retail_price` decimal(10, 2) NOT NULL COMMENT '零售价',
  `recent_pp` decimal(10, 2) NULL DEFAULT NULL COMMENT '最近进价',
  `rencet_rp` decimal(10, 2) NULL DEFAULT NULL COMMENT '最近零售价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('0000000000400000', '戴尔电脑', 4, '戴尔(DELL)Vostro笔记本电脑5410 123色 戴尔成就3500Vostro1625D', 1000, 3000.00, 4056.00, 3233.00, NULL);
INSERT INTO `product` VALUES ('0000000000400001', '小米手机', 4, 'lalalalala', 1234, 2000.00, 3500.00, 1111.00, NULL);
INSERT INTO `product` VALUES ('0000000000500000', 'iphone', 5, 'iphone14maxpro', 1650, 6000.00, 10000.00, 6750.00, NULL);
INSERT INTO `product` VALUES ('0000000000500001', 'iphone', 5, 'iphone14普通版', 1600, 4000.00, 8000.00, 3900.00, NULL);
INSERT INTO `product` VALUES ('0000000000500002', '坚果', 5, 'pro3', 2900, 2499.00, 3199.00, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : seec_erp

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 25/03/2022 11:48:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for warehouse_input_sheet_content
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_input_sheet_content`;
CREATE TABLE `warehouse_input_sheet_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wi_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '入库单编号',
  `pid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品id',
  `quantity` int(11) NOT NULL COMMENT '商品数量',
  `purchase_price` decimal(10, 2) NOT NULL COMMENT '单价',
  `production_date` datetime(0) NOT NULL COMMENT '出厂日期',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_input_sheet_content
-- ----------------------------
INSERT INTO `warehouse_input_sheet_content` VALUES (9, 'RKD-20220316-00000', '0000000000500000', 250, 6000.00, '2022-03-16 22:23:33', '!!!!!');
INSERT INTO `warehouse_input_sheet_content` VALUES (10, 'RKD-20220316-00000', '0000000000500001', 300, 3900.00, '2022-03-16 22:23:33', '?????');
INSERT INTO `warehouse_input_sheet_content` VALUES (13, 'RKD-20220316-00001', '0000000000400000', 100, 3000.00, '2022-03-16 22:31:44', 'hahahah');
INSERT INTO `warehouse_input_sheet_content` VALUES (14, 'RKD-20220316-00001', '0000000000500000', 500, 6000.00, '2022-03-16 22:31:44', NULL);
INSERT INTO `warehouse_input_sheet_content` VALUES (15, 'RKD-20220316-00001', '0000000000500002', 3000, 2499.00, '2022-03-16 22:31:44', '妙啊');
INSERT INTO `warehouse_input_sheet_content` VALUES (16, 'RKD-20220316-00002', '0000000000400000', 1000, 3125.00, '2022-03-16 22:35:13', 'oooooooo');
INSERT INTO `warehouse_input_sheet_content` VALUES (17, 'RKD-20220316-00002', '0000000000500000', 1500, 6000.00, '2022-03-16 22:35:13', 'pppppppp');
INSERT INTO `warehouse_input_sheet_content` VALUES (18, 'RKD-20220316-00002', '0000000000500001', 2000, 4000.00, '2022-03-16 22:35:13', 'qqqqqqq');
INSERT INTO `warehouse_input_sheet_content` VALUES (19, 'RKD-20220317-00000', '0000000000400000', 2000, 3000.00, '2022-03-17 03:06:09', 'oaaa');
INSERT INTO `warehouse_input_sheet_content` VALUES (20, 'RKD-20220317-00000', '0000000000500000', 1000, 6000.00, '2022-03-17 03:06:09', 'paaa');
INSERT INTO `warehouse_input_sheet_content` VALUES (21, 'RKD-20220317-00000', '0000000000500001', 2000, 4000.00, '2022-03-17 03:06:09', 'qaaa');
INSERT INTO `warehouse_input_sheet_content` VALUES (22, 'RKD-20220317-00004', '0000000000500000', 1200, 6750.00, '2022-03-17 08:00:00', '牛啊牛啊');
INSERT INTO `warehouse_input_sheet_content` VALUES (23, 'RKD-20220317-00004', '0000000000400000', 1200, 3250.00, '2022-03-15 08:00:00', 'heiheiheihei');
INSERT INTO `warehouse_input_sheet_content` VALUES (24, 'RKD-20220321-00000', '0000000000400000', 1234, 3100.00, '2022-03-21 17:12:02', 'qweqweqwe');
INSERT INTO `warehouse_input_sheet_content` VALUES (25, 'RKD-20220321-00006', '0000000000400000', 1000, 4235.00, '2022-03-21 17:33:31', 'hhhhh');
INSERT INTO `warehouse_input_sheet_content` VALUES (26, 'RKD-20220321-00007', '0000000000400000', 1234, 4321.00, '2022-03-21 17:43:50', 'asdasd');
INSERT INTO `warehouse_input_sheet_content` VALUES (27, 'RKD-20220321-00008', '0000000000400000', 2222, 3233.00, '2022-03-21 17:44:28', 'aasdadas');
INSERT INTO `warehouse_input_sheet_content` VALUES (28, 'RKD-20220321-00009', '0000000000400001', 1234, 1111.00, '2022-03-21 18:08:20', '132321');

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : seec_erp

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 25/03/2022 11:48:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存id',
  `pid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品编号',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `purchase_price` decimal(10, 2) NOT NULL COMMENT '进价',
  `batch_id` int(11) NOT NULL COMMENT '批次',
  `production_date` datetime(0) NOT NULL COMMENT '出厂日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES (1, '0000000000500000', 0, 6000.00, 0, '2022-03-16 22:23:33');
INSERT INTO `warehouse` VALUES (2, '0000000000500001', 0, 3900.00, 0, '2022-03-16 22:23:33');
INSERT INTO `warehouse` VALUES (3, '0000000000400000', 0, 3000.00, 1, '2022-03-16 22:31:44');
INSERT INTO `warehouse` VALUES (4, '0000000000500000', 0, 6000.00, 1, '2022-03-16 22:31:44');
INSERT INTO `warehouse` VALUES (5, '0000000000500002', 2900, 2499.00, 1, '2022-03-16 22:31:44');
INSERT INTO `warehouse` VALUES (6, '0000000000400000', 0, 3125.00, 2, '2022-03-16 22:35:13');
INSERT INTO `warehouse` VALUES (7, '0000000000500000', 0, 6000.00, 2, '2022-03-16 22:35:13');
INSERT INTO `warehouse` VALUES (8, '0000000000500001', 0, 4000.00, 2, '2022-03-16 22:35:13');
INSERT INTO `warehouse` VALUES (9, '0000000000400000', 0, 3000.00, 3, '2022-03-17 03:06:09');
INSERT INTO `warehouse` VALUES (10, '0000000000500000', 450, 6000.00, 3, '2022-03-17 03:06:09');
INSERT INTO `warehouse` VALUES (11, '0000000000500001', 1600, 4000.00, 3, '2022-03-17 03:06:09');
INSERT INTO `warehouse` VALUES (12, '0000000000500000', 1200, 6750.00, 4, '2022-03-17 08:00:00');
INSERT INTO `warehouse` VALUES (13, '0000000000400000', 0, 3250.00, 4, '2022-03-15 08:00:00');
INSERT INTO `warehouse` VALUES (14, '0000000000400000', 0, 3100.00, 5, '2022-03-21 17:12:02');
INSERT INTO `warehouse` VALUES (15, '0000000000400000', 0, 4235.00, 6, '2022-03-21 17:33:31');
INSERT INTO `warehouse` VALUES (16, '0000000000400000', 0, 4321.00, 7, '2022-03-21 17:43:50');
INSERT INTO `warehouse` VALUES (17, '0000000000400000', 1000, 3233.00, 8, '2022-03-21 17:44:28');
INSERT INTO `warehouse` VALUES (18, '0000000000400001', 1234, 1111.00, 9, '2022-03-21 18:08:20');

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : seec_erp

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 25/03/2022 11:48:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for warehouse_output_sheet_content
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_output_sheet_content`;
CREATE TABLE `warehouse_output_sheet_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '出库商品列表id',
  `pid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品id',
  `wo_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出库单单据编号',
  `batch_id` int(11) NOT NULL COMMENT '批次',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `purchase_price` decimal(10, 2) NOT NULL COMMENT '对应批次的单价',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_output_sheet_content
-- ----------------------------
INSERT INTO `warehouse_output_sheet_content` VALUES (1, '0000000000500000', 'CKD-20220317-00000', 0, 250, 6000.00, 'lallalala');
INSERT INTO `warehouse_output_sheet_content` VALUES (2, '0000000000500000', 'CKD-20220317-00000', 1, 500, 6000.00, 'lallalala');
INSERT INTO `warehouse_output_sheet_content` VALUES (3, '0000000000500000', 'CKD-20220317-00000', 2, 50, 6000.00, 'lallalala');
INSERT INTO `warehouse_output_sheet_content` VALUES (4, '0000000000500001', 'CKD-20220317-00000', 0, 300, 3900.00, 'lulalulalu');
INSERT INTO `warehouse_output_sheet_content` VALUES (5, '0000000000500001', 'CKD-20220317-00000', 2, 1400, 4000.00, 'lulalulalu');
INSERT INTO `warehouse_output_sheet_content` VALUES (6, '0000000000500002', 'CKD-20220317-00000', 1, 100, 2499.00, 'lulalulalei');
INSERT INTO `warehouse_output_sheet_content` VALUES (7, '0000000000400000', 'CKD-20220317-00000', 1, 100, 3000.00, 'lulalulalei');
INSERT INTO `warehouse_output_sheet_content` VALUES (8, '0000000000400000', 'CKD-20220317-00000', 2, 1000, 3125.00, 'lulalulalei');
INSERT INTO `warehouse_output_sheet_content` VALUES (9, '0000000000500000', 'CKD-20220320-00000', 2, 1450, 6000.00, 'hahahahaha');
INSERT INTO `warehouse_output_sheet_content` VALUES (10, '0000000000500000', 'CKD-20220320-00000', 3, 550, 6000.00, 'hahahahaha');
INSERT INTO `warehouse_output_sheet_content` VALUES (11, '0000000000500001', 'CKD-20220320-00000', 2, 600, 4000.00, '121212121');
INSERT INTO `warehouse_output_sheet_content` VALUES (12, '0000000000500001', 'CKD-20220320-00000', 3, 400, 4000.00, '121212121');
INSERT INTO `warehouse_output_sheet_content` VALUES (13, '0000000000400000', 'CKD-20220321-00000', 3, 2000, 3000.00, '00000');
INSERT INTO `warehouse_output_sheet_content` VALUES (14, '0000000000400000', 'CKD-20220321-00000', 4, 1000, 3250.00, '00000');
INSERT INTO `warehouse_output_sheet_content` VALUES (15, '0000000000400000', 'CKD-20220321-00001', 4, 200, 3250.00, '???');
INSERT INTO `warehouse_output_sheet_content` VALUES (16, '0000000000400000', 'CKD-20220321-00001', 5, 1234, 3100.00, '???');
INSERT INTO `warehouse_output_sheet_content` VALUES (17, '0000000000400000', 'CKD-20220321-00001', 6, 1000, 4235.00, '???');
INSERT INTO `warehouse_output_sheet_content` VALUES (18, '0000000000400000', 'CKD-20220321-00002', 7, 1234, 4321.00, 'asdadasd');
INSERT INTO `warehouse_output_sheet_content` VALUES (19, '0000000000400000', 'CKD-20220321-00002', 8, 766, 3233.00, 'asdadasd');
INSERT INTO `warehouse_output_sheet_content` VALUES (20, '0000000000400000', 'CKD-20220321-00003', 8, 456, 3233.00, 'aaaaa');

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : seec_erp

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 25/03/2022 11:48:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for warehouse_output_sheet
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_output_sheet`;
CREATE TABLE `warehouse_output_sheet`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'CKD + date + index = 出库单id',
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作员名字',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_output_sheet
-- ----------------------------
INSERT INTO `warehouse_output_sheet` VALUES ('CKD-20220317-00000', 'zyy', '2022-03-17 02:47:45');
INSERT INTO `warehouse_output_sheet` VALUES ('CKD-20220320-00000', 'zzz', '2022-03-20 13:17:10');
INSERT INTO `warehouse_output_sheet` VALUES ('CKD-20220321-00000', 'Leonezhurui', '2022-03-21 17:15:58');
INSERT INTO `warehouse_output_sheet` VALUES ('CKD-20220321-00001', 'Leonezhurui', '2022-03-21 17:35:29');
INSERT INTO `warehouse_output_sheet` VALUES ('CKD-20220321-00002', 'Leonezhurui', '2022-03-21 17:45:07');
INSERT INTO `warehouse_output_sheet` VALUES ('CKD-20220321-00003', 'Leonezhurui', '2022-03-21 18:05:26');

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : seec_erp

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 25/03/2022 11:58:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名字',
  `parent_id` int(11) NOT NULL COMMENT '父节点id',
  `is_leaf` tinyint(4) NOT NULL COMMENT '是否为叶节点',
  `item_count` int(11) NOT NULL COMMENT '商品个数',
  `item_index` int(11) NOT NULL COMMENT '插入的下一个index',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '商品', 0, 0, 0, 0);
INSERT INTO `category` VALUES (2, '电子产品', 1, 0, 0, 0);
INSERT INTO `category` VALUES (3, '生活用品', 1, 1, 0, 0);
INSERT INTO `category` VALUES (4, '电脑', 2, 1, 2, 2);
INSERT INTO `category` VALUES (5, '手机', 2, 1, 3, 3);

SET FOREIGN_KEY_CHECKS = 1;
