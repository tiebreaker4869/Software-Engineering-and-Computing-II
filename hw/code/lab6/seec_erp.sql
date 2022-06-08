/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.7
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : seec_erp

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 24/05/2022 01:11:23
*/
create database `seec_erp`;
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '商品', 0, 0, 0, 0);
INSERT INTO `category` VALUES (2, '电子产品', 1, 0, 0, 0);
INSERT INTO `category` VALUES (3, '生活用品', 1, 1, 0, 0);
INSERT INTO `category` VALUES (4, '电脑', 2, 1, 2, 2);
INSERT INTO `category` VALUES (5, '手机', 2, 1, 3, 3);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类(供应商\\销售商)',
  `level` int(11) NULL DEFAULT NULL COMMENT '级别（五级，一级普通用户，五级VIP客户）',
  `name` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `zipcode` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `line_of_credit` decimal(10, 2) NULL DEFAULT NULL COMMENT '应收额度本公司给客户的信用额度，客户欠本公司的钱的总额不能超过应收额度）',
  `receivable` decimal(10, 2) NULL DEFAULT NULL COMMENT '应收（客户还应付给本公司但还未付的钱， 即本公司应收的钱）',
  `payable` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付（本公司欠客户的钱）',
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '默认业务员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '供应商', 1, 'yzh', '12306', '南京大学', '123456', '654321@abc.com', 0.00, 0.00, 6500000.00, 'uncln');
INSERT INTO `customer` VALUES (2, '销售商', 1, 'lxs', '12580', '南哪儿大学', '123457', '12121@cba.com', 20000000.00, 4431400.00, 0.00, 'uncln');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类id(11位) + 位置(5位) = 编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名字',
  `category_id` int(11) NOT NULL COMMENT '商品分类id',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品型号',
  `quantity` int(11) NOT NULL COMMENT '商品数量',
  `purchase_price` decimal(10, 2) NOT NULL COMMENT '进价',
  `retail_price` decimal(10, 2) NOT NULL COMMENT '零售价',
  `recent_pp` decimal(10, 2) NULL DEFAULT NULL COMMENT '最近进价',
  `recent_rp` decimal(10, 2) NULL DEFAULT NULL COMMENT '最近零售价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('0000000000400000', '戴尔电脑', 4, '戴尔(DELL)Vostro笔记本电脑5410 123色 戴尔成就3500Vostro1625D', 500, 3000.00, 4056.00, 1900.00, 3000.00);
INSERT INTO `product` VALUES ('0000000000400001', '小米手机', 4, 'lalalalala', 1000, 2000.00, 3500.00, 2700.00, 4200.00);
INSERT INTO `product` VALUES ('0000000000500000', 'intel电脑', 5, 'iphone14maxpro', 0, 6000.00, 10000.00, NULL, NULL);
INSERT INTO `product` VALUES ('0000000000500001', 'iphone', 5, 'iphone14普通版', 0, 4000.00, 8000.00, NULL, NULL);
INSERT INTO `product` VALUES ('0000000000500002', '坚果', 5, 'pro3', 0, 2499.00, 3199.00, NULL, NULL);

