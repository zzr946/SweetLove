/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : sweetlove

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2019-10-30 18:00:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` varchar(255) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `detailadd` varchar(255) DEFAULT NULL,
  `adduser` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `reserve1` varchar(255) DEFAULT NULL,
  `reserve2` varchar(255) DEFAULT NULL,
  `reserve3` varchar(255) DEFAULT NULL,
  `reserve4` int(255) DEFAULT NULL,
  `reserve5` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('7c7f7458-e609-4b0c-a9d7-c0c1b7c3e9a2', '479098e6-4fa2-40c1-9367-a3097028f44c', '湖北省武汉市江夏区武汉工程科技学院', '赵志然', '13545737054', '2', null, null, null, null, null);
INSERT INTO `address` VALUES ('8696b980-8bb3-4446-acd5-baa0e125af50', '479098e6-4fa2-40c1-9367-a3097028f44c', '湖北省宜昌市当阳市香榭水岸', '赵志然', '17607103656', '0', null, null, null, null, null);
INSERT INTO `address` VALUES ('f932529c-073c-4bd4-97f4-c60f1fa11d0c', '479098e6-4fa2-40c1-9367-a3097028f44c', '湖北省武汉市洪山区现代森林小镇', '赵志然', '17607103063', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(255) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `reserve1` varchar(255) DEFAULT NULL,
  `reserve2` varchar(255) DEFAULT NULL,
  `reserve3` varchar(255) DEFAULT NULL,
  `reserve4` int(255) DEFAULT NULL,
  `reserve5` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` varchar(255) NOT NULL,
  `gid` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `goodsphoto` varchar(255) DEFAULT NULL,
  `goodsname` varchar(255) DEFAULT NULL,
  `spce` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `total` double(255,0) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `reserve1` varchar(255) DEFAULT NULL,
  `reserve2` varchar(255) DEFAULT NULL,
  `reserve3` varchar(255) DEFAULT NULL,
  `reserve4` int(255) DEFAULT NULL,
  `reserve5` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('3711a653-b8c0-4763-af3c-fb7c37271311', '5dcc4f4e-6071-4578-a257-71f145eac05c', '479098e6-4fa2-40c1-9367-a3097028f44c', '6ce7e34c-f994-4613-aebe-bf007d9d28f1.png', '歌帝梵', '300g', '388', '2', '776', '1', null, null, null, null, null);
