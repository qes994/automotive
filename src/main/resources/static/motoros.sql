/*
Navicat MySQL Data Transfer

Source Server         : user
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : motoros

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2020-01-10 08:50:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `phone` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `head` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `permission` int(32) DEFAULT '1' COMMENT '1普通管理员 2超级管理员',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '邱鸿智', '15939049221', '/2020010318/a25620690b4a45d4838bf480f318e74d.jpeg', '555elq65be9q529lq62l52095s562l25', '2', '2020-01-28 15:51:03', null);
INSERT INTO `admin` VALUES ('2', '王五', '15939049229', '/2020010318/a25620690b4a45d4838bf480f318e74d.jpeg', '555elq65be9q529lq62l52095s562l25', '0', '2020-01-06 15:15:43', null);
INSERT INTO `admin` VALUES ('3', '柴鸡', '15939049238', '/2020010609/74f9e38e5be44adc9fac6735213ec739.jpeg', '562ybl56620b92s5265b55565e552022', '1', '2020-01-06 15:15:46', null);
INSERT INTO `admin` VALUES ('4', '张三', '15939049226', null, '22q5e6s65l2s252ly5296by5l5qy6l66', '1', '2020-01-06 14:40:53', null);
INSERT INTO `admin` VALUES ('5', '张思', '15939049233', null, '6q6s5syse2526q60e5b5ls05qyb9sbs5', '1', '2020-01-06 14:42:38', null);
INSERT INTO `admin` VALUES ('8', '注册', '15939049277', null, '20y56ls65555s56qy559q0ylbs2bsbl6', '1', '2020-01-07 17:39:50', null);
INSERT INTO `admin` VALUES ('9', '传参', '15939049264', null, '0s2els9ys6l525qb9bl5b69eqs262sb2', '1', '2020-01-07 17:42:47', null);
INSERT INTO `admin` VALUES ('10', '懒懒', '15939049267', null, '165', '1', '2020-01-07 17:43:17', null);
INSERT INTO `admin` VALUES ('11', '睡睡', '15939049245', null, '123', '1', '2020-01-07 17:55:42', null);

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', '1', '1');
INSERT INTO `admin_role` VALUES ('4', '2', '2');
INSERT INTO `admin_role` VALUES ('5', '3', '3');
INSERT INTO `admin_role` VALUES ('10', '9', '1');
INSERT INTO `admin_role` VALUES ('11', '10', '3');
INSERT INTO `admin_role` VALUES ('12', '11', '1');

-- ----------------------------
-- Table structure for arctic
-- ----------------------------
DROP TABLE IF EXISTS `arctic`;
CREATE TABLE `arctic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '车型表',
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `priority` int(10) unsigned DEFAULT '1' COMMENT '优先级',
  `status` tinyint(5) unsigned DEFAULT '1' COMMENT '1:可显示 2隐藏',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of arctic
-- ----------------------------
INSERT INTO `arctic` VALUES ('1', '小型', '1', '1', '2019-12-24 16:57:34', null);
INSERT INTO `arctic` VALUES ('2', '中型', '1', '1', '2019-12-24 16:57:37', null);
INSERT INTO `arctic` VALUES ('3', '跑车', '1', '1', '2019-12-24 16:57:40', null);
INSERT INTO `arctic` VALUES ('4', '新能源', '1', '1', '2019-12-24 16:57:42', null);
INSERT INTO `arctic` VALUES ('5', '越野', '1', '1', '2019-12-24 16:57:46', null);

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint(11) NOT NULL DEFAULT '1' COMMENT '1显示 2隐藏',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8 COMMENT='车型表';

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('3', '爱驰', '1', '1', null, null);
INSERT INTO `brand` VALUES ('4', '安凯客车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('5', '巴博斯', '1', '2', null, null);
INSERT INTO `brand` VALUES ('6', '宝骏', '2', '1', null, null);
INSERT INTO `brand` VALUES ('7', '宝马', '1', '1', null, null);
INSERT INTO `brand` VALUES ('8', '宝骐汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('9', '宝沃', '1', '1', null, null);
INSERT INTO `brand` VALUES ('10', '保时捷', '1', '1', null, null);
INSERT INTO `brand` VALUES ('11', '北京汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('12', '北京清行', '1', '1', null, null);
INSERT INTO `brand` VALUES ('13', '北汽昌河', '1', '1', null, null);
INSERT INTO `brand` VALUES ('14', '北汽道达', '1', '1', null, null);
INSERT INTO `brand` VALUES ('15', '北汽幻速', '1', '1', null, null);
INSERT INTO `brand` VALUES ('16', '北汽威旺', '1', '1', null, null);
INSERT INTO `brand` VALUES ('18', '北汽新能源', '1', '1', null, null);
INSERT INTO `brand` VALUES ('19', '北汽制造', '1', '1', null, null);
INSERT INTO `brand` VALUES ('20', '奔驰', '1', '1', null, null);
INSERT INTO `brand` VALUES ('21', '奔腾', '1', '1', null, null);
INSERT INTO `brand` VALUES ('22', '本田', '1', '1', null, null);
INSERT INTO `brand` VALUES ('24', '比速汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('25', '比亚迪', '1', '1', null, null);
INSERT INTO `brand` VALUES ('26', '标致', '1', '1', null, null);
INSERT INTO `brand` VALUES ('27', '别克', '1', '1', null, null);
INSERT INTO `brand` VALUES ('28', '宾利', '1', '1', null, null);
INSERT INTO `brand` VALUES ('29', '铂驰', '1', '1', null, null);
INSERT INTO `brand` VALUES ('30', '布加迪', '1', '1', null, null);
INSERT INTO `brand` VALUES ('31', '长安', '1', '1', null, null);
INSERT INTO `brand` VALUES ('32', '长安跨越', '1', '1', null, null);
INSERT INTO `brand` VALUES ('33', '长安欧尚', '1', '1', null, null);
INSERT INTO `brand` VALUES ('35', '长城', '1', '1', null, null);
INSERT INTO `brand` VALUES ('36', '车驰汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('37', '成功汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('38', '大乘汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('39', '大发', '1', '1', null, null);
INSERT INTO `brand` VALUES ('40', '大众', '1', '1', null, null);
INSERT INTO `brand` VALUES ('41', '电咖', '1', '1', null, null);
INSERT INTO `brand` VALUES ('42', '东风', '1', '1', null, null);
INSERT INTO `brand` VALUES ('45', '东风风光', '1', '1', null, null);
INSERT INTO `brand` VALUES ('46', '东风风神', '1', '1', null, null);
INSERT INTO `brand` VALUES ('47', '东风风行', '1', '1', null, null);
INSERT INTO `brand` VALUES ('48', '东风小康', '1', '1', null, null);
INSERT INTO `brand` VALUES ('49', '东南', '1', '1', null, null);
INSERT INTO `brand` VALUES ('50', '法拉利', '1', '1', null, null);
INSERT INTO `brand` VALUES ('51', '菲亚特', '1', '1', null, null);
INSERT INTO `brand` VALUES ('52', '丰田', '1', '1', null, null);
INSERT INTO `brand` VALUES ('53', '福迪', '1', '1', null, null);
INSERT INTO `brand` VALUES ('55', '福特', '1', '1', null, null);
INSERT INTO `brand` VALUES ('56', '福田', '1', '1', null, null);
INSERT INTO `brand` VALUES ('57', 'GMC', '1', '1', null, null);
INSERT INTO `brand` VALUES ('58', '观致', '1', '1', null, null);
INSERT INTO `brand` VALUES ('59', '光冈', '1', '1', null, null);
INSERT INTO `brand` VALUES ('60', '广汽传祺', '1', '1', null, null);
INSERT INTO `brand` VALUES ('61', '广汽吉奥', '1', '1', null, null);
INSERT INTO `brand` VALUES ('62', '广汽集团', '1', '1', null, null);
INSERT INTO `brand` VALUES ('64', '国机智骏', '1', '1', null, null);
INSERT INTO `brand` VALUES ('65', '国金汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('66', '捷尼赛思', '1', '1', null, null);
INSERT INTO `brand` VALUES ('67', '哈飞', '1', '1', null, null);
INSERT INTO `brand` VALUES ('68', '哈弗', '1', '1', null, null);
INSERT INTO `brand` VALUES ('69', '海格', '1', '1', null, null);
INSERT INTO `brand` VALUES ('70', '海马', '1', '1', null, null);
INSERT INTO `brand` VALUES ('71', '汉腾汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('72', '悍马', '1', '1', null, null);
INSERT INTO `brand` VALUES ('73', '恒天', '1', '1', null, null);
INSERT INTO `brand` VALUES ('74', '红旗', '1', '1', null, null);
INSERT INTO `brand` VALUES ('75', '红星汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('76', '华凯', '1', '1', null, null);
INSERT INTO `brand` VALUES ('77', '华利', '1', '1', null, null);
INSERT INTO `brand` VALUES ('78', '华普', '1', '1', null, null);
INSERT INTO `brand` VALUES ('79', '华骐', '1', '1', null, null);
INSERT INTO `brand` VALUES ('80', '华颂', '1', '1', null, null);
INSERT INTO `brand` VALUES ('81', '华泰', '1', '1', null, null);
INSERT INTO `brand` VALUES ('83', '黄海', '1', '1', null, null);
INSERT INTO `brand` VALUES ('84', 'Icona', '1', '1', null, null);
INSERT INTO `brand` VALUES ('85', 'Jeep', '1', '1', null, null);
INSERT INTO `brand` VALUES ('86', '吉利汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('88', '江淮', '1', '1', null, null);
INSERT INTO `brand` VALUES ('89', '江铃', '1', '1', null, null);
INSERT INTO `brand` VALUES ('90', '捷豹', '1', '1', null, null);
INSERT INTO `brand` VALUES ('91', '捷达', '1', '1', null, null);
INSERT INTO `brand` VALUES ('92', '捷途', '1', '1', null, null);
INSERT INTO `brand` VALUES ('93', '金杯', '1', '1', null, null);
INSERT INTO `brand` VALUES ('94', '金龙', '1', '1', null, null);
INSERT INTO `brand` VALUES ('95', '金旅', '1', '1', null, null);
INSERT INTO `brand` VALUES ('96', '九龙', '1', '1', null, null);
INSERT INTO `brand` VALUES ('97', '君马汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('98', 'KTM', '1', '1', null, null);
INSERT INTO `brand` VALUES ('99', '卡尔森', '1', '1', null, null);
INSERT INTO `brand` VALUES ('101', '卡威', '1', '1', null, null);
INSERT INTO `brand` VALUES ('102', '开瑞', '1', '1', null, null);
INSERT INTO `brand` VALUES ('103', '开沃汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('104', '凯迪拉克', '1', '1', null, null);
INSERT INTO `brand` VALUES ('105', '凯翼', '1', '1', null, null);
INSERT INTO `brand` VALUES ('106', '科尼赛克', '1', '1', null, null);
INSERT INTO `brand` VALUES ('107', '克莱斯勒', '1', '1', null, null);
INSERT INTO `brand` VALUES ('108', '兰博基尼', '1', '1', null, null);
INSERT INTO `brand` VALUES ('109', '劳斯莱斯', '1', '1', null, null);
INSERT INTO `brand` VALUES ('110', '雷丁', '1', '1', null, null);
INSERT INTO `brand` VALUES ('111', '雷克萨斯', '1', '1', null, null);
INSERT INTO `brand` VALUES ('112', '雷诺', '1', '1', null, null);
INSERT INTO `brand` VALUES ('113', '理念', '1', '1', null, null);
INSERT INTO `brand` VALUES ('114', '理想汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('115', '力帆汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('117', '猎豹汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('118', '林肯', '1', '1', null, null);
INSERT INTO `brand` VALUES ('119', '铃木', '1', '1', null, null);
INSERT INTO `brand` VALUES ('120', '零跑汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('121', '领克', '1', '1', null, null);
INSERT INTO `brand` VALUES ('122', '领途汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('123', '陆地方舟', '1', '1', null, null);
INSERT INTO `brand` VALUES ('124', '陆风', '1', '1', null, null);
INSERT INTO `brand` VALUES ('125', '路虎', '1', '1', null, null);
INSERT INTO `brand` VALUES ('126', '路特斯', '1', '1', null, null);
INSERT INTO `brand` VALUES ('127', '罗夫哈特', '1', '1', null, null);
INSERT INTO `brand` VALUES ('128', 'MINI', '1', '1', null, null);
INSERT INTO `brand` VALUES ('129', '马自达', '1', '1', null, null);
INSERT INTO `brand` VALUES ('130', '玛莎拉蒂', '1', '1', null, null);
INSERT INTO `brand` VALUES ('131', '迈巴赫', '1', '1', null, null);
INSERT INTO `brand` VALUES ('132', '迈凯伦', '1', '1', null, null);
INSERT INTO `brand` VALUES ('133', '迈迈', '1', '1', null, null);
INSERT INTO `brand` VALUES ('134', '迈莎锐', '1', '1', null, null);
INSERT INTO `brand` VALUES ('135', '名爵', '1', '1', null, null);
INSERT INTO `brand` VALUES ('136', '摩根', '1', '1', null, null);
INSERT INTO `brand` VALUES ('138', '纳智捷', '1', '1', null, null);
INSERT INTO `brand` VALUES ('139', '欧宝', '1', '1', null, null);
INSERT INTO `brand` VALUES ('140', '欧拉', '1', '1', null, null);
INSERT INTO `brand` VALUES ('141', '欧朗', '1', '1', null, null);
INSERT INTO `brand` VALUES ('142', 'Polestar极星', '1', '1', null, null);
INSERT INTO `brand` VALUES ('143', '帕加尼', '1', '1', null, null);
INSERT INTO `brand` VALUES ('144', '奇瑞', '1', '1', null, null);
INSERT INTO `brand` VALUES ('145', '骐铃汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('147', '起亚', '1', '1', null, null);
INSERT INTO `brand` VALUES ('148', '前途', '1', '1', null, null);
INSERT INTO `brand` VALUES ('149', '乔治·巴顿', '1', '1', null, null);
INSERT INTO `brand` VALUES ('150', '庆铃汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('151', '全球鹰', '1', '1', null, null);
INSERT INTO `brand` VALUES ('152', '全球鹰', '1', '1', null, null);
INSERT INTO `brand` VALUES ('153', '荣威', '1', '1', null, null);
INSERT INTO `brand` VALUES ('154', '容大智造', '1', '1', null, null);
INSERT INTO `brand` VALUES ('155', '如虎', '1', '1', null, null);
INSERT INTO `brand` VALUES ('156', '瑞驰新能源', '1', '1', null, null);
INSERT INTO `brand` VALUES ('157', 'smart', '1', '1', null, null);
INSERT INTO `brand` VALUES ('158', 'SRM鑫源', '1', '1', null, null);
INSERT INTO `brand` VALUES ('159', '萨博', '1', '1', null, null);
INSERT INTO `brand` VALUES ('161', '三菱', '1', '1', null, null);
INSERT INTO `brand` VALUES ('162', '陕汽通家', '1', '1', null, null);
INSERT INTO `brand` VALUES ('163', '世爵', '1', '1', null, null);
INSERT INTO `brand` VALUES ('164', '双环', '1', '1', null, null);
INSERT INTO `brand` VALUES ('165', '思皓', '1', '1', null, null);
INSERT INTO `brand` VALUES ('166', '思铭', '1', '1', null, null);
INSERT INTO `brand` VALUES ('167', '斯巴鲁', '1', '1', null, null);
INSERT INTO `brand` VALUES ('169', '斯柯达', '1', '1', null, null);
INSERT INTO `brand` VALUES ('170', '泰卡特', '1', '1', null, null);
INSERT INTO `brand` VALUES ('171', '特斯拉', '1', '1', null, null);
INSERT INTO `brand` VALUES ('172', '腾势', '1', '1', null, null);
INSERT INTO `brand` VALUES ('173', '天际汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('174', '威麟', '1', '1', null, null);
INSERT INTO `brand` VALUES ('175', '威马汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('176', '威兹曼', '1', '1', null, null);
INSERT INTO `brand` VALUES ('177', '潍柴汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('179', '蔚来', '1', '1', null, null);
INSERT INTO `brand` VALUES ('180', '沃尔沃', '1', '1', null, null);
INSERT INTO `brand` VALUES ('181', '五菱汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('182', '五十铃', '1', '1', null, null);
INSERT INTO `brand` VALUES ('183', '西雅特', '1', '1', null, null);
INSERT INTO `brand` VALUES ('184', '现代', '1', '1', null, null);
INSERT INTO `brand` VALUES ('186', '新宝骏', '1', '1', null, null);
INSERT INTO `brand` VALUES ('187', '新凯', '1', '1', null, null);
INSERT INTO `brand` VALUES ('188', '新特汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('189', '星途', '1', '1', null, null);
INSERT INTO `brand` VALUES ('190', '雪佛兰', '1', '1', null, null);
INSERT INTO `brand` VALUES ('191', '雪铁龙', '1', '1', null, null);
INSERT INTO `brand` VALUES ('192', '野马汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('193', '一汽', '1', '1', null, null);
INSERT INTO `brand` VALUES ('194', '依维柯', '1', '1', null, null);
INSERT INTO `brand` VALUES ('195', '英菲尼迪', '1', '1', null, null);
INSERT INTO `brand` VALUES ('196', '永源', '1', '1', null, null);
INSERT INTO `brand` VALUES ('197', '宇通客车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('198', '驭胜', '1', '1', null, null);
INSERT INTO `brand` VALUES ('199', '御捷', '1', '1', null, null);
INSERT INTO `brand` VALUES ('200', '裕路', '1', '1', null, null);
INSERT INTO `brand` VALUES ('201', '远程汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('202', '云度', '1', '1', null, null);
INSERT INTO `brand` VALUES ('203', '云雀汽车', '1', '1', null, null);
INSERT INTO `brand` VALUES ('205', '知豆', '1', '1', null, null);
INSERT INTO `brand` VALUES ('206', '中华', '1', '1', null, null);
INSERT INTO `brand` VALUES ('207', '中兴', '1', '1', null, null);
INSERT INTO `brand` VALUES ('208', '众泰', '1', '1', null, null);

-- ----------------------------
-- Table structure for issue
-- ----------------------------
DROP TABLE IF EXISTS `issue`;
CREATE TABLE `issue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '发布表',
  `user_id` int(10) unsigned DEFAULT NULL,
  `brand` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `arctic` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `title` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `digest` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '摘要',
  `details` varchar(600) COLLATE utf8mb4_bin DEFAULT '',
  `priority` int(3) DEFAULT '1' COMMENT '优先级',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '1显示 2隐藏',
  `price` int(64) DEFAULT '0' COMMENT '价格',
  `image` varchar(600) COLLATE utf8mb4_bin DEFAULT '',
  `shop` tinyint(3) unsigned DEFAULT '1' COMMENT '1售卖  2求购',
  `ceiling_price` int(64) unsigned DEFAULT NULL,
  `floor_price` int(64) unsigned DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of issue
-- ----------------------------
INSERT INTO `issue` VALUES ('8', '1', '本田', '中型', '测试', '', '11111111', '0', '1', '9', '', '2', null, null, '2019-12-29 14:40:29', '2020-01-05 09:45:19');
INSERT INTO `issue` VALUES ('10', '1', '宝骐汽车', '新能源', '测试33', '', '测试', '9', '2', '14', '', '1', null, null, '2019-12-29 17:35:24', '2020-01-04 17:43:11');
INSERT INTO `issue` VALUES ('11', '1', '北京清行', '越野', '北京清行,收购大甩卖,150万....', '', '就是来破产', '0', '1', '18', '', '2', null, null, '2019-12-29 17:36:03', '2020-01-02 10:29:23');
INSERT INTO `issue` VALUES ('12', '1', '奔驰', '越野', '奔驰大甩卖,,,,', '', '好看,又快', '0', '1', '26', '', '1', null, null, '2020-01-02 11:15:25', null);
INSERT INTO `issue` VALUES ('13', '1', '宝马', '中型', '收购一俩跑俩公里的奔驰', '', '真心,价格不贵的', '0', '1', '22', '', '2', null, null, '2020-01-02 11:16:45', null);
INSERT INTO `issue` VALUES ('16', '1', '长安', '越野', '秋名山', '', '测试', '0', '1', '19', '', '1', '0', '0', '2020-01-05 15:04:38', null);
INSERT INTO `issue` VALUES ('17', '1', '标致', '跑车', '秋名山突突突', '', '凸凸凸凸凸凸凸凸凸凸', '0', '1', '7', '', '1', '0', '0', '2020-01-05 15:11:53', null);

-- ----------------------------
-- Table structure for issue_print
-- ----------------------------
DROP TABLE IF EXISTS `issue_print`;
CREATE TABLE `issue_print` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '发布的图片表',
  `issue_id` int(10) unsigned DEFAULT NULL,
  `priority` int(11) DEFAULT '1' COMMENT '优先级',
  `cover` varchar(600) COLLATE utf8mb4_bin DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of issue_print
-- ----------------------------
INSERT INTO `issue_print` VALUES ('17', '8', '1', '/2019122914/3f3bf2064f52470ca4c356c4cda22cfd.jpeg', '2019-12-29 14:40:29');
INSERT INTO `issue_print` VALUES ('18', '8', '1', '/2019122914/307da6e7513b4b0b928acd3888165d61.jpeg', '2019-12-29 14:40:29');
INSERT INTO `issue_print` VALUES ('19', '8', '1', '/2019122914/491244b2b6cf4374a4ff7b87ad50491c.jpeg', '2019-12-29 14:40:29');
INSERT INTO `issue_print` VALUES ('27', '11', '1', '/2019122917/0f4234fab5e94f65b60eb14a377b9272.jpeg', '2019-12-29 17:36:03');
INSERT INTO `issue_print` VALUES ('29', '11', '1', '/2019122917/0f5054d62a154d858e69b2c403ac61ba.jpeg', '2019-12-29 17:36:03');
INSERT INTO `issue_print` VALUES ('35', '10', '1', '/2019123012/89f976903a004cfca1ed69cacd07741a.jpeg', '2019-12-30 12:00:21');
INSERT INTO `issue_print` VALUES ('39', '10', '1', '/2019123013/c137fed9f7c844c9a72b33aa5fc0ed15.jpeg', '2019-12-30 13:40:24');
INSERT INTO `issue_print` VALUES ('41', '11', '1', '/2019123014/aa8c904f93bb48aa99311005676f6830.jpeg', '2019-12-30 14:01:23');
INSERT INTO `issue_print` VALUES ('45', '10', '1', '/2019123014/e70a835118c742ecb9313eecd56e75b1.jpeg', '2019-12-30 14:11:08');
INSERT INTO `issue_print` VALUES ('46', '10', '1', '/2019123014/306bd2596a9d49ddaa1474e7ab0a7dd4.jpeg', '2019-12-30 14:11:08');
INSERT INTO `issue_print` VALUES ('49', '11', '1', '/2019123016/d93690819e924db29adb5c7491710425.jpeg', '2019-12-30 16:55:08');
INSERT INTO `issue_print` VALUES ('50', '10', '1', '/2019123016/1c75579698324d68a3d6017ae97b7093.jpeg', '2019-12-30 16:55:51');
INSERT INTO `issue_print` VALUES ('51', '10', '1', '/2019123016/9cbebee1c84b495cb9b9f1fe97b779bb.jpeg', '2019-12-30 16:55:51');
INSERT INTO `issue_print` VALUES ('53', '11', '0', '/2020010210/1da698c3ed7b4d78aa2710a5a469442a.jpeg', '2020-01-02 10:29:23');
INSERT INTO `issue_print` VALUES ('54', '12', '0', '/2020010211/decd60c478bf410d849db45468a4123c.jpeg', '2020-01-02 11:15:25');
INSERT INTO `issue_print` VALUES ('55', '12', '0', '/2020010211/092b87c85f64446d9d1036827e3b538e.jpeg', '2020-01-02 11:15:25');
INSERT INTO `issue_print` VALUES ('56', '12', '0', '/2020010211/a4f91a60958249099812715e7a8d66bd.jpeg', '2020-01-02 11:15:25');
INSERT INTO `issue_print` VALUES ('57', '13', '0', '/2020010211/f18750c4313c4343a4854c5d0ed1a78f.jpeg', '2020-01-02 11:16:45');
INSERT INTO `issue_print` VALUES ('58', '13', '0', '/2020010211/bee1e91929924c4d82e9f6f833edc83e.jpeg', '2020-01-02 11:16:45');
INSERT INTO `issue_print` VALUES ('60', '16', '0', '/2020010515/46665b9386be451098bd755c1e824d1a.jpeg', '2020-01-05 15:04:38');
INSERT INTO `issue_print` VALUES ('61', '17', '0', '/2020010515/3d8195d11f8142a6af083feea71d0ed3.jpeg', '2020-01-05 15:11:53');
INSERT INTO `issue_print` VALUES ('62', '17', '0', '/2020010515/e38228a0444c4e479f860d713d6d6499.jpeg', '2020-01-05 15:11:53');
INSERT INTO `issue_print` VALUES ('63', '17', '0', '/2020010515/d9f4bcfc3b8a4ba7b9067cf44b95c8e1.jpeg', '2020-01-05 15:11:53');

-- ----------------------------
-- Table structure for money
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ceiling_price` int(64) unsigned DEFAULT '0',
  `floor_price` int(64) unsigned DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES ('1', '10', '0', '2020-01-02 16:33:38', null);
INSERT INTO `money` VALUES ('2', '15', '10', '2020-01-02 16:34:18', null);
INSERT INTO `money` VALUES ('3', '20', '15', '2020-01-02 16:34:21', null);
INSERT INTO `money` VALUES ('4', '25', '20', '2020-01-02 16:34:23', null);
INSERT INTO `money` VALUES ('5', '30', '25', '2020-01-02 16:34:25', null);

-- ----------------------------
-- Table structure for opinion
-- ----------------------------
DROP TABLE IF EXISTS `opinion`;
CREATE TABLE `opinion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '意见反馈',
  `user_id` int(10) unsigned DEFAULT NULL,
  `content` varchar(600) COLLATE utf8mb4_bin DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of opinion
-- ----------------------------
INSERT INTO `opinion` VALUES ('2', '1', '测试', null, null);
INSERT INTO `opinion` VALUES ('3', '1', '测试', '2019-12-25 11:57:50', null);
INSERT INTO `opinion` VALUES ('4', '1', '测试', '2020-01-02 10:42:11', null);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `url` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '用户管理', '/user/index');
INSERT INTO `permission` VALUES ('2', '发布管理', '/issue/index');
INSERT INTO `permission` VALUES ('3', '权限管理', '/admin/index');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '老板');
INSERT INTO `role` VALUES ('2', '经理');
INSERT INTO `role` VALUES ('3', '组长');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `permission_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '1');
INSERT INTO `role_permission` VALUES ('2', '1', '2');
INSERT INTO `role_permission` VALUES ('3', '1', '3');
INSERT INTO `role_permission` VALUES ('4', '2', '1');
INSERT INTO `role_permission` VALUES ('5', '2', '2');
INSERT INTO `role_permission` VALUES ('6', '3', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `password` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `head` varchar(600) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` int(3) unsigned DEFAULT '1' COMMENT '1正常 2冻结',
  `real_name` int(10) unsigned DEFAULT '3' COMMENT '是否实名制 1实名 2未实名',
  `sex` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '性别',
  `age` int(64) unsigned DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `flag` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sole` (`phone`) USING BTREE COMMENT '保持唯一'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '车友', '123', '/2019123114/fe1ab721b53b4489803afd84ea16ea4f.jpeg', '1', '1', '男', '0', '15939049221', '2019-12-25 13:48:09', '2019-12-19 13:48:12', '1');
INSERT INTO `user` VALUES ('2', '小明同学', '', '/2019123114/fe1ab721b53b4489803afd84ea16ea4f.jpeg', '2', '3', '', '0', '15939049227', '2020-01-23 09:48:30', null, '1');
INSERT INTO `user` VALUES ('3', '李四', '', '/2019123114/fe1ab721b53b4489803afd84ea16ea4f.jpeg', '1', '3', '', '0', '15939049226', null, null, '1');
INSERT INTO `user` VALUES ('4', '王五', '', '/2019123114/fe1ab721b53b4489803afd84ea16ea4f.jpeg', '1', '3', '', '0', '15939049264', '2020-01-16 11:18:32', null, '1');

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '实名认证',
  `user_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `front_image` varchar(600) COLLATE utf8mb4_bin DEFAULT '' COMMENT '正面图片',
  `back_image` varchar(600) COLLATE utf8mb4_bin DEFAULT '' COMMENT '背面图片',
  `status` tinyint(5) DEFAULT '2' COMMENT '1已认证 2未认证',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id_card` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '身份证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user_auth
-- ----------------------------
INSERT INTO `user_auth` VALUES ('5', '1', '邱鸿智', '/2019122509/5df71ef40c54451c8817d08090d3fe31.jpeg', '/2019122509/e7381669130a4563ab23da1146a55ba9.jpeg', '1', '2019-12-25 09:41:16', null, '410822200009065033');
INSERT INTO `user_auth` VALUES ('14', '13', '邱鸿智', '/2020010414/ed81a9f6f0734e1eb0ee3dd47152d587.jpeg', '/2020010414/0527d3a8ceec4caf833168399e9b89f5.jpeg', '2', '2020-01-04 14:19:08', null, '410822200009065033');

-- ----------------------------
-- Table structure for user_issue
-- ----------------------------
DROP TABLE IF EXISTS `user_issue`;
CREATE TABLE `user_issue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '发布和用户的记录表',
  `user_id` int(10) unsigned DEFAULT NULL,
  `issue_id` int(10) unsigned DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user_issue
-- ----------------------------
