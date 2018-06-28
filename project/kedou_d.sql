# SQL Manager 2007 Lite for MySQL 4.4.2.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : kedou_db


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `kedou_db`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `kedou_db`;

#
# Structure for the `admin` table : 
#

CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminaccount` varchar(20) DEFAULT NULL,
  `adminpwd` varchar(100) DEFAULT NULL,
  `adminsalt` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `lastlogintime` datetime DEFAULT NULL,
  `lastloginip` varchar(20) DEFAULT NULL,
  `logincount` bigint(20) DEFAULT NULL,
  `adminimage` varchar(20) DEFAULT NULL,
  `loginip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `adminrolerelation` table : 
#

CREATE TABLE `adminrolerelation` (
  `arrid` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`arrid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `answer` table : 
#

CREATE TABLE `answer` (
  `comid` int(11) NOT NULL DEFAULT '0',
  `answers` varchar(50) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `userIcon` varchar(20) DEFAULT NULL,
  `anid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`anid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `article` table : 
#

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titleimg` varchar(20) DEFAULT NULL,
  `img` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `content` text,
  `likes` int(11) DEFAULT NULL,
  `collections` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `dates` datetime DEFAULT NULL,
  `hotspots` varchar(20) DEFAULT NULL,
  `texttype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Structure for the `articlecollection` table : 
#

CREATE TABLE `articlecollection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `articletype` table : 
#

CREATE TABLE `articletype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `business` table : 
#

CREATE TABLE `business` (
  `busid` int(11) NOT NULL AUTO_INCREMENT,
  `busname` varchar(100) DEFAULT NULL,
  `buscontact` varchar(20) NOT NULL,
  `bustel` varchar(20) NOT NULL,
  `busaccount` varchar(30) NOT NULL,
  `busemail` varchar(20) NOT NULL,
  `buspwd` varchar(100) DEFAULT NULL,
  `buslicense` varchar(100) DEFAULT NULL,
  `busaddress` varchar(100) DEFAULT NULL,
  `buscorporate` varchar(20) DEFAULT NULL,
  `state` int(5) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `busip` varchar(20) NOT NULL,
  `createtime` datetime NOT NULL,
  `logintime` datetime DEFAULT NULL,
  `lastlogintime` datetime DEFAULT NULL,
  `logincount` bigint(50) NOT NULL,
  `lastloginip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`busid`),
  UNIQUE KEY `busaccount` (`busaccount`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Structure for the `businesscoursetyperelation` table : 
#

CREATE TABLE `businesscoursetyperelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busid` int(11) NOT NULL,
  `coursetypeid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Structure for the `businessnotice` table : 
#

CREATE TABLE `businessnotice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `img` varchar(20) DEFAULT NULL,
  `busid` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Structure for the `businessrolerelation` table : 
#

CREATE TABLE `businessrolerelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `businessvisitnumber` table : 
#

CREATE TABLE `businessvisitnumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitnumber` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `busid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

#
# Structure for the `calendar` table : 
#

CREATE TABLE `calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `chooseanswer` table : 
#

CREATE TABLE `chooseanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questiondes` int(11) DEFAULT NULL,
  `answer` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Structure for the `choosequestion` table : 
#

CREATE TABLE `choosequestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `collection` table : 
#

CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `comment` table : 
#

CREATE TABLE `comment` (
  `comid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `articleid` int(11) DEFAULT NULL,
  `comimg1` varchar(20) DEFAULT NULL,
  `comimg2` varchar(20) DEFAULT NULL,
  `comimg3` varchar(20) DEFAULT NULL,
  `usericon` varchar(20) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`comid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Structure for the `course` table : 
#

CREATE TABLE `course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `coursestarttime` date DEFAULT NULL,
  `courseendtime` date DEFAULT NULL,
  `courseprice` int(11) DEFAULT NULL,
  `busid` int(11) NOT NULL,
  `courseimg` varchar(200) DEFAULT NULL,
  `hot` int(11) DEFAULT NULL,
  `coursesold` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Structure for the `coursebuscrelation` table : 
#

CREATE TABLE `coursebuscrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `buscourtypeid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Structure for the `coursetype` table : 
#

CREATE TABLE `coursetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) NOT NULL,
  `typecreatetime` datetime DEFAULT NULL,
  `typecreator` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Structure for the `coursetyperelation` table : 
#

CREATE TABLE `coursetyperelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `coursetypeid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Structure for the `history` table : 
#

CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `hotspot` table : 
#

CREATE TABLE `hotspot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `label` table : 
#

CREATE TABLE `label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Structure for the `role` table : 
#

CREATE TABLE `role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `createTime` datetime NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `roleid` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Structure for the `tag` table : 
#

CREATE TABLE `tag` (
  `tagid` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(20) DEFAULT NULL,
  `courseid` int(11) NOT NULL,
  PRIMARY KEY (`tagid`),
  UNIQUE KEY `courseid` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `torder` table : 
#

CREATE TABLE `torder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `courseid` int(11) DEFAULT NULL,
  `busid` int(11) DEFAULT NULL,
  `reserveNum` bigint(20) DEFAULT NULL,
  `price` double(15,3) DEFAULT NULL,
  `orderstate` int(11) DEFAULT NULL,
  `usernote` varchar(100) DEFAULT NULL,
  `ordercreatetime` datetime DEFAULT NULL,
  `orderprocesstime` datetime DEFAULT NULL,
  `reservename` varchar(20) DEFAULT NULL,
  `reserveTel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `user` table : 
#

CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `userpwd` varchar(100) NOT NULL,
  `useremail` varchar(20) DEFAULT NULL,
  `usertel` varchar(20) DEFAULT NULL,
  `useridnum` varchar(20) DEFAULT NULL,
  `userip` varchar(20) DEFAULT NULL,
  `userrealname` varchar(20) DEFAULT NULL,
  `userdiscription` varchar(100) DEFAULT NULL,
  `state` int(2) NOT NULL,
  `usericon` varchar(100) DEFAULT NULL,
  `verifynum` varchar(32) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `lastlogintime` datetime DEFAULT NULL,
  `logincount` bigint(100) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `lastloginip` varchar(20) DEFAULT NULL,
  `useracount` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `userlabel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `useremail` (`useremail`),
  UNIQUE KEY `usertel` (`usertel`),
  UNIQUE KEY `useridnul` (`useridnum`),
  UNIQUE KEY `useridnum` (`useridnum`),
  UNIQUE KEY `useremail_2` (`useremail`),
  UNIQUE KEY `usertel_2` (`usertel`),
  UNIQUE KEY `usertel_3` (`usertel`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Structure for the `userrolerelation` table : 
#

CREATE TABLE `userrolerelation` (
  `urrid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`urrid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for the `admin` table  (LIMIT 0,500)
#

INSERT INTO `admin` (`adminid`, `adminaccount`, `adminpwd`, `adminsalt`, `state`, `createtime`, `logintime`, `lastlogintime`, `lastloginip`, `logincount`, `adminimage`, `loginip`) VALUES 
  (1,'admin','$2a$10$hETqi7a.yUfk8kMjGnfHPemuwYD1kwZCQ9GpqmLAWblvQr6isbPOW','6eff35cc5afd4db98f739f26bfe8e1aa',0,'2018-05-30 23:13:55','2018-06-20 10:39:08','2018-06-20 10:38:59','0:0:0:0:0:0:0:1',3,NULL,'0:0:0:0:0:0:0:1');
COMMIT;

#
# Data for the `adminrolerelation` table  (LIMIT 0,500)
#

INSERT INTO `adminrolerelation` (`arrid`, `adminid`, `roleid`) VALUES 
  (1,1,5);
COMMIT;

#
# Data for the `article` table  (LIMIT 0,500)
#

INSERT INTO `article` (`id`, `titleimg`, `img`, `title`, `author`, `content`, `likes`, `collections`, `views`, `dates`, `hotspots`, `texttype`) VALUES 
  (1,'20180611224432.jpg',NULL,'课兜网成立啦','123','正文内容',0,0,0,'2018-06-11 22:44:32',NULL,0),
  (2,'20180612153332.jpg',NULL,'轮播','123','正文内容',10001,0,0,'2018-06-12 15:33:32',NULL,0),
  (3,'20180612153343.jpg',NULL,'大家都在逛','123','正文内容',320,0,0,'2018-06-12 15:33:43',NULL,0),
  (4,'20180619153924.jpg',NULL,'测试斜体','123','正文内容',0,0,0,'2018-06-19 15:39:25',NULL,0),
  (5,'20180619154050.jpg',NULL,'测试斜体2','123','正文内容',0,0,0,'2018-06-19 15:40:50',NULL,0),
  (6,'20180619155524.jpg',NULL,'课兜网成立啦','123','正文内容',0,0,0,'2018-06-19 15:55:24',NULL,0),
  (7,'20180619155934.jpg',NULL,'第一条公告','123','正文内容',0,0,0,'2018-06-19 15:59:36',NULL,0),
  (8,'20180619160941.jpg',NULL,'课兜网成立啦','123','正文内容',0,0,0,'2018-06-19 16:09:42',NULL,0),
  (9,'20180619161200.jpg',NULL,'测试斜体2','123','<strong><em><u><span style=\"font-size:18px;\"></span><span style=\"font-size:18px;\"></span></u><span style=\"font-size:18px;\">哈哈十大</span><span style=\"font-size:18px;\"></span></em></strong>',0,0,0,'2018-06-19 16:12:00',NULL,0),
  (10,'20180619163430.jpg',NULL,'第一条公告','123','HHAHA',0,0,0,'2018-06-19 16:34:30',NULL,0),
  (11,'20180619185456.jpg',NULL,'用户发表文章',NULL,'第一条',0,0,0,'2018-06-19 18:54:56',NULL,0),
  (12,'20180620155110.jpg',NULL,'阿三',NULL,'搜索',0,0,0,'2018-06-20 15:51:10',NULL,0),
  (13,'20180620155110.jpg',NULL,'阿三',NULL,'搜索',0,0,0,'2018-06-20 15:51:10',NULL,0),
  (14,'',NULL,'',NULL,'正文内容',0,0,0,'2018-06-20 16:33:50',NULL,0);
COMMIT;

#
# Data for the `business` table  (LIMIT 0,500)
#

INSERT INTO `business` (`busid`, `busname`, `buscontact`, `bustel`, `busaccount`, `busemail`, `buspwd`, `buslicense`, `busaddress`, `buscorporate`, `state`, `salt`, `busip`, `createtime`, `logintime`, `lastlogintime`, `logincount`, `lastloginip`) VALUES 
  (1,'123','张天润','15030226686','kedou123','949947078@qq.com','$2a$10$l/Ta2PibIohnNgJxMA2J9.XRyXOwAOcR1NduS74gLQSN8bUPX28.i','123123123123123','河北','杨雨晴',1,'c55bcaca6ce64575ad97fbd4447e8213','0:0:0:0:0:0:0:1','2018-05-12 15:51:22','2018-06-20 10:56:12','2018-06-20 10:55:43',149,'0:0:0:0:0:0:0:1'),
  (2,'哈哈','杨宏利','15732168396','Yhongli','1209754720@qq.com','$2a$10$zXTrDP28hvgX.qzMhOQWLu2u.7mzezzBbCmJAw25kTFECQOztOv3C','哈哈哈','哈哈','1322456698',0,'df1399d2bb6a42c3bd9c6e687df7f869','10.7.89.222','2018-06-20 16:34:07',NULL,NULL,0,NULL);
COMMIT;

#
# Data for the `businesscoursetyperelation` table  (LIMIT 0,500)
#

INSERT INTO `businesscoursetyperelation` (`id`, `busid`, `coursetypeid`) VALUES 
  (1,1,1),
  (2,1,2),
  (3,1,3),
  (4,1,4);
COMMIT;

#
# Data for the `businessnotice` table  (LIMIT 0,500)
#

INSERT INTO `businessnotice` (`id`, `title`, `content`, `img`, `busid`, `createtime`) VALUES 
  (1,'0','HAHHA','',1,'2018-06-02 00:00:00'),
  (2,'0','正文内容','',1,'2018-06-01 00:00:00'),
  (3,'0','正文内容','',1,'2018-06-09 00:00:00'),
  (4,'0','ADS&nbsp;','',1,'2018-06-15 00:00:00'),
  (5,'0','正文内容','',1,'2018-06-02 00:00:00'),
  (6,'0','正文内容','20180602235015.jpg',1,'2018-06-02 00:00:00'),
  (7,'第一条公告','正文内容','20180603103726.jpg',1,'2018-06-03 00:00:00');
COMMIT;

#
# Data for the `businessrolerelation` table  (LIMIT 0,500)
#

INSERT INTO `businessrolerelation` (`id`, `busid`, `roleid`) VALUES 
  (1,1,3);
COMMIT;

#
# Data for the `businessvisitnumber` table  (LIMIT 0,500)
#

INSERT INTO `businessvisitnumber` (`id`, `visitnumber`, `date`, `busid`) VALUES 
  (1,15,'2018-06-06',1),
  (2,0,'2018-06-06',2),
  (3,0,'2018-06-06',3),
  (4,0,'2018-06-06',4),
  (5,56,'2018-06-07',1),
  (6,0,'2018-06-07',2),
  (7,0,'2018-06-07',3),
  (8,0,'2018-06-07',4),
  (9,2,'2018-06-08',1),
  (10,0,'2018-06-08',2),
  (11,0,'2018-06-08',3),
  (12,0,'2018-06-08',4),
  (13,0,'2018-06-09',1),
  (14,2,'2018-06-10',1),
  (15,0,'2018-06-11',1),
  (16,0,'2018-06-12',1),
  (17,5,'2018-06-13',1),
  (18,0,'2018-06-14',1),
  (19,0,'2018-06-15',1),
  (20,0,'2018-06-17',1),
  (21,0,'2018-06-18',1),
  (22,0,'2018-06-19',1),
  (23,0,'2018-06-20',1),
  (24,0,'2018-06-21',1),
  (25,0,'2018-06-21',2);
COMMIT;

#
# Data for the `calendar` table  (LIMIT 0,500)
#

INSERT INTO `calendar` (`id`, `name`, `startdate`, `enddate`) VALUES 
  (1,'四六级','2018-06-07','2018-06-09');
COMMIT;

#
# Data for the `chooseanswer` table  (LIMIT 0,500)
#

INSERT INTO `chooseanswer` (`id`, `questiondes`, `answer`) VALUES 
  (1,1,'考研'),
  (2,1,'四六级'),
  (3,2,'考研'),
  (4,2,'四六级'),
  (5,3,'面授'),
  (6,3,'网课'),
  (7,3,'家教');
COMMIT;

#
# Data for the `choosequestion` table  (LIMIT 0,500)
#

INSERT INTO `choosequestion` (`id`, `question`) VALUES 
  (1,'面授'),
  (2,'网课'),
  (3,'极简');
COMMIT;

#
# Data for the `collection` table  (LIMIT 0,500)
#

INSERT INTO `collection` (`id`, `userid`, `courseid`, `timestamp`) VALUES 
  (1,11,1,'2018-06-17 18:51:12'),
  (2,11,2,'2018-06-17 18:51:13'),
  (3,13,1,'2018-06-20 11:16:09');
COMMIT;

#
# Data for the `comment` table  (LIMIT 0,500)
#

INSERT INTO `comment` (`comid`, `username`, `articleid`, `comimg1`, `comimg2`, `comimg3`, `usericon`, `comments`, `userid`) VALUES 
  (1,'陈佳峰',1,NULL,NULL,NULL,'20180604111643.jpg','哈哈哈',1);
COMMIT;

#
# Data for the `course` table  (LIMIT 0,500)
#

INSERT INTO `course` (`courseId`, `coursename`, `description`, `coursestarttime`, `courseendtime`, `courseprice`, `busid`, `courseimg`, `hot`, `coursesold`, `state`, `address`, `period`) VALUES 
  (1,'考研英语','宇哥','2018-01-20','2018-06-30',7755,1,'course.jpg',1,50,1,NULL,800),
  (2,'考研数学','宇哥','2018-01-20','2018-09-20',88,1,'course.jpg',1,50,1,NULL,1200),
  (3,'考研政治','宇哥','2018-01-20','2018-09-20',56,1,'course.jpg',1,50,1,NULL,1500),
  (4,'张宇18讲','宇哥','2018-05-22','2018-09-20',2000,1,'20180531193936.jpg',0,0,0,NULL,1246),
  (5,'恋恋有词','恋恋有词恋恋有词恋恋有词恋恋有词','2018-06-14','2018-08-17',557,1,'20180614165841.jpg',0,0,0,NULL,456);
COMMIT;

#
# Data for the `coursebuscrelation` table  (LIMIT 0,500)
#

INSERT INTO `coursebuscrelation` (`id`, `courseid`, `buscourtypeid`) VALUES 
  (1,1,1),
  (2,2,1),
  (3,3,1),
  (4,4,3),
  (5,5,3);
COMMIT;

#
# Data for the `coursetype` table  (LIMIT 0,500)
#

INSERT INTO `coursetype` (`id`, `typename`, `typecreatetime`, `typecreator`) VALUES 
  (1,'考研','2018-01-20 14:32:56',1),
  (2,'面授','2018-05-20 04:54:56',1),
  (3,'视频','2018-05-30 05:45:46',1),
  (4,'资源','2018-05-30 05:45:45',1);
COMMIT;

#
# Data for the `coursetyperelation` table  (LIMIT 0,500)
#

INSERT INTO `coursetyperelation` (`id`, `courseid`, `coursetypeid`) VALUES 
  (1,1,1),
  (2,2,1),
  (3,3,1),
  (4,4,3),
  (5,3,4),
  (6,1,2),
  (7,1,3),
  (8,1,4),
  (9,5,3);
COMMIT;

#
# Data for the `label` table  (LIMIT 0,500)
#

INSERT INTO `label` (`id`, `img`, `name`) VALUES 
  (1,'label-1.jpg','a'),
  (2,'label-2.jpg','b'),
  (3,'label-3.jpg','c'),
  (4,'label-4.jpg','d'),
  (5,'label-5.jpg','e'),
  (6,'label-6.jpg','f'),
  (7,'label-7.jpg','g'),
  (8,'label-8.jpg','h');
COMMIT;

#
# Data for the `role` table  (LIMIT 0,500)
#

INSERT INTO `role` (`roleid`, `rolename`, `createTime`, `description`) VALUES 
  (1,'user','2018-05-28 09:45:55','普通用户'),
  (2,'superuser','2018-05-28 09:49:49','会员'),
  (3,'business','2018-05-28 09:47:45','普通商家'),
  (4,'manager','2018-05-28 09:46:45','后台管理员'),
  (5,'admin','2018-05-28 09:45:45','系统管理员权限');
COMMIT;

#
# Data for the `tag` table  (LIMIT 0,500)
#

INSERT INTO `tag` (`tagid`, `tagname`, `courseid`) VALUES 
  (1,'哈哈',0);
COMMIT;

#
# Data for the `torder` table  (LIMIT 0,500)
#

INSERT INTO `torder` (`id`, `userid`, `courseid`, `busid`, `reserveNum`, `price`, `orderstate`, `usernote`, `ordercreatetime`, `orderprocesstime`, `reservename`, `reserveTel`) VALUES 
  (1,3,1,1,108,837540.000,0,'你二大爷','2018-06-20 15:47:51',NULL,'你大爷','15732168350');
COMMIT;

#
# Data for the `user` table  (LIMIT 0,500)
#

INSERT INTO `user` (`userid`, `username`, `userpwd`, `useremail`, `usertel`, `useridnum`, `userip`, `userrealname`, `userdiscription`, `state`, `usericon`, `verifynum`, `salt`, `createtime`, `lastlogintime`, `logincount`, `logintime`, `lastloginip`, `useracount`, `gender`, `userlabel`) VALUES 
  (1,'陈佳峰','$2a$10$1TqJDZYIMy8OyDmldLKuNuZje7hPz.X6iEbKcKzWxFELgalUK1ASW','1623435443@qq.com',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,'我是大傻',1,'20180604111643.jpg','dc667c04d4a84fe29fd518ee1fc2e7d2','c5da1cd8dc17475a85db6b461f3e2421','2018-06-04 11:15:37','2018-06-20 10:54:09',321,'2018-06-21 09:14:18','0:0:0:0:0:0:0:1',NULL,'男','12345678'),
  (2,'阿斯顿','$2a$10$.N1gz9GJHG2pfJAzcgtU9uGbuLuWnYAeRJnWyumuuDoyR7C/r7aA.','949947078@qq.com','1562','','0:0:0:0:0:0:0:1',NULL,'阿斯顿',1,'20180524140700.jpg','4ea9770a3334450e982458e3bcf95723','a804436b202a42d39b6441f75d686330','2018-04-26 21:27:10','2018-05-27 15:39:54',196,'2018-05-27 15:47:40','0:0:0:0:0:0:0:1',NULL,'男',NULL),
  (3,'陈','$2a$10$IyFXa8hNNE01HXux1fO9UuSDdqCc8z51zRVKHGmZwBHwWtcbynO5O','2432027288@qq.com',NULL,NULL,'10.7.89.176',NULL,'啊哒哒哒',1,'20180620154844.jpg','c32518979c544625982cc0d5d34615a5','040d56e8b0dc405a86d654d1aabcfb58','2018-06-20 15:45:30',NULL,1,'2018-06-20 15:46:34','10.7.89.176',NULL,'男','12345678'),
  (4,'null','$2a$10$s3HiZ09k2jshq8xkxYHlpOENbDlq.JPPhKVPb7627tMd8BTZUSLuS','861797623@qq.com',NULL,NULL,'10.7.89.161',NULL,'四六级必过',1,NULL,'fc68d3d548a7429caaadc5eb6d791b2c','ddf6743b3c364cae863b94ef52452cab','2018-06-20 15:49:20',NULL,0,NULL,NULL,NULL,NULL,'12345678'),
  (5,'啦啦啦','$2a$10$.47SvQTYIUilbnvyqGSVlOtGSOvGgTdmxeln.Y/bYlV/rF6sLjj1a',NULL,'15732168396',NULL,'10.7.89.222',NULL,'啦啦啦啦啦啦',1,NULL,NULL,'aae5a1d625d94d7895390e4bc39b420a','2018-06-20 15:49:54','2018-06-20 16:25:14',5,'2018-06-20 16:26:00','10.7.89.222',NULL,'男','12345678'),
  (6,'zi','$2a$10$9aUQPzBl1qJarzt/T0/tguQIQjIJ90raJtxS.uj1GmmaJmqONnUOK',NULL,'18630016016',NULL,'10.7.89.161',NULL,'考研那些事',1,NULL,NULL,'e58587b532234b9fb69896eaefa699d0','2018-06-20 16:05:56','2018-06-20 16:08:14',2,'2018-06-20 16:29:55','10.7.89.161',NULL,'undefined',NULL);
COMMIT;

#
# Data for the `userrolerelation` table  (LIMIT 0,500)
#

INSERT INTO `userrolerelation` (`urrid`, `userid`, `roleid`) VALUES 
  (1,1,1),
  (2,3,1),
  (3,4,1),
  (4,5,1),
  (5,6,1);
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;