INSERT INTO `cart` VALUES ('66016f2b-277f-4eda-b2b3-972b01fbeb50', '282850fc-c89d-4acd-aac1-2054a6a23358', '479098e6-4fa2-40c1-9367-a3097028f44c', 'b31ee948-b39d-4ebe-82c7-1d5a7c959a48.jpg', '爱心小蛋糕', '500g', '289', '2', '578', '1', null, null, null, null, null);
INSERT INTO `cart` VALUES ('8512e7a0-9828-4047-95c1-be3aee1897c7', '9ffd11d9-4d98-452e-a61c-77f4c8b0b980', '479098e6-4fa2-40c1-9367-a3097028f44c', '1e9be175-6c8a-40e6-b952-08d4f72f743f.jpg', '少女的酥胸-爱心马卡龙', '458g', '324', '5', '1620', '1', null, null, null, null, null);
INSERT INTO `cart` VALUES ('ccae887a-71fe-4630-9466-f2255d2bcfa6', '78e7a678-3380-4cfa-a808-feaa968ab386', '479098e6-4fa2-40c1-9367-a3097028f44c', '01567cdc-eba5-44ad-b80f-ea85cdba168a.png', '伏格雷', '5个/200g', '99', '1', '99', '1', null, null, null, null, null);
INSERT INTO `cart` VALUES ('df100767-a6ac-44f5-9cce-df55208e7f78', '49cf2be0-9c07-4e32-baba-f8051e3b07c8', '479098e6-4fa2-40c1-9367-a3097028f44c', '05e7c23f-85ef-4958-ad2e-2753cdf3658a.jpg', 'Vivi Dolce', '1盒', '122', '1', '122', '1', null, null, null, null, null);
INSERT INTO `cart` VALUES ('e15c2ef9-53ae-4850-a43a-46697ec06a3f', '9ffd11d9-4d98-452e-a61c-77f4c8b0b980', '479098e6-4fa2-40c1-9367-a3097028f44c', '1e9be175-6c8a-40e6-b952-08d4f72f743f.jpg', '少女的酥胸-爱心马卡龙', '458g', '324', '5', '1620', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` varchar(255) NOT NULL,
  `catename` varchar(255) DEFAULT NULL,
  `cateinfo` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `reserve1` varchar(255) DEFAULT NULL,
  `reserve2` varchar(255) DEFAULT NULL,
  `reserve3` varchar(255) DEFAULT NULL,
  `reserve4` int(255) DEFAULT NULL,
  `reserve5` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品', '夏日良品', '0', null, null, null, null, null);
INSERT INTO `category` VALUES ('48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '饭后小憩', '0', null, null, null, null, null);
INSERT INTO `category` VALUES ('6a278ba5-069a-4d52-92c7-cff833640300', '爱之使者', '爱之使者', '0', null, null, null, null, null);
INSERT INTO `category` VALUES ('a1e7b62b-7cb1-42f2-8b78-4814c364e53f', '美味蛋糕', '美味蛋糕', '0', null, null, null, null, null);
INSERT INTO `category` VALUES ('ba29573c-2b92-494b-b634-8695d31d6c11', '养生系列', '养生系列', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` varchar(255) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `colltime` varchar(255) DEFAULT NULL,
  `gid` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `reserve1` varchar(255) DEFAULT NULL,
  `reserve2` varchar(255) DEFAULT NULL,
  `reserve3` varchar(255) DEFAULT NULL,
  `reserve4` int(255) DEFAULT NULL,
  `reserve5` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('7da4f5a5-12e4-4686-8180-9135ee8b4bb6', '479098e6-4fa2-40c1-9367-a3097028f44c', '2019-10-06 14:35:42', '6ee9655c-85e9-407c-95b9-90c9d023cba6', '0', null, null, null, null, null);
INSERT INTO `collect` VALUES ('92c94d1b-954d-49ef-9a89-8ba71f9158b8', '479098e6-4fa2-40c1-9367-a3097028f44c', '2019-10-06 14:08:44', '3010d51c-2162-444f-84b5-dc5e0819e9df', '0', null, null, null, null, null);
INSERT INTO `collect` VALUES ('bfe55459-905f-4c44-9a41-0b7fa8e5593e', '479098e6-4fa2-40c1-9367-a3097028f44c', '2019-10-06 14:33:46', '9ffd11d9-4d98-452e-a61c-77f4c8b0b980', '0', null, null, null, null, null);
INSERT INTO `collect` VALUES ('c272b7fe-d188-4d85-9e80-6def8c508e63', '479098e6-4fa2-40c1-9367-a3097028f44c', '2019-10-06 14:10:44', 'c5f50cbf-966a-4b51-88d9-2ccbc75907aa', '0', null, null, null, null, null);
INSERT INTO `collect` VALUES ('cbb4fac0-396f-4d10-92c1-3d0b7f54234c', '479098e6-4fa2-40c1-9367-a3097028f44c', '2019-10-06 14:05:44', 'c975969b-b158-4b78-ab45-9f0b27299991', '0', null, null, null, null, null);
INSERT INTO `collect` VALUES ('cbcc2f0d-8818-4d8a-a2fd-edd107974e7d', '479098e6-4fa2-40c1-9367-a3097028f44c', '2019-10-06 14:08:44', '02ebb1bd-82e4-4c0d-b910-e536b14efb3f', '0', null, null, null, null, null);
INSERT INTO `collect` VALUES ('f2b783ce-2828-4026-ad4e-ce46657fe94d', '479098e6-4fa2-40c1-9367-a3097028f44c', '2019-10-07 10:21:45', '78e7a678-3380-4cfa-a808-feaa968ab386', '0', null, null, null, null, null);
INSERT INTO `collect` VALUES ('f603baf8-c648-4d15-a960-83526fbc5a1b', '479098e6-4fa2-40c1-9367-a3097028f44c', '2019-10-06 14:09:44', '9322de79-36c1-4c8e-9391-7d0d4af9ea9f', '0', null, null, null, null, null);
INSERT INTO `collect` VALUES ('f98f0c76-08a9-4dc5-90e0-532a4e596ea6', '479098e6-4fa2-40c1-9367-a3097028f44c', '2019-10-06 14:03:44', 'b0d8543b-a098-4997-be40-fb1bef830017', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` varchar(255) NOT NULL,
  `goodsname` varchar(255) DEFAULT NULL,
  `cateid` varchar(255) DEFAULT NULL,
  `goodsinfo` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `sample1` varchar(255) DEFAULT NULL,
  `sample2` varchar(255) DEFAULT NULL,
  `sample3` varchar(255) DEFAULT NULL,
  `sample4` varchar(255) DEFAULT NULL,
  `sample5` varchar(255) DEFAULT NULL,
  `spce` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `reserve1` varchar(255) DEFAULT NULL,
  `reserve2` varchar(255) DEFAULT NULL,
  `reserve3` varchar(255) DEFAULT NULL,
  `reserve4` int(255) DEFAULT NULL,
  `reserve5` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('02ebb1bd-82e4-4c0d-b910-e536b14efb3f', '香酥新月小面包', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '55', 'c28b5b37-f901-41a1-97b5-2daa9b19c25f.jpg', 'c28b5b37-f901-41a1-97b5-2daa9b19c25f.jpg', 'c28b5b37-f901-41a1-97b5-2daa9b19c25f.jpg', 'c28b5b37-f901-41a1-97b5-2daa9b19c25f.jpg', 'c28b5b37-f901-41a1-97b5-2daa9b19c25f.jpg', '50g', '香酥新月小面包', 'c28b5b37-f901-41a1-97b5-2daa9b19c25f.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('0991b9bd-5e63-4604-bbca-8f6a8cc9cb12', '牛油泡芙', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '152', '42218998-b068-45f5-93ed-b02955daf8d6.jpg.jpg', '9ce3015e-67d3-40ab-a8fb-81c96b3670a1.jpg', '7356e688-195b-4cf1-ae65-137d3d00523d.jpg', 'c2c65484-e16a-4fb1-b793-d8181cf6640f.jpg', '9ce3015e-67d3-40ab-a8fb-81c96b3670a1.jpg', '300g', '泡芙泡芙泡芙', '9ce3015e-67d3-40ab-a8fb-81c96b3670a1.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('0b71092e-a882-4e6e-a75e-bb6359377bfc', '水果棒冰', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '23', '866660d1-2784-4b5d-9a5d-94df543734b4.jpg', '866660d1-2784-4b5d-9a5d-94df543734b4.jpg', '866660d1-2784-4b5d-9a5d-94df543734b4.jpg', '866660d1-2784-4b5d-9a5d-94df543734b4.jpg', '866660d1-2784-4b5d-9a5d-94df543734b4.jpg', '30g', '水果口味棒冰 水果水果水果水果', '866660d1-2784-4b5d-9a5d-94df543734b4.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('10180112-28e5-4f74-a2b1-1d51afde8204', '乌云红心冰淇淋', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品,冰淇淋', '68', 'a6e75b3b-4555-48d0-a8d5-061d7b62ead8.jpg', 'ec3e632e-80b7-435a-9dc0-5b48805d8a86.jpg', '3bcd4a7b-4271-4d96-80c4-9cc795fab12d.jpg', '6fae7e12-2d7b-4db9-a41f-18e02623041a.png', '4567feeb-a422-4b43-a850-701c75597d89.png', '1支', '之前流行的一款冰淇淋，可以说是很有意思的一款，冰淇淋和棉花糖的组合，听起来就是甜蜜的存在，微微甜甜的棉花糖和奶味十足的冰淇淋的搭配看似脑洞，其实真的蛮配的', 'a6e75b3b-4555-48d0-a8d5-061d7b62ead8.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('158d6d3c-ab6e-4317-a3f3-91931b7d81d1', '牛角包', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '30', 'fe8d4756-0c55-4862-916b-a830542d21f7.jpg', 'a0bb75aa-a45f-4e24-a46d-a443848eca56.jpg', '3f9f149e-b925-4947-beb8-e380188d4e9e.gif', 'e1043a74-30ac-447c-a7af-4e83497e15a4.jpg', '59aee256-4db7-40cb-a08c-34ee314910ac.jpg', '200g', '牛角包牛角包牛角包牛角包牛角包', '3f9f149e-b925-4947-beb8-e380188d4e9e.gif', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('15ae8c64-a63e-4b0f-938d-42f5fe0ceb68', '外交官方糕', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '55', 'fb5d1868-2424-4b62-a1b6-d9f1f3150abb.jpg', 'fb5d1868-2424-4b62-a1b6-d9f1f3150abb.jpg', 'fb5d1868-2424-4b62-a1b6-d9f1f3150abb.jpg', 'fb5d1868-2424-4b62-a1b6-d9f1f3150abb.jpg', 'fb5d1868-2424-4b62-a1b6-d9f1f3150abb.jpg', '55g', '外交官方糕', 'fb5d1868-2424-4b62-a1b6-d9f1f3150abb.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('16470681-6e9b-4d7b-a902-f31808a4ae79', '自然-生日祷告', 'a1e7b62b-7cb1-42f2-8b78-4814c364e53f', '美味蛋糕', '88', 'b2ea0036-307b-4b04-be64-04dff7153fac.jpg', 'b2ea0036-307b-4b04-be64-04dff7153fac.jpg', 'b2ea0036-307b-4b04-be64-04dff7153fac.jpg', 'b2ea0036-307b-4b04-be64-04dff7153fac.jpg', 'b2ea0036-307b-4b04-be64-04dff7153fac.jpg', '30g', '生日蛋糕', 'b2ea0036-307b-4b04-be64-04dff7153fac.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('1fcd343e-51a1-46b1-961a-e60348061e70', '奥利奥滋蛋仔', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '36', 'ba920a08-b017-44ce-8379-59ba038dce4e.jpg', 'ba920a08-b017-44ce-8379-59ba038dce4e.jpg', 'ba920a08-b017-44ce-8379-59ba038dce4e.jpg', 'ba920a08-b017-44ce-8379-59ba038dce4e.jpg', 'ba920a08-b017-44ce-8379-59ba038dce4e.jpg', '38g', '十二道锋味里的鸡蛋仔唤起了香港市民对快被遗忘的老香港美食的记忆，\r\n圆圆的鸡蛋仔可爱又纯净，鸡蛋和牛奶的搭配健康又美味。午后在家做些\r\n当做小零食是很不错的选择，而且自己做的绝对干净', 'ba920a08-b017-44ce-8379-59ba038dce4e.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('282850fc-c89d-4acd-aac1-2054a6a23358', '爱心小蛋糕', '6a278ba5-069a-4d52-92c7-cff833640300', '爱之使者，蛋糕', '289', 'b31ee948-b39d-4ebe-82c7-1d5a7c959a48.jpg', '81e58bb2-4170-43d9-a686-b2440ce37048.jpg', 'be03d7e6-b50c-40e0-8064-c591565e8398.jpg', 'afe5453d-33ce-47c6-9943-ab3c3f30cc9d.jpg', '81e58bb2-4170-43d9-a686-b2440ce37048.jpg', '500g', '小小的蛋糕，大大的情谊', '81e58bb2-4170-43d9-a686-b2440ce37048.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('3010d51c-2162-444f-84b5-dc5e0819e9df', '沙河蛋糕', 'a1e7b62b-7cb1-42f2-8b78-4814c364e53f', '美味蛋糕', '85', '380c5f33-23f7-4986-9e4b-78c6508033d0.jpg', '380c5f33-23f7-4986-9e4b-78c6508033d0.jpg', '380c5f33-23f7-4986-9e4b-78c6508033d0.jpg', '380c5f33-23f7-4986-9e4b-78c6508033d0.jpg', '380c5f33-23f7-4986-9e4b-78c6508033d0.jpg', '30g', '沙河蛋糕', '380c5f33-23f7-4986-9e4b-78c6508033d0.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('37f869f3-39ed-4898-9265-06147fb58219', '彩虹刨冰', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '35', 'f2edde71-906d-4e3a-b099-a00ce64f9726.jpg', 'f2edde71-906d-4e3a-b099-a00ce64f9726.jpg', 'f2edde71-906d-4e3a-b099-a00ce64f9726.jpg', 'f2edde71-906d-4e3a-b099-a00ce64f9726.jpg', 'f2edde71-906d-4e3a-b099-a00ce64f9726.jpg', '50g', '彩虹刨冰彩虹刨冰彩虹刨冰彩虹刨冰彩虹刨冰彩虹刨冰彩虹刨冰彩虹刨冰彩虹刨冰彩虹刨冰彩虹刨冰彩虹刨冰', 'f2edde71-906d-4e3a-b099-a00ce64f9726.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('49cf2be0-9c07-4e32-baba-f8051e3b07c8', 'Vivi Dolce', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品,冰淇淋', '122', '05e7c23f-85ef-4958-ad2e-2753cdf3658a.jpg', '05e7c23f-85ef-4958-ad2e-2753cdf3658a.jpg', '05e7c23f-85ef-4958-ad2e-2753cdf3658a.jpg', '05e7c23f-85ef-4958-ad2e-2753cdf3658a.jpg', '05e7c23f-85ef-4958-ad2e-2753cdf3658a.jpg', '1盒', '咱也不知道，咱也不敢说', '05e7c23f-85ef-4958-ad2e-2753cdf3658a.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('4a32aa34-e1d5-4f68-bd51-8123f0aedfe3', '中街1946', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品,网红冰淇淋', '244', '5841e4c4-e4af-45a0-948d-f7b9311c3013.png', '5841e4c4-e4af-45a0-948d-f7b9311c3013.png', '5841e4c4-e4af-45a0-948d-f7b9311c3013.png', '5841e4c4-e4af-45a0-948d-f7b9311c3013.png', '5841e4c4-e4af-45a0-948d-f7b9311c3013.png', '8支', '咱也不知道，咱也不敢说', '5841e4c4-e4af-45a0-948d-f7b9311c3013.png', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('4d685ce5-ba19-423e-b0cd-af6c452c6935', '木瓜西米捞', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '68', 'c33f880b-5d37-40a1-a8a6-66f3ee7b1284.jpg', 'c33f880b-5d37-40a1-a8a6-66f3ee7b1284.jpg', 'c33f880b-5d37-40a1-a8a6-66f3ee7b1284.jpg', 'c33f880b-5d37-40a1-a8a6-66f3ee7b1284.jpg', 'c33f880b-5d37-40a1-a8a6-66f3ee7b1284.jpg', '56g', '木瓜西米捞木瓜西米捞木瓜西米捞木瓜西米捞木瓜西米捞木瓜西米捞木瓜西米捞木瓜西米捞木瓜西米捞木瓜西米捞木瓜西米捞木瓜西米捞', 'c33f880b-5d37-40a1-a8a6-66f3ee7b1284.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('4db0a7d6-8d04-4eeb-aedc-10441122856f', '薰衣草冰淇淋', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '55', 'c6ccc45e-e955-4879-a365-ced38dcb9d29.jpg', 'c6ccc45e-e955-4879-a365-ced38dcb9d29.jpg', 'c6ccc45e-e955-4879-a365-ced38dcb9d29.jpg', 'c6ccc45e-e955-4879-a365-ced38dcb9d29.jpg', 'c6ccc45e-e955-4879-a365-ced38dcb9d29.jpg', '30g', '薰衣草薰衣草薰衣草薰衣草', 'c6ccc45e-e955-4879-a365-ced38dcb9d29.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('5c54ab7a-986e-4d2b-aa1e-da2dbe7a4453', '提拉米苏', 'a1e7b62b-7cb1-42f2-8b78-4814c364e53f', '美味蛋糕', '125', '3a6fcc3a-1c72-4c72-b733-29429f91fe37.jpg', '3a6fcc3a-1c72-4c72-b733-29429f91fe37.jpg', '3a6fcc3a-1c72-4c72-b733-29429f91fe37.jpg', '3a6fcc3a-1c72-4c72-b733-29429f91fe37.jpg', '3a6fcc3a-1c72-4c72-b733-29429f91fe37.jpg', '30g', '提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕提拉米苏蛋糕', '3a6fcc3a-1c72-4c72-b733-29429f91fe37.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('5dcc4f4e-6071-4578-a257-71f145eac05c', '歌帝梵', '6a278ba5-069a-4d52-92c7-cff833640300', '爱之使者，巧克力', '388', '6ce7e34c-f994-4613-aebe-bf007d9d28f1.png', '6ce7e34c-f994-4613-aebe-bf007d9d28f1.png', '6ce7e34c-f994-4613-aebe-bf007d9d28f1.png', '6ce7e34c-f994-4613-aebe-bf007d9d28f1.png', '6ce7e34c-f994-4613-aebe-bf007d9d28f1.png', '300g', '咱也不知道，咱也不敢说', '6ce7e34c-f994-4613-aebe-bf007d9d28f1.png', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('5deb3812-74d3-423e-bcba-8584df134ab0', '木材蛋糕', 'a1e7b62b-7cb1-42f2-8b78-4814c364e53f', '美味蛋糕', '122', '0db004cf-4450-4b3b-800c-5fb00e64cd1a.jpg', '0db004cf-4450-4b3b-800c-5fb00e64cd1a.jpg', '0db004cf-4450-4b3b-800c-5fb00e64cd1a.jpg', '0db004cf-4450-4b3b-800c-5fb00e64cd1a.jpg', '0db004cf-4450-4b3b-800c-5fb00e64cd1a.jpg', null, '木材蛋糕木材蛋糕木材蛋糕木材蛋糕木材蛋糕木材蛋糕木材蛋糕木材蛋糕木材蛋糕木材蛋糕木材蛋糕木材蛋糕木材蛋糕木材蛋糕', '0db004cf-4450-4b3b-800c-5fb00e64cd1a.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('68d1510f-4a46-4286-978c-e6e46d8c113c', '龟苓膏', 'ba29573c-2b92-494b-b634-8695d31d6c11', '养生系列', '45', 'c9d61384-b08d-4ed9-a94b-485c190dd770.jpg', 'c9d61384-b08d-4ed9-a94b-485c190dd770.jpg', 'c9d61384-b08d-4ed9-a94b-485c190dd770.jpg', 'c9d61384-b08d-4ed9-a94b-485c190dd770.jpg', 'c9d61384-b08d-4ed9-a94b-485c190dd770.jpg', '55g', '龟苓膏', 'c9d61384-b08d-4ed9-a94b-485c190dd770.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('69885349-ca45-49a5-8a63-5cbcc3128411', '榛子口味冰淇淋', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品,冰淇淋', '88', 'f90f5f32-4bb8-4da4-b7c9-b8b89309f198.jpg', 'f153f1e5-d80a-4101-94ae-2d65a7d3ad74.jpg', '8d23098b-1474-48b0-aa30-e2c6790a671f.jpg', '6efd38a4-ccdf-4d6a-86bf-20beff79b155.jpg', 'f90f5f32-4bb8-4da4-b7c9-b8b89309f198.jpg', '1支', '满满的榛子，..................................................................................................................................................', 'f90f5f32-4bb8-4da4-b7c9-b8b89309f198.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('6ee9655c-85e9-407c-95b9-90c9d023cba6', '拿破仑千层酥', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '55', '96f948eb-49e0-4428-a2c3-1aaffddd21fa.jpg', 'ff1f4428-fafb-4980-bf7a-42292615a13c.jpg', '6fea98d3-bbd4-449e-b5c7-cfdfeb667962.jpg', '6fea98d3-bbd4-449e-b5c7-cfdfeb667962.jpg', '6fea98d3-bbd4-449e-b5c7-cfdfeb667962.jpg', '50g', '“拿破仑蛋糕”法文名为Mille-feuille，即有一千层酥皮的意思，所以它又被称为千层酥。拿破仑蛋糕造价不菲，不但使用了繁杂的起酥工艺，而且酥皮之间的夹层丰富，不仅有鲜奶油，还有吉士酱。', '6fea98d3-bbd4-449e-b5c7-cfdfeb667962.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('732d0717-1f7d-40e0-9305-af45fad85f6e', '杏仁糖', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '52', '2ee1f02f-4d4b-4cb9-b23c-2f4865c147c6.jpg', '2ee1f02f-4d4b-4cb9-b23c-2f4865c147c6.jpg', '2ee1f02f-4d4b-4cb9-b23c-2f4865c147c6.jpg', '2ee1f02f-4d4b-4cb9-b23c-2f4865c147c6.jpg', '2ee1f02f-4d4b-4cb9-b23c-2f4865c147c6.jpg', '30g', '杏仁糖杏仁糖杏仁糖杏仁糖杏仁糖杏仁糖杏仁糖杏仁糖杏仁糖杏仁糖杏仁糖杏仁糖杏仁糖', '2ee1f02f-4d4b-4cb9-b23c-2f4865c147c6.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('78e7a678-3380-4cfa-a808-feaa968ab386', '伏格雷', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品，冰淇淋', '99', '01567cdc-eba5-44ad-b80f-ea85cdba168a.png', '01567cdc-eba5-44ad-b80f-ea85cdba168a.png', '01567cdc-eba5-44ad-b80f-ea85cdba168a.png', '01567cdc-eba5-44ad-b80f-ea85cdba168a.png', '01567cdc-eba5-44ad-b80f-ea85cdba168a.png', '5个/200g', '咱也不知道，咱也不敢说', '01567cdc-eba5-44ad-b80f-ea85cdba168a.png', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('798bc569-f3f7-4f0e-9786-89c692f1ca7a', '西瓜西米捞', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '54', '2ddcd922-da35-4483-a736-0866e6be436f.jpg', '2ddcd922-da35-4483-a736-0866e6be436f.jpg', '2ddcd922-da35-4483-a736-0866e6be436f.jpg', '2ddcd922-da35-4483-a736-0866e6be436f.jpg', '2ddcd922-da35-4483-a736-0866e6be436f.jpg', '62g', '西瓜西米捞西瓜西米捞西瓜西米捞西瓜西米捞西瓜西米捞西瓜西米捞西瓜西米捞西瓜西米捞西瓜西米捞西瓜西米捞西瓜西米捞西瓜西米捞西瓜西米捞西瓜西米捞', '2ddcd922-da35-4483-a736-0866e6be436f.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('7d4a6e32-3e6b-487a-875f-6673e0868b5d', '泡芙', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '66', '1f9d8e17-5955-459b-a2e0-89ba74be3a3e.jpg', 'aa718737-d03c-4f4e-92c4-20c99a67d47a.jpg', 'c1d55614-e124-4283-bda9-cf3ed649193f.jpg', 'c93dfe30-d500-4d62-80e3-b48cfbdcb40c.jpg', 'e8bf5193-970b-4f55-9a37-f49a488194fb.jpg', '100g', '泡芙泡芙泡芙', '84bc6142-cb17-4fb9-bf98-a4f7cac8cb8e.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('8c327c77-77b5-4b7c-abd5-ff3b81449f0c', '芒果西米捞', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '36', '123addc0-516a-4dc1-92e8-965d4fd4804a.jpg', '123addc0-516a-4dc1-92e8-965d4fd4804a.jpg', '123addc0-516a-4dc1-92e8-965d4fd4804a.jpg', '123addc0-516a-4dc1-92e8-965d4fd4804a.jpg', '123addc0-516a-4dc1-92e8-965d4fd4804a.jpg', '68g', '芒果西米捞芒果西米捞芒果西米捞芒果西米捞芒果西米捞芒果西米捞芒果西米捞芒果西米捞芒果西米捞芒果西米捞芒果西米捞芒果西米捞芒果西米捞', '123addc0-516a-4dc1-92e8-965d4fd4804a.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('9322de79-36c1-4c8e-9391-7d0d4af9ea9f', '苹果卷', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '45', 'e45a3a29-9f87-4bfb-affa-f549a36de208.jpg', 'e45a3a29-9f87-4bfb-affa-f549a36de208.jpg', 'e45a3a29-9f87-4bfb-affa-f549a36de208.jpg', 'e45a3a29-9f87-4bfb-affa-f549a36de208.jpg', 'e45a3a29-9f87-4bfb-affa-f549a36de208.jpg', '20g', '苹果卷苹果卷苹果卷苹果卷苹果卷苹果卷苹果卷苹果卷苹果卷苹果卷苹果卷', 'e45a3a29-9f87-4bfb-affa-f549a36de208.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('95c5efc7-0470-441a-91b8-5fa9572eed2e', '可颂甜甜圈', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '32', '800f11b5-6393-4b0b-8249-17f326b49511.jpg', '800f11b5-6393-4b0b-8249-17f326b49511.jpg', '800f11b5-6393-4b0b-8249-17f326b49511.jpg', '800f11b5-6393-4b0b-8249-17f326b49511.jpg', '800f11b5-6393-4b0b-8249-17f326b49511.jpg', '55g', '可颂甜甜圈可颂甜甜圈可颂甜甜圈可颂甜甜圈可颂甜甜圈可颂甜甜圈可颂甜甜圈可颂甜甜圈可颂甜甜圈可颂甜甜圈可颂甜甜圈可颂甜甜圈', '800f11b5-6393-4b0b-8249-17f326b49511.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('9957ea87-8066-4cc2-a351-944edc2bd96d', '创意-生日蛋糕', 'a1e7b62b-7cb1-42f2-8b78-4814c364e53f', '美味蛋糕', '88', 'f0c6f1a3-5d39-41c8-bfc9-a0de5eadb2f7.jpg', 'f0c6f1a3-5d39-41c8-bfc9-a0de5eadb2f7.jpg', 'f0c6f1a3-5d39-41c8-bfc9-a0de5eadb2f7.jpg', 'f0c6f1a3-5d39-41c8-bfc9-a0de5eadb2f7.jpg', 'f0c6f1a3-5d39-41c8-bfc9-a0de5eadb2f7.jpg', '30g', '生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕', 'f0c6f1a3-5d39-41c8-bfc9-a0de5eadb2f7.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('9ffd11d9-4d98-452e-a61c-77f4c8b0b980', '少女的酥胸-爱心马卡龙', '6a278ba5-069a-4d52-92c7-cff833640300', '爱之使者，蛋糕', '324', '1e9be175-6c8a-40e6-b952-08d4f72f743f.jpg', 'b22d22de-046d-4589-9a7e-735da4d0612c.jpg', 'd71eb1c5-6408-4fe5-ab2a-b2ecdbfa7561.jpg', '8c3be7b9-b54a-4b92-a490-c18ccad0b75a.jpg', '45bff1a0-d328-4891-adbe-de2cb86263c3.jpg', '458g', '法国巴黎著名甜点马卡龙，被称为“少女的酥胸”，它是用杏仁粉、糖和蛋白调制而成的，它表面光滑、泛着光泽，通常都是两块酥脆的饼干，中间夹着水果酱或者是奶油，吃起来外酥里软，味道有着少女般甜蜜的味道。据说这马卡龙一开始是一些素食修女制作而成的，后来慢慢的改良，就变成现在色彩很多样。', '45bff1a0-d328-4891-adbe-de2cb86263c3.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('b0d8543b-a098-4997-be40-fb1bef830017', '慕斯蛋糕', 'a1e7b62b-7cb1-42f2-8b78-4814c364e53f', '美味蛋糕', '68', 'eefa89e7-3aef-43c8-a661-cb3469b7f1fe.jpg', 'eefa89e7-3aef-43c8-a661-cb3469b7f1fe.jpg', 'eefa89e7-3aef-43c8-a661-cb3469b7f1fe.jpg', 'eefa89e7-3aef-43c8-a661-cb3469b7f1fe.jpg', 'eefa89e7-3aef-43c8-a661-cb3469b7f1fe.jpg', '50g', '慕斯的英文是mousse，是一种奶冻式的甜点，可以直接吃或做蛋糕夹层，通常是加入奶油与凝固剂来造成浓稠冻状的效果。慕斯是从法语音译过来的。慕斯蛋糕最早出现在美食之都法国巴黎，最初大师们在奶油中加入起稳定作用和改善结构，口感和风味的各种辅料，冷冻后食用其味无穷，成为蛋糕中的极品。慕斯与布丁一样属于甜点的一种，其性质较布丁更柔软，入口即化。', 'eefa89e7-3aef-43c8-a661-cb3469b7f1fe.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('b193a6c7-6d80-47db-9b08-24d910473a21', '马卡龙滋蛋仔', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '36', 'cd2d6d48-e922-45e9-9c95-2ae33e67c9ec.jpg', 'cd2d6d48-e922-45e9-9c95-2ae33e67c9ec.jpg', 'cd2d6d48-e922-45e9-9c95-2ae33e67c9ec.jpg', 'cd2d6d48-e922-45e9-9c95-2ae33e67c9ec.jpg', 'cd2d6d48-e922-45e9-9c95-2ae33e67c9ec.jpg', '36g', '十二道锋味里的鸡蛋仔唤起了香港市民对快被遗忘的老香港美食的记忆，', 'cd2d6d48-e922-45e9-9c95-2ae33e67c9ec.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('b52aeaef-baac-4e24-8a9c-55b39c67a6ed', '优雅-生日蛋糕', 'a1e7b62b-7cb1-42f2-8b78-4814c364e53f', '美味蛋糕', '88', '30e7370e-4ad6-4c8d-aae3-50a6945d3239.jpg', '30e7370e-4ad6-4c8d-aae3-50a6945d3239.jpg', '30e7370e-4ad6-4c8d-aae3-50a6945d3239.jpg', '30e7370e-4ad6-4c8d-aae3-50a6945d3239.jpg', '30e7370e-4ad6-4c8d-aae3-50a6945d3239.jpg', '30g', '生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕生日蛋糕', '30e7370e-4ad6-4c8d-aae3-50a6945d3239.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('bdcbbf53-5293-4b1c-bd3b-0253c79b67e4', '童趣-生日蛋糕', 'a1e7b62b-7cb1-42f2-8b78-4814c364e53f', '美味蛋糕', '88', '22c804ce-f5cb-4699-a666-d492c23e848d.jpg', '22c804ce-f5cb-4699-a666-d492c23e848d.jpg', '22c804ce-f5cb-4699-a666-d492c23e848d.jpg', '22c804ce-f5cb-4699-a666-d492c23e848d.jpg', '22c804ce-f5cb-4699-a666-d492c23e848d.jpg', '30g', '生日蛋糕', '22c804ce-f5cb-4699-a666-d492c23e848d.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('c5f50cbf-966a-4b51-88d9-2ccbc75907aa', '皇家薄酥糕', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '56', '3a4a9b1b-afb2-4534-842d-997e090159da.jpg', '3a4a9b1b-afb2-4534-842d-997e090159da.jpg', '3a4a9b1b-afb2-4534-842d-997e090159da.jpg', '3a4a9b1b-afb2-4534-842d-997e090159da.jpg', '3a4a9b1b-afb2-4534-842d-997e090159da.jpg', '35g', '皇家薄酥糕皇家薄酥糕皇家薄酥糕皇家薄酥糕皇家薄酥糕皇家薄酥糕皇家薄酥糕皇家薄酥糕皇家薄酥糕皇家薄酥糕皇家薄酥糕', '3a4a9b1b-afb2-4534-842d-997e090159da.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('c8fb17c6-4913-4ade-801f-a3482f79feb8', '坚果曲奇', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '288', '25e1976f-133f-4379-a5be-fee4f802f2d6.jpg', 'efbff035-658b-4ed4-9c39-6649d6fbdad0.jpg', 'a47aa114-d763-4663-a713-d6df5eb30bcd.jpg', '95165341-80cd-4956-912b-db616e006962.jpg', '2c8cccb9-cf4f-4430-9e85-379b9a388e9a.jpg', '200g', '曲奇曲奇曲奇曲奇曲奇曲奇曲奇曲奇曲奇取景器曲奇', '95165341-80cd-4956-912b-db616e006962.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('c975969b-b158-4b78-ab45-9f0b27299991', '巧克力蛋糕-巧克力歌剧院', 'a1e7b62b-7cb1-42f2-8b78-4814c364e53f', '美味蛋糕', '55', '82df5fa0-d05f-48f3-8857-5fc5acfb76f5.jpg', '82df5fa0-d05f-48f3-8857-5fc5acfb76f5.jpg', '82df5fa0-d05f-48f3-8857-5fc5acfb76f5.jpg', '82df5fa0-d05f-48f3-8857-5fc5acfb76f5.jpg', '82df5fa0-d05f-48f3-8857-5fc5acfb76f5.jpg', '68g', '巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力巧克力', '82df5fa0-d05f-48f3-8857-5fc5acfb76f5.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('ca3ba7bb-8003-40a7-bbde-b9913e526801', '树莓棒冰', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '13', '79a70726-ad9d-4217-90ab-4f0b554356f0.jpg', '79a70726-ad9d-4217-90ab-4f0b554356f0.jpg', '79a70726-ad9d-4217-90ab-4f0b554356f0.jpg', '79a70726-ad9d-4217-90ab-4f0b554356f0.jpg', '79a70726-ad9d-4217-90ab-4f0b554356f0.jpg', '60g', '树莓树莓树莓树莓树莓', '79a70726-ad9d-4217-90ab-4f0b554356f0.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('ca9125ed-3069-4825-918d-db18f9f765ef', '红豆山药糕', 'ba29573c-2b92-494b-b634-8695d31d6c11', '养生系列', '76', 'b563ecad-09dd-4b96-a1eb-d4d0a2f35586.jpg', 'b563ecad-09dd-4b96-a1eb-d4d0a2f35586.jpg', 'b563ecad-09dd-4b96-a1eb-d4d0a2f35586.jpg', 'b563ecad-09dd-4b96-a1eb-d4d0a2f35586.jpg', 'b563ecad-09dd-4b96-a1eb-d4d0a2f35586.jpg', '60g', '红豆配山药，你从未见过的全新搭配', 'b563ecad-09dd-4b96-a1eb-d4d0a2f35586.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('cca5c4ea-1074-4003-b8d7-52ae079a8609', '西柚西米捞', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '65', '4bb065c1-38d7-4c3b-8564-9e77cabe65c6.jpg', '4bb065c1-38d7-4c3b-8564-9e77cabe65c6.jpg', '4bb065c1-38d7-4c3b-8564-9e77cabe65c6.jpg', '4bb065c1-38d7-4c3b-8564-9e77cabe65c6.jpg', '4bb065c1-38d7-4c3b-8564-9e77cabe65c6.jpg', '35g', '西柚西米捞西柚西米捞西柚西米捞西柚西米捞西柚西米捞西柚西米捞西柚西米捞西柚西米捞西柚西米捞西柚西米捞西柚西米捞西柚西米捞', '4bb065c1-38d7-4c3b-8564-9e77cabe65c6.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('d46c02fb-daf4-4cb0-ac57-6cba3bfec365', '抹茶摩提', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '60', '6a36d1ed-99fe-495f-8b97-2cb380521ca3.jpg', 'ee8aae9e-fa74-4c5e-8b1a-0368c0a4d8ef.jpg.jpg', '4650f34c-9fa2-40f6-852c-7cb3275100a0.jpg', '07f9d557-fd67-46dd-8bf6-d47016098493.jpg.jpg', 'ee8aae9e-fa74-4c5e-8b1a-0368c0a4d8ef.jpg.jpg', '60g', '摩提摩提摩提摩提摩提摩提摩提摩提摩提摩提摩提摩提摩提摩提摩提', '4650f34c-9fa2-40f6-852c-7cb3275100a0.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('d51069a4-6224-4efa-8228-362cbe48f93c', '糖水蛋糕', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '36', '48d2082f-ca2d-4602-8a3d-a672fe698ed1.jpg', '48d2082f-ca2d-4602-8a3d-a672fe698ed1.jpg', '48d2082f-ca2d-4602-8a3d-a672fe698ed1.jpg', '48d2082f-ca2d-4602-8a3d-a672fe698ed1.jpg', '48d2082f-ca2d-4602-8a3d-a672fe698ed1.jpg', '68g', '糖水蛋糕糖水蛋糕糖水蛋糕糖水蛋糕糖水蛋糕糖水蛋糕糖水蛋糕糖水蛋糕糖水蛋糕糖水蛋糕糖水蛋糕糖水蛋糕', '48d2082f-ca2d-4602-8a3d-a672fe698ed1.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('d7486f5d-f59b-4088-b547-8250bc2580b0', '星空棒棒糖', '6a278ba5-069a-4d52-92c7-cff833640300', '爱之使者，糖', '154', '075b53bf-e1dc-4309-a299-9f176255148e.jpg', '430721d7-7178-4345-a0da-8ccd851fd76b.jpg', '943ca46c-d9be-454d-a857-d43b72ee3a83.jpg', '433dbb81-a6c7-4961-8b1b-a2743ec1b426.jpg', 'a089e3c1-c715-4828-bd8e-db6a85cb823d.jpg', '100g', '凝望星空，星空也在凝望你', '943ca46c-d9be-454d-a857-d43b72ee3a83.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('d7a697bf-b3b1-4923-a4b6-c280232e424e', '千层酥', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '55', '47fb0c9f-24e0-4658-9db5-69f20d8514b4.jpg', '47fb0c9f-24e0-4658-9db5-69f20d8514b4.jpg', '47fb0c9f-24e0-4658-9db5-69f20d8514b4.jpg', '47fb0c9f-24e0-4658-9db5-69f20d8514b4.jpg', '47fb0c9f-24e0-4658-9db5-69f20d8514b4.jpg', '30g', '千层酥千层酥千层酥千层酥千层酥千层酥千层酥千层酥千层酥千层酥千层酥千层酥', '47fb0c9f-24e0-4658-9db5-69f20d8514b4.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('d9f2a6d6-6686-43ac-98fe-cd7d3e82a7f0', '千层蛋糕', 'a1e7b62b-7cb1-42f2-8b78-4814c364e53f', '美味蛋糕', '45', 'fd279421-e1e6-46b1-bdbb-073ffeb58749.jpg', 'fd279421-e1e6-46b1-bdbb-073ffeb58749.jpg', 'fd279421-e1e6-46b1-bdbb-073ffeb58749.jpg', 'fd279421-e1e6-46b1-bdbb-073ffeb58749.jpg', 'fd279421-e1e6-46b1-bdbb-073ffeb58749.jpg', '65g', '千层蛋糕千层蛋糕千层蛋糕千层蛋糕千层蛋糕千层蛋糕千层蛋糕千层蛋糕千层蛋糕千层蛋糕', 'fd279421-e1e6-46b1-bdbb-073ffeb58749.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('e0950cef-8f0f-4817-905f-7c41b1af4277', '柠檬派', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '52', '96f48cb7-7b92-4b96-8e82-0f00c8d79b7b.jpg', '96f48cb7-7b92-4b96-8e82-0f00c8d79b7b.jpg', '96f48cb7-7b92-4b96-8e82-0f00c8d79b7b.jpg', '96f48cb7-7b92-4b96-8e82-0f00c8d79b7b.jpg', '96f48cb7-7b92-4b96-8e82-0f00c8d79b7b.jpg', '35g', '柠檬派柠檬派柠檬派柠檬派柠檬派柠檬派柠檬派柠檬派柠檬派柠檬派', '96f48cb7-7b92-4b96-8e82-0f00c8d79b7b.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('e0d0858c-7249-4bf4-b5d7-1844a44bd0c6', '冰淇淋滋蛋仔', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '36', 'be9b171a-e409-49dc-b501-85e2e645d06d.jpg', 'be9b171a-e409-49dc-b501-85e2e645d06d.jpg', 'be9b171a-e409-49dc-b501-85e2e645d06d.jpg', 'be9b171a-e409-49dc-b501-85e2e645d06d.jpg', 'be9b171a-e409-49dc-b501-85e2e645d06d.jpg', '25g', '十二道锋味里的鸡蛋仔唤起了香港市民对快被遗忘的老香港美食的记忆，\r\n圆圆的鸡蛋仔可爱又纯净，鸡蛋和牛奶的搭配健康又美味。午后在家做些\r\n当做小零食是很不错的选择，而且自己做的绝对干净', 'be9b171a-e409-49dc-b501-85e2e645d06d.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('e5b75ffc-ba54-43f3-9c50-58c7779753f3', '蜜瓜西米捞', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '35', '741e31c4-18fe-4751-95ab-006c2621b147.jpg', '741e31c4-18fe-4751-95ab-006c2621b147.jpg', '741e31c4-18fe-4751-95ab-006c2621b147.jpg', '741e31c4-18fe-4751-95ab-006c2621b147.jpg', '741e31c4-18fe-4751-95ab-006c2621b147.jpg', '34g', '蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞蜜瓜西米捞', '741e31c4-18fe-4751-95ab-006c2621b147.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('e75f6d50-4a01-41a0-bd2e-5717169a0c1e', '芒果冰淇淋', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '63', 'bc3769dc-1af3-491c-8285-8afa0f91ea1c.jpg', 'bc3769dc-1af3-491c-8285-8afa0f91ea1c.jpg', 'bc3769dc-1af3-491c-8285-8afa0f91ea1c.jpg', 'bc3769dc-1af3-491c-8285-8afa0f91ea1c.jpg', 'bc3769dc-1af3-491c-8285-8afa0f91ea1c.jpg', '30g', '芒果芒果芒果芒果芒果芒果芒果', 'bc3769dc-1af3-491c-8285-8afa0f91ea1c.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('eedc4d15-3e7c-44c2-8dd4-5536cf65c86b', '哈根达斯-巧克力冰淇淋', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '68', '8215456d-1e92-47f8-890e-294dbf25b070.jpg', '8215456d-1e92-47f8-890e-294dbf25b070.jpg', '8215456d-1e92-47f8-890e-294dbf25b070.jpg', '8215456d-1e92-47f8-890e-294dbf25b070.jpg', '8215456d-1e92-47f8-890e-294dbf25b070.jpg', '36g', '哈根达斯巧克力口味冰淇淋', '8215456d-1e92-47f8-890e-294dbf25b070.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('f19a69a6-270f-4291-8250-c7ea95327038', '芒果班戟', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '255', '92cc5f75-cb2c-49b8-9c4a-843397885391.jpg', '700bfd04-8fb4-45cc-835b-d5c8bdbcf889.jpg', '6dacb684-012b-48a5-beb1-fc380048e906.jpg', '88e1b1ca-7b8b-4da5-894e-bf379dcb1551.jpg', '78458ddf-7e72-489a-a171-1e9b8a984580.jpg', '500g', '芒果芒果芒果', '69cc0bf1-6d53-4611-baec-aa7808fad714.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('f20e0482-6d72-4ca7-b6b9-2b1b0cf4d771', '葡式蛋挞', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '88', 'dc81c3f3-e7bf-4cf2-908a-92fcf3af2fe0.jpg', '7a6c3779-5dfa-44c0-ad75-e78a162b1981.jpg', '2bd21d3b-8291-46ab-9ebc-b8c8f6217f03.jpg', 'cd771b01-034f-4634-a9a3-fc64a77b7ecf.jpg', '38b6cef1-1c65-4e5f-878a-7f59b61e1c2b.jpg', '3个', '蛋挞蛋挞蛋挞蛋挞蛋挞蛋挞', '2bd21d3b-8291-46ab-9ebc-b8c8f6217f03.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('f5ecc9ca-1b5e-439c-934d-bf8968d19e23', '酸奶滋蛋仔', '48dfeeed-e931-464a-a7e6-7b92caa18c85', '饭后小憩', '36', '7cc01343-58fe-4a35-b92d-81651c3140fb.jpg', '7cc01343-58fe-4a35-b92d-81651c3140fb.jpg', '7cc01343-58fe-4a35-b92d-81651c3140fb.jpg', '7cc01343-58fe-4a35-b92d-81651c3140fb.jpg', '7cc01343-58fe-4a35-b92d-81651c3140fb.jpg', '36g', '十二道锋味里的鸡蛋仔唤起了香港市民对快被遗忘的老香港美食的记忆，\r\n圆圆的鸡蛋仔可爱又纯净，鸡蛋和牛奶的搭配健康又美味。午后在家做些\r\n当做小零食是很不错的选择，而且自己做的绝对干净', '7cc01343-58fe-4a35-b92d-81651c3140fb.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('f6cc20c8-8462-439e-b77b-862ffcfdb36f', '火烧香蕉船冰淇淋', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '58', 'ae9e1ea5-4b39-4f21-9454-e99e5468c8ba.jpg', 'ae9e1ea5-4b39-4f21-9454-e99e5468c8ba.jpg', 'ae9e1ea5-4b39-4f21-9454-e99e5468c8ba.jpg', 'ae9e1ea5-4b39-4f21-9454-e99e5468c8ba.jpg', 'ae9e1ea5-4b39-4f21-9454-e99e5468c8ba.jpg', '53g', '火烧香蕉船冰淇淋火烧香蕉船冰淇淋火烧香蕉船冰淇淋火烧香蕉船冰淇淋火烧香蕉船冰淇淋火烧香蕉船冰淇淋火烧香蕉船冰淇淋火烧香蕉船冰淇淋火烧香蕉船冰淇淋火烧香蕉船冰淇淋火烧香蕉船冰淇淋火烧香蕉船冰淇淋', 'ae9e1ea5-4b39-4f21-9454-e99e5468c8ba.jpg', '0', null, null, null, null, null);
INSERT INTO `goods` VALUES ('f8d9eff5-db8d-48e9-adad-38f0331fe291', '椰汁西米捞', '46633a21-a58a-49cd-8d99-2f2fbad258bf', '夏日良品 冰淇淋，棒冰', '35', '8a742d48-1d2d-4dc3-926a-996deb7e4e8c.jpg', '8a742d48-1d2d-4dc3-926a-996deb7e4e8c.jpg', '8a742d48-1d2d-4dc3-926a-996deb7e4e8c.jpg', '8a742d48-1d2d-4dc3-926a-996deb7e4e8c.jpg', '8a742d48-1d2d-4dc3-926a-996deb7e4e8c.jpg', '35g', '椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞椰汁西米捞', '8a742d48-1d2d-4dc3-926a-996deb7e4e8c.jpg', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(255) NOT NULL,
  `ordernumber` varchar(255) DEFAULT NULL,
  `ordertime` varchar(255) DEFAULT NULL,
  `gid` varchar(255) DEFAULT NULL,
  `goodsnumber` int(11) DEFAULT NULL,
  `total` double(255,0) DEFAULT NULL,
  `addid` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `reserve1` varchar(255) DEFAULT NULL,
  `reserve2` varchar(255) DEFAULT NULL,
  `reserve3` varchar(255) DEFAULT NULL,
  `reserve4` int(255) DEFAULT NULL,
  `reserve5` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('11b9b516-c63a-40a3-81a6-f78c233aec8e', '3232044274', '2019-10-08 09:53', '5dcc4f4e-6071-4578-a257-71f145eac05c', '1', '388', '7c7f7458-e609-4b0c-a9d7-c0c1b7c3e9a2', '5', '479098e6-4fa2-40c1-9367-a3097028f44c', null, null, null, null);
INSERT INTO `orders` VALUES ('415ca5d4-9759-4faf-81bc-da0433f34583', '8501892005', '2019-10-08 13:53', '9ffd11d9-4d98-452e-a61c-77f4c8b0b980', '1', '324', '7c7f7458-e609-4b0c-a9d7-c0c1b7c3e9a2', '5', '479098e6-4fa2-40c1-9367-a3097028f44c', null, null, null, null);
INSERT INTO `orders` VALUES ('950b9ed6-2eb9-41ec-96b8-1f443aacfc7c', '3588055982', '2019-10-10 19:03', '9ffd11d9-4d98-452e-a61c-77f4c8b0b980', '5', '1620', '7c7f7458-e609-4b0c-a9d7-c0c1b7c3e9a2', '5', '479098e6-4fa2-40c1-9367-a3097028f44c', null, null, null, null);
INSERT INTO `orders` VALUES ('988736cd-5de5-431e-b294-65f771cc2aa9', '0989416676', '2019-10-08 09:53', '282850fc-c89d-4acd-aac1-2054a6a23358', '2', '578', '7c7f7458-e609-4b0c-a9d7-c0c1b7c3e9a2', '2', '479098e6-4fa2-40c1-9367-a3097028f44c', null, null, null, null);
INSERT INTO `orders` VALUES ('d42818cc-376f-477c-b05e-967dd2d95122', '0627043013', '2019-10-08 13:53', '49cf2be0-9c07-4e32-baba-f8051e3b07c8', '1', '122', '7c7f7458-e609-4b0c-a9d7-c0c1b7c3e9a2', '4', '479098e6-4fa2-40c1-9367-a3097028f44c', null, null, null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `reserve1` varchar(255) DEFAULT NULL,
  `reserve2` varchar(255) DEFAULT NULL,
  `reserve3` varchar(255) DEFAULT NULL,
  `reserve4` int(255) DEFAULT NULL,
  `reserve5` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('479098e6-4fa2-40c1-9367-a3097028f44c', null, '96E79218965EB72C92A549DD5A330112', 'e822dbc2-cc1c-4e43-87b3-e82b3c34be32.jpg', '燃烧的大白菜', '男', '17607103063', '0', null, null, null, null, null);
