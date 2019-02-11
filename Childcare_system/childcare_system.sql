-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2019-02-11 06:14:27
-- 服务器版本： 10.1.36-MariaDB
-- PHP 版本： 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `childcare_system`
--

-- --------------------------------------------------------

--
-- 表的结构 `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `text` text NOT NULL,
  `time` datetime NOT NULL,
  `author` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `posts`
--

INSERT INTO `posts` (`id`, `name`, `text`, `time`, `author`) VALUES
(1, '标题1', '正文1', '2019-02-01 00:00:00', 'admin'),
(2, '标题2', '正文2', '2019-02-02 00:00:00', 'test'),
(3, '标题1', '正文1', '2019-02-05 14:00:02', 'admin'),
(4, '标题2', '正文2', '2019-02-14 00:00:33', 'test'),
(5, '标题2', '正文2', '2019-02-03 00:12:33', 'test');

-- --------------------------------------------------------

--
-- 表的结构 `repost`
--

CREATE TABLE `repost` (
  `id` int(11) NOT NULL,
  `repost_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `repost_user` varchar(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `repost`
--

INSERT INTO `repost` (`id`, `repost_id`, `text`, `repost_user`, `time`) VALUES
(1, 1, '回复1', 'test', '2019-02-01 00:00:00'),
(2, 2, '回复2', 'admin', '2019-02-03 00:00:00'),
(3, 2, '回复3', 'admin', '2019-02-03 00:00:01');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` int(5) NOT NULL COMMENT '两位数，前一位表示省市，后一位表示城市',
  `state` int(5) NOT NULL COMMENT '两位数，前一位表示状态，后一位表示状态时间',
  `per` int(2) NOT NULL DEFAULT '1' COMMENT '0为管理员，1为普通用户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `address`, `state`, `per`) VALUES
(1, 'admin', 'admin', 11, 11, 0),
(2, 'test', 'test', 22, 21, 1),
(3, 'root', 'root', 11, 11, 1);

--
-- 转储表的索引
--

--
-- 表的索引 `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `repost`
--
ALTER TABLE `repost`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `repost`
--
ALTER TABLE `repost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
