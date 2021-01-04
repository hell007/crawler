/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : csms-system

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2019-07-01 16:12:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `p_type` varchar(100) DEFAULT NULL,
  `v0` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_casbin_rule_v0` (`v0`),
  KEY `IDX_casbin_rule_v1` (`v1`),
  KEY `IDX_casbin_rule_v2` (`v2`),
  KEY `IDX_casbin_rule_v3` (`v3`),
  KEY `IDX_casbin_rule_v4` (`v4`),
  KEY `IDX_casbin_rule_v5` (`v5`),
  KEY `IDX_casbin_rule_p_type` (`p_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES ('1', 'p', 'admin', '/admin*', 'GET|POST|DELETE|PUT', '.*', '角色管理', '');
INSERT INTO `casbin_rule` VALUES ('2', 'p', 'demo', '/demo*', 'GET|POST|DELETE|PUT', '.*', 'demo角色', '');

-- ----------------------------
-- Table structure for ea_comment
-- ----------------------------
DROP TABLE IF EXISTS `ea_comment`;
CREATE TABLE `ea_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `goods_id` int(11) NOT NULL,
  `cid` smallint(6) NOT NULL COMMENT '好评中评差评',
  `user_id` int(10) unsigned NOT NULL,
  `label` varchar(200) NOT NULL,
  `mark` smallint(4) NOT NULL DEFAULT '5',
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of ea_comment
-- ----------------------------
INSERT INTO `ea_comment` VALUES ('14', '9', '20', '1', '1', '', '5', '苹果（APPLE）iPhone 5 16G版 3G手机（黑色）WCDMA/GSM 0元购机', '1409478764', '1');
INSERT INTO `ea_comment` VALUES ('15', '9', '20', '1', '1', '', '5', '买手机就打昆明小胡手机店', '1409478796', '1');
INSERT INTO `ea_comment` VALUES ('16', '9', '20', '1', '1', '性能好#功能齐全', '5', '用的放心，安心，买的舒心', '1409478815', '1');
INSERT INTO `ea_comment` VALUES ('17', '11', '22', '1', '1', '', '5', '好，非常好', '1409483946', '1');
INSERT INTO `ea_comment` VALUES ('18', '11', '22', '2', '1', '', '5', '好吧', '1409484124', '1');
INSERT INTO `ea_comment` VALUES ('19', '11', '22', '1', '1', '', '5', '<span>给你多一点的时间，以为你会更好过</span>', '1409484350', '1');
INSERT INTO `ea_comment` VALUES ('20', '13', '31', '1', '1', '服务周到#', '5', '非常好的一次网购！', '1413020545', '1');
INSERT INTO `ea_comment` VALUES ('21', '12', '24', '1', '1', '', '4', '非常好！', '1413021081', '1');
INSERT INTO `ea_comment` VALUES ('22', '12', '22', '1', '1', '', '4', '非常好！', '1413021081', '1');

-- ----------------------------
-- Table structure for ea_comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `ea_comment_reply`;
CREATE TABLE `ea_comment_reply` (
  `c_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) NOT NULL COMMENT '咨询的商品ID',
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `c_reply` text NOT NULL,
  `c_time` int(11) NOT NULL,
  `c_ip` char(15) NOT NULL COMMENT '留言IP',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='评论回复表';

-- ----------------------------
-- Records of ea_comment_reply
-- ----------------------------
INSERT INTO `ea_comment_reply` VALUES ('5', '20', '1', '16', '亲，你太棒了！感谢你对昆宇街的支持。祝生活愉快！', '1412500157', '127.0.0.1');
INSERT INTO `ea_comment_reply` VALUES ('6', '22', '1', '22', '感谢您对昆宇街的支持！', '1413868830', '221.213.114.171');
INSERT INTO `ea_comment_reply` VALUES ('7', '31', '1', '20', '非常好的一次网购！', '1413873125', '221.213.114.171');

-- ----------------------------
-- Table structure for ea_msgs
-- ----------------------------
DROP TABLE IF EXISTS `ea_msgs`;
CREATE TABLE `ea_msgs` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m_name` char(5) NOT NULL COMMENT '姓名',
  `m_tel` varchar(30) NOT NULL COMMENT '电话',
  `m_email` varchar(50) NOT NULL COMMENT '邮箱',
  `m_type` varchar(50) NOT NULL COMMENT '咨询类型',
  `type_id` int(11) NOT NULL,
  `goods_id` int(10) NOT NULL COMMENT '咨询的商品ID',
  `user_id` int(11) NOT NULL,
  `m_con` text NOT NULL COMMENT '内容',
  `m_reply_cont` text NOT NULL,
  `m_reply_time` int(11) NOT NULL,
  `m_ip` char(15) NOT NULL COMMENT '留言IP',
  `m_time` int(11) NOT NULL COMMENT '留言时间',
  `m_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of ea_msgs
-- ----------------------------
INSERT INTO `ea_msgs` VALUES ('8', '', '', '', '促销及赠品', '4', '21', '1', '喜欢这个商品阿萨德好的', '', '0', '127.0.0.1', '1402293627', '0');
INSERT INTO `ea_msgs` VALUES ('9', '', '', '', '商品咨询', '1', '22', '1', '喜欢这个商品阿萨德好的阿双方大是大非上的噶是噶十多个法师打发士大夫', '', '0', '127.0.0.1', '1402293642', '0');
INSERT INTO `ea_msgs` VALUES ('11', '', '', '', '商品咨询', '1', '20', '1', '爱你要see you!', '爱你要see you!', '1413872579', '221.213.114.171', '1403681278', '1');

-- ----------------------------
-- Table structure for jie_access
-- ----------------------------
DROP TABLE IF EXISTS `jie_access`;
CREATE TABLE `jie_access` (
  `id` varchar(36) NOT NULL COMMENT 'uuid主键',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_access
-- ----------------------------
INSERT INTO `jie_access` VALUES ('1', '2', '1');
INSERT INTO `jie_access` VALUES ('10', '2', '35');
INSERT INTO `jie_access` VALUES ('11', '2', '36');
INSERT INTO `jie_access` VALUES ('12', '2', '37');
INSERT INTO `jie_access` VALUES ('13', '2', '38');
INSERT INTO `jie_access` VALUES ('2', '2', '2');
INSERT INTO `jie_access` VALUES ('3', '2', '4');
INSERT INTO `jie_access` VALUES ('4', '2', '3');
INSERT INTO `jie_access` VALUES ('5', '2', '24');
INSERT INTO `jie_access` VALUES ('6', '2', '25');
INSERT INTO `jie_access` VALUES ('7', '2', '26');
INSERT INTO `jie_access` VALUES ('8', '2', '27');
INSERT INTO `jie_access` VALUES ('9', '2', '5');
INSERT INTO `jie_access` VALUES ('a1506dd05b4311e98c29cb36bb792c660', '4', '36');

-- ----------------------------
-- Table structure for jie_ads_channel
-- ----------------------------
DROP TABLE IF EXISTS `jie_ads_channel`;
CREATE TABLE `jie_ads_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告栏目id',
  `name` varchar(20) NOT NULL COMMENT '广告栏目',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广告id父级id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开启/关闭 状态',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_ads_channel
-- ----------------------------
INSERT INTO `jie_ads_channel` VALUES ('1', 'iphone X推广', '0', '1', '0');
INSERT INTO `jie_ads_channel` VALUES ('2', '手机广告', '0', '1', '0');

-- ----------------------------
-- Table structure for jie_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `jie_advertisement`;
CREATE TABLE `jie_advertisement` (
  `id` varchar(64) NOT NULL COMMENT '广告id',
  `name` varchar(25) NOT NULL COMMENT '广告名称',
  `ad_img` varchar(100) DEFAULT NULL COMMENT '广告图',
  `ad_url` varchar(255) DEFAULT NULL COMMENT '广告链接',
  `ad_code` text COMMENT '广告代码',
  `channel_id` int(10) unsigned NOT NULL COMMENT '文章栏目',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开启/关闭 状态',
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是/否 热门',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_advertisement
-- ----------------------------
INSERT INTO `jie_advertisement` VALUES ('3624007523474596bf0adebb28405a13', '华为手机', 'upload/ads/2018032809150040391.jpg', '', '', '2', '1', '1', '2018-03-28 21:15:07', '2018-03-31 21:10:35', '2018-03-28 21:15:15', null);
INSERT INTO `jie_advertisement` VALUES ('9cb8d9f369a44eb69070fbcdc0df537a', '难得一见iphone X', 'upload/ads/2018032809141251979.jpg', '', '', '1', '1', '1', '2018-03-28 21:14:20', '2018-02-15 15:15:08', '2018-02-05 15:19:10', '2018-03-28 21:14:31');

-- ----------------------------
-- Table structure for jie_article
-- ----------------------------
DROP TABLE IF EXISTS `jie_article`;
CREATE TABLE `jie_article` (
  `id` varchar(64) NOT NULL COMMENT '文章id',
  `title` varchar(25) NOT NULL COMMENT '文章标题',
  `keywords` varchar(50) NOT NULL DEFAULT '街' COMMENT '关键字',
  `author` varchar(20) NOT NULL DEFAULT '街' COMMENT '作者',
  `views` int(10) unsigned NOT NULL DEFAULT '188' COMMENT '浏览量',
  `source_pic` varchar(100) DEFAULT NULL COMMENT '源图',
  `contents` text NOT NULL COMMENT '文章内容',
  `channel_id` int(10) unsigned NOT NULL COMMENT '文章栏目',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开启/关闭 状态',
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是/否 热门',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of jie_article
-- ----------------------------
INSERT INTO `jie_article` VALUES ('5519476144fa4a9a9e21a8eaae7adb3e', 'java 比对 php crypt 加密的密码', 'java', 'jie', '100', 'upload/article/2018032502153350967.jpg', '&lt;span style=&quot;color:#333333;font-family:Helvetica, Tahoma, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;&quot;&gt;由于密码要发送到第三方去比对，而第三方的是使用php来开发的。希望能有一个java的比对方法。&lt;/span&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#333333;font-family:Helvetica, Tahoma, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;&quot;&gt;第三方开放数据库给我们，并给出如下对比方法，看的不太懂，求指导。（crypt的第二个参数是一个暗码，为何在对方给出的对比方法中是之前加密的密文，如果这样加密的话，第一次的密文是如何加密的？）&lt;/span&gt;&lt;br /&gt;\r\n&lt;span style=&quot;color:#333333;font-family:Helvetica, Tahoma, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;&quot;&gt;密码0fdcbb6825d7a38c970ddc1208cc6b9a对应明文是gujin19710407&lt;/span&gt;&lt;br /&gt;\r\n&lt;span style=&quot;color:#333333;font-family:Helvetica, Tahoma, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;&quot;&gt;对比方法&amp;nbsp;&lt;/span&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#333333;font-family:Helvetica, Tahoma, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;&quot;&gt;Post_passwd2&amp;nbsp;==&amp;nbsp;crypt(Post_passwd,Post_passwd2)&amp;nbsp;&lt;/span&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#333333;font-family:Helvetica, Tahoma, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;&quot;&gt;Post_passwd2：密文&lt;/span&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#333333;font-family:Helvetica, Tahoma, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;&quot;&gt;Post_passwd：明文&lt;/span&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#333333;font-family:Helvetica, Tahoma, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;&quot;&gt;小弟对于PHP不是很了解，希望各位能帮忙，多谢！&lt;/span&gt;', '6', '1', '1', '2018-02-28 11:34:58', null);

-- ----------------------------
-- Table structure for jie_article_channel
-- ----------------------------
DROP TABLE IF EXISTS `jie_article_channel`;
CREATE TABLE `jie_article_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章栏目id',
  `name` varchar(20) NOT NULL COMMENT '文章栏目',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id父级id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开启/关闭 状态',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `channel_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='文章栏目表';

-- ----------------------------
-- Records of jie_article_channel
-- ----------------------------
INSERT INTO `jie_article_channel` VALUES ('1', '帮助中心', '0', '1', '1');
INSERT INTO `jie_article_channel` VALUES ('2', '购物指南', '1', '1', '0');
INSERT INTO `jie_article_channel` VALUES ('3', '配送方式', '1', '1', '0');
INSERT INTO `jie_article_channel` VALUES ('4', '支付方式', '1', '1', '0');
INSERT INTO `jie_article_channel` VALUES ('5', '昆宇街快报', '0', '2', '1');
INSERT INTO `jie_article_channel` VALUES ('6', '商城新闻', '5', '1', '0');
INSERT INTO `jie_article_channel` VALUES ('7', '活动促销', '5', '1', '0');
INSERT INTO `jie_article_channel` VALUES ('8', '售后服务', '1', '1', '0');
INSERT INTO `jie_article_channel` VALUES ('9', '特色服务', '1', '1', '0');

-- ----------------------------
-- Table structure for jie_brand
-- ----------------------------
DROP TABLE IF EXISTS `jie_brand`;
CREATE TABLE `jie_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` varchar(20) NOT NULL COMMENT '品牌名称',
  `note` varchar(200) DEFAULT NULL COMMENT '描述',
  `logo` varchar(100) DEFAULT NULL COMMENT '品牌图',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开启/关闭 状态',
  `url` varchar(255) DEFAULT NULL COMMENT '品牌链接',
  `sort` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_brand
-- ----------------------------
INSERT INTO `jie_brand` VALUES ('1', 'apple', '苹果品牌', 'upload/brand/2018032502142273144.jpg', '1', 'www.apple.com', '100');

-- ----------------------------
-- Table structure for jie_cart
-- ----------------------------
DROP TABLE IF EXISTS `jie_cart`;
CREATE TABLE `jie_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `goods_sn` int(10) unsigned NOT NULL COMMENT '商品编号',
  `goods_num` int(10) unsigned NOT NULL COMMENT '商品数量',
  `uid` varchar(64) NOT NULL COMMENT '用户id',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `goods_sn` (`goods_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_cart
-- ----------------------------

-- ----------------------------
-- Table structure for jie_casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `jie_casbin_rule`;
CREATE TABLE `jie_casbin_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `p_type` varchar(100) DEFAULT NULL,
  `v0` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_casbin_rule_p_type` (`p_type`),
  KEY `IDX_casbin_rule_v2` (`v2`),
  KEY `IDX_casbin_rule_v3` (`v3`),
  KEY `IDX_casbin_rule_v4` (`v4`),
  KEY `IDX_casbin_rule_v5` (`v5`),
  KEY `IDX_casbin_rule_v0` (`v0`),
  KEY `IDX_casbin_rule_v1` (`v1`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_casbin_rule
-- ----------------------------
INSERT INTO `jie_casbin_rule` VALUES ('65', 'p', '90', '/*', 'ANY', '.*', '超级用户', '', null);
INSERT INTO `jie_casbin_rule` VALUES ('66', 'g', '90', 'admin', '', '', '', '', null);
INSERT INTO `jie_casbin_rule` VALUES ('67', 'g', '90', 'user', '', '', '', '', null);
INSERT INTO `jie_casbin_rule` VALUES ('68', 'p', 'admin', '/admin*', 'GET|POST|DELETE|PUT', '.*', '角色管理', '', null);
INSERT INTO `jie_casbin_rule` VALUES ('69', 'p', 'user', '/user*', 'GET|POST|DELETE|PUT', '.*', 'demo角色12', '', null);
INSERT INTO `jie_casbin_rule` VALUES ('71', 'p', 't1', '/*', 'PUT|DELETE|GET|POST', '.*', '测试1', '', null);

-- ----------------------------
-- Table structure for jie_category
-- ----------------------------
DROP TABLE IF EXISTS `jie_category`;
CREATE TABLE `jie_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_name` varchar(20) NOT NULL COMMENT '分类名称',
  `keywords` varchar(50) NOT NULL COMMENT '关键词',
  `descption` varchar(100) NOT NULL COMMENT '描述',
  `pid` int(10) unsigned NOT NULL COMMENT '分类父级id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型',
  `filter_attr` varchar(100) DEFAULT NULL COMMENT '筛选属性',
  `is_nav` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是/否 导航',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开启/关闭 状态',
  `sort` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id` (`category_id`),
  UNIQUE KEY `category_name` (`category_name`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_category
-- ----------------------------
INSERT INTO `jie_category` VALUES ('1', '手机通讯', '手机通讯', '手机通讯', '0', '1', '1,2,3,4,5,6,7,8,,,,,,', '1', '1', '0');

-- ----------------------------
-- Table structure for jie_delivery
-- ----------------------------
DROP TABLE IF EXISTS `jie_delivery`;
CREATE TABLE `jie_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `delivery_id` tinyint(4) NOT NULL COMMENT '物流id',
  `delivery_name` varchar(50) NOT NULL COMMENT '物流名称',
  `delivery_price` decimal(10,0) NOT NULL COMMENT '物流价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='快递表';

-- ----------------------------
-- Records of jie_delivery
-- ----------------------------
INSERT INTO `jie_delivery` VALUES ('1', '1', '昆宇街快递', '10');
INSERT INTO `jie_delivery` VALUES ('2', '2', '上门自提', '0');

-- ----------------------------
-- Table structure for jie_goods
-- ----------------------------
DROP TABLE IF EXISTS `jie_goods`;
CREATE TABLE `jie_goods` (
  `goods_id` varchar(64) NOT NULL COMMENT '商品id',
  `goods_sn` int(10) unsigned NOT NULL COMMENT '商品编号',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `promote_word` varchar(100) NOT NULL COMMENT '促销词',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `contents` text COMMENT '商品内容',
  `goods_icon` varchar(50) DEFAULT NULL COMMENT '活动图标',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌',
  `category_id` int(10) unsigned NOT NULL COMMENT '分类',
  `type_id` int(10) unsigned DEFAULT NULL COMMENT '类型',
  `pack_id` int(10) unsigned DEFAULT NULL COMMENT '商品包',
  `shop_id` varchar(64) NOT NULL DEFAULT '000000' COMMENT '商户',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '999999.00' COMMENT '市场价',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '999999.00' COMMENT '商品价',
  `is_promote` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '促销(1 => ''是'', 2 => ''否'')',
  `promote_price` decimal(10,2) unsigned DEFAULT NULL COMMENT '促销价',
  `promote_stime` datetime DEFAULT NULL COMMENT '促销开始时间',
  `promote_etime` datetime DEFAULT NULL COMMENT '促销结束时间',
  `is_on_sale` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '是/否 上架(1 => ''是'', 2 => ''否'')',
  `is_first` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '是/否 首发(1 => ''是'', 2 => ''否'')',
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '是/否  热卖(1 => ''是'', 2 => ''否'')',
  `is_activity` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '是/否  活动，默认不支持，支持的话，详情不可访问(1 => ''是'', 2 => ''否'')',
  `activity_price` decimal(10,2) unsigned DEFAULT NULL COMMENT '活动价',
  `activity_stime` datetime DEFAULT NULL COMMENT '活动开始时间',
  `activity_etime` datetime DEFAULT NULL COMMENT '活动结束时间',
  `sku` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `limit_num` int(10) unsigned NOT NULL DEFAULT '99999' COMMENT '限制购买数量、默认不限制',
  `unit` enum('件','箱') NOT NULL DEFAULT '件' COMMENT '单位',
  `views` int(10) unsigned NOT NULL DEFAULT '188' COMMENT '浏览数',
  `concerns` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '关注数',
  `small_pic` varchar(100) DEFAULT NULL COMMENT '小图',
  `medium_pic` varchar(100) DEFAULT NULL COMMENT '中图',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `goods_id` (`goods_id`),
  UNIQUE KEY `goods_sn` (`goods_sn`),
  UNIQUE KEY `goods_name` (`goods_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_goods
-- ----------------------------
INSERT INTO `jie_goods` VALUES ('1', '100000', 'iPhone 8', '【移动专享】官网直降600！云南移动用户购机再送6G流量！', 'iPhone8国行版金色 64GB ,iPhone8国行版金色 64GB 报价,iPhone8国行版金色 64GB 参数,iPhone8国行版金色 64GB 怎么样,iPhone8国行版金色 64GB 图片,iPhone8国行版金色 64GB 评测,iPhone8国行版金色 64GB 点评', 'iPhone8', '', null, '1', '1', '1', '2', '000000', '5860.00', '5060.00', '2', '0.00', '2017-12-27 11:00:43', '2017-12-27 11:00:47', '1', '2', '2', '2', '0.00', '2017-12-27 11:01:47', '2017-12-27 11:01:45', '0', '99999', '件', '188', '0', 'upload/goods/2018032809101563557_100_100.jpg', 'upload/goods/2018032809101644598_400_400.jpg', '2017-12-27 11:01:13', '2017-12-27 11:06:55');
INSERT INTO `jie_goods` VALUES ('2', '100001', 'iPhone plus', '【移动专享】官网直降600！云南移动用户购机再送6G流量！', 'iPhone 8（A1863）国行版深空灰色 256GB', null, '', null, '2', '1', '1', '3', '000000', '5860.00', '5060.00', '2', '0.00', '2017-12-27 11:00:43', '2017-12-27 11:00:47', '1', '2', '2', '2', '0.00', '2017-12-27 11:01:47', '2017-12-27 11:01:45', '0', '99999', '件', '188', '0', 'upload/goods/2018032809104711064_100_100.jpg', 'upload/goods/2018032809104721305_400_400.jpg', '2017-12-27 11:01:13', '2017-12-27 11:06:55');
INSERT INTO `jie_goods` VALUES ('3', '100002', 'iPhone X', '【移动专享】官网直降600！云南移动用户购机再送6G流量！', 'iPhone 8（A1863）国行版银色 64GB', null, '', null, '2', '1', '1', '4', '000000', '5860.00', '5060.00', '2', '0.00', '2017-12-27 11:00:43', '2017-12-27 11:00:47', '1', '2', '2', '2', '0.00', '2017-12-27 11:01:47', '2017-12-27 11:01:45', '0', '99999', '件', '188', '0', 'upload/goods/2018032809111019778_100_100.jpg', 'upload/goods/2018032809111098631_400_400.jpg', '2017-12-27 11:01:13', '2017-12-27 11:06:55');
INSERT INTO `jie_goods` VALUES ('4', '100003', 'iPhone 8（A1863）国行版银色 256GB', '【移动专享】官网直降600！云南移动用户购机再送6G流量！ ', 'iPhone 8（A1863）国行版银色 256GB', null, '', null, '3', '1', '1', '2', '000000', '5860.00', '5060.00', '2', '0.00', '2017-12-27 11:00:43', '2017-12-27 11:00:47', '1', '2', '2', '2', '0.00', '2017-12-27 11:01:47', '2017-12-27 11:01:45', '0', '99999', '件', '188', '0', '000', '000', '2017-12-27 11:01:13', '2017-12-27 11:06:55');
INSERT INTO `jie_goods` VALUES ('5', '100004', 'iPhone 8（A1863）国行版金色 256GB', '【移动专享】官网直降600！云南移动用户购机再送6G流量！ ', 'iPhone 8（A1863）国行版金色 256GB', null, '', null, '1', '1', '1', '2', '000000', '5860.00', '5060.00', '2', '0.00', '2017-12-27 11:00:43', '2017-12-27 11:00:47', '1', '2', '2', '2', '0.00', '2017-12-27 11:01:47', '2017-12-27 11:01:45', '0', '99999', '件', '188', '0', '000', '000', '2017-12-27 11:01:13', '2017-12-27 11:06:55');
INSERT INTO `jie_goods` VALUES ('6', '100005', 'iPhone 8 灰色 64GB', '【移动专享】官网直降600！', 'iPhone 8（A1863）国行版深空灰色 64GB', null, '', null, '4', '1', '1', '2', '000000', '5860.00', '5060.00', '2', '0.00', '2017-12-27 11:00:43', '2017-12-27 11:00:47', '2', '2', '2', '2', '0.00', '2017-12-27 11:01:47', '2017-12-27 11:01:45', '0', '99999', '件', '188', '0', 'upload/goods/2018032809115189801_100_100.jpg', 'upload/goods/2018032809115159530_400_400.jpg', '2017-12-27 11:01:13', '2017-12-27 11:06:55');

-- ----------------------------
-- Table structure for jie_goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `jie_goods_gallery`;
CREATE TABLE `jie_goods_gallery` (
  `gallery_id` varchar(64) NOT NULL COMMENT '商品画廊id',
  `small_pic` varchar(100) NOT NULL COMMENT '小图',
  `medium_pic` varchar(100) NOT NULL COMMENT '中图',
  `source_pic` varchar(100) NOT NULL COMMENT '中图',
  `goods_sn` int(10) unsigned NOT NULL COMMENT '商品编号',
  PRIMARY KEY (`gallery_id`),
  UNIQUE KEY `gallery_id` (`gallery_id`),
  KEY `goods_sn` (`goods_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_goods_gallery
-- ----------------------------
INSERT INTO `jie_goods_gallery` VALUES ('6199f28344e84c4abbd19d190052e8f4', 'upload/goods/2018032809113367507_100_100.jpg', 'upload/goods/2018032809113332269_400_400.jpg', 'upload/goods/2018032809113360230_800_800.jpg', '100003');
INSERT INTO `jie_goods_gallery` VALUES ('a6da1a06998f495484548edf96a35e2d', 'upload/goods/2018032809111019778_100_100.jpg', 'upload/goods/2018032809111098631_400_400.jpg', 'upload/goods/2018032809111070676_800_800.jpg', '100002');
INSERT INTO `jie_goods_gallery` VALUES ('ad88e8e7c9f745708e27fb4cf8857003', 'upload/goods/2018032809115189801_100_100.jpg', 'upload/goods/2018032809115159530_400_400.jpg', 'upload/goods/2018032809115194765_800_800.jpg', '100005');
INSERT INTO `jie_goods_gallery` VALUES ('b9e6b9d8f5cb4e579e316604f1868eed', 'upload/goods/2018032809104711064_100_100.jpg', 'upload/goods/2018032809104721305_400_400.jpg', 'upload/goods/2018032809104719782_800_800.jpg', '100001');
INSERT INTO `jie_goods_gallery` VALUES ('f55883b2fb1e4a7fb932bef292daaec2', 'upload/goods/2018032809101563557_100_100.jpg', 'upload/goods/2018032809101644598_400_400.jpg', 'upload/goods/2018032809101629120_800_800.jpg', '100000');

-- ----------------------------
-- Table structure for jie_member
-- ----------------------------
DROP TABLE IF EXISTS `jie_member`;
CREATE TABLE `jie_member` (
  `uid` varchar(64) NOT NULL COMMENT '用户id',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `salt` varchar(64) NOT NULL COMMENT '盐值',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `mobile` varchar(15) NOT NULL COMMENT '手机号码',
  `gender` enum('男','女','保密') NOT NULL DEFAULT '保密' COMMENT '性别',
  `name` varchar(20) NOT NULL COMMENT '真实姓名',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `ip` varchar(20) NOT NULL COMMENT '登录ip',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `remark` varchar(200) DEFAULT NULL COMMENT '记录',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_member
-- ----------------------------
INSERT INTO `jie_member` VALUES ('1', 'admin', 'wcPU4U/Fe8rUbk8k4pvp8g==', '9115e3750b0c6601cdc9c33a0afbff91', 'pi@sohu.com', '13877777777', '男', '范逸尘', 'pi酱', '127.0.0.1', '2017-12-24 04:00:00', '2018-03-28 21:16:06', '1', null);
INSERT INTO `jie_member` VALUES ('61afaadf-e6ea-11e7-b9a5-68f728b9bfe2', 'test', 'nJrx3defJSozx3dYCq+x8g==', '948a450331d375f22fee352ae8a05d2b', 'papi@sohu.com', '13888888888', '女', '江逸尘', 'papi酱', '127.0.0.1', '2017-12-24 04:00:00', '2017-12-24 04:00:00', '1', null);

-- ----------------------------
-- Table structure for jie_member_address
-- ----------------------------
DROP TABLE IF EXISTS `jie_member_address`;
CREATE TABLE `jie_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `consignee` varchar(20) NOT NULL COMMENT '收件人',
  `phone` varchar(15) NOT NULL COMMENT '手机号码',
  `tell` varchar(15) DEFAULT NULL COMMENT '座机号码',
  `zipcode` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `province` int(10) unsigned NOT NULL COMMENT '省份直辖市',
  `city` int(10) unsigned NOT NULL COMMENT '市',
  `district` int(10) unsigned NOT NULL COMMENT '区县',
  `address` varchar(100) NOT NULL COMMENT '详细地址',
  `uid` varchar(64) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_member_address
-- ----------------------------
INSERT INTO `jie_member_address` VALUES ('1', '曹操', '13888888888', null, null, '1', '1', '3', '上地十街00大道三零公寓', '61afaadf-e6ea-11e7-b9a5-68f728b9bfe2');
INSERT INTO `jie_member_address` VALUES ('2', '刘小背', '13877777777', null, null, '2', '3', '3', '浦江大道新东方花园', '61afaadf-e6ea-11e7-b9a5-68f728b9bfe2');
INSERT INTO `jie_member_address` VALUES ('5', '关大玉', '13876677777', null, null, '2', '3', '3', '浦江大道新东方花园', '1aaf5884-e6ef-11e7-b9a5-68f728b9bfe2');

-- ----------------------------
-- Table structure for jie_order
-- ----------------------------
DROP TABLE IF EXISTS `jie_order`;
CREATE TABLE `jie_order` (
  `id` varchar(64) NOT NULL COMMENT '订单id',
  `ordersn` varchar(20) NOT NULL COMMENT '订单编号',
  `create_time` datetime NOT NULL COMMENT '下单时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '订单确认时间',
  `order_status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '订单状态(1 => ''未确认'', 2 => ''已确认'',3 => ''已取消'',4 => ''已完成'')',
  `pay_status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '付款状态（1 => ''未付款'',2 => ''已付款'',3=>''申请退款'',4=>''退货退款''）',
  `ship_status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '发货状态（1 => ''未发货'', 2 => ''配货中'',3 => ''已发货'',4 => ''已签收''）',
  `consignee` varchar(20) NOT NULL COMMENT '收货人',
  `province` int(10) unsigned NOT NULL COMMENT '省(直辖市)',
  `city` int(10) unsigned NOT NULL COMMENT '市',
  `district` int(10) unsigned NOT NULL COMMENT '区县',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '乡镇街道',
  `zipcode` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `tell` varchar(15) DEFAULT NULL COMMENT '座机',
  `mobile` varchar(15) NOT NULL COMMENT '手机',
  `pay_id` smallint(5) unsigned DEFAULT NULL COMMENT '支付方式（1=>''在线支付''，2=>''货到付款''）',
  `pay_name` varchar(45) DEFAULT NULL COMMENT '支付方式',
  `pay_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付的总价格',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `ship_id` smallint(5) unsigned DEFAULT NULL COMMENT '物流方式（1=>''快递''，2=>''上门取货''）',
  `ship_name` varchar(45) DEFAULT NULL COMMENT '物流名称',
  `ship_time` datetime DEFAULT NULL COMMENT '发货时间',
  `ship_price` decimal(5,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '物流价格',
  `promotion` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '促销方式（1 => ''无促销''，2 => ''改价，便宜售卖''，3 => ''折扣促销（优惠券、优惠卡、打折等）'' ，4 => ''活动促销（抽奖与摸奖等）''',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格（优惠券价格，折扣多少价格，减价多少价格）',
  `promote_note` varchar(200) DEFAULT NULL COMMENT '促销简要说明',
  `total_price` decimal(10,2) NOT NULL COMMENT '订单总价',
  `return_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '退款价格（0为没有退款）',
  `uid` varchar(64) NOT NULL COMMENT '顾客id',
  PRIMARY KEY (`city`,`id`),
  UNIQUE KEY `order_sn` (`ordersn`),
  KEY `user_id` (`uid`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `district` (`district`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of jie_order
-- ----------------------------
INSERT INTO `jie_order` VALUES ('1', '141111111111111', '2018-03-12 16:38:45', '2018-03-12 17:39:26', '4', '2', '4', '小明', '530000', '530100', '530113', '南亚风情园', '655101', null, '19888888888', '1', '支付宝', '5060.00', '2018-03-12 16:57:44', '1', '自送', '2018-03-12 17:45:24', '0.00', '1', '0.00', null, '5060.29', '0.00', '1');
INSERT INTO `jie_order` VALUES ('2', '140948479012163', '2016-01-05 10:12:51', '2018-03-13 15:33:19', '4', '2', '4', '曹操', '530000', '530100', '530112', '西坝66号', '655100', '', '13888888888', null, '支付宝', '15500.00', '2018-03-13 09:56:19', '1', '顺丰快递', '2018-03-13 16:00:12', '0.00', '2', '500.00', '更改价格500', '16000.00', '0.00', '1');

-- ----------------------------
-- Table structure for jie_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `jie_order_goods`;
CREATE TABLE `jie_order_goods` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `goods_sn` varchar(45) NOT NULL COMMENT '商品编号',
  `goods_pic` varchar(255) DEFAULT NULL COMMENT '商品小图片',
  `goods_name` varchar(145) NOT NULL COMMENT '商品名称',
  `goods_attr` varchar(255) NOT NULL COMMENT '商品属性',
  `order_id` varchar(64) NOT NULL COMMENT '订单id',
  `order_price` decimal(10,2) unsigned NOT NULL,
  `order_num` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品信息表';

-- ----------------------------
-- Records of jie_order_goods
-- ----------------------------
INSERT INTO `jie_order_goods` VALUES ('1', '100000', null, 'iPhone 8', '灰色 64GB', '1', '5060.00', '1');
INSERT INTO `jie_order_goods` VALUES ('2', '100002', null, 'iPhone X', '金色  64GB', '2', '10000.00', '1');
INSERT INTO `jie_order_goods` VALUES ('3', '100005', null, 'iPhone 8 灰色 64GB', '灰色 64GB', '2', '6000.00', '1');

-- ----------------------------
-- Table structure for jie_packages
-- ----------------------------
DROP TABLE IF EXISTS `jie_packages`;
CREATE TABLE `jie_packages` (
  `pack_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品包id',
  `pack_name` varchar(40) NOT NULL COMMENT '商品包名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品包父级id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开启/关闭 状态',
  `sort` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`pack_id`),
  UNIQUE KEY `pack_id` (`pack_id`),
  UNIQUE KEY `pack_name` (`pack_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_packages
-- ----------------------------
INSERT INTO `jie_packages` VALUES ('1', '2018苹果手机', '0', '1', '50');
INSERT INTO `jie_packages` VALUES ('2', 'iPhone 8', '1', '1', '50');
INSERT INTO `jie_packages` VALUES ('3', 'iPhone 8 Plus', '1', '1', '50');
INSERT INTO `jie_packages` VALUES ('4', 'iPhone X', '1', '1', '50');
INSERT INTO `jie_packages` VALUES ('5', '2017小米电视2', '0', '1', '50');

-- ----------------------------
-- Table structure for jie_package_attr
-- ----------------------------
DROP TABLE IF EXISTS `jie_package_attr`;
CREATE TABLE `jie_package_attr` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品包属性id',
  `attr_name` varchar(20) NOT NULL COMMENT '商品包属性名称',
  `attr_values` text COMMENT '属性值',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0：关闭，1：开启)',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pack_id` int(10) unsigned NOT NULL COMMENT '商品包id',
  PRIMARY KEY (`attr_id`),
  UNIQUE KEY `id` (`attr_id`),
  UNIQUE KEY `attr_name` (`attr_name`),
  KEY `pack_id` (`pack_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_package_attr
-- ----------------------------
INSERT INTO `jie_package_attr` VALUES ('1', '版本', 'iPhone 8\r\niPhone 8 Plus\r\niPhone X', '1', '0', '1');
INSERT INTO `jie_package_attr` VALUES ('2', '颜色', '金色\r\n灰色\r\n银色', '1', '0', '2');
INSERT INTO `jie_package_attr` VALUES ('3', '容量', '64G\r\n256G', '1', '1', '2');
INSERT INTO `jie_package_attr` VALUES ('4', '尺寸', '50\r\n55\r\n60', '1', '0', '5');
INSERT INTO `jie_package_attr` VALUES ('5', '网络类型', '移动\r\n电信\r\n联通', '1', '0', '2');

-- ----------------------------
-- Table structure for jie_package_attr_list
-- ----------------------------
DROP TABLE IF EXISTS `jie_package_attr_list`;
CREATE TABLE `jie_package_attr_list` (
  `id` varchar(64) NOT NULL COMMENT '包属性列表id',
  `attr_value` varchar(100) NOT NULL COMMENT '包属性列表值',
  `goods_sn` int(10) unsigned NOT NULL COMMENT '商品编号',
  `attr_id` int(10) unsigned NOT NULL COMMENT '包属性id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attr_list_id` (`id`),
  KEY `goods_sn` (`goods_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_package_attr_list
-- ----------------------------
INSERT INTO `jie_package_attr_list` VALUES ('1', '64G', '100001', '3');
INSERT INTO `jie_package_attr_list` VALUES ('2', '256', '100002', '3');
INSERT INTO `jie_package_attr_list` VALUES ('3', '金色', '100001', '2');
INSERT INTO `jie_package_attr_list` VALUES ('4', '黑色', '100002', '2');
INSERT INTO `jie_package_attr_list` VALUES ('5', '银色', '100003', '2');

-- ----------------------------
-- Table structure for jie_permission
-- ----------------------------
DROP TABLE IF EXISTS `jie_permission`;
CREATE TABLE `jie_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(32) NOT NULL COMMENT '权限名称',
  `pid` int(10) unsigned NOT NULL COMMENT '权限父id',
  `path` varchar(100) DEFAULT NULL COMMENT '权限路径',
  `redirect` varchar(100) DEFAULT NULL COMMENT 'url',
  `code` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `level` tinyint(3) unsigned NOT NULL COMMENT '权限级别',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：启用=1/停用=2',
  `sort` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `hidden` tinyint(3) NOT NULL DEFAULT '2' COMMENT '显示： 显示=1/隐藏=2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='节点表';

-- ----------------------------
-- Records of jie_permission
-- ----------------------------
INSERT INTO `jie_permission` VALUES ('1', '系统管理', '0', '', '', '', '1', 'xa-icon-config', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('2', '权限管理', '1', 'permission', 'permission/list', 'permission:list', '2', 'xa-icon-verify', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('3', '权限列表', '2', 'list', 'permission/list', 'permission:list', '3', '', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('4', '权限添加', '2', 'form', 'permission/form', 'permission:add', '3', '', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('5', '权限修改', '2', 'form', 'permission/form', 'permission:edit', '3', '', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('6', '权限保存', '2', '', 'permission/save', 'permission:save', '3', '', '1', '0', '2');
INSERT INTO `jie_permission` VALUES ('7', '权限删除', '2', '', 'permission/delete', 'permission:delete', '3', '', '1', '0', '2');
INSERT INTO `jie_permission` VALUES ('8', '权限预留', '2', '', null, '', '3', '', '1', '0', '2');
INSERT INTO `jie_permission` VALUES ('9', '权限预留', '2', '', null, '', '3', '', '1', '0', '2');
INSERT INTO `jie_permission` VALUES ('24', '用户管理', '1', 'user', 'user/list', 'user:list', '2', 'xa-icon-member', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('25', '用户列表', '24', 'list', 'user/list', 'user:list', '3', '', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('26', '用户添加', '24', 'form', 'user/form', 'user:add', '3', '', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('27', '用户修改', '24', 'form', 'user/form', 'user:edit', '3', '', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('35', '角色管理', '1', 'role', 'role/list', 'role:list', '2', 'xa-icon-password', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('36', '角色列表', '35', 'list', 'role/list', 'role:list', '3', '', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('37', '角色添加', '35', 'form', 'role/form', 'role:add', '3', '', '1', '0', '1');
INSERT INTO `jie_permission` VALUES ('38', '角色修改', '35', 'form', 'role/form', 'role:edit', '3', '', '1', '0', '1');

-- ----------------------------
-- Table structure for jie_role
-- ----------------------------
DROP TABLE IF EXISTS `jie_role`;
CREATE TABLE `jie_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `pid` int(10) unsigned zerofill NOT NULL DEFAULT '0000000001' COMMENT '角色id的父级id',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `description` varchar(100) DEFAULT NULL COMMENT '角色职责描述',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：启用=1/停用=2',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id` (`role_id`),
  UNIQUE KEY `name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_role
-- ----------------------------
INSERT INTO `jie_role` VALUES ('1', '0000000000', 'superadmin', '超级管理员作为预留最高管理者', '1');
INSERT INTO `jie_role` VALUES ('2', '0000000001', 'admin', '系统管理员', '1');
INSERT INTO `jie_role` VALUES ('3', '0000000001', 'goods', '商品管理员,负责商品维护', '1');
INSERT INTO `jie_role` VALUES ('4', '0000000001', 'news', '文章维护管理人员', '1');

-- ----------------------------
-- Table structure for jie_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `jie_role_menu`;
CREATE TABLE `jie_role_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL COMMENT '角色id',
  `mid` int(10) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jie_role_menu
-- ----------------------------
INSERT INTO `jie_role_menu` VALUES ('1', '68', '2');
INSERT INTO `jie_role_menu` VALUES ('2', '68', '3');
INSERT INTO `jie_role_menu` VALUES ('3', '68', '4');
INSERT INTO `jie_role_menu` VALUES ('4', '68', '5');
INSERT INTO `jie_role_menu` VALUES ('5', '68', '6');
INSERT INTO `jie_role_menu` VALUES ('6', '73', '16');
INSERT INTO `jie_role_menu` VALUES ('7', '73', '17');
INSERT INTO `jie_role_menu` VALUES ('8', '73', '18');
INSERT INTO `jie_role_menu` VALUES ('9', '73', '19');
INSERT INTO `jie_role_menu` VALUES ('10', '73', '20');
INSERT INTO `jie_role_menu` VALUES ('11', '73', '21');
INSERT INTO `jie_role_menu` VALUES ('12', '73', '22');
INSERT INTO `jie_role_menu` VALUES ('13', '73', '23');
INSERT INTO `jie_role_menu` VALUES ('14', '73', '24');
INSERT INTO `jie_role_menu` VALUES ('15', '73', '25');
INSERT INTO `jie_role_menu` VALUES ('16', '73', '26');
INSERT INTO `jie_role_menu` VALUES ('17', '73', '27');
INSERT INTO `jie_role_menu` VALUES ('18', '73', '28');
INSERT INTO `jie_role_menu` VALUES ('19', '69', '7');
INSERT INTO `jie_role_menu` VALUES ('20', '69', '8');
INSERT INTO `jie_role_menu` VALUES ('39', '69', '9');
INSERT INTO `jie_role_menu` VALUES ('40', '68', '51');

-- ----------------------------
-- Table structure for jie_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `jie_schedule_job`;
CREATE TABLE `jie_schedule_job` (
  `id` varchar(20) NOT NULL COMMENT '任务ID',
  `jobname` varchar(40) DEFAULT NULL COMMENT '任务名称',
  `jobgroup` varchar(40) DEFAULT NULL COMMENT '任务分组',
  `jobstatus` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '任务状态 （0禁用， 1启用）',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态（0 已创建， 1 审核通过， 2 审核驳回）',
  `cronexpression` varchar(40) NOT NULL COMMENT '任务运行时间表达式',
  `quartzclass` varchar(255) DEFAULT NULL COMMENT '定时任务处理类',
  `description` varchar(280) DEFAULT NULL COMMENT '描述信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for jie_search
-- ----------------------------
DROP TABLE IF EXISTS `jie_search`;
CREATE TABLE `jie_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '热词id',
  `goods_sn` int(10) unsigned DEFAULT NULL COMMENT '商品编号',
  `name` varchar(20) NOT NULL COMMENT '热词名称',
  `url` varchar(100) DEFAULT NULL COMMENT '热词链接',
  `views` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '搜索次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开启/关闭 状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_search
-- ----------------------------
INSERT INTO `jie_search` VALUES ('1', '100001', 'iphone x', '', '1', '0');
INSERT INTO `jie_search` VALUES ('2', '100002', 'iphone 8', null, '1', '1');

-- ----------------------------
-- Table structure for jie_system
-- ----------------------------
DROP TABLE IF EXISTS `jie_system`;
CREATE TABLE `jie_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) NOT NULL COMMENT '网站标题',
  `keywords` varchar(255) NOT NULL COMMENT '网站关键词',
  `description` varchar(255) NOT NULL COMMENT '网站描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_system
-- ----------------------------

-- ----------------------------
-- Table structure for jie_type
-- ----------------------------
DROP TABLE IF EXISTS `jie_type`;
CREATE TABLE `jie_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `type_name` varchar(20) NOT NULL COMMENT '类型名称',
  `type_category` varchar(255) DEFAULT NULL COMMENT '类型分类',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开启/关闭 状态',
  `sort` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id` (`type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_type
-- ----------------------------
INSERT INTO `jie_type` VALUES ('1', '手机', '1#基本参数|2#显示屏幕|3#数码相机功能|4#主要功能|5#配件', '1', '50');
INSERT INTO `jie_type` VALUES ('2', '手机配件', '1#基本参数', '1', '50');
INSERT INTO `jie_type` VALUES ('3', '笔记本', '1#基本参数|2#处理器|3#存储设备|4#显示屏|5#显卡|6#多媒体设备|7#网络通信|8#端口|9#输入设备|10#电源描述|11#规格', '1', '50');
INSERT INTO `jie_type` VALUES ('4', '平板', '1#基本参数', '1', '50');
INSERT INTO `jie_type` VALUES ('5', '鲜花绿植', '1#基本参数', '1', '50');
INSERT INTO `jie_type` VALUES ('6', '电脑配件', '1#基本参数', '1', '50');

-- ----------------------------
-- Table structure for jie_type_attr
-- ----------------------------
DROP TABLE IF EXISTS `jie_type_attr`;
CREATE TABLE `jie_type_attr` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(20) NOT NULL COMMENT '属性名称',
  `attr_values` text COMMENT '属性可选值',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0：关闭，1：开启)',
  `attr_group_id` smallint(5) unsigned NOT NULL COMMENT '参数分组(基本参数、显示屏幕、主要功能......)',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  PRIMARY KEY (`attr_id`),
  KEY `goods_type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- ----------------------------
-- Records of jie_type_attr
-- ----------------------------
INSERT INTO `jie_type_attr` VALUES ('1', '品牌', '苹果（Apple）\r\n三星（SAMSUNG\r\n小米（MI）\r\n华为（HUAWEI）\r\nOPPO\r\nHTC\r\n魅族（MEIZU）\r\n诺基亚（NOKIA）\r\n联想（Lenovo）\r\n酷派（Coolpad）\r\n中兴（ZTE）\r\nvivo（步步高）\r\n索尼（SONY）\r\n努比亚（Nubia）\r\n金立（Gionee）\r\n朵唯（DOOV）\r\n黑莓（BlackBerry）\r\n海信(Hisense)\r\nLG\r\n其他', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('2', '价格', '0-999\r\n1000-1999\r\n2000-2999\r\n3000-3999\r\n4000-4999\r\n5000-5999\r\n6000以上', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('3', '网络制式', '移动4G（TD-LTE）\r\n联通4G（TD/FDD-LTE）\r\n电信4G（FDD-LTE）\r\n移动3G（TD-SCDMA）\r\n联通3G（WCDMA）\r\n电信3G（CDMA2000）\r\n全网通\r\n移动2G/联通2G（GSM ）\r\n双模（CDMA+GSM）\r\n双卡', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('4', '操作系统', '苹果（iOS）\r\n安卓（Android）\r\n微软（WindowsPhone）\r\n黑莓（BlackBerry OS）\r\n非智能\r\n其他\r\n', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('5', '屏幕尺寸', '3.0英寸及以下\r\n4.0-3.1英寸\r\n4.9-4.1英寸\r\n5.5-5.0英寸\r\n5.6英寸及以上', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('6', '运存RAM', '1G2G3G4G\r\n32G\r\n64G', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('7', '内存ROM', '16G32G64G128G256G', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('8', '核心数', '八核\r\n双四核\r\n六核\r\n四核+双核\r\n四核\r\n双核\r\n单核\r\n非智能\r\n', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('9', '产品特点', '彪悍性能\r\n拍照神器\r\n1080P全高清屏\r\n高端商务\r\n老人手机\r\n超长待机\r\n支持NFC\r\n女性手机\r\n三防手机', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('10', 'RAM容量', '256MB\r\n512MB\r\n768MB\r\n1GB\r\n2GB', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('11', '外观设计', '直板\r\n翻盖\r\n滑盖\r\n侧滑\r\n盖旋\r\n转屏', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('12', '主屏材质', 'AMOLED\r\nSLCD\r\nTFT\r\nASV\r\nIPS', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('13', '上市日期', '2014年\r\n2013年', '0', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('14', '其他一', '', '1', '1', '0', '1');
INSERT INTO `jie_type_attr` VALUES ('16', '品牌', '苹果（Apple）\r\n三星（SAMSUNG）\r\n小米（MI）\r\n索尼（SONY）\r\n摩仕（moshi）\r\n艾时 (AISmode)\r\n沃尤尼（VOUNI）\r\nBeats\r\n魔声（Monster）\r\n洛克（ROCK）\r\n触宝(Zupool)\r\n好贴（HODA）\r\n蓝盛（LENTION）\r\n东芝\r\n闪迪（Sandisk）\r\n羽博（Yoobao）\r\n品胜（PISEN）\r\n摩米士（MOMAX）ihavejawbone\r\n缤特力（Plantronics）\r\n捷波朗（Jabra）\r\n卡格尔（Cager）\r\nTP-LINK\r\n爱贝尔\r\n脱兔（TOTU）\r\n迪沃（devia）\r\n飞利浦（PHILIPS）\r\n耐尔金(NILLKIN)\r\n其他', '0', '0', '0', '2');
INSERT INTO `jie_type_attr` VALUES ('17', '价格', '0-49\r\n50-99\r\n100-149\r\n150-199\r\n200-499\r\n500以上\r\n', '0', '0', '0', '2');
INSERT INTO `jie_type_attr` VALUES ('18', '分类', '手机电池\r\n蓝牙耳机\r\n手机充电器\r\n手机耳机\r\n手机贴膜\r\n手机存储卡\r\n手机保护套\r\n其它配件\r\n手机维修配件\r\n数据线\r\n移动电源', '0', '0', '0', '2');
INSERT INTO `jie_type_attr` VALUES ('19', '颜色', '白色\r\n黑色\r\n红色\r\n蓝色\r\n绿色 \r\n粉红色\r\n金色\r\n银灰色', '0', '0', '0', '2');
INSERT INTO `jie_type_attr` VALUES ('20', '其他二', '', '0', '0', '0', '2');
INSERT INTO `jie_type_attr` VALUES ('21', '品牌', '苹果（Apple）\r\n联想（Lenovo）\r\n联想（ThinkPad）\r\n三星（SAMSUNG）\r\n华硕（ASUS）\r\n戴尔（DELL）\r\n宏碁（Acer）\r\n惠普（HP）\r\n技嘉（GIGABYTE）\r\n神舟（Hasee）\r\n微软(microsoft)', '0', '1', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('22', '价格', '0-2999\r\n3000-4999\r\n5000-6999\r\n7000-8999\r\n9000-10999\r\n11000以上', '0', '0', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('23', 'CPU系列', 'Intel i3\r\nIntel i5\r\nIntel i7\r\nAMD A6\r\nAMD A8\r\nAMD A10\r\n其他intel平台\r\n其他AMD平台\r\n三星专属', '0', '2', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('24', '显卡类型', '入门级独立显卡\r\n性能级独立显卡\r\n玩家发烧级独立显卡\r\n双显卡\r\n集成（核芯）显卡', '0', '5', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('25', '内存', '1G\r\n2G\r\n4G\r\n8G\r\n16G', '0', '3', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('26', '屏幕尺寸', '10.1英寸及以下\r\n11.6寸英寸\r\n12.5寸英寸\r\n13.3寸英寸\r\n14寸英寸\r\n15.6寸英寸\r\n17寸及以上', '0', '4', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('27', '机身尺寸', '刀锋轻薄（<17.5mm）\r\n便携轻薄（17.5mm – 21mm）\r\n普通轻薄（21mm-25mm）\r\n正常厚度（>25mm）\r\n', '0', '11', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('28', '硬盘容量', '256G\r\n500G\r\n600G', '0', '3', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('29', '产品定位', '二合一笔记本\r\n游戏影音本\r\n轻薄便携本\r\n商务办公本\r\n全能学生本\r\n时尚丽人本\r\nUltrathin超薄本\r\n家庭娱乐本', '0', '0', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('30', '系列', '', '0', '0', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('32', '屏幕比例', '', '0', '4', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('37', '通信技术类型', '无线网卡\r\n 蓝牙', '0', '0', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('38', '输入设备', '触摸板\r\nusb', '0', '0', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('39', '是否内置电池', '内置电池', '0', '0', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('40', '是否触摸屏', '触摸屏\r\n非触摸屏', '0', '0', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('41', '附加功能', 'HDMI接口 \r\n摄像头功能 \r\n扬声', '0', '0', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('42', '颜色', '白色\r\n黑色\r\n红色\r\n蓝色\r\n绿色 \r\n粉红色\r\n金色\r\n银灰色', '1', '0', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('43', '其他二', '', '1', '0', '0', '3');
INSERT INTO `jie_type_attr` VALUES ('44', '品牌', '苹果（Apple）\r\n三星（SAMSUNG）\r\n微软(microsoft)\r\n小米（MI）\r\n华为（HUAWEI）\r\n联想（Lenovo）\r\n酷派（Coolpad）\r\n索尼（SONY）\r\n海信(Hisense)\r\n华硕（ASUS）\r\n戴尔（DELL）\r\n昂达（ONDA）\r\n台电（Teclast）\r\n酷比魔方\r\n七彩虹（Colorfly）\r\n其他', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('45', '价格', '0-999\r\n1000-1999\r\n2000-2999\r\n3000-3999\r\n4000-4999\r\n5000以上\r\n', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('46', '主屏尺寸', '6英寸及其以下\r\n7英寸\r\n7.9英寸\r\n8英寸\r\n8.4英寸\r\n8.9英寸\r\n9.7英寸\r\n10英寸\r\n10.1英寸\r\n10.5英寸\r\n11.6英寸\r\n12.1英寸\r\n13英寸及其以上', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('47', '机身内存', '2GB\r\n4GB\r\n8GB\r\n16GB\r\n32GB\r\n64GB\r\n128GB\r\n256GB\r\n', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('48', 'CPU核芯数', '单核\r\n双核\r\n四核\r\n双四核\r\n八核\r\n', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('49', '操作系统', 'IOS系统\r\nAndroid\r\nWindows\r\nLinux', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('50', '功能特色', '3G上网\r\nWifi上网\r\n语音通话\r\nIntel 芯平板', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('51', '产品特点', '看电影不错\r\n高清2K屏\r\n玩游戏很爽\r\n系统流畅\r\n超薄美观\r\n上网速度很快\r\n超高配置\r\n软件很实用\r\n续航能力很强', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('52', '颜色', '白色\r\n黑色\r\n红色\r\n蓝色\r\n绿色 \r\n粉红色\r\n金色\r\n银灰色', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('53', '分辨率', '1280x800\r\n1920x1080', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('54', 'CPU主频', '', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('55', '处理器型号', '', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('56', '后置摄像头像素', '500万', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('57', '接口类型', 'USB 网口 \r\nHDMI VGA \r\n音频输USB \r\nSIM卡 \r\nOTG', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('58', '热门功能', '蓝牙电话 \r\n重力感应 \r\n光线感应 \r\n蓝牙', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('59', '上市时间', '2013年\r\n2014年', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('60', '其他一', '', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('61', '其他二', '', '0', '0', '0', '4');
INSERT INTO `jie_type_attr` VALUES ('62', '品牌', '爱唯一\r\n中礼\r\n维纳斯\r\n如水\r\n諾誓（roseonly）\r\n钟爱\r\n花之苑\r\n朵美\r\n乐之恋\r\n红豆\r\n扣扣（koukou）\r\n爱的曼语\r\n罗曼蒂克\r\n爱诺啦\r\n兰之馨', '0', '0', '0', '5');
INSERT INTO `jie_type_attr` VALUES ('63', '价格', '0-199\r\n200-399\r\n400-599\r\n600-899\r\n900-2099\r\n2100-3999\r\n4000以上', '0', '0', '1', '5');
INSERT INTO `jie_type_attr` VALUES ('64', '类别', '鲜花\r\n卡通花束\r\n花篮\r\n绿植\r\n其他', '0', '0', '2', '5');
INSERT INTO `jie_type_attr` VALUES ('65', '花材', '玫瑰\r\n康乃馨\r\n百合\r\n扶郎\r\n郁金香\r\n卡通\r\n混搭\r\n花渡\r\n贝蕾丝\r\n哲尼柯\r\n其他', '0', '0', '3', '5');
INSERT INTO `jie_type_attr` VALUES ('66', '枝数', '1枝\r\n9枝\r\n11枝\r\n12枝\r\n19枝\r\n33枝\r\n99枝\r\n999枝\r\n其他', '0', '0', '4', '5');
INSERT INTO `jie_type_attr` VALUES ('67', '场景', '商务\r\n会议 \r\n祝福\r\n恋情\r\n生日\r\n婚庆\r\n探望\r\n求婚 \r\n友情 \r\n周年纪念 \r\n道歉 \r\n家居\r\n新生儿礼品\r\n其他', '0', '0', '5', '5');
INSERT INTO `jie_type_attr` VALUES ('68', '对象', '恋人\r\n朋友\r\n客户\r\n老师\r\n长辈\r\n病人\r\n其他', '0', '0', '6', '5');
INSERT INTO `jie_type_attr` VALUES ('69', '节日', '西洋情人节（2月14日）\r\n三八妇女节（3月8日）\r\n白色情人节（3月14日）\r\n清明节（4月4日）\r\n母亲节（5月的第2个星期日）\r\n父亲节（6月的第三个星期日）\r\n七夕情人节（7月初7）\r\n教师节（9月10日）\r\n中秋节（农历8月15）\r\n圣诞节（12月15日）\r\n元旦（1月1日）\r\n春节', '0', '0', '3', '5');

-- ----------------------------
-- Table structure for jie_type_attr_list
-- ----------------------------
DROP TABLE IF EXISTS `jie_type_attr_list`;
CREATE TABLE `jie_type_attr_list` (
  `id` varchar(64) NOT NULL COMMENT '商品属性列表id',
  `attr_value` varchar(100) NOT NULL COMMENT '商品属性列表值',
  `goods_sn` int(10) unsigned NOT NULL COMMENT '商品编号',
  `attr_id` int(10) unsigned NOT NULL COMMENT '商品属性id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attr_list_id` (`id`),
  KEY `goods_sn` (`goods_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_type_attr_list
-- ----------------------------
INSERT INTO `jie_type_attr_list` VALUES ('283c9f5baaab429ba030b359c601a69f', '2014年', '100004', '13');
INSERT INTO `jie_type_attr_list` VALUES ('346aea2f432341bba408824ef5ffa164', '0-999', '100004', '2');
INSERT INTO `jie_type_attr_list` VALUES ('43f54bc3ac514b71bd5e16f0281f174f', '苹果（Apple）', '100004', '1');

-- ----------------------------
-- Table structure for jie_user
-- ----------------------------
DROP TABLE IF EXISTS `jie_user`;
CREATE TABLE `jie_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '系统id',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `username` varchar(20) NOT NULL COMMENT '系统用户',
  `password` char(32) NOT NULL COMMENT '密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐值',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `ip` varchar(20) DEFAULT NULL COMMENT '登录ip',
  `is_super` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '超级管理者：是/否 ',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：启用=1/停用=2',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`username`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_user
-- ----------------------------
INSERT INTO `jie_user` VALUES ('1', '1', 'root', '123456', null, 'cc@sina.com', '15777777777', null, '1', '1', '2019-06-25 15:19:02', null);
INSERT INTO `jie_user` VALUES ('2', '2', '刘备', '123456', null, 'liubei@sina.com', '13777777777', null, '1', '2', '2019-03-26 11:25:20', null);
INSERT INTO `jie_user` VALUES ('5', '2', '张小帅', 'admin123', '', 'zxs@qq.com', '13999999999', '', '1', '1', '2019-06-06 08:00:00', null);
INSERT INTO `jie_user` VALUES ('9', '2', '张小帅222', 'admin123', '', '222@qq.com', '13999999222', '', '1', '1', '2019-06-06 08:00:00', null);
INSERT INTO `jie_user` VALUES ('24', '2', '张小帅333', 'admin22', '', '3@sohu.com', '13888888888', '', '0', '1', '2019-06-21 10:09:17', null);
INSERT INTO `jie_user` VALUES ('44', '2', '张小帅666', 'admin333', '', '666@sohu.com', '13888555666', '', '1', '1', '2019-07-01 11:11:49', null);
INSERT INTO `jie_user` VALUES ('46', '2', '张小帅777', 'admin333', '', '777@sohu.com', '13888555777', '', '1', '1', '2019-07-01 11:14:34', null);

-- ----------------------------
-- Table structure for jie_zone
-- ----------------------------
DROP TABLE IF EXISTS `jie_zone`;
CREATE TABLE `jie_zone` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `area_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区id',
  `area_name` varchar(100) NOT NULL DEFAULT '' COMMENT '地区名称',
  `area_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '地区等级',
  `pid` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  PRIMARY KEY (`id`),
  KEY `area_id` (`area_id`),
  KEY `area_type` (`area_type`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3327 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jie_zone
-- ----------------------------
INSERT INTO `jie_zone` VALUES ('1', '110000', '北京市', '0', '0');
INSERT INTO `jie_zone` VALUES ('2', '110101', '东城区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('3', '110102', '西城区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('4', '110105', '朝阳区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('5', '110106', '丰台区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('6', '110107', '石景山区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('7', '110108', '海淀区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('8', '110109', '门头沟区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('9', '110111', '房山区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('10', '110112', '通州区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('11', '110113', '顺义区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('12', '110114', '昌平区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('13', '110115', '大兴区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('14', '110116', '怀柔区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('15', '110117', '平谷区', '2', '110000');
INSERT INTO `jie_zone` VALUES ('16', '110228', '密云县', '2', '110000');
INSERT INTO `jie_zone` VALUES ('17', '110229', '延庆县', '2', '110000');
INSERT INTO `jie_zone` VALUES ('18', '120000', '天津市', '0', '0');
INSERT INTO `jie_zone` VALUES ('19', '120101', '和平区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('20', '120102', '河东区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('21', '120103', '河西区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('22', '120104', '南开区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('23', '120105', '河北区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('24', '120106', '红桥区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('25', '120110', '东丽区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('26', '120111', '西青区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('27', '120112', '津南区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('28', '120113', '北辰区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('29', '120114', '武清区', '2', '120100');
INSERT INTO `jie_zone` VALUES ('30', '120115', '宝坻区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('31', '120116', '滨海新区', '2', '120000');
INSERT INTO `jie_zone` VALUES ('32', '120221', '宁河县', '2', '120000');
INSERT INTO `jie_zone` VALUES ('33', '120223', '静海县', '2', '120000');
INSERT INTO `jie_zone` VALUES ('34', '120225', '蓟县', '2', '120000');
INSERT INTO `jie_zone` VALUES ('35', '130000', '河北省', '0', '0');
INSERT INTO `jie_zone` VALUES ('36', '130100', '石家庄市', '1', '130000');
INSERT INTO `jie_zone` VALUES ('37', '130102', '长安区', '2', '130100');
INSERT INTO `jie_zone` VALUES ('38', '130104', '桥西区', '2', '130100');
INSERT INTO `jie_zone` VALUES ('39', '130105', '新华区', '2', '130100');
INSERT INTO `jie_zone` VALUES ('40', '130107', '井陉矿区', '2', '130100');
INSERT INTO `jie_zone` VALUES ('41', '130108', '裕华区', '2', '130100');
INSERT INTO `jie_zone` VALUES ('42', '130109', '藁城区', '2', '130100');
INSERT INTO `jie_zone` VALUES ('43', '130110', '鹿泉区', '2', '130100');
INSERT INTO `jie_zone` VALUES ('44', '130111', '栾城区', '2', '130100');
INSERT INTO `jie_zone` VALUES ('45', '130121', '井陉县', '2', '130100');
INSERT INTO `jie_zone` VALUES ('46', '130123', '正定县', '2', '130100');
INSERT INTO `jie_zone` VALUES ('47', '130125', '行唐县', '2', '130100');
INSERT INTO `jie_zone` VALUES ('48', '130126', '灵寿县', '2', '130100');
INSERT INTO `jie_zone` VALUES ('49', '130127', '高邑县', '2', '130100');
INSERT INTO `jie_zone` VALUES ('50', '130128', '深泽县', '2', '130100');
INSERT INTO `jie_zone` VALUES ('51', '130129', '赞皇县', '2', '130100');
INSERT INTO `jie_zone` VALUES ('52', '130130', '无极县', '2', '130100');
INSERT INTO `jie_zone` VALUES ('53', '130131', '平山县', '2', '130100');
INSERT INTO `jie_zone` VALUES ('54', '130132', '元氏县', '2', '130100');
INSERT INTO `jie_zone` VALUES ('55', '130133', '赵县', '2', '130100');
INSERT INTO `jie_zone` VALUES ('56', '130183', '晋州市', '2', '130100');
INSERT INTO `jie_zone` VALUES ('57', '130184', '新乐市', '2', '130100');
INSERT INTO `jie_zone` VALUES ('58', '130200', '唐山市', '1', '130000');
INSERT INTO `jie_zone` VALUES ('59', '130202', '路南区', '2', '130200');
INSERT INTO `jie_zone` VALUES ('60', '130203', '路北区', '2', '130200');
INSERT INTO `jie_zone` VALUES ('61', '130204', '古冶区', '2', '130200');
INSERT INTO `jie_zone` VALUES ('62', '130205', '开平区', '2', '130200');
INSERT INTO `jie_zone` VALUES ('63', '130207', '丰南区', '2', '130200');
INSERT INTO `jie_zone` VALUES ('64', '130208', '丰润区', '2', '130200');
INSERT INTO `jie_zone` VALUES ('65', '130209', '曹妃甸区', '2', '130200');
INSERT INTO `jie_zone` VALUES ('66', '130223', '滦县', '2', '130200');
INSERT INTO `jie_zone` VALUES ('67', '130224', '滦南县', '2', '130200');
INSERT INTO `jie_zone` VALUES ('68', '130225', '乐亭县', '2', '130200');
INSERT INTO `jie_zone` VALUES ('69', '130227', '迁西县', '2', '130200');
INSERT INTO `jie_zone` VALUES ('70', '130229', '玉田县', '2', '130200');
INSERT INTO `jie_zone` VALUES ('71', '130281', '遵化市', '2', '130200');
INSERT INTO `jie_zone` VALUES ('72', '130283', '迁安市', '2', '130200');
INSERT INTO `jie_zone` VALUES ('73', '130300', '秦皇岛市', '1', '130000');
INSERT INTO `jie_zone` VALUES ('74', '130302', '海港区', '2', '130300');
INSERT INTO `jie_zone` VALUES ('75', '130303', '山海关区', '2', '130300');
INSERT INTO `jie_zone` VALUES ('76', '130304', '北戴河区', '2', '130300');
INSERT INTO `jie_zone` VALUES ('77', '130321', '青龙满族自治县', '2', '130300');
INSERT INTO `jie_zone` VALUES ('78', '130322', '昌黎县', '2', '130300');
INSERT INTO `jie_zone` VALUES ('79', '130323', '抚宁县', '2', '130300');
INSERT INTO `jie_zone` VALUES ('80', '130324', '卢龙县', '2', '130300');
INSERT INTO `jie_zone` VALUES ('81', '130400', '邯郸市', '1', '130000');
INSERT INTO `jie_zone` VALUES ('82', '130402', '邯山区', '2', '130400');
INSERT INTO `jie_zone` VALUES ('83', '130403', '丛台区', '2', '130400');
INSERT INTO `jie_zone` VALUES ('84', '130404', '复兴区', '2', '130400');
INSERT INTO `jie_zone` VALUES ('85', '130406', '峰峰矿区', '2', '130400');
INSERT INTO `jie_zone` VALUES ('86', '130421', '邯郸县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('87', '130423', '临漳县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('88', '130424', '成安县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('89', '130425', '大名县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('90', '130426', '涉县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('91', '130427', '磁县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('92', '130428', '肥乡县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('93', '130429', '永年县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('94', '130430', '邱县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('95', '130431', '鸡泽县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('96', '130432', '广平县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('97', '130433', '馆陶县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('98', '130434', '魏县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('99', '130435', '曲周县', '2', '130400');
INSERT INTO `jie_zone` VALUES ('100', '130481', '武安市', '2', '130400');
INSERT INTO `jie_zone` VALUES ('101', '130500', '邢台市', '1', '130000');
INSERT INTO `jie_zone` VALUES ('102', '130502', '桥东区', '2', '130500');
INSERT INTO `jie_zone` VALUES ('103', '130503', '桥西区', '2', '130500');
INSERT INTO `jie_zone` VALUES ('104', '130521', '邢台县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('105', '130522', '临城县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('106', '130523', '内丘县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('107', '130524', '柏乡县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('108', '130525', '隆尧县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('109', '130526', '任县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('110', '130527', '南和县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('111', '130528', '宁晋县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('112', '130529', '巨鹿县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('113', '130530', '新河县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('114', '130531', '广宗县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('115', '130532', '平乡县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('116', '130533', '威县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('117', '130534', '清河县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('118', '130535', '临西县', '2', '130500');
INSERT INTO `jie_zone` VALUES ('119', '130581', '南宫市', '2', '130500');
INSERT INTO `jie_zone` VALUES ('120', '130582', '沙河市', '2', '130500');
INSERT INTO `jie_zone` VALUES ('121', '130600', '保定市', '1', '130000');
INSERT INTO `jie_zone` VALUES ('122', '130602', '新市区', '2', '130600');
INSERT INTO `jie_zone` VALUES ('123', '130603', '北市区', '2', '130600');
INSERT INTO `jie_zone` VALUES ('124', '130604', '南市区', '2', '130600');
INSERT INTO `jie_zone` VALUES ('125', '130621', '满城县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('126', '130622', '清苑县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('127', '130623', '涞水县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('128', '130624', '阜平县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('129', '130625', '徐水县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('130', '130626', '定兴县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('131', '130627', '唐县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('132', '130628', '高阳县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('133', '130629', '容城县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('134', '130630', '涞源县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('135', '130631', '望都县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('136', '130632', '安新县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('137', '130633', '易县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('138', '130634', '曲阳县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('139', '130635', '蠡县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('140', '130636', '顺平县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('141', '130637', '博野县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('142', '130638', '雄县', '2', '130600');
INSERT INTO `jie_zone` VALUES ('143', '130681', '涿州市', '2', '130600');
INSERT INTO `jie_zone` VALUES ('144', '130683', '安国市', '2', '130600');
INSERT INTO `jie_zone` VALUES ('145', '130684', '高碑店市', '2', '130600');
INSERT INTO `jie_zone` VALUES ('146', '130700', '张家口市', '1', '130000');
INSERT INTO `jie_zone` VALUES ('147', '130702', '桥东区', '2', '130700');
INSERT INTO `jie_zone` VALUES ('148', '130703', '桥西区', '2', '130700');
INSERT INTO `jie_zone` VALUES ('149', '130705', '宣化区', '2', '130700');
INSERT INTO `jie_zone` VALUES ('150', '130706', '下花园区', '2', '130700');
INSERT INTO `jie_zone` VALUES ('151', '130721', '宣化县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('152', '130722', '张北县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('153', '130723', '康保县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('154', '130724', '沽源县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('155', '130725', '尚义县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('156', '130726', '蔚县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('157', '130727', '阳原县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('158', '130728', '怀安县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('159', '130729', '万全县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('160', '130730', '怀来县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('161', '130731', '涿鹿县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('162', '130732', '赤城县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('163', '130733', '崇礼县', '2', '130700');
INSERT INTO `jie_zone` VALUES ('164', '130800', '承德市', '1', '130000');
INSERT INTO `jie_zone` VALUES ('165', '130802', '双桥区', '2', '130800');
INSERT INTO `jie_zone` VALUES ('166', '130803', '双滦区', '2', '130800');
INSERT INTO `jie_zone` VALUES ('167', '130804', '鹰手营子矿区', '2', '130800');
INSERT INTO `jie_zone` VALUES ('168', '130821', '承德县', '2', '130800');
INSERT INTO `jie_zone` VALUES ('169', '130822', '兴隆县', '2', '130800');
INSERT INTO `jie_zone` VALUES ('170', '130823', '平泉县', '2', '130800');
INSERT INTO `jie_zone` VALUES ('171', '130824', '滦平县', '2', '130800');
INSERT INTO `jie_zone` VALUES ('172', '130825', '隆化县', '2', '130800');
INSERT INTO `jie_zone` VALUES ('173', '130826', '丰宁满族自治县', '2', '130800');
INSERT INTO `jie_zone` VALUES ('174', '130827', '宽城满族自治县', '2', '130800');
INSERT INTO `jie_zone` VALUES ('175', '130828', '围场满族蒙古族自治县', '2', '130800');
INSERT INTO `jie_zone` VALUES ('176', '130900', '沧州市', '1', '130000');
INSERT INTO `jie_zone` VALUES ('177', '130902', '新华区', '2', '130900');
INSERT INTO `jie_zone` VALUES ('178', '130903', '运河区', '2', '130900');
INSERT INTO `jie_zone` VALUES ('179', '130921', '沧县', '2', '130900');
INSERT INTO `jie_zone` VALUES ('180', '130922', '青县', '2', '130900');
INSERT INTO `jie_zone` VALUES ('181', '130923', '东光县', '2', '130900');
INSERT INTO `jie_zone` VALUES ('182', '130924', '海兴县', '2', '130900');
INSERT INTO `jie_zone` VALUES ('183', '130925', '盐山县', '2', '130900');
INSERT INTO `jie_zone` VALUES ('184', '130926', '肃宁县', '2', '130900');
INSERT INTO `jie_zone` VALUES ('185', '130927', '南皮县', '2', '130900');
INSERT INTO `jie_zone` VALUES ('186', '130928', '吴桥县', '2', '130900');
INSERT INTO `jie_zone` VALUES ('187', '130929', '献县', '2', '130900');
INSERT INTO `jie_zone` VALUES ('188', '130930', '孟村回族自治县', '2', '130900');
INSERT INTO `jie_zone` VALUES ('189', '130981', '泊头市', '2', '130900');
INSERT INTO `jie_zone` VALUES ('190', '130982', '任丘市', '2', '130900');
INSERT INTO `jie_zone` VALUES ('191', '130983', '黄骅市', '2', '130900');
INSERT INTO `jie_zone` VALUES ('192', '130984', '河间市', '2', '130900');
INSERT INTO `jie_zone` VALUES ('193', '131000', '廊坊市', '1', '130000');
INSERT INTO `jie_zone` VALUES ('194', '131002', '安次区', '2', '131000');
INSERT INTO `jie_zone` VALUES ('195', '131003', '广阳区', '2', '131000');
INSERT INTO `jie_zone` VALUES ('196', '131022', '固安县', '2', '131000');
INSERT INTO `jie_zone` VALUES ('197', '131023', '永清县', '2', '131000');
INSERT INTO `jie_zone` VALUES ('198', '131024', '香河县', '2', '131000');
INSERT INTO `jie_zone` VALUES ('199', '131025', '大城县', '2', '131000');
INSERT INTO `jie_zone` VALUES ('200', '131026', '文安县', '2', '131000');
INSERT INTO `jie_zone` VALUES ('201', '131028', '大厂回族自治县', '2', '131000');
INSERT INTO `jie_zone` VALUES ('202', '131081', '霸州市', '2', '131000');
INSERT INTO `jie_zone` VALUES ('203', '131082', '三河市', '2', '131000');
INSERT INTO `jie_zone` VALUES ('204', '131100', '衡水市', '1', '130000');
INSERT INTO `jie_zone` VALUES ('205', '131102', '桃城区', '2', '131100');
INSERT INTO `jie_zone` VALUES ('206', '131121', '枣强县', '2', '131100');
INSERT INTO `jie_zone` VALUES ('207', '131122', '武邑县', '2', '131100');
INSERT INTO `jie_zone` VALUES ('208', '131123', '武强县', '2', '131100');
INSERT INTO `jie_zone` VALUES ('209', '131124', '饶阳县', '2', '131100');
INSERT INTO `jie_zone` VALUES ('210', '131125', '安平县', '2', '131100');
INSERT INTO `jie_zone` VALUES ('211', '131126', '故城县', '2', '131100');
INSERT INTO `jie_zone` VALUES ('212', '131127', '景县', '2', '131100');
INSERT INTO `jie_zone` VALUES ('213', '131128', '阜城县', '2', '131100');
INSERT INTO `jie_zone` VALUES ('214', '131181', '冀州市', '2', '131100');
INSERT INTO `jie_zone` VALUES ('215', '131182', '深州市', '2', '131100');
INSERT INTO `jie_zone` VALUES ('216', '139000', '省直辖县级行政区划', '1', '130000');
INSERT INTO `jie_zone` VALUES ('217', '139001', '定州市', '2', '139000');
INSERT INTO `jie_zone` VALUES ('218', '139002', '辛集市', '2', '139000');
INSERT INTO `jie_zone` VALUES ('219', '140000', '山西省', '0', '0');
INSERT INTO `jie_zone` VALUES ('220', '140100', '太原市', '1', '140000');
INSERT INTO `jie_zone` VALUES ('221', '140105', '小店区', '2', '140100');
INSERT INTO `jie_zone` VALUES ('222', '140106', '迎泽区', '2', '140100');
INSERT INTO `jie_zone` VALUES ('223', '140107', '杏花岭区', '2', '140100');
INSERT INTO `jie_zone` VALUES ('224', '140108', '尖草坪区', '2', '140100');
INSERT INTO `jie_zone` VALUES ('225', '140109', '万柏林区', '2', '140100');
INSERT INTO `jie_zone` VALUES ('226', '140110', '晋源区', '2', '140100');
INSERT INTO `jie_zone` VALUES ('227', '140121', '清徐县', '2', '140100');
INSERT INTO `jie_zone` VALUES ('228', '140122', '阳曲县', '2', '140100');
INSERT INTO `jie_zone` VALUES ('229', '140123', '娄烦县', '2', '140100');
INSERT INTO `jie_zone` VALUES ('230', '140181', '古交市', '2', '140100');
INSERT INTO `jie_zone` VALUES ('231', '140200', '大同市', '1', '140000');
INSERT INTO `jie_zone` VALUES ('232', '140202', '城区', '2', '140200');
INSERT INTO `jie_zone` VALUES ('233', '140203', '矿区', '2', '140200');
INSERT INTO `jie_zone` VALUES ('234', '140211', '南郊区', '2', '140200');
INSERT INTO `jie_zone` VALUES ('235', '140212', '新荣区', '2', '140200');
INSERT INTO `jie_zone` VALUES ('236', '140221', '阳高县', '2', '140200');
INSERT INTO `jie_zone` VALUES ('237', '140222', '天镇县', '2', '140200');
INSERT INTO `jie_zone` VALUES ('238', '140223', '广灵县', '2', '140200');
INSERT INTO `jie_zone` VALUES ('239', '140224', '灵丘县', '2', '140200');
INSERT INTO `jie_zone` VALUES ('240', '140225', '浑源县', '2', '140200');
INSERT INTO `jie_zone` VALUES ('241', '140226', '左云县', '2', '140200');
INSERT INTO `jie_zone` VALUES ('242', '140227', '大同县', '2', '140200');
INSERT INTO `jie_zone` VALUES ('243', '140300', '阳泉市', '1', '140000');
INSERT INTO `jie_zone` VALUES ('244', '140302', '城区', '2', '140300');
INSERT INTO `jie_zone` VALUES ('245', '140303', '矿区', '2', '140300');
INSERT INTO `jie_zone` VALUES ('246', '140311', '郊区', '2', '140300');
INSERT INTO `jie_zone` VALUES ('247', '140321', '平定县', '2', '140300');
INSERT INTO `jie_zone` VALUES ('248', '140322', '盂县', '2', '140300');
INSERT INTO `jie_zone` VALUES ('249', '140400', '长治市', '1', '140000');
INSERT INTO `jie_zone` VALUES ('250', '140402', '城区', '2', '140400');
INSERT INTO `jie_zone` VALUES ('251', '140411', '郊区', '2', '140400');
INSERT INTO `jie_zone` VALUES ('252', '140421', '长治县', '2', '140400');
INSERT INTO `jie_zone` VALUES ('253', '140423', '襄垣县', '2', '140400');
INSERT INTO `jie_zone` VALUES ('254', '140424', '屯留县', '2', '140400');
INSERT INTO `jie_zone` VALUES ('255', '140425', '平顺县', '2', '140400');
INSERT INTO `jie_zone` VALUES ('256', '140426', '黎城县', '2', '140400');
INSERT INTO `jie_zone` VALUES ('257', '140427', '壶关县', '2', '140400');
INSERT INTO `jie_zone` VALUES ('258', '140428', '长子县', '2', '140400');
INSERT INTO `jie_zone` VALUES ('259', '140429', '武乡县', '2', '140400');
INSERT INTO `jie_zone` VALUES ('260', '140430', '沁县', '2', '140400');
INSERT INTO `jie_zone` VALUES ('261', '140431', '沁源县', '2', '140400');
INSERT INTO `jie_zone` VALUES ('262', '140481', '潞城市', '2', '140400');
INSERT INTO `jie_zone` VALUES ('263', '140500', '晋城市', '1', '140000');
INSERT INTO `jie_zone` VALUES ('264', '140502', '城区', '2', '140500');
INSERT INTO `jie_zone` VALUES ('265', '140521', '沁水县', '2', '140500');
INSERT INTO `jie_zone` VALUES ('266', '140522', '阳城县', '2', '140500');
INSERT INTO `jie_zone` VALUES ('267', '140524', '陵川县', '2', '140500');
INSERT INTO `jie_zone` VALUES ('268', '140525', '泽州县', '2', '140500');
INSERT INTO `jie_zone` VALUES ('269', '140581', '高平市', '2', '140500');
INSERT INTO `jie_zone` VALUES ('270', '140600', '朔州市', '1', '140000');
INSERT INTO `jie_zone` VALUES ('271', '140602', '朔城区', '2', '140600');
INSERT INTO `jie_zone` VALUES ('272', '140603', '平鲁区', '2', '140600');
INSERT INTO `jie_zone` VALUES ('273', '140621', '山阴县', '2', '140600');
INSERT INTO `jie_zone` VALUES ('274', '140622', '应县', '2', '140600');
INSERT INTO `jie_zone` VALUES ('275', '140623', '右玉县', '2', '140600');
INSERT INTO `jie_zone` VALUES ('276', '140624', '怀仁县', '2', '140600');
INSERT INTO `jie_zone` VALUES ('277', '140700', '晋中市', '1', '140000');
INSERT INTO `jie_zone` VALUES ('278', '140702', '榆次区', '2', '140700');
INSERT INTO `jie_zone` VALUES ('279', '140721', '榆社县', '2', '140700');
INSERT INTO `jie_zone` VALUES ('280', '140722', '左权县', '2', '140700');
INSERT INTO `jie_zone` VALUES ('281', '140723', '和顺县', '2', '140700');
INSERT INTO `jie_zone` VALUES ('282', '140724', '昔阳县', '2', '140700');
INSERT INTO `jie_zone` VALUES ('283', '140725', '寿阳县', '2', '140700');
INSERT INTO `jie_zone` VALUES ('284', '140726', '太谷县', '2', '140700');
INSERT INTO `jie_zone` VALUES ('285', '140727', '祁县', '2', '140700');
INSERT INTO `jie_zone` VALUES ('286', '140728', '平遥县', '2', '140700');
INSERT INTO `jie_zone` VALUES ('287', '140729', '灵石县', '2', '140700');
INSERT INTO `jie_zone` VALUES ('288', '140781', '介休市', '2', '140700');
INSERT INTO `jie_zone` VALUES ('289', '140800', '运城市', '1', '140000');
INSERT INTO `jie_zone` VALUES ('290', '140802', '盐湖区', '2', '140800');
INSERT INTO `jie_zone` VALUES ('291', '140821', '临猗县', '2', '140800');
INSERT INTO `jie_zone` VALUES ('292', '140822', '万荣县', '2', '140800');
INSERT INTO `jie_zone` VALUES ('293', '140823', '闻喜县', '2', '140800');
INSERT INTO `jie_zone` VALUES ('294', '140824', '稷山县', '2', '140800');
INSERT INTO `jie_zone` VALUES ('295', '140825', '新绛县', '2', '140800');
INSERT INTO `jie_zone` VALUES ('296', '140826', '绛县', '2', '140800');
INSERT INTO `jie_zone` VALUES ('297', '140827', '垣曲县', '2', '140800');
INSERT INTO `jie_zone` VALUES ('298', '140828', '夏县', '2', '140800');
INSERT INTO `jie_zone` VALUES ('299', '140829', '平陆县', '2', '140800');
INSERT INTO `jie_zone` VALUES ('300', '140830', '芮城县', '2', '140800');
INSERT INTO `jie_zone` VALUES ('301', '140881', '永济市', '2', '140800');
INSERT INTO `jie_zone` VALUES ('302', '140882', '河津市', '2', '140800');
INSERT INTO `jie_zone` VALUES ('303', '140900', '忻州市', '1', '140000');
INSERT INTO `jie_zone` VALUES ('304', '140902', '忻府区', '2', '140900');
INSERT INTO `jie_zone` VALUES ('305', '140921', '定襄县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('306', '140922', '五台县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('307', '140923', '代县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('308', '140924', '繁峙县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('309', '140925', '宁武县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('310', '140926', '静乐县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('311', '140927', '神池县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('312', '140928', '五寨县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('313', '140929', '岢岚县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('314', '140930', '河曲县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('315', '140931', '保德县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('316', '140932', '偏关县', '2', '140900');
INSERT INTO `jie_zone` VALUES ('317', '140981', '原平市', '2', '140900');
INSERT INTO `jie_zone` VALUES ('318', '141000', '临汾市', '1', '140000');
INSERT INTO `jie_zone` VALUES ('319', '141002', '尧都区', '2', '141000');
INSERT INTO `jie_zone` VALUES ('320', '141021', '曲沃县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('321', '141022', '翼城县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('322', '141023', '襄汾县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('323', '141024', '洪洞县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('324', '141025', '古县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('325', '141026', '安泽县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('326', '141027', '浮山县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('327', '141028', '吉县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('328', '141029', '乡宁县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('329', '141030', '大宁县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('330', '141031', '隰县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('331', '141032', '永和县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('332', '141033', '蒲县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('333', '141034', '汾西县', '2', '141000');
INSERT INTO `jie_zone` VALUES ('334', '141081', '侯马市', '2', '141000');
INSERT INTO `jie_zone` VALUES ('335', '141082', '霍州市', '2', '141000');
INSERT INTO `jie_zone` VALUES ('336', '141100', '吕梁市', '1', '140000');
INSERT INTO `jie_zone` VALUES ('337', '141102', '离石区', '2', '141100');
INSERT INTO `jie_zone` VALUES ('338', '141121', '文水县', '2', '141100');
INSERT INTO `jie_zone` VALUES ('339', '141122', '交城县', '2', '141100');
INSERT INTO `jie_zone` VALUES ('340', '141123', '兴县', '2', '141100');
INSERT INTO `jie_zone` VALUES ('341', '141124', '临县', '2', '141100');
INSERT INTO `jie_zone` VALUES ('342', '141125', '柳林县', '2', '141100');
INSERT INTO `jie_zone` VALUES ('343', '141126', '石楼县', '2', '141100');
INSERT INTO `jie_zone` VALUES ('344', '141127', '岚县', '2', '141100');
INSERT INTO `jie_zone` VALUES ('345', '141128', '方山县', '2', '141100');
INSERT INTO `jie_zone` VALUES ('346', '141129', '中阳县', '2', '141100');
INSERT INTO `jie_zone` VALUES ('347', '141130', '交口县', '2', '141100');
INSERT INTO `jie_zone` VALUES ('348', '141181', '孝义市', '2', '141100');
INSERT INTO `jie_zone` VALUES ('349', '141182', '汾阳市', '2', '141100');
INSERT INTO `jie_zone` VALUES ('350', '150000', '内蒙古自治区', '0', '0');
INSERT INTO `jie_zone` VALUES ('351', '150100', '呼和浩特市', '1', '150000');
INSERT INTO `jie_zone` VALUES ('352', '150102', '新城区', '2', '150100');
INSERT INTO `jie_zone` VALUES ('353', '150103', '回民区', '2', '150100');
INSERT INTO `jie_zone` VALUES ('354', '150104', '玉泉区', '2', '150100');
INSERT INTO `jie_zone` VALUES ('355', '150105', '赛罕区', '2', '150100');
INSERT INTO `jie_zone` VALUES ('356', '150121', '土默特左旗', '2', '150100');
INSERT INTO `jie_zone` VALUES ('357', '150122', '托克托县', '2', '150100');
INSERT INTO `jie_zone` VALUES ('358', '150123', '和林格尔县', '2', '150100');
INSERT INTO `jie_zone` VALUES ('359', '150124', '清水河县', '2', '150100');
INSERT INTO `jie_zone` VALUES ('360', '150125', '武川县', '2', '150100');
INSERT INTO `jie_zone` VALUES ('361', '150200', '包头市', '1', '150000');
INSERT INTO `jie_zone` VALUES ('362', '150202', '东河区', '2', '150200');
INSERT INTO `jie_zone` VALUES ('363', '150203', '昆都仑区', '2', '150200');
INSERT INTO `jie_zone` VALUES ('364', '150204', '青山区', '2', '150200');
INSERT INTO `jie_zone` VALUES ('365', '150205', '石拐区', '2', '150200');
INSERT INTO `jie_zone` VALUES ('366', '150206', '白云鄂博矿区', '2', '150200');
INSERT INTO `jie_zone` VALUES ('367', '150207', '九原区', '2', '150200');
INSERT INTO `jie_zone` VALUES ('368', '150221', '土默特右旗', '2', '150200');
INSERT INTO `jie_zone` VALUES ('369', '150222', '固阳县', '2', '150200');
INSERT INTO `jie_zone` VALUES ('370', '150223', '达尔罕茂明安联合旗', '2', '150200');
INSERT INTO `jie_zone` VALUES ('371', '150300', '乌海市', '1', '150000');
INSERT INTO `jie_zone` VALUES ('372', '150302', '海勃湾区', '2', '150300');
INSERT INTO `jie_zone` VALUES ('373', '150303', '海南区', '2', '150300');
INSERT INTO `jie_zone` VALUES ('374', '150304', '乌达区', '2', '150300');
INSERT INTO `jie_zone` VALUES ('375', '150400', '赤峰市', '1', '150000');
INSERT INTO `jie_zone` VALUES ('376', '150402', '红山区', '2', '150400');
INSERT INTO `jie_zone` VALUES ('377', '150403', '元宝山区', '2', '150400');
INSERT INTO `jie_zone` VALUES ('378', '150404', '松山区', '2', '150400');
INSERT INTO `jie_zone` VALUES ('379', '150421', '阿鲁科尔沁旗', '2', '150400');
INSERT INTO `jie_zone` VALUES ('380', '150422', '巴林左旗', '2', '150400');
INSERT INTO `jie_zone` VALUES ('381', '150423', '巴林右旗', '2', '150400');
INSERT INTO `jie_zone` VALUES ('382', '150424', '林西县', '2', '150400');
INSERT INTO `jie_zone` VALUES ('383', '150425', '克什克腾旗', '2', '150400');
INSERT INTO `jie_zone` VALUES ('384', '150426', '翁牛特旗', '2', '150400');
INSERT INTO `jie_zone` VALUES ('385', '150428', '喀喇沁旗', '2', '150400');
INSERT INTO `jie_zone` VALUES ('386', '150429', '宁城县', '2', '150400');
INSERT INTO `jie_zone` VALUES ('387', '150430', '敖汉旗', '2', '150400');
INSERT INTO `jie_zone` VALUES ('388', '150500', '通辽市', '1', '150000');
INSERT INTO `jie_zone` VALUES ('389', '150502', '科尔沁区', '2', '150500');
INSERT INTO `jie_zone` VALUES ('390', '150521', '科尔沁左翼中旗', '2', '150500');
INSERT INTO `jie_zone` VALUES ('391', '150522', '科尔沁左翼后旗', '2', '150500');
INSERT INTO `jie_zone` VALUES ('392', '150523', '开鲁县', '2', '150500');
INSERT INTO `jie_zone` VALUES ('393', '150524', '库伦旗', '2', '150500');
INSERT INTO `jie_zone` VALUES ('394', '150525', '奈曼旗', '2', '150500');
INSERT INTO `jie_zone` VALUES ('395', '150526', '扎鲁特旗', '2', '150500');
INSERT INTO `jie_zone` VALUES ('396', '150581', '霍林郭勒市', '2', '150500');
INSERT INTO `jie_zone` VALUES ('397', '150600', '鄂尔多斯市', '1', '150000');
INSERT INTO `jie_zone` VALUES ('398', '150602', '东胜区', '2', '150600');
INSERT INTO `jie_zone` VALUES ('399', '150621', '达拉特旗', '2', '150600');
INSERT INTO `jie_zone` VALUES ('400', '150622', '准格尔旗', '2', '150600');
INSERT INTO `jie_zone` VALUES ('401', '150623', '鄂托克前旗', '2', '150600');
INSERT INTO `jie_zone` VALUES ('402', '150624', '鄂托克旗', '2', '150600');
INSERT INTO `jie_zone` VALUES ('403', '150625', '杭锦旗', '2', '150600');
INSERT INTO `jie_zone` VALUES ('404', '150626', '乌审旗', '2', '150600');
INSERT INTO `jie_zone` VALUES ('405', '150627', '伊金霍洛旗', '2', '150600');
INSERT INTO `jie_zone` VALUES ('406', '150700', '呼伦贝尔市', '1', '150000');
INSERT INTO `jie_zone` VALUES ('407', '150702', '海拉尔区', '2', '150700');
INSERT INTO `jie_zone` VALUES ('408', '150703', '扎赉诺尔区', '2', '150700');
INSERT INTO `jie_zone` VALUES ('409', '150721', '阿荣旗', '2', '150700');
INSERT INTO `jie_zone` VALUES ('410', '150722', '莫力达瓦达斡尔族自治旗', '2', '150700');
INSERT INTO `jie_zone` VALUES ('411', '150723', '鄂伦春自治旗', '2', '150700');
INSERT INTO `jie_zone` VALUES ('412', '150724', '鄂温克族自治旗', '2', '150700');
INSERT INTO `jie_zone` VALUES ('413', '150725', '陈巴尔虎旗', '2', '150700');
INSERT INTO `jie_zone` VALUES ('414', '150726', '新巴尔虎左旗', '2', '150700');
INSERT INTO `jie_zone` VALUES ('415', '150727', '新巴尔虎右旗', '2', '150700');
INSERT INTO `jie_zone` VALUES ('416', '150781', '满洲里市', '2', '150700');
INSERT INTO `jie_zone` VALUES ('417', '150782', '牙克石市', '2', '150700');
INSERT INTO `jie_zone` VALUES ('418', '150783', '扎兰屯市', '2', '150700');
INSERT INTO `jie_zone` VALUES ('419', '150784', '额尔古纳市', '2', '150700');
INSERT INTO `jie_zone` VALUES ('420', '150785', '根河市', '2', '150700');
INSERT INTO `jie_zone` VALUES ('421', '150800', '巴彦淖尔市', '1', '150000');
INSERT INTO `jie_zone` VALUES ('422', '150802', '临河区', '2', '150800');
INSERT INTO `jie_zone` VALUES ('423', '150821', '五原县', '2', '150800');
INSERT INTO `jie_zone` VALUES ('424', '150822', '磴口县', '2', '150800');
INSERT INTO `jie_zone` VALUES ('425', '150823', '乌拉特前旗', '2', '150800');
INSERT INTO `jie_zone` VALUES ('426', '150824', '乌拉特中旗', '2', '150800');
INSERT INTO `jie_zone` VALUES ('427', '150825', '乌拉特后旗', '2', '150800');
INSERT INTO `jie_zone` VALUES ('428', '150826', '杭锦后旗', '2', '150800');
INSERT INTO `jie_zone` VALUES ('429', '150900', '乌兰察布市', '1', '150000');
INSERT INTO `jie_zone` VALUES ('430', '150902', '集宁区', '2', '150900');
INSERT INTO `jie_zone` VALUES ('431', '150921', '卓资县', '2', '150900');
INSERT INTO `jie_zone` VALUES ('432', '150922', '化德县', '2', '150900');
INSERT INTO `jie_zone` VALUES ('433', '150923', '商都县', '2', '150900');
INSERT INTO `jie_zone` VALUES ('434', '150924', '兴和县', '2', '150900');
INSERT INTO `jie_zone` VALUES ('435', '150925', '凉城县', '2', '150900');
INSERT INTO `jie_zone` VALUES ('436', '150926', '察哈尔右翼前旗', '2', '150900');
INSERT INTO `jie_zone` VALUES ('437', '150927', '察哈尔右翼中旗', '2', '150900');
INSERT INTO `jie_zone` VALUES ('438', '150928', '察哈尔右翼后旗', '2', '150900');
INSERT INTO `jie_zone` VALUES ('439', '150929', '四子王旗', '2', '150900');
INSERT INTO `jie_zone` VALUES ('440', '150981', '丰镇市', '2', '150900');
INSERT INTO `jie_zone` VALUES ('441', '152200', '兴安盟', '1', '150000');
INSERT INTO `jie_zone` VALUES ('442', '152201', '乌兰浩特市', '2', '152200');
INSERT INTO `jie_zone` VALUES ('443', '152202', '阿尔山市', '2', '152200');
INSERT INTO `jie_zone` VALUES ('444', '152221', '科尔沁右翼前旗', '2', '152200');
INSERT INTO `jie_zone` VALUES ('445', '152222', '科尔沁右翼中旗', '2', '152200');
INSERT INTO `jie_zone` VALUES ('446', '152223', '扎赉特旗', '2', '152200');
INSERT INTO `jie_zone` VALUES ('447', '152224', '突泉县', '2', '152200');
INSERT INTO `jie_zone` VALUES ('448', '152500', '锡林郭勒盟', '1', '150000');
INSERT INTO `jie_zone` VALUES ('449', '152501', '二连浩特市', '2', '152500');
INSERT INTO `jie_zone` VALUES ('450', '152502', '锡林浩特市', '2', '152500');
INSERT INTO `jie_zone` VALUES ('451', '152522', '阿巴嘎旗', '2', '152500');
INSERT INTO `jie_zone` VALUES ('452', '152523', '苏尼特左旗', '2', '152500');
INSERT INTO `jie_zone` VALUES ('453', '152524', '苏尼特右旗', '2', '152500');
INSERT INTO `jie_zone` VALUES ('454', '152525', '东乌珠穆沁旗', '2', '152500');
INSERT INTO `jie_zone` VALUES ('455', '152526', '西乌珠穆沁旗', '2', '152500');
INSERT INTO `jie_zone` VALUES ('456', '152527', '太仆寺旗', '2', '152500');
INSERT INTO `jie_zone` VALUES ('457', '152528', '镶黄旗', '2', '152500');
INSERT INTO `jie_zone` VALUES ('458', '152529', '正镶白旗', '2', '152500');
INSERT INTO `jie_zone` VALUES ('459', '152530', '正蓝旗', '2', '152500');
INSERT INTO `jie_zone` VALUES ('460', '152531', '多伦县', '2', '152500');
INSERT INTO `jie_zone` VALUES ('461', '152900', '阿拉善盟', '1', '150000');
INSERT INTO `jie_zone` VALUES ('462', '152921', '阿拉善左旗', '2', '152900');
INSERT INTO `jie_zone` VALUES ('463', '152922', '阿拉善右旗', '2', '152900');
INSERT INTO `jie_zone` VALUES ('464', '152923', '额济纳旗', '2', '152900');
INSERT INTO `jie_zone` VALUES ('465', '210000', '辽宁省', '0', '0');
INSERT INTO `jie_zone` VALUES ('466', '210100', '沈阳市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('467', '210102', '和平区', '2', '210100');
INSERT INTO `jie_zone` VALUES ('468', '210103', '沈河区', '2', '210100');
INSERT INTO `jie_zone` VALUES ('469', '210104', '大东区', '2', '210100');
INSERT INTO `jie_zone` VALUES ('470', '210105', '皇姑区', '2', '210100');
INSERT INTO `jie_zone` VALUES ('471', '210106', '铁西区', '2', '210100');
INSERT INTO `jie_zone` VALUES ('472', '210111', '苏家屯区', '2', '210100');
INSERT INTO `jie_zone` VALUES ('473', '210112', '浑南区', '2', '210100');
INSERT INTO `jie_zone` VALUES ('474', '210113', '沈北新区', '2', '210100');
INSERT INTO `jie_zone` VALUES ('475', '210114', '于洪区', '2', '210100');
INSERT INTO `jie_zone` VALUES ('476', '210122', '辽中县', '2', '210100');
INSERT INTO `jie_zone` VALUES ('477', '210123', '康平县', '2', '210100');
INSERT INTO `jie_zone` VALUES ('478', '210124', '法库县', '2', '210100');
INSERT INTO `jie_zone` VALUES ('479', '210181', '新民市', '2', '210100');
INSERT INTO `jie_zone` VALUES ('480', '210200', '大连市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('481', '210202', '中山区', '2', '210200');
INSERT INTO `jie_zone` VALUES ('482', '210203', '西岗区', '2', '210200');
INSERT INTO `jie_zone` VALUES ('483', '210204', '沙河口区', '2', '210200');
INSERT INTO `jie_zone` VALUES ('484', '210211', '甘井子区', '2', '210200');
INSERT INTO `jie_zone` VALUES ('485', '210212', '旅顺口区', '2', '210200');
INSERT INTO `jie_zone` VALUES ('486', '210213', '金州区', '2', '210200');
INSERT INTO `jie_zone` VALUES ('487', '210224', '长海县', '2', '210200');
INSERT INTO `jie_zone` VALUES ('488', '210281', '瓦房店市', '2', '210200');
INSERT INTO `jie_zone` VALUES ('489', '210282', '普兰店市', '2', '210200');
INSERT INTO `jie_zone` VALUES ('490', '210283', '庄河市', '2', '210200');
INSERT INTO `jie_zone` VALUES ('491', '210300', '鞍山市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('492', '210302', '铁东区', '2', '210300');
INSERT INTO `jie_zone` VALUES ('493', '210303', '铁西区', '2', '210300');
INSERT INTO `jie_zone` VALUES ('494', '210304', '立山区', '2', '210300');
INSERT INTO `jie_zone` VALUES ('495', '210311', '千山区', '2', '210300');
INSERT INTO `jie_zone` VALUES ('496', '210321', '台安县', '2', '210300');
INSERT INTO `jie_zone` VALUES ('497', '210323', '岫岩满族自治县', '2', '210300');
INSERT INTO `jie_zone` VALUES ('498', '210381', '海城市', '2', '210300');
INSERT INTO `jie_zone` VALUES ('499', '210400', '抚顺市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('500', '210402', '新抚区', '2', '210400');
INSERT INTO `jie_zone` VALUES ('501', '210403', '东洲区', '2', '210400');
INSERT INTO `jie_zone` VALUES ('502', '210404', '望花区', '2', '210400');
INSERT INTO `jie_zone` VALUES ('503', '210411', '顺城区', '2', '210400');
INSERT INTO `jie_zone` VALUES ('504', '210421', '抚顺县', '2', '210400');
INSERT INTO `jie_zone` VALUES ('505', '210422', '新宾满族自治县', '2', '210400');
INSERT INTO `jie_zone` VALUES ('506', '210423', '清原满族自治县', '2', '210400');
INSERT INTO `jie_zone` VALUES ('507', '210500', '本溪市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('508', '210502', '平山区', '2', '210500');
INSERT INTO `jie_zone` VALUES ('509', '210503', '溪湖区', '2', '210500');
INSERT INTO `jie_zone` VALUES ('510', '210504', '明山区', '2', '210500');
INSERT INTO `jie_zone` VALUES ('511', '210505', '南芬区', '2', '210500');
INSERT INTO `jie_zone` VALUES ('512', '210521', '本溪满族自治县', '2', '210500');
INSERT INTO `jie_zone` VALUES ('513', '210522', '桓仁满族自治县', '2', '210500');
INSERT INTO `jie_zone` VALUES ('514', '210600', '丹东市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('515', '210602', '元宝区', '2', '210600');
INSERT INTO `jie_zone` VALUES ('516', '210603', '振兴区', '2', '210600');
INSERT INTO `jie_zone` VALUES ('517', '210604', '振安区', '2', '210600');
INSERT INTO `jie_zone` VALUES ('518', '210624', '宽甸满族自治县', '2', '210600');
INSERT INTO `jie_zone` VALUES ('519', '210681', '东港市', '2', '210600');
INSERT INTO `jie_zone` VALUES ('520', '210682', '凤城市', '2', '210600');
INSERT INTO `jie_zone` VALUES ('521', '210700', '锦州市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('522', '210702', '古塔区', '2', '210700');
INSERT INTO `jie_zone` VALUES ('523', '210703', '凌河区', '2', '210700');
INSERT INTO `jie_zone` VALUES ('524', '210711', '太和区', '2', '210700');
INSERT INTO `jie_zone` VALUES ('525', '210726', '黑山县', '2', '210700');
INSERT INTO `jie_zone` VALUES ('526', '210727', '义县', '2', '210700');
INSERT INTO `jie_zone` VALUES ('527', '210781', '凌海市', '2', '210700');
INSERT INTO `jie_zone` VALUES ('528', '210782', '北镇市', '2', '210700');
INSERT INTO `jie_zone` VALUES ('529', '210800', '营口市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('530', '210802', '站前区', '2', '210800');
INSERT INTO `jie_zone` VALUES ('531', '210803', '西市区', '2', '210800');
INSERT INTO `jie_zone` VALUES ('532', '210804', '鲅鱼圈区', '2', '210800');
INSERT INTO `jie_zone` VALUES ('533', '210811', '老边区', '2', '210800');
INSERT INTO `jie_zone` VALUES ('534', '210881', '盖州市', '2', '210800');
INSERT INTO `jie_zone` VALUES ('535', '210882', '大石桥市', '2', '210800');
INSERT INTO `jie_zone` VALUES ('536', '210900', '阜新市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('537', '210902', '海州区', '2', '210900');
INSERT INTO `jie_zone` VALUES ('538', '210903', '新邱区', '2', '210900');
INSERT INTO `jie_zone` VALUES ('539', '210904', '太平区', '2', '210900');
INSERT INTO `jie_zone` VALUES ('540', '210905', '清河门区', '2', '210900');
INSERT INTO `jie_zone` VALUES ('541', '210911', '细河区', '2', '210900');
INSERT INTO `jie_zone` VALUES ('542', '210921', '阜新蒙古族自治县', '2', '210900');
INSERT INTO `jie_zone` VALUES ('543', '210922', '彰武县', '2', '210900');
INSERT INTO `jie_zone` VALUES ('544', '211000', '辽阳市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('545', '211002', '白塔区', '2', '211000');
INSERT INTO `jie_zone` VALUES ('546', '211003', '文圣区', '2', '211000');
INSERT INTO `jie_zone` VALUES ('547', '211004', '宏伟区', '2', '211000');
INSERT INTO `jie_zone` VALUES ('548', '211005', '弓长岭区', '2', '211000');
INSERT INTO `jie_zone` VALUES ('549', '211011', '太子河区', '2', '211000');
INSERT INTO `jie_zone` VALUES ('550', '211021', '辽阳县', '2', '211000');
INSERT INTO `jie_zone` VALUES ('551', '211081', '灯塔市', '2', '211000');
INSERT INTO `jie_zone` VALUES ('552', '211100', '盘锦市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('553', '211102', '双台子区', '2', '211100');
INSERT INTO `jie_zone` VALUES ('554', '211103', '兴隆台区', '2', '211100');
INSERT INTO `jie_zone` VALUES ('555', '211121', '大洼县', '2', '211100');
INSERT INTO `jie_zone` VALUES ('556', '211122', '盘山县', '2', '211100');
INSERT INTO `jie_zone` VALUES ('557', '211200', '铁岭市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('558', '211202', '银州区', '2', '211200');
INSERT INTO `jie_zone` VALUES ('559', '211204', '清河区', '2', '211200');
INSERT INTO `jie_zone` VALUES ('560', '211221', '铁岭县', '2', '211200');
INSERT INTO `jie_zone` VALUES ('561', '211223', '西丰县', '2', '211200');
INSERT INTO `jie_zone` VALUES ('562', '211224', '昌图县', '2', '211200');
INSERT INTO `jie_zone` VALUES ('563', '211281', '调兵山市', '2', '211200');
INSERT INTO `jie_zone` VALUES ('564', '211282', '开原市', '2', '211200');
INSERT INTO `jie_zone` VALUES ('565', '211300', '朝阳市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('566', '211302', '双塔区', '2', '211300');
INSERT INTO `jie_zone` VALUES ('567', '211303', '龙城区', '2', '211300');
INSERT INTO `jie_zone` VALUES ('568', '211321', '朝阳县', '2', '211300');
INSERT INTO `jie_zone` VALUES ('569', '211322', '建平县', '2', '211300');
INSERT INTO `jie_zone` VALUES ('570', '211324', '喀喇沁左翼蒙古族自治县', '2', '211300');
INSERT INTO `jie_zone` VALUES ('571', '211381', '北票市', '2', '211300');
INSERT INTO `jie_zone` VALUES ('572', '211382', '凌源市', '2', '211300');
INSERT INTO `jie_zone` VALUES ('573', '211400', '葫芦岛市', '1', '210000');
INSERT INTO `jie_zone` VALUES ('574', '211402', '连山区', '2', '211400');
INSERT INTO `jie_zone` VALUES ('575', '211403', '龙港区', '2', '211400');
INSERT INTO `jie_zone` VALUES ('576', '211404', '南票区', '2', '211400');
INSERT INTO `jie_zone` VALUES ('577', '211421', '绥中县', '2', '211400');
INSERT INTO `jie_zone` VALUES ('578', '211422', '建昌县', '2', '211400');
INSERT INTO `jie_zone` VALUES ('579', '211481', '兴城市', '2', '211400');
INSERT INTO `jie_zone` VALUES ('580', '220000', '吉林省', '0', '0');
INSERT INTO `jie_zone` VALUES ('581', '220100', '长春市', '1', '220000');
INSERT INTO `jie_zone` VALUES ('582', '220102', '南关区', '2', '220100');
INSERT INTO `jie_zone` VALUES ('583', '220103', '宽城区', '2', '220100');
INSERT INTO `jie_zone` VALUES ('584', '220104', '朝阳区', '2', '220100');
INSERT INTO `jie_zone` VALUES ('585', '220105', '二道区', '2', '220100');
INSERT INTO `jie_zone` VALUES ('586', '220106', '绿园区', '2', '220100');
INSERT INTO `jie_zone` VALUES ('587', '220112', '双阳区', '2', '220100');
INSERT INTO `jie_zone` VALUES ('588', '220113', '九台区', '2', '220100');
INSERT INTO `jie_zone` VALUES ('589', '220122', '农安县', '2', '220100');
INSERT INTO `jie_zone` VALUES ('590', '220182', '榆树市', '2', '220100');
INSERT INTO `jie_zone` VALUES ('591', '220183', '德惠市', '2', '220100');
INSERT INTO `jie_zone` VALUES ('592', '220200', '吉林市', '1', '220000');
INSERT INTO `jie_zone` VALUES ('593', '220202', '昌邑区', '2', '220200');
INSERT INTO `jie_zone` VALUES ('594', '220203', '龙潭区', '2', '220200');
INSERT INTO `jie_zone` VALUES ('595', '220204', '船营区', '2', '220200');
INSERT INTO `jie_zone` VALUES ('596', '220211', '丰满区', '2', '220200');
INSERT INTO `jie_zone` VALUES ('597', '220221', '永吉县', '2', '220200');
INSERT INTO `jie_zone` VALUES ('598', '220281', '蛟河市', '2', '220200');
INSERT INTO `jie_zone` VALUES ('599', '220282', '桦甸市', '2', '220200');
INSERT INTO `jie_zone` VALUES ('600', '220283', '舒兰市', '2', '220200');
INSERT INTO `jie_zone` VALUES ('601', '220284', '磐石市', '2', '220200');
INSERT INTO `jie_zone` VALUES ('602', '220300', '四平市', '1', '220000');
INSERT INTO `jie_zone` VALUES ('603', '220302', '铁西区', '2', '220300');
INSERT INTO `jie_zone` VALUES ('604', '220303', '铁东区', '2', '220300');
INSERT INTO `jie_zone` VALUES ('605', '220322', '梨树县', '2', '220300');
INSERT INTO `jie_zone` VALUES ('606', '220323', '伊通满族自治县', '2', '220300');
INSERT INTO `jie_zone` VALUES ('607', '220381', '公主岭市', '2', '220300');
INSERT INTO `jie_zone` VALUES ('608', '220382', '双辽市', '2', '220300');
INSERT INTO `jie_zone` VALUES ('609', '220400', '辽源市', '1', '220000');
INSERT INTO `jie_zone` VALUES ('610', '220402', '龙山区', '2', '220400');
INSERT INTO `jie_zone` VALUES ('611', '220403', '西安区', '2', '220400');
INSERT INTO `jie_zone` VALUES ('612', '220421', '东丰县', '2', '220400');
INSERT INTO `jie_zone` VALUES ('613', '220422', '东辽县', '2', '220400');
INSERT INTO `jie_zone` VALUES ('614', '220500', '通化市', '1', '220000');
INSERT INTO `jie_zone` VALUES ('615', '220502', '东昌区', '2', '220500');
INSERT INTO `jie_zone` VALUES ('616', '220503', '二道江区', '2', '220500');
INSERT INTO `jie_zone` VALUES ('617', '220521', '通化县', '2', '220500');
INSERT INTO `jie_zone` VALUES ('618', '220523', '辉南县', '2', '220500');
INSERT INTO `jie_zone` VALUES ('619', '220524', '柳河县', '2', '220500');
INSERT INTO `jie_zone` VALUES ('620', '220581', '梅河口市', '2', '220500');
INSERT INTO `jie_zone` VALUES ('621', '220582', '集安市', '2', '220500');
INSERT INTO `jie_zone` VALUES ('622', '220600', '白山市', '1', '220000');
INSERT INTO `jie_zone` VALUES ('623', '220602', '浑江区', '2', '220600');
INSERT INTO `jie_zone` VALUES ('624', '220605', '江源区', '2', '220600');
INSERT INTO `jie_zone` VALUES ('625', '220621', '抚松县', '2', '220600');
INSERT INTO `jie_zone` VALUES ('626', '220622', '靖宇县', '2', '220600');
INSERT INTO `jie_zone` VALUES ('627', '220623', '长白朝鲜族自治县', '2', '220600');
INSERT INTO `jie_zone` VALUES ('628', '220681', '临江市', '2', '220600');
INSERT INTO `jie_zone` VALUES ('629', '220700', '松原市', '1', '220000');
INSERT INTO `jie_zone` VALUES ('630', '220702', '宁江区', '2', '220700');
INSERT INTO `jie_zone` VALUES ('631', '220721', '前郭尔罗斯蒙古族自治县', '2', '220700');
INSERT INTO `jie_zone` VALUES ('632', '220722', '长岭县', '2', '220700');
INSERT INTO `jie_zone` VALUES ('633', '220723', '乾安县', '2', '220700');
INSERT INTO `jie_zone` VALUES ('634', '220781', '扶余市', '2', '220700');
INSERT INTO `jie_zone` VALUES ('635', '220800', '白城市', '1', '220000');
INSERT INTO `jie_zone` VALUES ('636', '220802', '洮北区', '2', '220800');
INSERT INTO `jie_zone` VALUES ('637', '220821', '镇赉县', '2', '220800');
INSERT INTO `jie_zone` VALUES ('638', '220822', '通榆县', '2', '220800');
INSERT INTO `jie_zone` VALUES ('639', '220881', '洮南市', '2', '220800');
INSERT INTO `jie_zone` VALUES ('640', '220882', '大安市', '2', '220800');
INSERT INTO `jie_zone` VALUES ('641', '222400', '延边朝鲜族自治州', '1', '220000');
INSERT INTO `jie_zone` VALUES ('642', '222401', '延吉市', '2', '222400');
INSERT INTO `jie_zone` VALUES ('643', '222402', '图们市', '2', '222400');
INSERT INTO `jie_zone` VALUES ('644', '222403', '敦化市', '2', '222400');
INSERT INTO `jie_zone` VALUES ('645', '222404', '珲春市', '2', '222400');
INSERT INTO `jie_zone` VALUES ('646', '222405', '龙井市', '2', '222400');
INSERT INTO `jie_zone` VALUES ('647', '222406', '和龙市', '2', '222400');
INSERT INTO `jie_zone` VALUES ('648', '222424', '汪清县', '2', '222400');
INSERT INTO `jie_zone` VALUES ('649', '222426', '安图县', '2', '222400');
INSERT INTO `jie_zone` VALUES ('650', '230000', '黑龙江省', '0', '0');
INSERT INTO `jie_zone` VALUES ('651', '230100', '哈尔滨市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('652', '230102', '道里区', '2', '230100');
INSERT INTO `jie_zone` VALUES ('653', '230103', '南岗区', '2', '230100');
INSERT INTO `jie_zone` VALUES ('654', '230104', '道外区', '2', '230100');
INSERT INTO `jie_zone` VALUES ('655', '230108', '平房区', '2', '230100');
INSERT INTO `jie_zone` VALUES ('656', '230109', '松北区', '2', '230100');
INSERT INTO `jie_zone` VALUES ('657', '230110', '香坊区', '2', '230100');
INSERT INTO `jie_zone` VALUES ('658', '230111', '呼兰区', '2', '230100');
INSERT INTO `jie_zone` VALUES ('659', '230112', '阿城区', '2', '230100');
INSERT INTO `jie_zone` VALUES ('660', '230123', '依兰县', '2', '230100');
INSERT INTO `jie_zone` VALUES ('661', '230124', '方正县', '2', '230100');
INSERT INTO `jie_zone` VALUES ('662', '230125', '宾县', '2', '230100');
INSERT INTO `jie_zone` VALUES ('663', '230126', '巴彦县', '2', '230100');
INSERT INTO `jie_zone` VALUES ('664', '230127', '木兰县', '2', '230100');
INSERT INTO `jie_zone` VALUES ('665', '230128', '通河县', '2', '230100');
INSERT INTO `jie_zone` VALUES ('666', '230129', '延寿县', '2', '230100');
INSERT INTO `jie_zone` VALUES ('667', '230182', '双城市', '2', '230100');
INSERT INTO `jie_zone` VALUES ('668', '230183', '尚志市', '2', '230100');
INSERT INTO `jie_zone` VALUES ('669', '230184', '五常市', '2', '230100');
INSERT INTO `jie_zone` VALUES ('670', '230200', '齐齐哈尔市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('671', '230202', '龙沙区', '2', '230200');
INSERT INTO `jie_zone` VALUES ('672', '230203', '建华区', '2', '230200');
INSERT INTO `jie_zone` VALUES ('673', '230204', '铁锋区', '2', '230200');
INSERT INTO `jie_zone` VALUES ('674', '230205', '昂昂溪区', '2', '230200');
INSERT INTO `jie_zone` VALUES ('675', '230206', '富拉尔基区', '2', '230200');
INSERT INTO `jie_zone` VALUES ('676', '230207', '碾子山区', '2', '230200');
INSERT INTO `jie_zone` VALUES ('677', '230208', '梅里斯达斡尔族区', '2', '230200');
INSERT INTO `jie_zone` VALUES ('678', '230221', '龙江县', '2', '230200');
INSERT INTO `jie_zone` VALUES ('679', '230223', '依安县', '2', '230200');
INSERT INTO `jie_zone` VALUES ('680', '230224', '泰来县', '2', '230200');
INSERT INTO `jie_zone` VALUES ('681', '230225', '甘南县', '2', '230200');
INSERT INTO `jie_zone` VALUES ('682', '230227', '富裕县', '2', '230200');
INSERT INTO `jie_zone` VALUES ('683', '230229', '克山县', '2', '230200');
INSERT INTO `jie_zone` VALUES ('684', '230230', '克东县', '2', '230200');
INSERT INTO `jie_zone` VALUES ('685', '230231', '拜泉县', '2', '230200');
INSERT INTO `jie_zone` VALUES ('686', '230281', '讷河市', '2', '230200');
INSERT INTO `jie_zone` VALUES ('687', '230300', '鸡西市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('688', '230302', '鸡冠区', '2', '230300');
INSERT INTO `jie_zone` VALUES ('689', '230303', '恒山区', '2', '230300');
INSERT INTO `jie_zone` VALUES ('690', '230304', '滴道区', '2', '230300');
INSERT INTO `jie_zone` VALUES ('691', '230305', '梨树区', '2', '230300');
INSERT INTO `jie_zone` VALUES ('692', '230306', '城子河区', '2', '230300');
INSERT INTO `jie_zone` VALUES ('693', '230307', '麻山区', '2', '230300');
INSERT INTO `jie_zone` VALUES ('694', '230321', '鸡东县', '2', '230300');
INSERT INTO `jie_zone` VALUES ('695', '230381', '虎林市', '2', '230300');
INSERT INTO `jie_zone` VALUES ('696', '230382', '密山市', '2', '230300');
INSERT INTO `jie_zone` VALUES ('697', '230400', '鹤岗市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('698', '230402', '向阳区', '2', '230400');
INSERT INTO `jie_zone` VALUES ('699', '230403', '工农区', '2', '230400');
INSERT INTO `jie_zone` VALUES ('700', '230404', '南山区', '2', '230400');
INSERT INTO `jie_zone` VALUES ('701', '230405', '兴安区', '2', '230400');
INSERT INTO `jie_zone` VALUES ('702', '230406', '东山区', '2', '230400');
INSERT INTO `jie_zone` VALUES ('703', '230407', '兴山区', '2', '230400');
INSERT INTO `jie_zone` VALUES ('704', '230421', '萝北县', '2', '230400');
INSERT INTO `jie_zone` VALUES ('705', '230422', '绥滨县', '2', '230400');
INSERT INTO `jie_zone` VALUES ('706', '230500', '双鸭山市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('707', '230502', '尖山区', '2', '230500');
INSERT INTO `jie_zone` VALUES ('708', '230503', '岭东区', '2', '230500');
INSERT INTO `jie_zone` VALUES ('709', '230505', '四方台区', '2', '230500');
INSERT INTO `jie_zone` VALUES ('710', '230506', '宝山区', '2', '230500');
INSERT INTO `jie_zone` VALUES ('711', '230521', '集贤县', '2', '230500');
INSERT INTO `jie_zone` VALUES ('712', '230522', '友谊县', '2', '230500');
INSERT INTO `jie_zone` VALUES ('713', '230523', '宝清县', '2', '230500');
INSERT INTO `jie_zone` VALUES ('714', '230524', '饶河县', '2', '230500');
INSERT INTO `jie_zone` VALUES ('715', '230600', '大庆市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('716', '230602', '萨尔图区', '2', '230600');
INSERT INTO `jie_zone` VALUES ('717', '230603', '龙凤区', '2', '230600');
INSERT INTO `jie_zone` VALUES ('718', '230604', '让胡路区', '2', '230600');
INSERT INTO `jie_zone` VALUES ('719', '230605', '红岗区', '2', '230600');
INSERT INTO `jie_zone` VALUES ('720', '230606', '大同区', '2', '230600');
INSERT INTO `jie_zone` VALUES ('721', '230621', '肇州县', '2', '230600');
INSERT INTO `jie_zone` VALUES ('722', '230622', '肇源县', '2', '230600');
INSERT INTO `jie_zone` VALUES ('723', '230623', '林甸县', '2', '230600');
INSERT INTO `jie_zone` VALUES ('724', '230624', '杜尔伯特蒙古族自治县', '2', '230600');
INSERT INTO `jie_zone` VALUES ('725', '230700', '伊春市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('726', '230702', '伊春区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('727', '230703', '南岔区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('728', '230704', '友好区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('729', '230705', '西林区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('730', '230706', '翠峦区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('731', '230707', '新青区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('732', '230708', '美溪区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('733', '230709', '金山屯区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('734', '230710', '五营区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('735', '230711', '乌马河区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('736', '230712', '汤旺河区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('737', '230713', '带岭区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('738', '230714', '乌伊岭区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('739', '230715', '红星区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('740', '230716', '上甘岭区', '2', '230700');
INSERT INTO `jie_zone` VALUES ('741', '230722', '嘉荫县', '2', '230700');
INSERT INTO `jie_zone` VALUES ('742', '230781', '铁力市', '2', '230700');
INSERT INTO `jie_zone` VALUES ('743', '230800', '佳木斯市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('744', '230803', '向阳区', '2', '230800');
INSERT INTO `jie_zone` VALUES ('745', '230804', '前进区', '2', '230800');
INSERT INTO `jie_zone` VALUES ('746', '230805', '东风区', '2', '230800');
INSERT INTO `jie_zone` VALUES ('747', '230811', '郊区', '2', '230800');
INSERT INTO `jie_zone` VALUES ('748', '230822', '桦南县', '2', '230800');
INSERT INTO `jie_zone` VALUES ('749', '230826', '桦川县', '2', '230800');
INSERT INTO `jie_zone` VALUES ('750', '230828', '汤原县', '2', '230800');
INSERT INTO `jie_zone` VALUES ('751', '230833', '抚远县', '2', '230800');
INSERT INTO `jie_zone` VALUES ('752', '230881', '同江市', '2', '230800');
INSERT INTO `jie_zone` VALUES ('753', '230882', '富锦市', '2', '230800');
INSERT INTO `jie_zone` VALUES ('754', '230900', '七台河市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('755', '230902', '新兴区', '2', '230900');
INSERT INTO `jie_zone` VALUES ('756', '230903', '桃山区', '2', '230900');
INSERT INTO `jie_zone` VALUES ('757', '230904', '茄子河区', '2', '230900');
INSERT INTO `jie_zone` VALUES ('758', '230921', '勃利县', '2', '230900');
INSERT INTO `jie_zone` VALUES ('759', '231000', '牡丹江市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('760', '231002', '东安区', '2', '231000');
INSERT INTO `jie_zone` VALUES ('761', '231003', '阳明区', '2', '231000');
INSERT INTO `jie_zone` VALUES ('762', '231004', '爱民区', '2', '231000');
INSERT INTO `jie_zone` VALUES ('763', '231005', '西安区', '2', '231000');
INSERT INTO `jie_zone` VALUES ('764', '231024', '东宁县', '2', '231000');
INSERT INTO `jie_zone` VALUES ('765', '231025', '林口县', '2', '231000');
INSERT INTO `jie_zone` VALUES ('766', '231081', '绥芬河市', '2', '231000');
INSERT INTO `jie_zone` VALUES ('767', '231083', '海林市', '2', '231000');
INSERT INTO `jie_zone` VALUES ('768', '231084', '宁安市', '2', '231000');
INSERT INTO `jie_zone` VALUES ('769', '231085', '穆棱市', '2', '231000');
INSERT INTO `jie_zone` VALUES ('770', '231100', '黑河市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('771', '231102', '爱辉区', '2', '231100');
INSERT INTO `jie_zone` VALUES ('772', '231121', '嫩江县', '2', '231100');
INSERT INTO `jie_zone` VALUES ('773', '231123', '逊克县', '2', '231100');
INSERT INTO `jie_zone` VALUES ('774', '231124', '孙吴县', '2', '231100');
INSERT INTO `jie_zone` VALUES ('775', '231181', '北安市', '2', '231100');
INSERT INTO `jie_zone` VALUES ('776', '231182', '五大连池市', '2', '231100');
INSERT INTO `jie_zone` VALUES ('777', '231200', '绥化市', '1', '230000');
INSERT INTO `jie_zone` VALUES ('778', '231202', '北林区', '2', '231200');
INSERT INTO `jie_zone` VALUES ('779', '231221', '望奎县', '2', '231200');
INSERT INTO `jie_zone` VALUES ('780', '231222', '兰西县', '2', '231200');
INSERT INTO `jie_zone` VALUES ('781', '231223', '青冈县', '2', '231200');
INSERT INTO `jie_zone` VALUES ('782', '231224', '庆安县', '2', '231200');
INSERT INTO `jie_zone` VALUES ('783', '231225', '明水县', '2', '231200');
INSERT INTO `jie_zone` VALUES ('784', '231226', '绥棱县', '2', '231200');
INSERT INTO `jie_zone` VALUES ('785', '231281', '安达市', '2', '231200');
INSERT INTO `jie_zone` VALUES ('786', '231282', '肇东市', '2', '231200');
INSERT INTO `jie_zone` VALUES ('787', '231283', '海伦市', '2', '231200');
INSERT INTO `jie_zone` VALUES ('788', '232700', '大兴安岭地区', '1', '230000');
INSERT INTO `jie_zone` VALUES ('789', '232721', '呼玛县', '2', '232700');
INSERT INTO `jie_zone` VALUES ('790', '232722', '塔河县', '2', '232700');
INSERT INTO `jie_zone` VALUES ('791', '232723', '漠河县', '2', '232700');
INSERT INTO `jie_zone` VALUES ('792', '310000', '上海市', '0', '0');
INSERT INTO `jie_zone` VALUES ('793', '310101', '黄浦区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('794', '310104', '徐汇区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('795', '310105', '长宁区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('796', '310106', '静安区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('797', '310107', '普陀区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('798', '310108', '闸北区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('799', '310109', '虹口区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('800', '310110', '杨浦区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('801', '310112', '闵行区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('802', '310113', '宝山区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('803', '310114', '嘉定区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('804', '310115', '浦东新区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('805', '310116', '金山区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('806', '310117', '松江区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('807', '310118', '青浦区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('808', '310120', '奉贤区', '2', '310000');
INSERT INTO `jie_zone` VALUES ('809', '310230', '崇明县', '2', '310000');
INSERT INTO `jie_zone` VALUES ('810', '320000', '江苏省', '0', '0');
INSERT INTO `jie_zone` VALUES ('811', '320100', '南京市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('812', '320102', '玄武区', '2', '320100');
INSERT INTO `jie_zone` VALUES ('813', '320104', '秦淮区', '2', '320100');
INSERT INTO `jie_zone` VALUES ('814', '320105', '建邺区', '2', '320100');
INSERT INTO `jie_zone` VALUES ('815', '320106', '鼓楼区', '2', '320100');
INSERT INTO `jie_zone` VALUES ('816', '320111', '浦口区', '2', '320100');
INSERT INTO `jie_zone` VALUES ('817', '320113', '栖霞区', '2', '320100');
INSERT INTO `jie_zone` VALUES ('818', '320114', '雨花台区', '2', '320100');
INSERT INTO `jie_zone` VALUES ('819', '320115', '江宁区', '2', '320100');
INSERT INTO `jie_zone` VALUES ('820', '320116', '六合区', '2', '320100');
INSERT INTO `jie_zone` VALUES ('821', '320117', '溧水区', '2', '320100');
INSERT INTO `jie_zone` VALUES ('822', '320118', '高淳区', '2', '320100');
INSERT INTO `jie_zone` VALUES ('823', '320200', '无锡市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('824', '320202', '崇安区', '2', '320200');
INSERT INTO `jie_zone` VALUES ('825', '320203', '南长区', '2', '320200');
INSERT INTO `jie_zone` VALUES ('826', '320204', '北塘区', '2', '320200');
INSERT INTO `jie_zone` VALUES ('827', '320205', '锡山区', '2', '320200');
INSERT INTO `jie_zone` VALUES ('828', '320206', '惠山区', '2', '320200');
INSERT INTO `jie_zone` VALUES ('829', '320211', '滨湖区', '2', '320200');
INSERT INTO `jie_zone` VALUES ('830', '320281', '江阴市', '2', '320200');
INSERT INTO `jie_zone` VALUES ('831', '320282', '宜兴市', '2', '320200');
INSERT INTO `jie_zone` VALUES ('832', '320300', '徐州市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('833', '320302', '鼓楼区', '2', '320300');
INSERT INTO `jie_zone` VALUES ('834', '320303', '云龙区', '2', '320300');
INSERT INTO `jie_zone` VALUES ('835', '320305', '贾汪区', '2', '320300');
INSERT INTO `jie_zone` VALUES ('836', '320311', '泉山区', '2', '320300');
INSERT INTO `jie_zone` VALUES ('837', '320312', '铜山区', '2', '320300');
INSERT INTO `jie_zone` VALUES ('838', '320321', '丰县', '2', '320300');
INSERT INTO `jie_zone` VALUES ('839', '320322', '沛县', '2', '320300');
INSERT INTO `jie_zone` VALUES ('840', '320324', '睢宁县', '2', '320300');
INSERT INTO `jie_zone` VALUES ('841', '320381', '新沂市', '2', '320300');
INSERT INTO `jie_zone` VALUES ('842', '320382', '邳州市', '2', '320300');
INSERT INTO `jie_zone` VALUES ('843', '320400', '常州市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('844', '320402', '天宁区', '2', '320400');
INSERT INTO `jie_zone` VALUES ('845', '320404', '钟楼区', '2', '320400');
INSERT INTO `jie_zone` VALUES ('846', '320405', '戚墅堰区', '2', '320400');
INSERT INTO `jie_zone` VALUES ('847', '320411', '新北区', '2', '320400');
INSERT INTO `jie_zone` VALUES ('848', '320412', '武进区', '2', '320400');
INSERT INTO `jie_zone` VALUES ('849', '320481', '溧阳市', '2', '320400');
INSERT INTO `jie_zone` VALUES ('850', '320482', '金坛市', '2', '320400');
INSERT INTO `jie_zone` VALUES ('851', '320500', '苏州市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('852', '320505', '虎丘区', '2', '320500');
INSERT INTO `jie_zone` VALUES ('853', '320506', '吴中区', '2', '320500');
INSERT INTO `jie_zone` VALUES ('854', '320507', '相城区', '2', '320500');
INSERT INTO `jie_zone` VALUES ('855', '320508', '姑苏区', '2', '320500');
INSERT INTO `jie_zone` VALUES ('856', '320509', '吴江区', '2', '320500');
INSERT INTO `jie_zone` VALUES ('857', '320581', '常熟市', '2', '320500');
INSERT INTO `jie_zone` VALUES ('858', '320582', '张家港市', '2', '320500');
INSERT INTO `jie_zone` VALUES ('859', '320583', '昆山市', '2', '320500');
INSERT INTO `jie_zone` VALUES ('860', '320585', '太仓市', '2', '320500');
INSERT INTO `jie_zone` VALUES ('861', '320600', '南通市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('862', '320602', '崇川区', '2', '320600');
INSERT INTO `jie_zone` VALUES ('863', '320611', '港闸区', '2', '320600');
INSERT INTO `jie_zone` VALUES ('864', '320612', '通州区', '2', '320600');
INSERT INTO `jie_zone` VALUES ('865', '320621', '海安县', '2', '320600');
INSERT INTO `jie_zone` VALUES ('866', '320623', '如东县', '2', '320600');
INSERT INTO `jie_zone` VALUES ('867', '320681', '启东市', '2', '320600');
INSERT INTO `jie_zone` VALUES ('868', '320682', '如皋市', '2', '320600');
INSERT INTO `jie_zone` VALUES ('869', '320684', '海门市', '2', '320600');
INSERT INTO `jie_zone` VALUES ('870', '320700', '连云港市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('871', '320703', '连云区', '2', '320700');
INSERT INTO `jie_zone` VALUES ('872', '320706', '海州区', '2', '320700');
INSERT INTO `jie_zone` VALUES ('873', '320707', '赣榆区', '2', '320700');
INSERT INTO `jie_zone` VALUES ('874', '320722', '东海县', '2', '320700');
INSERT INTO `jie_zone` VALUES ('875', '320723', '灌云县', '2', '320700');
INSERT INTO `jie_zone` VALUES ('876', '320724', '灌南县', '2', '320700');
INSERT INTO `jie_zone` VALUES ('877', '320800', '淮安市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('878', '320802', '清河区', '2', '320800');
INSERT INTO `jie_zone` VALUES ('879', '320803', '淮安区', '2', '320800');
INSERT INTO `jie_zone` VALUES ('880', '320804', '淮阴区', '2', '320800');
INSERT INTO `jie_zone` VALUES ('881', '320811', '清浦区', '2', '320800');
INSERT INTO `jie_zone` VALUES ('882', '320826', '涟水县', '2', '320800');
INSERT INTO `jie_zone` VALUES ('883', '320829', '洪泽县', '2', '320800');
INSERT INTO `jie_zone` VALUES ('884', '320830', '盱眙县', '2', '320800');
INSERT INTO `jie_zone` VALUES ('885', '320831', '金湖县', '2', '320800');
INSERT INTO `jie_zone` VALUES ('886', '320900', '盐城市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('887', '320902', '亭湖区', '2', '320900');
INSERT INTO `jie_zone` VALUES ('888', '320903', '盐都区', '2', '320900');
INSERT INTO `jie_zone` VALUES ('889', '320921', '响水县', '2', '320900');
INSERT INTO `jie_zone` VALUES ('890', '320922', '滨海县', '2', '320900');
INSERT INTO `jie_zone` VALUES ('891', '320923', '阜宁县', '2', '320900');
INSERT INTO `jie_zone` VALUES ('892', '320924', '射阳县', '2', '320900');
INSERT INTO `jie_zone` VALUES ('893', '320925', '建湖县', '2', '320900');
INSERT INTO `jie_zone` VALUES ('894', '320981', '东台市', '2', '320900');
INSERT INTO `jie_zone` VALUES ('895', '320982', '大丰市', '2', '320900');
INSERT INTO `jie_zone` VALUES ('896', '321000', '扬州市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('897', '321002', '广陵区', '2', '321000');
INSERT INTO `jie_zone` VALUES ('898', '321003', '邗江区', '2', '321000');
INSERT INTO `jie_zone` VALUES ('899', '321012', '江都区', '2', '321000');
INSERT INTO `jie_zone` VALUES ('900', '321023', '宝应县', '2', '321000');
INSERT INTO `jie_zone` VALUES ('901', '321081', '仪征市', '2', '321000');
INSERT INTO `jie_zone` VALUES ('902', '321084', '高邮市', '2', '321000');
INSERT INTO `jie_zone` VALUES ('903', '321100', '镇江市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('904', '321102', '京口区', '2', '321100');
INSERT INTO `jie_zone` VALUES ('905', '321111', '润州区', '2', '321100');
INSERT INTO `jie_zone` VALUES ('906', '321112', '丹徒区', '2', '321100');
INSERT INTO `jie_zone` VALUES ('907', '321181', '丹阳市', '2', '321100');
INSERT INTO `jie_zone` VALUES ('908', '321182', '扬中市', '2', '321100');
INSERT INTO `jie_zone` VALUES ('909', '321183', '句容市', '2', '321100');
INSERT INTO `jie_zone` VALUES ('910', '321200', '泰州市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('911', '321202', '海陵区', '2', '321200');
INSERT INTO `jie_zone` VALUES ('912', '321203', '高港区', '2', '321200');
INSERT INTO `jie_zone` VALUES ('913', '321204', '姜堰区', '2', '321200');
INSERT INTO `jie_zone` VALUES ('914', '321281', '兴化市', '2', '321200');
INSERT INTO `jie_zone` VALUES ('915', '321282', '靖江市', '2', '321200');
INSERT INTO `jie_zone` VALUES ('916', '321283', '泰兴市', '2', '321200');
INSERT INTO `jie_zone` VALUES ('917', '321300', '宿迁市', '1', '320000');
INSERT INTO `jie_zone` VALUES ('918', '321302', '宿城区', '2', '321300');
INSERT INTO `jie_zone` VALUES ('919', '321311', '宿豫区', '2', '321300');
INSERT INTO `jie_zone` VALUES ('920', '321322', '沭阳县', '2', '321300');
INSERT INTO `jie_zone` VALUES ('921', '321323', '泗阳县', '2', '321300');
INSERT INTO `jie_zone` VALUES ('922', '321324', '泗洪县', '2', '321300');
INSERT INTO `jie_zone` VALUES ('923', '330000', '浙江省', '0', '0');
INSERT INTO `jie_zone` VALUES ('924', '330100', '杭州市', '1', '330000');
INSERT INTO `jie_zone` VALUES ('925', '330102', '上城区', '2', '330100');
INSERT INTO `jie_zone` VALUES ('926', '330103', '下城区', '2', '330100');
INSERT INTO `jie_zone` VALUES ('927', '330104', '江干区', '2', '330100');
INSERT INTO `jie_zone` VALUES ('928', '330105', '拱墅区', '2', '330100');
INSERT INTO `jie_zone` VALUES ('929', '330106', '西湖区', '2', '330100');
INSERT INTO `jie_zone` VALUES ('930', '330108', '滨江区', '2', '330100');
INSERT INTO `jie_zone` VALUES ('931', '330109', '萧山区', '2', '330100');
INSERT INTO `jie_zone` VALUES ('932', '330110', '余杭区', '2', '330100');
INSERT INTO `jie_zone` VALUES ('933', '330122', '桐庐县', '2', '330100');
INSERT INTO `jie_zone` VALUES ('934', '330127', '淳安县', '2', '330100');
INSERT INTO `jie_zone` VALUES ('935', '330182', '建德市', '2', '330100');
INSERT INTO `jie_zone` VALUES ('936', '330183', '富阳市', '2', '330100');
INSERT INTO `jie_zone` VALUES ('937', '330185', '临安市', '2', '330100');
INSERT INTO `jie_zone` VALUES ('938', '330200', '宁波市', '1', '330000');
INSERT INTO `jie_zone` VALUES ('939', '330203', '海曙区', '2', '330200');
INSERT INTO `jie_zone` VALUES ('940', '330204', '江东区', '2', '330200');
INSERT INTO `jie_zone` VALUES ('941', '330205', '江北区', '2', '330200');
INSERT INTO `jie_zone` VALUES ('942', '330206', '北仑区', '2', '330200');
INSERT INTO `jie_zone` VALUES ('943', '330211', '镇海区', '2', '330200');
INSERT INTO `jie_zone` VALUES ('944', '330212', '鄞州区', '2', '330200');
INSERT INTO `jie_zone` VALUES ('945', '330225', '象山县', '2', '330200');
INSERT INTO `jie_zone` VALUES ('946', '330226', '宁海县', '2', '330200');
INSERT INTO `jie_zone` VALUES ('947', '330281', '余姚市', '2', '330200');
INSERT INTO `jie_zone` VALUES ('948', '330282', '慈溪市', '2', '330200');
INSERT INTO `jie_zone` VALUES ('949', '330283', '奉化市', '2', '330200');
INSERT INTO `jie_zone` VALUES ('950', '330300', '温州市', '1', '330000');
INSERT INTO `jie_zone` VALUES ('951', '330302', '鹿城区', '2', '330300');
INSERT INTO `jie_zone` VALUES ('952', '330303', '龙湾区', '2', '330300');
INSERT INTO `jie_zone` VALUES ('953', '330304', '瓯海区', '2', '330300');
INSERT INTO `jie_zone` VALUES ('954', '330322', '洞头县', '2', '330300');
INSERT INTO `jie_zone` VALUES ('955', '330324', '永嘉县', '2', '330300');
INSERT INTO `jie_zone` VALUES ('956', '330326', '平阳县', '2', '330300');
INSERT INTO `jie_zone` VALUES ('957', '330327', '苍南县', '2', '330300');
INSERT INTO `jie_zone` VALUES ('958', '330328', '文成县', '2', '330300');
INSERT INTO `jie_zone` VALUES ('959', '330329', '泰顺县', '2', '330300');
INSERT INTO `jie_zone` VALUES ('960', '330381', '瑞安市', '2', '330300');
INSERT INTO `jie_zone` VALUES ('961', '330382', '乐清市', '2', '330300');
INSERT INTO `jie_zone` VALUES ('962', '330400', '嘉兴市', '1', '330000');
INSERT INTO `jie_zone` VALUES ('963', '330402', '南湖区', '2', '330400');
INSERT INTO `jie_zone` VALUES ('964', '330411', '秀洲区', '2', '330400');
INSERT INTO `jie_zone` VALUES ('965', '330421', '嘉善县', '2', '330400');
INSERT INTO `jie_zone` VALUES ('966', '330424', '海盐县', '2', '330400');
INSERT INTO `jie_zone` VALUES ('967', '330481', '海宁市', '2', '330400');
INSERT INTO `jie_zone` VALUES ('968', '330482', '平湖市', '2', '330400');
INSERT INTO `jie_zone` VALUES ('969', '330483', '桐乡市', '2', '330400');
INSERT INTO `jie_zone` VALUES ('970', '330500', '湖州市', '1', '330000');
INSERT INTO `jie_zone` VALUES ('971', '330502', '吴兴区', '2', '330500');
INSERT INTO `jie_zone` VALUES ('972', '330503', '南浔区', '2', '330500');
INSERT INTO `jie_zone` VALUES ('973', '330521', '德清县', '2', '330500');
INSERT INTO `jie_zone` VALUES ('974', '330522', '长兴县', '2', '330500');
INSERT INTO `jie_zone` VALUES ('975', '330523', '安吉县', '2', '330500');
INSERT INTO `jie_zone` VALUES ('976', '330600', '绍兴市', '1', '330000');
INSERT INTO `jie_zone` VALUES ('977', '330602', '越城区', '2', '330600');
INSERT INTO `jie_zone` VALUES ('978', '330603', '柯桥区', '2', '330600');
INSERT INTO `jie_zone` VALUES ('979', '330604', '上虞区', '2', '330600');
INSERT INTO `jie_zone` VALUES ('980', '330624', '新昌县', '2', '330600');
INSERT INTO `jie_zone` VALUES ('981', '330681', '诸暨市', '2', '330600');
INSERT INTO `jie_zone` VALUES ('982', '330683', '嵊州市', '2', '330600');
INSERT INTO `jie_zone` VALUES ('983', '330700', '金华市', '1', '330000');
INSERT INTO `jie_zone` VALUES ('984', '330702', '婺城区', '2', '330700');
INSERT INTO `jie_zone` VALUES ('985', '330703', '金东区', '2', '330700');
INSERT INTO `jie_zone` VALUES ('986', '330723', '武义县', '2', '330700');
INSERT INTO `jie_zone` VALUES ('987', '330726', '浦江县', '2', '330700');
INSERT INTO `jie_zone` VALUES ('988', '330727', '磐安县', '2', '330700');
INSERT INTO `jie_zone` VALUES ('989', '330781', '兰溪市', '2', '330700');
INSERT INTO `jie_zone` VALUES ('990', '330782', '义乌市', '2', '330700');
INSERT INTO `jie_zone` VALUES ('991', '330783', '东阳市', '2', '330700');
INSERT INTO `jie_zone` VALUES ('992', '330784', '永康市', '2', '330700');
INSERT INTO `jie_zone` VALUES ('993', '330800', '衢州市', '1', '330000');
INSERT INTO `jie_zone` VALUES ('994', '330802', '柯城区', '2', '330800');
INSERT INTO `jie_zone` VALUES ('995', '330803', '衢江区', '2', '330800');
INSERT INTO `jie_zone` VALUES ('996', '330822', '常山县', '2', '330800');
INSERT INTO `jie_zone` VALUES ('997', '330824', '开化县', '2', '330800');
INSERT INTO `jie_zone` VALUES ('998', '330825', '龙游县', '2', '330800');
INSERT INTO `jie_zone` VALUES ('999', '330881', '江山市', '2', '330800');
INSERT INTO `jie_zone` VALUES ('1000', '330900', '舟山市', '1', '330000');
INSERT INTO `jie_zone` VALUES ('1001', '330902', '定海区', '2', '330900');
INSERT INTO `jie_zone` VALUES ('1002', '330903', '普陀区', '2', '330900');
INSERT INTO `jie_zone` VALUES ('1003', '330921', '岱山县', '2', '330900');
INSERT INTO `jie_zone` VALUES ('1004', '330922', '嵊泗县', '2', '330900');
INSERT INTO `jie_zone` VALUES ('1005', '331000', '台州市', '1', '330000');
INSERT INTO `jie_zone` VALUES ('1006', '331002', '椒江区', '2', '331000');
INSERT INTO `jie_zone` VALUES ('1007', '331003', '黄岩区', '2', '331000');
INSERT INTO `jie_zone` VALUES ('1008', '331004', '路桥区', '2', '331000');
INSERT INTO `jie_zone` VALUES ('1009', '331021', '玉环县', '2', '331000');
INSERT INTO `jie_zone` VALUES ('1010', '331022', '三门县', '2', '331000');
INSERT INTO `jie_zone` VALUES ('1011', '331023', '天台县', '2', '331000');
INSERT INTO `jie_zone` VALUES ('1012', '331024', '仙居县', '2', '331000');
INSERT INTO `jie_zone` VALUES ('1013', '331081', '温岭市', '2', '331000');
INSERT INTO `jie_zone` VALUES ('1014', '331082', '临海市', '2', '331000');
INSERT INTO `jie_zone` VALUES ('1015', '331100', '丽水市', '1', '330000');
INSERT INTO `jie_zone` VALUES ('1016', '331102', '莲都区', '2', '331100');
INSERT INTO `jie_zone` VALUES ('1017', '331121', '青田县', '2', '331100');
INSERT INTO `jie_zone` VALUES ('1018', '331122', '缙云县', '2', '331100');
INSERT INTO `jie_zone` VALUES ('1019', '331123', '遂昌县', '2', '331100');
INSERT INTO `jie_zone` VALUES ('1020', '331124', '松阳县', '2', '331100');
INSERT INTO `jie_zone` VALUES ('1021', '331125', '云和县', '2', '331100');
INSERT INTO `jie_zone` VALUES ('1022', '331126', '庆元县', '2', '331100');
INSERT INTO `jie_zone` VALUES ('1023', '331127', '景宁畲族自治县', '2', '331100');
INSERT INTO `jie_zone` VALUES ('1024', '331181', '龙泉市', '2', '331100');
INSERT INTO `jie_zone` VALUES ('1025', '340000', '安徽省', '0', '0');
INSERT INTO `jie_zone` VALUES ('1026', '340100', '合肥市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1027', '340102', '瑶海区', '2', '340100');
INSERT INTO `jie_zone` VALUES ('1028', '340103', '庐阳区', '2', '340100');
INSERT INTO `jie_zone` VALUES ('1029', '340104', '蜀山区', '2', '340100');
INSERT INTO `jie_zone` VALUES ('1030', '340111', '包河区', '2', '340100');
INSERT INTO `jie_zone` VALUES ('1031', '340121', '长丰县', '2', '340100');
INSERT INTO `jie_zone` VALUES ('1032', '340122', '肥东县', '2', '340100');
INSERT INTO `jie_zone` VALUES ('1033', '340123', '肥西县', '2', '340100');
INSERT INTO `jie_zone` VALUES ('1034', '340124', '庐江县', '2', '340100');
INSERT INTO `jie_zone` VALUES ('1035', '340181', '巢湖市', '2', '340100');
INSERT INTO `jie_zone` VALUES ('1036', '340200', '芜湖市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1037', '340202', '镜湖区', '2', '340200');
INSERT INTO `jie_zone` VALUES ('1038', '340203', '弋江区', '2', '340200');
INSERT INTO `jie_zone` VALUES ('1039', '340207', '鸠江区', '2', '340200');
INSERT INTO `jie_zone` VALUES ('1040', '340208', '三山区', '2', '340200');
INSERT INTO `jie_zone` VALUES ('1041', '340221', '芜湖县', '2', '340200');
INSERT INTO `jie_zone` VALUES ('1042', '340222', '繁昌县', '2', '340200');
INSERT INTO `jie_zone` VALUES ('1043', '340223', '南陵县', '2', '340200');
INSERT INTO `jie_zone` VALUES ('1044', '340225', '无为县', '2', '340200');
INSERT INTO `jie_zone` VALUES ('1045', '340300', '蚌埠市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1046', '340302', '龙子湖区', '2', '340300');
INSERT INTO `jie_zone` VALUES ('1047', '340303', '蚌山区', '2', '340300');
INSERT INTO `jie_zone` VALUES ('1048', '340304', '禹会区', '2', '340300');
INSERT INTO `jie_zone` VALUES ('1049', '340311', '淮上区', '2', '340300');
INSERT INTO `jie_zone` VALUES ('1050', '340321', '怀远县', '2', '340300');
INSERT INTO `jie_zone` VALUES ('1051', '340322', '五河县', '2', '340300');
INSERT INTO `jie_zone` VALUES ('1052', '340323', '固镇县', '2', '340300');
INSERT INTO `jie_zone` VALUES ('1053', '340400', '淮南市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1054', '340402', '大通区', '2', '340400');
INSERT INTO `jie_zone` VALUES ('1055', '340403', '田家庵区', '2', '340400');
INSERT INTO `jie_zone` VALUES ('1056', '340404', '谢家集区', '2', '340400');
INSERT INTO `jie_zone` VALUES ('1057', '340405', '八公山区', '2', '340400');
INSERT INTO `jie_zone` VALUES ('1058', '340406', '潘集区', '2', '340400');
INSERT INTO `jie_zone` VALUES ('1059', '340421', '凤台县', '2', '340400');
INSERT INTO `jie_zone` VALUES ('1060', '340500', '马鞍山市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1061', '340503', '花山区', '2', '340500');
INSERT INTO `jie_zone` VALUES ('1062', '340504', '雨山区', '2', '340500');
INSERT INTO `jie_zone` VALUES ('1063', '340506', '博望区', '2', '340500');
INSERT INTO `jie_zone` VALUES ('1064', '340521', '当涂县', '2', '340500');
INSERT INTO `jie_zone` VALUES ('1065', '340522', '含山县', '2', '340500');
INSERT INTO `jie_zone` VALUES ('1066', '340523', '和县', '2', '340500');
INSERT INTO `jie_zone` VALUES ('1067', '340600', '淮北市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1068', '340602', '杜集区', '2', '340600');
INSERT INTO `jie_zone` VALUES ('1069', '340603', '相山区', '2', '340600');
INSERT INTO `jie_zone` VALUES ('1070', '340604', '烈山区', '2', '340600');
INSERT INTO `jie_zone` VALUES ('1071', '340621', '濉溪县', '2', '340600');
INSERT INTO `jie_zone` VALUES ('1072', '340700', '铜陵市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1073', '340702', '铜官山区', '2', '340700');
INSERT INTO `jie_zone` VALUES ('1074', '340703', '狮子山区', '2', '340700');
INSERT INTO `jie_zone` VALUES ('1075', '340711', '郊区', '2', '340700');
INSERT INTO `jie_zone` VALUES ('1076', '340721', '铜陵县', '2', '340700');
INSERT INTO `jie_zone` VALUES ('1077', '340800', '安庆市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1078', '340802', '迎江区', '2', '340800');
INSERT INTO `jie_zone` VALUES ('1079', '340803', '大观区', '2', '340800');
INSERT INTO `jie_zone` VALUES ('1080', '340811', '宜秀区', '2', '340800');
INSERT INTO `jie_zone` VALUES ('1081', '340822', '怀宁县', '2', '340800');
INSERT INTO `jie_zone` VALUES ('1082', '340823', '枞阳县', '2', '340800');
INSERT INTO `jie_zone` VALUES ('1083', '340824', '潜山县', '2', '340800');
INSERT INTO `jie_zone` VALUES ('1084', '340825', '太湖县', '2', '340800');
INSERT INTO `jie_zone` VALUES ('1085', '340826', '宿松县', '2', '340800');
INSERT INTO `jie_zone` VALUES ('1086', '340827', '望江县', '2', '340800');
INSERT INTO `jie_zone` VALUES ('1087', '340828', '岳西县', '2', '340800');
INSERT INTO `jie_zone` VALUES ('1088', '340881', '桐城市', '2', '340800');
INSERT INTO `jie_zone` VALUES ('1089', '341000', '黄山市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1090', '341002', '屯溪区', '2', '341000');
INSERT INTO `jie_zone` VALUES ('1091', '341003', '黄山区', '2', '341000');
INSERT INTO `jie_zone` VALUES ('1092', '341004', '徽州区', '2', '341000');
INSERT INTO `jie_zone` VALUES ('1093', '341021', '歙县', '2', '341000');
INSERT INTO `jie_zone` VALUES ('1094', '341022', '休宁县', '2', '341000');
INSERT INTO `jie_zone` VALUES ('1095', '341023', '黟县', '2', '341000');
INSERT INTO `jie_zone` VALUES ('1096', '341024', '祁门县', '2', '341000');
INSERT INTO `jie_zone` VALUES ('1097', '341100', '滁州市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1098', '341102', '琅琊区', '2', '341100');
INSERT INTO `jie_zone` VALUES ('1099', '341103', '南谯区', '2', '341100');
INSERT INTO `jie_zone` VALUES ('1100', '341122', '来安县', '2', '341100');
INSERT INTO `jie_zone` VALUES ('1101', '341124', '全椒县', '2', '341100');
INSERT INTO `jie_zone` VALUES ('1102', '341125', '定远县', '2', '341100');
INSERT INTO `jie_zone` VALUES ('1103', '341126', '凤阳县', '2', '341100');
INSERT INTO `jie_zone` VALUES ('1104', '341181', '天长市', '2', '341100');
INSERT INTO `jie_zone` VALUES ('1105', '341182', '明光市', '2', '341100');
INSERT INTO `jie_zone` VALUES ('1106', '341200', '阜阳市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1107', '341202', '颍州区', '2', '341200');
INSERT INTO `jie_zone` VALUES ('1108', '341203', '颍东区', '2', '341200');
INSERT INTO `jie_zone` VALUES ('1109', '341204', '颍泉区', '2', '341200');
INSERT INTO `jie_zone` VALUES ('1110', '341221', '临泉县', '2', '341200');
INSERT INTO `jie_zone` VALUES ('1111', '341222', '太和县', '2', '341200');
INSERT INTO `jie_zone` VALUES ('1112', '341225', '阜南县', '2', '341200');
INSERT INTO `jie_zone` VALUES ('1113', '341226', '颍上县', '2', '341200');
INSERT INTO `jie_zone` VALUES ('1114', '341282', '界首市', '2', '341200');
INSERT INTO `jie_zone` VALUES ('1115', '341300', '宿州市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1116', '341302', '埇桥区', '2', '341300');
INSERT INTO `jie_zone` VALUES ('1117', '341321', '砀山县', '2', '341300');
INSERT INTO `jie_zone` VALUES ('1118', '341322', '萧县', '2', '341300');
INSERT INTO `jie_zone` VALUES ('1119', '341323', '灵璧县', '2', '341300');
INSERT INTO `jie_zone` VALUES ('1120', '341324', '泗县', '2', '341300');
INSERT INTO `jie_zone` VALUES ('1121', '341500', '六安市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1122', '341502', '金安区', '2', '341500');
INSERT INTO `jie_zone` VALUES ('1123', '341503', '裕安区', '2', '341500');
INSERT INTO `jie_zone` VALUES ('1124', '341521', '寿县', '2', '341500');
INSERT INTO `jie_zone` VALUES ('1125', '341522', '霍邱县', '2', '341500');
INSERT INTO `jie_zone` VALUES ('1126', '341523', '舒城县', '2', '341500');
INSERT INTO `jie_zone` VALUES ('1127', '341524', '金寨县', '2', '341500');
INSERT INTO `jie_zone` VALUES ('1128', '341525', '霍山县', '2', '341500');
INSERT INTO `jie_zone` VALUES ('1129', '341600', '亳州市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1130', '341602', '谯城区', '2', '341600');
INSERT INTO `jie_zone` VALUES ('1131', '341621', '涡阳县', '2', '341600');
INSERT INTO `jie_zone` VALUES ('1132', '341622', '蒙城县', '2', '341600');
INSERT INTO `jie_zone` VALUES ('1133', '341623', '利辛县', '2', '341600');
INSERT INTO `jie_zone` VALUES ('1134', '341700', '池州市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1135', '341702', '贵池区', '2', '341700');
INSERT INTO `jie_zone` VALUES ('1136', '341721', '东至县', '2', '341700');
INSERT INTO `jie_zone` VALUES ('1137', '341722', '石台县', '2', '341700');
INSERT INTO `jie_zone` VALUES ('1138', '341723', '青阳县', '2', '341700');
INSERT INTO `jie_zone` VALUES ('1139', '341800', '宣城市', '1', '340000');
INSERT INTO `jie_zone` VALUES ('1140', '341802', '宣州区', '2', '341800');
INSERT INTO `jie_zone` VALUES ('1141', '341821', '郎溪县', '2', '341800');
INSERT INTO `jie_zone` VALUES ('1142', '341822', '广德县', '2', '341800');
INSERT INTO `jie_zone` VALUES ('1143', '341823', '泾县', '2', '341800');
INSERT INTO `jie_zone` VALUES ('1144', '341824', '绩溪县', '2', '341800');
INSERT INTO `jie_zone` VALUES ('1145', '341825', '旌德县', '2', '341800');
INSERT INTO `jie_zone` VALUES ('1146', '341881', '宁国市', '2', '341800');
INSERT INTO `jie_zone` VALUES ('1147', '350000', '福建省', '0', '0');
INSERT INTO `jie_zone` VALUES ('1148', '350100', '福州市', '1', '350000');
INSERT INTO `jie_zone` VALUES ('1149', '350102', '鼓楼区', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1150', '350103', '台江区', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1151', '350104', '仓山区', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1152', '350105', '马尾区', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1153', '350111', '晋安区', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1154', '350121', '闽侯县', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1155', '350122', '连江县', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1156', '350123', '罗源县', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1157', '350124', '闽清县', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1158', '350125', '永泰县', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1159', '350128', '平潭县', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1160', '350181', '福清市', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1161', '350182', '长乐市', '2', '350100');
INSERT INTO `jie_zone` VALUES ('1162', '350200', '厦门市', '1', '350000');
INSERT INTO `jie_zone` VALUES ('1163', '350203', '思明区', '2', '350200');
INSERT INTO `jie_zone` VALUES ('1164', '350205', '海沧区', '2', '350200');
INSERT INTO `jie_zone` VALUES ('1165', '350206', '湖里区', '2', '350200');
INSERT INTO `jie_zone` VALUES ('1166', '350211', '集美区', '2', '350200');
INSERT INTO `jie_zone` VALUES ('1167', '350212', '同安区', '2', '350200');
INSERT INTO `jie_zone` VALUES ('1168', '350213', '翔安区', '2', '350200');
INSERT INTO `jie_zone` VALUES ('1169', '350300', '莆田市', '1', '350000');
INSERT INTO `jie_zone` VALUES ('1170', '350302', '城厢区', '2', '350300');
INSERT INTO `jie_zone` VALUES ('1171', '350303', '涵江区', '2', '350300');
INSERT INTO `jie_zone` VALUES ('1172', '350304', '荔城区', '2', '350300');
INSERT INTO `jie_zone` VALUES ('1173', '350305', '秀屿区', '2', '350300');
INSERT INTO `jie_zone` VALUES ('1174', '350322', '仙游县', '2', '350300');
INSERT INTO `jie_zone` VALUES ('1175', '350400', '三明市', '1', '350000');
INSERT INTO `jie_zone` VALUES ('1176', '350402', '梅列区', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1177', '350403', '三元区', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1178', '350421', '明溪县', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1179', '350423', '清流县', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1180', '350424', '宁化县', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1181', '350425', '大田县', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1182', '350426', '尤溪县', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1183', '350427', '沙县', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1184', '350428', '将乐县', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1185', '350429', '泰宁县', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1186', '350430', '建宁县', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1187', '350481', '永安市', '2', '350400');
INSERT INTO `jie_zone` VALUES ('1188', '350500', '泉州市', '1', '350000');
INSERT INTO `jie_zone` VALUES ('1189', '350502', '鲤城区', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1190', '350503', '丰泽区', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1191', '350504', '洛江区', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1192', '350505', '泉港区', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1193', '350521', '惠安县', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1194', '350524', '安溪县', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1195', '350525', '永春县', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1196', '350526', '德化县', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1197', '350527', '金门县', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1198', '350581', '石狮市', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1199', '350582', '晋江市', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1200', '350583', '南安市', '2', '350500');
INSERT INTO `jie_zone` VALUES ('1201', '350600', '漳州市', '1', '350000');
INSERT INTO `jie_zone` VALUES ('1202', '350602', '芗城区', '2', '350600');
INSERT INTO `jie_zone` VALUES ('1203', '350603', '龙文区', '2', '350600');
INSERT INTO `jie_zone` VALUES ('1204', '350622', '云霄县', '2', '350600');
INSERT INTO `jie_zone` VALUES ('1205', '350623', '漳浦县', '2', '350600');
INSERT INTO `jie_zone` VALUES ('1206', '350624', '诏安县', '2', '350600');
INSERT INTO `jie_zone` VALUES ('1207', '350625', '长泰县', '2', '350600');
INSERT INTO `jie_zone` VALUES ('1208', '350626', '东山县', '2', '350600');
INSERT INTO `jie_zone` VALUES ('1209', '350627', '南靖县', '2', '350600');
INSERT INTO `jie_zone` VALUES ('1210', '350628', '平和县', '2', '350600');
INSERT INTO `jie_zone` VALUES ('1211', '350629', '华安县', '2', '350600');
INSERT INTO `jie_zone` VALUES ('1212', '350681', '龙海市', '2', '350600');
INSERT INTO `jie_zone` VALUES ('1213', '350700', '南平市', '1', '350000');
INSERT INTO `jie_zone` VALUES ('1214', '350702', '延平区', '2', '350700');
INSERT INTO `jie_zone` VALUES ('1215', '350721', '顺昌县', '2', '350700');
INSERT INTO `jie_zone` VALUES ('1216', '350722', '浦城县', '2', '350700');
INSERT INTO `jie_zone` VALUES ('1217', '350723', '光泽县', '2', '350700');
INSERT INTO `jie_zone` VALUES ('1218', '350724', '松溪县', '2', '350700');
INSERT INTO `jie_zone` VALUES ('1219', '350725', '政和县', '2', '350700');
INSERT INTO `jie_zone` VALUES ('1220', '350781', '邵武市', '2', '350700');
INSERT INTO `jie_zone` VALUES ('1221', '350782', '武夷山市', '2', '350700');
INSERT INTO `jie_zone` VALUES ('1222', '350783', '建瓯市', '2', '350700');
INSERT INTO `jie_zone` VALUES ('1223', '350784', '建阳市', '2', '350700');
INSERT INTO `jie_zone` VALUES ('1224', '350800', '龙岩市', '1', '350000');
INSERT INTO `jie_zone` VALUES ('1225', '350802', '新罗区', '2', '350800');
INSERT INTO `jie_zone` VALUES ('1226', '350821', '长汀县', '2', '350800');
INSERT INTO `jie_zone` VALUES ('1227', '350822', '永定县', '2', '350800');
INSERT INTO `jie_zone` VALUES ('1228', '350823', '上杭县', '2', '350800');
INSERT INTO `jie_zone` VALUES ('1229', '350824', '武平县', '2', '350800');
INSERT INTO `jie_zone` VALUES ('1230', '350825', '连城县', '2', '350800');
INSERT INTO `jie_zone` VALUES ('1231', '350881', '漳平市', '2', '350800');
INSERT INTO `jie_zone` VALUES ('1232', '350900', '宁德市', '1', '350000');
INSERT INTO `jie_zone` VALUES ('1233', '350902', '蕉城区', '2', '350900');
INSERT INTO `jie_zone` VALUES ('1234', '350921', '霞浦县', '2', '350900');
INSERT INTO `jie_zone` VALUES ('1235', '350922', '古田县', '2', '350900');
INSERT INTO `jie_zone` VALUES ('1236', '350923', '屏南县', '2', '350900');
INSERT INTO `jie_zone` VALUES ('1237', '350924', '寿宁县', '2', '350900');
INSERT INTO `jie_zone` VALUES ('1238', '350925', '周宁县', '2', '350900');
INSERT INTO `jie_zone` VALUES ('1239', '350926', '柘荣县', '2', '350900');
INSERT INTO `jie_zone` VALUES ('1240', '350981', '福安市', '2', '350900');
INSERT INTO `jie_zone` VALUES ('1241', '350982', '福鼎市', '2', '350900');
INSERT INTO `jie_zone` VALUES ('1242', '360000', '江西省', '0', '0');
INSERT INTO `jie_zone` VALUES ('1243', '360100', '南昌市', '1', '360000');
INSERT INTO `jie_zone` VALUES ('1244', '360102', '东湖区', '2', '360100');
INSERT INTO `jie_zone` VALUES ('1245', '360103', '西湖区', '2', '360100');
INSERT INTO `jie_zone` VALUES ('1246', '360104', '青云谱区', '2', '360100');
INSERT INTO `jie_zone` VALUES ('1247', '360105', '湾里区', '2', '360100');
INSERT INTO `jie_zone` VALUES ('1248', '360111', '青山湖区', '2', '360100');
INSERT INTO `jie_zone` VALUES ('1249', '360121', '南昌县', '2', '360100');
INSERT INTO `jie_zone` VALUES ('1250', '360122', '新建县', '2', '360100');
INSERT INTO `jie_zone` VALUES ('1251', '360123', '安义县', '2', '360100');
INSERT INTO `jie_zone` VALUES ('1252', '360124', '进贤县', '2', '360100');
INSERT INTO `jie_zone` VALUES ('1253', '360200', '景德镇市', '1', '360000');
INSERT INTO `jie_zone` VALUES ('1254', '360202', '昌江区', '2', '360200');
INSERT INTO `jie_zone` VALUES ('1255', '360203', '珠山区', '2', '360200');
INSERT INTO `jie_zone` VALUES ('1256', '360222', '浮梁县', '2', '360200');
INSERT INTO `jie_zone` VALUES ('1257', '360281', '乐平市', '2', '360200');
INSERT INTO `jie_zone` VALUES ('1258', '360300', '萍乡市', '1', '360000');
INSERT INTO `jie_zone` VALUES ('1259', '360302', '安源区', '2', '360300');
INSERT INTO `jie_zone` VALUES ('1260', '360313', '湘东区', '2', '360300');
INSERT INTO `jie_zone` VALUES ('1261', '360321', '莲花县', '2', '360300');
INSERT INTO `jie_zone` VALUES ('1262', '360322', '上栗县', '2', '360300');
INSERT INTO `jie_zone` VALUES ('1263', '360323', '芦溪县', '2', '360300');
INSERT INTO `jie_zone` VALUES ('1264', '360400', '九江市', '1', '360000');
INSERT INTO `jie_zone` VALUES ('1265', '360402', '庐山区', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1266', '360403', '浔阳区', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1267', '360421', '九江县', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1268', '360423', '武宁县', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1269', '360424', '修水县', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1270', '360425', '永修县', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1271', '360426', '德安县', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1272', '360427', '星子县', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1273', '360428', '都昌县', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1274', '360429', '湖口县', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1275', '360430', '彭泽县', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1276', '360481', '瑞昌市', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1277', '360482', '共青城市', '2', '360400');
INSERT INTO `jie_zone` VALUES ('1278', '360500', '新余市', '1', '360000');
INSERT INTO `jie_zone` VALUES ('1279', '360502', '渝水区', '2', '360500');
INSERT INTO `jie_zone` VALUES ('1280', '360521', '分宜县', '2', '360500');
INSERT INTO `jie_zone` VALUES ('1281', '360600', '鹰潭市', '1', '360000');
INSERT INTO `jie_zone` VALUES ('1282', '360602', '月湖区', '2', '360600');
INSERT INTO `jie_zone` VALUES ('1283', '360622', '余江县', '2', '360600');
INSERT INTO `jie_zone` VALUES ('1284', '360681', '贵溪市', '2', '360600');
INSERT INTO `jie_zone` VALUES ('1285', '360700', '赣州市', '1', '360000');
INSERT INTO `jie_zone` VALUES ('1286', '360702', '章贡区', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1287', '360703', '南康区', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1288', '360721', '赣县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1289', '360722', '信丰县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1290', '360723', '大余县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1291', '360724', '上犹县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1292', '360725', '崇义县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1293', '360726', '安远县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1294', '360727', '龙南县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1295', '360728', '定南县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1296', '360729', '全南县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1297', '360730', '宁都县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1298', '360731', '于都县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1299', '360732', '兴国县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1300', '360733', '会昌县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1301', '360734', '寻乌县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1302', '360735', '石城县', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1303', '360781', '瑞金市', '2', '360700');
INSERT INTO `jie_zone` VALUES ('1304', '360800', '吉安市', '1', '360000');
INSERT INTO `jie_zone` VALUES ('1305', '360802', '吉州区', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1306', '360803', '青原区', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1307', '360821', '吉安县', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1308', '360822', '吉水县', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1309', '360823', '峡江县', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1310', '360824', '新干县', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1311', '360825', '永丰县', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1312', '360826', '泰和县', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1313', '360827', '遂川县', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1314', '360828', '万安县', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1315', '360829', '安福县', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1316', '360830', '永新县', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1317', '360881', '井冈山市', '2', '360800');
INSERT INTO `jie_zone` VALUES ('1318', '360900', '宜春市', '1', '360000');
INSERT INTO `jie_zone` VALUES ('1319', '360902', '袁州区', '2', '360900');
INSERT INTO `jie_zone` VALUES ('1320', '360921', '奉新县', '2', '360900');
INSERT INTO `jie_zone` VALUES ('1321', '360922', '万载县', '2', '360900');
INSERT INTO `jie_zone` VALUES ('1322', '360923', '上高县', '2', '360900');
INSERT INTO `jie_zone` VALUES ('1323', '360924', '宜丰县', '2', '360900');
INSERT INTO `jie_zone` VALUES ('1324', '360925', '靖安县', '2', '360900');
INSERT INTO `jie_zone` VALUES ('1325', '360926', '铜鼓县', '2', '360900');
INSERT INTO `jie_zone` VALUES ('1326', '360981', '丰城市', '2', '360900');
INSERT INTO `jie_zone` VALUES ('1327', '360982', '樟树市', '2', '360900');
INSERT INTO `jie_zone` VALUES ('1328', '360983', '高安市', '2', '360900');
INSERT INTO `jie_zone` VALUES ('1329', '361000', '抚州市', '1', '360000');
INSERT INTO `jie_zone` VALUES ('1330', '361002', '临川区', '2', '361000');
INSERT INTO `jie_zone` VALUES ('1331', '361021', '南城县', '2', '361000');
INSERT INTO `jie_zone` VALUES ('1332', '361022', '黎川县', '2', '361000');
INSERT INTO `jie_zone` VALUES ('1333', '361023', '南丰县', '2', '361000');
INSERT INTO `jie_zone` VALUES ('1334', '361024', '崇仁县', '2', '361000');
INSERT INTO `jie_zone` VALUES ('1335', '361025', '乐安县', '2', '361000');
INSERT INTO `jie_zone` VALUES ('1336', '361026', '宜黄县', '2', '361000');
INSERT INTO `jie_zone` VALUES ('1337', '361027', '金溪县', '2', '361000');
INSERT INTO `jie_zone` VALUES ('1338', '361028', '资溪县', '2', '361000');
INSERT INTO `jie_zone` VALUES ('1339', '361029', '东乡县', '2', '361000');
INSERT INTO `jie_zone` VALUES ('1340', '361030', '广昌县', '2', '361000');
INSERT INTO `jie_zone` VALUES ('1341', '361100', '上饶市', '1', '360000');
INSERT INTO `jie_zone` VALUES ('1342', '361102', '信州区', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1343', '361121', '上饶县', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1344', '361122', '广丰县', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1345', '361123', '玉山县', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1346', '361124', '铅山县', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1347', '361125', '横峰县', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1348', '361126', '弋阳县', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1349', '361127', '余干县', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1350', '361128', '鄱阳县', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1351', '361129', '万年县', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1352', '361130', '婺源县', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1353', '361181', '德兴市', '2', '361100');
INSERT INTO `jie_zone` VALUES ('1354', '370000', '山东省', '0', '0');
INSERT INTO `jie_zone` VALUES ('1355', '370100', '济南市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1356', '370102', '历下区', '2', '370100');
INSERT INTO `jie_zone` VALUES ('1357', '370103', '市中区', '2', '370100');
INSERT INTO `jie_zone` VALUES ('1358', '370104', '槐荫区', '2', '370100');
INSERT INTO `jie_zone` VALUES ('1359', '370105', '天桥区', '2', '370100');
INSERT INTO `jie_zone` VALUES ('1360', '370112', '历城区', '2', '370100');
INSERT INTO `jie_zone` VALUES ('1361', '370113', '长清区', '2', '370100');
INSERT INTO `jie_zone` VALUES ('1362', '370124', '平阴县', '2', '370100');
INSERT INTO `jie_zone` VALUES ('1363', '370125', '济阳县', '2', '370100');
INSERT INTO `jie_zone` VALUES ('1364', '370126', '商河县', '2', '370100');
INSERT INTO `jie_zone` VALUES ('1365', '370181', '章丘市', '2', '370100');
INSERT INTO `jie_zone` VALUES ('1366', '370200', '青岛市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1367', '370202', '市南区', '2', '370200');
INSERT INTO `jie_zone` VALUES ('1368', '370203', '市北区', '2', '370200');
INSERT INTO `jie_zone` VALUES ('1369', '370211', '黄岛区', '2', '370200');
INSERT INTO `jie_zone` VALUES ('1370', '370212', '崂山区', '2', '370200');
INSERT INTO `jie_zone` VALUES ('1371', '370213', '李沧区', '2', '370200');
INSERT INTO `jie_zone` VALUES ('1372', '370214', '城阳区', '2', '370200');
INSERT INTO `jie_zone` VALUES ('1373', '370281', '胶州市', '2', '370200');
INSERT INTO `jie_zone` VALUES ('1374', '370282', '即墨市', '2', '370200');
INSERT INTO `jie_zone` VALUES ('1375', '370283', '平度市', '2', '370200');
INSERT INTO `jie_zone` VALUES ('1376', '370285', '莱西市', '2', '370200');
INSERT INTO `jie_zone` VALUES ('1377', '370300', '淄博市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1378', '370302', '淄川区', '2', '370300');
INSERT INTO `jie_zone` VALUES ('1379', '370303', '张店区', '2', '370300');
INSERT INTO `jie_zone` VALUES ('1380', '370304', '博山区', '2', '370300');
INSERT INTO `jie_zone` VALUES ('1381', '370305', '临淄区', '2', '370300');
INSERT INTO `jie_zone` VALUES ('1382', '370306', '周村区', '2', '370300');
INSERT INTO `jie_zone` VALUES ('1383', '370321', '桓台县', '2', '370300');
INSERT INTO `jie_zone` VALUES ('1384', '370322', '高青县', '2', '370300');
INSERT INTO `jie_zone` VALUES ('1385', '370323', '沂源县', '2', '370300');
INSERT INTO `jie_zone` VALUES ('1386', '370400', '枣庄市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1387', '370402', '市中区', '2', '370400');
INSERT INTO `jie_zone` VALUES ('1388', '370403', '薛城区', '2', '370400');
INSERT INTO `jie_zone` VALUES ('1389', '370404', '峄城区', '2', '370400');
INSERT INTO `jie_zone` VALUES ('1390', '370405', '台儿庄区', '2', '370400');
INSERT INTO `jie_zone` VALUES ('1391', '370406', '山亭区', '2', '370400');
INSERT INTO `jie_zone` VALUES ('1392', '370481', '滕州市', '2', '370400');
INSERT INTO `jie_zone` VALUES ('1393', '370500', '东营市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1394', '370502', '东营区', '2', '370500');
INSERT INTO `jie_zone` VALUES ('1395', '370503', '河口区', '2', '370500');
INSERT INTO `jie_zone` VALUES ('1396', '370521', '垦利县', '2', '370500');
INSERT INTO `jie_zone` VALUES ('1397', '370522', '利津县', '2', '370500');
INSERT INTO `jie_zone` VALUES ('1398', '370523', '广饶县', '2', '370500');
INSERT INTO `jie_zone` VALUES ('1399', '370600', '烟台市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1400', '370602', '芝罘区', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1401', '370611', '福山区', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1402', '370612', '牟平区', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1403', '370613', '莱山区', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1404', '370634', '长岛县', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1405', '370681', '龙口市', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1406', '370682', '莱阳市', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1407', '370683', '莱州市', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1408', '370684', '蓬莱市', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1409', '370685', '招远市', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1410', '370686', '栖霞市', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1411', '370687', '海阳市', '2', '370600');
INSERT INTO `jie_zone` VALUES ('1412', '370700', '潍坊市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1413', '370702', '潍城区', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1414', '370703', '寒亭区', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1415', '370704', '坊子区', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1416', '370705', '奎文区', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1417', '370724', '临朐县', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1418', '370725', '昌乐县', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1419', '370781', '青州市', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1420', '370782', '诸城市', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1421', '370783', '寿光市', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1422', '370784', '安丘市', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1423', '370785', '高密市', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1424', '370786', '昌邑市', '2', '370700');
INSERT INTO `jie_zone` VALUES ('1425', '370800', '济宁市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1426', '370811', '任城区', '2', '370800');
INSERT INTO `jie_zone` VALUES ('1427', '370812', '兖州区', '2', '370800');
INSERT INTO `jie_zone` VALUES ('1428', '370826', '微山县', '2', '370800');
INSERT INTO `jie_zone` VALUES ('1429', '370827', '鱼台县', '2', '370800');
INSERT INTO `jie_zone` VALUES ('1430', '370828', '金乡县', '2', '370800');
INSERT INTO `jie_zone` VALUES ('1431', '370829', '嘉祥县', '2', '370800');
INSERT INTO `jie_zone` VALUES ('1432', '370830', '汶上县', '2', '370800');
INSERT INTO `jie_zone` VALUES ('1433', '370831', '泗水县', '2', '370800');
INSERT INTO `jie_zone` VALUES ('1434', '370832', '梁山县', '2', '370800');
INSERT INTO `jie_zone` VALUES ('1435', '370881', '曲阜市', '2', '370800');
INSERT INTO `jie_zone` VALUES ('1436', '370883', '邹城市', '2', '370800');
INSERT INTO `jie_zone` VALUES ('1437', '370900', '泰安市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1438', '370902', '泰山区', '2', '370900');
INSERT INTO `jie_zone` VALUES ('1439', '370911', '岱岳区', '2', '370900');
INSERT INTO `jie_zone` VALUES ('1440', '370921', '宁阳县', '2', '370900');
INSERT INTO `jie_zone` VALUES ('1441', '370923', '东平县', '2', '370900');
INSERT INTO `jie_zone` VALUES ('1442', '370982', '新泰市', '2', '370900');
INSERT INTO `jie_zone` VALUES ('1443', '370983', '肥城市', '2', '370900');
INSERT INTO `jie_zone` VALUES ('1444', '371000', '威海市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1445', '371002', '环翠区', '2', '371000');
INSERT INTO `jie_zone` VALUES ('1446', '371003', '文登区', '2', '371000');
INSERT INTO `jie_zone` VALUES ('1447', '371082', '荣成市', '2', '371000');
INSERT INTO `jie_zone` VALUES ('1448', '371083', '乳山市', '2', '371000');
INSERT INTO `jie_zone` VALUES ('1449', '371100', '日照市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1450', '371102', '东港区', '2', '371100');
INSERT INTO `jie_zone` VALUES ('1451', '371103', '岚山区', '2', '371100');
INSERT INTO `jie_zone` VALUES ('1452', '371121', '五莲县', '2', '371100');
INSERT INTO `jie_zone` VALUES ('1453', '371122', '莒县', '2', '371100');
INSERT INTO `jie_zone` VALUES ('1454', '371200', '莱芜市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1455', '371202', '莱城区', '2', '371200');
INSERT INTO `jie_zone` VALUES ('1456', '371203', '钢城区', '2', '371200');
INSERT INTO `jie_zone` VALUES ('1457', '371300', '临沂市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1458', '371302', '兰山区', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1459', '371311', '罗庄区', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1460', '371312', '河东区', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1461', '371321', '沂南县', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1462', '371322', '郯城县', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1463', '371323', '沂水县', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1464', '371324', '兰陵县', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1465', '371325', '费县', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1466', '371326', '平邑县', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1467', '371327', '莒南县', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1468', '371328', '蒙阴县', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1469', '371329', '临沭县', '2', '371300');
INSERT INTO `jie_zone` VALUES ('1470', '371400', '德州市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1471', '371402', '德城区', '2', '371400');
INSERT INTO `jie_zone` VALUES ('1472', '371403', '陵城区', '2', '371400');
INSERT INTO `jie_zone` VALUES ('1473', '371422', '宁津县', '2', '371400');
INSERT INTO `jie_zone` VALUES ('1474', '371423', '庆云县', '2', '371400');
INSERT INTO `jie_zone` VALUES ('1475', '371424', '临邑县', '2', '371400');
INSERT INTO `jie_zone` VALUES ('1476', '371425', '齐河县', '2', '371400');
INSERT INTO `jie_zone` VALUES ('1477', '371426', '平原县', '2', '371400');
INSERT INTO `jie_zone` VALUES ('1478', '371427', '夏津县', '2', '371400');
INSERT INTO `jie_zone` VALUES ('1479', '371428', '武城县', '2', '371400');
INSERT INTO `jie_zone` VALUES ('1480', '371481', '乐陵市', '2', '371400');
INSERT INTO `jie_zone` VALUES ('1481', '371482', '禹城市', '2', '371400');
INSERT INTO `jie_zone` VALUES ('1482', '371500', '聊城市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1483', '371502', '东昌府区', '2', '371500');
INSERT INTO `jie_zone` VALUES ('1484', '371521', '阳谷县', '2', '371500');
INSERT INTO `jie_zone` VALUES ('1485', '371522', '莘县', '2', '371500');
INSERT INTO `jie_zone` VALUES ('1486', '371523', '茌平县', '2', '371500');
INSERT INTO `jie_zone` VALUES ('1487', '371524', '东阿县', '2', '371500');
INSERT INTO `jie_zone` VALUES ('1488', '371525', '冠县', '2', '371500');
INSERT INTO `jie_zone` VALUES ('1489', '371526', '高唐县', '2', '371500');
INSERT INTO `jie_zone` VALUES ('1490', '371581', '临清市', '2', '371500');
INSERT INTO `jie_zone` VALUES ('1491', '371600', '滨州市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1492', '371602', '滨城区', '2', '371600');
INSERT INTO `jie_zone` VALUES ('1493', '371603', '沾化区', '2', '371600');
INSERT INTO `jie_zone` VALUES ('1494', '371621', '惠民县', '2', '371600');
INSERT INTO `jie_zone` VALUES ('1495', '371622', '阳信县', '2', '371600');
INSERT INTO `jie_zone` VALUES ('1496', '371623', '无棣县', '2', '371600');
INSERT INTO `jie_zone` VALUES ('1497', '371625', '博兴县', '2', '371600');
INSERT INTO `jie_zone` VALUES ('1498', '371626', '邹平县', '2', '371600');
INSERT INTO `jie_zone` VALUES ('1499', '371700', '菏泽市', '1', '370000');
INSERT INTO `jie_zone` VALUES ('1500', '371702', '牡丹区', '2', '371700');
INSERT INTO `jie_zone` VALUES ('1501', '371721', '曹县', '2', '371700');
INSERT INTO `jie_zone` VALUES ('1502', '371722', '单县', '2', '371700');
INSERT INTO `jie_zone` VALUES ('1503', '371723', '成武县', '2', '371700');
INSERT INTO `jie_zone` VALUES ('1504', '371724', '巨野县', '2', '371700');
INSERT INTO `jie_zone` VALUES ('1505', '371725', '郓城县', '2', '371700');
INSERT INTO `jie_zone` VALUES ('1506', '371726', '鄄城县', '2', '371700');
INSERT INTO `jie_zone` VALUES ('1507', '371727', '定陶县', '2', '371700');
INSERT INTO `jie_zone` VALUES ('1508', '371728', '东明县', '2', '371700');
INSERT INTO `jie_zone` VALUES ('1509', '410000', '河南省', '0', '0');
INSERT INTO `jie_zone` VALUES ('1510', '410100', '郑州市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1511', '410102', '中原区', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1512', '410103', '二七区', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1513', '410104', '管城回族区', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1514', '410105', '金水区', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1515', '410106', '上街区', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1516', '410108', '惠济区', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1517', '410122', '中牟县', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1518', '410181', '巩义市', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1519', '410182', '荥阳市', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1520', '410183', '新密市', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1521', '410184', '新郑市', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1522', '410185', '登封市', '2', '410100');
INSERT INTO `jie_zone` VALUES ('1523', '410200', '开封市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1524', '410202', '龙亭区', '2', '410200');
INSERT INTO `jie_zone` VALUES ('1525', '410203', '顺河回族区', '2', '410200');
INSERT INTO `jie_zone` VALUES ('1526', '410204', '鼓楼区', '2', '410200');
INSERT INTO `jie_zone` VALUES ('1527', '410205', '禹王台区', '2', '410200');
INSERT INTO `jie_zone` VALUES ('1528', '410211', '金明区', '2', '410200');
INSERT INTO `jie_zone` VALUES ('1529', '410221', '杞县', '2', '410200');
INSERT INTO `jie_zone` VALUES ('1530', '410222', '通许县', '2', '410200');
INSERT INTO `jie_zone` VALUES ('1531', '410223', '尉氏县', '2', '410200');
INSERT INTO `jie_zone` VALUES ('1532', '410224', '开封县', '2', '410200');
INSERT INTO `jie_zone` VALUES ('1533', '410225', '兰考县', '2', '410200');
INSERT INTO `jie_zone` VALUES ('1534', '410300', '洛阳市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1535', '410302', '老城区', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1536', '410303', '西工区', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1537', '410304', '瀍河回族区', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1538', '410305', '涧西区', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1539', '410306', '吉利区', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1540', '410311', '洛龙区', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1541', '410322', '孟津县', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1542', '410323', '新安县', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1543', '410324', '栾川县', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1544', '410325', '嵩县', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1545', '410326', '汝阳县', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1546', '410327', '宜阳县', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1547', '410328', '洛宁县', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1548', '410329', '伊川县', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1549', '410381', '偃师市', '2', '410300');
INSERT INTO `jie_zone` VALUES ('1550', '410400', '平顶山市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1551', '410402', '新华区', '2', '410400');
INSERT INTO `jie_zone` VALUES ('1552', '410403', '卫东区', '2', '410400');
INSERT INTO `jie_zone` VALUES ('1553', '410404', '石龙区', '2', '410400');
INSERT INTO `jie_zone` VALUES ('1554', '410411', '湛河区', '2', '410400');
INSERT INTO `jie_zone` VALUES ('1555', '410421', '宝丰县', '2', '410400');
INSERT INTO `jie_zone` VALUES ('1556', '410422', '叶县', '2', '410400');
INSERT INTO `jie_zone` VALUES ('1557', '410423', '鲁山县', '2', '410400');
INSERT INTO `jie_zone` VALUES ('1558', '410425', '郏县', '2', '410400');
INSERT INTO `jie_zone` VALUES ('1559', '410481', '舞钢市', '2', '410400');
INSERT INTO `jie_zone` VALUES ('1560', '410482', '汝州市', '2', '410400');
INSERT INTO `jie_zone` VALUES ('1561', '410500', '安阳市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1562', '410502', '文峰区', '2', '410500');
INSERT INTO `jie_zone` VALUES ('1563', '410503', '北关区', '2', '410500');
INSERT INTO `jie_zone` VALUES ('1564', '410505', '殷都区', '2', '410500');
INSERT INTO `jie_zone` VALUES ('1565', '410506', '龙安区', '2', '410500');
INSERT INTO `jie_zone` VALUES ('1566', '410522', '安阳县', '2', '410500');
INSERT INTO `jie_zone` VALUES ('1567', '410523', '汤阴县', '2', '410500');
INSERT INTO `jie_zone` VALUES ('1568', '410526', '滑县', '2', '410500');
INSERT INTO `jie_zone` VALUES ('1569', '410527', '内黄县', '2', '410500');
INSERT INTO `jie_zone` VALUES ('1570', '410581', '林州市', '2', '410500');
INSERT INTO `jie_zone` VALUES ('1571', '410600', '鹤壁市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1572', '410602', '鹤山区', '2', '410600');
INSERT INTO `jie_zone` VALUES ('1573', '410603', '山城区', '2', '410600');
INSERT INTO `jie_zone` VALUES ('1574', '410611', '淇滨区', '2', '410600');
INSERT INTO `jie_zone` VALUES ('1575', '410621', '浚县', '2', '410600');
INSERT INTO `jie_zone` VALUES ('1576', '410622', '淇县', '2', '410600');
INSERT INTO `jie_zone` VALUES ('1577', '410700', '新乡市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1578', '410702', '红旗区', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1579', '410703', '卫滨区', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1580', '410704', '凤泉区', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1581', '410711', '牧野区', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1582', '410721', '新乡县', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1583', '410724', '获嘉县', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1584', '410725', '原阳县', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1585', '410726', '延津县', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1586', '410727', '封丘县', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1587', '410728', '长垣县', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1588', '410781', '卫辉市', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1589', '410782', '辉县市', '2', '410700');
INSERT INTO `jie_zone` VALUES ('1590', '410800', '焦作市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1591', '410802', '解放区', '2', '410800');
INSERT INTO `jie_zone` VALUES ('1592', '410803', '中站区', '2', '410800');
INSERT INTO `jie_zone` VALUES ('1593', '410804', '马村区', '2', '410800');
INSERT INTO `jie_zone` VALUES ('1594', '410811', '山阳区', '2', '410800');
INSERT INTO `jie_zone` VALUES ('1595', '410821', '修武县', '2', '410800');
INSERT INTO `jie_zone` VALUES ('1596', '410822', '博爱县', '2', '410800');
INSERT INTO `jie_zone` VALUES ('1597', '410823', '武陟县', '2', '410800');
INSERT INTO `jie_zone` VALUES ('1598', '410825', '温县', '2', '410800');
INSERT INTO `jie_zone` VALUES ('1599', '410882', '沁阳市', '2', '410800');
INSERT INTO `jie_zone` VALUES ('1600', '410883', '孟州市', '2', '410800');
INSERT INTO `jie_zone` VALUES ('1601', '410900', '濮阳市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1602', '410902', '华龙区', '2', '410900');
INSERT INTO `jie_zone` VALUES ('1603', '410922', '清丰县', '2', '410900');
INSERT INTO `jie_zone` VALUES ('1604', '410923', '南乐县', '2', '410900');
INSERT INTO `jie_zone` VALUES ('1605', '410926', '范县', '2', '410900');
INSERT INTO `jie_zone` VALUES ('1606', '410927', '台前县', '2', '410900');
INSERT INTO `jie_zone` VALUES ('1607', '410928', '濮阳县', '2', '410900');
INSERT INTO `jie_zone` VALUES ('1608', '411000', '许昌市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1609', '411002', '魏都区', '2', '411000');
INSERT INTO `jie_zone` VALUES ('1610', '411023', '许昌县', '2', '411000');
INSERT INTO `jie_zone` VALUES ('1611', '411024', '鄢陵县', '2', '411000');
INSERT INTO `jie_zone` VALUES ('1612', '411025', '襄城县', '2', '411000');
INSERT INTO `jie_zone` VALUES ('1613', '411081', '禹州市', '2', '411000');
INSERT INTO `jie_zone` VALUES ('1614', '411082', '长葛市', '2', '411000');
INSERT INTO `jie_zone` VALUES ('1615', '411100', '漯河市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1616', '411102', '源汇区', '2', '411100');
INSERT INTO `jie_zone` VALUES ('1617', '411103', '郾城区', '2', '411100');
INSERT INTO `jie_zone` VALUES ('1618', '411104', '召陵区', '2', '411100');
INSERT INTO `jie_zone` VALUES ('1619', '411121', '舞阳县', '2', '411100');
INSERT INTO `jie_zone` VALUES ('1620', '411122', '临颍县', '2', '411100');
INSERT INTO `jie_zone` VALUES ('1621', '411200', '三门峡市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1622', '411202', '湖滨区', '2', '411200');
INSERT INTO `jie_zone` VALUES ('1623', '411221', '渑池县', '2', '411200');
INSERT INTO `jie_zone` VALUES ('1624', '411222', '陕县', '2', '411200');
INSERT INTO `jie_zone` VALUES ('1625', '411224', '卢氏县', '2', '411200');
INSERT INTO `jie_zone` VALUES ('1626', '411281', '义马市', '2', '411200');
INSERT INTO `jie_zone` VALUES ('1627', '411282', '灵宝市', '2', '411200');
INSERT INTO `jie_zone` VALUES ('1628', '411300', '南阳市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1629', '411302', '宛城区', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1630', '411303', '卧龙区', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1631', '411321', '南召县', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1632', '411322', '方城县', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1633', '411323', '西峡县', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1634', '411324', '镇平县', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1635', '411325', '内乡县', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1636', '411326', '淅川县', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1637', '411327', '社旗县', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1638', '411328', '唐河县', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1639', '411329', '新野县', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1640', '411330', '桐柏县', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1641', '411381', '邓州市', '2', '411300');
INSERT INTO `jie_zone` VALUES ('1642', '411400', '商丘市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1643', '411402', '梁园区', '2', '411400');
INSERT INTO `jie_zone` VALUES ('1644', '411403', '睢阳区', '2', '411400');
INSERT INTO `jie_zone` VALUES ('1645', '411421', '民权县', '2', '411400');
INSERT INTO `jie_zone` VALUES ('1646', '411422', '睢县', '2', '411400');
INSERT INTO `jie_zone` VALUES ('1647', '411423', '宁陵县', '2', '411400');
INSERT INTO `jie_zone` VALUES ('1648', '411424', '柘城县', '2', '411400');
INSERT INTO `jie_zone` VALUES ('1649', '411425', '虞城县', '2', '411400');
INSERT INTO `jie_zone` VALUES ('1650', '411426', '夏邑县', '2', '411400');
INSERT INTO `jie_zone` VALUES ('1651', '411481', '永城市', '2', '411400');
INSERT INTO `jie_zone` VALUES ('1652', '411500', '信阳市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1653', '411502', '浉河区', '2', '411500');
INSERT INTO `jie_zone` VALUES ('1654', '411503', '平桥区', '2', '411500');
INSERT INTO `jie_zone` VALUES ('1655', '411521', '罗山县', '2', '411500');
INSERT INTO `jie_zone` VALUES ('1656', '411522', '光山县', '2', '411500');
INSERT INTO `jie_zone` VALUES ('1657', '411523', '新县', '2', '411500');
INSERT INTO `jie_zone` VALUES ('1658', '411524', '商城县', '2', '411500');
INSERT INTO `jie_zone` VALUES ('1659', '411525', '固始县', '2', '411500');
INSERT INTO `jie_zone` VALUES ('1660', '411526', '潢川县', '2', '411500');
INSERT INTO `jie_zone` VALUES ('1661', '411527', '淮滨县', '2', '411500');
INSERT INTO `jie_zone` VALUES ('1662', '411528', '息县', '2', '411500');
INSERT INTO `jie_zone` VALUES ('1663', '411600', '周口市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1664', '411602', '川汇区', '2', '411600');
INSERT INTO `jie_zone` VALUES ('1665', '411621', '扶沟县', '2', '411600');
INSERT INTO `jie_zone` VALUES ('1666', '411622', '西华县', '2', '411600');
INSERT INTO `jie_zone` VALUES ('1667', '411623', '商水县', '2', '411600');
INSERT INTO `jie_zone` VALUES ('1668', '411624', '沈丘县', '2', '411600');
INSERT INTO `jie_zone` VALUES ('1669', '411625', '郸城县', '2', '411600');
INSERT INTO `jie_zone` VALUES ('1670', '411626', '淮阳县', '2', '411600');
INSERT INTO `jie_zone` VALUES ('1671', '411627', '太康县', '2', '411600');
INSERT INTO `jie_zone` VALUES ('1672', '411628', '鹿邑县', '2', '411600');
INSERT INTO `jie_zone` VALUES ('1673', '411681', '项城市', '2', '411600');
INSERT INTO `jie_zone` VALUES ('1674', '411700', '驻马店市', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1675', '411702', '驿城区', '2', '411700');
INSERT INTO `jie_zone` VALUES ('1676', '411721', '西平县', '2', '411700');
INSERT INTO `jie_zone` VALUES ('1677', '411722', '上蔡县', '2', '411700');
INSERT INTO `jie_zone` VALUES ('1678', '411723', '平舆县', '2', '411700');
INSERT INTO `jie_zone` VALUES ('1679', '411724', '正阳县', '2', '411700');
INSERT INTO `jie_zone` VALUES ('1680', '411725', '确山县', '2', '411700');
INSERT INTO `jie_zone` VALUES ('1681', '411726', '泌阳县', '2', '411700');
INSERT INTO `jie_zone` VALUES ('1682', '411727', '汝南县', '2', '411700');
INSERT INTO `jie_zone` VALUES ('1683', '411728', '遂平县', '2', '411700');
INSERT INTO `jie_zone` VALUES ('1684', '411729', '新蔡县', '2', '411700');
INSERT INTO `jie_zone` VALUES ('1685', '419000', '省直辖县级行政区划', '1', '410000');
INSERT INTO `jie_zone` VALUES ('1686', '419001', '济源市', '2', '419000');
INSERT INTO `jie_zone` VALUES ('1687', '420000', '湖北省', '0', '0');
INSERT INTO `jie_zone` VALUES ('1688', '420100', '武汉市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1689', '420102', '江岸区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1690', '420103', '江汉区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1691', '420104', '硚口区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1692', '420105', '汉阳区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1693', '420106', '武昌区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1694', '420107', '青山区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1695', '420111', '洪山区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1696', '420112', '东西湖区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1697', '420113', '汉南区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1698', '420114', '蔡甸区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1699', '420115', '江夏区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1700', '420116', '黄陂区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1701', '420117', '新洲区', '2', '420100');
INSERT INTO `jie_zone` VALUES ('1702', '420200', '黄石市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1703', '420202', '黄石港区', '2', '420200');
INSERT INTO `jie_zone` VALUES ('1704', '420203', '西塞山区', '2', '420200');
INSERT INTO `jie_zone` VALUES ('1705', '420204', '下陆区', '2', '420200');
INSERT INTO `jie_zone` VALUES ('1706', '420205', '铁山区', '2', '420200');
INSERT INTO `jie_zone` VALUES ('1707', '420222', '阳新县', '2', '420200');
INSERT INTO `jie_zone` VALUES ('1708', '420281', '大冶市', '2', '420200');
INSERT INTO `jie_zone` VALUES ('1709', '420300', '十堰市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1710', '420302', '茅箭区', '2', '420300');
INSERT INTO `jie_zone` VALUES ('1711', '420303', '张湾区', '2', '420300');
INSERT INTO `jie_zone` VALUES ('1712', '420304', '郧阳区', '2', '420300');
INSERT INTO `jie_zone` VALUES ('1713', '420322', '郧西县', '2', '420300');
INSERT INTO `jie_zone` VALUES ('1714', '420323', '竹山县', '2', '420300');
INSERT INTO `jie_zone` VALUES ('1715', '420324', '竹溪县', '2', '420300');
INSERT INTO `jie_zone` VALUES ('1716', '420325', '房县', '2', '420300');
INSERT INTO `jie_zone` VALUES ('1717', '420381', '丹江口市', '2', '420300');
INSERT INTO `jie_zone` VALUES ('1718', '420500', '宜昌市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1719', '420502', '西陵区', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1720', '420503', '伍家岗区', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1721', '420504', '点军区', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1722', '420505', '猇亭区', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1723', '420506', '夷陵区', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1724', '420525', '远安县', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1725', '420526', '兴山县', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1726', '420527', '秭归县', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1727', '420528', '长阳土家族自治县', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1728', '420529', '五峰土家族自治县', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1729', '420581', '宜都市', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1730', '420582', '当阳市', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1731', '420583', '枝江市', '2', '420500');
INSERT INTO `jie_zone` VALUES ('1732', '420600', '襄阳市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1733', '420602', '襄城区', '2', '420600');
INSERT INTO `jie_zone` VALUES ('1734', '420606', '樊城区', '2', '420600');
INSERT INTO `jie_zone` VALUES ('1735', '420607', '襄州区', '2', '420600');
INSERT INTO `jie_zone` VALUES ('1736', '420624', '南漳县', '2', '420600');
INSERT INTO `jie_zone` VALUES ('1737', '420625', '谷城县', '2', '420600');
INSERT INTO `jie_zone` VALUES ('1738', '420626', '保康县', '2', '420600');
INSERT INTO `jie_zone` VALUES ('1739', '420682', '老河口市', '2', '420600');
INSERT INTO `jie_zone` VALUES ('1740', '420683', '枣阳市', '2', '420600');
INSERT INTO `jie_zone` VALUES ('1741', '420684', '宜城市', '2', '420600');
INSERT INTO `jie_zone` VALUES ('1742', '420700', '鄂州市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1743', '420702', '梁子湖区', '2', '420700');
INSERT INTO `jie_zone` VALUES ('1744', '420703', '华容区', '2', '420700');
INSERT INTO `jie_zone` VALUES ('1745', '420704', '鄂城区', '2', '420700');
INSERT INTO `jie_zone` VALUES ('1746', '420800', '荆门市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1747', '420802', '东宝区', '2', '420800');
INSERT INTO `jie_zone` VALUES ('1748', '420804', '掇刀区', '2', '420800');
INSERT INTO `jie_zone` VALUES ('1749', '420821', '京山县', '2', '420800');
INSERT INTO `jie_zone` VALUES ('1750', '420822', '沙洋县', '2', '420800');
INSERT INTO `jie_zone` VALUES ('1751', '420881', '钟祥市', '2', '420800');
INSERT INTO `jie_zone` VALUES ('1752', '420900', '孝感市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1753', '420902', '孝南区', '2', '420900');
INSERT INTO `jie_zone` VALUES ('1754', '420921', '孝昌县', '2', '420900');
INSERT INTO `jie_zone` VALUES ('1755', '420922', '大悟县', '2', '420900');
INSERT INTO `jie_zone` VALUES ('1756', '420923', '云梦县', '2', '420900');
INSERT INTO `jie_zone` VALUES ('1757', '420981', '应城市', '2', '420900');
INSERT INTO `jie_zone` VALUES ('1758', '420982', '安陆市', '2', '420900');
INSERT INTO `jie_zone` VALUES ('1759', '420984', '汉川市', '2', '420900');
INSERT INTO `jie_zone` VALUES ('1760', '421000', '荆州市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1761', '421002', '沙市区', '2', '421000');
INSERT INTO `jie_zone` VALUES ('1762', '421003', '荆州区', '2', '421000');
INSERT INTO `jie_zone` VALUES ('1763', '421022', '公安县', '2', '421000');
INSERT INTO `jie_zone` VALUES ('1764', '421023', '监利县', '2', '421000');
INSERT INTO `jie_zone` VALUES ('1765', '421024', '江陵县', '2', '421000');
INSERT INTO `jie_zone` VALUES ('1766', '421081', '石首市', '2', '421000');
INSERT INTO `jie_zone` VALUES ('1767', '421083', '洪湖市', '2', '421000');
INSERT INTO `jie_zone` VALUES ('1768', '421087', '松滋市', '2', '421000');
INSERT INTO `jie_zone` VALUES ('1769', '421100', '黄冈市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1770', '421102', '黄州区', '2', '421100');
INSERT INTO `jie_zone` VALUES ('1771', '421121', '团风县', '2', '421100');
INSERT INTO `jie_zone` VALUES ('1772', '421122', '红安县', '2', '421100');
INSERT INTO `jie_zone` VALUES ('1773', '421123', '罗田县', '2', '421100');
INSERT INTO `jie_zone` VALUES ('1774', '421124', '英山县', '2', '421100');
INSERT INTO `jie_zone` VALUES ('1775', '421125', '浠水县', '2', '421100');
INSERT INTO `jie_zone` VALUES ('1776', '421126', '蕲春县', '2', '421100');
INSERT INTO `jie_zone` VALUES ('1777', '421127', '黄梅县', '2', '421100');
INSERT INTO `jie_zone` VALUES ('1778', '421181', '麻城市', '2', '421100');
INSERT INTO `jie_zone` VALUES ('1779', '421182', '武穴市', '2', '421100');
INSERT INTO `jie_zone` VALUES ('1780', '421200', '咸宁市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1781', '421202', '咸安区', '2', '421200');
INSERT INTO `jie_zone` VALUES ('1782', '421221', '嘉鱼县', '2', '421200');
INSERT INTO `jie_zone` VALUES ('1783', '421222', '通城县', '2', '421200');
INSERT INTO `jie_zone` VALUES ('1784', '421223', '崇阳县', '2', '421200');
INSERT INTO `jie_zone` VALUES ('1785', '421224', '通山县', '2', '421200');
INSERT INTO `jie_zone` VALUES ('1786', '421281', '赤壁市', '2', '421200');
INSERT INTO `jie_zone` VALUES ('1787', '421300', '随州市', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1788', '421303', '曾都区', '2', '421300');
INSERT INTO `jie_zone` VALUES ('1789', '421321', '随县', '2', '421300');
INSERT INTO `jie_zone` VALUES ('1790', '421381', '广水市', '2', '421300');
INSERT INTO `jie_zone` VALUES ('1791', '422800', '恩施土家族苗族自治州', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1792', '422801', '恩施市', '2', '422800');
INSERT INTO `jie_zone` VALUES ('1793', '422802', '利川市', '2', '422800');
INSERT INTO `jie_zone` VALUES ('1794', '422822', '建始县', '2', '422800');
INSERT INTO `jie_zone` VALUES ('1795', '422823', '巴东县', '2', '422800');
INSERT INTO `jie_zone` VALUES ('1796', '422825', '宣恩县', '2', '422800');
INSERT INTO `jie_zone` VALUES ('1797', '422826', '咸丰县', '2', '422800');
INSERT INTO `jie_zone` VALUES ('1798', '422827', '来凤县', '2', '422800');
INSERT INTO `jie_zone` VALUES ('1799', '422828', '鹤峰县', '2', '422800');
INSERT INTO `jie_zone` VALUES ('1800', '429000', '省直辖县级行政区划', '1', '420000');
INSERT INTO `jie_zone` VALUES ('1801', '429004', '仙桃市', '2', '429000');
INSERT INTO `jie_zone` VALUES ('1802', '429005', '潜江市', '2', '429000');
INSERT INTO `jie_zone` VALUES ('1803', '429006', '天门市', '2', '429000');
INSERT INTO `jie_zone` VALUES ('1804', '429021', '神农架林区', '2', '429000');
INSERT INTO `jie_zone` VALUES ('1805', '430000', '湖南省', '0', '0');
INSERT INTO `jie_zone` VALUES ('1806', '430100', '长沙市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1807', '430102', '芙蓉区', '2', '430100');
INSERT INTO `jie_zone` VALUES ('1808', '430103', '天心区', '2', '430100');
INSERT INTO `jie_zone` VALUES ('1809', '430104', '岳麓区', '2', '430100');
INSERT INTO `jie_zone` VALUES ('1810', '430105', '开福区', '2', '430100');
INSERT INTO `jie_zone` VALUES ('1811', '430111', '雨花区', '2', '430100');
INSERT INTO `jie_zone` VALUES ('1812', '430112', '望城区', '2', '430100');
INSERT INTO `jie_zone` VALUES ('1813', '430121', '长沙县', '2', '430100');
INSERT INTO `jie_zone` VALUES ('1814', '430124', '宁乡县', '2', '430100');
INSERT INTO `jie_zone` VALUES ('1815', '430181', '浏阳市', '2', '430100');
INSERT INTO `jie_zone` VALUES ('1816', '430200', '株洲市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1817', '430202', '荷塘区', '2', '430200');
INSERT INTO `jie_zone` VALUES ('1818', '430203', '芦淞区', '2', '430200');
INSERT INTO `jie_zone` VALUES ('1819', '430204', '石峰区', '2', '430200');
INSERT INTO `jie_zone` VALUES ('1820', '430211', '天元区', '2', '430200');
INSERT INTO `jie_zone` VALUES ('1821', '430221', '株洲县', '2', '430200');
INSERT INTO `jie_zone` VALUES ('1822', '430223', '攸县', '2', '430200');
INSERT INTO `jie_zone` VALUES ('1823', '430224', '茶陵县', '2', '430200');
INSERT INTO `jie_zone` VALUES ('1824', '430225', '炎陵县', '2', '430200');
INSERT INTO `jie_zone` VALUES ('1825', '430281', '醴陵市', '2', '430200');
INSERT INTO `jie_zone` VALUES ('1826', '430300', '湘潭市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1827', '430302', '雨湖区', '2', '430300');
INSERT INTO `jie_zone` VALUES ('1828', '430304', '岳塘区', '2', '430300');
INSERT INTO `jie_zone` VALUES ('1829', '430321', '湘潭县', '2', '430300');
INSERT INTO `jie_zone` VALUES ('1830', '430381', '湘乡市', '2', '430300');
INSERT INTO `jie_zone` VALUES ('1831', '430382', '韶山市', '2', '430300');
INSERT INTO `jie_zone` VALUES ('1832', '430400', '衡阳市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1833', '430405', '珠晖区', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1834', '430406', '雁峰区', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1835', '430407', '石鼓区', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1836', '430408', '蒸湘区', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1837', '430412', '南岳区', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1838', '430421', '衡阳县', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1839', '430422', '衡南县', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1840', '430423', '衡山县', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1841', '430424', '衡东县', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1842', '430426', '祁东县', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1843', '430481', '耒阳市', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1844', '430482', '常宁市', '2', '430400');
INSERT INTO `jie_zone` VALUES ('1845', '430500', '邵阳市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1846', '430502', '双清区', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1847', '430503', '大祥区', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1848', '430511', '北塔区', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1849', '430521', '邵东县', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1850', '430522', '新邵县', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1851', '430523', '邵阳县', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1852', '430524', '隆回县', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1853', '430525', '洞口县', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1854', '430527', '绥宁县', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1855', '430528', '新宁县', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1856', '430529', '城步苗族自治县', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1857', '430581', '武冈市', '2', '430500');
INSERT INTO `jie_zone` VALUES ('1858', '430600', '岳阳市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1859', '430602', '岳阳楼区', '2', '430600');
INSERT INTO `jie_zone` VALUES ('1860', '430603', '云溪区', '2', '430600');
INSERT INTO `jie_zone` VALUES ('1861', '430611', '君山区', '2', '430600');
INSERT INTO `jie_zone` VALUES ('1862', '430621', '岳阳县', '2', '430600');
INSERT INTO `jie_zone` VALUES ('1863', '430623', '华容县', '2', '430600');
INSERT INTO `jie_zone` VALUES ('1864', '430624', '湘阴县', '2', '430600');
INSERT INTO `jie_zone` VALUES ('1865', '430626', '平江县', '2', '430600');
INSERT INTO `jie_zone` VALUES ('1866', '430681', '汨罗市', '2', '430600');
INSERT INTO `jie_zone` VALUES ('1867', '430682', '临湘市', '2', '430600');
INSERT INTO `jie_zone` VALUES ('1868', '430700', '常德市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1869', '430702', '武陵区', '2', '430700');
INSERT INTO `jie_zone` VALUES ('1870', '430703', '鼎城区', '2', '430700');
INSERT INTO `jie_zone` VALUES ('1871', '430721', '安乡县', '2', '430700');
INSERT INTO `jie_zone` VALUES ('1872', '430722', '汉寿县', '2', '430700');
INSERT INTO `jie_zone` VALUES ('1873', '430723', '澧县', '2', '430700');
INSERT INTO `jie_zone` VALUES ('1874', '430724', '临澧县', '2', '430700');
INSERT INTO `jie_zone` VALUES ('1875', '430725', '桃源县', '2', '430700');
INSERT INTO `jie_zone` VALUES ('1876', '430726', '石门县', '2', '430700');
INSERT INTO `jie_zone` VALUES ('1877', '430781', '津市市', '2', '430700');
INSERT INTO `jie_zone` VALUES ('1878', '430800', '张家界市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1879', '430802', '永定区', '2', '430800');
INSERT INTO `jie_zone` VALUES ('1880', '430811', '武陵源区', '2', '430800');
INSERT INTO `jie_zone` VALUES ('1881', '430821', '慈利县', '2', '430800');
INSERT INTO `jie_zone` VALUES ('1882', '430822', '桑植县', '2', '430800');
INSERT INTO `jie_zone` VALUES ('1883', '430900', '益阳市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1884', '430902', '资阳区', '2', '430900');
INSERT INTO `jie_zone` VALUES ('1885', '430903', '赫山区', '2', '430900');
INSERT INTO `jie_zone` VALUES ('1886', '430921', '南县', '2', '430900');
INSERT INTO `jie_zone` VALUES ('1887', '430922', '桃江县', '2', '430900');
INSERT INTO `jie_zone` VALUES ('1888', '430923', '安化县', '2', '430900');
INSERT INTO `jie_zone` VALUES ('1889', '430981', '沅江市', '2', '430900');
INSERT INTO `jie_zone` VALUES ('1890', '431000', '郴州市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1891', '431002', '北湖区', '2', '431000');
INSERT INTO `jie_zone` VALUES ('1892', '431003', '苏仙区', '2', '431000');
INSERT INTO `jie_zone` VALUES ('1893', '431021', '桂阳县', '2', '431000');
INSERT INTO `jie_zone` VALUES ('1894', '431022', '宜章县', '2', '431000');
INSERT INTO `jie_zone` VALUES ('1895', '431023', '永兴县', '2', '431000');
INSERT INTO `jie_zone` VALUES ('1896', '431024', '嘉禾县', '2', '431000');
INSERT INTO `jie_zone` VALUES ('1897', '431025', '临武县', '2', '431000');
INSERT INTO `jie_zone` VALUES ('1898', '431026', '汝城县', '2', '431000');
INSERT INTO `jie_zone` VALUES ('1899', '431027', '桂东县', '2', '431000');
INSERT INTO `jie_zone` VALUES ('1900', '431028', '安仁县', '2', '431000');
INSERT INTO `jie_zone` VALUES ('1901', '431081', '资兴市', '2', '431000');
INSERT INTO `jie_zone` VALUES ('1902', '431100', '永州市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1903', '431102', '零陵区', '2', '431100');
INSERT INTO `jie_zone` VALUES ('1904', '431103', '冷水滩区', '2', '431100');
INSERT INTO `jie_zone` VALUES ('1905', '431121', '祁阳县', '2', '431100');
INSERT INTO `jie_zone` VALUES ('1906', '431122', '东安县', '2', '431100');
INSERT INTO `jie_zone` VALUES ('1907', '431123', '双牌县', '2', '431100');
INSERT INTO `jie_zone` VALUES ('1908', '431124', '道县', '2', '431100');
INSERT INTO `jie_zone` VALUES ('1909', '431125', '江永县', '2', '431100');
INSERT INTO `jie_zone` VALUES ('1910', '431126', '宁远县', '2', '431100');
INSERT INTO `jie_zone` VALUES ('1911', '431127', '蓝山县', '2', '431100');
INSERT INTO `jie_zone` VALUES ('1912', '431128', '新田县', '2', '431100');
INSERT INTO `jie_zone` VALUES ('1913', '431129', '江华瑶族自治县', '2', '431100');
INSERT INTO `jie_zone` VALUES ('1914', '431200', '怀化市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1915', '431202', '鹤城区', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1916', '431221', '中方县', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1917', '431222', '沅陵县', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1918', '431223', '辰溪县', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1919', '431224', '溆浦县', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1920', '431225', '会同县', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1921', '431226', '麻阳苗族自治县', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1922', '431227', '新晃侗族自治县', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1923', '431228', '芷江侗族自治县', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1924', '431229', '靖州苗族侗族自治县', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1925', '431230', '通道侗族自治县', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1926', '431281', '洪江市', '2', '431200');
INSERT INTO `jie_zone` VALUES ('1927', '431300', '娄底市', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1928', '431302', '娄星区', '2', '431300');
INSERT INTO `jie_zone` VALUES ('1929', '431321', '双峰县', '2', '431300');
INSERT INTO `jie_zone` VALUES ('1930', '431322', '新化县', '2', '431300');
INSERT INTO `jie_zone` VALUES ('1931', '431381', '冷水江市', '2', '431300');
INSERT INTO `jie_zone` VALUES ('1932', '431382', '涟源市', '2', '431300');
INSERT INTO `jie_zone` VALUES ('1933', '433100', '湘西土家族苗族自治州', '1', '430000');
INSERT INTO `jie_zone` VALUES ('1934', '433101', '吉首市', '2', '433100');
INSERT INTO `jie_zone` VALUES ('1935', '433122', '泸溪县', '2', '433100');
INSERT INTO `jie_zone` VALUES ('1936', '433123', '凤凰县', '2', '433100');
INSERT INTO `jie_zone` VALUES ('1937', '433124', '花垣县', '2', '433100');
INSERT INTO `jie_zone` VALUES ('1938', '433125', '保靖县', '2', '433100');
INSERT INTO `jie_zone` VALUES ('1939', '433126', '古丈县', '2', '433100');
INSERT INTO `jie_zone` VALUES ('1940', '433127', '永顺县', '2', '433100');
INSERT INTO `jie_zone` VALUES ('1941', '433130', '龙山县', '2', '433100');
INSERT INTO `jie_zone` VALUES ('1942', '440000', '广东省', '0', '0');
INSERT INTO `jie_zone` VALUES ('1943', '440100', '广州市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('1944', '440103', '荔湾区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1945', '440104', '越秀区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1946', '440105', '海珠区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1947', '440106', '天河区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1948', '440111', '白云区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1949', '440112', '黄埔区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1950', '440113', '番禺区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1951', '440114', '花都区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1952', '440115', '南沙区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1953', '440116', '萝岗区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1954', '440117', '从化区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1955', '440118', '增城区', '2', '440100');
INSERT INTO `jie_zone` VALUES ('1956', '440200', '韶关市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('1957', '440203', '武江区', '2', '440200');
INSERT INTO `jie_zone` VALUES ('1958', '440204', '浈江区', '2', '440200');
INSERT INTO `jie_zone` VALUES ('1959', '440205', '曲江区', '2', '440200');
INSERT INTO `jie_zone` VALUES ('1960', '440222', '始兴县', '2', '440200');
INSERT INTO `jie_zone` VALUES ('1961', '440224', '仁化县', '2', '440200');
INSERT INTO `jie_zone` VALUES ('1962', '440229', '翁源县', '2', '440200');
INSERT INTO `jie_zone` VALUES ('1963', '440232', '乳源瑶族自治县', '2', '440200');
INSERT INTO `jie_zone` VALUES ('1964', '440233', '新丰县', '2', '440200');
INSERT INTO `jie_zone` VALUES ('1965', '440281', '乐昌市', '2', '440200');
INSERT INTO `jie_zone` VALUES ('1966', '440282', '南雄市', '2', '440200');
INSERT INTO `jie_zone` VALUES ('1967', '440300', '深圳市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('1968', '440303', '罗湖区', '2', '440300');
INSERT INTO `jie_zone` VALUES ('1969', '440304', '福田区', '2', '440300');
INSERT INTO `jie_zone` VALUES ('1970', '440305', '南山区', '2', '440300');
INSERT INTO `jie_zone` VALUES ('1971', '440306', '宝安区', '2', '440300');
INSERT INTO `jie_zone` VALUES ('1972', '440307', '龙岗区', '2', '440300');
INSERT INTO `jie_zone` VALUES ('1973', '440308', '盐田区', '2', '440300');
INSERT INTO `jie_zone` VALUES ('1974', '440400', '珠海市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('1975', '440402', '香洲区', '2', '440400');
INSERT INTO `jie_zone` VALUES ('1976', '440403', '斗门区', '2', '440400');
INSERT INTO `jie_zone` VALUES ('1977', '440404', '金湾区', '2', '440400');
INSERT INTO `jie_zone` VALUES ('1978', '440500', '汕头市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('1979', '440507', '龙湖区', '2', '440500');
INSERT INTO `jie_zone` VALUES ('1980', '440511', '金平区', '2', '440500');
INSERT INTO `jie_zone` VALUES ('1981', '440512', '濠江区', '2', '440500');
INSERT INTO `jie_zone` VALUES ('1982', '440513', '潮阳区', '2', '440500');
INSERT INTO `jie_zone` VALUES ('1983', '440514', '潮南区', '2', '440500');
INSERT INTO `jie_zone` VALUES ('1984', '440515', '澄海区', '2', '440500');
INSERT INTO `jie_zone` VALUES ('1985', '440523', '南澳县', '2', '440500');
INSERT INTO `jie_zone` VALUES ('1986', '440600', '佛山市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('1987', '440604', '禅城区', '2', '440600');
INSERT INTO `jie_zone` VALUES ('1988', '440605', '南海区', '2', '440600');
INSERT INTO `jie_zone` VALUES ('1989', '440606', '顺德区', '2', '440600');
INSERT INTO `jie_zone` VALUES ('1990', '440607', '三水区', '2', '440600');
INSERT INTO `jie_zone` VALUES ('1991', '440608', '高明区', '2', '440600');
INSERT INTO `jie_zone` VALUES ('1992', '440700', '江门市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('1993', '440703', '蓬江区', '2', '440700');
INSERT INTO `jie_zone` VALUES ('1994', '440704', '江海区', '2', '440700');
INSERT INTO `jie_zone` VALUES ('1995', '440705', '新会区', '2', '440700');
INSERT INTO `jie_zone` VALUES ('1996', '440781', '台山市', '2', '440700');
INSERT INTO `jie_zone` VALUES ('1997', '440783', '开平市', '2', '440700');
INSERT INTO `jie_zone` VALUES ('1998', '440784', '鹤山市', '2', '440700');
INSERT INTO `jie_zone` VALUES ('1999', '440785', '恩平市', '2', '440700');
INSERT INTO `jie_zone` VALUES ('2000', '440800', '湛江市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2001', '440802', '赤坎区', '2', '440800');
INSERT INTO `jie_zone` VALUES ('2002', '440803', '霞山区', '2', '440800');
INSERT INTO `jie_zone` VALUES ('2003', '440804', '坡头区', '2', '440800');
INSERT INTO `jie_zone` VALUES ('2004', '440811', '麻章区', '2', '440800');
INSERT INTO `jie_zone` VALUES ('2005', '440823', '遂溪县', '2', '440800');
INSERT INTO `jie_zone` VALUES ('2006', '440825', '徐闻县', '2', '440800');
INSERT INTO `jie_zone` VALUES ('2007', '440881', '廉江市', '2', '440800');
INSERT INTO `jie_zone` VALUES ('2008', '440882', '雷州市', '2', '440800');
INSERT INTO `jie_zone` VALUES ('2009', '440883', '吴川市', '2', '440800');
INSERT INTO `jie_zone` VALUES ('2010', '440900', '茂名市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2011', '440902', '茂南区', '2', '440900');
INSERT INTO `jie_zone` VALUES ('2012', '440904', '电白区', '2', '440900');
INSERT INTO `jie_zone` VALUES ('2013', '440981', '高州市', '2', '440900');
INSERT INTO `jie_zone` VALUES ('2014', '440982', '化州市', '2', '440900');
INSERT INTO `jie_zone` VALUES ('2015', '440983', '信宜市', '2', '440900');
INSERT INTO `jie_zone` VALUES ('2016', '441200', '肇庆市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2017', '441202', '端州区', '2', '441200');
INSERT INTO `jie_zone` VALUES ('2018', '441203', '鼎湖区', '2', '441200');
INSERT INTO `jie_zone` VALUES ('2019', '441223', '广宁县', '2', '441200');
INSERT INTO `jie_zone` VALUES ('2020', '441224', '怀集县', '2', '441200');
INSERT INTO `jie_zone` VALUES ('2021', '441225', '封开县', '2', '441200');
INSERT INTO `jie_zone` VALUES ('2022', '441226', '德庆县', '2', '441200');
INSERT INTO `jie_zone` VALUES ('2023', '441283', '高要市', '2', '441200');
INSERT INTO `jie_zone` VALUES ('2024', '441284', '四会市', '2', '441200');
INSERT INTO `jie_zone` VALUES ('2025', '441300', '惠州市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2026', '441302', '惠城区', '2', '441300');
INSERT INTO `jie_zone` VALUES ('2027', '441303', '惠阳区', '2', '441300');
INSERT INTO `jie_zone` VALUES ('2028', '441322', '博罗县', '2', '441300');
INSERT INTO `jie_zone` VALUES ('2029', '441323', '惠东县', '2', '441300');
INSERT INTO `jie_zone` VALUES ('2030', '441324', '龙门县', '2', '441300');
INSERT INTO `jie_zone` VALUES ('2031', '441400', '梅州市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2032', '441402', '梅江区', '2', '441400');
INSERT INTO `jie_zone` VALUES ('2033', '441403', '梅县区', '2', '441400');
INSERT INTO `jie_zone` VALUES ('2034', '441422', '大埔县', '2', '441400');
INSERT INTO `jie_zone` VALUES ('2035', '441423', '丰顺县', '2', '441400');
INSERT INTO `jie_zone` VALUES ('2036', '441424', '五华县', '2', '441400');
INSERT INTO `jie_zone` VALUES ('2037', '441426', '平远县', '2', '441400');
INSERT INTO `jie_zone` VALUES ('2038', '441427', '蕉岭县', '2', '441400');
INSERT INTO `jie_zone` VALUES ('2039', '441481', '兴宁市', '2', '441400');
INSERT INTO `jie_zone` VALUES ('2040', '441500', '汕尾市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2041', '441502', '城区', '2', '441500');
INSERT INTO `jie_zone` VALUES ('2042', '441521', '海丰县', '2', '441500');
INSERT INTO `jie_zone` VALUES ('2043', '441523', '陆河县', '2', '441500');
INSERT INTO `jie_zone` VALUES ('2044', '441581', '陆丰市', '2', '441500');
INSERT INTO `jie_zone` VALUES ('2045', '441600', '河源市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2046', '441602', '源城区', '2', '441600');
INSERT INTO `jie_zone` VALUES ('2047', '441621', '紫金县', '2', '441600');
INSERT INTO `jie_zone` VALUES ('2048', '441622', '龙川县', '2', '441600');
INSERT INTO `jie_zone` VALUES ('2049', '441623', '连平县', '2', '441600');
INSERT INTO `jie_zone` VALUES ('2050', '441624', '和平县', '2', '441600');
INSERT INTO `jie_zone` VALUES ('2051', '441625', '东源县', '2', '441600');
INSERT INTO `jie_zone` VALUES ('2052', '441700', '阳江市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2053', '441702', '江城区', '2', '441700');
INSERT INTO `jie_zone` VALUES ('2054', '441721', '阳西县', '2', '441700');
INSERT INTO `jie_zone` VALUES ('2055', '441723', '阳东县', '2', '441700');
INSERT INTO `jie_zone` VALUES ('2056', '441781', '阳春市', '2', '441700');
INSERT INTO `jie_zone` VALUES ('2057', '441800', '清远市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2058', '441802', '清城区', '2', '441800');
INSERT INTO `jie_zone` VALUES ('2059', '441803', '清新区', '2', '441800');
INSERT INTO `jie_zone` VALUES ('2060', '441821', '佛冈县', '2', '441800');
INSERT INTO `jie_zone` VALUES ('2061', '441823', '阳山县', '2', '441800');
INSERT INTO `jie_zone` VALUES ('2062', '441825', '连山壮族瑶族自治县', '2', '441800');
INSERT INTO `jie_zone` VALUES ('2063', '441826', '连南瑶族自治县', '2', '441800');
INSERT INTO `jie_zone` VALUES ('2064', '441881', '英德市', '2', '441800');
INSERT INTO `jie_zone` VALUES ('2065', '441882', '连州市', '2', '441800');
INSERT INTO `jie_zone` VALUES ('2066', '441900', '东莞市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2067', '442000', '中山市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2068', '445100', '潮州市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2069', '445102', '湘桥区', '2', '445100');
INSERT INTO `jie_zone` VALUES ('2070', '445103', '潮安区', '2', '445100');
INSERT INTO `jie_zone` VALUES ('2071', '445122', '饶平县', '2', '445100');
INSERT INTO `jie_zone` VALUES ('2072', '445200', '揭阳市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2073', '445202', '榕城区', '2', '445200');
INSERT INTO `jie_zone` VALUES ('2074', '445203', '揭东区', '2', '445200');
INSERT INTO `jie_zone` VALUES ('2075', '445222', '揭西县', '2', '445200');
INSERT INTO `jie_zone` VALUES ('2076', '445224', '惠来县', '2', '445200');
INSERT INTO `jie_zone` VALUES ('2077', '445281', '普宁市', '2', '445200');
INSERT INTO `jie_zone` VALUES ('2078', '445300', '云浮市', '1', '440000');
INSERT INTO `jie_zone` VALUES ('2079', '445302', '云城区', '2', '445300');
INSERT INTO `jie_zone` VALUES ('2080', '445303', '云安区', '2', '445300');
INSERT INTO `jie_zone` VALUES ('2081', '445321', '新兴县', '2', '445300');
INSERT INTO `jie_zone` VALUES ('2082', '445322', '郁南县', '2', '445300');
INSERT INTO `jie_zone` VALUES ('2083', '445381', '罗定市', '2', '445300');
INSERT INTO `jie_zone` VALUES ('2084', '450000', '广西壮族自治区', '0', '0');
INSERT INTO `jie_zone` VALUES ('2085', '450100', '南宁市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2086', '450102', '兴宁区', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2087', '450103', '青秀区', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2088', '450105', '江南区', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2089', '450107', '西乡塘区', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2090', '450108', '良庆区', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2091', '450109', '邕宁区', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2092', '450122', '武鸣县', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2093', '450123', '隆安县', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2094', '450124', '马山县', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2095', '450125', '上林县', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2096', '450126', '宾阳县', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2097', '450127', '横县', '2', '450100');
INSERT INTO `jie_zone` VALUES ('2098', '450200', '柳州市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2099', '450202', '城中区', '2', '450200');
INSERT INTO `jie_zone` VALUES ('2100', '450203', '鱼峰区', '2', '450200');
INSERT INTO `jie_zone` VALUES ('2101', '450204', '柳南区', '2', '450200');
INSERT INTO `jie_zone` VALUES ('2102', '450205', '柳北区', '2', '450200');
INSERT INTO `jie_zone` VALUES ('2103', '450221', '柳江县', '2', '450200');
INSERT INTO `jie_zone` VALUES ('2104', '450222', '柳城县', '2', '450200');
INSERT INTO `jie_zone` VALUES ('2105', '450223', '鹿寨县', '2', '450200');
INSERT INTO `jie_zone` VALUES ('2106', '450224', '融安县', '2', '450200');
INSERT INTO `jie_zone` VALUES ('2107', '450225', '融水苗族自治县', '2', '450200');
INSERT INTO `jie_zone` VALUES ('2108', '450226', '三江侗族自治县', '2', '450200');
INSERT INTO `jie_zone` VALUES ('2109', '450300', '桂林市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2110', '450302', '秀峰区', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2111', '450303', '叠彩区', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2112', '450304', '象山区', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2113', '450305', '七星区', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2114', '450311', '雁山区', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2115', '450312', '临桂区', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2116', '450321', '阳朔县', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2117', '450323', '灵川县', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2118', '450324', '全州县', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2119', '450325', '兴安县', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2120', '450326', '永福县', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2121', '450327', '灌阳县', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2122', '450328', '龙胜各族自治县', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2123', '450329', '资源县', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2124', '450330', '平乐县', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2125', '450331', '荔浦县', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2126', '450332', '恭城瑶族自治县', '2', '450300');
INSERT INTO `jie_zone` VALUES ('2127', '450400', '梧州市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2128', '450403', '万秀区', '2', '450400');
INSERT INTO `jie_zone` VALUES ('2129', '450405', '长洲区', '2', '450400');
INSERT INTO `jie_zone` VALUES ('2130', '450406', '龙圩区', '2', '450400');
INSERT INTO `jie_zone` VALUES ('2131', '450421', '苍梧县', '2', '450400');
INSERT INTO `jie_zone` VALUES ('2132', '450422', '藤县', '2', '450400');
INSERT INTO `jie_zone` VALUES ('2133', '450423', '蒙山县', '2', '450400');
INSERT INTO `jie_zone` VALUES ('2134', '450481', '岑溪市', '2', '450400');
INSERT INTO `jie_zone` VALUES ('2135', '450500', '北海市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2136', '450502', '海城区', '2', '450500');
INSERT INTO `jie_zone` VALUES ('2137', '450503', '银海区', '2', '450500');
INSERT INTO `jie_zone` VALUES ('2138', '450512', '铁山港区', '2', '450500');
INSERT INTO `jie_zone` VALUES ('2139', '450521', '合浦县', '2', '450500');
INSERT INTO `jie_zone` VALUES ('2140', '450600', '防城港市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2141', '450602', '港口区', '2', '450600');
INSERT INTO `jie_zone` VALUES ('2142', '450603', '防城区', '2', '450600');
INSERT INTO `jie_zone` VALUES ('2143', '450621', '上思县', '2', '450600');
INSERT INTO `jie_zone` VALUES ('2144', '450681', '东兴市', '2', '450600');
INSERT INTO `jie_zone` VALUES ('2145', '450700', '钦州市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2146', '450702', '钦南区', '2', '450700');
INSERT INTO `jie_zone` VALUES ('2147', '450703', '钦北区', '2', '450700');
INSERT INTO `jie_zone` VALUES ('2148', '450721', '灵山县', '2', '450700');
INSERT INTO `jie_zone` VALUES ('2149', '450722', '浦北县', '2', '450700');
INSERT INTO `jie_zone` VALUES ('2150', '450800', '贵港市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2151', '450802', '港北区', '2', '450800');
INSERT INTO `jie_zone` VALUES ('2152', '450803', '港南区', '2', '450800');
INSERT INTO `jie_zone` VALUES ('2153', '450804', '覃塘区', '2', '450800');
INSERT INTO `jie_zone` VALUES ('2154', '450821', '平南县', '2', '450800');
INSERT INTO `jie_zone` VALUES ('2155', '450881', '桂平市', '2', '450800');
INSERT INTO `jie_zone` VALUES ('2156', '450900', '玉林市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2157', '450902', '玉州区', '2', '450900');
INSERT INTO `jie_zone` VALUES ('2158', '450903', '福绵区', '2', '450900');
INSERT INTO `jie_zone` VALUES ('2159', '450921', '容县', '2', '450900');
INSERT INTO `jie_zone` VALUES ('2160', '450922', '陆川县', '2', '450900');
INSERT INTO `jie_zone` VALUES ('2161', '450923', '博白县', '2', '450900');
INSERT INTO `jie_zone` VALUES ('2162', '450924', '兴业县', '2', '450900');
INSERT INTO `jie_zone` VALUES ('2163', '450981', '北流市', '2', '450900');
INSERT INTO `jie_zone` VALUES ('2164', '451000', '百色市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2165', '451002', '右江区', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2166', '451021', '田阳县', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2167', '451022', '田东县', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2168', '451023', '平果县', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2169', '451024', '德保县', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2170', '451025', '靖西县', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2171', '451026', '那坡县', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2172', '451027', '凌云县', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2173', '451028', '乐业县', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2174', '451029', '田林县', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2175', '451030', '西林县', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2176', '451031', '隆林各族自治县', '2', '451000');
INSERT INTO `jie_zone` VALUES ('2177', '451100', '贺州市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2178', '451102', '八步区', '2', '451100');
INSERT INTO `jie_zone` VALUES ('2179', '451121', '昭平县', '2', '451100');
INSERT INTO `jie_zone` VALUES ('2180', '451122', '钟山县', '2', '451100');
INSERT INTO `jie_zone` VALUES ('2181', '451123', '富川瑶族自治县', '2', '451100');
INSERT INTO `jie_zone` VALUES ('2182', '451200', '河池市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2183', '451202', '金城江区', '2', '451200');
INSERT INTO `jie_zone` VALUES ('2184', '451221', '南丹县', '2', '451200');
INSERT INTO `jie_zone` VALUES ('2185', '451222', '天峨县', '2', '451200');
INSERT INTO `jie_zone` VALUES ('2186', '451223', '凤山县', '2', '451200');
INSERT INTO `jie_zone` VALUES ('2187', '451224', '东兰县', '2', '451200');
INSERT INTO `jie_zone` VALUES ('2188', '451225', '罗城仫佬族自治县', '2', '451200');
INSERT INTO `jie_zone` VALUES ('2189', '451226', '环江毛南族自治县', '2', '451200');
INSERT INTO `jie_zone` VALUES ('2190', '451227', '巴马瑶族自治县', '2', '451200');
INSERT INTO `jie_zone` VALUES ('2191', '451228', '都安瑶族自治县', '2', '451200');
INSERT INTO `jie_zone` VALUES ('2192', '451229', '大化瑶族自治县', '2', '451200');
INSERT INTO `jie_zone` VALUES ('2193', '451281', '宜州市', '2', '451200');
INSERT INTO `jie_zone` VALUES ('2194', '451300', '来宾市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2195', '451302', '兴宾区', '2', '451300');
INSERT INTO `jie_zone` VALUES ('2196', '451321', '忻城县', '2', '451300');
INSERT INTO `jie_zone` VALUES ('2197', '451322', '象州县', '2', '451300');
INSERT INTO `jie_zone` VALUES ('2198', '451323', '武宣县', '2', '451300');
INSERT INTO `jie_zone` VALUES ('2199', '451324', '金秀瑶族自治县', '2', '451300');
INSERT INTO `jie_zone` VALUES ('2200', '451381', '合山市', '2', '451300');
INSERT INTO `jie_zone` VALUES ('2201', '451400', '崇左市', '1', '450000');
INSERT INTO `jie_zone` VALUES ('2202', '451402', '江州区', '2', '451400');
INSERT INTO `jie_zone` VALUES ('2203', '451421', '扶绥县', '2', '451400');
INSERT INTO `jie_zone` VALUES ('2204', '451422', '宁明县', '2', '451400');
INSERT INTO `jie_zone` VALUES ('2205', '451423', '龙州县', '2', '451400');
INSERT INTO `jie_zone` VALUES ('2206', '451424', '大新县', '2', '451400');
INSERT INTO `jie_zone` VALUES ('2207', '451425', '天等县', '2', '451400');
INSERT INTO `jie_zone` VALUES ('2208', '451481', '凭祥市', '2', '451400');
INSERT INTO `jie_zone` VALUES ('2209', '460000', '海南省', '0', '0');
INSERT INTO `jie_zone` VALUES ('2210', '460100', '海口市', '1', '460000');
INSERT INTO `jie_zone` VALUES ('2211', '460105', '秀英区', '2', '460100');
INSERT INTO `jie_zone` VALUES ('2212', '460106', '龙华区', '2', '460100');
INSERT INTO `jie_zone` VALUES ('2213', '460107', '琼山区', '2', '460100');
INSERT INTO `jie_zone` VALUES ('2214', '460108', '美兰区', '2', '460100');
INSERT INTO `jie_zone` VALUES ('2215', '460200', '三亚市', '1', '460000');
INSERT INTO `jie_zone` VALUES ('2216', '460202', '海棠区', '2', '460200');
INSERT INTO `jie_zone` VALUES ('2217', '460203', '吉阳区', '2', '460200');
INSERT INTO `jie_zone` VALUES ('2218', '460204', '天涯区', '2', '460200');
INSERT INTO `jie_zone` VALUES ('2219', '460205', '崖州区', '2', '460200');
INSERT INTO `jie_zone` VALUES ('2220', '460300', '三沙市', '1', '460000');
INSERT INTO `jie_zone` VALUES ('2221', '469000', '省直辖县级行政区划', '1', '460000');
INSERT INTO `jie_zone` VALUES ('2222', '469001', '五指山市', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2223', '469002', '琼海市', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2224', '469003', '儋州市', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2225', '469005', '文昌市', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2226', '469006', '万宁市', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2227', '469007', '东方市', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2228', '469021', '定安县', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2229', '469022', '屯昌县', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2230', '469023', '澄迈县', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2231', '469024', '临高县', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2232', '469025', '白沙黎族自治县', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2233', '469026', '昌江黎族自治县', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2234', '469027', '乐东黎族自治县', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2235', '469028', '陵水黎族自治县', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2236', '469029', '保亭黎族苗族自治县', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2237', '469030', '琼中黎族苗族自治县', '2', '469000');
INSERT INTO `jie_zone` VALUES ('2238', '500000', '重庆市', '0', '0');
INSERT INTO `jie_zone` VALUES ('2239', '500101', '万州区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2240', '500102', '涪陵区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2241', '500103', '渝中区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2242', '500104', '大渡口区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2243', '500105', '江北区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2244', '500106', '沙坪坝区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2245', '500107', '九龙坡区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2246', '500108', '南岸区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2247', '500109', '北碚区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2248', '500110', '綦江区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2249', '500111', '大足区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2250', '500112', '渝北区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2251', '500113', '巴南区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2252', '500114', '黔江区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2253', '500115', '长寿区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2254', '500116', '江津区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2255', '500117', '合川区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2256', '500118', '永川区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2257', '500119', '南川区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2258', '500120', '璧山区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2259', '500151', '铜梁区', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2260', '500223', '潼南县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2261', '500226', '荣昌县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2262', '500228', '梁平县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2263', '500229', '城口县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2264', '500230', '丰都县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2265', '500231', '垫江县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2266', '500232', '武隆县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2267', '500233', '忠县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2268', '500234', '开县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2269', '500235', '云阳县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2270', '500236', '奉节县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2271', '500237', '巫山县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2272', '500238', '巫溪县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2273', '500240', '石柱土家族自治县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2274', '500241', '秀山土家族苗族自治县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2275', '500242', '酉阳土家族苗族自治县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2276', '500243', '彭水苗族土家族自治县', '2', '500000');
INSERT INTO `jie_zone` VALUES ('2277', '510000', '四川省', '0', '0');
INSERT INTO `jie_zone` VALUES ('2278', '510100', '成都市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2279', '510104', '锦江区', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2280', '510105', '青羊区', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2281', '510106', '金牛区', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2282', '510107', '武侯区', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2283', '510108', '成华区', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2284', '510112', '龙泉驿区', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2285', '510113', '青白江区', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2286', '510114', '新都区', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2287', '510115', '温江区', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2288', '510121', '金堂县', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2289', '510122', '双流县', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2290', '510124', '郫县', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2291', '510129', '大邑县', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2292', '510131', '蒲江县', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2293', '510132', '新津县', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2294', '510181', '都江堰市', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2295', '510182', '彭州市', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2296', '510183', '邛崃市', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2297', '510184', '崇州市', '2', '510100');
INSERT INTO `jie_zone` VALUES ('2298', '510300', '自贡市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2299', '510302', '自流井区', '2', '510300');
INSERT INTO `jie_zone` VALUES ('2300', '510303', '贡井区', '2', '510300');
INSERT INTO `jie_zone` VALUES ('2301', '510304', '大安区', '2', '510300');
INSERT INTO `jie_zone` VALUES ('2302', '510311', '沿滩区', '2', '510300');
INSERT INTO `jie_zone` VALUES ('2303', '510321', '荣县', '2', '510300');
INSERT INTO `jie_zone` VALUES ('2304', '510322', '富顺县', '2', '510300');
INSERT INTO `jie_zone` VALUES ('2305', '510400', '攀枝花市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2306', '510402', '东区', '2', '510400');
INSERT INTO `jie_zone` VALUES ('2307', '510403', '西区', '2', '510400');
INSERT INTO `jie_zone` VALUES ('2308', '510411', '仁和区', '2', '510400');
INSERT INTO `jie_zone` VALUES ('2309', '510421', '米易县', '2', '510400');
INSERT INTO `jie_zone` VALUES ('2310', '510422', '盐边县', '2', '510400');
INSERT INTO `jie_zone` VALUES ('2311', '510500', '泸州市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2312', '510502', '江阳区', '2', '510500');
INSERT INTO `jie_zone` VALUES ('2313', '510503', '纳溪区', '2', '510500');
INSERT INTO `jie_zone` VALUES ('2314', '510504', '龙马潭区', '2', '510500');
INSERT INTO `jie_zone` VALUES ('2315', '510521', '泸县', '2', '510500');
INSERT INTO `jie_zone` VALUES ('2316', '510522', '合江县', '2', '510500');
INSERT INTO `jie_zone` VALUES ('2317', '510524', '叙永县', '2', '510500');
INSERT INTO `jie_zone` VALUES ('2318', '510525', '古蔺县', '2', '510500');
INSERT INTO `jie_zone` VALUES ('2319', '510600', '德阳市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2320', '510603', '旌阳区', '2', '510600');
INSERT INTO `jie_zone` VALUES ('2321', '510623', '中江县', '2', '510600');
INSERT INTO `jie_zone` VALUES ('2322', '510626', '罗江县', '2', '510600');
INSERT INTO `jie_zone` VALUES ('2323', '510681', '广汉市', '2', '510600');
INSERT INTO `jie_zone` VALUES ('2324', '510682', '什邡市', '2', '510600');
INSERT INTO `jie_zone` VALUES ('2325', '510683', '绵竹市', '2', '510600');
INSERT INTO `jie_zone` VALUES ('2326', '510700', '绵阳市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2327', '510703', '涪城区', '2', '510700');
INSERT INTO `jie_zone` VALUES ('2328', '510704', '游仙区', '2', '510700');
INSERT INTO `jie_zone` VALUES ('2329', '510722', '三台县', '2', '510700');
INSERT INTO `jie_zone` VALUES ('2330', '510723', '盐亭县', '2', '510700');
INSERT INTO `jie_zone` VALUES ('2331', '510724', '安县', '2', '510700');
INSERT INTO `jie_zone` VALUES ('2332', '510725', '梓潼县', '2', '510700');
INSERT INTO `jie_zone` VALUES ('2333', '510726', '北川羌族自治县', '2', '510700');
INSERT INTO `jie_zone` VALUES ('2334', '510727', '平武县', '2', '510700');
INSERT INTO `jie_zone` VALUES ('2335', '510781', '江油市', '2', '510700');
INSERT INTO `jie_zone` VALUES ('2336', '510800', '广元市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2337', '510802', '利州区', '2', '510800');
INSERT INTO `jie_zone` VALUES ('2338', '510811', '昭化区', '2', '510800');
INSERT INTO `jie_zone` VALUES ('2339', '510812', '朝天区', '2', '510800');
INSERT INTO `jie_zone` VALUES ('2340', '510821', '旺苍县', '2', '510800');
INSERT INTO `jie_zone` VALUES ('2341', '510822', '青川县', '2', '510800');
INSERT INTO `jie_zone` VALUES ('2342', '510823', '剑阁县', '2', '510800');
INSERT INTO `jie_zone` VALUES ('2343', '510824', '苍溪县', '2', '510800');
INSERT INTO `jie_zone` VALUES ('2344', '510900', '遂宁市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2345', '510903', '船山区', '2', '510900');
INSERT INTO `jie_zone` VALUES ('2346', '510904', '安居区', '2', '510900');
INSERT INTO `jie_zone` VALUES ('2347', '510921', '蓬溪县', '2', '510900');
INSERT INTO `jie_zone` VALUES ('2348', '510922', '射洪县', '2', '510900');
INSERT INTO `jie_zone` VALUES ('2349', '510923', '大英县', '2', '510900');
INSERT INTO `jie_zone` VALUES ('2350', '511000', '内江市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2351', '511002', '市中区', '2', '511000');
INSERT INTO `jie_zone` VALUES ('2352', '511011', '东兴区', '2', '511000');
INSERT INTO `jie_zone` VALUES ('2353', '511024', '威远县', '2', '511000');
INSERT INTO `jie_zone` VALUES ('2354', '511025', '资中县', '2', '511000');
INSERT INTO `jie_zone` VALUES ('2355', '511028', '隆昌县', '2', '511000');
INSERT INTO `jie_zone` VALUES ('2356', '511100', '乐山市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2357', '511102', '市中区', '2', '511100');
INSERT INTO `jie_zone` VALUES ('2358', '511111', '沙湾区', '2', '511100');
INSERT INTO `jie_zone` VALUES ('2359', '511112', '五通桥区', '2', '511100');
INSERT INTO `jie_zone` VALUES ('2360', '511113', '金口河区', '2', '511100');
INSERT INTO `jie_zone` VALUES ('2361', '511123', '犍为县', '2', '511100');
INSERT INTO `jie_zone` VALUES ('2362', '511124', '井研县', '2', '511100');
INSERT INTO `jie_zone` VALUES ('2363', '511126', '夹江县', '2', '511100');
INSERT INTO `jie_zone` VALUES ('2364', '511129', '沐川县', '2', '511100');
INSERT INTO `jie_zone` VALUES ('2365', '511132', '峨边彝族自治县', '2', '511100');
INSERT INTO `jie_zone` VALUES ('2366', '511133', '马边彝族自治县', '2', '511100');
INSERT INTO `jie_zone` VALUES ('2367', '511181', '峨眉山市', '2', '511100');
INSERT INTO `jie_zone` VALUES ('2368', '511300', '南充市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2369', '511302', '顺庆区', '2', '511300');
INSERT INTO `jie_zone` VALUES ('2370', '511303', '高坪区', '2', '511300');
INSERT INTO `jie_zone` VALUES ('2371', '511304', '嘉陵区', '2', '511300');
INSERT INTO `jie_zone` VALUES ('2372', '511321', '南部县', '2', '511300');
INSERT INTO `jie_zone` VALUES ('2373', '511322', '营山县', '2', '511300');
INSERT INTO `jie_zone` VALUES ('2374', '511323', '蓬安县', '2', '511300');
INSERT INTO `jie_zone` VALUES ('2375', '511324', '仪陇县', '2', '511300');
INSERT INTO `jie_zone` VALUES ('2376', '511325', '西充县', '2', '511300');
INSERT INTO `jie_zone` VALUES ('2377', '511381', '阆中市', '2', '511300');
INSERT INTO `jie_zone` VALUES ('2378', '511400', '眉山市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2379', '511402', '东坡区', '2', '511400');
INSERT INTO `jie_zone` VALUES ('2380', '511421', '仁寿县', '2', '511400');
INSERT INTO `jie_zone` VALUES ('2381', '511422', '彭山县', '2', '511400');
INSERT INTO `jie_zone` VALUES ('2382', '511423', '洪雅县', '2', '511400');
INSERT INTO `jie_zone` VALUES ('2383', '511424', '丹棱县', '2', '511400');
INSERT INTO `jie_zone` VALUES ('2384', '511425', '青神县', '2', '511400');
INSERT INTO `jie_zone` VALUES ('2385', '511500', '宜宾市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2386', '511502', '翠屏区', '2', '511500');
INSERT INTO `jie_zone` VALUES ('2387', '511503', '南溪区', '2', '511500');
INSERT INTO `jie_zone` VALUES ('2388', '511521', '宜宾县', '2', '511500');
INSERT INTO `jie_zone` VALUES ('2389', '511523', '江安县', '2', '511500');
INSERT INTO `jie_zone` VALUES ('2390', '511524', '长宁县', '2', '511500');
INSERT INTO `jie_zone` VALUES ('2391', '511525', '高县', '2', '511500');
INSERT INTO `jie_zone` VALUES ('2392', '511526', '珙县', '2', '511500');
INSERT INTO `jie_zone` VALUES ('2393', '511527', '筠连县', '2', '511500');
INSERT INTO `jie_zone` VALUES ('2394', '511528', '兴文县', '2', '511500');
INSERT INTO `jie_zone` VALUES ('2395', '511529', '屏山县', '2', '511500');
INSERT INTO `jie_zone` VALUES ('2396', '511600', '广安市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2397', '511602', '广安区', '2', '511600');
INSERT INTO `jie_zone` VALUES ('2398', '511603', '前锋区', '2', '511600');
INSERT INTO `jie_zone` VALUES ('2399', '511621', '岳池县', '2', '511600');
INSERT INTO `jie_zone` VALUES ('2400', '511622', '武胜县', '2', '511600');
INSERT INTO `jie_zone` VALUES ('2401', '511623', '邻水县', '2', '511600');
INSERT INTO `jie_zone` VALUES ('2402', '511681', '华蓥市', '2', '511600');
INSERT INTO `jie_zone` VALUES ('2403', '511700', '达州市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2404', '511702', '通川区', '2', '511700');
INSERT INTO `jie_zone` VALUES ('2405', '511703', '达川区', '2', '511700');
INSERT INTO `jie_zone` VALUES ('2406', '511722', '宣汉县', '2', '511700');
INSERT INTO `jie_zone` VALUES ('2407', '511723', '开江县', '2', '511700');
INSERT INTO `jie_zone` VALUES ('2408', '511724', '大竹县', '2', '511700');
INSERT INTO `jie_zone` VALUES ('2409', '511725', '渠县', '2', '511700');
INSERT INTO `jie_zone` VALUES ('2410', '511781', '万源市', '2', '511700');
INSERT INTO `jie_zone` VALUES ('2411', '511800', '雅安市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2412', '511802', '雨城区', '2', '511800');
INSERT INTO `jie_zone` VALUES ('2413', '511803', '名山区', '2', '511800');
INSERT INTO `jie_zone` VALUES ('2414', '511822', '荥经县', '2', '511800');
INSERT INTO `jie_zone` VALUES ('2415', '511823', '汉源县', '2', '511800');
INSERT INTO `jie_zone` VALUES ('2416', '511824', '石棉县', '2', '511800');
INSERT INTO `jie_zone` VALUES ('2417', '511825', '天全县', '2', '511800');
INSERT INTO `jie_zone` VALUES ('2418', '511826', '芦山县', '2', '511800');
INSERT INTO `jie_zone` VALUES ('2419', '511827', '宝兴县', '2', '511800');
INSERT INTO `jie_zone` VALUES ('2420', '511900', '巴中市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2421', '511902', '巴州区', '2', '511900');
INSERT INTO `jie_zone` VALUES ('2422', '511903', '恩阳区', '2', '511900');
INSERT INTO `jie_zone` VALUES ('2423', '511921', '通江县', '2', '511900');
INSERT INTO `jie_zone` VALUES ('2424', '511922', '南江县', '2', '511900');
INSERT INTO `jie_zone` VALUES ('2425', '511923', '平昌县', '2', '511900');
INSERT INTO `jie_zone` VALUES ('2426', '512000', '资阳市', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2427', '512002', '雁江区', '2', '512000');
INSERT INTO `jie_zone` VALUES ('2428', '512021', '安岳县', '2', '512000');
INSERT INTO `jie_zone` VALUES ('2429', '512022', '乐至县', '2', '512000');
INSERT INTO `jie_zone` VALUES ('2430', '512081', '简阳市', '2', '512000');
INSERT INTO `jie_zone` VALUES ('2431', '513200', '阿坝藏族羌族自治州', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2432', '513221', '汶川县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2433', '513222', '理县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2434', '513223', '茂县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2435', '513224', '松潘县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2436', '513225', '九寨沟县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2437', '513226', '金川县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2438', '513227', '小金县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2439', '513228', '黑水县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2440', '513229', '马尔康县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2441', '513230', '壤塘县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2442', '513231', '阿坝县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2443', '513232', '若尔盖县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2444', '513233', '红原县', '2', '513200');
INSERT INTO `jie_zone` VALUES ('2445', '513300', '甘孜藏族自治州', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2446', '513321', '康定县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2447', '513322', '泸定县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2448', '513323', '丹巴县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2449', '513324', '九龙县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2450', '513325', '雅江县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2451', '513326', '道孚县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2452', '513327', '炉霍县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2453', '513328', '甘孜县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2454', '513329', '新龙县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2455', '513330', '德格县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2456', '513331', '白玉县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2457', '513332', '石渠县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2458', '513333', '色达县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2459', '513334', '理塘县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2460', '513335', '巴塘县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2461', '513336', '乡城县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2462', '513337', '稻城县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2463', '513338', '得荣县', '2', '513300');
INSERT INTO `jie_zone` VALUES ('2464', '513400', '凉山彝族自治州', '1', '510000');
INSERT INTO `jie_zone` VALUES ('2465', '513401', '西昌市', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2466', '513422', '木里藏族自治县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2467', '513423', '盐源县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2468', '513424', '德昌县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2469', '513425', '会理县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2470', '513426', '会东县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2471', '513427', '宁南县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2472', '513428', '普格县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2473', '513429', '布拖县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2474', '513430', '金阳县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2475', '513431', '昭觉县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2476', '513432', '喜德县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2477', '513433', '冕宁县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2478', '513434', '越西县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2479', '513435', '甘洛县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2480', '513436', '美姑县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2481', '513437', '雷波县', '2', '513400');
INSERT INTO `jie_zone` VALUES ('2482', '520000', '贵州省', '0', '0');
INSERT INTO `jie_zone` VALUES ('2483', '520100', '贵阳市', '1', '520000');
INSERT INTO `jie_zone` VALUES ('2484', '520102', '南明区', '2', '520100');
INSERT INTO `jie_zone` VALUES ('2485', '520103', '云岩区', '2', '520100');
INSERT INTO `jie_zone` VALUES ('2486', '520111', '花溪区', '2', '520100');
INSERT INTO `jie_zone` VALUES ('2487', '520112', '乌当区', '2', '520100');
INSERT INTO `jie_zone` VALUES ('2488', '520113', '白云区', '2', '520100');
INSERT INTO `jie_zone` VALUES ('2489', '520115', '观山湖区', '2', '520100');
INSERT INTO `jie_zone` VALUES ('2490', '520121', '开阳县', '2', '520100');
INSERT INTO `jie_zone` VALUES ('2491', '520122', '息烽县', '2', '520100');
INSERT INTO `jie_zone` VALUES ('2492', '520123', '修文县', '2', '520100');
INSERT INTO `jie_zone` VALUES ('2493', '520181', '清镇市', '2', '520100');
INSERT INTO `jie_zone` VALUES ('2494', '520200', '六盘水市', '1', '520000');
INSERT INTO `jie_zone` VALUES ('2495', '520201', '钟山区', '2', '520200');
INSERT INTO `jie_zone` VALUES ('2496', '520203', '六枝特区', '2', '520200');
INSERT INTO `jie_zone` VALUES ('2497', '520221', '水城县', '2', '520200');
INSERT INTO `jie_zone` VALUES ('2498', '520222', '盘县', '2', '520200');
INSERT INTO `jie_zone` VALUES ('2499', '520300', '遵义市', '1', '520000');
INSERT INTO `jie_zone` VALUES ('2500', '520302', '红花岗区', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2501', '520303', '汇川区', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2502', '520321', '遵义县', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2503', '520322', '桐梓县', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2504', '520323', '绥阳县', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2505', '520324', '正安县', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2506', '520325', '道真仡佬族苗族自治县', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2507', '520326', '务川仡佬族苗族自治县', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2508', '520327', '凤冈县', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2509', '520328', '湄潭县', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2510', '520329', '余庆县', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2511', '520330', '习水县', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2512', '520381', '赤水市', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2513', '520382', '仁怀市', '2', '520300');
INSERT INTO `jie_zone` VALUES ('2514', '520400', '安顺市', '1', '520000');
INSERT INTO `jie_zone` VALUES ('2515', '520402', '西秀区', '2', '520400');
INSERT INTO `jie_zone` VALUES ('2516', '520421', '平坝县', '2', '520400');
INSERT INTO `jie_zone` VALUES ('2517', '520422', '普定县', '2', '520400');
INSERT INTO `jie_zone` VALUES ('2518', '520423', '镇宁布依族苗族自治县', '2', '520400');
INSERT INTO `jie_zone` VALUES ('2519', '520424', '关岭布依族苗族自治县', '2', '520400');
INSERT INTO `jie_zone` VALUES ('2520', '520425', '紫云苗族布依族自治县', '2', '520400');
INSERT INTO `jie_zone` VALUES ('2521', '520500', '毕节市', '1', '520000');
INSERT INTO `jie_zone` VALUES ('2522', '520502', '七星关区', '2', '520500');
INSERT INTO `jie_zone` VALUES ('2523', '520521', '大方县', '2', '520500');
INSERT INTO `jie_zone` VALUES ('2524', '520522', '黔西县', '2', '520500');
INSERT INTO `jie_zone` VALUES ('2525', '520523', '金沙县', '2', '520500');
INSERT INTO `jie_zone` VALUES ('2526', '520524', '织金县', '2', '520500');
INSERT INTO `jie_zone` VALUES ('2527', '520525', '纳雍县', '2', '520500');
INSERT INTO `jie_zone` VALUES ('2528', '520526', '威宁彝族回族苗族自治县', '2', '520500');
INSERT INTO `jie_zone` VALUES ('2529', '520527', '赫章县', '2', '520500');
INSERT INTO `jie_zone` VALUES ('2530', '520600', '铜仁市', '1', '520000');
INSERT INTO `jie_zone` VALUES ('2531', '520602', '碧江区', '2', '520600');
INSERT INTO `jie_zone` VALUES ('2532', '520603', '万山区', '2', '520600');
INSERT INTO `jie_zone` VALUES ('2533', '520621', '江口县', '2', '520600');
INSERT INTO `jie_zone` VALUES ('2534', '520622', '玉屏侗族自治县', '2', '520600');
INSERT INTO `jie_zone` VALUES ('2535', '520623', '石阡县', '2', '520600');
INSERT INTO `jie_zone` VALUES ('2536', '520624', '思南县', '2', '520600');
INSERT INTO `jie_zone` VALUES ('2537', '520625', '印江土家族苗族自治县', '2', '520600');
INSERT INTO `jie_zone` VALUES ('2538', '520626', '德江县', '2', '520600');
INSERT INTO `jie_zone` VALUES ('2539', '520627', '沿河土家族自治县', '2', '520600');
INSERT INTO `jie_zone` VALUES ('2540', '520628', '松桃苗族自治县', '2', '520600');
INSERT INTO `jie_zone` VALUES ('2541', '522300', '黔西南布依族苗族自治州', '1', '520000');
INSERT INTO `jie_zone` VALUES ('2542', '522301', '兴义市', '2', '522300');
INSERT INTO `jie_zone` VALUES ('2543', '522322', '兴仁县', '2', '522300');
INSERT INTO `jie_zone` VALUES ('2544', '522323', '普安县', '2', '522300');
INSERT INTO `jie_zone` VALUES ('2545', '522324', '晴隆县', '2', '522300');
INSERT INTO `jie_zone` VALUES ('2546', '522325', '贞丰县', '2', '522300');
INSERT INTO `jie_zone` VALUES ('2547', '522326', '望谟县', '2', '522300');
INSERT INTO `jie_zone` VALUES ('2548', '522327', '册亨县', '2', '522300');
INSERT INTO `jie_zone` VALUES ('2549', '522328', '安龙县', '2', '522300');
INSERT INTO `jie_zone` VALUES ('2550', '522600', '黔东南苗族侗族自治州', '1', '520000');
INSERT INTO `jie_zone` VALUES ('2551', '522601', '凯里市', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2552', '522622', '黄平县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2553', '522623', '施秉县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2554', '522624', '三穗县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2555', '522625', '镇远县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2556', '522626', '岑巩县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2557', '522627', '天柱县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2558', '522628', '锦屏县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2559', '522629', '剑河县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2560', '522630', '台江县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2561', '522631', '黎平县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2562', '522632', '榕江县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2563', '522633', '从江县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2564', '522634', '雷山县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2565', '522635', '麻江县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2566', '522636', '丹寨县', '2', '522600');
INSERT INTO `jie_zone` VALUES ('2567', '522700', '黔南布依族苗族自治州', '1', '520000');
INSERT INTO `jie_zone` VALUES ('2568', '522701', '都匀市', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2569', '522702', '福泉市', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2570', '522722', '荔波县', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2571', '522723', '贵定县', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2572', '522725', '瓮安县', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2573', '522726', '独山县', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2574', '522727', '平塘县', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2575', '522728', '罗甸县', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2576', '522729', '长顺县', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2577', '522730', '龙里县', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2578', '522731', '惠水县', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2579', '522732', '三都水族自治县', '2', '522700');
INSERT INTO `jie_zone` VALUES ('2580', '530000', '云南省', '0', '0');
INSERT INTO `jie_zone` VALUES ('2581', '530100', '昆明市', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2582', '530102', '五华区', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2583', '530103', '盘龙区', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2584', '530111', '官渡区', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2585', '530112', '西山区', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2586', '530113', '东川区', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2587', '530114', '呈贡区', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2588', '530122', '晋宁县', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2589', '530124', '富民县', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2590', '530125', '宜良县', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2591', '530126', '石林彝族自治县', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2592', '530127', '嵩明县', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2593', '530128', '禄劝彝族苗族自治县', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2594', '530129', '寻甸回族彝族自治县', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2595', '530181', '安宁市', '2', '530100');
INSERT INTO `jie_zone` VALUES ('2596', '530300', '曲靖市', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2597', '530302', '麒麟区', '2', '530300');
INSERT INTO `jie_zone` VALUES ('2598', '530321', '马龙县', '2', '530300');
INSERT INTO `jie_zone` VALUES ('2599', '530322', '陆良县', '2', '530300');
INSERT INTO `jie_zone` VALUES ('2600', '530323', '师宗县', '2', '530300');
INSERT INTO `jie_zone` VALUES ('2601', '530324', '罗平县', '2', '530300');
INSERT INTO `jie_zone` VALUES ('2602', '530325', '富源县', '2', '530300');
INSERT INTO `jie_zone` VALUES ('2603', '530326', '会泽县', '2', '530300');
INSERT INTO `jie_zone` VALUES ('2604', '530328', '沾益县', '2', '530300');
INSERT INTO `jie_zone` VALUES ('2605', '530381', '宣威市', '2', '530300');
INSERT INTO `jie_zone` VALUES ('2606', '530400', '玉溪市', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2607', '530402', '红塔区', '2', '530400');
INSERT INTO `jie_zone` VALUES ('2608', '530421', '江川县', '2', '530400');
INSERT INTO `jie_zone` VALUES ('2609', '530422', '澄江县', '2', '530400');
INSERT INTO `jie_zone` VALUES ('2610', '530423', '通海县', '2', '530400');
INSERT INTO `jie_zone` VALUES ('2611', '530424', '华宁县', '2', '530400');
INSERT INTO `jie_zone` VALUES ('2612', '530425', '易门县', '2', '530400');
INSERT INTO `jie_zone` VALUES ('2613', '530426', '峨山彝族自治县', '2', '530400');
INSERT INTO `jie_zone` VALUES ('2614', '530427', '新平彝族傣族自治县', '2', '530400');
INSERT INTO `jie_zone` VALUES ('2615', '530428', '元江哈尼族彝族傣族自治县', '2', '530400');
INSERT INTO `jie_zone` VALUES ('2616', '530500', '保山市', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2617', '530502', '隆阳区', '2', '530500');
INSERT INTO `jie_zone` VALUES ('2618', '530521', '施甸县', '2', '530500');
INSERT INTO `jie_zone` VALUES ('2619', '530522', '腾冲县', '2', '530500');
INSERT INTO `jie_zone` VALUES ('2620', '530523', '龙陵县', '2', '530500');
INSERT INTO `jie_zone` VALUES ('2621', '530524', '昌宁县', '2', '530500');
INSERT INTO `jie_zone` VALUES ('2622', '530600', '昭通市', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2623', '530602', '昭阳区', '2', '530600');
INSERT INTO `jie_zone` VALUES ('2624', '530621', '鲁甸县', '2', '530600');
INSERT INTO `jie_zone` VALUES ('2625', '530622', '巧家县', '2', '530600');
INSERT INTO `jie_zone` VALUES ('2626', '530623', '盐津县', '2', '530600');
INSERT INTO `jie_zone` VALUES ('2627', '530624', '大关县', '2', '530600');
INSERT INTO `jie_zone` VALUES ('2628', '530625', '永善县', '2', '530600');
INSERT INTO `jie_zone` VALUES ('2629', '530626', '绥江县', '2', '530600');
INSERT INTO `jie_zone` VALUES ('2630', '530627', '镇雄县', '2', '530600');
INSERT INTO `jie_zone` VALUES ('2631', '530628', '彝良县', '2', '530600');
INSERT INTO `jie_zone` VALUES ('2632', '530629', '威信县', '2', '530600');
INSERT INTO `jie_zone` VALUES ('2633', '530630', '水富县', '2', '530600');
INSERT INTO `jie_zone` VALUES ('2634', '530700', '丽江市', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2635', '530702', '古城区', '2', '530700');
INSERT INTO `jie_zone` VALUES ('2636', '530721', '玉龙纳西族自治县', '2', '530700');
INSERT INTO `jie_zone` VALUES ('2637', '530722', '永胜县', '2', '530700');
INSERT INTO `jie_zone` VALUES ('2638', '530723', '华坪县', '2', '530700');
INSERT INTO `jie_zone` VALUES ('2639', '530724', '宁蒗彝族自治县', '2', '530700');
INSERT INTO `jie_zone` VALUES ('2640', '530800', '普洱市', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2641', '530802', '思茅区', '2', '530800');
INSERT INTO `jie_zone` VALUES ('2642', '530821', '宁洱哈尼族彝族自治县', '2', '530800');
INSERT INTO `jie_zone` VALUES ('2643', '530822', '墨江哈尼族自治县', '2', '530800');
INSERT INTO `jie_zone` VALUES ('2644', '530823', '景东彝族自治县', '2', '530800');
INSERT INTO `jie_zone` VALUES ('2645', '530824', '景谷傣族彝族自治县', '2', '530800');
INSERT INTO `jie_zone` VALUES ('2646', '530825', '镇沅彝族哈尼族拉祜族自治县', '2', '530800');
INSERT INTO `jie_zone` VALUES ('2647', '530826', '江城哈尼族彝族自治县', '2', '530800');
INSERT INTO `jie_zone` VALUES ('2648', '530827', '孟连傣族拉祜族佤族自治县', '2', '530800');
INSERT INTO `jie_zone` VALUES ('2649', '530828', '澜沧拉祜族自治县', '2', '530800');
INSERT INTO `jie_zone` VALUES ('2650', '530829', '西盟佤族自治县', '2', '530800');
INSERT INTO `jie_zone` VALUES ('2651', '530900', '临沧市', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2652', '530902', '临翔区', '2', '530900');
INSERT INTO `jie_zone` VALUES ('2653', '530921', '凤庆县', '2', '530900');
INSERT INTO `jie_zone` VALUES ('2654', '530922', '云县', '2', '530900');
INSERT INTO `jie_zone` VALUES ('2655', '530923', '永德县', '2', '530900');
INSERT INTO `jie_zone` VALUES ('2656', '530924', '镇康县', '2', '530900');
INSERT INTO `jie_zone` VALUES ('2657', '530925', '双江拉祜族佤族布朗族傣族自治县', '2', '530900');
INSERT INTO `jie_zone` VALUES ('2658', '530926', '耿马傣族佤族自治县', '2', '530900');
INSERT INTO `jie_zone` VALUES ('2659', '530927', '沧源佤族自治县', '2', '530900');
INSERT INTO `jie_zone` VALUES ('2660', '532300', '楚雄彝族自治州', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2661', '532301', '楚雄市', '2', '532300');
INSERT INTO `jie_zone` VALUES ('2662', '532322', '双柏县', '2', '532300');
INSERT INTO `jie_zone` VALUES ('2663', '532323', '牟定县', '2', '532300');
INSERT INTO `jie_zone` VALUES ('2664', '532324', '南华县', '2', '532300');
INSERT INTO `jie_zone` VALUES ('2665', '532325', '姚安县', '2', '532300');
INSERT INTO `jie_zone` VALUES ('2666', '532326', '大姚县', '2', '532300');
INSERT INTO `jie_zone` VALUES ('2667', '532327', '永仁县', '2', '532300');
INSERT INTO `jie_zone` VALUES ('2668', '532328', '元谋县', '2', '532300');
INSERT INTO `jie_zone` VALUES ('2669', '532329', '武定县', '2', '532300');
INSERT INTO `jie_zone` VALUES ('2670', '532331', '禄丰县', '2', '532300');
INSERT INTO `jie_zone` VALUES ('2671', '532500', '红河哈尼族彝族自治州', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2672', '532501', '个旧市', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2673', '532502', '开远市', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2674', '532503', '蒙自市', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2675', '532504', '弥勒市', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2676', '532523', '屏边苗族自治县', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2677', '532524', '建水县', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2678', '532525', '石屏县', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2679', '532527', '泸西县', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2680', '532528', '元阳县', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2681', '532529', '红河县', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2682', '532530', '金平苗族瑶族傣族自治县', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2683', '532531', '绿春县', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2684', '532532', '河口瑶族自治县', '2', '532500');
INSERT INTO `jie_zone` VALUES ('2685', '532600', '文山壮族苗族自治州', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2686', '532601', '文山市', '2', '532600');
INSERT INTO `jie_zone` VALUES ('2687', '532622', '砚山县', '2', '532600');
INSERT INTO `jie_zone` VALUES ('2688', '532623', '西畴县', '2', '532600');
INSERT INTO `jie_zone` VALUES ('2689', '532624', '麻栗坡县', '2', '532600');
INSERT INTO `jie_zone` VALUES ('2690', '532625', '马关县', '2', '532600');
INSERT INTO `jie_zone` VALUES ('2691', '532626', '丘北县', '2', '532600');
INSERT INTO `jie_zone` VALUES ('2692', '532627', '广南县', '2', '532600');
INSERT INTO `jie_zone` VALUES ('2693', '532628', '富宁县', '2', '532600');
INSERT INTO `jie_zone` VALUES ('2694', '532800', '西双版纳傣族自治州', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2695', '532801', '景洪市', '2', '532800');
INSERT INTO `jie_zone` VALUES ('2696', '532822', '勐海县', '2', '532800');
INSERT INTO `jie_zone` VALUES ('2697', '532823', '勐腊县', '2', '532800');
INSERT INTO `jie_zone` VALUES ('2698', '532900', '大理白族自治州', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2699', '532901', '大理市', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2700', '532922', '漾濞彝族自治县', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2701', '532923', '祥云县', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2702', '532924', '宾川县', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2703', '532925', '弥渡县', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2704', '532926', '南涧彝族自治县', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2705', '532927', '巍山彝族回族自治县', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2706', '532928', '永平县', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2707', '532929', '云龙县', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2708', '532930', '洱源县', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2709', '532931', '剑川县', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2710', '532932', '鹤庆县', '2', '532900');
INSERT INTO `jie_zone` VALUES ('2711', '533100', '德宏傣族景颇族自治州', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2712', '533102', '瑞丽市', '2', '533100');
INSERT INTO `jie_zone` VALUES ('2713', '533103', '芒市', '2', '533100');
INSERT INTO `jie_zone` VALUES ('2714', '533122', '梁河县', '2', '533100');
INSERT INTO `jie_zone` VALUES ('2715', '533123', '盈江县', '2', '533100');
INSERT INTO `jie_zone` VALUES ('2716', '533124', '陇川县', '2', '533100');
INSERT INTO `jie_zone` VALUES ('2717', '533300', '怒江傈僳族自治州', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2718', '533321', '泸水县', '2', '533300');
INSERT INTO `jie_zone` VALUES ('2719', '533323', '福贡县', '2', '533300');
INSERT INTO `jie_zone` VALUES ('2720', '533324', '贡山独龙族怒族自治县', '2', '533300');
INSERT INTO `jie_zone` VALUES ('2721', '533325', '兰坪白族普米族自治县', '2', '533300');
INSERT INTO `jie_zone` VALUES ('2722', '533400', '迪庆藏族自治州', '1', '530000');
INSERT INTO `jie_zone` VALUES ('2723', '533421', '香格里拉县', '2', '533400');
INSERT INTO `jie_zone` VALUES ('2724', '533422', '德钦县', '2', '533400');
INSERT INTO `jie_zone` VALUES ('2725', '533423', '维西傈僳族自治县', '2', '533400');
INSERT INTO `jie_zone` VALUES ('2726', '540000', '西藏自治区', '0', '0');
INSERT INTO `jie_zone` VALUES ('2727', '540100', '拉萨市', '1', '540000');
INSERT INTO `jie_zone` VALUES ('2728', '540102', '城关区', '2', '540100');
INSERT INTO `jie_zone` VALUES ('2729', '540121', '林周县', '2', '540100');
INSERT INTO `jie_zone` VALUES ('2730', '540122', '当雄县', '2', '540100');
INSERT INTO `jie_zone` VALUES ('2731', '540123', '尼木县', '2', '540100');
INSERT INTO `jie_zone` VALUES ('2732', '540124', '曲水县', '2', '540100');
INSERT INTO `jie_zone` VALUES ('2733', '540125', '堆龙德庆县', '2', '540100');
INSERT INTO `jie_zone` VALUES ('2734', '540126', '达孜县', '2', '540100');
INSERT INTO `jie_zone` VALUES ('2735', '540127', '墨竹工卡县', '2', '540100');
INSERT INTO `jie_zone` VALUES ('2736', '540200', '日喀则市', '1', '540000');
INSERT INTO `jie_zone` VALUES ('2737', '540202', '桑珠孜区', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2738', '540221', '南木林县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2739', '540222', '江孜县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2740', '540223', '定日县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2741', '540224', '萨迦县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2742', '540225', '拉孜县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2743', '540226', '昂仁县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2744', '540227', '谢通门县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2745', '540228', '白朗县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2746', '540229', '仁布县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2747', '540230', '康马县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2748', '540231', '定结县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2749', '540232', '仲巴县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2750', '540233', '亚东县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2751', '540234', '吉隆县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2752', '540235', '聂拉木县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2753', '540236', '萨嘎县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2754', '540237', '岗巴县', '2', '540200');
INSERT INTO `jie_zone` VALUES ('2755', '542100', '昌都地区', '1', '540000');
INSERT INTO `jie_zone` VALUES ('2756', '542121', '昌都县', '2', '542100');
INSERT INTO `jie_zone` VALUES ('2757', '542122', '江达县', '2', '542100');
INSERT INTO `jie_zone` VALUES ('2758', '542123', '贡觉县', '2', '542100');
INSERT INTO `jie_zone` VALUES ('2759', '542124', '类乌齐县', '2', '542100');
INSERT INTO `jie_zone` VALUES ('2760', '542125', '丁青县', '2', '542100');
INSERT INTO `jie_zone` VALUES ('2761', '542126', '察雅县', '2', '542100');
INSERT INTO `jie_zone` VALUES ('2762', '542127', '八宿县', '2', '542100');
INSERT INTO `jie_zone` VALUES ('2763', '542128', '左贡县', '2', '542100');
INSERT INTO `jie_zone` VALUES ('2764', '542129', '芒康县', '2', '542100');
INSERT INTO `jie_zone` VALUES ('2765', '542132', '洛隆县', '2', '542100');
INSERT INTO `jie_zone` VALUES ('2766', '542133', '边坝县', '2', '542100');
INSERT INTO `jie_zone` VALUES ('2767', '542200', '山南地区', '1', '540000');
INSERT INTO `jie_zone` VALUES ('2768', '542221', '乃东县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2769', '542222', '扎囊县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2770', '542223', '贡嘎县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2771', '542224', '桑日县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2772', '542225', '琼结县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2773', '542226', '曲松县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2774', '542227', '措美县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2775', '542228', '洛扎县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2776', '542229', '加查县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2777', '542231', '隆子县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2778', '542232', '错那县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2779', '542233', '浪卡子县', '2', '542200');
INSERT INTO `jie_zone` VALUES ('2780', '542400', '那曲地区', '1', '540000');
INSERT INTO `jie_zone` VALUES ('2781', '542421', '那曲县', '2', '542400');
INSERT INTO `jie_zone` VALUES ('2782', '542422', '嘉黎县', '2', '542400');
INSERT INTO `jie_zone` VALUES ('2783', '542423', '比如县', '2', '542400');
INSERT INTO `jie_zone` VALUES ('2784', '542424', '聂荣县', '2', '542400');
INSERT INTO `jie_zone` VALUES ('2785', '542425', '安多县', '2', '542400');
INSERT INTO `jie_zone` VALUES ('2786', '542426', '申扎县', '2', '542400');
INSERT INTO `jie_zone` VALUES ('2787', '542427', '索县', '2', '542400');
INSERT INTO `jie_zone` VALUES ('2788', '542428', '班戈县', '2', '542400');
INSERT INTO `jie_zone` VALUES ('2789', '542429', '巴青县', '2', '542400');
INSERT INTO `jie_zone` VALUES ('2790', '542430', '尼玛县', '2', '542400');
INSERT INTO `jie_zone` VALUES ('2791', '542431', '双湖县', '2', '542400');
INSERT INTO `jie_zone` VALUES ('2792', '542500', '阿里地区', '1', '540000');
INSERT INTO `jie_zone` VALUES ('2793', '542521', '普兰县', '2', '542500');
INSERT INTO `jie_zone` VALUES ('2794', '542522', '札达县', '2', '542500');
INSERT INTO `jie_zone` VALUES ('2795', '542523', '噶尔县', '2', '542500');
INSERT INTO `jie_zone` VALUES ('2796', '542524', '日土县', '2', '542500');
INSERT INTO `jie_zone` VALUES ('2797', '542525', '革吉县', '2', '542500');
INSERT INTO `jie_zone` VALUES ('2798', '542526', '改则县', '2', '542500');
INSERT INTO `jie_zone` VALUES ('2799', '542527', '措勤县', '2', '542500');
INSERT INTO `jie_zone` VALUES ('2800', '542600', '林芝地区', '1', '540000');
INSERT INTO `jie_zone` VALUES ('2801', '542621', '林芝县', '2', '542600');
INSERT INTO `jie_zone` VALUES ('2802', '542622', '工布江达县', '2', '542600');
INSERT INTO `jie_zone` VALUES ('2803', '542623', '米林县', '2', '542600');
INSERT INTO `jie_zone` VALUES ('2804', '542624', '墨脱县', '2', '542600');
INSERT INTO `jie_zone` VALUES ('2805', '542625', '波密县', '2', '542600');
INSERT INTO `jie_zone` VALUES ('2806', '542626', '察隅县', '2', '542600');
INSERT INTO `jie_zone` VALUES ('2807', '542627', '朗县', '2', '542600');
INSERT INTO `jie_zone` VALUES ('2808', '610000', '陕西省', '0', '0');
INSERT INTO `jie_zone` VALUES ('2809', '610100', '西安市', '1', '610000');
INSERT INTO `jie_zone` VALUES ('2810', '610102', '新城区', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2811', '610103', '碑林区', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2812', '610104', '莲湖区', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2813', '610111', '灞桥区', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2814', '610112', '未央区', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2815', '610113', '雁塔区', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2816', '610114', '阎良区', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2817', '610115', '临潼区', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2818', '610116', '长安区', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2819', '610122', '蓝田县', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2820', '610124', '周至县', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2821', '610125', '户县', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2822', '610126', '高陵县', '2', '610100');
INSERT INTO `jie_zone` VALUES ('2823', '610200', '铜川市', '1', '610000');
INSERT INTO `jie_zone` VALUES ('2824', '610202', '王益区', '2', '610200');
INSERT INTO `jie_zone` VALUES ('2825', '610203', '印台区', '2', '610200');
INSERT INTO `jie_zone` VALUES ('2826', '610204', '耀州区', '2', '610200');
INSERT INTO `jie_zone` VALUES ('2827', '610222', '宜君县', '2', '610200');
INSERT INTO `jie_zone` VALUES ('2828', '610300', '宝鸡市', '1', '610000');
INSERT INTO `jie_zone` VALUES ('2829', '610302', '渭滨区', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2830', '610303', '金台区', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2831', '610304', '陈仓区', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2832', '610322', '凤翔县', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2833', '610323', '岐山县', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2834', '610324', '扶风县', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2835', '610326', '眉县', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2836', '610327', '陇县', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2837', '610328', '千阳县', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2838', '610329', '麟游县', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2839', '610330', '凤县', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2840', '610331', '太白县', '2', '610300');
INSERT INTO `jie_zone` VALUES ('2841', '610400', '咸阳市', '1', '610000');
INSERT INTO `jie_zone` VALUES ('2842', '610402', '秦都区', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2843', '610403', '杨陵区', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2844', '610404', '渭城区', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2845', '610422', '三原县', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2846', '610423', '泾阳县', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2847', '610424', '乾县', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2848', '610425', '礼泉县', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2849', '610426', '永寿县', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2850', '610427', '彬县', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2851', '610428', '长武县', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2852', '610429', '旬邑县', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2853', '610430', '淳化县', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2854', '610431', '武功县', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2855', '610481', '兴平市', '2', '610400');
INSERT INTO `jie_zone` VALUES ('2856', '610500', '渭南市', '1', '610000');
INSERT INTO `jie_zone` VALUES ('2857', '610502', '临渭区', '2', '610500');
INSERT INTO `jie_zone` VALUES ('2858', '610521', '华县', '2', '610500');
INSERT INTO `jie_zone` VALUES ('2859', '610522', '潼关县', '2', '610500');
INSERT INTO `jie_zone` VALUES ('2860', '610523', '大荔县', '2', '610500');
INSERT INTO `jie_zone` VALUES ('2861', '610524', '合阳县', '2', '610500');
INSERT INTO `jie_zone` VALUES ('2862', '610525', '澄城县', '2', '610500');
INSERT INTO `jie_zone` VALUES ('2863', '610526', '蒲城县', '2', '610500');
INSERT INTO `jie_zone` VALUES ('2864', '610527', '白水县', '2', '610500');
INSERT INTO `jie_zone` VALUES ('2865', '610528', '富平县', '2', '610500');
INSERT INTO `jie_zone` VALUES ('2866', '610581', '韩城市', '2', '610500');
INSERT INTO `jie_zone` VALUES ('2867', '610582', '华阴市', '2', '610500');
INSERT INTO `jie_zone` VALUES ('2868', '610600', '延安市', '1', '610000');
INSERT INTO `jie_zone` VALUES ('2869', '610602', '宝塔区', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2870', '610621', '延长县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2871', '610622', '延川县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2872', '610623', '子长县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2873', '610624', '安塞县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2874', '610625', '志丹县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2875', '610626', '吴起县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2876', '610627', '甘泉县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2877', '610628', '富县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2878', '610629', '洛川县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2879', '610630', '宜川县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2880', '610631', '黄龙县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2881', '610632', '黄陵县', '2', '610600');
INSERT INTO `jie_zone` VALUES ('2882', '610700', '汉中市', '1', '610000');
INSERT INTO `jie_zone` VALUES ('2883', '610702', '汉台区', '2', '610700');
INSERT INTO `jie_zone` VALUES ('2884', '610721', '南郑县', '2', '610700');
INSERT INTO `jie_zone` VALUES ('2885', '610722', '城固县', '2', '610700');
INSERT INTO `jie_zone` VALUES ('2886', '610723', '洋县', '2', '610700');
INSERT INTO `jie_zone` VALUES ('2887', '610724', '西乡县', '2', '610700');
INSERT INTO `jie_zone` VALUES ('2888', '610725', '勉县', '2', '610700');
INSERT INTO `jie_zone` VALUES ('2889', '610726', '宁强县', '2', '610700');
INSERT INTO `jie_zone` VALUES ('2890', '610727', '略阳县', '2', '610700');
INSERT INTO `jie_zone` VALUES ('2891', '610728', '镇巴县', '2', '610700');
INSERT INTO `jie_zone` VALUES ('2892', '610729', '留坝县', '2', '610700');
INSERT INTO `jie_zone` VALUES ('2893', '610730', '佛坪县', '2', '610700');
INSERT INTO `jie_zone` VALUES ('2894', '610800', '榆林市', '1', '610000');
INSERT INTO `jie_zone` VALUES ('2895', '610802', '榆阳区', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2896', '610821', '神木县', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2897', '610822', '府谷县', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2898', '610823', '横山县', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2899', '610824', '靖边县', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2900', '610825', '定边县', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2901', '610826', '绥德县', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2902', '610827', '米脂县', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2903', '610828', '佳县', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2904', '610829', '吴堡县', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2905', '610830', '清涧县', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2906', '610831', '子洲县', '2', '610800');
INSERT INTO `jie_zone` VALUES ('2907', '610900', '安康市', '1', '610000');
INSERT INTO `jie_zone` VALUES ('2908', '610902', '汉滨区', '2', '610900');
INSERT INTO `jie_zone` VALUES ('2909', '610921', '汉阴县', '2', '610900');
INSERT INTO `jie_zone` VALUES ('2910', '610922', '石泉县', '2', '610900');
INSERT INTO `jie_zone` VALUES ('2911', '610923', '宁陕县', '2', '610900');
INSERT INTO `jie_zone` VALUES ('2912', '610924', '紫阳县', '2', '610900');
INSERT INTO `jie_zone` VALUES ('2913', '610925', '岚皋县', '2', '610900');
INSERT INTO `jie_zone` VALUES ('2914', '610926', '平利县', '2', '610900');
INSERT INTO `jie_zone` VALUES ('2915', '610927', '镇坪县', '2', '610900');
INSERT INTO `jie_zone` VALUES ('2916', '610928', '旬阳县', '2', '610900');
INSERT INTO `jie_zone` VALUES ('2917', '610929', '白河县', '2', '610900');
INSERT INTO `jie_zone` VALUES ('2918', '611000', '商洛市', '1', '610000');
INSERT INTO `jie_zone` VALUES ('2919', '611002', '商州区', '2', '611000');
INSERT INTO `jie_zone` VALUES ('2920', '611021', '洛南县', '2', '611000');
INSERT INTO `jie_zone` VALUES ('2921', '611022', '丹凤县', '2', '611000');
INSERT INTO `jie_zone` VALUES ('2922', '611023', '商南县', '2', '611000');
INSERT INTO `jie_zone` VALUES ('2923', '611024', '山阳县', '2', '611000');
INSERT INTO `jie_zone` VALUES ('2924', '611025', '镇安县', '2', '611000');
INSERT INTO `jie_zone` VALUES ('2925', '611026', '柞水县', '2', '611000');
INSERT INTO `jie_zone` VALUES ('2926', '620000', '甘肃省', '0', '0');
INSERT INTO `jie_zone` VALUES ('2927', '620100', '兰州市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('2928', '620102', '城关区', '2', '620100');
INSERT INTO `jie_zone` VALUES ('2929', '620103', '七里河区', '2', '620100');
INSERT INTO `jie_zone` VALUES ('2930', '620104', '西固区', '2', '620100');
INSERT INTO `jie_zone` VALUES ('2931', '620105', '安宁区', '2', '620100');
INSERT INTO `jie_zone` VALUES ('2932', '620111', '红古区', '2', '620100');
INSERT INTO `jie_zone` VALUES ('2933', '620121', '永登县', '2', '620100');
INSERT INTO `jie_zone` VALUES ('2934', '620122', '皋兰县', '2', '620100');
INSERT INTO `jie_zone` VALUES ('2935', '620123', '榆中县', '2', '620100');
INSERT INTO `jie_zone` VALUES ('2936', '620200', '嘉峪关市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('2937', '620300', '金昌市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('2938', '620302', '金川区', '2', '620300');
INSERT INTO `jie_zone` VALUES ('2939', '620321', '永昌县', '2', '620300');
INSERT INTO `jie_zone` VALUES ('2940', '620400', '白银市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('2941', '620402', '白银区', '2', '620400');
INSERT INTO `jie_zone` VALUES ('2942', '620403', '平川区', '2', '620400');
INSERT INTO `jie_zone` VALUES ('2943', '620421', '靖远县', '2', '620400');
INSERT INTO `jie_zone` VALUES ('2944', '620422', '会宁县', '2', '620400');
INSERT INTO `jie_zone` VALUES ('2945', '620423', '景泰县', '2', '620400');
INSERT INTO `jie_zone` VALUES ('2946', '620500', '天水市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('2947', '620502', '秦州区', '2', '620500');
INSERT INTO `jie_zone` VALUES ('2948', '620503', '麦积区', '2', '620500');
INSERT INTO `jie_zone` VALUES ('2949', '620521', '清水县', '2', '620500');
INSERT INTO `jie_zone` VALUES ('2950', '620522', '秦安县', '2', '620500');
INSERT INTO `jie_zone` VALUES ('2951', '620523', '甘谷县', '2', '620500');
INSERT INTO `jie_zone` VALUES ('2952', '620524', '武山县', '2', '620500');
INSERT INTO `jie_zone` VALUES ('2953', '620525', '张家川回族自治县', '2', '620500');
INSERT INTO `jie_zone` VALUES ('2954', '620600', '武威市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('2955', '620602', '凉州区', '2', '620600');
INSERT INTO `jie_zone` VALUES ('2956', '620621', '民勤县', '2', '620600');
INSERT INTO `jie_zone` VALUES ('2957', '620622', '古浪县', '2', '620600');
INSERT INTO `jie_zone` VALUES ('2958', '620623', '天祝藏族自治县', '2', '620600');
INSERT INTO `jie_zone` VALUES ('2959', '620700', '张掖市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('2960', '620702', '甘州区', '2', '620700');
INSERT INTO `jie_zone` VALUES ('2961', '620721', '肃南裕固族自治县', '2', '620700');
INSERT INTO `jie_zone` VALUES ('2962', '620722', '民乐县', '2', '620700');
INSERT INTO `jie_zone` VALUES ('2963', '620723', '临泽县', '2', '620700');
INSERT INTO `jie_zone` VALUES ('2964', '620724', '高台县', '2', '620700');
INSERT INTO `jie_zone` VALUES ('2965', '620725', '山丹县', '2', '620700');
INSERT INTO `jie_zone` VALUES ('2966', '620800', '平凉市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('2967', '620802', '崆峒区', '2', '620800');
INSERT INTO `jie_zone` VALUES ('2968', '620821', '泾川县', '2', '620800');
INSERT INTO `jie_zone` VALUES ('2969', '620822', '灵台县', '2', '620800');
INSERT INTO `jie_zone` VALUES ('2970', '620823', '崇信县', '2', '620800');
INSERT INTO `jie_zone` VALUES ('2971', '620824', '华亭县', '2', '620800');
INSERT INTO `jie_zone` VALUES ('2972', '620825', '庄浪县', '2', '620800');
INSERT INTO `jie_zone` VALUES ('2973', '620826', '静宁县', '2', '620800');
INSERT INTO `jie_zone` VALUES ('2974', '620900', '酒泉市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('2975', '620902', '肃州区', '2', '620900');
INSERT INTO `jie_zone` VALUES ('2976', '620921', '金塔县', '2', '620900');
INSERT INTO `jie_zone` VALUES ('2977', '620922', '瓜州县', '2', '620900');
INSERT INTO `jie_zone` VALUES ('2978', '620923', '肃北蒙古族自治县', '2', '620900');
INSERT INTO `jie_zone` VALUES ('2979', '620924', '阿克塞哈萨克族自治县', '2', '620900');
INSERT INTO `jie_zone` VALUES ('2980', '620981', '玉门市', '2', '620900');
INSERT INTO `jie_zone` VALUES ('2981', '620982', '敦煌市', '2', '620900');
INSERT INTO `jie_zone` VALUES ('2982', '621000', '庆阳市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('2983', '621002', '西峰区', '2', '621000');
INSERT INTO `jie_zone` VALUES ('2984', '621021', '庆城县', '2', '621000');
INSERT INTO `jie_zone` VALUES ('2985', '621022', '环县', '2', '621000');
INSERT INTO `jie_zone` VALUES ('2986', '621023', '华池县', '2', '621000');
INSERT INTO `jie_zone` VALUES ('2987', '621024', '合水县', '2', '621000');
INSERT INTO `jie_zone` VALUES ('2988', '621025', '正宁县', '2', '621000');
INSERT INTO `jie_zone` VALUES ('2989', '621026', '宁县', '2', '621000');
INSERT INTO `jie_zone` VALUES ('2990', '621027', '镇原县', '2', '621000');
INSERT INTO `jie_zone` VALUES ('2991', '621100', '定西市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('2992', '621102', '安定区', '2', '621100');
INSERT INTO `jie_zone` VALUES ('2993', '621121', '通渭县', '2', '621100');
INSERT INTO `jie_zone` VALUES ('2994', '621122', '陇西县', '2', '621100');
INSERT INTO `jie_zone` VALUES ('2995', '621123', '渭源县', '2', '621100');
INSERT INTO `jie_zone` VALUES ('2996', '621124', '临洮县', '2', '621100');
INSERT INTO `jie_zone` VALUES ('2997', '621125', '漳县', '2', '621100');
INSERT INTO `jie_zone` VALUES ('2998', '621126', '岷县', '2', '621100');
INSERT INTO `jie_zone` VALUES ('2999', '621200', '陇南市', '1', '620000');
INSERT INTO `jie_zone` VALUES ('3000', '621202', '武都区', '2', '621200');
INSERT INTO `jie_zone` VALUES ('3001', '621221', '成县', '2', '621200');
INSERT INTO `jie_zone` VALUES ('3002', '621222', '文县', '2', '621200');
INSERT INTO `jie_zone` VALUES ('3003', '621223', '宕昌县', '2', '621200');
INSERT INTO `jie_zone` VALUES ('3004', '621224', '康县', '2', '621200');
INSERT INTO `jie_zone` VALUES ('3005', '621225', '西和县', '2', '621200');
INSERT INTO `jie_zone` VALUES ('3006', '621226', '礼县', '2', '621200');
INSERT INTO `jie_zone` VALUES ('3007', '621227', '徽县', '2', '621200');
INSERT INTO `jie_zone` VALUES ('3008', '621228', '两当县', '2', '621200');
INSERT INTO `jie_zone` VALUES ('3009', '622900', '临夏回族自治州', '1', '620000');
INSERT INTO `jie_zone` VALUES ('3010', '622901', '临夏市', '2', '622900');
INSERT INTO `jie_zone` VALUES ('3011', '622921', '临夏县', '2', '622900');
INSERT INTO `jie_zone` VALUES ('3012', '622922', '康乐县', '2', '622900');
INSERT INTO `jie_zone` VALUES ('3013', '622923', '永靖县', '2', '622900');
INSERT INTO `jie_zone` VALUES ('3014', '622924', '广河县', '2', '622900');
INSERT INTO `jie_zone` VALUES ('3015', '622925', '和政县', '2', '622900');
INSERT INTO `jie_zone` VALUES ('3016', '622926', '东乡族自治县', '2', '622900');
INSERT INTO `jie_zone` VALUES ('3017', '622927', '积石山保安族东乡族撒拉族自治县', '2', '622900');
INSERT INTO `jie_zone` VALUES ('3018', '623000', '甘南藏族自治州', '1', '620000');
INSERT INTO `jie_zone` VALUES ('3019', '623001', '合作市', '2', '623000');
INSERT INTO `jie_zone` VALUES ('3020', '623021', '临潭县', '2', '623000');
INSERT INTO `jie_zone` VALUES ('3021', '623022', '卓尼县', '2', '623000');
INSERT INTO `jie_zone` VALUES ('3022', '623023', '舟曲县', '2', '623000');
INSERT INTO `jie_zone` VALUES ('3023', '623024', '迭部县', '2', '623000');
INSERT INTO `jie_zone` VALUES ('3024', '623025', '玛曲县', '2', '623000');
INSERT INTO `jie_zone` VALUES ('3025', '623026', '碌曲县', '2', '623000');
INSERT INTO `jie_zone` VALUES ('3026', '623027', '夏河县', '2', '623000');
INSERT INTO `jie_zone` VALUES ('3027', '630000', '青海省', '0', '0');
INSERT INTO `jie_zone` VALUES ('3028', '630100', '西宁市', '1', '630000');
INSERT INTO `jie_zone` VALUES ('3029', '630102', '城东区', '2', '630100');
INSERT INTO `jie_zone` VALUES ('3030', '630103', '城中区', '2', '630100');
INSERT INTO `jie_zone` VALUES ('3031', '630104', '城西区', '2', '630100');
INSERT INTO `jie_zone` VALUES ('3032', '630105', '城北区', '2', '630100');
INSERT INTO `jie_zone` VALUES ('3033', '630121', '大通回族土族自治县', '2', '630100');
INSERT INTO `jie_zone` VALUES ('3034', '630122', '湟中县', '2', '630100');
INSERT INTO `jie_zone` VALUES ('3035', '630123', '湟源县', '2', '630100');
INSERT INTO `jie_zone` VALUES ('3036', '630200', '海东市', '1', '630000');
INSERT INTO `jie_zone` VALUES ('3037', '630202', '乐都区', '2', '630200');
INSERT INTO `jie_zone` VALUES ('3038', '630221', '平安县', '2', '630200');
INSERT INTO `jie_zone` VALUES ('3039', '630222', '民和回族土族自治县', '2', '630200');
INSERT INTO `jie_zone` VALUES ('3040', '630223', '互助土族自治县', '2', '630200');
INSERT INTO `jie_zone` VALUES ('3041', '630224', '化隆回族自治县', '2', '630200');
INSERT INTO `jie_zone` VALUES ('3042', '630225', '循化撒拉族自治县', '2', '630200');
INSERT INTO `jie_zone` VALUES ('3043', '632200', '海北藏族自治州', '1', '630000');
INSERT INTO `jie_zone` VALUES ('3044', '632221', '门源回族自治县', '2', '632200');
INSERT INTO `jie_zone` VALUES ('3045', '632222', '祁连县', '2', '632200');
INSERT INTO `jie_zone` VALUES ('3046', '632223', '海晏县', '2', '632200');
INSERT INTO `jie_zone` VALUES ('3047', '632224', '刚察县', '2', '632200');
INSERT INTO `jie_zone` VALUES ('3048', '632300', '黄南藏族自治州', '1', '630000');
INSERT INTO `jie_zone` VALUES ('3049', '632321', '同仁县', '2', '632300');
INSERT INTO `jie_zone` VALUES ('3050', '632322', '尖扎县', '2', '632300');
INSERT INTO `jie_zone` VALUES ('3051', '632323', '泽库县', '2', '632300');
INSERT INTO `jie_zone` VALUES ('3052', '632324', '河南蒙古族自治县', '2', '632300');
INSERT INTO `jie_zone` VALUES ('3053', '632500', '海南藏族自治州', '1', '630000');
INSERT INTO `jie_zone` VALUES ('3054', '632521', '共和县', '2', '632500');
INSERT INTO `jie_zone` VALUES ('3055', '632522', '同德县', '2', '632500');
INSERT INTO `jie_zone` VALUES ('3056', '632523', '贵德县', '2', '632500');
INSERT INTO `jie_zone` VALUES ('3057', '632524', '兴海县', '2', '632500');
INSERT INTO `jie_zone` VALUES ('3058', '632525', '贵南县', '2', '632500');
INSERT INTO `jie_zone` VALUES ('3059', '632600', '果洛藏族自治州', '1', '630000');
INSERT INTO `jie_zone` VALUES ('3060', '632621', '玛沁县', '2', '632600');
INSERT INTO `jie_zone` VALUES ('3061', '632622', '班玛县', '2', '632600');
INSERT INTO `jie_zone` VALUES ('3062', '632623', '甘德县', '2', '632600');
INSERT INTO `jie_zone` VALUES ('3063', '632624', '达日县', '2', '632600');
INSERT INTO `jie_zone` VALUES ('3064', '632625', '久治县', '2', '632600');
INSERT INTO `jie_zone` VALUES ('3065', '632626', '玛多县', '2', '632600');
INSERT INTO `jie_zone` VALUES ('3066', '632700', '玉树藏族自治州', '1', '630000');
INSERT INTO `jie_zone` VALUES ('3067', '632701', '玉树市', '2', '632700');
INSERT INTO `jie_zone` VALUES ('3068', '632722', '杂多县', '2', '632700');
INSERT INTO `jie_zone` VALUES ('3069', '632723', '称多县', '2', '632700');
INSERT INTO `jie_zone` VALUES ('3070', '632724', '治多县', '2', '632700');
INSERT INTO `jie_zone` VALUES ('3071', '632725', '囊谦县', '2', '632700');
INSERT INTO `jie_zone` VALUES ('3072', '632726', '曲麻莱县', '2', '632700');
INSERT INTO `jie_zone` VALUES ('3073', '632800', '海西蒙古族藏族自治州', '1', '630000');
INSERT INTO `jie_zone` VALUES ('3074', '632801', '格尔木市', '2', '632800');
INSERT INTO `jie_zone` VALUES ('3075', '632802', '德令哈市', '2', '632800');
INSERT INTO `jie_zone` VALUES ('3076', '632821', '乌兰县', '2', '632800');
INSERT INTO `jie_zone` VALUES ('3077', '632822', '都兰县', '2', '632800');
INSERT INTO `jie_zone` VALUES ('3078', '632823', '天峻县', '2', '632800');
INSERT INTO `jie_zone` VALUES ('3079', '640000', '宁夏回族自治区', '0', '0');
INSERT INTO `jie_zone` VALUES ('3080', '640100', '银川市', '1', '640000');
INSERT INTO `jie_zone` VALUES ('3081', '640104', '兴庆区', '2', '640100');
INSERT INTO `jie_zone` VALUES ('3082', '640105', '西夏区', '2', '640100');
INSERT INTO `jie_zone` VALUES ('3083', '640106', '金凤区', '2', '640100');
INSERT INTO `jie_zone` VALUES ('3084', '640121', '永宁县', '2', '640100');
INSERT INTO `jie_zone` VALUES ('3085', '640122', '贺兰县', '2', '640100');
INSERT INTO `jie_zone` VALUES ('3086', '640181', '灵武市', '2', '640100');
INSERT INTO `jie_zone` VALUES ('3087', '640200', '石嘴山市', '1', '640000');
INSERT INTO `jie_zone` VALUES ('3088', '640202', '大武口区', '2', '640200');
INSERT INTO `jie_zone` VALUES ('3089', '640205', '惠农区', '2', '640200');
INSERT INTO `jie_zone` VALUES ('3090', '640221', '平罗县', '2', '640200');
INSERT INTO `jie_zone` VALUES ('3091', '640300', '吴忠市', '1', '640000');
INSERT INTO `jie_zone` VALUES ('3092', '640302', '利通区', '2', '640300');
INSERT INTO `jie_zone` VALUES ('3093', '640303', '红寺堡区', '2', '640300');
INSERT INTO `jie_zone` VALUES ('3094', '640323', '盐池县', '2', '640300');
INSERT INTO `jie_zone` VALUES ('3095', '640324', '同心县', '2', '640300');
INSERT INTO `jie_zone` VALUES ('3096', '640381', '青铜峡市', '2', '640300');
INSERT INTO `jie_zone` VALUES ('3097', '640400', '固原市', '1', '640000');
INSERT INTO `jie_zone` VALUES ('3098', '640402', '原州区', '2', '640400');
INSERT INTO `jie_zone` VALUES ('3099', '640422', '西吉县', '2', '640400');
INSERT INTO `jie_zone` VALUES ('3100', '640423', '隆德县', '2', '640400');
INSERT INTO `jie_zone` VALUES ('3101', '640424', '泾源县', '2', '640400');
INSERT INTO `jie_zone` VALUES ('3102', '640425', '彭阳县', '2', '640400');
INSERT INTO `jie_zone` VALUES ('3103', '640500', '中卫市', '1', '640000');
INSERT INTO `jie_zone` VALUES ('3104', '640502', '沙坡头区', '2', '640500');
INSERT INTO `jie_zone` VALUES ('3105', '640521', '中宁县', '2', '640500');
INSERT INTO `jie_zone` VALUES ('3106', '640522', '海原县', '2', '640500');
INSERT INTO `jie_zone` VALUES ('3107', '650000', '新疆维吾尔自治区', '0', '0');
INSERT INTO `jie_zone` VALUES ('3108', '650100', '乌鲁木齐市', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3109', '650102', '天山区', '2', '650100');
INSERT INTO `jie_zone` VALUES ('3110', '650103', '沙依巴克区', '2', '650100');
INSERT INTO `jie_zone` VALUES ('3111', '650104', '新市区', '2', '650100');
INSERT INTO `jie_zone` VALUES ('3112', '650105', '水磨沟区', '2', '650100');
INSERT INTO `jie_zone` VALUES ('3113', '650106', '头屯河区', '2', '650100');
INSERT INTO `jie_zone` VALUES ('3114', '650107', '达坂城区', '2', '650100');
INSERT INTO `jie_zone` VALUES ('3115', '650109', '米东区', '2', '650100');
INSERT INTO `jie_zone` VALUES ('3116', '650121', '乌鲁木齐县', '2', '650100');
INSERT INTO `jie_zone` VALUES ('3117', '650200', '克拉玛依市', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3118', '650202', '独山子区', '2', '650200');
INSERT INTO `jie_zone` VALUES ('3119', '650203', '克拉玛依区', '2', '650200');
INSERT INTO `jie_zone` VALUES ('3120', '650204', '白碱滩区', '2', '650200');
INSERT INTO `jie_zone` VALUES ('3121', '650205', '乌尔禾区', '2', '650200');
INSERT INTO `jie_zone` VALUES ('3122', '652100', '吐鲁番地区', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3123', '652101', '吐鲁番市', '2', '652100');
INSERT INTO `jie_zone` VALUES ('3124', '652122', '鄯善县', '2', '652100');
INSERT INTO `jie_zone` VALUES ('3125', '652123', '托克逊县', '2', '652100');
INSERT INTO `jie_zone` VALUES ('3126', '652200', '哈密地区', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3127', '652201', '哈密市', '2', '652200');
INSERT INTO `jie_zone` VALUES ('3128', '652222', '巴里坤哈萨克自治县', '2', '652200');
INSERT INTO `jie_zone` VALUES ('3129', '652223', '伊吾县', '2', '652200');
INSERT INTO `jie_zone` VALUES ('3130', '652300', '昌吉回族自治州', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3131', '652301', '昌吉市', '2', '652300');
INSERT INTO `jie_zone` VALUES ('3132', '652302', '阜康市', '2', '652300');
INSERT INTO `jie_zone` VALUES ('3133', '652323', '呼图壁县', '2', '652300');
INSERT INTO `jie_zone` VALUES ('3134', '652324', '玛纳斯县', '2', '652300');
INSERT INTO `jie_zone` VALUES ('3135', '652325', '奇台县', '2', '652300');
INSERT INTO `jie_zone` VALUES ('3136', '652327', '吉木萨尔县', '2', '652300');
INSERT INTO `jie_zone` VALUES ('3137', '652328', '木垒哈萨克自治县', '2', '652300');
INSERT INTO `jie_zone` VALUES ('3138', '652700', '博尔塔拉蒙古自治州', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3139', '652701', '博乐市', '2', '652700');
INSERT INTO `jie_zone` VALUES ('3140', '652702', '阿拉山口市', '2', '652700');
INSERT INTO `jie_zone` VALUES ('3141', '652722', '精河县', '2', '652700');
INSERT INTO `jie_zone` VALUES ('3142', '652723', '温泉县', '2', '652700');
INSERT INTO `jie_zone` VALUES ('3143', '652800', '巴音郭楞蒙古自治州', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3144', '652801', '库尔勒市', '2', '652800');
INSERT INTO `jie_zone` VALUES ('3145', '652822', '轮台县', '2', '652800');
INSERT INTO `jie_zone` VALUES ('3146', '652823', '尉犁县', '2', '652800');
INSERT INTO `jie_zone` VALUES ('3147', '652824', '若羌县', '2', '652800');
INSERT INTO `jie_zone` VALUES ('3148', '652825', '且末县', '2', '652800');
INSERT INTO `jie_zone` VALUES ('3149', '652826', '焉耆回族自治县', '2', '652800');
INSERT INTO `jie_zone` VALUES ('3150', '652827', '和静县', '2', '652800');
INSERT INTO `jie_zone` VALUES ('3151', '652828', '和硕县', '2', '652800');
INSERT INTO `jie_zone` VALUES ('3152', '652829', '博湖县', '2', '652800');
INSERT INTO `jie_zone` VALUES ('3153', '652900', '阿克苏地区', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3154', '652901', '阿克苏市', '2', '652900');
INSERT INTO `jie_zone` VALUES ('3155', '652922', '温宿县', '2', '652900');
INSERT INTO `jie_zone` VALUES ('3156', '652923', '库车县', '2', '652900');
INSERT INTO `jie_zone` VALUES ('3157', '652924', '沙雅县', '2', '652900');
INSERT INTO `jie_zone` VALUES ('3158', '652925', '新和县', '2', '652900');
INSERT INTO `jie_zone` VALUES ('3159', '652926', '拜城县', '2', '652900');
INSERT INTO `jie_zone` VALUES ('3160', '652927', '乌什县', '2', '652900');
INSERT INTO `jie_zone` VALUES ('3161', '652928', '阿瓦提县', '2', '652900');
INSERT INTO `jie_zone` VALUES ('3162', '652929', '柯坪县', '2', '652900');
INSERT INTO `jie_zone` VALUES ('3163', '653000', '克孜勒苏柯尔克孜自治州', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3164', '653001', '阿图什市', '2', '653000');
INSERT INTO `jie_zone` VALUES ('3165', '653022', '阿克陶县', '2', '653000');
INSERT INTO `jie_zone` VALUES ('3166', '653023', '阿合奇县', '2', '653000');
INSERT INTO `jie_zone` VALUES ('3167', '653024', '乌恰县', '2', '653000');
INSERT INTO `jie_zone` VALUES ('3168', '653100', '喀什地区', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3169', '653101', '喀什市', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3170', '653121', '疏附县', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3171', '653122', '疏勒县', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3172', '653123', '英吉沙县', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3173', '653124', '泽普县', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3174', '653125', '莎车县', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3175', '653126', '叶城县', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3176', '653127', '麦盖提县', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3177', '653128', '岳普湖县', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3178', '653129', '伽师县', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3179', '653130', '巴楚县', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3180', '653131', '塔什库尔干塔吉克自治县', '2', '653100');
INSERT INTO `jie_zone` VALUES ('3181', '653200', '和田地区', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3182', '653201', '和田市', '2', '653200');
INSERT INTO `jie_zone` VALUES ('3183', '653221', '和田县', '2', '653200');
INSERT INTO `jie_zone` VALUES ('3184', '653222', '墨玉县', '2', '653200');
INSERT INTO `jie_zone` VALUES ('3185', '653223', '皮山县', '2', '653200');
INSERT INTO `jie_zone` VALUES ('3186', '653224', '洛浦县', '2', '653200');
INSERT INTO `jie_zone` VALUES ('3187', '653225', '策勒县', '2', '653200');
INSERT INTO `jie_zone` VALUES ('3188', '653226', '于田县', '2', '653200');
INSERT INTO `jie_zone` VALUES ('3189', '653227', '民丰县', '2', '653200');
INSERT INTO `jie_zone` VALUES ('3190', '654000', '伊犁哈萨克自治州', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3191', '654002', '伊宁市', '2', '654000');
INSERT INTO `jie_zone` VALUES ('3192', '654003', '奎屯市', '2', '654000');
INSERT INTO `jie_zone` VALUES ('3193', '654021', '伊宁县', '2', '654000');
INSERT INTO `jie_zone` VALUES ('3194', '654022', '察布查尔锡伯自治县', '2', '654000');
INSERT INTO `jie_zone` VALUES ('3195', '654023', '霍城县', '2', '654000');
INSERT INTO `jie_zone` VALUES ('3196', '654024', '巩留县', '2', '654000');
INSERT INTO `jie_zone` VALUES ('3197', '654025', '新源县', '2', '654000');
INSERT INTO `jie_zone` VALUES ('3198', '654026', '昭苏县', '2', '654000');
INSERT INTO `jie_zone` VALUES ('3199', '654027', '特克斯县', '2', '654000');
INSERT INTO `jie_zone` VALUES ('3200', '654028', '尼勒克县', '2', '654000');
INSERT INTO `jie_zone` VALUES ('3201', '654200', '塔城地区', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3202', '654201', '塔城市', '2', '654200');
INSERT INTO `jie_zone` VALUES ('3203', '654202', '乌苏市', '2', '654200');
INSERT INTO `jie_zone` VALUES ('3204', '654221', '额敏县', '2', '654200');
INSERT INTO `jie_zone` VALUES ('3205', '654223', '沙湾县', '2', '654200');
INSERT INTO `jie_zone` VALUES ('3206', '654224', '托里县', '2', '654200');
INSERT INTO `jie_zone` VALUES ('3207', '654225', '裕民县', '2', '654200');
INSERT INTO `jie_zone` VALUES ('3208', '654226', '和布克赛尔蒙古自治县', '2', '654200');
INSERT INTO `jie_zone` VALUES ('3209', '654300', '阿勒泰地区', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3210', '654301', '阿勒泰市', '2', '654300');
INSERT INTO `jie_zone` VALUES ('3211', '654321', '布尔津县', '2', '654300');
INSERT INTO `jie_zone` VALUES ('3212', '654322', '富蕴县', '2', '654300');
INSERT INTO `jie_zone` VALUES ('3213', '654323', '福海县', '2', '654300');
INSERT INTO `jie_zone` VALUES ('3214', '654324', '哈巴河县', '2', '654300');
INSERT INTO `jie_zone` VALUES ('3215', '654325', '青河县', '2', '654300');
INSERT INTO `jie_zone` VALUES ('3216', '654326', '吉木乃县', '2', '654300');
INSERT INTO `jie_zone` VALUES ('3217', '659000', '自治区直辖县级行政区划', '1', '650000');
INSERT INTO `jie_zone` VALUES ('3218', '659001', '石河子市', '2', '659000');
INSERT INTO `jie_zone` VALUES ('3219', '659002', '阿拉尔市', '2', '659000');
INSERT INTO `jie_zone` VALUES ('3220', '659003', '图木舒克市', '2', '659000');
INSERT INTO `jie_zone` VALUES ('3221', '659004', '五家渠市', '2', '659000');
INSERT INTO `jie_zone` VALUES ('3222', '710000', '台湾省', '0', '0');
INSERT INTO `jie_zone` VALUES ('3223', '710100', '台北市', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3224', '710101', '中正区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3225', '710102', '大同区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3226', '710103', '中山区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3227', '710104', '松山区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3228', '710105', '大安区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3229', '710106', '万华区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3230', '710107', '信义区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3231', '710108', '士林区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3232', '710109', '北投区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3233', '710110', '内湖区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3234', '710111', '南港区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3235', '710112', '文山区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3236', '710113', '其它区', '2', '710100');
INSERT INTO `jie_zone` VALUES ('3237', '710200', '高雄市', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3238', '710201', '新兴区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3239', '710202', '前金区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3240', '710203', '芩雅区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3241', '710204', '盐埕区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3242', '710205', '鼓山区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3243', '710206', '旗津区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3244', '710207', '前镇区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3245', '710208', '三民区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3246', '710209', '左营区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3247', '710210', '楠梓区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3248', '710211', '小港区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3249', '710212', '其它区', '2', '710200');
INSERT INTO `jie_zone` VALUES ('3250', '710300', '台南市', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3251', '710301', '中西区', '2', '710300');
INSERT INTO `jie_zone` VALUES ('3252', '710302', '东区', '2', '710300');
INSERT INTO `jie_zone` VALUES ('3253', '710303', '南区', '2', '710300');
INSERT INTO `jie_zone` VALUES ('3254', '710304', '北区', '2', '710300');
INSERT INTO `jie_zone` VALUES ('3255', '710305', '安平区', '2', '710300');
INSERT INTO `jie_zone` VALUES ('3256', '710306', '安南区', '2', '710300');
INSERT INTO `jie_zone` VALUES ('3257', '710307', '其它区', '2', '710300');
INSERT INTO `jie_zone` VALUES ('3258', '710400', '台中市', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3259', '710401', '中区', '2', '710400');
INSERT INTO `jie_zone` VALUES ('3260', '710402', '东区', '2', '710400');
INSERT INTO `jie_zone` VALUES ('3261', '710403', '南区', '2', '710400');
INSERT INTO `jie_zone` VALUES ('3262', '710404', '西区', '2', '710400');
INSERT INTO `jie_zone` VALUES ('3263', '710405', '北区', '2', '710400');
INSERT INTO `jie_zone` VALUES ('3264', '710406', '北屯区', '2', '710400');
INSERT INTO `jie_zone` VALUES ('3265', '710407', '西屯区', '2', '710400');
INSERT INTO `jie_zone` VALUES ('3266', '710408', '南屯区', '2', '710400');
INSERT INTO `jie_zone` VALUES ('3267', '710409', '其它区', '2', '710400');
INSERT INTO `jie_zone` VALUES ('3268', '710500', '金门县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3269', '710600', '南投县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3270', '710700', '基隆市', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3271', '710701', '仁爱区', '2', '710700');
INSERT INTO `jie_zone` VALUES ('3272', '710702', '信义区', '2', '710700');
INSERT INTO `jie_zone` VALUES ('3273', '710703', '中正区', '2', '710700');
INSERT INTO `jie_zone` VALUES ('3274', '710704', '中山区', '2', '710700');
INSERT INTO `jie_zone` VALUES ('3275', '710705', '安乐区', '2', '710700');
INSERT INTO `jie_zone` VALUES ('3276', '710706', '暖暖区', '2', '710700');
INSERT INTO `jie_zone` VALUES ('3277', '710707', '七堵区', '2', '710700');
INSERT INTO `jie_zone` VALUES ('3278', '710708', '其它区', '2', '710700');
INSERT INTO `jie_zone` VALUES ('3279', '710800', '新竹市', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3280', '710801', '东区', '2', '710800');
INSERT INTO `jie_zone` VALUES ('3281', '710802', '北区', '2', '710800');
INSERT INTO `jie_zone` VALUES ('3282', '710803', '香山区', '2', '710800');
INSERT INTO `jie_zone` VALUES ('3283', '710804', '其它区', '2', '710800');
INSERT INTO `jie_zone` VALUES ('3284', '710900', '嘉义市', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3285', '710901', '东区', '2', '710900');
INSERT INTO `jie_zone` VALUES ('3286', '710902', '西区', '2', '710900');
INSERT INTO `jie_zone` VALUES ('3287', '710903', '其它区', '2', '710900');
INSERT INTO `jie_zone` VALUES ('3288', '711100', '新北市', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3289', '711200', '宜兰县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3290', '711300', '新竹县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3291', '711400', '桃园县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3292', '711500', '苗栗县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3293', '711700', '彰化县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3294', '711900', '嘉义县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3295', '712100', '云林县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3296', '712400', '屏东县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3297', '712500', '台东县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3298', '712600', '花莲县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3299', '712700', '澎湖县', '1', '710000');
INSERT INTO `jie_zone` VALUES ('3300', '810000', '香港', '0', '0');
INSERT INTO `jie_zone` VALUES ('3301', '810100', '香港岛', '1', '810000');
INSERT INTO `jie_zone` VALUES ('3302', '810101', '中西区', '2', '810100');
INSERT INTO `jie_zone` VALUES ('3303', '810102', '湾仔', '2', '810100');
INSERT INTO `jie_zone` VALUES ('3304', '810103', '东区', '2', '810100');
INSERT INTO `jie_zone` VALUES ('3305', '810104', '南区', '2', '810100');
INSERT INTO `jie_zone` VALUES ('3306', '810200', '九龙', '1', '810000');
INSERT INTO `jie_zone` VALUES ('3307', '810201', '九龙城区', '2', '810200');
INSERT INTO `jie_zone` VALUES ('3308', '810202', '油尖旺区', '2', '810200');
INSERT INTO `jie_zone` VALUES ('3309', '810203', '深水埗区', '2', '810200');
INSERT INTO `jie_zone` VALUES ('3310', '810204', '黄大仙区', '2', '810200');
INSERT INTO `jie_zone` VALUES ('3311', '810205', '观塘区', '2', '810200');
INSERT INTO `jie_zone` VALUES ('3312', '810300', '新界', '1', '810000');
INSERT INTO `jie_zone` VALUES ('3313', '810301', '北区', '2', '810300');
INSERT INTO `jie_zone` VALUES ('3314', '810302', '大埔区', '2', '810300');
INSERT INTO `jie_zone` VALUES ('3315', '810303', '沙田区', '2', '810300');
INSERT INTO `jie_zone` VALUES ('3316', '810304', '西贡区', '2', '810300');
INSERT INTO `jie_zone` VALUES ('3317', '810305', '元朗区', '2', '810300');
INSERT INTO `jie_zone` VALUES ('3318', '810306', '屯门区', '2', '810300');
INSERT INTO `jie_zone` VALUES ('3319', '810307', '荃湾区', '2', '810300');
INSERT INTO `jie_zone` VALUES ('3320', '810308', '葵青区', '2', '810300');
INSERT INTO `jie_zone` VALUES ('3321', '810309', '离岛区', '2', '810300');
INSERT INTO `jie_zone` VALUES ('3322', '820000', '澳门', '0', '0');
INSERT INTO `jie_zone` VALUES ('3323', '820100', '澳门半岛', '1', '820000');
INSERT INTO `jie_zone` VALUES ('3324', '820200', '离岛', '1', '820000');
INSERT INTO `jie_zone` VALUES ('3325', '990000', '海外', '0', '0');
INSERT INTO `jie_zone` VALUES ('3326', '990100', '海外', '1', '990000');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `path` varchar(64) DEFAULT '',
  `name` varchar(64) DEFAULT '' COMMENT '必须是唯一的',
  `modular` varchar(64) DEFAULT '',
  `component` varchar(64) DEFAULT '',
  `meta` text,
  `parent_id` int(10) DEFAULT NULL,
  `is_sub` tinyint(1) NOT NULL,
  `created_At` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL,
  `deleted_At` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `key` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '/', '所有', '', null, null, null, '0', null, null, null);
INSERT INTO `menu` VALUES ('2', 'sys_mgr', 'sys_mgr', null, null, '{\"title\":\"系统管理\", \"icon\":\"ios-settings\"}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('3', 'user_mgr', 'user_mgr', '/admin/users', '/users', '{\"title\":\"用户管理\", \"icon\":\"ios-settings\"}', '2', '1', null, null, null);
INSERT INTO `menu` VALUES ('4', 'role_mgr', 'role_mgr', '/admin/role', '/role', '{\"title\":\"角色管理\", \"icon\":\"ios-settings\"}', '2', '1', null, null, null);
INSERT INTO `menu` VALUES ('5', 'menu_mgr', 'menu_mgr', '/admin/menus', '/menu', '{\"title\":\"菜单管理\", \"icon\":\"ios-settings\"}', '2', '1', null, null, null);
INSERT INTO `menu` VALUES ('6', 'dep_mgr', 'dep_mgr', '/admin/dep', '/dep', '{\"title\":\"部门管理\", \"icon\":\"ios-settings\"}', '2', '1', null, null, null);
INSERT INTO `menu` VALUES ('7', 'demo_mgr', 'demo_mgr', null, null, '{\"title\":\"demo管理\", \"icon\":\"ios-settings\"}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('8', 'product_mgr', 'product_mgr', '/demo/product', '/product', '{\"title\":\"产品管理\", \"icon\":\"ios-settings\"}', '7', '1', null, null, null);
INSERT INTO `menu` VALUES ('9', 'product_cate_mgr', 'product_cate_mgr', '/demo/product_cate', '/product_cate', '{\"title\":\"产品类别\", \"icon\":\"ios-settings\"}', '7', '1', '2018-07-25 14:00:27', null, null);
INSERT INTO `menu` VALUES ('10', '/demo3', 'demo3', '/demo', '/demo3', null, '7', '1', '2018-07-25 14:14:05', null, null);
INSERT INTO `menu` VALUES ('11', 'doc', 'doc', '', '', '{\"title\":\"文档\", \"href\":\"https://lison16.github.io/iview-admin-doc/#/\", \"icon\":\"ios-book\"}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('12', 'join', 'join', '', '', '{\"hideInBread\": true}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('13', 'join_page', 'join_page', '', '/join_page', '{\"icon\":\"_qq\", \"title\":\"QQ群\"}', '12', '1', null, null, null);
INSERT INTO `menu` VALUES ('14', 'message', 'message', '', '', '{\"hideInBread\":true, \"hideInMenu\":true}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('15', 'message_page', 'message_page', '/single-page/message', '/index', '{\"icon\":\"md-notifications\", \"title\":\"消息中心\"}', '14', '1', null, null, null);
INSERT INTO `menu` VALUES ('16', 'components', 'components', null, null, '{\"icon\":\"logo-buffer\", \"title\":\"组件\"}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('17', 'tree_select_page', 'tree_select_page', '/components/tree-select', '/index', '{\"icon\":\"md-arrow-dropdown-circle\", \"title\":\"树状下拉选择器\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('18', 'count_to_page', 'count_to_page', '/components/count-to', '/count-to', '{\"icon\":\"md-trending-up\", \"title\":\"数字渐变\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('19', 'drag_list_page', 'drag_list_page', '/components/drag-list', '/drag-list', '{\"icon\":\"ios-infinite\", \"title\":\"拖拽列表\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('20', 'drag_drawer_page', 'drag_drawer_page', '/components/drag-drawer', '/index', '{\"icon\":\"md-list\", \"title\":\"可拖拽抽屉\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('21', 'org_tree_page', 'org_tree_page', '/components/org-tree', '/index', '{\"icon\":\"ios-people\", \"title\":\"组织结构树\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('22', 'tree_table_page', 'tree_table_page', '/components/tree-table', '/index', '{\"icon\":\"md-git-branch\", \"title\":\"树状表格\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('23', 'cropper_page', 'cropper_page', '/components/cropper', '/cropper', '{\"icon\":\"md-crop\", \"title\":\"图片裁剪\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('24', 'tables_page', 'tables_page', '/components/tables', '/tables', '{\"icon\":\"md-grid\", \"title\":\"多功能表格\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('25', 'split_pane_page', 'split_pane_page', '/components/split-pane', '/split-pane', '{\"icon\":\"md-pause\", \"title\":\"分割窗口\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('26', 'markdown_page', 'markdown_page', '/components/markdown', '/markdown', '{\"icon\":\"logo-markdown\", \"title\":\"Markdown编辑器\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('27', 'editor_page', 'editor_page', '/components/editor', '/editor', '{\"icon\":\"ios-create\", \"title\":\"富文本编辑器\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('28', 'icons_page', 'icons_page', '/components/icons', '/icons', '{\"icon\":\"_bear\", \"title\":\"自定义图标\"}', '16', '1', null, null, null);
INSERT INTO `menu` VALUES ('29', 'update', 'update', '', '', '{\"icon\":\"md-cloud-upload\", \"title\":\"数据上传\"}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('30', 'update_table_page', 'update_table_page', '/update', '/update-table', '{\"icon\":\"ios-document\", \"title\":\"上传Csv\"}', '29', '1', null, null, null);
INSERT INTO `menu` VALUES ('31', 'update_paste_page', 'update_paste_page', '/update', '/update-paste', '{\"icon\":\"md-clipboard\", \"title\":\"粘贴表格数据\"}', '29', '1', null, null, null);
INSERT INTO `menu` VALUES ('32', 'excel', 'excel', '', '', '{\"icon\":\"ios-stats\", \"title\":\"EXCEL导入导出\"}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('33', 'upload-excel', 'upload-excel', '/excel', '/upload-excel', '{\"icon\":\"md-add\", \"title\":\"导入EXCEL\"}', '32', '1', null, null, null);
INSERT INTO `menu` VALUES ('34', 'export-excel', 'export-excel', '/excel', '/export-excel', '{\"icon\":\"md-download\", \"title\":\"导出EXCEL\"}', '32', '1', null, null, null);
INSERT INTO `menu` VALUES ('35', 'tools_methods', 'tools_methods', '', '', '{\"hideInBread\":true}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('36', 'tools_methods_page', 'tools_methods_page', '/tools-methods', '/tools-methods', '{\"icon\":\"ios-hammer\", \"title\":\"工具方法\", \"beforeCloseName\":\"before_close_normal\"}', '35', '1', null, null, null);
INSERT INTO `menu` VALUES ('37', 'i18n', 'i18n', '', '', '{\"hideInBread\":true}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('38', 'i18n_page', 'i18n_page', '/i18n', '/i18n-page', '{\"icon\":\"md-planet\", \"title\":\"i18n - {{ i18n_page }}\"}', '37', '1', null, null, null);
INSERT INTO `menu` VALUES ('39', 'error_store', 'error_store', '', '', '{\"hideInBread\":true}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('40', 'error_store_page', 'error_store_page', '/error-store', '/error-store', '{\"icon\":\"ios-bug\", \"title\":\"错误收集\"}', '39', '1', null, null, null);
INSERT INTO `menu` VALUES ('41', 'error_logger', 'error_logger', '', '', '{\"hideInBread\":true, \"hideInMenu\":true}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('42', 'error_logger_page', 'error_logger_page', '/single-page', '/error-logger', '{\"icon\":\"ios-bug\", \"title\":\"错误收集\"}', '41', '1', null, null, null);
INSERT INTO `menu` VALUES ('43', 'directive', 'directive', '', '', '{\"hideInBread\":true}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('44', 'directive_page', 'directive_page', '/directive', '/directive', '{\"icon\":\"ios-navigate\", \"title\":\"指令\"}', '43', '1', null, null, null);
INSERT INTO `menu` VALUES ('45', 'argu', 'argu', '', '', '{\"hideInBread\":true}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('46', 'params/:id', 'params', '/argu-page', '/params', '{\"icon\":\"md-flower\", \"title\":\"route => `{{ params }}-${route.params.id}`\", \"notCache\":true, \"beforeCloseName\":true}', '45', '1', null, null, null);
INSERT INTO `menu` VALUES ('47', 'query', 'query', '/argu-page', '/query', '{\"icon\":\"md-flower\", \"title\":\"route => `{{ params }}-${route.params.id}`\", \"notCache\":true}', '45', '1', null, null, null);
INSERT INTO `menu` VALUES ('48', '401', 'error_401', '/error-page', '/401', '{\"hideInBread\":true}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('49', '500', 'error_500', '/error-page', '/500', '{\"hideInBread\":true}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('50', '*', 'error_404', '/error-page', '/404', '{\"hideInBread\":true}', '1', '0', null, null, null);
INSERT INTO `menu` VALUES ('51', 'operation_mgr', 'operation_mgr', '/admin/operation', '/operation', '{\"title\":\"系统操作\", \"icon\":\"ios-settings\"}', '2', '1', null, null, null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `gender` varchar(2) DEFAULT '' COMMENT '性别',
  `enable` tinyint(1) DEFAULT '0' COMMENT '0：启用用户 1：禁用用户',
  `name` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `userface` varchar(255) NOT NULL DEFAULT '',
  `createtime` datetime DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('76', 'yhm1', 'x04jpoIrc8/mvNRqAG59Wg==', '', '1', '1', '', '', '', '2019-01-14 11:54:11', null);
INSERT INTO `sys_user` VALUES ('90', 'root', 'x04jpoIrc8/mvNRqAG59Wg==', '', '1', '超级用户', '', '', '', '2019-01-16 10:42:34', null);
INSERT INTO `sys_user` VALUES ('108', '4', '6Xf9dl8Cv7OVFdc45vR7ig==', '', '1', '2', '', '', '', '2019-01-18 13:34:56', null);
INSERT INTO `sys_user` VALUES ('111', 'root1', 'x04jpoIrc8/mvNRqAG59Wg==', '', '1', '超级用户', '', '', '', '2019-01-16 10:42:34', null);
INSERT INTO `sys_user` VALUES ('112', 'yhm21', 'x04jpoIrc8/mvNRqAG59Wg==', '', '1', 'yy', '3213123', 'qq.com', '', '2019-01-18 10:08:12', null);
INSERT INTO `sys_user` VALUES ('114', '22-2012341', '123456', '', '1', 'fsdvcdxcvx', 'ffffffffffffffffffffff', '.,.mn,nm,hgntfrgffffffffffff', '', '2019-01-18 12:54:54', null);
INSERT INTO `sys_user` VALUES ('115', '3-121', '32qewqewqe', '', '0', '3ewqdd343444', '', 'sadsad1fs,..', '', '2019-01-18 12:56:31', null);
INSERT INTO `sys_user` VALUES ('116', '41', '6Xf9dl8Cv7OVFdc45vR7ig==', '', '1', '77', '', '', '', '2019-01-18 13:34:56', null);
INSERT INTO `sys_user` VALUES ('123', '3-127', '32qewqewqe', '', '0', '3ewqdd343444', '', 'sadsad1fs,..', '', '2019-01-18 12:56:31', null);
INSERT INTO `sys_user` VALUES ('124', '48', '6Xf9dl8Cv7OVFdc45vR7ig==', '', '1', '4', '', '', '', '2019-01-18 13:34:56', null);
INSERT INTO `sys_user` VALUES ('125', '9', 'CBpaVgtlw7hA/zD1hFbcdw==', '', '1', '', '', '', '', '2019-03-25 14:06:35', null);
INSERT INTO `sys_user` VALUES ('126', 'yhm11', 'x04jpoIrc8/mvNRqAG59Wg==', '', '1', '266', '', '', '', '2019-01-14 11:54:11', null);

-- ----------------------------
-- Table structure for test_family
-- ----------------------------
DROP TABLE IF EXISTS `test_family`;
CREATE TABLE `test_family` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `gender` tinyint(1) unsigned DEFAULT NULL COMMENT '0:man,1:woman:',
  `relationship` varchar(10) DEFAULT NULL,
  `createdAt` int(10) unsigned DEFAULT NULL,
  `updatedAt` int(10) unsigned DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='家庭成员';

-- ----------------------------
-- Records of test_family
-- ----------------------------
INSERT INTO `test_family` VALUES ('1', '你爷爷', '0', '1', null, null, '1');
INSERT INTO `test_family` VALUES ('2', '你奶奶', '1', '1', null, null, '1');

-- ----------------------------
-- Table structure for test_lesson
-- ----------------------------
DROP TABLE IF EXISTS `test_lesson`;
CREATE TABLE `test_lesson` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='课程';

-- ----------------------------
-- Records of test_lesson
-- ----------------------------
INSERT INTO `test_lesson` VALUES ('1', '语文');
INSERT INTO `test_lesson` VALUES ('2', '数学');
INSERT INTO `test_lesson` VALUES ('3', '英语');

-- ----------------------------
-- Table structure for test_relation
-- ----------------------------
DROP TABLE IF EXISTS `test_relation`;
CREATE TABLE `test_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonId` int(10) unsigned NOT NULL,
  `teacherId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='课程和老师的关系';

-- ----------------------------
-- Records of test_relation
-- ----------------------------
INSERT INTO `test_relation` VALUES ('1', '2', '1');
INSERT INTO `test_relation` VALUES ('2', '1', '2');
INSERT INTO `test_relation` VALUES ('3', '3', '3');

-- ----------------------------
-- Table structure for test_teacher
-- ----------------------------
DROP TABLE IF EXISTS `test_teacher`;
CREATE TABLE `test_teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='老师';

-- ----------------------------
-- Records of test_teacher
-- ----------------------------
INSERT INTO `test_teacher` VALUES ('1', '华老师');
INSERT INTO `test_teacher` VALUES ('2', '马老师');
INSERT INTO `test_teacher` VALUES ('3', 'MRLI');

-- ----------------------------
-- Table structure for test_user
-- ----------------------------
DROP TABLE IF EXISTS `test_user`;
CREATE TABLE `test_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of test_user
-- ----------------------------
INSERT INTO `test_user` VALUES ('1', 'ccc');
INSERT INTO `test_user` VALUES ('2', 'ddd');
INSERT INTO `test_user` VALUES ('3', 'eee');
INSERT INTO `test_user` VALUES ('4', 'ccc');
INSERT INTO `test_user` VALUES ('7', 'ccc');
INSERT INTO `test_user` VALUES ('8', 'ddd');
INSERT INTO `test_user` VALUES ('9', 'eee');

-- ----------------------------
-- Table structure for test_user_info
-- ----------------------------
DROP TABLE IF EXISTS `test_user_info`;
CREATE TABLE `test_user_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `age` tinyint(4) unsigned DEFAULT '0',
  `address` varchar(50) DEFAULT '',
  `userId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户表信息';

-- ----------------------------
-- Records of test_user_info
-- ----------------------------
INSERT INTO `test_user_info` VALUES ('1', '50', '昆明', '1');
INSERT INTO `test_user_info` VALUES ('2', '20', '北京', '2');
INSERT INTO `test_user_info` VALUES ('3', '20', '上海', '1');
INSERT INTO `test_user_info` VALUES ('4', '20', '深圳', '1');
INSERT INTO `test_user_info` VALUES ('5', '20', '深圳', '1');
INSERT INTO `test_user_info` VALUES ('6', '20', '深圳', '1');
