/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50725
Source Host           : 127.0.0.1:3306
Source Database       : house

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-29 19:25:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `userpwd` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', '666666', '55555');

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `house_desc` varchar(255) NOT NULL COMMENT '租房描述',
  `house_model` varchar(20) NOT NULL COMMENT '房屋类型，几室几厅',
  `house_area` varchar(20) NOT NULL COMMENT '房屋面积',
  `house_floor` varchar(20) NOT NULL COMMENT '房屋楼层',
  `house_type` varchar(20) NOT NULL COMMENT '出租方式',
  `house_price` int(10) NOT NULL COMMENT '出租价格',
  `house_address` varchar(100) NOT NULL COMMENT '出租地址',
  `house_image` varchar(1000) NOT NULL COMMENT '房屋简介照片',
  `community_name` varchar(100) NOT NULL COMMENT '小区名字',
  `house_linkman` varchar(11) NOT NULL COMMENT '房屋联系电话',
  `house_oriented` varchar(20) NOT NULL COMMENT '房屋朝向',
  `house_detailes_img` varchar(1000) NOT NULL COMMENT '房屋详细页面展示图片',
  `publisher` varchar(50) NOT NULL DEFAULT '管理员' COMMENT '发布人',
  `publish_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('1', '双东向两居室 进门有玄关 直走是餐厅客厅 卧室厨房客厅全朝东向', '111', '157', '20', '整租', '800', '111', 'https://image1.ljcdn.com/110000-inspection/prod-02c2db37-5ea0-4f4b-8420-2b59714256f2.jpg.780x439.jpg', '朝阳花园', '12345678910', '南北', '2b59714256f2.jpg.780x439.jpg', '张朝阳', '2019-04-19 16:24:10');
INSERT INTO `t_house` VALUES ('2', '11111', '111', '111', '11', '整租', '1111', '111', '', '111', '12345678910', '南北', '', '马云', '2019-04-19 16:24:13');
INSERT INTO `t_house` VALUES ('3', '11111', '111', '111', '11', '整租', '1111', '111', '', '111', '12345678910', '南北', '', '刘强东', '2019-04-19 16:24:16');
INSERT INTO `t_house` VALUES ('4', '11111', '111', '111', '11', '整租', '1111', '111', '', '111', '12345678910', '南北', '', '马化腾', '2019-04-19 16:24:17');
INSERT INTO `t_house` VALUES ('5', '11111', '111', '111', '11', '整租', '1111', '111', '', '111', '12345678910', '南北', '', '维尼', '2019-04-19 16:24:34');
INSERT INTO `t_house` VALUES ('6', '冰与火之歌', '3室3厅', '200', '高层', '整租', '888', '明尼苏达州', '/file/831c348e-6f2b-4153-87c1-28f184c65bd7.jpg', '东东强', '11111222223', '南北', '', '张三', '2019-04-26 23:58:05');
INSERT INTO `t_house` VALUES ('8', '冰与火之歌', '3室3厅', '200', '高层', '整租', '888', '明尼苏达州', '/file/831c348e-6f2b-4153-87c1-28f184c65bd7.jpg', '东东强', '11111222223', '南北', '', '张三', '2019-04-26 23:58:19');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_id` int(11) NOT NULL COMMENT '房屋租赁id',
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `order_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_user` varchar(20) NOT NULL,
  PRIMARY KEY (`o_id`),
  KEY `fk1` (`h_id`),
  KEY `fk2` (`u_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`h_id`) REFERENCES `t_house` (`h_id`),
  CONSTRAINT `fk2` FOREIGN KEY (`u_id`) REFERENCES `t_users` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '1', '10', '2019-04-26 22:08:15', '张三');
INSERT INTO `t_order` VALUES ('2', '1', '10', '2019-04-26 22:08:18', '张三');
INSERT INTO `t_order` VALUES ('3', '1', '10', '2019-04-26 22:08:20', '张三');
INSERT INTO `t_order` VALUES ('4', '1', '10', '2019-04-26 22:08:37', '张三');
INSERT INTO `t_order` VALUES ('6', '1', '11', '2019-04-26 22:29:22', '张三');
INSERT INTO `t_order` VALUES ('7', '1', '11', '2019-04-26 22:29:23', '张三');
INSERT INTO `t_order` VALUES ('9', '1', '11', '2019-04-26 22:29:27', '张三');
INSERT INTO `t_order` VALUES ('11', '8', '11', '2019-04-27 00:03:44', '张三');
INSERT INTO `t_order` VALUES ('12', '1', '11', '2019-04-27 00:07:31', '张三');
INSERT INTO `t_order` VALUES ('13', '1', '11', '2019-04-27 00:09:17', '张三');
INSERT INTO `t_order` VALUES ('14', '1', '11', '2019-04-27 00:09:22', '张三');
INSERT INTO `t_order` VALUES ('15', '1', '11', '2019-04-27 00:09:25', '张三');
INSERT INTO `t_order` VALUES ('16', '1', '11', '2019-04-27 00:09:35', '张三');
INSERT INTO `t_order` VALUES ('17', '1', '11', '2019-04-27 00:11:57', '张三');
INSERT INTO `t_order` VALUES ('18', '1', '11', '2019-04-27 00:12:05', '张三');
INSERT INTO `t_order` VALUES ('19', '1', '11', '2019-04-27 00:12:07', '张三');

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) NOT NULL,
  `u_password` varchar(100) NOT NULL,
  `u_phone_number` varchar(11) DEFAULT NULL COMMENT '用户注册手机号码，用于找回密码',
  `u_nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '昵称',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `uniq` (`u_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES ('8', '啊啊啊', '1234', '啊啊啊', '啊啊啊');
INSERT INTO `t_users` VALUES ('9', '123123', '123123', '11111111', '111111');
INSERT INTO `t_users` VALUES ('10', 'zhangsan', '123456', '16605172333', '张三');
INSERT INTO `t_users` VALUES ('11', 'zhang', '123456', '16605172333', '张三');