-- ----------------------------
-- Table structure for purchase_returns_sheet
-- ----------------------------
DROP TABLE IF EXISTS `purchase_returns_sheet`;
CREATE TABLE `purchase_returns_sheet`  (
  `id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '进货退货单id',
  `purchase_sheet_id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联的进货单id',
  `operator` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `state` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退货的总金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase_returns_sheet
-- ----------------------------
INSERT INTO `purchase_returns_sheet` VALUES ('JHTHD-20220523-00000', 'JHD-20220523-00001', 'xiaoshoujingli', '审批完成', '2022-05-23 23:22:41', 800000.00, '退钱！');
INSERT INTO `purchase_returns_sheet` VALUES ('JHTHD-20220523-00001', 'JHD-20220523-00000', 'xiaoshoujingli', '审批完成', '2022-05-23 23:22:54', 500000.00, '退钱！！！');
INSERT INTO `purchase_returns_sheet` VALUES ('JHTHD-20220523-00002', 'JHD-20220523-00000', 'xiaoshoujingli', '审批完成', '2022-05-23 23:34:34', 100000.00, '退钱++++');
INSERT INTO `purchase_returns_sheet` VALUES ('JHTHD-20220523-00003', 'JHD-20220523-00000', 'xiaoshoujingli', '审批完成', '2022-05-23 23:39:30', 200000.00, 'mmmmm');
INSERT INTO `purchase_returns_sheet` VALUES ('JHTHD-20220523-00004', 'JHD-20220523-00000', '67', '审批完成', '2022-05-23 23:42:32', 200000.00, 'mmmmk');
INSERT INTO `purchase_returns_sheet` VALUES ('JHTHD-20220524-00000', 'JHD-20220523-00001', 'xiaoshoujingli', '待二级审批', '2022-05-24 01:00:18', 160000.00, NULL);
INSERT INTO `purchase_returns_sheet` VALUES ('JHTHD-20220524-00001', 'JHD-20220523-00002', 'xiaoshoujingli', '待一级审批', '2022-05-24 01:00:34', 140000.00, NULL);

-- ----------------------------
-- Table structure for purchase_returns_sheet_content
-- ----------------------------
DROP TABLE IF EXISTS `purchase_returns_sheet_content`;
CREATE TABLE `purchase_returns_sheet_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `purchase_returns_sheet_id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '进货退货单id',
  `pid` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品的总金额',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品的单价',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase_returns_sheet_content
-- ----------------------------
INSERT INTO `purchase_returns_sheet_content` VALUES (23, 'JHTHD-20220523-00000', '0000000000400000', 500, 600000.00, 1200.00, 'b');
INSERT INTO `purchase_returns_sheet_content` VALUES (24, 'JHTHD-20220523-00000', '0000000000400001', 100, 200000.00, 2000.00, 'b');
INSERT INTO `purchase_returns_sheet_content` VALUES (25, 'JHTHD-20220523-00001', '0000000000400000', 500, 500000.00, 1000.00, 'a');
INSERT INTO `purchase_returns_sheet_content` VALUES (26, 'JHTHD-20220523-00002', '0000000000400000', 100, 100000.00, 1000.00, 'a');
INSERT INTO `purchase_returns_sheet_content` VALUES (27, 'JHTHD-20220523-00003', '0000000000400000', 200, 200000.00, 1000.00, 'a');
INSERT INTO `purchase_returns_sheet_content` VALUES (28, 'JHTHD-20220523-00004', '0000000000400000', 200, 200000.00, 1000.00, 'a');
INSERT INTO `purchase_returns_sheet_content` VALUES (29, 'JHTHD-20220524-00000', '0000000000400000', 50, 60000.00, 1200.00, 'b');
INSERT INTO `purchase_returns_sheet_content` VALUES (30, 'JHTHD-20220524-00000', '0000000000400001', 50, 100000.00, 2000.00, 'b');
INSERT INTO `purchase_returns_sheet_content` VALUES (31, 'JHTHD-20220524-00001', '0000000000400000', 0, 0.00, 1300.00, 'c');
INSERT INTO `purchase_returns_sheet_content` VALUES (32, 'JHTHD-20220524-00001', '0000000000400001', 50, 140000.00, 2800.00, 'c');

-- ----------------------------
-- Table structure for purchase_sheet
-- ----------------------------
DROP TABLE IF EXISTS `purchase_sheet`;
CREATE TABLE `purchase_sheet`  (
  `id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '进货单单据编号（格式为：JHD-yyyyMMdd-xxxxx',
  `supplier` int(11) NULL DEFAULT NULL COMMENT '供应商',
  `operator` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总额合计',
  `state` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase_sheet
-- ----------------------------
INSERT INTO `purchase_sheet` VALUES ('JHD-20220523-00000', 1, 'xiaoshoujingli', 'a', 1000000.00, '审批完成', '2022-05-23 23:13:59');
INSERT INTO `purchase_sheet` VALUES ('JHD-20220523-00001', 1, 'xiaoshoujingli', 'b', 2200000.00, '审批完成', '2022-05-23 23:14:34');
INSERT INTO `purchase_sheet` VALUES ('JHD-20220523-00002', 1, 'xiaoshoujingli', 'c', 3450000.00, '审批完成', '2022-05-23 23:15:57');
INSERT INTO `purchase_sheet` VALUES ('JHD-20220524-00000', 1, 'xiaoshoujingli', NULL, 2200000.00, '待二级审批', '2022-05-24 00:56:54');
INSERT INTO `purchase_sheet` VALUES ('JHD-20220524-00001', 1, 'xiaoshoujingli', NULL, 3240000.00, '待一级审批', '2022-05-24 00:57:29');
INSERT INTO `purchase_sheet` VALUES ('JHD-20220524-00002', 1, 'xiaoshoujingli', NULL, 1650000.00, '审批完成', '2022-05-24 01:02:04');

-- ----------------------------
-- Table structure for purchase_sheet_content
-- ----------------------------
DROP TABLE IF EXISTS `purchase_sheet_content`;
CREATE TABLE `purchase_sheet_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `purchase_sheet_id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '进货单id',
  `pid` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase_sheet_content
-- ----------------------------
INSERT INTO `purchase_sheet_content` VALUES (51, 'JHD-20220523-00000', '0000000000400000', 1000, 1000.00, 1000000.00, 'a');
INSERT INTO `purchase_sheet_content` VALUES (52, 'JHD-20220523-00001', '0000000000400000', 1000, 1200.00, 1200000.00, 'b');
INSERT INTO `purchase_sheet_content` VALUES (53, 'JHD-20220523-00001', '0000000000400001', 500, 2000.00, 1000000.00, 'b');
INSERT INTO `purchase_sheet_content` VALUES (54, 'JHD-20220523-00002', '0000000000400000', 500, 1300.00, 650000.00, 'c');
INSERT INTO `purchase_sheet_content` VALUES (55, 'JHD-20220523-00002', '0000000000400001', 1000, 2800.00, 2800000.00, 'c');
INSERT INTO `purchase_sheet_content` VALUES (56, 'JHD-20220524-00000', '0000000000400000', 500, 1500.00, 750000.00, '');
INSERT INTO `purchase_sheet_content` VALUES (57, 'JHD-20220524-00000', '0000000000400001', 500, 2900.00, 1450000.00, NULL);
INSERT INTO `purchase_sheet_content` VALUES (58, 'JHD-20220524-00001', '0000000000400000', 600, 1900.00, 1140000.00, '');
INSERT INTO `purchase_sheet_content` VALUES (59, 'JHD-20220524-00001', '0000000000400001', 700, 3000.00, 2100000.00, NULL);
INSERT INTO `purchase_sheet_content` VALUES (60, 'JHD-20220524-00002', '0000000000400000', 300, 1900.00, 570000.00, '');
INSERT INTO `purchase_sheet_content` VALUES (61, 'JHD-20220524-00002', '0000000000400001', 400, 2700.00, 1080000.00, NULL);

-- ----------------------------
-- Table structure for sale_sheet
-- ----------------------------
DROP TABLE IF EXISTS `sale_sheet`;
CREATE TABLE `sale_sheet`  (
  `id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '进货单单据编号（格式为：JHD-yyyyMMdd-xxxxx',
  `supplier` int(11) NULL DEFAULT NULL COMMENT '供应商',
  `operator` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `state` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `salesman` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务员',
  `raw_total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折让前总金额',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `final_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折让后金额',
  `voucher_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '代金券金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_sheet
-- ----------------------------
INSERT INTO `sale_sheet` VALUES ('XSD-20220523-00000', 2, 'xiaoshoujingli', '卖卖卖', '审批失败', '2022-05-23 23:46:12', 'xiaoshoujingli', 1300000.00, 0.80, 1039800.00, 200.00);
INSERT INTO `sale_sheet` VALUES ('XSD-20220524-00000', 2, 'xiaoshoujingli', NULL, '审批完成', '2022-05-24 00:04:37', 'xiaoshoujingli', 4200000.00, 0.80, 3359800.00, 200.00);
INSERT INTO `sale_sheet` VALUES ('XSD-20220524-00001', 2, 'xiaoshoujingli', NULL, '审批完成', '2022-05-24 00:32:41', 'xiaoshoujingli', 620000.00, 0.80, 495800.00, 200.00);
INSERT INTO `sale_sheet` VALUES ('XSD-20220524-00002', 2, 'xiaoshoujingli', NULL, '审批完成', '2022-05-24 00:45:25', 'xiaoshoujingli', 720000.00, 0.80, 575800.00, 200.00);
INSERT INTO `sale_sheet` VALUES ('XSD-20220524-00003', 2, 'xiaoshoujingli', NULL, '待二级审批', '2022-05-24 01:05:15', 'xiaoshoujingli', 660000.00, 0.80, 527700.00, 300.00);
INSERT INTO `sale_sheet` VALUES ('XSD-20220524-00004', 2, 'xiaoshoujingli', NULL, '待一级审批', '2022-05-24 01:07:23', 'xiaoshoujingli', 2900000.00, 0.90, 2609800.00, 200.00);

-- ----------------------------
-- Table structure for sale_sheet_content
-- ----------------------------
DROP TABLE IF EXISTS `sale_sheet_content`;
CREATE TABLE `sale_sheet_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sale_sheet_id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '进货单id',
  `pid` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_sheet_content
-- ----------------------------
INSERT INTO `sale_sheet_content` VALUES (26, 'XSD-20220523-00000', '0000000000400000', 100, 5000.00, 500000.00, '卖卖卖1');
INSERT INTO `sale_sheet_content` VALUES (27, 'XSD-20220523-00000', '0000000000400001', 400, 2000.00, 800000.00, '卖卖卖2');
INSERT INTO `sale_sheet_content` VALUES (28, 'XSD-20220524-00000', '0000000000400000', 600, 3500.00, 2100000.00, '');
INSERT INTO `sale_sheet_content` VALUES (29, 'XSD-20220524-00000', '0000000000400001', 600, 3500.00, 2100000.00, NULL);
INSERT INTO `sale_sheet_content` VALUES (30, 'XSD-20220524-00001', '0000000000400000', 100, 2200.00, 220000.00, '');
INSERT INTO `sale_sheet_content` VALUES (31, 'XSD-20220524-00001', '0000000000400001', 100, 4000.00, 400000.00, NULL);
INSERT INTO `sale_sheet_content` VALUES (32, 'XSD-20220524-00002', '0000000000400000', 100, 3000.00, 300000.00, '');
INSERT INTO `sale_sheet_content` VALUES (33, 'XSD-20220524-00002', '0000000000400001', 100, 4200.00, 420000.00, NULL);
INSERT INTO `sale_sheet_content` VALUES (34, 'XSD-20220524-00003', '0000000000400000', 100, 2800.00, 280000.00, '');
INSERT INTO `sale_sheet_content` VALUES (35, 'XSD-20220524-00003', '0000000000400001', 100, 3800.00, 380000.00, NULL);
INSERT INTO `sale_sheet_content` VALUES (36, 'XSD-20220524-00004', '0000000000400000', 300, 3000.00, 900000.00, '');
INSERT INTO `sale_sheet_content` VALUES (37, 'XSD-20220524-00004', '0000000000400001', 500, 4000.00, 2000000.00, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'seecoder', '123456', 'INVENTORY_MANAGER');
INSERT INTO `user` VALUES (2, 'uncln', '123456', 'INVENTORY_MANAGER');
INSERT INTO `user` VALUES (3, 'kucun', '123456', 'INVENTORY_MANAGER');
INSERT INTO `user` VALUES (4, 'sky', '123456', 'ADMIN');
INSERT INTO `user` VALUES (5, 'zxr', '123456', 'SALE_MANAGER');
INSERT INTO `user` VALUES (6, '67', '123456', 'GM');
INSERT INTO `user` VALUES (7, 'xiaoshou', '123456', 'SALE_STAFF');
INSERT INTO `user` VALUES (8, 'Leone', '123456', 'GM');
INSERT INTO `user` VALUES (9, 'xiaoshoujingli', '123456', 'SALE_MANAGER');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存id',
  `pid` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品编号',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `purchase_price` decimal(10, 2) NOT NULL COMMENT '进价',
  `batch_id` int(11) NOT NULL COMMENT '批次',
  `production_date` datetime(0) NULL DEFAULT NULL COMMENT '出厂日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES (16, '0000000000400000', 0, 1000.00, 0, NULL);
INSERT INTO `warehouse` VALUES (17, '0000000000400000', 200, 1200.00, 1, NULL);
INSERT INTO `warehouse` VALUES (18, '0000000000400001', 400, 2000.00, 1, NULL);
INSERT INTO `warehouse` VALUES (19, '0000000000400000', 0, 1300.00, 2, NULL);
INSERT INTO `warehouse` VALUES (20, '0000000000400001', 200, 2800.00, 2, NULL);
INSERT INTO `warehouse` VALUES (21, '0000000000400000', 300, 1900.00, 3, NULL);
INSERT INTO `warehouse` VALUES (22, '0000000000400001', 400, 2700.00, 3, NULL);

-- ----------------------------
-- Table structure for warehouse_input_sheet
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_input_sheet`;
CREATE TABLE `warehouse_input_sheet`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'RKD + 日期 + index = 入库单编号',
  `batch_id` int(11) NOT NULL COMMENT '批次',
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `state` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据状态',
  `purchase_sheet_id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联的进货单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_input_sheet
-- ----------------------------
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220523-00000', 0, 'kucun', '2022-05-23 23:17:41', '审批完成', 'JHD-20220523-00000');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220523-00001', 1, 'kucun', '2022-05-23 23:17:42', '审批完成', 'JHD-20220523-00001');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220523-00002', 2, 'kucun', '2022-05-23 23:17:44', '审批完成', 'JHD-20220523-00002');
INSERT INTO `warehouse_input_sheet` VALUES ('RKD-20220524-00000', 3, 'kucun', '2022-05-24 01:02:31', '审批完成', 'JHD-20220524-00002');

-- ----------------------------
-- Table structure for warehouse_input_sheet_content
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_input_sheet_content`;
CREATE TABLE `warehouse_input_sheet_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wi_id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '入库单编号',
  `pid` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品id',
  `quantity` int(11) NOT NULL COMMENT '商品数量',
  `purchase_price` decimal(10, 2) NOT NULL COMMENT '单价',
  `production_date` datetime(0) NULL DEFAULT NULL COMMENT '出厂日期',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_input_sheet_content
-- ----------------------------
INSERT INTO `warehouse_input_sheet_content` VALUES (47, 'RKD-20220523-00000', '0000000000400000', 1000, 1000.00, NULL, 'a');
INSERT INTO `warehouse_input_sheet_content` VALUES (48, 'RKD-20220523-00001', '0000000000400000', 1000, 1200.00, NULL, 'b');
INSERT INTO `warehouse_input_sheet_content` VALUES (49, 'RKD-20220523-00001', '0000000000400001', 500, 2000.00, NULL, 'b');
INSERT INTO `warehouse_input_sheet_content` VALUES (50, 'RKD-20220523-00002', '0000000000400000', 500, 1300.00, NULL, 'c');
INSERT INTO `warehouse_input_sheet_content` VALUES (51, 'RKD-20220523-00002', '0000000000400001', 1000, 2800.00, NULL, 'c');
INSERT INTO `warehouse_input_sheet_content` VALUES (52, 'RKD-20220524-00000', '0000000000400000', 300, 1900.00, NULL, '');
INSERT INTO `warehouse_input_sheet_content` VALUES (53, 'RKD-20220524-00000', '0000000000400001', 400, 2700.00, NULL, NULL);

-- ----------------------------
-- Table structure for warehouse_output_sheet
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_output_sheet`;
CREATE TABLE `warehouse_output_sheet`  (
  `id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'CKD + date + index = 出库单id',
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员名字',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `sale_sheet_id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '销售单id',
  `state` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_output_sheet
-- ----------------------------
INSERT INTO `warehouse_output_sheet` VALUES ('CKD-20220524-00000', 'kucun', '2022-05-24 00:05:32', 'XSD-20220524-00000', '审批完成');
INSERT INTO `warehouse_output_sheet` VALUES ('CKD-20220524-00001', 'kucun', '2022-05-24 00:33:12', 'XSD-20220524-00001', '审批完成');
INSERT INTO `warehouse_output_sheet` VALUES ('CKD-20220524-00002', 'kucun', '2022-05-24 00:45:38', 'XSD-20220524-00002', '审批完成');

-- ----------------------------
-- Table structure for warehouse_output_sheet_content
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_output_sheet_content`;
CREATE TABLE `warehouse_output_sheet_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '出库商品列表id',
  `pid` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品id',
  `wo_id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出库单单据编号',
  `batch_id` int(11) NULL DEFAULT NULL COMMENT '批次',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `sale_price` decimal(10, 2) NOT NULL COMMENT '对应批次的单价',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse_output_sheet_content
-- ----------------------------
INSERT INTO `warehouse_output_sheet_content` VALUES (28, '0000000000400000', 'CKD-20220524-00000', 2, 600, 3500.00, '');
INSERT INTO `warehouse_output_sheet_content` VALUES (29, '0000000000400000', 'CKD-20220524-00000', 1, 600, 3500.00, '');
INSERT INTO `warehouse_output_sheet_content` VALUES (30, '0000000000400001', 'CKD-20220524-00000', 2, 600, 3500.00, NULL);
INSERT INTO `warehouse_output_sheet_content` VALUES (35, '0000000000400000', 'CKD-20220524-00001', 1, 100, 2200.00, '');
INSERT INTO `warehouse_output_sheet_content` VALUES (36, '0000000000400001', 'CKD-20220524-00001', 2, 100, 4000.00, NULL);
INSERT INTO `warehouse_output_sheet_content` VALUES (37, '0000000000400000', 'CKD-20220524-00002', 1, 100, 3000.00, '');
INSERT INTO `warehouse_output_sheet_content` VALUES (38, '0000000000400001', 'CKD-20220524-00002', 2, 100, 4200.00, NULL);

SET FOREIGN_KEY_CHECKS = 1;
