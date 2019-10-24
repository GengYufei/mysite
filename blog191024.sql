/*
 Navicat Premium Data Transfer

 Source Server         : blog
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 24/10/2019 08:25:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add blog', 7, 'add_blog');
INSERT INTO `auth_permission` VALUES (20, 'Can change blog', 7, 'change_blog');
INSERT INTO `auth_permission` VALUES (21, 'Can delete blog', 7, 'delete_blog');
INSERT INTO `auth_permission` VALUES (22, 'Can add blog type', 8, 'add_blogtype');
INSERT INTO `auth_permission` VALUES (23, 'Can change blog type', 8, 'change_blogtype');
INSERT INTO `auth_permission` VALUES (24, 'Can delete blog type', 8, 'delete_blogtype');
INSERT INTO `auth_permission` VALUES (25, 'Can add read num', 9, 'add_readnum');
INSERT INTO `auth_permission` VALUES (26, 'Can change read num', 9, 'change_readnum');
INSERT INTO `auth_permission` VALUES (27, 'Can delete read num', 9, 'delete_readnum');
INSERT INTO `auth_permission` VALUES (28, 'Can add read num', 10, 'add_readnum');
INSERT INTO `auth_permission` VALUES (29, 'Can change read num', 10, 'change_readnum');
INSERT INTO `auth_permission` VALUES (30, 'Can delete read num', 10, 'delete_readnum');
INSERT INTO `auth_permission` VALUES (31, 'Can add read detail', 11, 'add_readdetail');
INSERT INTO `auth_permission` VALUES (32, 'Can change read detail', 11, 'change_readdetail');
INSERT INTO `auth_permission` VALUES (33, 'Can delete read detail', 11, 'delete_readdetail');
INSERT INTO `auth_permission` VALUES (34, 'Can add comment', 12, 'add_comment');
INSERT INTO `auth_permission` VALUES (35, 'Can change comment', 12, 'change_comment');
INSERT INTO `auth_permission` VALUES (36, 'Can delete comment', 12, 'delete_comment');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$100000$SEbJs7YD2Oku$rgMwq4ZdFZYhVC2QqcZf10YMUjI7vXKhmWA9/CT5gEY=', '2019-10-22 07:02:45.525772', 1, 'gengyufei', '', '', '15801112767@163.com', 1, 1, '2019-09-24 08:02:14.552404');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_blog
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog`;
CREATE TABLE `blog_blog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_updated_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `blog_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_blog_author_id_8791af69_fk_auth_user_id`(`author_id`) USING BTREE,
  INDEX `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id`(`blog_type_id`) USING BTREE,
  CONSTRAINT `blog_blog_author_id_8791af69_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_blogtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_blog
-- ----------------------------
INSERT INTO `blog_blog` VALUES (3, '长内容的博客', '多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路\r\n多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路多久啊拉沟咖喱块蛋糕价格耿我问过杰拉德深加工爱国垃圾袋卡死了感觉  爱神的箭该更换高daklgjaoierqw大解放路', '2019-09-24 12:50:33.707963', '2019-09-24 12:50:33.707963', 1, 2);
INSERT INTO `blog_blog` VALUES (4, '随笔2', '1234694发到个人去啊十多个群若国话', '2019-09-24 13:27:34.013569', '2019-09-24 13:27:34.013569', 1, 2);
INSERT INTO `blog_blog` VALUES (5, 'Django', '大帅哥去奥格Django', '2019-09-24 13:27:51.066071', '2019-09-24 13:27:51.066071', 1, 1);
INSERT INTO `blog_blog` VALUES (6, 'shell下第一篇', '>>>>>>>>>xxxxxxxxxxxxxxx', '2019-09-26 00:38:44.951996', '2019-09-26 00:38:44.952999', 1, 1);
INSERT INTO `blog_blog` VALUES (7, 'for 1', 'xxx:1', '2019-09-26 00:46:16.435585', '2019-09-26 00:46:16.436585', 1, 1);
INSERT INTO `blog_blog` VALUES (8, 'for 2', 'xxx:2', '2019-09-26 00:46:16.494623', '2019-09-26 00:46:16.494623', 1, 1);
INSERT INTO `blog_blog` VALUES (9, 'for 3', 'xxx:3', '2019-09-26 00:46:16.549764', '2019-09-26 00:46:16.549764', 1, 1);
INSERT INTO `blog_blog` VALUES (10, 'for 4', 'xxx:4', '2019-09-26 00:46:16.682854', '2019-09-26 00:46:16.682854', 1, 1);
INSERT INTO `blog_blog` VALUES (11, 'for 5', 'xxx:5', '2019-09-26 00:46:16.737931', '2019-09-26 00:46:16.737931', 1, 1);
INSERT INTO `blog_blog` VALUES (12, 'for 6', 'xxx:6', '2019-09-26 00:46:16.767976', '2019-09-26 00:46:16.767976', 1, 1);
INSERT INTO `blog_blog` VALUES (13, 'for 7', 'xxx:7', '2019-09-26 00:46:16.805066', '2019-09-26 00:46:16.805066', 1, 1);
INSERT INTO `blog_blog` VALUES (14, 'for 8', 'xxx:8', '2019-09-26 00:46:16.834084', '2019-09-26 00:46:16.834084', 1, 1);
INSERT INTO `blog_blog` VALUES (15, 'for 9', 'xxx:9', '2019-09-26 00:46:16.871149', '2019-09-26 00:46:16.871149', 1, 1);
INSERT INTO `blog_blog` VALUES (16, 'for 10', 'xxx:10', '2019-09-26 00:46:16.900171', '2019-09-26 00:46:16.901168', 1, 1);
INSERT INTO `blog_blog` VALUES (17, 'for 11', 'xxx:11', '2019-09-26 00:46:16.938194', '2019-09-26 00:46:16.938194', 1, 1);
INSERT INTO `blog_blog` VALUES (18, 'for 12', 'xxx:12', '2019-09-26 00:46:16.967212', '2019-09-26 00:46:16.967212', 1, 1);
INSERT INTO `blog_blog` VALUES (19, 'for 13', 'xxx:13', '2019-09-26 00:46:17.004264', '2019-09-26 00:46:17.004264', 1, 1);
INSERT INTO `blog_blog` VALUES (20, 'for 14', 'xxx:14', '2019-09-26 00:46:17.033640', '2019-09-26 00:46:17.033640', 1, 1);
INSERT INTO `blog_blog` VALUES (21, 'for 15', 'xxx:15', '2019-09-26 00:46:17.071719', '2019-09-26 00:46:17.071719', 1, 1);
INSERT INTO `blog_blog` VALUES (22, 'for 16', 'xxx:16', '2019-09-26 00:46:17.099737', '2019-09-26 00:46:17.099737', 1, 1);
INSERT INTO `blog_blog` VALUES (23, 'for 17', 'xxx:17', '2019-09-26 00:46:17.138793', '2019-09-26 00:46:17.138793', 1, 1);
INSERT INTO `blog_blog` VALUES (24, 'for 18', 'xxx:18', '2019-09-26 00:46:17.166150', '2019-09-26 00:46:17.166150', 1, 1);
INSERT INTO `blog_blog` VALUES (25, 'for 19', 'xxx:19', '2019-09-26 00:46:17.204202', '2019-09-26 00:46:17.204202', 1, 1);
INSERT INTO `blog_blog` VALUES (26, 'for 20', 'xxx:20', '2019-09-26 00:46:17.232357', '2019-09-26 00:46:17.232357', 1, 1);
INSERT INTO `blog_blog` VALUES (27, 'for 21', 'xxx:21', '2019-09-26 00:46:17.270383', '2019-09-26 00:46:17.271384', 1, 1);
INSERT INTO `blog_blog` VALUES (28, 'for 22', 'xxx:22', '2019-09-26 00:46:17.299521', '2019-09-26 00:46:17.299521', 1, 1);
INSERT INTO `blog_blog` VALUES (29, 'for 23', 'xxx:23', '2019-09-26 00:46:17.348621', '2019-09-26 00:46:17.348621', 1, 1);
INSERT INTO `blog_blog` VALUES (30, 'for 24', 'xxx:24', '2019-09-26 00:46:17.376666', '2019-09-26 00:46:17.376666', 1, 1);
INSERT INTO `blog_blog` VALUES (31, 'for 25', 'xxx:25', '2019-09-26 00:46:17.414733', '2019-09-26 00:46:17.414733', 1, 1);
INSERT INTO `blog_blog` VALUES (32, 'for 26', 'xxx:26', '2019-09-26 00:46:17.442749', '2019-09-26 00:46:17.443749', 1, 1);
INSERT INTO `blog_blog` VALUES (33, 'for 27', 'xxx:27', '2019-09-26 00:46:17.481774', '2019-09-26 00:46:17.481774', 1, 1);
INSERT INTO `blog_blog` VALUES (34, 'for 28', 'xxx:28', '2019-09-26 00:46:17.509833', '2019-09-26 00:46:17.509833', 1, 1);
INSERT INTO `blog_blog` VALUES (35, 'for 29', 'xxx:29', '2019-09-26 00:46:17.547861', '2019-09-29 03:39:58.665688', 1, 1);
INSERT INTO `blog_blog` VALUES (36, 'for 30', '<p><img alt=\"\" src=\"/media/upload/2019/09/27/python_logo__.png\" style=\"height:85px; width:85px\" />xxx:30</p>', '2019-09-26 00:46:17.575878', '2019-09-27 13:22:59.430338', 1, 1);
INSERT INTO `blog_blog` VALUES (37, 'python3 之 字符串编码小结（Unicode、utf-8、gbk、gb2312等）', '<p>python3 解释器默认编码为Unicode，由str类型进行表示。二进制数据使用byte类型表示。</p>\r\n<p>字符串通过编<span style=\"color: #333300;\">码转换成字节串，字</span>节码通过解码成为字符串。</p>\r\n<p><span style=\"color: #ff0000;\"><strong>encode：str--&gt;bytes</strong></span></p>\r\n<p><span style=\"color: #ff0000;\"><strong>decode：bytes --&gt; str</strong></span></p>\r\n<p><span style=\"color: #000000;\"><strong>下面给出一个实例：</strong></span></p>\r\n<div class=\"cnblogs_code\">\r\n<pre><span style=\"color: #008080;\"> 1</span> mystr = <span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">人生苦短，我学Python</span><span style=\"color: #800000;\">\'</span>\r\n<span style=\"color: #008080;\"> 2</span> <span style=\"color: #0000ff;\">print</span>(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">原始字符串mystr：</span><span style=\"color: #800000;\">\'</span>,mystr)      <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\">原始字符串mystr： 人生苦短，我学Python</span>\r\n<span style=\"color: #008080;\"> 3</span> \r\n<span style=\"color: #008080;\"> 4</span> \r\n<span style=\"color: #008080;\"> 5</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\">将字符串进行编码</span>\r\n<span style=\"color: #008080;\"> 6</span> mystr_to_utf8 = mystr.encode(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">utf-8</span><span style=\"color: #800000;\">\'</span>)<span style=\"color: #008000;\">#</span><span style=\"color: #008000;\">默认就是Unicode，不用再decode</span>\r\n<span style=\"color: #008080;\"> 7</span> mystr_to_gbk = mystr.encode(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">gbk</span><span style=\"color: #800000;\">\'</span><span style=\"color: #000000;\">)\r\n</span><span style=\"color: #008080;\"> 8</span> \r\n<span style=\"color: #008080;\"> 9</span> \r\n<span style=\"color: #008080;\">10</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\">打印编码后的字节串（字面值）</span>\r\n<span style=\"color: #008080;\">11</span> <span style=\"color: #0000ff;\">print</span>(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">utf-8编码后的字节串：</span><span style=\"color: #800000;\">\'</span><span style=\"color: #000000;\">,mystr_to_utf8)\r\n</span><span style=\"color: #008080;\">12</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\">utf-8编码后的字节串： b\'\\xe4\\xba\\xba\\xe7\\x94\\x9f\\xe8\\x8b\\xa6\\xe7\\x9f\\xad\\xef\\xbc\\x8c\\xe6\\x88\\x91\\xe5\\xad\\xa6Python\'</span>\r\n<span style=\"color: #008080;\">13</span> \r\n<span style=\"color: #008080;\">14</span> <span style=\"color: #0000ff;\">print</span>(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">gbk编码后的字节串：</span><span style=\"color: #800000;\">\'</span><span style=\"color: #000000;\">,mystr_to_gbk)\r\n</span><span style=\"color: #008080;\">15</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\">gbk编码后的字节串： b\'\\xc8\\xcb\\xc9\\xfa\\xbf\\xe0\\xb6\\xcc\\xa3\\xac\\xce\\xd2\\xd1\\xa7Python\'</span>\r\n<span style=\"color: #008080;\">16</span> \r\n<span style=\"color: #008080;\">17</span> \r\n<span style=\"color: #008080;\">18</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\">正确解码：</span>\r\n<span style=\"color: #008080;\">19</span> <span style=\"color: #0000ff;\">print</span>(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">utf-8解码mystr_to_utf8：</span><span style=\"color: #800000;\">\'</span>,mystr_to_utf8.decode(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">utf-8</span><span style=\"color: #800000;\">\'</span>))    <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\">utf-8解码mystr_to_utf8： 人生苦短，我学Python</span>\r\n<span style=\"color: #008080;\">20</span> <span style=\"color: #0000ff;\">print</span>(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">gbk解码mystr_to_gbk：</span><span style=\"color: #800000;\">\'</span>,mystr_to_gbk.decode(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">gbk</span><span style=\"color: #800000;\">\'</span>))          <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\">gbk解码mystr_to_gbk： 人生苦短，我学Python</span>\r\n<span style=\"color: #008080;\">21</span> \r\n<span style=\"color: #008080;\">22</span> \r\n<span style=\"color: #008080;\">23</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\">错误解码示范：（会出现报错信息）</span>\r\n<span style=\"color: #008080;\">24</span> <span style=\"color: #0000ff;\">print</span>(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">gbk解码mystr_to_utf8：</span><span style=\"color: #800000;\">\'</span>,mystr_to_utf8.decode(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">gbk</span><span style=\"color: #800000;\">\'</span><span style=\"color: #000000;\">))\r\n</span><span style=\"color: #008080;\">25</span> <span style=\"color: #008000;\">#</span><span style=\"color: #008000;\">UnicodeDecodeError: \'gbk\' codec can\'t decode byte 0xa6 in position 20: illegal multibyte sequence</span>\r\n<span style=\"color: #008080;\">26</span> \r\n<span style=\"color: #008080;\">27</span> <span style=\"color: #0000ff;\">print</span>(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">utf-8解码mystr_to_gbk：</span><span style=\"color: #800000;\">\'</span>,mystr_to_gbk.decode(<span style=\"color: #800000;\">\'</span><span style=\"color: #800000;\">utf-8</span><span style=\"color: #800000;\">\'</span>))</pre>\r\n</div>\r\n<p>&nbsp;分析：</p>\r\n<p>　　1、python3 内部解释器默认编码为Unicode</p>\r\n<p>　　2、encode:指明要使用的编码，decode:指明当前编码的编码格式</p>\r\n<h1>题外篇：</h1>\r\n<h2>1、什么是字符编码</h2>\r\n<p>　　计算机想要工作必须通电，即用&lsquo;电&rsquo;驱使计算机干活，也就是说&lsquo;电&rsquo;的特性决定了计算机的特性。电的特性即高低电平(人类从逻辑上将二进制数1对应高电平,二进制数0对应低电平)，<span style=\"color: #000000;\">关于磁盘的磁特性也是同样的道理。<span style=\"color: #ff0000;\">结论：计算机只认识数字</span></span></p>\r\n<p>很明显，我们平时在使用计算机时，用的都是人类能读懂的字符（用高级语言编程的结果也无非是在文件内写了一堆字符），如何能让计算机读懂人类的字符？必须经过一个过程：</p>\r\n<pre>　　#字符--------（翻译过程）-------&gt;数字 \r\n\r\n　　#这个过程实际就是一个字符如何对应一个特定数字的标准，这个标准称之为字符编码<br /><br /></pre>\r\n<h2>&nbsp;2、字符编码的发展：三个阶段</h2>\r\n<h3>　阶段一：</h3>\r\n<pre>现代计算机起源于美国，最早诞生也是基于英文考虑的ASCII\r\nASCII:一个Bytes代表一个字符（英文字符/键盘上的所有其他字符），1Bytes=8bit，8bit可以表示0-2**8-1种变化，即可以表示256个字符\r\nASCII最初只用了后七位，127个数字，已经完全能够代表键盘上所有的字符了（英文字符/键盘的所有其他字符），后来为了将拉丁文也编码进了ASCII表，将最高位也占用了</pre>\r\n<h3>　阶段二：</h3>\r\n<pre>为了满足中文和英文，中国人定制了GBK\r\nGBK:2Bytes代表一个中文字符，1Bytes表示一个英文字符\r\n为了满足其他国家，各个国家纷纷定制了自己的编码\r\n日本把日文编到Shift_JIS里，韩国把韩文编到Euc-kr里</pre>\r\n<h3>　阶段三：</h3>\r\n<pre>各国有各国的标准，就会不可避免地出现冲突，结果就是，在多语言混合的文本中，显示出来会有乱码。如何解决这个问题呢？？？\r\n\r\n说白了乱码问题的本质就是不统一，如果我们能统一全世界，规定全世界只能使用一种文字符号，然后统一使用一种编码，那么乱码问题将不复存在，\r\nps：就像当年秦始皇统一中国一样，书同文车同轨，所有的麻烦事全部解决\r\n很明显，上述的假设是不可能成立的。很多地方或老的系统、应用软件仍会采用各种各样的编码，这是历史遗留问题。于是我们必须找出一种解决方案或者说编码方案，需要同时满足：<br />\r\n1、<span style=\"color: #ff0000;\">能够兼容万国字符</span>\r\n2、<span style=\"color: #ff0000;\">与全世界所有的字符编码都有映射关系，这样就可以转换成任意国家的字符编码</span>\r\n\r\n这就是unicode（定长），　统一用2Bytes代表一个字符，　虽然2**16-1=65535，但unicode却可以存放100w+个字符，因为unicode存放了与其他编码的映射关系，准确地说unicode并不是一种严格意义上的字符编码表，下载pdf来查看unicode的详情：\r\n链接：https://pan.baidu.com/s/1dEV3RYp\r\n\r\n很明显对于通篇都是英文的文本来说，unicode的式无疑是多了一倍的存储空间（二进制最终都是以电或者磁的方式存储到存储介质中的）\r\n\r\n于是产生了UTF-8（可变长，全称Unicode Transformation Format），对英文字符只用1Bytes表示，对中文字符用3Bytes，对其他生僻字用更多的Bytes去存\r\n\r\n\r\n<strong>小结</strong>：<span style=\"color: #ff0000;\">内存中统一采用unicode，浪费空间来换取可以转换成任意编码（不乱码），硬盘可以采用各种编码，如utf-8，保证存放于硬盘或者基于网络传输的数据量很小，提高传输效率与稳定性。<br /></span></pre>\r\n<h2>总结：</h2>\r\n<pre>基于目前的现状，内存中的编码固定就是unicode，我们唯一可变的就是硬盘的上对应的字符编码。\r\n此时你可能会觉得，那如果我们以后开发软时统一都用unicode编码，那么不就都统一了吗，关于统一这一点你的思路是没错的，但我们不可会使用unicode编码来编写程序的文件，因为在通篇都是英文的情况下，耗费的空间几乎会多出一倍，这样在软件读入内存或写入磁盘时，都会徒增IO次数，从而降低程序的执行效率。因而我们以后在编写程序的文件时应该统一使用一个更为精准的字符编码utf-8（用1Bytes存英文，3Bytes存中文），再次强调，内存中的编码固定使用unicode。\r\n<br />1、在存入磁盘时，需要将unicode转成一种更为精准的格式，utf-8:全称Unicode Transformation Format，将数据量控制到最精简\r\n2、在读入内存时，需要将utf-8转成unicode<br />\r\n所以我们需要明确：<strong><span style=\"color: #ff0000;\">内存中用unicode是为了兼容万国软件，即便是硬盘中有各国编码编写的软件，unicode也有相对应的映射关系，但在现在的开发中，程序员普遍使用utf-8编码了，估计在将来的某一天等所有老的软件都淘汰掉了情况下，就可以变成：内存utf-8&lt;-&gt;硬盘utf-8的形式了</span></strong>。</pre>\r\n<pre><span style=\"color: #ff0000;\">&nbsp;</span></pre>\r\n<p>　　</p>\r\n<p>&nbsp;</p>', '2019-09-26 09:23:45.074539', '2019-09-26 09:24:42.461896', 1, 4);
INSERT INTO `blog_blog` VALUES (38, 'python3 之列表', '<p>list_ = [1, 2, 3, 4, 5]<img alt=\"\" src=\"/media/upload/2019/09/27/index_qYW83sA.jpg\" style=\"height:386px; width:960px\" /></p>', '2019-09-27 02:06:57.854879', '2019-09-27 12:56:04.512680', 1, 4);
INSERT INTO `blog_blog` VALUES (39, '123113231', '<p><img alt=\"\" src=\"https://goss.veer.com/creative/vcg/veer/800water/veer-146153521.jpg\" style=\"height:800px; width:533px\" /></p>', '2019-09-27 03:32:29.253156', '2019-09-29 07:27:45.291508', 1, 2);

-- ----------------------------
-- Table structure for blog_blogtype
-- ----------------------------
DROP TABLE IF EXISTS `blog_blogtype`;
CREATE TABLE `blog_blogtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_blogtype
-- ----------------------------
INSERT INTO `blog_blogtype` VALUES (1, 'Django');
INSERT INTO `blog_blogtype` VALUES (2, '随笔');
INSERT INTO `blog_blogtype` VALUES (3, '感悟');
INSERT INTO `blog_blogtype` VALUES (4, 'python3');

-- ----------------------------
-- Table structure for comment_comment
-- ----------------------------
DROP TABLE IF EXISTS `comment_comment`;
CREATE TABLE `comment_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) UNSIGNED NOT NULL,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_time` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `reply_to_id` int(11) NULL DEFAULT NULL,
  `root_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_comment_content_type_id_fbfb9793_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `comment_comment_user_id_6078e57b_fk_auth_user_id`(`user_id`) USING BTREE,
  INDEX `comment_comment_reply_to_id_e0adcef8_fk_auth_user_id`(`reply_to_id`) USING BTREE,
  INDEX `comment_comment_parent_id_b612524c_fk_comment_comment_id`(`parent_id`) USING BTREE,
  INDEX `comment_comment_root_id_28721811_fk_comment_comment_id`(`root_id`) USING BTREE,
  CONSTRAINT `comment_comment_content_type_id_fbfb9793_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_comment_parent_id_b612524c_fk_comment_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `comment_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_comment_reply_to_id_e0adcef8_fk_auth_user_id` FOREIGN KEY (`reply_to_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_comment_root_id_28721811_fk_comment_comment_id` FOREIGN KEY (`root_id`) REFERENCES `comment_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_comment
-- ----------------------------
INSERT INTO `comment_comment` VALUES (1, 36, '1236', '2019-10-21 08:18:49.953414', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (2, 38, '列表', '2019-10-21 08:36:31.156929', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (3, 39, '9', '2019-10-21 08:42:35.065890', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (4, 39, '这张图片，很好看', '2019-10-22 00:56:44.763714', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (5, 39, '999', '2019-10-22 07:36:49.389574', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (6, 39, '666', '2019-10-22 08:18:53.336707', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (7, 39, '<p><img alt=\"smiley\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" title=\"smiley\" width=\"23\" /></p>', '2019-10-23 00:33:29.780648', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (8, 39, '<p>123</p>', '2019-10-23 00:58:05.774362', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (9, 39, '<p>898</p>', '2019-10-23 01:15:17.749539', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (10, 39, '<p>898</p>', '2019-10-23 01:17:39.585794', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (11, 39, '<p>努力，坚持</p>', '2019-10-23 01:18:03.051079', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (12, 39, '<p>努力，坚持<img alt=\"smiley\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" title=\"smiley\" width=\"23\" /></p>', '2019-10-23 01:18:26.146989', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (13, 39, '<p><img alt=\"smiley\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" title=\"smiley\" width=\"23\" /></p>', '2019-10-23 01:19:33.624933', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (14, 39, '<p><img alt=\"smiley\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" title=\"smiley\" width=\"23\" /></p>', '2019-10-23 01:24:18.850622', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (15, 39, '<p><img alt=\"devil\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/devil_smile.png\" title=\"devil\" width=\"23\" /></p>', '2019-10-23 01:36:25.648697', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (16, 39, '<p><img alt=\"frown\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/confused_smile.png\" title=\"frown\" width=\"23\" /></p>', '2019-10-23 01:36:35.451480', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (17, 39, '<p>321</p>\r\n\r\n<p>&nbsp;</p>', '2019-10-23 01:55:22.792406', 7, 1, NULL, NULL, NULL);
INSERT INTO `comment_comment` VALUES (18, 17, '666', '2019-10-23 07:10:14.180962', 12, 1, 17, 1, 17);
INSERT INTO `comment_comment` VALUES (19, 39, '<p><img alt=\"laugh\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/teeth_smile.png\" title=\"laugh\" width=\"23\" /></p>', '2019-10-23 09:04:31.024435', 7, 1, 16, 1, 16);
INSERT INTO `comment_comment` VALUES (20, 39, '<p>huifu</p>', '2019-10-23 09:54:08.512981', 7, 1, 19, 1, 16);
INSERT INTO `comment_comment` VALUES (21, 39, '<p>#</p>', '2019-10-23 09:58:13.591054', 7, 1, 19, 1, 16);
INSERT INTO `comment_comment` VALUES (22, 39, '<p><img alt=\"yes\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/thumbs_up.png\" title=\"yes\" width=\"23\" /></p>', '2019-10-23 09:58:28.473423', 7, 1, 11, 1, 11);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-09-24 08:13:17.030173', '1', 'BlogType object (1)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2019-09-24 08:13:38.684024', '2', 'BlogType object (2)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (3, '2019-09-24 08:13:44.374712', '3', 'BlogType object (3)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (4, '2019-09-24 08:17:37.254269', '1', '<Blog:第一篇博客>', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (5, '2019-09-24 10:04:32.059400', '2', '<Blog:第二篇博客>', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (6, '2019-09-24 12:43:32.433565', '2', '<Blog:第二篇博客>', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (7, '2019-09-24 12:43:32.529760', '1', '<Blog:第一篇博客>', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (8, '2019-09-24 12:50:33.736982', '3', '<Blog:长内容的博客>', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (9, '2019-09-24 13:27:34.034584', '4', '<Blog:随笔2>', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (10, '2019-09-24 13:27:51.094089', '5', '<Blog:Django>', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (11, '2019-09-26 09:23:23.655461', '4', 'python3', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (12, '2019-09-26 09:23:45.151589', '37', 'python3 之 字符串编码小结（Unicode、utf-8、gbk、gb2312等）', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (13, '2019-09-26 09:24:42.548952', '37', 'python3 之 字符串编码小结（Unicode、utf-8、gbk、gb2312等）', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (14, '2019-09-27 02:06:57.900910', '38', 'python3 之列表', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (15, '2019-09-27 03:32:29.272169', '39', '123113231', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (16, '2019-09-27 09:52:49.177945', '39', '123113231', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (17, '2019-09-27 10:30:17.931865', '39', '123113231', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (18, '2019-09-27 12:54:59.105448', '38', 'python3 之列表', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (19, '2019-09-27 12:56:04.529240', '38', 'python3 之列表', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (20, '2019-09-27 12:56:48.975314', '36', 'for 30', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (21, '2019-09-30 07:10:41.361073', '1', 'ReadNum object (1)', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (22, '2019-10-04 07:53:10.809796', '1', 'ReadNum object (1)', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (23, '2019-10-04 09:16:16.494856', '7', 'ReadNum object (7)', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (24, '2019-10-04 12:40:29.575779', '1', 'ReadDetail object (1)', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (25, '2019-10-23 07:10:14.207980', '18', '666', 1, '[{\"added\": {}}]', 12, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (7, 'blog', 'blog');
INSERT INTO `django_content_type` VALUES (8, 'blog', 'blogtype');
INSERT INTO `django_content_type` VALUES (9, 'blog', 'readnum');
INSERT INTO `django_content_type` VALUES (12, 'comment', 'comment');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (11, 'read_statistics', 'readdetail');
INSERT INTO `django_content_type` VALUES (10, 'read_statistics', 'readnum');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-09-24 07:54:46.109940');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-09-24 07:54:54.250360');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-09-24 07:54:56.365763');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-09-24 07:54:56.413797');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2019-09-24 07:54:57.569563');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2019-09-24 07:54:58.515303');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2019-09-24 07:54:59.710096');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2019-09-24 07:54:59.759128');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2019-09-24 07:55:00.521242');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2019-09-24 07:55:00.558267');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2019-09-24 07:55:00.619308');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2019-09-24 07:55:02.610707');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0009_alter_user_last_name_max_length', '2019-09-24 07:55:03.442326');
INSERT INTO `django_migrations` VALUES (14, 'blog', '0001_initial', '2019-09-24 07:55:06.445319');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2019-09-24 07:55:07.059949');
INSERT INTO `django_migrations` VALUES (16, 'blog', '0002_auto_20190926_0945', '2019-09-26 01:46:01.724915');
INSERT INTO `django_migrations` VALUES (17, 'blog', '0003_auto_20190927_1658', '2019-09-27 08:58:10.778876');
INSERT INTO `django_migrations` VALUES (18, 'blog', '0004_auto_20190927_1740', '2019-09-27 09:40:41.897469');
INSERT INTO `django_migrations` VALUES (19, 'blog', '0005_blog_readed_num', '2019-09-27 13:12:14.428800');
INSERT INTO `django_migrations` VALUES (20, 'blog', '0006_auto_20190930_1115', '2019-09-30 03:15:21.959911');
INSERT INTO `django_migrations` VALUES (21, 'blog', '0007_auto_20191004_1532', '2019-10-04 07:33:13.360921');
INSERT INTO `django_migrations` VALUES (22, 'read_statistics', '0001_initial', '2019-10-04 07:33:14.639474');
INSERT INTO `django_migrations` VALUES (23, 'read_statistics', '0002_readdetail', '2019-10-04 12:35:34.538854');
INSERT INTO `django_migrations` VALUES (24, 'comment', '0001_initial', '2019-10-20 03:24:14.460259');
INSERT INTO `django_migrations` VALUES (25, 'comment', '0002_auto_20191023_1436', '2019-10-23 06:37:03.591107');
INSERT INTO `django_migrations` VALUES (26, 'comment', '0003_auto_20191023_1444', '2019-10-23 06:44:50.694483');
INSERT INTO `django_migrations` VALUES (27, 'comment', '0004_auto_20191023_1455', '2019-10-23 06:55:33.542825');
INSERT INTO `django_migrations` VALUES (28, 'comment', '0005_auto_20191023_1459', '2019-10-23 06:59:52.063239');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('dc3qvu9czbr8qqaqm4931a2n44dxgnv9', 'OTA2OGQ3NTRkOTU4MjdhNmEwOWNhOWE4YzZiYzg5NzkzYmFiNjVmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiM2M2OTI0ZGNmNzFhNDM2YWIzNmI4YzM4N2Y2N2QyOTZhNGVkOTAxIn0=', '2019-10-08 08:12:16.337010');
INSERT INTO `django_session` VALUES ('hzyu67gk5vk6gt8tim5ogub50rugnr80', 'OTA2OGQ3NTRkOTU4MjdhNmEwOWNhOWE4YzZiYzg5NzkzYmFiNjVmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiM2M2OTI0ZGNmNzFhNDM2YWIzNmI4YzM4N2Y2N2QyOTZhNGVkOTAxIn0=', '2019-11-05 06:58:45.053902');
INSERT INTO `django_session` VALUES ('pd93ra9wbu58trfzodeqmjwhqter7vax', 'OTA2OGQ3NTRkOTU4MjdhNmEwOWNhOWE4YzZiYzg5NzkzYmFiNjVmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiM2M2OTI0ZGNmNzFhNDM2YWIzNmI4YzM4N2Y2N2QyOTZhNGVkOTAxIn0=', '2019-11-05 07:02:45.609829');
INSERT INTO `django_session` VALUES ('x7jsvndh1jrje98mwf66coxlp6ouvbvl', 'OTA2OGQ3NTRkOTU4MjdhNmEwOWNhOWE4YzZiYzg5NzkzYmFiNjVmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiM2M2OTI0ZGNmNzFhNDM2YWIzNmI4YzM4N2Y2N2QyOTZhNGVkOTAxIn0=', '2019-10-08 08:10:51.324300');

-- ----------------------------
-- Table structure for my_cache_table
-- ----------------------------
DROP TABLE IF EXISTS `my_cache_table`;
CREATE TABLE `my_cache_table`  (
  `cache_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  PRIMARY KEY (`cache_key`) USING BTREE,
  INDEX `my_cache_table_expires`(`expires`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_cache_table
-- ----------------------------
INSERT INTO `my_cache_table` VALUES (':1:hot_blogs_for_7_days', 'gASVywoAAAAAAACMFmRqYW5nby5kYi5tb2RlbHMucXVlcnmUjAhRdWVyeVNldJSTlCmBlH2UKIwFbW9kZWyUjAtibG9nLm1vZGVsc5SMBEJsb2eUk5SMA19kYpROjAZfaGludHOUfZSMBXF1ZXJ5lIwaZGphbmdvLmRiLm1vZGVscy5zcWwucXVlcnmUjAVRdWVyeZSTlCmBlH2UKGgFaAiMDmFsaWFzX3JlZmNvdW50lH2UKIwJYmxvZ19ibG9nlEsEjBpyZWFkX3N0YXRpc3RpY3NfcmVhZGRldGFpbJRLA3WMCWFsaWFzX21hcJSMC2NvbGxlY3Rpb25zlIwLT3JkZXJlZERpY3SUk5QpUpQoaBSMI2RqYW5nby5kYi5tb2RlbHMuc3FsLmRhdGFzdHJ1Y3R1cmVzlIwJQmFzZVRhYmxllJOUKYGUfZQojAp0YWJsZV9uYW1llGgUjAt0YWJsZV9hbGlhc5RoFHViaBVoG4wESm9pbpSTlCmBlH2UKGggaBWMDHBhcmVudF9hbGlhc5RoFGghaBWMCWpvaW5fdHlwZZSMCklOTkVSIEpPSU6UjAlqb2luX2NvbHOUjAJpZJSMCW9iamVjdF9pZJSGlIWUjApqb2luX2ZpZWxklIwiZGphbmdvLmNvbnRyaWIuY29udGVudHR5cGVzLmZpZWxkc5SMCkdlbmVyaWNSZWyUk5QpgZR9lCiMBWZpZWxklIwXZGphbmdvLmRiLm1vZGVscy5maWVsZHOUjAtfbG9hZF9maWVsZJSTlIwEYmxvZ5RoB4wMcmVhZF9kZXRhaWxzlIeUUpRoBYwWcmVhZF9zdGF0aXN0aWNzLm1vZGVsc5SMClJlYWREZXRhaWyUk5SMDHJlbGF0ZWRfbmFtZZSMASuUjBJyZWxhdGVkX3F1ZXJ5X25hbWWUTowQbGltaXRfY2hvaWNlc190b5R9lIwLcGFyZW50X2xpbmuUiYwJb25fZGVsZXRllIwZZGphbmdvLmRiLm1vZGVscy5kZWxldGlvbpSMCkRPX05PVEhJTkeUk5SMC3N5bW1ldHJpY2FslImMCG11bHRpcGxllIh1YowIbnVsbGFibGWUiIwRZmlsdGVyZWRfcmVsYXRpb26UTnVidYwQZXh0ZXJuYWxfYWxpYXNlc5SPlIwJdGFibGVfbWFwlH2UKGgUXZRoFGFoFV2UaBVhdYwMZGVmYXVsdF9jb2xzlImMEGRlZmF1bHRfb3JkZXJpbmeUiIwRc3RhbmRhcmRfb3JkZXJpbmeUiIwMdXNlZF9hbGlhc2VzlI+UjBBmaWx0ZXJfaXNfc3RpY2t5lImMCHN1YnF1ZXJ5lImMBnNlbGVjdJSMHGRqYW5nby5kYi5tb2RlbHMuZXhwcmVzc2lvbnOUjANDb2yUk5QpgZR9lCiMEV9jb25zdHJ1Y3Rvcl9hcmdzlGgUaDdoOGgHaCqHlFKUhpR9lIaUjAxvdXRwdXRfZmllbGSUaGKMBWFsaWFzlGgUjAZ0YXJnZXSUaGJ1YmhdKYGUfZQoaGBoFGg3aDhoB4wFdGl0bGWUh5RSlIaUfZSGlGhmaG1oZ2gUaGhobXVihpSMBXdoZXJllIwaZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmWUjAlXaGVyZU5vZGWUk5QpgZR9lCiMCGNoaWxkcmVulF2UKIwYZGphbmdvLmRiLm1vZGVscy5sb29rdXBzlIwITGVzc1RoYW6Uk5QpgZR9lCiMA2xoc5RoXSmBlH2UKGhgaBVoN4wPcmVhZF9zdGF0aXN0aWNzlGg9jARkYXRllIeUUpSGlH2UhpRoZmiFaGdoFWhoaIWMEmNvbnRhaW5zX2FnZ3JlZ2F0ZZSJdWKMA3Joc5SMCGRhdGV0aW1llIwEZGF0ZZSTlEMEB+MKFpSFlFKUjBRiaWxhdGVyYWxfdHJhbnNmb3Jtc5RdlGiJiXViaHqMEkdyZWF0ZXJUaGFuT3JFcXVhbJSTlCmBlH2UKGh/aIBoimiNQwQH4woPlIWUUpRokV2UaImJdWJljAljb25uZWN0b3KUjANBTkSUjAduZWdhdGVklIloiYl1YowLd2hlcmVfY2xhc3OUaHWMCGdyb3VwX2J5lGheaGmGlIwIb3JkZXJfYnmUjA0tcmVhZF9udW1fc3VtlIWUjAhsb3dfbWFya5RLAIwJaGlnaF9tYXJrlEsEjAhkaXN0aW5jdJSJjA9kaXN0aW5jdF9maWVsZHOUKYwRc2VsZWN0X2Zvcl91cGRhdGWUiYwYc2VsZWN0X2Zvcl91cGRhdGVfbm93YWl0lImMHXNlbGVjdF9mb3JfdXBkYXRlX3NraXBfbG9ja2VklImMFHNlbGVjdF9mb3JfdXBkYXRlX29mlCmMDnNlbGVjdF9yZWxhdGVklImMCW1heF9kZXB0aJRLBYwNdmFsdWVzX3NlbGVjdJRoKmhrhpSMDF9hbm5vdGF0aW9uc5RoGSlSlIwMcmVhZF9udW1fc3VtlIwbZGphbmdvLmRiLm1vZGVscy5hZ2dyZWdhdGVzlIwDU3VtlJOUKYGUfZQoaGCMFnJlYWRfZGV0YWlsc19fcmVhZF9udW2UhZR9lIaUjAZmaWx0ZXKUTowSc291cmNlX2V4cHJlc3Npb25zlF2UaF0pgZR9lChoYGgVaDdogmg9jAhyZWFkX251bZSHlFKUhpR9lIaUaGZow2hnaBVoaGjDjBVfb3V0cHV0X2ZpZWxkX29yX25vbmWUaMNoiYl1YmGMBWV4dHJhlH2UjAppc19zdW1tYXJ5lIloZmjDdWJzjBZhbm5vdGF0aW9uX3NlbGVjdF9tYXNrlI+UKGiykIwYX2Fubm90YXRpb25fc2VsZWN0X2NhY2hllGgZKVKUaLJotnOMCmNvbWJpbmF0b3KUTowOY29tYmluYXRvcl9hbGyUiYwQY29tYmluZWRfcXVlcmllc5QpjAZfZXh0cmGUTowRZXh0cmFfc2VsZWN0X21hc2uUj5SME19leHRyYV9zZWxlY3RfY2FjaGWUTowMZXh0cmFfdGFibGVzlCmMDmV4dHJhX29yZGVyX2J5lCmMEGRlZmVycmVkX2xvYWRpbmeUKJGUiIaUjBNfZmlsdGVyZWRfcmVsYXRpb25zlH2UjA1fbG9va3VwX2pvaW5zlF2UKGgUaBVljApiYXNlX3RhYmxllGgUdWKMDV9yZXN1bHRfY2FjaGWUXZQofZQoaCpLIWhrjAZmb3IgMjeUaLJLA3V9lChoKkslaGuMSHB5dGhvbjMg5LmLIOWtl+espuS4sue8lueggeWwj+e7k++8iFVuaWNvZGXjgIF1dGYtOOOAgWdia+OAgWdiMjMxMuetie+8iZRosksCdX2UKGgqSyRoa4wGZm9yIDMwlGiySwJ1fZQoaCpLImhrjAZmb3IgMjiUaLJLAXVljA5fc3RpY2t5X2ZpbHRlcpSJjApfZm9yX3dyaXRllImMGV9wcmVmZXRjaF9yZWxhdGVkX2xvb2t1cHOUKYwOX3ByZWZldGNoX2RvbmWUiYwWX2tub3duX3JlbGF0ZWRfb2JqZWN0c5R9lIwPX2l0ZXJhYmxlX2NsYXNzlGgAjA5WYWx1ZXNJdGVyYWJsZZSTlIwHX2ZpZWxkc5RoKmhrhpSMD19kamFuZ29fdmVyc2lvbpSMAzIuMJR1Yi4=', '2019-10-22 07:57:24.000000');

-- ----------------------------
-- Table structure for read_statistics_readdetail
-- ----------------------------
DROP TABLE IF EXISTS `read_statistics_readdetail`;
CREATE TABLE `read_statistics_readdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `read_num` int(11) NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `read_statistics_read_content_type_id_589c7d92_fk_django_co`(`content_type_id`) USING BTREE,
  CONSTRAINT `read_statistics_read_content_type_id_589c7d92_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of read_statistics_readdetail
-- ----------------------------
INSERT INTO `read_statistics_readdetail` VALUES (1, '2019-10-04', 4, 39, 7);
INSERT INTO `read_statistics_readdetail` VALUES (2, '2019-10-04', 1, 37, 7);
INSERT INTO `read_statistics_readdetail` VALUES (3, '2019-10-04', 1, 30, 7);
INSERT INTO `read_statistics_readdetail` VALUES (4, '2019-10-04', 1, 29, 7);
INSERT INTO `read_statistics_readdetail` VALUES (5, '2019-10-04', 1, 28, 7);
INSERT INTO `read_statistics_readdetail` VALUES (6, '2019-10-05', 1, 36, 7);
INSERT INTO `read_statistics_readdetail` VALUES (7, '2019-10-05', 1, 34, 7);
INSERT INTO `read_statistics_readdetail` VALUES (8, '2019-10-06', 1, 27, 7);
INSERT INTO `read_statistics_readdetail` VALUES (9, '2019-10-07', 1, 35, 7);
INSERT INTO `read_statistics_readdetail` VALUES (10, '2019-10-14', 1, 39, 7);
INSERT INTO `read_statistics_readdetail` VALUES (11, '2019-10-16', 2, 33, 7);
INSERT INTO `read_statistics_readdetail` VALUES (12, '2019-10-16', 1, 36, 7);
INSERT INTO `read_statistics_readdetail` VALUES (13, '2019-10-18', 1, 37, 7);
INSERT INTO `read_statistics_readdetail` VALUES (14, '2019-10-20', 1, 39, 7);
INSERT INTO `read_statistics_readdetail` VALUES (15, '2019-10-20', 1, 36, 7);
INSERT INTO `read_statistics_readdetail` VALUES (16, '2019-10-20', 1, 38, 7);
INSERT INTO `read_statistics_readdetail` VALUES (17, '2019-10-20', 1, 37, 7);
INSERT INTO `read_statistics_readdetail` VALUES (18, '2019-10-20', 1, 34, 7);
INSERT INTO `read_statistics_readdetail` VALUES (19, '2019-10-20', 1, 35, 7);
INSERT INTO `read_statistics_readdetail` VALUES (20, '2019-10-21', 1, 33, 7);
INSERT INTO `read_statistics_readdetail` VALUES (21, '2019-10-22', 1, 36, 7);
INSERT INTO `read_statistics_readdetail` VALUES (22, '2019-10-22', 1, 32, 7);

-- ----------------------------
-- Table structure for read_statistics_readnum
-- ----------------------------
DROP TABLE IF EXISTS `read_statistics_readnum`;
CREATE TABLE `read_statistics_readnum`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `read_num` int(11) NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `read_statistics_read_content_type_id_560f0f39_fk_django_co`(`content_type_id`) USING BTREE,
  CONSTRAINT `read_statistics_read_content_type_id_560f0f39_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of read_statistics_readnum
-- ----------------------------
INSERT INTO `read_statistics_readnum` VALUES (1, 25, 36, 7);
INSERT INTO `read_statistics_readnum` VALUES (2, 3, 34, 7);
INSERT INTO `read_statistics_readnum` VALUES (3, 5, 33, 7);
INSERT INTO `read_statistics_readnum` VALUES (4, 1, 31, 7);
INSERT INTO `read_statistics_readnum` VALUES (5, 2, 32, 7);
INSERT INTO `read_statistics_readnum` VALUES (6, 1, 24, 7);
INSERT INTO `read_statistics_readnum` VALUES (7, 6, 35, 7);
INSERT INTO `read_statistics_readnum` VALUES (8, 4, 39, 7);
INSERT INTO `read_statistics_readnum` VALUES (9, 3, 38, 7);
INSERT INTO `read_statistics_readnum` VALUES (10, 4, 37, 7);
INSERT INTO `read_statistics_readnum` VALUES (11, 1, 30, 7);
INSERT INTO `read_statistics_readnum` VALUES (12, 1, 29, 7);
INSERT INTO `read_statistics_readnum` VALUES (13, 1, 28, 7);
INSERT INTO `read_statistics_readnum` VALUES (14, 1, 27, 7);

SET FOREIGN_KEY_CHECKS = 1;
