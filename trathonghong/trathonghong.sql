-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2012 at 11:22 PM
-- Server version: 5.1.61
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `thanhtungh_aa`
--

-- --------------------------------------------------------

--
-- Table structure for table `ahm_files`
--

CREATE TABLE `ahm_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` text NOT NULL,
  `file` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `download_count` int(11) NOT NULL,
  `access` enum('guest','member') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `show_counter` tinyint(1) NOT NULL,
  `quota` int(11) NOT NULL,
  `link_label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ahm_files`
--

INSERT INTO `ahm_files` VALUES(1, 'Download giá', '<p align=\\"justify\\"><strong>Xin chân thành cảm ơn Quý khách đã ghé thăm website của chúng tôi.</strong></p>\r\n<p align=\\"justify\\">Quý khách đang có nhu cầu gửi hàng hoá, tài liệu nhưng chưa dự kiến được mức cước, hãy truy cập vào mục \\"TÍNH GIÁ\\", nhập TP nơi có trụ sở công ty của Quý khách, nhập tỉnh, thành phố hoăc Quôc gia cần gửi đến, nhập khối lượng và chủng loại (hàng hoá hoặc tài liệu), chúng tôi sẽ cung cấp cho Quý khách cước phí Chuyển phát nhanh hàng hoá, tài liệu trong nước, Quốc tế một cách chính xác và tiện lợi!\r\nXin chân thành cảm ơn đã ghé thăm!\r\nHẹn gặp lại quý khách lần sau</p>\r\n<p align=\\"justify\\"><a href=\\"http://localhost/aaexpress/?attachment_id=856\\" rel=\\"attachment wp-att-856\\">Download bảng giá trong nước</a></p>\r\n<p align=\\"justify\\"><a href=\\"http://localhost/aaexpress/?attachment_id=857\\" rel=\\"attachment wp-att-857\\">Download bảng giá quốc tế</a></p>\r\n<p align=\\"justify\\"><a href=\\"http://localhost/aaexpress/?attachment_id=858\\" rel=\\"attachment wp-att-858\\">CauLongNew</a></p>\r\n<p align=\\"justify\\"></p>', 'N;', '', '', 1, 'guest', 0, 0, 'Download');

-- --------------------------------------------------------

--
-- Table structure for table `dang_ky_lien_he`
--

CREATE TABLE `dang_ky_lien_he` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ten_lien_he` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten_cong_ty` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dien_thoai` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noi_dung` text COLLATE utf8_unicode_ci,
  `ma_tinh_di` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_tinh_den` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `maketime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `dang_ky_lien_he`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_commentmeta`
--

CREATE TABLE `dev_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dev_commentmeta`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_comments`
--

CREATE TABLE `dev_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dev_comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_distance_order`
--

CREATE TABLE `dev_distance_order` (
  `ordid` int(11) NOT NULL AUTO_INCREMENT,
  `source_address` varchar(255) NOT NULL,
  `desti_address` varchar(255) NOT NULL,
  `total_distance` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_weight` int(11) NOT NULL,
  `total_price` decimal(20,2) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_or` datetime NOT NULL,
  `order_status` int(11) NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  PRIMARY KEY (`ordid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dev_distance_order`
--

INSERT INTO `dev_distance_order` VALUES(1, 'Ho chi minh', 'Can Tho', 0, 1, 100, 0.00, 0, '', '121212121', 'vdloi_it2k@yahoo.com.vn', '2012-06-24 16:42:36', 4, 'Basic service', '');

-- --------------------------------------------------------

--
-- Table structure for table `dev_dist_users`
--

CREATE TABLE `dev_dist_users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passw` varchar(255) NOT NULL,
  `phn` varchar(255) NOT NULL,
  `ccno` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_dist_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_dynamic_widgets`
--

CREATE TABLE `dev_dynamic_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `maintype` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `widget_id` (`widget_id`,`maintype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_dynamic_widgets`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_links`
--

CREATE TABLE `dev_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `dev_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_llm`
--

CREATE TABLE `dev_llm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `imagestype` varchar(255) DEFAULT NULL,
  `imagesfloat` varchar(255) DEFAULT NULL,
  `orderby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `dev_llm`
--

INSERT INTO `dev_llm` VALUES(1, 1, '', 'PEPSICO', 'http://www.', '_self', '1', '.jpg', 'left', 0);
INSERT INTO `dev_llm` VALUES(2, 1, '', 'VNPT', 'http://www.', '_self', '2', '.jpg', 'left', 0);
INSERT INTO `dev_llm` VALUES(3, 1, '', 'THEP VIET', 'http://www.', '_self', '3', '.jpg', 'left', 0);
INSERT INTO `dev_llm` VALUES(4, 1, '', 'ISUZU ', 'http://www.', '_self', '4', '.jpg', 'left', 0);
INSERT INTO `dev_llm` VALUES(5, 1, '', 'VIET NAM AIRLINE', 'http://www.', '_self', '5', '.jpg', 'left', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dev_my_calendar`
--

CREATE TABLE `dev_my_calendar` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_begin` date NOT NULL,
  `event_end` date NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_desc` text NOT NULL,
  `event_short` text NOT NULL,
  `event_open` int(3) DEFAULT '2',
  `event_time` time DEFAULT NULL,
  `event_endtime` time DEFAULT NULL,
  `event_recur` char(1) DEFAULT NULL,
  `event_repeats` int(3) DEFAULT NULL,
  `event_status` int(1) NOT NULL DEFAULT '1',
  `event_author` bigint(20) unsigned DEFAULT NULL,
  `event_host` bigint(20) unsigned DEFAULT NULL,
  `event_category` bigint(20) unsigned NOT NULL DEFAULT '1',
  `event_link` text,
  `event_link_expires` tinyint(1) NOT NULL,
  `event_label` varchar(60) NOT NULL,
  `event_street` varchar(60) NOT NULL,
  `event_street2` varchar(60) NOT NULL,
  `event_city` varchar(60) NOT NULL,
  `event_state` varchar(60) NOT NULL,
  `event_postcode` varchar(10) NOT NULL,
  `event_region` varchar(255) NOT NULL,
  `event_country` varchar(60) NOT NULL,
  `event_url` text,
  `event_longitude` float(10,6) NOT NULL DEFAULT '0.000000',
  `event_latitude` float(10,6) NOT NULL DEFAULT '0.000000',
  `event_zoom` int(2) NOT NULL DEFAULT '14',
  `event_phone` varchar(32) NOT NULL,
  `event_group` int(1) NOT NULL DEFAULT '0',
  `event_group_id` int(11) NOT NULL DEFAULT '0',
  `event_span` int(1) NOT NULL DEFAULT '0',
  `event_approved` int(1) NOT NULL DEFAULT '1',
  `event_flagged` int(1) NOT NULL DEFAULT '0',
  `event_holiday` int(1) NOT NULL DEFAULT '0',
  `event_fifth_week` int(1) NOT NULL DEFAULT '0',
  `event_image` text,
  `event_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`),
  KEY `event_recur` (`event_recur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_my_calendar`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_my_calendar_categories`
--

CREATE TABLE `dev_my_calendar_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_color` varchar(7) NOT NULL,
  `category_icon` varchar(128) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dev_my_calendar_categories`
--

INSERT INTO `dev_my_calendar_categories` VALUES(1, 'General', '#ffffff', 'event.png');

-- --------------------------------------------------------

--
-- Table structure for table `dev_my_calendar_locations`
--

CREATE TABLE `dev_my_calendar_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_label` varchar(60) NOT NULL,
  `location_street` varchar(60) NOT NULL,
  `location_street2` varchar(60) NOT NULL,
  `location_city` varchar(60) NOT NULL,
  `location_state` varchar(60) NOT NULL,
  `location_postcode` varchar(10) NOT NULL,
  `location_region` varchar(255) NOT NULL,
  `location_url` text,
  `location_country` varchar(60) NOT NULL,
  `location_longitude` float(10,6) NOT NULL DEFAULT '0.000000',
  `location_latitude` float(10,6) NOT NULL DEFAULT '0.000000',
  `location_zoom` int(2) NOT NULL DEFAULT '14',
  `location_phone` varchar(32) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_my_calendar_locations`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_options`
--

CREATE TABLE `dev_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24612 ;

--
-- Dumping data for table `dev_options`
--

INSERT INTO `dev_options` VALUES(1, 'siteurl', 'http://www.vnestore.com/aa', 'yes');
INSERT INTO `dev_options` VALUES(2, 'blogname', 'AA EXPRESS', 'yes');
INSERT INTO `dev_options` VALUES(3, 'blogdescription', 'Thương hiệu VIệt Nam - Dịch vụ toàn cầu', 'yes');
INSERT INTO `dev_options` VALUES(4, 'users_can_register', '0', 'yes');
INSERT INTO `dev_options` VALUES(5, 'admin_email', 'vdloi_it2k@yahoo.com.vn', 'yes');
INSERT INTO `dev_options` VALUES(6, 'start_of_week', '1', 'yes');
INSERT INTO `dev_options` VALUES(7, 'use_balanceTags', '0', 'yes');
INSERT INTO `dev_options` VALUES(8, 'use_smilies', '1', 'yes');
INSERT INTO `dev_options` VALUES(9, 'require_name_email', '1', 'yes');
INSERT INTO `dev_options` VALUES(10, 'comments_notify', '', 'yes');
INSERT INTO `dev_options` VALUES(11, 'posts_per_rss', '10', 'yes');
INSERT INTO `dev_options` VALUES(12, 'rss_use_excerpt', '0', 'yes');
INSERT INTO `dev_options` VALUES(13, 'mailserver_url', 'mail.example.com', 'yes');
INSERT INTO `dev_options` VALUES(14, 'mailserver_login', 'login@example.com', 'yes');
INSERT INTO `dev_options` VALUES(15, 'mailserver_pass', 'password', 'yes');
INSERT INTO `dev_options` VALUES(16, 'mailserver_port', '110', 'yes');
INSERT INTO `dev_options` VALUES(17, 'default_category', '1', 'yes');
INSERT INTO `dev_options` VALUES(18, 'default_comment_status', 'open', 'yes');
INSERT INTO `dev_options` VALUES(19, 'default_ping_status', 'open', 'yes');
INSERT INTO `dev_options` VALUES(20, 'default_pingback_flag', '1', 'yes');
INSERT INTO `dev_options` VALUES(21, 'default_post_edit_rows', '20', 'yes');
INSERT INTO `dev_options` VALUES(22, 'posts_per_page', '10', 'yes');
INSERT INTO `dev_options` VALUES(23, 'date_format', 'd/m/Y', 'yes');
INSERT INTO `dev_options` VALUES(24, 'time_format', 'H:i', 'yes');
INSERT INTO `dev_options` VALUES(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes');
INSERT INTO `dev_options` VALUES(26, 'links_recently_updated_prepend', '<em>', 'yes');
INSERT INTO `dev_options` VALUES(27, 'links_recently_updated_append', '</em>', 'yes');
INSERT INTO `dev_options` VALUES(28, 'links_recently_updated_time', '120', 'yes');
INSERT INTO `dev_options` VALUES(29, 'comment_moderation', '1', 'yes');
INSERT INTO `dev_options` VALUES(30, 'moderation_notify', '1', 'yes');
INSERT INTO `dev_options` VALUES(31, 'permalink_structure', '/%postname%/', 'yes');
INSERT INTO `dev_options` VALUES(32, 'gzipcompression', '0', 'yes');
INSERT INTO `dev_options` VALUES(33, 'hack_file', '0', 'yes');
INSERT INTO `dev_options` VALUES(34, 'blog_charset', 'UTF-8', 'yes');
INSERT INTO `dev_options` VALUES(35, 'moderation_keys', '', 'no');
INSERT INTO `dev_options` VALUES(36, 'active_plugins', 'a:11:{i:0;s:49:"custom-page-extensions/custom-page-extensions.php";i:1;s:27:"dang-ky-van-chuyen/main.php";i:2;s:25:"link-list-manager/llm.php";i:3;s:19:"ql_bill/ql_bill.php";i:4;s:32:"seo-crawlytics/seocrawlytics.php";i:5;s:37:"store-locator-le/store-locator-le.php";i:6;s:23:"view_bill/view_bill.php";i:7;s:33:"visits-counter/visits_counter.php";i:8;s:29:"wp-mail-smtp/wp_mail_smtp.php";i:9;s:21:"wp-polls/wp-polls.php";i:10;s:37:"yahoo-and-skype-status/yahooskype.php";}', 'yes');
INSERT INTO `dev_options` VALUES(19891, '_site_transient_browser_331cda868386a91045588d03edfedb1e', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"21.0.1180.79";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(37, 'home', 'http://www.vnestore.com/aa', 'yes');
INSERT INTO `dev_options` VALUES(38, 'category_base', '', 'yes');
INSERT INTO `dev_options` VALUES(39, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes');
INSERT INTO `dev_options` VALUES(40, 'advanced_edit', '0', 'yes');
INSERT INTO `dev_options` VALUES(41, 'comment_max_links', '2', 'yes');
INSERT INTO `dev_options` VALUES(42, 'gmt_offset', '', 'yes');
INSERT INTO `dev_options` VALUES(43, 'default_email_category', '1', 'yes');
INSERT INTO `dev_options` VALUES(44, 'recently_edited', 'a:5:{i:0;s:98:"/home/thanhtungh/domains/choviet247.com/public_html/aa/wp-content/plugins/ql_bill/EditableGrid.php";i:1;s:93:"/home/thanhtungh/domains/choviet247.com/public_html/aa/wp-content/plugins/ql_bill/ql_bill.php";i:2;s:93:"/home/thanhtungh/domains/choviet247.com/public_html/aa/wp-content/plugins/akismet/akismet.php";i:3;s:58:"C:\\AppServ\\www\\aaexpress/wp-content/themes/easel/style.css";i:4;s:81:"C:\\AppServ\\www\\aaexpress/wp-content/plugins/yahoo-and-skype-status/yahooskype.php";}', 'no');
INSERT INTO `dev_options` VALUES(45, 'template', 'easel', 'yes');
INSERT INTO `dev_options` VALUES(46, 'stylesheet', 'easel', 'yes');
INSERT INTO `dev_options` VALUES(47, 'comment_whitelist', '1', 'yes');
INSERT INTO `dev_options` VALUES(48, 'blacklist_keys', '', 'no');
INSERT INTO `dev_options` VALUES(49, 'comment_registration', '', 'yes');
INSERT INTO `dev_options` VALUES(50, 'html_type', 'text/html', 'yes');
INSERT INTO `dev_options` VALUES(51, 'use_trackback', '0', 'yes');
INSERT INTO `dev_options` VALUES(52, 'default_role', 'subscriber', 'yes');
INSERT INTO `dev_options` VALUES(53, 'db_version', '20596', 'yes');
INSERT INTO `dev_options` VALUES(54, 'uploads_use_yearmonth_folders', '1', 'yes');
INSERT INTO `dev_options` VALUES(55, 'upload_path', '', 'yes');
INSERT INTO `dev_options` VALUES(56, 'blog_public', '1', 'yes');
INSERT INTO `dev_options` VALUES(57, 'default_link_category', '2', 'yes');
INSERT INTO `dev_options` VALUES(58, 'show_on_front', 'posts', 'yes');
INSERT INTO `dev_options` VALUES(59, 'tag_base', '', 'yes');
INSERT INTO `dev_options` VALUES(60, 'show_avatars', '1', 'yes');
INSERT INTO `dev_options` VALUES(61, 'avatar_rating', 'G', 'yes');
INSERT INTO `dev_options` VALUES(62, 'upload_url_path', '', 'yes');
INSERT INTO `dev_options` VALUES(63, 'thumbnail_size_w', '150', 'yes');
INSERT INTO `dev_options` VALUES(64, 'thumbnail_size_h', '150', 'yes');
INSERT INTO `dev_options` VALUES(65, 'thumbnail_crop', '1', 'yes');
INSERT INTO `dev_options` VALUES(66, 'medium_size_w', '300', 'yes');
INSERT INTO `dev_options` VALUES(67, 'medium_size_h', '300', 'yes');
INSERT INTO `dev_options` VALUES(68, 'avatar_default', 'mystery', 'yes');
INSERT INTO `dev_options` VALUES(69, 'enable_app', '0', 'yes');
INSERT INTO `dev_options` VALUES(70, 'enable_xmlrpc', '0', 'yes');
INSERT INTO `dev_options` VALUES(71, 'large_size_w', '1024', 'yes');
INSERT INTO `dev_options` VALUES(72, 'large_size_h', '1024', 'yes');
INSERT INTO `dev_options` VALUES(73, 'image_default_link_type', '', 'yes');
INSERT INTO `dev_options` VALUES(74, 'image_default_size', '', 'yes');
INSERT INTO `dev_options` VALUES(75, 'image_default_align', '', 'yes');
INSERT INTO `dev_options` VALUES(76, 'close_comments_for_old_posts', '', 'yes');
INSERT INTO `dev_options` VALUES(77, 'close_comments_days_old', '14', 'yes');
INSERT INTO `dev_options` VALUES(78, 'thread_comments', '1', 'yes');
INSERT INTO `dev_options` VALUES(79, 'thread_comments_depth', '5', 'yes');
INSERT INTO `dev_options` VALUES(80, 'page_comments', '', 'yes');
INSERT INTO `dev_options` VALUES(81, 'comments_per_page', '50', 'yes');
INSERT INTO `dev_options` VALUES(82, 'default_comments_page', 'newest', 'yes');
INSERT INTO `dev_options` VALUES(83, 'comment_order', 'asc', 'yes');
INSERT INTO `dev_options` VALUES(84, 'sticky_posts', 'a:0:{}', 'yes');
INSERT INTO `dev_options` VALUES(85, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(86, 'widget_text', 'a:3:{i:2;a:3:{s:5:"title";s:4:"    ";s:4:"text";s:646:"<div  style="padding: 15px; 5px 5px 5px">\r\n<span style="color: #99cc00;">AA Express</span><span style="font-size: 14px;padding: 5px 0 0 5px;font-weight: normal;"> luôn có các chương trình khuyến mãi hấp dẫn dành cho quý khách hàng khi chọn tất cả các loại dịch vụ của chúng tôi.</span>\r\n\r\n<span style="font-size: 14px;padding: 5px 0 0 0px;font-weight: normal;">\r\nHãy liên hệ với chúng tôi để biết thêm thông tin chi tiết!\r\n</span>\r\n<br/>\r\n<span style="color: #DD0808; font-size: 17px">\r\nHOTLINE: \r\n&nbsp; Hà Nội: 0903 459555  &nbsp; - \r\n&nbsp; TP Hồ Chí Minh: 0945 792 868\r\n</span>\r\n</div>";s:6:"filter";b:0;}i:3;a:3:{s:5:"title";s:14:"Tra cứu giá";s:4:"text";s:2558:"<form action="" method="post" id="tinh_gia" name="myform">\r\n<div style="font-size: 14px; padding-left:10px">\r\n	Chọn dịch vụ\r\n	<br />\r\n	<select id="dich_vu" name="dich_vu" style="width: 210px" <!--onchange="Loadtinh()"-->></select>\r\n	<br />\r\n	Nơi nhận\r\n	<br />\r\n	<select id="noi_nhan" name="noi_nhan" style="width: 210px"></select>\r\n	<br />\r\n	Nơi giao\r\n	<br />\r\n	<select id="noi_giao" name="noi_giao" style="width: 210px"></select>\r\n	<br />\r\n	Trọng lượng\r\n	<br />\r\n	<input class="s-search" id="trong_luong" name="trong_luong" type="text" style="width: 100px" onKeyUp="javascript:checkNumber(this);"/>(gram)\r\n	<br />\r\n	<input type="submit" value=" Tính giá " />\r\n	<div id="message"></div>\r\n</div>\r\n</form>\r\n<script type="text/javascript">\r\njQuery(document).ready(function(){\r\n	var data1 = {\r\n		action: ''danh_sach_dich_vu'',\r\n	};\r\n	jQuery.post("http://www.vnestore.com/aa/wp-admin/admin-ajax.php", data1,function(response){\r\n		jQuery("#tinh_gia #dich_vu").html(response);\r\n		Loadtinhdi();\r\n		Loadtinhden();\r\n	});\r\n	jQuery("#tinh_gia").submit(function(){\r\n		jQuery("#tinh_gia #message").html("Đang tính...");\r\n		var data = {\r\n			action: ''tinh_gia'',\r\n			noi_nhan: jQuery("#noi_nhan").val(),\r\n			noi_giao: jQuery("#noi_giao").val(),\r\n			dich_vu: jQuery("#dich_vu").val(),\r\n			trong_luong: jQuery("#trong_luong").val(),\r\n		};\r\n		jQuery.post("http://www.vnestore.com/aa/wp-admin/admin-ajax.php", data,function(response){\r\n			jQuery("#tinh_gia #message").html(response);\r\n		});\r\n		return false;\r\n	})\r\n});\r\nfunction Loadtinh(){\r\n	Loadtinhdi();\r\n	Loadtinhden();\r\n}\r\nfunction Loadtinhdi(){\r\n	var data1 = {\r\n		action: ''danh_sach_tinh_di'',\r\n		dich_vu : jQuery("#dich_vu").val(),\r\n	};\r\n	jQuery.post("http://www.vnestore.com/aa/wp-admin/admin-ajax.php", data1,function(response){\r\n		jQuery("#tinh_gia #noi_nhan").html(response);\r\n	});\r\n}\r\nfunction Loadtinhden(){\r\n	var data1 = {\r\n		action: ''danh_sach_tinh_den'',\r\n		dich_vu : jQuery("#dich_vu").val(),\r\n	};\r\n	jQuery.post("http://www.vnestore.com/aa/wp-admin/admin-ajax.php", data1,function(response){\r\n		jQuery("#tinh_gia #noi_giao").html(response);\r\n	});\r\n}\r\nfunction CalcKeyCode(aChar) {\r\n	var character = aChar.substring(0,1);\r\n	var code = aChar.charCodeAt(0);\r\n	return code;\r\n}\r\nfunction checkNumber(val) {\r\n	var strPass = val.value;\r\n	var strLength = strPass.length;\r\n	var lchar = val.value.charAt((strLength) - 1);\r\n	var cCode = CalcKeyCode(lchar);\r\n	if (cCode < 48 || cCode > 57 ) {\r\n		var myNumber = val.value.substring(0, (strLength) - 1);\r\n		val.value = myNumber;\r\n	}\r\n	return false;\r\n}\r\n</script>";s:6:"filter";b:0;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(87, 'widget_rss', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(88, 'uninstall_plugins', 'a:2:{s:45:"pronamic-google-maps/pronamic-google-maps.php";s:9:"uninstall";s:31:"custom-tables/custom-tables.php";a:2:{i:0;s:17:"wuk_custom_tables";i:1;s:9:"uninstall";}}', 'no');
INSERT INTO `dev_options` VALUES(89, 'timezone_string', 'Asia/Ho_Chi_Minh', 'yes');
INSERT INTO `dev_options` VALUES(90, 'embed_autourls', '1', 'yes');
INSERT INTO `dev_options` VALUES(91, 'embed_size_w', '600', 'yes');
INSERT INTO `dev_options` VALUES(92, 'embed_size_h', '600', 'yes');
INSERT INTO `dev_options` VALUES(93, 'page_for_posts', '0', 'yes');
INSERT INTO `dev_options` VALUES(94, 'page_on_front', '0', 'yes');
INSERT INTO `dev_options` VALUES(95, 'default_post_format', '0', 'yes');
INSERT INTO `dev_options` VALUES(96, 'initial_db_version', '20596', 'yes');
INSERT INTO `dev_options` VALUES(97, 'dev_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:64:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:10:"manage_slp";b:1;s:12:"manage_polls";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes');
INSERT INTO `dev_options` VALUES(98, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(99, 'widget_recent-posts', 'a:2:{i:3;a:2:{s:5:"title";s:9:"Tin tức";s:6:"number";i:6;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(100, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(101, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(254, 'widget_pages', 'a:3:{i:2;a:3:{s:5:"title";s:0:"";s:6:"sortby";s:10:"post_title";s:7:"exclude";s:0:"";}i:3;a:3:{s:5:"title";s:23:"Thông tin cần biết";s:6:"sortby";s:10:"post_title";s:7:"exclude";s:41:"79,812,112,22,117,807,835,837,839,852,859";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(102, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(103, 'sidebars_widgets', 'a:10:{s:19:"wp_inactive_widgets";a:0:{}s:20:"sidebar-left-sidebar";a:3:{i:0;s:6:"text-3";i:1;s:20:"yahoo_skype_status-3";i:2;s:12:"llm_widget-3";}s:21:"sidebar-right-sidebar";a:5:{i:0;s:28:"easel_control_panel_widget-2";i:1;s:7:"pages-3";i:2;s:14:"recent-posts-3";i:3;s:14:"polls-widget-2";i:4;s:21:"visits counter widget";}s:20:"sidebar-above-header";a:0:{}s:14:"sidebar-header";a:0:{}s:15:"sidebar-menubar";a:0:{}s:17:"sidebar-over-blog";a:0:{}s:18:"sidebar-under-blog";a:0:{}s:14:"sidebar-footer";a:1:{i:0;s:6:"text-2";}s:13:"array_version";i:3;}', 'yes');
INSERT INTO `dev_options` VALUES(104, 'cron', 'a:6:{i:1347900341;a:1:{s:10:"polls_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1347903301;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1347903991;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1347904669;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1347926400;a:1:{s:22:"bota_send_daily_report";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes');
INSERT INTO `dev_options` VALUES(466, '_site_transient_timeout_browser_abc78f4978b50bec93d8161882b1197a', '1341167759', 'yes');
INSERT INTO `dev_options` VALUES(106, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:1:{i:0;O:8:"stdClass":9:{s:8:"response";s:7:"upgrade";s:8:"download";s:40:"http://wordpress.org/wordpress-3.4.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":4:{s:4:"full";s:40:"http://wordpress.org/wordpress-3.4.2.zip";s:10:"no_content";s:51:"http://wordpress.org/wordpress-3.4.2-no-content.zip";s:11:"new_bundled";s:52:"http://wordpress.org/wordpress-3.4.2-new-bundled.zip";s:7:"partial";s:50:"http://wordpress.org/wordpress-3.4.2-partial-0.zip";}s:7:"current";s:5:"3.4.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.2";s:15:"partial_version";s:3:"3.4";}}s:12:"last_checked";i:1347866175;s:15:"version_checked";s:3:"3.4";}', 'yes');
INSERT INTO `dev_options` VALUES(24399, '_site_transient_timeout_theme_roots', '1347867988', 'yes');
INSERT INTO `dev_options` VALUES(24400, '_site_transient_theme_roots', 'a:4:{s:10:"aa-express";s:7:"/themes";s:5:"easel";s:7:"/themes";s:12:"twentyeleven";s:7:"/themes";s:9:"twentyten";s:7:"/themes";}', 'yes');
INSERT INTO `dev_options` VALUES(202, '_site_transient_update_themes', 'O:8:"stdClass":3:{s:12:"last_checked";i:1347848898;s:7:"checked";a:4:{s:10:"aa-express";s:1:"1";s:5:"easel";s:0:"";s:12:"twentyeleven";s:3:"1.4";s:9:"twentyten";s:3:"1.4";}s:8:"response";a:0:{}}', 'yes');
INSERT INTO `dev_options` VALUES(467, '_site_transient_browser_abc78f4978b50bec93d8161882b1197a', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"19.0.1084.56";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(113, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:26:"http://www.vnestore.com/aa";s:4:"link";s:102:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://www.vnestore.com/aa/";s:3:"url";s:135:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost/wordpress/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:14:"WordPress Blog";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:20:"Other WordPress News";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes');
INSERT INTO `dev_options` VALUES(257, 'widget_easel_control_panel_widget', 'a:2:{i:2;a:1:{s:5:"title";s:13:"Đăng nhập";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(256, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(203, 'current_theme', 'Easel', 'yes');
INSERT INTO `dev_options` VALUES(204, 'theme_mods_easel', 'a:7:{i:0;b:0;s:16:"background_color";s:3:"FFF";s:16:"background_image";s:0:"";s:17:"background_repeat";s:6:"repeat";s:21:"background_position_x";s:4:"left";s:21:"background_attachment";s:5:"fixed";s:18:"nav_menu_locations";a:2:{s:7:"Primary";i:7;s:6:"Footer";i:7;}}', 'yes');
INSERT INTO `dev_options` VALUES(205, 'theme_switched', '', 'yes');
INSERT INTO `dev_options` VALUES(206, 'easel-options', 'a:50:{s:24:"disable_jquery_menu_code";b:0;s:21:"disable_scroll_to_top";b:1;s:19:"enable_avatar_trick";b:0;s:22:"disable_default_design";b:0;s:20:"disable_comment_note";b:1;s:26:"enable_numbered_pagination";b:1;s:26:"disable_comment_javascript";b:1;s:25:"enable_post_thumbnail_rss";b:0;s:19:"disable_page_titles";b:0;s:19:"disable_post_titles";b:0;s:20:"enable_post_calendar";b:1;s:27:"enable_post_author_gravatar";b:0;s:27:"disable_categories_in_posts";b:0;s:21:"disable_tags_in_posts";b:0;s:28:"disable_author_info_in_posts";b:1;s:26:"disable_date_info_in_posts";b:1;s:15:"home_post_count";s:1:"0";s:19:"disable_footer_text";b:1;s:23:"disable_default_menubar";b:0;s:24:"enable_search_in_menubar";b:1;s:21:"enable_rss_in_menubar";b:1;s:16:"avatar_directory";s:4:"none";s:24:"enable_debug_footer_code";b:0;s:24:"disable_blog_on_homepage";b:0;s:27:"enable_comments_on_homepage";b:1;s:24:"enable_addon_membersonly";b:0;s:19:"non_members_message";s:35:"There is members only content here.";s:21:"enable_addon_showcase";b:0;s:23:"enable_addon_playingnow";b:0;s:28:"enable_addon_showcase_slider";b:0;s:22:"enable_addon_commpress";b:0;s:25:"enable_addon_page_options";b:0;s:25:"custom_image_header_width";s:4:"1250";s:26:"custom_image_header_height";s:3:"100";s:14:"copyright_name";s:14:"AA-Express.net";s:13:"copyright_url";s:14:"AA-Express.net";s:23:"facebook_like_blog_post";b:0;s:13:"facebook_meta";b:0;s:24:"display_archive_as_links";b:0;s:21:"archive_display_order";s:3:"asc";s:6:"layout";s:2:"3c";s:33:"enable_wprewrite_posttype_control";b:0;s:29:"force_active_connection_close";b:0;s:25:"enable_addon_easel_slider";b:1;s:20:"menubar_social_icons";b:0;s:22:"menubar_social_twitter";s:0:"";s:23:"menubar_social_facebook";s:0:"";s:18:"enable_breadcrumbs";b:0;s:29:"excerpt_or_content_in_archive";s:7:"excerpt";s:18:"enable_sidebar_css";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(253, 'widget_easel_google_translate_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(258, 'widget_links', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(347, 'js_height', '220', 'yes');
INSERT INTO `dev_options` VALUES(348, 'js_pause', 'true', 'yes');
INSERT INTO `dev_options` VALUES(349, 'js_paging', 'true', 'yes');
INSERT INTO `dev_options` VALUES(350, 'js_nav', 'true', 'yes');
INSERT INTO `dev_options` VALUES(356, 'Pronamic_Google_maps', 'a:2:{s:9:"installed";b:1;s:6:"active";a:3:{s:4:"post";b:1;s:4:"page";b:1;s:5:"slide";b:1;}}', 'yes');
INSERT INTO `dev_options` VALUES(357, 'widget_pronamic_google_maps', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(377, 'vs_startTimeFormat', 'd-m-y H:s', 'yes');
INSERT INTO `dev_options` VALUES(378, 'vs_disconnectTime', '300', 'yes');
INSERT INTO `dev_options` VALUES(379, 'vs_countBots', '0', 'yes');
INSERT INTO `dev_options` VALUES(380, 'vs_countAdmins', '1', 'yes');
INSERT INTO `dev_options` VALUES(374, 'vs_online_offset', '100', 'yes');
INSERT INTO `dev_options` VALUES(375, 'vs_overall_offset', '10000', 'yes');
INSERT INTO `dev_options` VALUES(376, 'vs_startUnixTimeStamp', '1340517600', 'yes');
INSERT INTO `dev_options` VALUES(365, 'wpcf7', 'a:1:{s:7:"version";s:3:"3.2";}', 'yes');
INSERT INTO `dev_options` VALUES(381, 'vs_displayTotal', '1', 'yes');
INSERT INTO `dev_options` VALUES(382, 'vs_displayCurrent', '1', 'yes');
INSERT INTO `dev_options` VALUES(383, 'vs_displayDaily', '0', 'yes');
INSERT INTO `dev_options` VALUES(384, 'vs_displayWeekly', '0', 'yes');
INSERT INTO `dev_options` VALUES(120, 'can_compress_scripts', '1', 'yes');
INSERT INTO `dev_options` VALUES(327, 'category_children', 'a:0:{}', 'yes');
INSERT INTO `dev_options` VALUES(255, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(320, 'widget_easel_menubar_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(336, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(346, 'js_width', '550', 'yes');
INSERT INTO `dev_options` VALUES(344, 'slideshow-feedback-date', '2012-06-23', 'yes');
INSERT INTO `dev_options` VALUES(595, '_transient_timeout_feed_e994f598c7847647365916776b4357f1', '1340684226', 'no');
INSERT INTO `dev_options` VALUES(596, '_transient_feed_e994f598c7847647365916776b4357f1', 'a:3:{s:3:"url";s:39:"http://localhost/aaexpress/?page_id=117";s:8:"feed_url";s:37:"http://localhost/aaexpress/?feed=rss2";s:5:"build";s:14:"20111015034325";}', 'no');
INSERT INTO `dev_options` VALUES(597, '_transient_timeout_feed_mod_e994f598c7847647365916776b4357f1', '1340684226', 'no');
INSERT INTO `dev_options` VALUES(598, '_transient_feed_mod_e994f598c7847647365916776b4357f1', '1340641026', 'no');
INSERT INTO `dev_options` VALUES(599, '_transient_timeout_feed_bde80489bfeb2aa79c1c4ac365c66bb2', '1340684226', 'no');
INSERT INTO `dev_options` VALUES(600, '_transient_feed_bde80489bfeb2aa79c1c4ac365c66bb2', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:29:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"AA EXPRESS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:26:"http://localhost/aaexpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:52:"Thương hiệu VIệt Nam - Dịch vụ toàn cầu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 24 Jun 2012 18:57:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:27:"http://wordpress.org/?v=3.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:3:{i:0;a:6:{s:4:"data";s:41:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:38:"Phạt 5 doanh nghiệp chuyển phát";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:32:"http://localhost/aaexpress/?p=63";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:41:"http://localhost/aaexpress/?p=63#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 23 Jun 2012 17:49:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:9:"Tin tức";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://localhost/aaexpress/?p=63";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:336:"ICTnews - Thanh tra Bộ TT&#38;TT đã kiến nghị Chánh thanh tra Bộ xử phạt 5 doanh nghiệp chuyển phát với tổng số tiền 49 triệu đồng. Đây là kiến nghị của Đoàn thanh tra sau khi làm việc tại 3 [&#8230;] <a class="more-link" href="http://localhost/aaexpress/?p=63">&#8595; Xem thêm...</a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"admin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2412:"<table>\n<tbody>\n<tr>\n<td valign="top">\n<div align="justify"><em>ICTnews -</em> Thanh tra Bộ TT&amp;TT đã kiến nghị Chánh thanh tra Bộ xử phạt 5 doanh nghiệp chuyển phát với tổng số tiền 49 triệu đồng.</div>\n<div align="justify">Đây là kiến nghị của Đoàn thanh tra sau khi làm việc tại 3 tỉnh: Thừa Thiên Huế, Đà Nẵng và Quảng Ngãi trong thời gian từ ngày 15/7 đến 1/8/2008.</div>\n<div align="justify">Cụ thể, phạt Công ty cổ phần Tín Thành 9 triệu đồng vì tính cước sai với giá cước do công ty ban hành và sử dụng cân đã quá thời hạn kiểm định; công ty cổ phần Hợp Nhất miền Trung bị phạt 10 triệu đồng vì thu cước dịch vụ chuyển phát thư thấp hơn quy định trong giấy phép kinh doanh dịch vụ và thu cước sai so với bảng cước công ty ban hành. Ba công ty: Cổ phần Thương mại chuyển phát nhanh EPS, Cổ phần chuyển phát nhanh T.I.M (tại Đà Nẵng), Cổ phần thương mại và xuất nhập khẩu An Dương (tại Thừa Thiên Huế) mỗi công ty bị phạt 10 triệu đồng vì cung cấp dịch vụ chuyển phát thư không phép, đồng thời Thanh tra Bộ cũng đề nghị buộc dừng cung cấp dịch vụ đối với 3 doanh nghiệp này vì chưa có giấy phép kinh doanh dịch vụ chuyển phát thư.</div>\n<div align="justify">\n<div align="justify">\n<p>Thanh tra Bộ cho biết, một số doanh nghiệp khác có vi phạm ở mức độ nhẹ hơn đã được đoàn thanh tra xử lý bằng hình thức cảnh cáo, hoặc nhắc nhở phải tuân thủ đúng quy định của Chính phủ, của Bộ TT&amp;TT về kinh doanh dịch vụ chuyển phát.</p>\n<p>Các doanh nghiệp như Viettel, Sai Gon Postel, Netco, Tân Sơn Nhất tại 3 tỉnh, thành phố trên đã thực hiện tốt các quy định tại Nghị định 128/2007/NĐ-CP của Chính phủ về dịch vụ chuyển phát, ban hành bảng giá cước đúng quy định, tính cước đúng so với bảng cước ban hành, thực hiện tốt việc phát hàng chiều đến, bảo đảm an toàn, phát hết sản phẩm trong ngày, chế độ báo cáo chặt chẽ, có biện pháp quản lý chất lượng tốt.</p>\n</div>\n</div>\n</td>\n</tr>\n</tbody>\n</table>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:42:"http://localhost/aaexpress/?feed=rss2&p=63";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:41:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Hôm nay tao không đi chợ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:32:"http://localhost/aaexpress/?p=56";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:41:"http://localhost/aaexpress/?p=56#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 23 Jun 2012 16:08:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:9:"Tin tức";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://localhost/aaexpress/?p=56";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Thằng Lợi nó cũng làm biếng không chịu đi luôn Thế là đi nhậu tốn hết 190k";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"admin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:113:"<p>Thằng Lợi nó cũng làm biếng không chịu đi luôn</p>\n<p>Thế là đi nhậu tốn hết 190k</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:42:"http://localhost/aaexpress/?feed=rss2&p=56";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:41:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"Kiến thức";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:31:"http://localhost/aaexpress/?p=1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:40:"http://localhost/aaexpress/?p=1#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 17 Jun 2012 17:34:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:9:"Tin tức";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"http://localhost/wordpress/?p=1";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:323:"Là dịch vụ vận chuyển thư từ, hàng hóa trong nước từ TP HCM hoặc TP Hà Nội đi tất cả các 64 tỉnh thành trong cả nước. Dịch vụ này có thời gian quy định cụ thể 6h-&#62;72h tùy [&#8230;] <a class="more-link" href="http://localhost/aaexpress/?p=1">&#8595; Xem thêm...</a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"admin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2778:"<table width="561" border="0" cellspacing="0" cellpadding="0">\n<tbody>\n<tr>\n<td valign="top">Là dịch vụ vận chuyển thư từ, hàng hóa trong nước từ TP HCM hoặc TP Hà Nội đi tất cả các 64 tỉnh thành trong cả nước.<br />\nDịch vụ này có thời gian quy định cụ thể 6h-&gt;72h tùy theo khu vực phát.</td>\n<td width="30"><img src="http://www.aa-express.net/images/stories/fan2011990.jpg" alt="" width="150" height="116" border="0" /></td>\n<td></td>\n</tr>\n<tr>\n<td valign="top">&nbsp;</p>\n<p>Dịch vụ phát trước 9h sáng</p>\n<p>Là dịch vụ rất tiện lợi khi khách hàng gửi tài liệu hàng hóa trước 17h mà yêu cầu A&amp;A phát trước 9h sáng hôm sau áp dụng trung tâm các tỉnh như: Hà Nội, Đà Nẵng, Cần Thơ, Nha Trang (Dịch vụ này có cộng thêm phí).</td>\n<td width="30"><img src="http://www.aa-express.net/images/stories/A350.jpg" alt="" width="150" height="100" align="left" border="0" /></td>\n<td></td>\n</tr>\n<tr>\n<td valign="top">Dịch vụ điện hoa</p>\n<p><strong>K</strong>hi khách hàng cần tặng hoa, quà đến người thân, cơ quan tổ chức, hội nghị liên hoan, khai trương, ma chay &#8230; A&amp;A sẽ phục vụ Quý Khách được nhu cầu này.</td>\n<td width="30"><img src="http://www.aa-express.net/images/stories/bld009124.jpg" alt="" width="150" height="100" border="0" /></td>\n<td></td>\n</tr>\n<tr>\n<td valign="top">Dịch vụ chuyển phát nhanh hỏa tốc. (Phát trong ngày)</p>\n<p>Đây là dịch vụ mà khi khách hàng có nhu cầu chuyển gấp tài liệu, hàng hóa, hồ sơ đi từ <strong>TP HCM</strong> đi <strong>TP Hà Nội</strong>, <strong>Đà Nẵng</strong>,<strong>Hải Phòng</strong>, <strong>Hà Đông</strong>, <strong>Cần Thơ</strong>, <strong>Vũng Tàu</strong> &#8230; để đến được trong ngày quý khách vui lòng sử dụng dịch vụ phát trong ngày (PTN).<br />\nThời gian nhận hàng trước <strong>11h30</strong> thời gian phát hàng muộn nhất là <strong>19h30</strong> cùng ngày. (Dịch vụ này có cộng thêm cước phí).</td>\n<td width="30"> <img src="http://www.aa-express.net/images/stories/ddl_67a_7162.jpg" alt="" width="150" height="112" border="0" /></td>\n<td></td>\n</tr>\n<tr>\n<td colspan="3" valign="top" width="561">Dịch vụ vận chuyển hàng bằng đường bộ</p>\n<p>Khi khách hàng có hàng chuyển đi mà không cần nhanh thì quý khách vui lòng sử dụng dịch vụ này. Dịch vụ này sẻ tiết kiệm được đáng kể chi phí của khách hàng. Nhưng thời gian giao hàng chậm hơn so với dịch vụ chuyển phát nhanh là 3-4 ngày.</td>\n</tr>\n</tbody>\n</table>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:41:"http://localhost/aaexpress/?feed=rss2&p=1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:37:"http://localhost/aaexpress/?feed=rss2";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:8:{s:4:"date";s:29:"Mon, 25 Jun 2012 16:17:04 GMT";s:6:"server";s:30:"Apache/2.2.8 (Win32) PHP/5.2.6";s:12:"x-powered-by";s:9:"PHP/5.2.6";s:10:"x-pingback";s:37:"http://localhost/aaexpress/xmlrpc.php";s:13:"last-modified";s:29:"Sun, 24 Jun 2012 18:57:55 GMT";s:4:"etag";s:34:""e0e1221e75328e414904dadcf1dc5073"";s:10:"connection";s:5:"close";s:12:"content-type";s:23:"text/xml; charset=UTF-8";}s:5:"build";s:14:"20111015034325";}', 'no');
INSERT INTO `dev_options` VALUES(911, 'wuk_custom_tables', 'a:29:{s:9:"dbversion";s:10:"2012122305";s:13:"wct_cachetime";s:5:"21600";s:7:"role_ct";s:13:"administrator";s:8:"role_css";s:13:"administrator";s:12:"role_archive";s:13:"administrator";s:12:"role_cronjob";s:13:"administrator";s:9:"role_form";s:13:"administrator";s:11:"role_backup";s:13:"administrator";s:12:"wct_immaster";s:2:"no";s:3:"css";s:788:".wct-overlay {\n	padding: 5px;\n	background-color: white;\n	border: 1px black solid;\n	top: 1px;\n	left: 1px;\n	visibility: hidden;\n	overflow: hidden;\n	display:none;\n	max-width: 300px;\n}\n.wct-td1 {\n	background-color: #808080;\n}\n.wct-td2 {\n	background-color: transparent;\n}\n.wct-td-hover {\n	background-color: #DBD8FE;\n}\n.wct-sortdown {\n	margin: 0px 1px 0px 0px !important;\n}\n.wct-sortup {\n	margin: 0px 0px 0px 1px !important;\n}\n.wct-table {\n	width: 100% !important;\n}\n.wct-search {\n	width: 300px !important;\n}\n.wct-errorfield {\n	border-right: 0px !important;\n	border-bottom: 0px !important;\n	border-left: 0px !important;\n}\n.wctarchiveheader {\n	font-weight: bold !important;\n}\n.wctarchiveul {\n}\n.wctarchiveli {\n	line-height: 1.1em !important;\n}\n.wctarchivea {\n	text-decoration: none !important;\n}";s:11:"form_serial";s:0:"";s:13:"form_serialvu";s:1:"0";s:9:"installed";i:1343062390;s:5:"nhide";s:0:"";s:8:"role_tab";s:11:"contributor";s:15:"hidepagenumbers";s:1:"0";s:8:"hideedit";s:1:"0";s:18:"wct_unfilteredhtml";s:1:"0";s:17:"wct_unfilteredsql";s:1:"0";s:14:"nice_setfields";s:1:"0";s:8:"crole0_s";N;s:8:"crole0_c";N;s:8:"crole0_i";N;s:8:"crole1_s";s:13:"administrator";s:8:"crole1_c";s:13:"administrator";s:8:"crole1_i";s:13:"administrator";s:8:"crole3_s";s:13:"administrator";s:8:"crole3_c";s:11:"contributor";s:8:"crole3_i";s:6:"editor";}', 'yes');
INSERT INTO `dev_options` VALUES(3113, 'PopUpFad_On_Archives', 'NO', 'yes');
INSERT INTO `dev_options` VALUES(915, 'custom_page_extensions_options', 'a:2:{s:12:"random-value";s:5:"42853";s:9:"extension";s:4:"html";}', 'yes');
INSERT INTO `dev_options` VALUES(24611, 'rewrite_rules', 'a:66:{s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:29:"comments/page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:32:".?.+?.html/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:".?.+?.html/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:62:".?.+?.html/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:".?.+?.html/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:".?.+?.html/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:25:"(.?.+?).html/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:45:"(.?.+?).html/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:40:"(.?.+?).html/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:33:"(.?.+?).html/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:40:"(.?.+?).html/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:25:"(.?.+?).html(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes');
INSERT INTO `dev_options` VALUES(23093, '_site_transient_update_plugins', 'O:8:"stdClass":2:{s:12:"last_checked";i:1347880226;s:8:"response";a:3:{s:36:"contact-form-7/wp-contact-form-7.php";O:8:"stdClass":5:{s:2:"id";s:3:"790";s:4:"slug";s:14:"contact-form-7";s:11:"new_version";s:5:"3.2.1";s:3:"url";s:51:"http://wordpress.org/extend/plugins/contact-form-7/";s:7:"package";s:62:"http://downloads.wordpress.org/plugin/contact-form-7.3.2.1.zip";}s:37:"store-locator-le/store-locator-le.php";O:8:"stdClass":5:{s:2:"id";s:5:"22575";s:4:"slug";s:16:"store-locator-le";s:11:"new_version";s:3:"3.2";s:3:"url";s:53:"http://wordpress.org/extend/plugins/store-locator-le/";s:7:"package";s:62:"http://downloads.wordpress.org/plugin/store-locator-le.3.2.zip";}s:33:"visits-counter/visits_counter.php";O:8:"stdClass":5:{s:2:"id";s:5:"28064";s:4:"slug";s:14:"visits-counter";s:11:"new_version";s:5:"1.4.2";s:3:"url";s:51:"http://wordpress.org/extend/plugins/visits-counter/";s:7:"package";s:62:"http://downloads.wordpress.org/plugin/visits-counter.1.4.2.zip";}}}', 'yes');
INSERT INTO `dev_options` VALUES(9172, 'wpdm_access_level', 'administrator', 'yes');
INSERT INTO `dev_options` VALUES(772, '_transient_timeout_feed_mod_0cdc4dea8447164f1d037ad5f1bdb33c', '1342936626', 'no');
INSERT INTO `dev_options` VALUES(773, '_transient_feed_mod_0cdc4dea8447164f1d037ad5f1bdb33c', '1342893426', 'no');
INSERT INTO `dev_options` VALUES(776, 'ma_options', 'a:162:{s:11:"mantra_side";s:4:"3cSs";s:16:"mantra_dimselect";s:8:"Absolute";s:16:"mantra_sidewidth";s:3:"660";s:14:"mantra_sidebar";s:3:"440";s:19:"mantra_sidewidthRel";s:2:"59";s:17:"mantra_sidebarRel";s:2:"22";s:14:"mantra_hheight";i:60;s:16:"mantra_frontpage";s:7:"Disable";s:20:"mantra_fpsliderwidth";i:800;s:21:"mantra_fpsliderheight";i:250;s:19:"mantra_fpslideranim";s:6:"random";s:19:"mantra_fpslidertime";s:3:"750";s:20:"mantra_fpsliderpause";s:4:"5000";s:18:"mantra_fpslidernav";s:7:"Bullets";s:21:"mantra_fpsliderarrows";s:16:"Visible on Hover";s:16:"mantra_slideType";s:13:"Custom Slides";s:20:"mantra_slideSpecific";s:0:"";s:17:"mantra_slideCateg";s:0:"";s:18:"mantra_slideNumber";i:5;s:17:"mantra_sliderimg1";s:83:"http://localhost/aaexpress/wp-content/themes/mantra/images/slider/mantra-slide1.jpg";s:19:"mantra_slidertitle1";s:28:"This is your caption''s title";s:18:"mantra_slidertext1";s:164:"And this is the text that could accompany it. It is all optional so if you delete it in the Mantra Settings there will be no more caption with the black background.";s:18:"mantra_sliderlink1";s:0:"";s:17:"mantra_sliderimg2";s:83:"http://localhost/aaexpress/wp-content/themes/mantra/images/slider/mantra-slide2.jpg";s:19:"mantra_slidertitle2";s:25:"This is yet another title";s:18:"mantra_slidertext2";s:151:"And some more text to give you as an example. You can use <a href=''http://www.riotreaction.com''>links</a> and other type of <b>HTML</b> <i>formats</i>.";s:18:"mantra_sliderlink2";s:0:"";s:17:"mantra_sliderimg3";s:0:"";s:19:"mantra_slidertitle3";s:0:"";s:18:"mantra_slidertext3";s:0:"";s:18:"mantra_sliderlink3";s:0:"";s:17:"mantra_sliderimg4";s:0:"";s:19:"mantra_slidertitle4";s:0:"";s:18:"mantra_slidertext4";s:0:"";s:18:"mantra_sliderlink4";s:0:"";s:17:"mantra_sliderimg5";s:0:"";s:19:"mantra_slidertitle5";s:0:"";s:18:"mantra_slidertext5";s:0:"";s:18:"mantra_sliderlink5";s:0:"";s:16:"mantra_nrcolumns";s:1:"4";s:21:"mantra_colimageheight";i:120;s:21:"mantra_columnreadmore";s:9:"Read more";s:17:"mantra_columnimg1";s:83:"http://localhost/aaexpress/wp-content/themes/mantra/images/slider/mantra-column.jpg";s:19:"mantra_columntitle1";s:9:"Hi there!";s:18:"mantra_columntext1";s:212:"You can also have some text here. Just like with the slider, it''s all optional (including the title and the link inputs). All you need is an image, unless you want the Mantra image above to follow you everywhere.";s:18:"mantra_columnlink1";s:0:"";s:17:"mantra_columnimg2";s:83:"http://localhost/aaexpress/wp-content/themes/mantra/images/slider/mantra-column.jpg";s:19:"mantra_columntitle2";s:10:" HTML tags";s:18:"mantra_columntext2";s:120:"You can also have <a href=''http://www.riotreactions.com''>links</a> here as well as all other <strong>HTML tags</strong>.";s:18:"mantra_columnlink2";s:0:"";s:17:"mantra_columnimg3";s:83:"http://localhost/aaexpress/wp-content/themes/mantra/images/slider/mantra-column.jpg";s:19:"mantra_columntitle3";s:0:"";s:18:"mantra_columntext3";s:0:"";s:18:"mantra_columnlink3";s:0:"";s:17:"mantra_columnimg4";s:83:"http://localhost/aaexpress/wp-content/themes/mantra/images/slider/mantra-column.jpg";s:19:"mantra_columntitle4";s:0:"";s:18:"mantra_columntext4";s:0:"";s:18:"mantra_columnlink4";s:0:"";s:17:"mantra_fronttext1";s:20:"This could be a tile";s:17:"mantra_fronttext2";s:20:"And this another one";s:22:"mantra_fronttitlecolor";s:7:"#333333";s:17:"mantra_fronttext3";s:289:"And here you could have a whole lot of text. Or not. It''s all up to you. Deleting all text inside the appropriate input in the Mantra Settings will remove this whole text zone. It can also contain all HTML tags.<br /> Just try everything out and see what suits you. Have fun and good luck!";s:17:"mantra_fronttext4";s:0:"";s:17:"mantra_fontfamily";s:27:"Segoe UI, Arial, sans-serif";s:17:"mantra_googlefont";s:0:"";s:15:"mantra_fontsize";s:4:"14px";s:16:"mantra_fonttitle";s:7:"Default";s:22:"mantra_googlefonttitle";s:0:"";s:19:"mantra_headfontsize";s:7:"Default";s:15:"mantra_fontside";s:7:"Default";s:21:"mantra_googlefontside";s:0:"";s:19:"mantra_sidefontsize";s:7:"Default";s:20:"mantra_fontsubheader";s:7:"Default";s:26:"mantra_googlefontsubheader";s:0:"";s:16:"mantra_textalign";s:7:"Default";s:16:"mantra_parindent";s:3:"0px";s:19:"mantra_headerindent";s:6:"Enable";s:17:"mantra_lineheight";s:7:"Default";s:16:"mantra_wordspace";s:7:"Default";s:18:"mantra_letterspace";s:7:"Default";s:17:"mantra_textshadow";s:6:"Enable";s:16:"mantra_backcolor";s:7:"#444444";s:18:"mantra_headercolor";s:7:"#333333";s:17:"mantra_titlecolor";s:7:"#0D85CC";s:23:"mantra_descriptioncolor";s:7:"#999999";s:19:"mantra_contentcolor";s:7:"#333333";s:17:"mantra_linkscolor";s:7:"#0D85CC";s:17:"mantra_hovercolor";s:7:"#12a7ff";s:20:"mantra_headtextcolor";s:7:"#333333";s:20:"mantra_headtexthover";s:7:"#000000";s:24:"mantra_sideheadbackcolor";s:7:"#444444";s:24:"mantra_sideheadtextcolor";s:7:"#2EA5FD";s:21:"mantra_prefootercolor";s:7:"#222222";s:18:"mantra_footercolor";s:7:"#171717";s:19:"mantra_footerheader";s:7:"#0C85CD";s:17:"mantra_footertext";s:7:"#666666";s:18:"mantra_footerhover";s:7:"#888888";s:14:"mantra_caption";s:5:"Light";s:12:"mantra_image";s:5:"Seven";s:10:"mantra_pin";s:4:"Pin2";s:17:"mantra_sidebullet";s:11:"arrow_white";s:15:"mantra_metaback";s:4:"Gray";s:20:"mantra_postseparator";s:4:"Hide";s:18:"mantra_contentlist";s:4:"Show";s:12:"mantra_title";s:4:"Show";s:16:"mantra_pagetitle";s:4:"Show";s:17:"mantra_categtitle";s:4:"Show";s:13:"mantra_tables";s:7:"Disable";s:14:"mantra_backtop";s:6:"Enable";s:14:"mantra_comtext";s:4:"Show";s:16:"mantra_comclosed";s:15:"Hide everywhere";s:13:"mantra_comoff";s:4:"Show";s:16:"mantra_copyright";s:4:"    ";s:18:"mantra_postcomlink";s:4:"Show";s:15:"mantra_postdate";s:4:"Show";s:15:"mantra_posttime";s:4:"Hide";s:17:"mantra_postauthor";s:4:"Show";s:16:"mantra_postcateg";s:4:"Show";s:14:"mantra_posttag";s:4:"Show";s:15:"mantra_postbook";s:4:"Show";s:16:"mantra_postmetas";s:4:"Show";s:18:"mantra_excerpthome";s:9:"Full Post";s:20:"mantra_excerptsticky";s:9:"Full Post";s:21:"mantra_excerptarchive";s:9:"Full Post";s:19:"mantra_excerptwords";i:50;s:21:"mantra_magazinelayout";s:7:"Disable";s:18:"mantra_excerptdots";s:4:" …";s:18:"mantra_excerptcont";s:17:" Continue reading";s:18:"mantra_excerpttags";s:7:"Disable";s:12:"mantra_fpost";s:7:"Disable";s:16:"mantra_fpostlink";s:1:"1";s:12:"mantra_fauto";s:7:"Disable";s:13:"mantra_falign";s:4:"Left";s:13:"mantra_fwidth";i:250;s:14:"mantra_fheight";i:150;s:14:"mantra_fheader";s:7:"Disable";s:14:"mantra_social1";s:9:"Delicious";s:14:"mantra_social2";s:0:"";s:14:"mantra_social3";s:9:"Delicious";s:14:"mantra_social4";s:0:"";s:14:"mantra_social5";s:9:"Delicious";s:14:"mantra_social6";s:0:"";s:14:"mantra_social7";s:9:"Delicious";s:14:"mantra_social8";s:0:"";s:14:"mantra_social9";s:9:"Delicious";s:15:"mantra_social10";s:0:"";s:17:"mantra_linkheader";s:7:"Disable";s:18:"mantra_breadcrumbs";s:7:"Disable";s:17:"mantra_pagination";s:6:"Enable";s:13:"mantra_mobile";s:7:"Disable";s:14:"mantra_favicon";s:0:"";s:16:"mantra_customcss";s:23:"/* Mantra Custom CSS */";s:15:"mantra_customjs";s:0:"";s:10:"mantra_seo";s:6:"Enable";s:20:"mantra_seo_home_desc";s:0:"";s:19:"mantra_seo_gen_desc";s:4:"Auto";s:17:"mantra_seo_author";s:10:"Do not use";s:13:"mantra_submit";s:12:"Save Changes";s:18:"mantra_googlefont2";N;s:23:"mantra_googlefonttitle2";N;s:22:"mantra_googlefontside2";N;s:27:"mantra_googlefontsubheader2";N;}', 'yes');
INSERT INTO `dev_options` VALUES(1047, 'acf_version', '3.3.3', 'yes');
INSERT INTO `dev_options` VALUES(857, 'dynwid_version', '1.5.2', 'yes');
INSERT INTO `dev_options` VALUES(2180, 'widget_yahoo_skype_status', 'a:3:{i:2;a:61:{s:5:"title";s:25:"Hỗ trợ trực tuyến";s:6:"nick_1";s:20:"lgthnha@yahoo.com.vn";s:14:"is_show_name_1";s:1:"1";s:11:"nick_name_1";s:15:"Luong Thanh Nha";s:11:"nick_type_1";s:5:"yahoo";s:19:"yahoo_status_type_1";s:1:"9";s:19:"skype_status_type_1";s:12:"smallclassic";s:6:"nick_2";s:18:"loivd@yahoo.com.vn";s:14:"is_show_name_2";s:1:"1";s:11:"nick_name_2";s:10:"Vu Dai Loi";s:11:"nick_type_2";s:5:"yahoo";s:19:"yahoo_status_type_2";s:1:"8";s:19:"skype_status_type_2";s:12:"smallclassic";s:6:"nick_3";s:18:"chaulong@yahoo.com";s:14:"is_show_name_3";s:1:"1";s:11:"nick_name_3";s:14:"Tran Chau Long";s:11:"nick_type_3";s:5:"yahoo";s:19:"yahoo_status_type_3";s:1:"9";s:19:"skype_status_type_3";s:12:"smallclassic";s:6:"nick_4";s:0:"";s:14:"is_show_name_4";s:1:"1";s:11:"nick_name_4";s:0:"";s:11:"nick_type_4";s:5:"yahoo";s:19:"yahoo_status_type_4";s:1:"0";s:19:"skype_status_type_4";s:12:"smallclassic";s:6:"nick_5";s:0:"";s:14:"is_show_name_5";s:1:"1";s:11:"nick_name_5";s:0:"";s:11:"nick_type_5";s:5:"yahoo";s:19:"yahoo_status_type_5";s:1:"0";s:19:"skype_status_type_5";s:12:"smallclassic";s:6:"nick_6";s:0:"";s:14:"is_show_name_6";s:1:"1";s:11:"nick_name_6";s:0:"";s:11:"nick_type_6";s:5:"yahoo";s:19:"yahoo_status_type_6";s:1:"0";s:19:"skype_status_type_6";s:12:"smallclassic";s:6:"nick_7";s:0:"";s:14:"is_show_name_7";s:1:"1";s:11:"nick_name_7";s:0:"";s:11:"nick_type_7";s:5:"yahoo";s:19:"yahoo_status_type_7";s:1:"0";s:19:"skype_status_type_7";s:12:"smallclassic";s:6:"nick_8";s:0:"";s:14:"is_show_name_8";s:1:"1";s:11:"nick_name_8";s:0:"";s:11:"nick_type_8";s:5:"yahoo";s:19:"yahoo_status_type_8";s:1:"0";s:19:"skype_status_type_8";s:12:"smallclassic";s:6:"nick_9";s:0:"";s:14:"is_show_name_9";s:1:"1";s:11:"nick_name_9";s:0:"";s:11:"nick_type_9";s:5:"yahoo";s:19:"yahoo_status_type_9";s:1:"0";s:19:"skype_status_type_9";s:12:"smallclassic";s:7:"nick_10";s:0:"";s:15:"is_show_name_10";s:1:"1";s:12:"nick_name_10";s:0:"";s:12:"nick_type_10";s:5:"yahoo";s:20:"yahoo_status_type_10";s:1:"0";s:20:"skype_status_type_10";s:12:"smallclassic";}i:3;a:61:{s:5:"title";s:0:"";s:6:"nick_1";s:20:"tclong2010@yahoo.com";s:14:"is_show_name_1";s:1:"1";s:11:"nick_name_1";s:9:"CHAU LONG";s:11:"nick_type_1";s:5:"yahoo";s:19:"yahoo_status_type_1";s:2:"10";s:19:"skype_status_type_1";s:9:"smallicon";s:6:"nick_2";s:7:"lgthnha";s:14:"is_show_name_2";s:1:"1";s:11:"nick_name_2";s:9:"NHA LUONG";s:11:"nick_type_2";s:5:"yahoo";s:19:"yahoo_status_type_2";s:2:"10";s:19:"skype_status_type_2";s:12:"smallclassic";s:6:"nick_3";s:20:"vdloi2k@yahoo.com.vn";s:14:"is_show_name_3";s:1:"1";s:11:"nick_name_3";s:7:"DAI LOI";s:11:"nick_type_3";s:5:"yahoo";s:19:"yahoo_status_type_3";s:2:"10";s:19:"skype_status_type_3";s:12:"smallclassic";s:6:"nick_4";s:0:"";s:14:"is_show_name_4";s:1:"1";s:11:"nick_name_4";s:0:"";s:11:"nick_type_4";s:5:"yahoo";s:19:"yahoo_status_type_4";s:1:"0";s:19:"skype_status_type_4";s:12:"smallclassic";s:6:"nick_5";s:0:"";s:14:"is_show_name_5";s:1:"1";s:11:"nick_name_5";s:0:"";s:11:"nick_type_5";s:5:"yahoo";s:19:"yahoo_status_type_5";s:1:"0";s:19:"skype_status_type_5";s:12:"smallclassic";s:6:"nick_6";s:0:"";s:14:"is_show_name_6";s:1:"1";s:11:"nick_name_6";s:0:"";s:11:"nick_type_6";s:5:"yahoo";s:19:"yahoo_status_type_6";s:1:"0";s:19:"skype_status_type_6";s:12:"smallclassic";s:6:"nick_7";s:0:"";s:14:"is_show_name_7";s:1:"1";s:11:"nick_name_7";s:0:"";s:11:"nick_type_7";s:5:"yahoo";s:19:"yahoo_status_type_7";s:1:"0";s:19:"skype_status_type_7";s:12:"smallclassic";s:6:"nick_8";s:0:"";s:14:"is_show_name_8";s:1:"1";s:11:"nick_name_8";s:0:"";s:11:"nick_type_8";s:5:"yahoo";s:19:"yahoo_status_type_8";s:1:"0";s:19:"skype_status_type_8";s:12:"smallclassic";s:6:"nick_9";s:0:"";s:14:"is_show_name_9";s:1:"1";s:11:"nick_name_9";s:0:"";s:11:"nick_type_9";s:5:"yahoo";s:19:"yahoo_status_type_9";s:1:"0";s:19:"skype_status_type_9";s:12:"smallclassic";s:7:"nick_10";s:0:"";s:15:"is_show_name_10";s:1:"1";s:12:"nick_name_10";s:0:"";s:12:"nick_type_10";s:5:"yahoo";s:20:"yahoo_status_type_10";s:1:"0";s:20:"skype_status_type_10";s:12:"smallclassic";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(23086, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1346955071', 'yes');
INSERT INTO `dev_options` VALUES(23087, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"3211";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"2116";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"1981";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"1623";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"1562";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1387";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1109";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1090";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1084";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1051";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1006";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:3:"923";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:3:"845";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:3:"792";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:3:"746";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:3:"676";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:3:"674";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:3:"660";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"650";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:3:"602";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"579";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"565";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"547";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"547";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"479";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"471";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"471";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"457";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"456";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"453";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"437";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"419";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"413";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"402";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"390";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"388";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"388";}s:5:"flash";a:3:{s:4:"name";s:5:"flash";s:4:"slug";s:5:"flash";s:5:"count";s:3:"367";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"361";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"360";}}', 'yes');
INSERT INTO `dev_options` VALUES(702, 'wpwt_settings', 'a:9:{s:17:"wpwt_introduction";s:16:"I''m currently in";s:23:"wpwt_show_schedule_text";s:24:"View My Travel Itinerary";s:23:"wpwt_hide_schedule_text";s:24:"Hide My Travel Itinerary";s:21:"wpwt_lets_meetup_text";s:17:"Let''s Meetup Here";s:18:"wpwt_hide_schedule";b:1;s:18:"wpwt_hide_previous";b:1;s:20:"wpwt_meetups_enabled";b:1;s:15:"wpwt_send_email";b:1;s:16:"wpwt_meetups_new";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(703, 'wpwt_schedule', 'a:2:{s:14:"leg_1342883558";a:5:{s:14:"wpwt_from_date";i:1325419200;s:12:"wpwt_to_date";i:1357041600;s:10:"wpwt_place";s:13:"Test Location";s:17:"wpwt_country_code";s:2:"AU";s:17:"wpwt_country_name";s:9:"Australia";}s:14:"leg_1325419200";a:5:{s:14:"wpwt_from_date";i:1325419200;s:12:"wpwt_to_date";i:1420113600;s:10:"wpwt_place";s:4:"oiio";s:17:"wpwt_country_code";s:2:"VN";s:17:"wpwt_country_name";s:8:"Viet Nam";}}', 'yes');
INSERT INTO `dev_options` VALUES(704, 'wpwt_meetups', 'a:1:{s:39:"meetup_1342883558_team@globetrooper.com";a:5:{s:9:"wpwt_date";s:10:"1342883558";s:13:"wpwt_location";s:17:"Sydney, Australia";s:9:"wpwt_name";s:15:"Todd and Lauren";s:10:"wpwt_email";s:21:"team@globetrooper.com";s:12:"wpwt_message";s:124:"Test Meetup: although we really would love to catch up and show you around town. See our itinerary on the Globetrooper blog.";}}', 'yes');
INSERT INTO `dev_options` VALUES(705, 'widget_wp_world_travel', 'a:2:{i:2;a:1:{s:5:"title";s:16:"Current Location";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(715, 'poll_template_voteheader', '<p style=\\"text-align: center; font-size: 15px\\">%POLL_QUESTION%</p><div id=\\"polls-%POLL_ID%-ans\\" class=\\"wp-polls-ans\\"><ul class=\\"wp-polls-ul\\">', 'yes');
INSERT INTO `dev_options` VALUES(3112, 'PopUpFad_On_Pages', 'YES', 'yes');
INSERT INTO `dev_options` VALUES(708, 'widget_llm_widget', 'a:2:{i:3;a:2:{s:5:"title";s:27:"Đối tác chiến lượt";s:8:"category";s:1:"1";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(874, '_site_transient_timeout_browser_cca589e7effed39da40faadfe3bfb949', '1343658739', 'yes');
INSERT INTO `dev_options` VALUES(875, '_site_transient_browser_cca589e7effed39da40faadfe3bfb949', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"20.0.1132.57";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(712, 'cincopa_installed', 'true', 'yes');
INSERT INTO `dev_options` VALUES(713, 'cincopa_welcome_notice', 'wp1.118', 'yes');
INSERT INTO `dev_options` VALUES(717, 'poll_template_votefooter', '</ul><p style=\\"text-align: center; font-size: 14px\\">\r\n<input type=\\"button\\" name=\\"vote\\" value=\\"  Bình chọn  \\" class=\\"Buttons\\" onclick=\\"poll_vote(%POLL_ID%);\\" /></p><p style=\\"text-align: center;\\"><a href=\\"#ViewPollResults\\" onclick=\\"poll_result(%POLL_ID%); return false;\\" title=\\"Xem kết quả bình chọn\\">  Xem kết quả bình chọn  </a></p></div>', 'yes');
INSERT INTO `dev_options` VALUES(718, 'poll_template_resultheader', '<p style=\\"text-align: center; font-size: 14px\\">%POLL_QUESTION%</p><div id=\\"polls-%POLL_ID%-ans\\" class=\\"wp-polls-ans\\"><ul class=\\"wp-polls-ul\\">', 'yes');
INSERT INTO `dev_options` VALUES(719, 'poll_template_resultbody', '<li style=\\''font-size: 14px\\''>%POLL_ANSWER% (%POLL_ANSWER_PERCENTAGE%%, %POLL_ANSWER_VOTES% bình chọn)<div class=\\"pollbar\\" style=\\"width: %POLL_ANSWER_IMAGEWIDTH%%;\\" title=\\"%POLL_ANSWER_TEXT% (%POLL_ANSWER_PERCENTAGE%% | %POLL_ANSWER_VOTES% bình chọn)\\"></div></li>', 'yes');
INSERT INTO `dev_options` VALUES(720, 'poll_template_resultbody2', '<li style=\\''font-size: 14px\\''><i>%POLL_ANSWER% <small>(%POLL_ANSWER_PERCENTAGE%%, %POLL_ANSWER_VOTES% Votes)</small></i><div class=\\"pollbar\\" style=\\"width: %POLL_ANSWER_IMAGEWIDTH%%;\\" title=\\"You Have Voted For This Choice - %POLL_ANSWER_TEXT% (%POLL_ANSWER_PERCENTAGE%% | %POLL_ANSWER_VOTES% bình chọn)\\"></div></li>', 'yes');
INSERT INTO `dev_options` VALUES(721, 'poll_template_resultfooter', '</ul><p style=\\"text-align: center; font-size: 14px\\">Tổng số bình chọn: <strong>%POLL_TOTALVOTERS%</strong></p></div>', 'yes');
INSERT INTO `dev_options` VALUES(722, 'poll_template_resultfooter2', '</ul><p style=\\"text-align: center; font-size: 14px\\">Tổng số bình chọn: <strong>%POLL_TOTALVOTERS%</strong></p><p style=\\"text-align: center;\\"><a href=\\"#VotePoll\\" onclick=\\"poll_booth(%POLL_ID%); return false;\\" title=\\"Thăm dò ý kiến\\">Bình chọn</a></p></div>', 'yes');
INSERT INTO `dev_options` VALUES(723, 'poll_template_disable', 'Sorry, there are no polls available at the moment.', 'yes');
INSERT INTO `dev_options` VALUES(724, 'poll_template_error', 'An error has occurred when processing your poll.', 'yes');
INSERT INTO `dev_options` VALUES(725, 'poll_currentpoll', '0', 'yes');
INSERT INTO `dev_options` VALUES(726, 'poll_latestpoll', '2', 'yes');
INSERT INTO `dev_options` VALUES(727, 'poll_archive_perpage', '5', 'yes');
INSERT INTO `dev_options` VALUES(728, 'poll_ans_sortby', 'polla_aid', 'yes');
INSERT INTO `dev_options` VALUES(729, 'poll_ans_sortorder', 'asc', 'yes');
INSERT INTO `dev_options` VALUES(730, 'poll_ans_result_sortby', 'polla_votes', 'yes');
INSERT INTO `dev_options` VALUES(731, 'poll_ans_result_sortorder', 'desc', 'yes');
INSERT INTO `dev_options` VALUES(732, 'poll_logging_method', '3', 'yes');
INSERT INTO `dev_options` VALUES(733, 'poll_allowtovote', '2', 'yes');
INSERT INTO `dev_options` VALUES(734, 'poll_archive_url', 'http://localhost/aaexpress/pollsarchive', 'yes');
INSERT INTO `dev_options` VALUES(735, 'poll_bar', 'a:4:{s:5:"style";s:7:"default";s:10:"background";s:6:"d8e1eb";s:6:"border";s:6:"c8c8c8";s:6:"height";i:8;}', 'yes');
INSERT INTO `dev_options` VALUES(736, 'poll_close', '1', 'yes');
INSERT INTO `dev_options` VALUES(737, 'poll_ajax_style', 'a:2:{s:7:"loading";i:1;s:6:"fading";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(738, 'poll_template_pollarchivelink', '<ul><li><a href=\\"%POLL_ARCHIVE_URL%\\">Polls Archive</a></li></ul>', 'yes');
INSERT INTO `dev_options` VALUES(739, 'poll_archive_displaypoll', '2', 'yes');
INSERT INTO `dev_options` VALUES(740, 'poll_template_pollarchiveheader', '', 'yes');
INSERT INTO `dev_options` VALUES(741, 'poll_template_pollarchivefooter', '<p>Start Date: %POLL_START_DATE%<br />End Date: %POLL_END_DATE%</p>', 'yes');
INSERT INTO `dev_options` VALUES(742, 'poll_cookielog_expiry', '0', 'yes');
INSERT INTO `dev_options` VALUES(743, 'poll_template_pollarchivepagingheader', '', 'yes');
INSERT INTO `dev_options` VALUES(744, 'poll_template_pollarchivepagingfooter', '', 'yes');
INSERT INTO `dev_options` VALUES(747, 'widget_polls-widget', 'a:2:{i:2;a:3:{s:5:"title";s:19:"Thăm dò ý kiến";s:7:"poll_id";i:1;s:19:"display_pollarchive";i:0;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(851, 'widget_easel_random_post_link_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(765, 'theme_mods_mantra', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:3:{s:7:"primary";i:0;s:3:"top";i:0;s:6:"footer";i:0;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1342926028;s:4:"data";a:9:{s:19:"wp_inactive_widgets";a:0:{}s:19:"primary-widget-area";a:4:{i:0;s:7:"links-2";i:1;s:14:"polls-widget-2";i:2;s:14:"polls-widget-3";i:3;s:17:"wp_world_travel-2";}s:21:"secondary-widget-area";a:2:{i:0;s:6:"text-2";i:1;s:21:"visits counter widget";}s:17:"third-widget-area";a:2:{i:0;s:12:"llm_widget-2";i:1;s:12:"llm_widget-3";}s:18:"fourth-widget-area";a:0:{}s:24:"first-footer-widget-area";a:0:{}s:25:"second-footer-widget-area";a:0:{}s:24:"third-footer-widget-area";a:0:{}s:25:"fourth-footer-widget-area";a:0:{}}}}', 'yes');
INSERT INTO `dev_options` VALUES(760, 'theme_mods_aa-express', 'a:1:{i:0;b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(770, '_transient_timeout_feed_0cdc4dea8447164f1d037ad5f1bdb33c', '1342936626', 'no');
INSERT INTO `dev_options` VALUES(846, '_transient_timeout_theme_info', '1342929628', 'no');
INSERT INTO `dev_options` VALUES(847, '_transient_theme_info', 'O:8:"WP_Theme":11:{s:20:"\0WP_Theme\0theme_root";s:42:"C:\\AppServ\\www\\aaexpress/wp-content/themes";s:17:"\0WP_Theme\0headers";a:11:{s:4:"Name";s:6:"Mantra";s:8:"ThemeURI";s:35:"http://www.riotreactions.com/mantra";s:11:"Description";s:844:"Mantra is a do-it-yourself WordPress theme, featuring a pack of over 100 customization options and easy to use tweaks capable of tuning WordPress to your very specific needs and likes. With the help of a simple and efficient user interface you can customize everything:the layout (1,2 or 3 columns), total and partial site widths, colors (all texts, links, backgrounds etc.), fonts (over 35 font-families plus all Google Fonts), text and header sizes, post metas, post excerpts, post formats, header and background images, custom menus, 27 social media links and icons, pins, bullets and much much more. With a fully responsive layout,a customizable showcase presentation page, animated slider, magazine and blog layouts, 8 widget areas, modern graphics and an easy and intuitive admin section, you can start creating your dream site right now.";s:6:"Author";s:16:"Cryout Creations";s:9:"AuthorURI";s:30:"http://www.cryoutcreations.com";s:7:"Version";s:5:"1.9.3";s:8:"Template";s:0:"";s:6:"Status";s:0:"";s:4:"Tags";s:405:"black, red, blue, white, silver, light, dark, one-column, two-columns, three-columns, right-sidebar, left-sidebar, flexible-width, fixed-width, custom-background, custom-colors, custom-header, custom-menu, featured-image-header, featured-images, front-page-post-form, full-width-template,  microformats, post-formats, rtl-language-support,  sticky-post, theme-options, threaded-comments, translation-ready";s:10:"TextDomain";s:0:"";s:10:"DomainPath";s:0:"";}s:27:"\0WP_Theme\0headers_sanitized";N;s:25:"\0WP_Theme\0name_translated";N;s:16:"\0WP_Theme\0errors";N;s:20:"\0WP_Theme\0stylesheet";s:6:"mantra";s:18:"\0WP_Theme\0template";s:6:"mantra";s:16:"\0WP_Theme\0parent";N;s:24:"\0WP_Theme\0theme_root_uri";N;s:27:"\0WP_Theme\0textdomain_loaded";N;s:20:"\0WP_Theme\0cache_hash";s:32:"ac7e0bc75e8397913311a1fbf4aaa7a4";}', 'no');
INSERT INTO `dev_options` VALUES(771, '_transient_feed_0cdc4dea8447164f1d037ad5f1bdb33c', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:50:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Riot Reactions » mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:27:"http://www.riotreactions.eu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:35:"We may inspire but we never expire!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Jul 2012 10:31:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:29:"http://wordpress.org/?v=3.3.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:53:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:12:"Mantra 1.9.3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"http://www.riotreactions.eu/wordpress-themes/mantra-1-9-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:67:"http://www.riotreactions.eu/wordpress-themes/mantra-1-9-3/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Jul 2012 10:31:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:5:{i:0;a:5:{s:4:"data";s:6:"Mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:16:"Wordpress Themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:6:"mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:5:"theme";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:9:"wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.riotreactions.eu/?p=2344";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:603:"The latest Mantra version brings a Custom JavaScript area for your custom JS and Analytics codes. It also adds some basic SEO. The SEO options are in the Misc settings of the Mantra Settings page (for now) so you can go and check them out. We also moved a lot of code around, improved security quite a bit and improved HTML5 validation (things that will also happen in 1.9.4 and a few other future versions). And when you move code around&#8230; bugs are bound to bla bla bla... <a href="http://www.riotreactions.eu/wordpress-themes/mantra-1-9-3/">There''s more <span class="meta-nav">&#8594; </span></a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Kay";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1038:"<p>The latest Mantra version brings a Custom JavaScript area for your custom JS and Analytics codes. It also adds some basic SEO. The SEO options are in the Misc settings of the Mantra Settings page (for now) so you can go and check them out.</p>\n<p>We also moved a lot of code around, improved security quite a bit and improved HTML5 validation (things that will also happen in 1.9.4 and a few other future versions). And when you move code around&#8230; bugs are bound to rear their ugly heads. Here are two of those heads:</p>\n<p>The media WP uploader doesn&#8217;t work anymore. This was a really weird one. It&#8217;s complicated to explain how this happened but the fix will come with version 1.9.4 that should become available any day now.</p>\n<p>And a very small percentage of users reported the front page slider not working. From what we saw on the pages they showed us, the JS for the slider is not loaded into the page. We are still investigating this one&#8230;</p>\n<p>We&#8217;d like to thank everyone for the feedback.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:63:"http://www.riotreactions.eu/wordpress-themes/mantra-1-9-3/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:50:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"Mantra 1.9.2(.x) and the missing Presentation Page";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:104:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-9-2-0-12-and-the-missing-presentation-page/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:113:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-9-2-0-12-and-the-missing-presentation-page/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 28 Jun 2012 10:38:54 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:4:{i:0;a:5:{s:4:"data";s:6:"Mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:5:"theme";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.riotreactions.eu/?p=2282";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:657:"Mantra 1.9.2 series enhanced the slider. Not its looks this time but the actual content that goes into the slides. You can now load the latest posts, random posts, posts from a category, random posts from a category, sticky posts or specific posts or pages. We also altered the look of the sticky posts a tad. We also improved the post thumbnails but introducing an option to crop the images or not. We also made the main navigation menu overlap the header image. Some of bla bla bla... <a href="http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-9-2-0-12-and-the-missing-presentation-page/">There''s more <span class="meta-nav">&#8594; </span></a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Kay";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1453:"<p>Mantra 1.9.2 series enhanced the slider. Not its looks this time but the actual content that goes into the slides. You can now load the latest posts, random posts, posts from a category, random posts from a category, sticky posts or specific posts or pages. We also altered the look of the sticky posts a tad.</p>\n<p>We also improved the post thumbnails but introducing an option to crop the images or not.</p>\n<p>We also made the main navigation menu overlap the header image. Some of you liked the idea, some of you not so much that&#8217;s why in the next version we&#8217;ll make that an option or revert to how it previously used to be.<br />\nStill in the header business, we made the header height a direct input. You don&#8217;t have to select from preset values now. So if you want your header height to be 183px&#8230; well.. now you can.</p>\n<p>We also improved the Right To Left version of our theme, the relative dimensions and fixed a few bugs.</p>\n<p>Now this seems to be bothering some of you:</p>\n<p><strong> If after the update you can&#8217;t see your <span style="text-decoration: underline;">presentation page</span>, go to the WordPress admin &gt; Settings &gt; Reading and switch the <em>Front page displays</em> to its default value which is <em>Your latest posts</em></strong>.</p>\n<p><em>If you need some other page to show your blog posts just edit that page and choose <strong>page-blog</strong> as page template.</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:109:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-9-2-0-12-and-the-missing-presentation-page/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"45";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:47:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Mantra 1.9.0 has been released";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:83:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-9-0-has-been-released/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:92:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-9-0-has-been-released/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Jun 2012 15:20:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:6:"Mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:9:"wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.riotreactions.eu/?p=2263";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:634:"Praise the Lord! and pass the ammunition&#8230; (thank you, Mr. Tankian). Mantra 1.9.0 is out into the wild. The WordPress team approved it and it is now available for download. Hopefully all most some of the bugs from 1.8.9 and 1.8.9.1 have been fixed so you can now go back to enjoying the extraordinary theme Mantra is (in its good days)&#8230; In any case, being a major update, 1.9.0 comes packed with some neat new features, but I will not spoil the surprise as I bla bla bla... <a href="http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-9-0-has-been-released/">There''s more <span class="meta-nav">&#8594; </span></a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Zed";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2592:"<p>Praise the Lord! and pass the ammunition&#8230; (thank you, Mr. <a href="http://www.serjtankian.com/songs/praise-lord-and-pass-ammunition" target="_blank">Tankian</a>).</p>\n<p><strong>Mantra 1.9.0</strong> is out into the wild. The WordPress team approved it and it is now available for download.</p>\n<p>Hopefully <del>all</del> <del>most</del> some of the bugs from 1.8.9 and 1.8.9.1 have been fixed so you can now go back to enjoying the extraordinary theme Mantra is (in its good days)&#8230;</p>\n<p>In any case, being a major update, 1.9.0 comes packed with some neat new features, but I will not spoil the surprise as I am sure Mr. Kay will be updating this post to list the awesome new additions&#8230;</p>\n<p><i>(a couple of hours later)</i></p>\n<p>Kay here. Thank you Zed for the <del>wonderful</del> <del>caring</del> realist intro. I&#8217;ll continue with the new additions.</p>\n<p><strong>The new additions are:</strong></p>\n<ul>\n<li><strong> The export and import options. </strong> This has been by far the most time and thought consuming feature ever integrated into Mantra and it&#8217;s actually still in a test phase. Again we are counting on you to change that. Use and abuse this feature and let us know when it breaks. We&#8217;ll patch it up.</li>\n<li> <strong>Google fonts. </strong> Finally you can use them. Which ones? All of them! Just type the font family you want to use under text settings and that&#8217;s it. It&#8217;s really that easy. You are now awarded unlimited typographical power.</li>\n<li> <strong>New favicon uploader. </strong> It should now work as initially intended and should be more intuitive as it uses the WordPress media uploader. Go check it out!</li>\n<li> <strong>RSS news feed about Mantra </strong>&#8230; directly into the Mantra admin section. You can now see the latest Mantra news directly from the admin section. Imagine that! You&#8217;ll know everything there is to know about your favorite WordPress theme&#8230; and about Mantra. See what I did there? </li>\n<li> <strong>Made the mobile view optional. </strong> So now you can choose whether you want your theme to be responsive or not. You&#8217;ll find the option in the Misc Settings and it&#8217;s disabled by default as we&#8217;re still working on a couple of issues.</li>\n<li> Updated some HTML tags to HTML5. Changed a few function names.</li>\n</ul>\n<p>For 1.9.1 we&#8217;re working on implementing posts&#8217; data into the slider and columns. We&#8217;re also documenting ourselves on the new WP 3.4 version that brings a nice little addition to theme lovers.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:88:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-9-0-has-been-released/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"86";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:50:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"More explaining about Mantra(s) 1.8.9 and 1.8.9.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:100:"http://www.riotreactions.eu/wordpress-themes/mantra/more-explaining-about-mantras-1-8-9-and-1-8-9-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:109:"http://www.riotreactions.eu/wordpress-themes/mantra/more-explaining-about-mantras-1-8-9-and-1-8-9-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Jun 2012 18:51:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:4:{i:0;a:5:{s:4:"data";s:6:"Mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:5:"theme";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.riotreactions.eu/?p=2254";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:733:"After the flood of support tickets in the past week concerning bugs and &#8220;features&#8221; (more or less) in the latest two incarnations of Mantra, I&#8217;ve decided to sum up things with an explanatory post: 1. The notorious Missing argument 2 for wp_kses(), called in /wp-content/themes/mantra/admin/mantra-sanitize.php is solved in 1.8.9.1. You can now once more save the theme options. 2. Enabling social icons in the footer will get you a nice warning message on the website (that also makes the admin bar unusable/invisible). This is indeed bla bla bla... <a href="http://www.riotreactions.eu/wordpress-themes/mantra/more-explaining-about-mantras-1-8-9-and-1-8-9-1/">There''s more <span class="meta-nav">&#8594; </span></a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Zed";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1816:"<p>After the flood of support tickets in the past week concerning bugs and &#8220;features&#8221; (more or less) in the latest two incarnations of Mantra, I&#8217;ve decided to sum up things with an explanatory post:</p>\n<h3>1.</h3>\n<p>The notorious <em>Missing argument 2 for wp_kses(), called in /wp-content/themes/mantra/admin/mantra-sanitize.php</em> is solved in 1.8.9.1. You can now once more save the theme options.</p>\n<h3>2.</h3>\n<p>Enabling social icons in the footer will get you a nice warning message on the website (that also makes the admin bar unusable/invisible). This is indeed a bug, present in both releases. The fix is to edit footer.php and change <code>mantra_social_icons()</code> to <code>mantra_set_social_icons()</code></p>\n<h3>3.</h3>\n<p>There&#8217;s some hiccup concerning the siderbar-content-sidebar layout (two sidebars on both sides of the content). Do not use this option for now.</p>\n<h3>4.</h3>\n<p>There&#8217;s also a miss-alignment concerning the sub-submenu items. No fix yet.</p>\n<h3>5.</h3>\n<p>Last but the most cried about of all &#8211; the new mobile devices related css &#8220;feature&#8221;. Intended as an improvement to make the website resize and wrap itself on small screen sizes, most users saw this as a bug. As such, this will be by default set as disabled, and there will be an option to turn it on. Until 1.9.0, to remove this &#8220;feature&#8221;, edit Mantra&#8217;s style.css and delete everything starting with <code>/* =Responsive Structure</code></p>\n<p>&nbsp;</p>\n<p>And since without bugs we kind of leave ourselves without work, do not worry&#8230; Mantra 1.9.0 is on its way, and it&#8217;ll be packed with new features and new bugs <img src=''http://www.riotreactions.eu/wp-includes/images/smilies/icon_smile.gif'' alt='':)'' class=''wp-smiley'' /> </p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:105:"http://www.riotreactions.eu/wordpress-themes/mantra/more-explaining-about-mantras-1-8-9-and-1-8-9-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"6";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:47:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Buggy bug in Mantra 1.8.9";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"http://www.riotreactions.eu/wordpress-themes/mantra/buggy-bug-in-mantra-1-8-9/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:87:"http://www.riotreactions.eu/wordpress-themes/mantra/buggy-bug-in-mantra-1-8-9/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 30 May 2012 20:28:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:6:"Mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:3:"bug";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:6:"mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.riotreactions.eu/?p=2203";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:735:"Okay, we&#8217;ve made a little doody here, and we&#8217;ve let a mean bug free. Don&#8217;t worry, it&#8217;s not too big, it&#8217;s just evil enough to prevent you from saving your theme options. So if you&#8217;re using Mantra 1.8.8 and get the update news for 1.8.9, DON&#8217;T! But if you&#8217;re reading this, it is most likely too late. You&#8217;re probably seeing something like Warning: Missing argument 2 for wp_kses(), called in /wp-content/themes/mantra/admin/mantra-sanitize.php on line 85 and defined in /wp-includes/kses.php on line 502 when trying to save bla bla bla... <a href="http://www.riotreactions.eu/wordpress-themes/mantra/buggy-bug-in-mantra-1-8-9/">There''s more <span class="meta-nav">&#8594; </span></a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Zed";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2624:"<p><a href="http://www.riotreactions.eu/wp-content/uploads/2012/05/software-bug-sign-e1338409324140.jpg"><img class="alignleft size-full wp-image-2205" title="software-bug-sign" src="http://www.riotreactions.eu/wp-content/uploads/2012/05/software-bug-sign-e1338409324140.jpg" alt="" width="150" height="132" /></a>Okay, we&#8217;ve made a little doody here, and we&#8217;ve let a mean bug free. Don&#8217;t worry, it&#8217;s not too big, it&#8217;s just evil enough to prevent you from saving your theme options.</p>\n<p>So if you&#8217;re using Mantra 1.8.8 and get the update news for 1.8.9, <strong>DON&#8217;T</strong>! <img src=''http://www.riotreactions.eu/wp-includes/images/smilies/icon_biggrin.gif'' alt='':D'' class=''wp-smiley'' /> </p>\n<p>But if you&#8217;re reading this, it is most likely too late. You&#8217;re probably seeing something like</p>\n<p><code>Warning: Missing argument 2 for wp_kses(), called in /wp-content/themes/mantra/admin/mantra-sanitize.php on line 85 and defined in /wp-includes/kses.php on line 502</code></p>\n<p>when trying to save the settings. This just confirms you&#8217;ve made that grave mistake of updating&#8230; not that updating is bad &#8211; but just this once it&#8217;s bad.</p>\n<p><strong>But hang on tight, 1.8.9.1</strong> <del>is already on the way! It&#8217;s just that unlike Microsoft (or some other big company) we do not control the update approval and publication, so the exact moment when 1.8.9.1 will become available depends completely on WordPress&#8217; review theme.</del><strong> is already available!</strong></p>\n<p>&nbsp;</p>\n<p>Anyway, if you&#8217;re too impatient for the update to be published and are up for the task of fixing this yourself, then go right ahead and edit the <strong>wp-content/themes/mantra/admin/mantra-sanitize.php</strong> file and replace (line 85) from</p>\n<p><code>$input[''mantra_columnreadmore''] =  wp_kses($input[''mantra_columnreadmore'']); </code></p>\n<p>to</p>\n<p><code>$input[''mantra_columnreadmore''] =  wp_kses($input[''mantra_columnreadmore'']<strong style="color: red;">,''''</strong>);</code></p>\n<p>Note the extra <strong>,&#8221; </strong>at the end, before the closing bracket<strong>. </strong></p>\n<p>&nbsp;</p>\n<p>If you mess something up, do not despair &#8211; just re-download the theme&#8230; the bug will be right back.</p>\n<p><em>Thank you for your understanding, and remember that hiccups like this happen even on (pricey) paid products. I think Mr. Kay is running low on coffee&#8230; <img src=''http://www.riotreactions.eu/wp-includes/images/smilies/icon_smile.gif'' alt='':)'' class=''wp-smiley'' /><br />\n</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:83:"http://www.riotreactions.eu/wordpress-themes/mantra/buggy-bug-in-mantra-1-8-9/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"21";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:50:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:38:"Mantra 1.8.7 and a little bit of 1.8.6";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:91:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-8-7-and-a-little-bit-of-1-8-6/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:100:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-8-7-and-a-little-bit-of-1-8-6/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 04 May 2012 15:55:20 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:4:{i:0;a:5:{s:4:"data";s:6:"Mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:5:"theme";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.riotreactions.eu/?p=2177";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:647:"Before 1.8.7, for quite some time there was only 1.8.6. Version 1.8.6 had fixed many bugs and added more options to the static front page. It also added a couple of default images and text to the front page so it would be easier to use and understand. Version 1.8.7 fixed a small bug where the Back-to-Top button was going under the social icons in the footer when the browser window was smaller than the site&#8217;s width. It also added the Confirm window before resetting bla bla bla... <a href="http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-8-7-and-a-little-bit-of-1-8-6/">There''s more <span class="meta-nav">&#8594; </span></a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Kay";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1360:"<p>Before 1.8.7, for quite some time there was only 1.8.6. Version 1.8.6 had fixed many bugs and added more options to the static front page. It also added a couple of default images and text to the front page so it would be easier to use and understand.</p>\n<p>Version 1.8.7 fixed a small bug where the Back-to-Top button was going under the social icons in the footer when the browser window was smaller than the site&#8217;s width. It also added the Confirm window before resetting the settings to default in the Mantra Settings page. We also implemented a function so that after you install Mantra you are immediately redirected to the Mantra Settings page which we hope will help a lot of new users that don&#8217;t even know that page exists.</p>\n<p>We also added a new page template called page-blog that now you can use to replace your old Home page that had all your latest blogs, in case you are using the new front-page. Basically all you have to do is create a new page, or edit an existing one, give it any name you want and then from the Page Template selector choose page-blog.</p>\n<p>We also played a little bit with implementing Google fonts and although you can&#8217;t use them yet, they will be available in a future version <img src=''http://www.riotreactions.eu/wp-includes/images/smilies/icon_wink.gif'' alt='';)'' class=''wp-smiley'' /> </p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:96:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-1-8-7-and-a-little-bit-of-1-8-6/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"9";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:50:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:52:"Mantra Triple Pack updates 1.8.2 – 1.8.3 – 1.8.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-triple-pack-updates-1-8-2-1-8-3-1-8-4/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:106:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-triple-pack-updates-1-8-2-1-8-3-1-8-4/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 02 Apr 2012 08:29:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:4:{i:0;a:5:{s:4:"data";s:6:"Mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:5:"theme";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.riotreactions.eu/?p=2166";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:622:"Yeah a lot has been going on. We&#8217;ll be brief this time. No more supermen. In 1.8.2 we added 2 more menus or navigations or whatever you wanna call them. One at the top of the page and one in the footer. In 1.8.3 we added an option to keep tags in post excerpts. And we fixed some bugs. In 1.8.4 we fixed some more bugs but we also addressed the front-page slider issues and added more customization options to the front page. We actually bla bla bla... <a href="http://www.riotreactions.eu/wordpress-themes/mantra/mantra-triple-pack-updates-1-8-2-1-8-3-1-8-4/">There''s more <span class="meta-nav">&#8594; </span></a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Kay";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1390:"<div id="attachment_2167" class="wp-caption alignleft" style="width: 310px"><a href="http://www.riotreactions.eu/wp-content/uploads/2012/04/fronpage.jpg"><img class=" wp-image-2167" title="Front Page Example" src="http://www.riotreactions.eu/wp-content/uploads/2012/04/fronpage-300x224.jpg" alt="Mantra Front Page example" width="300" height="224" /></a><p class="wp-caption-text">Your front page could loook like this</p></div>\n<p>Yeah a lot has been going on. We&#8217;ll be brief this time. No more supermen.</p>\n<p>In 1.8.2 we added 2 more menus or navigations or whatever you wanna call them. One at the top of the page and one in the footer.</p>\n<p>In 1.8.3 we added an option to keep tags in post excerpts. And we fixed some bugs.</p>\n<p>In 1.8.4 we fixed some more bugs but we also addressed the front-page slider issues and added more customization options to the front page. We actually changed the slider altogether; we&#8217;re using Nivo sider now. We also added 2 more optional titles and 2 optional text areas. You can also remove bits of the front page so it will look like the first page of your dreams.</p>\n<p>In 1.8.5 we&#8217;re going to add some default images and text to the front page so you&#8217;ll get an idea of how the front page looks before editing it. We&#8217;ll also make it more intuitive and we&#8217;ll probably fix some more bugs. You let us know.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:102:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-triple-pack-updates-1-8-2-1-8-3-1-8-4/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"14";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:50:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Mantra 1.8.1/1.8.2 plague?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:74:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-181-182-plague/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:83:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-181-182-plague/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 20 Mar 2012 21:20:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:4:{i:0;a:5:{s:4:"data";s:6:"Mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:5:"theme";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.riotreactions.eu/?p=2144";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:502:"If you&#8217;ve recently updated to Mantra 1.8.1 or 1.8.2, it&#8217;s very likely that&#8217;s what you are here for These two versions of Mantra are plagued by a couple of small (but somewhat annoying bugs) like images not getting displayed on the homepage, some comment fields issues and a couple of other little things that needed fixing. So if you&#8217;re using 1.8.1/1.8.2, please update to 1.8.3 before reporting any issues. No matter how much we may like bugs, we hope to have fixed most&#8230;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Zed";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:653:"<p>If you&#8217;ve recently updated to Mantra 1.8.1 or 1.8.2, it&#8217;s very likely that&#8217;s what you are here for <img src=''http://www.riotreactions.eu/wp-includes/images/smilies/icon_smile.gif'' alt='':)'' class=''wp-smiley'' /> </p>\n<p>These two versions of Mantra are plagued by a couple of small (but somewhat annoying bugs) like images not getting displayed on the homepage, some comment fields issues and a couple of other little things that needed fixing.</p>\n<p><strong>So if you&#8217;re using 1.8.1/1.8.2, please update to 1.8.3 before reporting any issues.</strong> No matter how much we may like bugs, we hope to have fixed most&#8230;</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:79:"http://www.riotreactions.eu/wordpress-themes/mantra/mantra-181-182-plague/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"40";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:53:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:28:"Mantra 1.8.1 is not Superman";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:74:"http://www.riotreactions.eu/wordpress-themes/mantra-1-8-1-is-not-superman/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:83:"http://www.riotreactions.eu/wordpress-themes/mantra-1-8-1-is-not-superman/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 14 Mar 2012 16:58:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:5:{i:0;a:5:{s:4:"data";s:6:"Mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:16:"Wordpress Themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:6:"mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:5:"theme";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:9:"wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.riotreactions.eu/?p=2122";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:610:"Is it a bird? Is it a plane? A meteor? It kinda looks like an UFO! Could it really be ?! Or maybe&#8230; is it &#8230; Superman wearing a sombrero? Close enough but no. It&#8217;s the new Mantra update with the symmetrically numbered version &#8211; 1.8.1 &#8211; one standing at the edge of infinity and seeing itself on the other side. Is that one the same as this one? Can they be the same with a whole infinity between them? Is space really the final bla bla bla... <a href="http://www.riotreactions.eu/wordpress-themes/mantra-1-8-1-is-not-superman/">There''s more <span class="meta-nav">&#8594; </span></a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Kay";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3140:"<p><a href="http://www.riotreactions.eu/wp-content/uploads/2012/03/131P34330H030-19142.jpg"><img class="alignleft size-thumbnail wp-image-2128" title="131P34330H030-19142" src="http://www.riotreactions.eu/wp-content/uploads/2012/03/131P34330H030-19142-150x150.jpg" alt="" width="150" height="150" /></a>Is it a bird? Is it a plane? A meteor? It kinda looks like an UFO! Could it really be ?! Or maybe&#8230; is it &#8230; Superman wearing a sombrero?</p>\n<p>Close enough but no. It&#8217;s the new Mantra update with the symmetrically numbered version &#8211; 1.8.1 &#8211; one standing at the edge of infinity and seeing itself on the other side. Is that one the same as this one? Can they be the same with a whole infinity between them? Is space really the final frontier and infinity just an an invisible mirror? Well, until the next version comes out &#8211; I guess so.</p>\n<p>&#8216;What does the new version bring to the table anyway&#8217; you ask? Well quite a lot actually. You better make some room on that table of yours cause Mantra&#8217;s packing some goodies.</p>\n<p>&#8216;Come on already! I ain&#8217;t got all day to read your s%&amp;t&#8217; you say? Don&#8217;t you use that tone with me young man! I&#8217;m investing a lot of time and effort into Mantra so you better make time to read my s%$t and you better enjoy reading my s%#t and even post a comment about how much my s%#t rocks!</p>\n<p>&#8216;Really? You&#8217;re gonna be like that? I better get back to my blog then !&#8217; you shout in anger as you storm out of the room, violently shutting the door behind you. No! Please come back. I&#8217;m so sorry. Come back and I&#8217;ll tell you everything you want to hear! I&#8217;ll tell you about the new version!</p>\n<p>&#8216;Whatever you gotta say, just say it. I can hear you through the walls. I really don&#8217;t wanna see you right now!&#8217; your muffed voice surrounds and numbs me.</p>\n<p>Okay then, here it is:<br />\nThe new version mainly adds a new presentation page. It has a new settings area in the Mantra Settings Page called Presentation Page just under the Layout Settings.<br />\nThere you can enable it and configure it. There&#8217;s a slider and some columns. All configurable.</p>\n<p>The Slider &#8211; You can have up to 5 slides and you edit everything &#8211; image, title, text and link. You have that for each of the five slides. The images are uploaded using the WordPress uploader so you can also choose from images that are already in your gallery. You can also choose the slider&#8217;s dimensions.</p>\n<p>The Columns &#8211; You have 4 columns, with 4 editable fields, just like the slides. You can also choose the height of the images here.</p>\n<p>The new version also adds a new Magazine Layout, meaning you can have 2 posts per row. That&#8217;s still in a Beta stage but we encourage you to try it an give us feedback. The option for that is in the Post Excerpt Settings because it works well with excerpts.</p>\n<p>We are currently adding more customization options to the slider and the columns to give you more freedom. Also in the next version&#8230; 2 more menus.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:79:"http://www.riotreactions.eu/wordpress-themes/mantra-1-8-1-is-not-superman/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"47";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:53:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n\n		\n		\n			\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Mantra 1.7.7 and 1.8.0 bundle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"http://www.riotreactions.eu/wordpress-themes/mantra-1-7-7-and-1-8-0-bundle/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:84:"http://www.riotreactions.eu/wordpress-themes/mantra-1-7-7-and-1-8-0-bundle/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Feb 2012 07:44:46 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:5:{i:0;a:5:{s:4:"data";s:6:"Mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:16:"Wordpress Themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:6:"mantra";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:5:"theme";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:9:"wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.riotreactions.eu/?p=2109";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:638:"Wow it happened all so fast we dind&#8217;t even have time to create a post log for 1.7.7, that 1.8.0 made its way into the spotlight. So we&#8217;ll do a post for both. Mantra 1.7.7 - Fixed a weird bug that&#8217;s been&#8230;ahh&#8230; bugging us since the begining of Mantra. The bug made the hide/show post meta settings not work in certain conditions. All good now. - Mantra now gives you the option to make your header image clickable and link to your main page. You&#8217;ll bla bla bla... <a href="http://www.riotreactions.eu/wordpress-themes/mantra-1-7-7-and-1-8-0-bundle/">There''s more <span class="meta-nav">&#8594; </span></a>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Kay";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1784:"<p>Wow it happened all so fast we dind&#8217;t even have time to create a post log for 1.7.7, that 1.8.0 made its way into the spotlight.</p>\n<p>So we&#8217;ll do a post for both.</p>\n<h3> Mantra 1.7.7 </h3>\n<p>- Fixed a weird bug that&#8217;s been&#8230;ahh&#8230; bugging us since the begining of Mantra. The bug made the hide/show post meta settings not work in certain conditions. All good now.</p>\n<p>- Mantra now gives you the option to make your header image clickable and link to your main page. You&#8217;ll find that option in the Miscellaneous settings.</p>\n<p>- A new ( and Mantra&#8217;s first) upload input &#8211; and it&#8217;s for uploading your favicon. Give it a try&#8230; also found in the Miscellaneous settings.</p>\n<h3> Mantra 1.8.0 </h3>\n<p>- Added a few more social icons&#8230; to a toal of 24. That&#8217;s final. We won&#8217;t be adding any more. We&#8217;re considering making an upload button for custom ones but don&#8217;t hold your breaths.</p>\n<p>- We improved the favicon uploader with a disable/enable setting.</p>\n<p>- We added an option to hide the meta bar under post headers altogether. No more meta info, no more grey area. Not even white space. Nothing.</p>\n<p>- And the <i>piece du resitance</i> and also the reason for the 1.8 jump is the long time comming relative dimensions. You can now choose between the 2 types of dimensions: ABSOLUTE &#8211; in pixels (px) &#8211; the ones you&#8217;ve come to know so well and RELATIVE &#8211; in percentages (%), relative to the browser&#8217;s dimensions.</p>\n<p>The new relative dimensions are still in some sort of a beta state. We tested them a lot in our controlled enviroment but we&#8217;d like you to give them a try as well.</p>\n<p>Keep us updated and we&#8217;ll keep you updated!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:80:"http://www.riotreactions.eu/wordpress-themes/mantra-1-7-7-and-1-8-0-bundle/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"http://www.riotreactions.eu/tag/mantra-2/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:12:{s:4:"date";s:29:"Sat, 21 Jul 2012 17:57:02 GMT";s:6:"server";s:6:"Apache";s:12:"x-powered-by";s:10:"PHP/5.2.13";s:7:"expires";s:29:"Thu, 19 Nov 1981 08:52:00 GMT";s:13:"cache-control";s:62:"no-store, no-cache, must-revalidate, post-check=0, pre-check=0";s:6:"pragma";s:8:"no-cache";s:10:"x-pingback";s:38:"http://www.riotreactions.eu/xmlrpc.php";s:4:"etag";s:34:""4f129f8c4f09f72e7e93e5add49b3640"";s:10:"set-cookie";s:44:"PHPSESSID=l70rh8mbiqdiit8o0shjmajuc3; path=/";s:13:"last-modified";s:29:"Fri, 20 Jul 2012 10:31:03 GMT";s:10:"connection";s:5:"close";s:12:"content-type";s:23:"text/xml; charset=UTF-8";}s:5:"build";s:14:"20111015034325";}', 'no');
INSERT INTO `dev_options` VALUES(2702, '_site_transient_timeout_browser_99dd1bf2e8eb24ca5b0e5d356cbf9fa3', '1344703637', 'yes');
INSERT INTO `dev_options` VALUES(2703, '_site_transient_browser_99dd1bf2e8eb24ca5b0e5d356cbf9fa3', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"21.0.1180.60";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(3042, 'PPOPOUPUP_RANDOM', 'YES', 'yes');
INSERT INTO `dev_options` VALUES(3043, 'PPOPOUPUP_IMG1', 'Sample text message 1', 'yes');
INSERT INTO `dev_options` VALUES(3044, 'PPOPOUPUP_URL1', 'http://localhost/aaexpress/wp-content/plugins/popup/images/336x280_1.jpg', 'yes');
INSERT INTO `dev_options` VALUES(3045, 'PPOPOUPUP_LINK1', 'http://www.gopiplus.com/work/', 'yes');
INSERT INTO `dev_options` VALUES(3046, 'PPOPOUPUP_IMG2', 'Sample text message 2', 'yes');
INSERT INTO `dev_options` VALUES(3047, 'PPOPOUPUP_URL2', 'http://localhost/aaexpress/wp-content/plugins/popup/images/336x280_2.jpg', 'yes');
INSERT INTO `dev_options` VALUES(3048, 'PPOPOUPUP_LINK2', 'http://www.gopiplus.com/work/', 'yes');
INSERT INTO `dev_options` VALUES(3049, 'PPOPOUPUP_IMG3', 'Sample text message 3', 'yes');
INSERT INTO `dev_options` VALUES(3050, 'PPOPOUPUP_URL3', 'http://localhost/aaexpress/wp-content/plugins/popup/images/336x280_3.jpg', 'yes');
INSERT INTO `dev_options` VALUES(3051, 'PPOPOUPUP_LINK3', 'http://www.gopiplus.com/work/', 'yes');
INSERT INTO `dev_options` VALUES(3052, 'PPOPOUPUP_IMG4', 'Sample text message 4', 'yes');
INSERT INTO `dev_options` VALUES(3053, 'PPOPOUPUP_URL4', 'http://localhost/aaexpress/wp-content/plugins/popup/images/336x280_1.jpg', 'yes');
INSERT INTO `dev_options` VALUES(3054, 'PPOPOUPUP_LINK4', 'http://www.gopiplus.com/work/', 'yes');
INSERT INTO `dev_options` VALUES(3055, 'PPOPOUPUP_IMG5', 'Sample text message 5', 'yes');
INSERT INTO `dev_options` VALUES(3056, 'PPOPOUPUP_URL5', 'http://localhost/aaexpress/wp-content/plugins/popup/images/336x280_2.jpg', 'yes');
INSERT INTO `dev_options` VALUES(3057, 'PPOPOUPUP_LINK5', 'http://www.gopiplus.com/work/', 'yes');
INSERT INTO `dev_options` VALUES(3058, 'PPOPOUPUP_IMG6', 'Sample text message 6', 'yes');
INSERT INTO `dev_options` VALUES(3059, 'PPOPOUPUP_URL6', 'http://localhost/aaexpress/wp-content/plugins/popup/images/336x280_3.jpg', 'yes');
INSERT INTO `dev_options` VALUES(3060, 'PPOPOUPUP_LINK6', 'http://www.gopiplus.com/work/', 'yes');
INSERT INTO `dev_options` VALUES(3061, 'PPOPOUPUP_SESSION', 'YES', 'yes');
INSERT INTO `dev_options` VALUES(3114, 'PopUpFad_On_Search', 'YES', 'yes');
INSERT INTO `dev_options` VALUES(3115, 'PopUpFad_Group', 'widget', 'yes');
INSERT INTO `dev_options` VALUES(3116, 'PopUpFad_Random', 'YES', 'yes');
INSERT INTO `dev_options` VALUES(3117, 'PopUpFad_Session', 'YES', 'yes');
INSERT INTO `dev_options` VALUES(6511, '_site_transient_timeout_browser_4f2045d37e02f85edf04bf9e78ba6b96', '1345311652', 'yes');
INSERT INTO `dev_options` VALUES(3165, 'WPS_setting', 'a:30:{s:12:"enable_popup";s:1:"1";s:11:"popup_title";s:11:"THÔNG BÁO";s:15:"display_message";s:634:"<p>AA Express xin tran trong thong bao thong tin lien he moi la:</p><p>Trụ sở tại TP Hồ Ch&iacute; Minh</p><p>Địa chỉ: 108/21/11 Cộng Ho&agrave;, Phường 4, Quận T&acirc;n B&igrave;nh, TP Hồ Ch&iacute; Minh</p><p>Điện thoại: (08) 3948 0323 -  3948 0324</p><p>Fax: (08)  3948 0325Email: aaexpresshcm@vnn.vn</p><p>Chi nh&aacute;nh tại H&agrave; Nội</p><p>Địa chỉ: 45B Khu đ&ocirc; thị mới Đai Kim, Quận Ho&agrave;n Mai, TP H&agrave; Nội</p><p>Điện thoại: (04) 35 409 215 -  35 409 216</p><p>Fax: (04)  35 409 217</p><p>Email: aaexpresshcm@vnn.vn</p><p>&nbsp;</p><p>Tran trong cam on</p>";s:10:"close_text";s:6:"Đóng";s:12:"display_page";s:5:"other";s:17:"popup_destination";s:41:"http://www.vnestore.com/aa/trang-chu.html";s:11:"popup_width";s:3:"615";s:10:"popup_left";s:2:"-1";s:9:"popup_top";s:3:"150";s:14:"popup_position";s:12:"user-defined";s:13:"show_popup_on";s:9:"everytime";s:15:"schedule_option";s:0:"";s:9:"delaytime";s:1:"0";s:10:"autoscroll";s:1:"1";s:19:"show_popup_interval";s:1:"3";s:17:"next_display_date";s:0:"";s:12:"return_count";s:1:"3";s:9:"popup_day";s:2:"01";s:9:"popup_mth";s:2:"01";s:8:"popup_yr";s:4:"2008";s:17:"show_popup_consec";s:1:"1";s:13:"display_style";s:8:"dropdown";s:16:"background_color";s:7:"#CCFFFF";s:15:"closetext_color";s:7:"#FF0000";s:14:"headline_color";s:7:"#FF0000";s:14:"headline_align";s:6:"center";s:8:"wps_path";s:65:"http://www.vnestore.com/aa/wp-content/plugins/wp-popup-scheduler/";s:9:"rich_text";s:1:"1";s:12:"content_hash";s:32:"32b59b12237c04148fc2465754b78cb3";s:12:"popup_height";N;}', 'yes');
INSERT INTO `dev_options` VALUES(22763, 'magic_contact_version', '0.2', 'yes');
INSERT INTO `dev_options` VALUES(667, 'BumpIn', 'a:1:{s:11:"bumpin_code";s:0:"";}', 'yes');
INSERT INTO `dev_options` VALUES(662, 'widget_include_post', 'a:2:{i:2;a:3:{s:12:"postwidgetid";s:3:"788";s:5:"title";s:0:"";s:12:"includetitle";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(11887, '_site_transient_timeout_browser_752ab267da003eeb91a83aadb7c0a996', '1345691936', 'yes');
INSERT INTO `dev_options` VALUES(11888, '_site_transient_browser_752ab267da003eeb91a83aadb7c0a996', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"21.0.1180.79";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(680, '_site_transient_timeout_browser_8404448ad16f31830e778596aa859240', '1343412731', 'yes');
INSERT INTO `dev_options` VALUES(681, '_site_transient_browser_8404448ad16f31830e778596aa859240', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"11.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"12";s:7:"upgrade";b:1;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(148, '_transient_random_seed', '14a5b62cc2ec43d1949bbf2adac35d97', 'yes');
INSERT INTO `dev_options` VALUES(23296, '_site_transient_timeout_wporg_theme_feature_list', '1347043687', 'yes');
INSERT INTO `dev_options` VALUES(23297, '_site_transient_wporg_theme_feature_list', 'a:5:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:7:"Columns";a:6:{i:0;s:10:"one-column";i:1;s:11:"two-columns";i:2;s:13:"three-columns";i:3;s:12:"four-columns";i:4;s:12:"left-sidebar";i:5;s:13:"right-sidebar";}s:5:"Width";a:2:{i:0;s:11:"fixed-width";i:1;s:14:"flexible-width";}s:8:"Features";a:19:{i:0;s:8:"blavatar";i:1;s:10:"buddypress";i:2;s:17:"custom-background";i:3;s:13:"custom-colors";i:4;s:13:"custom-header";i:5;s:11:"custom-menu";i:6;s:12:"editor-style";i:7;s:21:"featured-image-header";i:8;s:15:"featured-images";i:9;s:15:"flexible-header";i:10;s:20:"front-page-post-form";i:11;s:19:"full-width-template";i:12;s:12:"microformats";i:13;s:12:"post-formats";i:14;s:20:"rtl-language-support";i:15;s:11:"sticky-post";i:16;s:13:"theme-options";i:17;s:17:"threaded-comments";i:18;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}}', 'yes');
INSERT INTO `dev_options` VALUES(152, 'theme_mods_twentyeleven', 'a:10:{s:16:"header_textcolor";s:5:"blank";s:12:"header_image";s:83:"http://localhost/aaexpress/wp-content/themes/twentyeleven/images/headers/willow.jpg";s:17:"header_image_data";a:3:{s:3:"url";s:83:"http://localhost/aaexpress/wp-content/themes/twentyeleven/images/headers/willow.jpg";s:13:"thumbnail_url";s:93:"http://localhost/aaexpress/wp-content/themes/twentyeleven/images/headers/willow-thumbnail.jpg";s:11:"description";s:6:"Willow";}s:16:"background_color";s:6:"f1f1f1";s:16:"background_image";s:0:"";s:17:"background_repeat";s:6:"repeat";s:21:"background_position_x";s:4:"left";s:21:"background_attachment";s:5:"fixed";s:18:"nav_menu_locations";a:1:{s:7:"primary";i:3;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1340295584;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:9:"sidebar-4";a:0:{}s:9:"sidebar-5";a:0:{}}}}', 'yes');
INSERT INTO `dev_options` VALUES(153, 'twentyeleven_theme_options', 'a:3:{s:12:"color_scheme";s:5:"light";s:10:"link_color";s:7:"#acd0eb";s:12:"theme_layout";s:15:"sidebar-content";}', 'yes');
INSERT INTO `dev_options` VALUES(162, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes');
INSERT INTO `dev_options` VALUES(19884, '_site_transient_timeout_browser_d3e4858c164bbb3249e073d0ee6bac1f', '1345994902', 'yes');
INSERT INTO `dev_options` VALUES(19885, '_site_transient_browser_d3e4858c164bbb3249e073d0ee6bac1f', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"12.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"12";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(263, 'recently_activated', 'a:0:{}', 'yes');
INSERT INTO `dev_options` VALUES(19890, '_site_transient_timeout_browser_331cda868386a91045588d03edfedb1e', '1345995046', 'yes');
INSERT INTO `dev_options` VALUES(3109, 'PopUpFad_Title', 'Cool fade popup', 'yes');
INSERT INTO `dev_options` VALUES(3110, 'PopUpFad_On_Homepage', 'YES', 'yes');
INSERT INTO `dev_options` VALUES(3111, 'PopUpFad_On_Posts', 'YES', 'yes');
INSERT INTO `dev_options` VALUES(716, 'poll_template_votebody', '<li style=\\''font-size: 14px\\''><input type=\\"%POLL_CHECKBOX_RADIO%\\" id=\\"poll-answer-%POLL_ANSWER_ID%\\" name=\\"poll_%POLL_ID%\\" value=\\"%POLL_ANSWER_ID%\\" /> <label for=\\"poll-answer-%POLL_ANSWER_ID%\\">%POLL_ANSWER%</label></li>', 'yes');
INSERT INTO `dev_options` VALUES(696, 'PARTNER_PLUGIN_ID', 'a:9:{s:10:"show_names";b:0;s:7:"version";s:5:"1.2.1";s:9:"show_cats";b:1;s:7:"cat_ids";s:4:"VNPT";s:11:"show_images";b:1;s:5:"order";s:2:"id";s:11:"bordercolor";s:7:"#FFFFFF";s:16:"bordercolor_form";s:7:"#000000";s:10:"font-color";N;}', 'yes');
INSERT INTO `dev_options` VALUES(272, 'bota_alerts', '1', 'yes');
INSERT INTO `dev_options` VALUES(273, 'bota_alert_type', '0', 'yes');
INSERT INTO `dev_options` VALUES(274, 'bota_bots', 's:206:"a:2:{i:0;a:4:{s:2:"id";i:1;s:4:"name";s:9:"GoogleBot";s:4:"mask";s:9:"googlebot";s:4:"rdns";s:13:"googlebot.com";}i:1;a:4:{s:2:"id";i:2;s:4:"name";s:7:"BingBot";s:4:"mask";s:7:"bingbot";s:4:"rdns";s:0:"";}}";', 'yes');
INSERT INTO `dev_options` VALUES(275, 'bota_emails', 'vdloi_it2k@yahoo.com.vn', 'yes');
INSERT INTO `dev_options` VALUES(276, 'bota_email_subject', 'A bot has visited your site!', 'yes');
INSERT INTO `dev_options` VALUES(277, 'bota_email_message', 'A bot has visited your site!', 'yes');
INSERT INTO `dev_options` VALUES(278, 'bota_supported', '0', 'yes');
INSERT INTO `dev_options` VALUES(280, 'twiz_skin', '/skins/_default', 'yes');
INSERT INTO `dev_options` VALUES(281, 'twiz_db_version', '2.7', 'yes');
INSERT INTO `dev_options` VALUES(282, 'twiz_global_status', '1', 'yes');
INSERT INTO `dev_options` VALUES(283, 'twiz_order_by', 'on_event', 'yes');
INSERT INTO `dev_options` VALUES(284, 'twiz_setting_menu', 'home', 'yes');
INSERT INTO `dev_options` VALUES(285, 'twiz_admin', 'a:7:{s:15:"register_jquery";s:1:"1";s:18:"output_compression";s:1:"0";s:6:"output";s:7:"wp_head";s:14:"min_role_level";s:16:"activate_plugins";s:12:"number_posts";s:3:"125";s:17:"starting_position";s:8:"relative";s:10:"delete_all";s:1:"0";}', 'yes');
INSERT INTO `dev_options` VALUES(286, '_transient_plugins_delete_result_1', '1', 'yes');
INSERT INTO `dev_options` VALUES(288, 'embedplusopt_enhance_youtube', '1', 'yes');
INSERT INTO `dev_options` VALUES(289, 'embedplusopt_show_react', '1', 'yes');
INSERT INTO `dev_options` VALUES(290, 'embedplusopt_sweetspot', '1', 'yes');
INSERT INTO `dev_options` VALUES(436, 'widget_widget_easel_classic_bookmark', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `dev_options` VALUES(420, 'avactis_path', '?page_id=4', 'yes');
INSERT INTO `dev_options` VALUES(421, 'avactis_width', '1100', 'yes');
INSERT INTO `dev_options` VALUES(422, 'avactis_active', 'Y', 'yes');
INSERT INTO `dev_options` VALUES(471, 'sl_map_type', 'roadmap', 'yes');
INSERT INTO `dev_options` VALUES(425, 'google_api_key', '', 'yes');
INSERT INTO `dev_options` VALUES(426, 'dist_return_url', '', 'yes');
INSERT INTO `dev_options` VALUES(427, 'paypal_business_email', '', 'yes');
INSERT INTO `dev_options` VALUES(428, 'mode', 'https://www.paypal.com/cgi-bin/webscr', 'yes');
INSERT INTO `dev_options` VALUES(429, 'CCmode', 'sandbox', 'yes');
INSERT INTO `dev_options` VALUES(430, 'my_api_username', '', 'yes');
INSERT INTO `dev_options` VALUES(431, 'my_api_password', '', 'yes');
INSERT INTO `dev_options` VALUES(432, 'my_api_signature', '', 'yes');
INSERT INTO `dev_options` VALUES(433, 'to_admin', '', 'yes');
INSERT INTO `dev_options` VALUES(434, 'from_admin', '', 'yes');
INSERT INTO `dev_options` VALUES(435, 'application_url', 'http://www.vnestore.com/trathonghong/', 'yes');
INSERT INTO `dev_options` VALUES(472, 'csl-slplus-installed_base_version', '3.0.8', 'yes');
INSERT INTO `dev_options` VALUES(473, 'csl-slplus-db_version', '2.7', 'yes');
INSERT INTO `dev_options` VALUES(474, 'sl_map_character_encoding', 'utf-8', 'yes');
INSERT INTO `dev_options` VALUES(475, 'sl_instruction_message', 'Enter Your Address or Zip Code Above.', 'yes');
INSERT INTO `dev_options` VALUES(476, 'sl_admin_locations_per_page', '100', 'yes');
INSERT INTO `dev_options` VALUES(477, 'sl_map_overview_control', '0', 'yes');
INSERT INTO `dev_options` VALUES(478, 'sl_distance_unit', 'km', 'yes');
INSERT INTO `dev_options` VALUES(479, 'sl_load_locations_default', '1', 'yes');
INSERT INTO `dev_options` VALUES(480, 'sl_num_initial_displayed', '25', 'yes');
INSERT INTO `dev_options` VALUES(481, 'sl_website_label', 'aa-express.net', 'yes');
INSERT INTO `dev_options` VALUES(482, 'sl_radius_label', 'Phạm vi', 'yes');
INSERT INTO `dev_options` VALUES(483, 'sl_remove_credits', '0', 'yes');
INSERT INTO `dev_options` VALUES(484, 'sl_use_name_search', '0', 'yes');
INSERT INTO `dev_options` VALUES(485, 'sl_use_city_search', '1', 'yes');
INSERT INTO `dev_options` VALUES(486, 'sl_use_country_search', '0', 'yes');
INSERT INTO `dev_options` VALUES(487, 'slplus_show_state_pd', '0', 'yes');
INSERT INTO `dev_options` VALUES(488, 'sl_zoom_level', '12', 'yes');
INSERT INTO `dev_options` VALUES(489, 'sl_zoom_tweak', '1', 'yes');
INSERT INTO `dev_options` VALUES(490, 'sl_search_label', 'Nhập địa chỉ', 'yes');
INSERT INTO `dev_options` VALUES(491, 'sl_name_label', 'AA Express', 'yes');
INSERT INTO `dev_options` VALUES(492, 'sl_location_table_view', 'Normal', 'yes');
INSERT INTO `dev_options` VALUES(493, 'sl_map_theme', '', 'yes');
INSERT INTO `dev_options` VALUES(494, 'sl_google_map_country', 'Singapore', 'yes');
INSERT INTO `dev_options` VALUES(495, 'sl_google_map_domain', 'maps.google.com.sg', 'yes');
INSERT INTO `dev_options` VALUES(496, 'sl_map_end_icon', 'http://localhost/aaexpress/wp-content/plugins/store-locator-le/core/images/icons/marker.png', 'yes');
INSERT INTO `dev_options` VALUES(497, 'sl_map_home_icon', 'http://localhost/aaexpress/wp-content/plugins/store-locator-le/core/images/icons/marker.png', 'yes');
INSERT INTO `dev_options` VALUES(498, 'sl_map_height', '700', 'yes');
INSERT INTO `dev_options` VALUES(499, 'sl_map_height_units', 'px', 'yes');
INSERT INTO `dev_options` VALUES(500, 'sl_map_width', '100', 'yes');
INSERT INTO `dev_options` VALUES(501, 'sl_map_width_units', '%', 'yes');
INSERT INTO `dev_options` VALUES(502, 'sl_map_radii', '10,25,50,100,(200),500', 'yes');
INSERT INTO `dev_options` VALUES(503, 'sl_starting_image', '', 'yes');
INSERT INTO `dev_options` VALUES(504, 'csl-slplus_search_tag_label', '', 'yes');
INSERT INTO `dev_options` VALUES(505, 'csl-slplus_tag_search_selections', '', 'yes');
INSERT INTO `dev_options` VALUES(506, 'csl-slplus_state_pd_label', '', 'yes');
INSERT INTO `dev_options` VALUES(507, 'csl-slplus_map_center', '', 'yes');
INSERT INTO `dev_options` VALUES(508, 'csl-slplus_maxreturned', '', 'yes');
INSERT INTO `dev_options` VALUES(509, 'csl-slplus_show_tag_search', '0', 'yes');
INSERT INTO `dev_options` VALUES(510, 'csl-slplus_show_tag_any', '0', 'yes');
INSERT INTO `dev_options` VALUES(511, 'csl-slplus_email_form', '0', 'yes');
INSERT INTO `dev_options` VALUES(512, 'csl-slplus_show_tags', '0', 'yes');
INSERT INTO `dev_options` VALUES(513, 'csl-slplus_disable_scrollwheel', '0', 'yes');
INSERT INTO `dev_options` VALUES(514, 'csl-slplus_disable_initialdirectory', '0', 'yes');
INSERT INTO `dev_options` VALUES(515, 'csl-slplus_disable_largemapcontrol3d', '0', 'yes');
INSERT INTO `dev_options` VALUES(516, 'csl-slplus_disable_scalecontrol', '0', 'yes');
INSERT INTO `dev_options` VALUES(517, 'csl-slplus_disable_maptypecontrol', '0', 'yes');
INSERT INTO `dev_options` VALUES(518, 'csl-slplus_hide_radius_selections', '0', 'yes');
INSERT INTO `dev_options` VALUES(519, 'csl-slplus_hide_address_entry', '0', 'yes');
INSERT INTO `dev_options` VALUES(520, 'csl-slplus_disable_search', '0', 'yes');
INSERT INTO `dev_options` VALUES(521, 'csl-slplus_show_search_by_name', '0', 'yes');
INSERT INTO `dev_options` VALUES(522, 'csl-slplus-license_key', '', 'yes');
INSERT INTO `dev_options` VALUES(523, 'csl-slplus-purchased', '', 'yes');
INSERT INTO `dev_options` VALUES(524, 'csl-slplus-SLPLUS-lk', '', 'yes');
INSERT INTO `dev_options` VALUES(525, 'csl-slplus-SLP-PAGES-lk', '', 'yes');
INSERT INTO `dev_options` VALUES(526, 'csl-slplus-debugging', '', 'yes');
INSERT INTO `dev_options` VALUES(527, 'csl-slplus-api_key', '', 'yes');
INSERT INTO `dev_options` VALUES(528, 'csl-slplus-goecode_retries', '0', 'yes');
INSERT INTO `dev_options` VALUES(529, 'csl-slplus-thisbox', 'on', 'yes');
INSERT INTO `dev_options` VALUES(601, '_transient_timeout_feed_mod_bde80489bfeb2aa79c1c4ac365c66bb2', '1340684226', 'no');
INSERT INTO `dev_options` VALUES(602, '_transient_feed_mod_bde80489bfeb2aa79c1c4ac365c66bb2', '1340641026', 'no');
INSERT INTO `dev_options` VALUES(608, 'wpcareers', 'a:24:{s:4:"slug";s:9:"wpcareers";s:11:"description";s:302:"<p>Post your job in <strong>our free online wpCareers service</strong>.<br />You can browse jobs or search by job title and apply online.<br />Recruiters have also apportunity to add the avaliable jobs and update the job status.</p><br />If you have any question or feature request, please mail us.</p>";s:12:"show_credits";s:1:"y";s:10:"page_title";s:10:"Job Portal";s:10:"edit_style";s:7:"tinymce";s:14:"excerpt_length";s:3:"700";s:10:"page_image";s:11:"default.gif";s:7:"approve";s:1:"y";s:6:"expire";s:3:"360";s:11:"image_width";s:3:"120";s:12:"image_height";s:3:"120";s:12:"file_max_upl";s:2:"10";s:17:"confirmation_code";s:1:"y";s:9:"new_links";s:1:"8";s:8:"googleID";s:10:"pub-xxxxxx";s:11:"GADposition";s:3:"btn";s:10:"GADLformat";s:6:"468x15";s:15:"GADcolor_border";s:6:"FFFFFF";s:13:"GADcolor_link";s:6:"0000FF";s:11:"GADcolor_bg";s:6:"E4F2FD";s:13:"GADcolor_text";s:6:"000000";s:12:"GADcolor_url";s:6:"FF0000";s:9:"installed";s:1:"y";s:7:"version";s:7:"1.1.2-c";}', 'yes');
INSERT INTO `dev_options` VALUES(763, 'theme_mods_responsive', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1342893411;s:4:"data";a:10:{s:19:"wp_inactive_widgets";a:0:{}s:12:"main-sidebar";a:4:{i:0;s:7:"links-2";i:1;s:14:"polls-widget-2";i:2;s:14:"polls-widget-3";i:3;s:17:"wp_world_travel-2";}s:13:"right-sidebar";a:4:{i:0;s:6:"text-2";i:1;s:12:"llm_widget-2";i:2;s:12:"llm_widget-3";i:3;s:21:"visits counter widget";}s:12:"left-sidebar";a:0:{}s:17:"left-sidebar-half";a:0:{}s:18:"right-sidebar-half";a:0:{}s:13:"home-widget-1";a:0:{}s:13:"home-widget-2";a:0:{}s:13:"home-widget-3";a:0:{}s:14:"gallery-widget";N;}}}', 'yes');
INSERT INTO `dev_options` VALUES(674, 'yahoo_username', 'lgthnha', 'yes');
INSERT INTO `dev_options` VALUES(675, 'yahoo_pingbox_code', '<embed id="pingbox9h1f5fqyhos00" type="application/x-shockwave-flash" src="http://wgweb.msg.yahoo.com/badge/Pingbox.swf" width="220" height="400" flashvars="wid=dkuNrsi3RHZHAwNY2HUtNEY-" allowScriptAccess="always" />', 'yes');
INSERT INTO `dev_options` VALUES(676, 'offline_text', 'Toi ngu roi', 'yes');
INSERT INTO `dev_options` VALUES(677, 'online_text', 'Tao ne!', 'yes');
INSERT INTO `dev_options` VALUES(3308, '_transient_timeout_plugin_slugs', '1347966629', 'no');
INSERT INTO `dev_options` VALUES(3309, '_transient_plugin_slugs', 'a:18:{i:0;s:19:"akismet/akismet.php";i:1;s:36:"contact-form-7/wp-contact-form-7.php";i:2;s:49:"custom-page-extensions/custom-page-extensions.php";i:3;s:61:"electric-studio-client-login/electric_studio_client_login.php";i:4;s:9:"hello.php";i:5;s:23:"view_bill/view_bill.php";i:6;s:21:"wp-polls/wp-polls.php";i:7;s:37:"store-locator-le/store-locator-le.php";i:8;s:25:"link-list-manager/llm.php";i:9;s:19:"ql_bill/ql_bill.php";i:10;s:32:"seo-crawlytics/seocrawlytics.php";i:11;s:33:"visits-counter/visits_counter.php";i:12;s:47:"wordpress-csv-importer/wordpresscsvimporter.php";i:13;s:29:"wp-mail-smtp/wp_mail_smtp.php";i:14;s:31:"transportation-plugin/index.php";i:15;s:37:"yahoo-and-skype-status/yahooskype.php";i:16;s:34:"yahoo-slide-plugin/yahoo-slide.php";i:17;s:27:"dang-ky-van-chuyen/main.php";}', 'no');
INSERT INTO `dev_options` VALUES(11556, '_site_transient_timeout_browser_fd179f58f29b67b0c01ba3397be9bad8', '1345570196', 'yes');
INSERT INTO `dev_options` VALUES(6512, '_site_transient_browser_4f2045d37e02f85edf04bf9e78ba6b96', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"21.0.1180.75";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(11557, '_site_transient_browser_fd179f58f29b67b0c01ba3397be9bad8', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"21.0.1180.77";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(11570, '_site_transient_timeout_browser_c2fb91a0084823c0a162d6cf44462640', '1345570255', 'yes');
INSERT INTO `dev_options` VALUES(11571, '_site_transient_browser_c2fb91a0084823c0a162d6cf44462640', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"21.0.1180.77";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(20223, '_site_transient_timeout_browser_7beaa86ed9d290db0b8a7fbe7988f25f', '1346204899', 'yes');
INSERT INTO `dev_options` VALUES(20224, '_site_transient_browser_7beaa86ed9d290db0b8a7fbe7988f25f', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:11:"20.0.1105.0";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(22762, 'magic_contact_options', 'a:15:{s:17:"recipient_contact";s:23:"vdloi_it2k@yahoo.com.vn";s:15:"subject_contact";s:21:"Nội dung liên hệ";s:18:"label_name_contact";s:15:"Tên liên hệ";s:19:"label_email_contact";s:6:"E-mail";s:21:"label_website_contact";s:7:"Website";s:22:"label_feedback_contact";s:10:"Nội dung";s:18:"label_send_contact";s:5:"Gửi";s:19:"recievedMsg_contact";s:38:"Cảm ơn bạn đã gửi thông tin!";s:22:"notRecievedMsg_contact";s:56:"Yêu cầu không gửi được, vui lòng thử lại!";s:18:"disclaimer_contact";s:112:"Xin vui lòng điền thông tin yêu cầu của bạn, chúng tôi xin hân hạnh được phục vụ bạn!";s:18:"hide_email_contact";b:0;s:20:"hide_website_contact";b:1;s:12:"side_contact";s:5:"right";s:19:"label_phone_contact";s:15:"Điện thoại";s:18:"hide_phone_contact";b:0;}', 'yes');
INSERT INTO `dev_options` VALUES(23094, 'mail_from', 'nhalt2007@gmail.com', 'yes');
INSERT INTO `dev_options` VALUES(23095, 'mail_from_name', 'Lương Thanh Nhã', 'yes');
INSERT INTO `dev_options` VALUES(23096, 'mailer', 'smtp', 'yes');
INSERT INTO `dev_options` VALUES(23097, 'mail_set_return_path', '', 'yes');
INSERT INTO `dev_options` VALUES(23098, 'smtp_host', 'smtp.gmail.com', 'yes');
INSERT INTO `dev_options` VALUES(23099, 'smtp_port', '465', 'yes');
INSERT INTO `dev_options` VALUES(23100, 'smtp_ssl', 'ssl', 'yes');
INSERT INTO `dev_options` VALUES(23101, 'smtp_auth', 'true', 'yes');
INSERT INTO `dev_options` VALUES(23102, 'smtp_user', 'nganchau@vnestore.com', 'yes');
INSERT INTO `dev_options` VALUES(23103, 'smtp_pass', '10031984', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `dev_order_user_map`
--

CREATE TABLE `dev_order_user_map` (
  `oid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dev_order_user_map`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_plugin_bota`
--

CREATE TABLE `dev_plugin_bota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visited_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visited_ip` int(11) NOT NULL,
  `visited_uri` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `visited_by` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `visited_referral` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `visited_page` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visited_on` (`visited_on`),
  KEY `visited_by` (`visited_by`),
  KEY `visited_page` (`visited_page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to contain Bot Alert plugin view page' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_plugin_bota`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_pollsa`
--

CREATE TABLE `dev_pollsa` (
  `polla_aid` int(10) NOT NULL AUTO_INCREMENT,
  `polla_qid` int(10) NOT NULL DEFAULT '0',
  `polla_answers` varchar(200) NOT NULL DEFAULT '',
  `polla_votes` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`polla_aid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `dev_pollsa`
--

INSERT INTO `dev_pollsa` VALUES(1, 1, 'Rất tốt', 6);
INSERT INTO `dev_pollsa` VALUES(2, 1, 'Tốt', 1);
INSERT INTO `dev_pollsa` VALUES(3, 1, 'Khá tốt', 0);
INSERT INTO `dev_pollsa` VALUES(4, 1, 'Bình thường', 0);
INSERT INTO `dev_pollsa` VALUES(5, 1, 'Chưa đạt yêu cầu', 0);
INSERT INTO `dev_pollsa` VALUES(6, 2, 'Đẹp và thông tin đầy đủ', 1);
INSERT INTO `dev_pollsa` VALUES(7, 2, 'Hợp lý nhưng thiếu thông tin', 0);
INSERT INTO `dev_pollsa` VALUES(8, 2, 'Thiếu thông tin', 1);
INSERT INTO `dev_pollsa` VALUES(9, 2, 'Tôi thích website', 0);
INSERT INTO `dev_pollsa` VALUES(10, 2, 'Tôi không thích', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dev_pollsip`
--

CREATE TABLE `dev_pollsip` (
  `pollip_id` int(10) NOT NULL AUTO_INCREMENT,
  `pollip_qid` varchar(10) NOT NULL DEFAULT '',
  `pollip_aid` varchar(10) NOT NULL DEFAULT '',
  `pollip_ip` varchar(100) NOT NULL DEFAULT '',
  `pollip_host` varchar(200) NOT NULL DEFAULT '',
  `pollip_timestamp` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollip_user` tinytext NOT NULL,
  `pollip_userid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollip_id`),
  KEY `pollip_ip` (`pollip_id`),
  KEY `pollip_qid` (`pollip_qid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `dev_pollsip`
--

INSERT INTO `dev_pollsip` VALUES(1, '1', '1', '127.0.0.2', 'vdloi-PCAA', '1342912772', 'Guest', 0);
INSERT INTO `dev_pollsip` VALUES(2, '2', '8', '127.0.0.3', 'vdloi-PC', '1343171064', 'Guest', 0);
INSERT INTO `dev_pollsip` VALUES(3, '1', '1', '127.0.0.1', 'vdloi-PC', '1343473799', 'Guest', 0);
INSERT INTO `dev_pollsip` VALUES(4, '2', '10', '27.74.167.22', '27.74.167.22', '1345596194', 'admin', 1);
INSERT INTO `dev_pollsip` VALUES(5, '2', '6', '171.242.68.62', '171.242.68.62', '1346194464', 'khanhchi', 4);
INSERT INTO `dev_pollsip` VALUES(6, '1', '1', '27.78.64.243', '27.78.64.243', '1347059975', 'admin', 1);
INSERT INTO `dev_pollsip` VALUES(7, '1', '1', '27.79.78.136', '27.79.78.136', '1347060004', 'Guest', 0);
INSERT INTO `dev_pollsip` VALUES(8, '1', '2', '171.242.146.123', '171.242.146.123', '1347062444', 'khanhchi', 4);
INSERT INTO `dev_pollsip` VALUES(9, '1', '1', '27.74.159.97', '27.74.159.97', '1347062459', 'Guest', 0);
INSERT INTO `dev_pollsip` VALUES(10, '1', '1', '10.166.8.220', '10.166.8.220', '1347276375', 'Guest', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dev_pollsq`
--

CREATE TABLE `dev_pollsq` (
  `pollq_id` int(10) NOT NULL AUTO_INCREMENT,
  `pollq_question` varchar(200) NOT NULL DEFAULT '',
  `pollq_timestamp` varchar(20) NOT NULL DEFAULT '',
  `pollq_totalvotes` int(10) NOT NULL DEFAULT '0',
  `pollq_active` tinyint(1) NOT NULL DEFAULT '1',
  `pollq_expiry` varchar(20) NOT NULL DEFAULT '',
  `pollq_multiple` tinyint(3) NOT NULL DEFAULT '0',
  `pollq_totalvoters` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollq_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dev_pollsq`
--

INSERT INTO `dev_pollsq` VALUES(1, 'Bạn đánh giá về chất lượng dịch vụ A&A Express?', '1342912442', 7, 1, '', 0, 7);
INSERT INTO `dev_pollsq` VALUES(2, 'Bạn đánh giá về Website A&A Express?', '1342914721', 3, 1, '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `dev_postmeta`
--

CREATE TABLE `dev_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1374 ;

--
-- Dumping data for table `dev_postmeta`
--

INSERT INTO `dev_postmeta` VALUES(51, 22, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(49, 22, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(50, 22, '_edit_lock', '1340467497:1');
INSERT INTO `dev_postmeta` VALUES(241, 68, '_wp_old_slug', 'thu-vien-anh');
INSERT INTO `dev_postmeta` VALUES(239, 68, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(240, 68, '_edit_lock', '1340476118:1');
INSERT INTO `dev_postmeta` VALUES(61, 1, '_edit_lock', '1342944106:1');
INSERT INTO `dev_postmeta` VALUES(62, 1, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(233, 63, '_edit_lock', '1340523297:1');
INSERT INTO `dev_postmeta` VALUES(232, 63, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1250, 811, 'position', 'normal');
INSERT INTO `dev_postmeta` VALUES(1272, 837, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1271, 835, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1270, 835, '_edit_lock', '1343406556:1');
INSERT INTO `dev_postmeta` VALUES(1269, 835, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(252, 72, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(253, 72, '_edit_lock', '1340511609:1');
INSERT INTO `dev_postmeta` VALUES(238, 68, 'settings', 'a:11:{s:10:"slideSpeed";s:1:"1";s:16:"descriptionSpeed";s:3:"0.3";s:13:"intervalSpeed";s:1:"5";s:5:"width";s:1:"0";s:6:"height";s:3:"200";s:7:"stretch";s:5:"false";s:12:"controllable";s:4:"true";s:10:"urlsActive";s:5:"false";s:8:"showText";s:4:"true";s:5:"style";s:14:"style-dark.css";s:12:"custom-style";s:0:"";}');
INSERT INTO `dev_postmeta` VALUES(1249, 811, 'rule', 'a:4:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:4:"post";s:8:"order_no";s:1:"0";}');
INSERT INTO `dev_postmeta` VALUES(1248, 811, 'allorany', 'all');
INSERT INTO `dev_postmeta` VALUES(215, 56, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(216, 56, '_edit_lock', '1342943964:1');
INSERT INTO `dev_postmeta` VALUES(1239, 809, '_menu_item_object_id', '807');
INSERT INTO `dev_postmeta` VALUES(1238, 809, '_menu_item_menu_item_parent', '0');
INSERT INTO `dev_postmeta` VALUES(1237, 809, '_menu_item_type', 'post_type');
INSERT INTO `dev_postmeta` VALUES(1251, 811, 'layout', 'default');
INSERT INTO `dev_postmeta` VALUES(1236, 807, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1235, 807, '_edit_lock', '1346343209:1');
INSERT INTO `dev_postmeta` VALUES(1246, 811, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1247, 811, 'field_500d90b0909d4', 'a:9:{s:5:"label";s:6:"Banner";s:4:"name";s:6:"banner";s:4:"type";s:7:"wysiwyg";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:7:"toolbar";s:4:"full";s:12:"media_upload";s:3:"yes";s:3:"key";s:19:"field_500d90b0909d4";s:8:"order_no";s:1:"0";}');
INSERT INTO `dev_postmeta` VALUES(1253, 811, '_edit_lock', '1344098860:1');
INSERT INTO `dev_postmeta` VALUES(1252, 811, 'hide_on_screen', '');
INSERT INTO `dev_postmeta` VALUES(267, 1, '_pronamic_google_maps_active', 'false');
INSERT INTO `dev_postmeta` VALUES(268, 1, '_pronamic_google_maps_latitude', '');
INSERT INTO `dev_postmeta` VALUES(269, 1, '_pronamic_google_maps_longitude', '');
INSERT INTO `dev_postmeta` VALUES(270, 1, '_pronamic_google_maps_map_type', 'roadmap');
INSERT INTO `dev_postmeta` VALUES(271, 1, '_pronamic_google_maps_zoom', '8');
INSERT INTO `dev_postmeta` VALUES(272, 1, '_pronamic_google_maps_title', '');
INSERT INTO `dev_postmeta` VALUES(273, 1, '_pronamic_google_maps_description', '');
INSERT INTO `dev_postmeta` VALUES(274, 1, '_pronamic_google_maps_address', '');
INSERT INTO `dev_postmeta` VALUES(275, 1, '_pronamic_google_maps_geocode_status', '');
INSERT INTO `dev_postmeta` VALUES(279, 79, '_edit_lock', '1343224533:1');
INSERT INTO `dev_postmeta` VALUES(278, 79, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(280, 79, '_pronamic_google_maps_active', 'false');
INSERT INTO `dev_postmeta` VALUES(281, 79, '_pronamic_google_maps_latitude', '');
INSERT INTO `dev_postmeta` VALUES(282, 79, '_pronamic_google_maps_longitude', '');
INSERT INTO `dev_postmeta` VALUES(283, 79, '_pronamic_google_maps_map_type', 'roadmap');
INSERT INTO `dev_postmeta` VALUES(284, 79, '_pronamic_google_maps_zoom', '8');
INSERT INTO `dev_postmeta` VALUES(285, 79, '_pronamic_google_maps_title', '');
INSERT INTO `dev_postmeta` VALUES(286, 79, '_pronamic_google_maps_description', '');
INSERT INTO `dev_postmeta` VALUES(287, 79, '_pronamic_google_maps_address', '');
INSERT INTO `dev_postmeta` VALUES(288, 79, '_pronamic_google_maps_geocode_status', '');
INSERT INTO `dev_postmeta` VALUES(289, 79, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(290, 81, '_pronamic_google_maps_active', 'false');
INSERT INTO `dev_postmeta` VALUES(291, 81, '_pronamic_google_maps_latitude', '');
INSERT INTO `dev_postmeta` VALUES(292, 81, '_pronamic_google_maps_longitude', '');
INSERT INTO `dev_postmeta` VALUES(293, 81, '_pronamic_google_maps_map_type', 'roadmap');
INSERT INTO `dev_postmeta` VALUES(294, 81, '_pronamic_google_maps_zoom', '8');
INSERT INTO `dev_postmeta` VALUES(295, 81, '_pronamic_google_maps_title', '');
INSERT INTO `dev_postmeta` VALUES(296, 81, '_pronamic_google_maps_description', '');
INSERT INTO `dev_postmeta` VALUES(297, 81, '_pronamic_google_maps_address', '');
INSERT INTO `dev_postmeta` VALUES(298, 81, '_pronamic_google_maps_geocode_status', '');
INSERT INTO `dev_postmeta` VALUES(299, 81, '_menu_item_type', 'post_type');
INSERT INTO `dev_postmeta` VALUES(300, 81, '_menu_item_menu_item_parent', '0');
INSERT INTO `dev_postmeta` VALUES(301, 81, '_menu_item_object_id', '79');
INSERT INTO `dev_postmeta` VALUES(302, 81, '_menu_item_object', 'page');
INSERT INTO `dev_postmeta` VALUES(303, 81, '_menu_item_target', '');
INSERT INTO `dev_postmeta` VALUES(304, 81, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `dev_postmeta` VALUES(305, 81, '_menu_item_xfn', '');
INSERT INTO `dev_postmeta` VALUES(306, 81, '_menu_item_url', '');
INSERT INTO `dev_postmeta` VALUES(1264, 816, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `dev_postmeta` VALUES(1263, 816, '_menu_item_target', '');
INSERT INTO `dev_postmeta` VALUES(1262, 816, '_menu_item_object', 'page');
INSERT INTO `dev_postmeta` VALUES(1261, 816, '_menu_item_object_id', '812');
INSERT INTO `dev_postmeta` VALUES(1260, 816, '_menu_item_menu_item_parent', '0');
INSERT INTO `dev_postmeta` VALUES(1259, 816, '_menu_item_type', 'post_type');
INSERT INTO `dev_postmeta` VALUES(1373, 920, '_wp_trash_meta_time', '1347879115');
INSERT INTO `dev_postmeta` VALUES(1372, 920, '_wp_trash_meta_status', 'publish');
INSERT INTO `dev_postmeta` VALUES(1345, 767, '_wp_trash_meta_status', 'draft');
INSERT INTO `dev_postmeta` VALUES(1346, 767, '_wp_trash_meta_time', '1347086007');
INSERT INTO `dev_postmeta` VALUES(326, 72, '_pronamic_google_maps_active', 'false');
INSERT INTO `dev_postmeta` VALUES(327, 72, '_pronamic_google_maps_latitude', '');
INSERT INTO `dev_postmeta` VALUES(328, 72, '_pronamic_google_maps_longitude', '');
INSERT INTO `dev_postmeta` VALUES(329, 72, '_pronamic_google_maps_map_type', 'roadmap');
INSERT INTO `dev_postmeta` VALUES(330, 72, '_pronamic_google_maps_zoom', '8');
INSERT INTO `dev_postmeta` VALUES(331, 72, '_pronamic_google_maps_title', '');
INSERT INTO `dev_postmeta` VALUES(332, 72, '_pronamic_google_maps_description', '');
INSERT INTO `dev_postmeta` VALUES(333, 72, '_pronamic_google_maps_address', '');
INSERT INTO `dev_postmeta` VALUES(334, 72, '_pronamic_google_maps_geocode_status', '');
INSERT INTO `dev_postmeta` VALUES(335, 104, 'form', '<p>Họ tên (*)<br />\n    [text* your-name] </p>\n\n<p>Điện thoại (*)<br />\n    [text* your-name] </p>\n\n<p>Địa chỉ (*)<br />\n    [text* your-name] </p>\n\n<p>Email (*)<br />\n    [email* your-email] </p>\n\n<p>Yêu cầu<br />\n    [text your-subject] </p>\n\n<p>Nội dung<br />\n    [textarea your-message] </p>\n\n<p>[submit "Gửi yêu cầu"]</p>');
INSERT INTO `dev_postmeta` VALUES(336, 104, 'mail', 'a:7:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:26:"[your-name] <[your-email]>";s:4:"body";s:166:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis mail is sent via contact form on AA EXPRESS http://www.vnestore.com/aa";s:9:"recipient";s:20:"lgthnha@yahoo.com.vn";s:18:"additional_headers";s:0:"";s:11:"attachments";s:0:"";s:8:"use_html";s:0:"";}');
INSERT INTO `dev_postmeta` VALUES(337, 104, 'mail_2', 'a:8:{s:6:"active";s:0:"";s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:26:"[your-name] <[your-email]>";s:4:"body";s:108:"Message body:\n[your-message]\n\n--\nThis mail is sent via contact form on AA EXPRESS http://localhost/aaexpress";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:0:"";s:11:"attachments";s:0:"";s:8:"use_html";s:0:"";}');
INSERT INTO `dev_postmeta` VALUES(338, 104, 'messages', 'a:13:{s:12:"mail_sent_ok";s:56:"Cản ơn bạn đã gửi yêu cầu đến AA Express.";s:12:"mail_sent_ng";s:76:"Không thể gửi yêu cầu, vui lòng kiểm tra lại thông tin nhập!";s:16:"validation_error";s:37:"Dữ liệu nhập không hợp lệ!";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:13:"invalid_email";s:24:"Email không hợp lệ!";s:16:"invalid_required";s:44:"Vui lòng nhập thông tin vào mục này!";s:17:"akismet_says_spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:17:"captcha_not_match";s:31:"Your entered code is incorrect.";s:13:"upload_failed";s:22:"Failed to upload file.";s:24:"upload_file_type_invalid";s:30:"This file type is not allowed.";s:21:"upload_file_too_large";s:23:"This file is too large.";s:23:"upload_failed_php_error";s:38:"Failed to upload file. Error occurred.";s:23:"quiz_answer_not_correct";s:27:"Your answer is not correct.";}');
INSERT INTO `dev_postmeta` VALUES(339, 104, 'additional_settings', '');
INSERT INTO `dev_postmeta` VALUES(441, 119, '_menu_item_menu_item_parent', '0');
INSERT INTO `dev_postmeta` VALUES(440, 119, '_menu_item_type', 'post_type');
INSERT INTO `dev_postmeta` VALUES(439, 119, '_pronamic_google_maps_geocode_status', '');
INSERT INTO `dev_postmeta` VALUES(438, 119, '_pronamic_google_maps_address', '');
INSERT INTO `dev_postmeta` VALUES(433, 119, '_pronamic_google_maps_longitude', '');
INSERT INTO `dev_postmeta` VALUES(434, 119, '_pronamic_google_maps_map_type', 'roadmap');
INSERT INTO `dev_postmeta` VALUES(435, 119, '_pronamic_google_maps_zoom', '8');
INSERT INTO `dev_postmeta` VALUES(436, 119, '_pronamic_google_maps_title', '');
INSERT INTO `dev_postmeta` VALUES(437, 119, '_pronamic_google_maps_description', '');
INSERT INTO `dev_postmeta` VALUES(432, 119, '_pronamic_google_maps_latitude', '');
INSERT INTO `dev_postmeta` VALUES(431, 119, '_pronamic_google_maps_active', 'false');
INSERT INTO `dev_postmeta` VALUES(382, 112, '_edit_lock', '1345860139:1');
INSERT INTO `dev_postmeta` VALUES(383, 112, '_pronamic_google_maps_active', 'false');
INSERT INTO `dev_postmeta` VALUES(384, 112, '_pronamic_google_maps_latitude', '');
INSERT INTO `dev_postmeta` VALUES(385, 112, '_pronamic_google_maps_longitude', '');
INSERT INTO `dev_postmeta` VALUES(386, 112, '_pronamic_google_maps_map_type', 'roadmap');
INSERT INTO `dev_postmeta` VALUES(387, 112, '_pronamic_google_maps_zoom', '8');
INSERT INTO `dev_postmeta` VALUES(388, 112, '_pronamic_google_maps_title', '');
INSERT INTO `dev_postmeta` VALUES(389, 112, '_pronamic_google_maps_description', '');
INSERT INTO `dev_postmeta` VALUES(390, 112, '_pronamic_google_maps_address', '');
INSERT INTO `dev_postmeta` VALUES(391, 112, '_pronamic_google_maps_geocode_status', '');
INSERT INTO `dev_postmeta` VALUES(392, 112, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(430, 117, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(429, 117, '_pronamic_google_maps_geocode_status', '');
INSERT INTO `dev_postmeta` VALUES(428, 117, '_pronamic_google_maps_address', '');
INSERT INTO `dev_postmeta` VALUES(427, 117, '_pronamic_google_maps_description', '');
INSERT INTO `dev_postmeta` VALUES(426, 117, '_pronamic_google_maps_title', '');
INSERT INTO `dev_postmeta` VALUES(425, 117, '_pronamic_google_maps_zoom', '8');
INSERT INTO `dev_postmeta` VALUES(424, 117, '_pronamic_google_maps_map_type', 'roadmap');
INSERT INTO `dev_postmeta` VALUES(423, 117, '_pronamic_google_maps_longitude', '');
INSERT INTO `dev_postmeta` VALUES(422, 117, '_pronamic_google_maps_latitude', '');
INSERT INTO `dev_postmeta` VALUES(421, 117, '_pronamic_google_maps_active', 'false');
INSERT INTO `dev_postmeta` VALUES(420, 117, '_edit_lock', '1343404740:1');
INSERT INTO `dev_postmeta` VALUES(419, 117, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(381, 112, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(442, 119, '_menu_item_object_id', '117');
INSERT INTO `dev_postmeta` VALUES(443, 119, '_menu_item_object', 'page');
INSERT INTO `dev_postmeta` VALUES(444, 119, '_menu_item_target', '');
INSERT INTO `dev_postmeta` VALUES(445, 119, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `dev_postmeta` VALUES(446, 119, '_menu_item_xfn', '');
INSERT INTO `dev_postmeta` VALUES(447, 119, '_menu_item_url', '');
INSERT INTO `dev_postmeta` VALUES(1276, 839, '_edit_lock', '1343406742:1');
INSERT INTO `dev_postmeta` VALUES(1277, 839, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1283, 852, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1284, 852, '_edit_lock', '1344876617:1');
INSERT INTO `dev_postmeta` VALUES(1285, 852, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1286, 854, '_menu_item_type', 'post_type');
INSERT INTO `dev_postmeta` VALUES(1287, 854, '_menu_item_menu_item_parent', '0');
INSERT INTO `dev_postmeta` VALUES(1288, 854, '_menu_item_object_id', '852');
INSERT INTO `dev_postmeta` VALUES(1289, 854, '_menu_item_object', 'page');
INSERT INTO `dev_postmeta` VALUES(1290, 854, '_menu_item_target', '');
INSERT INTO `dev_postmeta` VALUES(1291, 854, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `dev_postmeta` VALUES(1292, 854, '_menu_item_xfn', '');
INSERT INTO `dev_postmeta` VALUES(1293, 854, '_menu_item_url', '');
INSERT INTO `dev_postmeta` VALUES(1341, 852, '_wp_trash_meta_status', 'publish');
INSERT INTO `dev_postmeta` VALUES(1337, 837, '_wp_trash_meta_status', 'publish');
INSERT INTO `dev_postmeta` VALUES(1338, 837, '_wp_trash_meta_time', '1347086006');
INSERT INTO `dev_postmeta` VALUES(1342, 852, '_wp_trash_meta_time', '1347086006');
INSERT INTO `dev_postmeta` VALUES(1301, 859, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1302, 859, '_edit_lock', '1345862712:1');
INSERT INTO `dev_postmeta` VALUES(1303, 859, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1304, 861, '_menu_item_type', 'post_type');
INSERT INTO `dev_postmeta` VALUES(1305, 861, '_menu_item_menu_item_parent', '0');
INSERT INTO `dev_postmeta` VALUES(1306, 861, '_menu_item_object_id', '859');
INSERT INTO `dev_postmeta` VALUES(1307, 861, '_menu_item_object', 'page');
INSERT INTO `dev_postmeta` VALUES(1308, 861, '_menu_item_target', '');
INSERT INTO `dev_postmeta` VALUES(1309, 861, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `dev_postmeta` VALUES(1310, 861, '_menu_item_xfn', '');
INSERT INTO `dev_postmeta` VALUES(1311, 861, '_menu_item_url', '');
INSERT INTO `dev_postmeta` VALUES(1275, 839, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1274, 837, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1273, 837, '_edit_lock', '1343406675:1');
INSERT INTO `dev_postmeta` VALUES(1266, 816, '_menu_item_url', '');
INSERT INTO `dev_postmeta` VALUES(1265, 816, '_menu_item_xfn', '');
INSERT INTO `dev_postmeta` VALUES(1256, 812, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1255, 812, '_edit_lock', '1344875928:1');
INSERT INTO `dev_postmeta` VALUES(1254, 812, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1152, 762, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1153, 762, '_edit_lock', '1342946009:1');
INSERT INTO `dev_postmeta` VALUES(1154, 762, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1234, 807, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1233, 805, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1232, 805, '_edit_lock', '1345818547:1');
INSERT INTO `dev_postmeta` VALUES(1231, 805, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1165, 767, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1166, 767, '_edit_lock', '1343066576:1');
INSERT INTO `dev_postmeta` VALUES(1371, 920, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1172, 775, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1173, 775, '_edit_lock', '1345819016:1');
INSERT INTO `dev_postmeta` VALUES(1174, 775, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1185, 778, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1184, 778, '_edit_lock', '1342803773:1');
INSERT INTO `dev_postmeta` VALUES(1183, 778, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1194, 781, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1195, 781, '_edit_lock', '1342804280:1');
INSERT INTO `dev_postmeta` VALUES(1196, 781, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1209, 788, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1210, 788, '_edit_lock', '1342804618:1');
INSERT INTO `dev_postmeta` VALUES(1216, 795, '_edit_lock', '1342944471:1');
INSERT INTO `dev_postmeta` VALUES(1215, 795, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1222, 798, '_edit_lock', '1343406973:1');
INSERT INTO `dev_postmeta` VALUES(1221, 798, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1226, 800, '_edit_lock', '1343060306:1');
INSERT INTO `dev_postmeta` VALUES(1225, 800, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1240, 809, '_menu_item_object', 'page');
INSERT INTO `dev_postmeta` VALUES(1241, 809, '_menu_item_target', '');
INSERT INTO `dev_postmeta` VALUES(1242, 809, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `dev_postmeta` VALUES(1243, 809, '_menu_item_xfn', '');
INSERT INTO `dev_postmeta` VALUES(1244, 809, '_menu_item_url', '');
INSERT INTO `dev_postmeta` VALUES(1363, 915, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1364, 915, '_edit_lock', '1347850444:1');
INSERT INTO `dev_postmeta` VALUES(1365, 915, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1366, 918, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1367, 918, '_edit_lock', '1347850610:1');
INSERT INTO `dev_postmeta` VALUES(1368, 918, '_wp_page_template', 'default');
INSERT INTO `dev_postmeta` VALUES(1369, 920, '_edit_last', '1');
INSERT INTO `dev_postmeta` VALUES(1370, 920, '_edit_lock', '1347853185:1');

-- --------------------------------------------------------

--
-- Table structure for table `dev_posts`
--

CREATE TABLE `dev_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=938 ;

--
-- Dumping data for table `dev_posts`
--

INSERT INTO `dev_posts` VALUES(1, 1, '2012-06-17 17:34:55', '2012-06-17 17:34:55', 'ICTnews – Theo hầu hết các doanh nghiệp trong nước, thị trường bưu chính, chuyển phát nhanh năm 2009, dù vẫn còn những khó khăn nhưng không đáng lo ngại.\r\nBưu chính không lo ngại\r\nNăm 2008, lạm phát và bão giá hoành hành, đặc biệt giá xăng dầu (một nguyên liệu đầu vào quan trọng của ngành bưu chính, chuyển phát nhanh) có lúc tăng tới 40%, song các doanh nghiệp bưu chính, chuyển phát nhanh trong nước vẫn tăng trưởng cả về sản lượng và doanh thu, cho dù mức tăng này có thấp hơn những năm trước. Năm 2009 và thậm chí là sang năm 2010, nền kinh tế thế giới và Việt Nam dự báo vẫn tiếp tục gặp nhiều khó khăn và chưa có dấu hiệu phục hồi. Sức mua các dịch vụ bưu chính có nguy cơ giảm đi rõ rệt. Điều này ảnh hưởng rất nhiều đến ngành bưu chính, bởi sức tăng trưởng của dịch vụ bưu chính phụ thuộc rất nhiều vào nhu cầu tiêu dùng của xã hội, vào nhu cầu mua sắm của người dân, vào việc lưu chuyển hàng hoá, trao đổi qua lại của mọi người.\r\n\r\nÔng Nguyễn Việt Dũng, Giám đốc Bưu điện TPHCM – nơi dịch vụ bưu chính cạnh tranh sôi động nhất cả nước cho rằng, tiềm năng thị trường bưu chính vẫn còn nhiều, hiện Bưu điện TPHCM mới chỉ chiếm lĩnh được khoảng trên 40%, cho nên vẫn còn nhiều cơ hội để phát triển. Vấn đề quan trọng là phải tìm được chiến lược cạnh tranh phù hợp. Hướng đi của TPHCM là sẽ tập trung nâng cao sản lượng và chất lượng các dịch vụ bưu chính truyền thống, dịch vụ chuyển phát nhanh, nhóm dịch vụ tài chính bưu chính. Cốt lõi sẽ tập trung đào tạo nhân lực, chăm sóc khách hàng, ứng dụng mạnh CNTT để nâng cao chất lượng dịch vụ.\r\n\r\nÔng Nguyễn Văn Tiến – Giám đốc Bưu điện Vĩnh Phúc cũng cho rằng, hiện các khu công nghiệp, các doanh nghiệp tiếp tục mở ra tại nhiều tỉnh là tiềm năng rất lớn cho dịch vụ bưu chính, chuyển phát phát triển. Bưu điện Vĩnh Phúc hiện mới chỉ chiếm được 30-40% thị phần dịch vụ bưu chính trên địa bàn tỉnh, cho nên cơ hội để giành lấy thị trường còn rất lớn. Ông Tiến cho biết, bưu chính cần tập trung phát triển các dịch vụ “lõi” của bưu chính, nhất là nhóm dịch vụ bưu chính, chuyển phát nhanh, phát hành báo chí, các dịch vụ tài chính bưu chính. Năm 2008, riêng nhóm dịch vụ thuần bưu chính, Bưu điện tỉnh Vĩnh Phúc tăng 18% so với năm 2007, năm 2009 dự kiến sẽ tăng khoảng 25% so với năm 2008. Với cơ sở vật chất như hiện nay, với tiềm năng thị trường còn rất lớn, không có lý do gì mà bưu chính không thể phát triển được. Ông Tiến đề xuất, Bưu chính Việt Nam cần mạnh dạn trong việc giải quyết bài toán lao động, đồng thời thực hiện một cơ chế khoán doanh thu giống như cơ chế “khoán 10” trong bưu chính để có thể nhanh chóng chống lỗ cho bưu chính.\r\n\r\nChuyển phát nhanh sẽ tăng chậm lại\r\n\r\nHiện dịch vụ EMS đang nắm giữ thị phần chuyển phát nhanh trong nước lớn nhất. Bà Đặng Thị Bích Hoà – Chủ tịch HĐQT kiêm Tổng giám đốc VNPost Express cho rằng, lạm phát khiến tốc độ tăng trưởng của dịch vụ EMS trong vòng 3-4 năm tới có nguy cơ chậm lại. Tuy nhiên nhu cầu vận chuyển của xã hội sẽ tiếp tục tăng, một mặt công ty đang có những chiến lược đầu tư để giữ vững thị phần và nâng cao chất lượng dịch vụ cho nên năm 2009 EMS dù có khó khăn hơn nhưng vẫn giữ vững được vai trò chủ đạo.\r\n\r\nÔng Phó Đức Hùng - Phó giám đốc Công ty Bưu chính Viettel, doanh nghiệp ở vị trí số 2 trong thị trường chuyển phát nhanh trong nước cho rằng, năm 2009 sẽ không có tăng trưởng đột biến. Khách hàng, lượng hàng hoá và tổng doanh thu của “miếng bánh” chuyển phát sẽ không tăng nhiều. Bưu chính Viettel (VTP) xác định dù có “quyết chiến” đi chăng nữa thì doanh thu chuyển phát nhanh của VTP năm 2009 tăng khoảng 40% so với 2008, trong khi những năm trước mức tăng trưởng năm sau so với những năm trước từ 80-100%.\r\n\r\nNhóm các doanh nghiệp nhỏ hơn, bắt đầu xây dựng được thương hiệu trên thị trường chuyển phát nhanh như: Netco, Tân Sơn Nhất, Hợp Nhất cũng đã có mức tăng trưởng ngoạn mục trong nhiều năm. Các doanh nghiệp này cho biết, năm 2009 tuy có dấu hiệu chậm hơn nhưng cũng không đáng lo ngại. Năm 2008 họ vẫn phát triển thêm được nhiều khách hàng mới, cho nên dù số lượng hàng gửi của mỗi khách hàng có giảm đi nhưng sản lượng tổng thể vẫn tăng. Giá xăng dầu giảm tới hơn 30% là tín hiệu đáng mừng cho ngành chuyển phát, bởi họ không phải tăng thêm phụ phí xăng dầu, giá dịch vụ mà khách hàng phải trả sẽ giảm.\r\n\r\n“Cá bé” coi chừng bị thôn tính\r\n\r\nNăm 2009, cuộc cạnh tranh trong lĩnh vực chuyển phát nhanh vốn đã khốc liệt nay lại càng khốc liệt hơn và các doanh nghiệp kinh doanh kém hiệu quả sẽ có nguy cơ bị thôn tính. Thực tế, chuyển phát nhanh là một trong số ít dịch vụ bưu chính bị cạnh tranh đầu tiên. Năm 2004, theo số liệu do của các Sở Kế hoạch và Đầu tư, tại Hà Nội và TPHCM có khoảng trên 200 doanh nghiệp đăng ký kinh doanh dịch vụ chuyển phát nhanh. Nhưng trong đợt thanh tra trên diện rộng dịch vụ chuyển phát do Thanh tra Bộ TT&TT tiến hành hồi giữa năm 2008 hiện chỉ có khoảng hơn 50 doanh nghiệp đang hoạt động. Qua thanh tra cho thấy, có nhiều doanh nghiệp đăng ký kinh doanh dịch vụ chuyển phát nhưng không hoạt động hoặc hoạt động không hiệu quả đã không còn tồn tại nữa.\r\n\r\nThực tế trong những năm qua, chỉ có duy nhất dịch vụ EMS của VNPT là cung cấp toàn quốc, còn các doanh nghiệp khác chỉ cung cấp dịch vụ ở những thành phố lớn, nơi có sản lượng nhiều và dễ tổ chức mạng lưới. Nhiều doanh nghiệp mới ra đời, do vốn ít, nhân lực mỏng nên thường chỉ hoạt động ở tuyến Hà Nội, TP.Hồ Chí Minh, còn những gói dịch vụ liên tỉnh, các công ty này thu gom và tái gửi lại trên mạng bưu chính công cộng. Tình trạng kinh doanh trên lưng của người khác kiểu này sẽ khó tiếp diễn trong năm tới.\r\n\r\nChưa hết, nguy cơ sụt giảm doanh thu từ việc làm đại lý thu gom và phát hàng quốc tế cũng dần hiện ra. Từ hơn 10 năm nay, Việt Nam đã có mặt hàng chục hãng chuyển phát quốc tế hàng đầu như DHL, Fedex, TNT, DPD, các hãng này hợp tác chủ yếu với Bưu chính Việt Nam theo hình thức đại lý, hoa hồng đại lý chiếm tới 1/3 tổng doanh thu của dịch vụ EMS. Tuy nhiên, từ năm 2006 trở lại đây mức hoa hồng ngày càng giảm. Cụ thể, năm 2006 đạt 87 tỷ đồng, đến năm 2007 giảm còn 69 tỷ đồng, năm 2008 còn thấp hơn con số này. Ông Đỗ Ngọc Bình – Tổng giám đốc Tổng công ty Bưu chính Việt Nam (VNPost) nhận định, theo cam kết gia nhập WTO, năm 2011 các doanh nghiệp nước ngoài được phép thành lập doanh nghiệp 100% vốn kinh doanh dịch vụ chuyển phát nhanh. Nguy cơ các hãng lớn sẽ rời bỏ các đại lý để lập doanh nghiệp 100% vốn không còn bao xa nữa. Và đến thời điểm đó các doanh nghiệp trong nước không những mất đi nguồn thu lớn mà còn có nguy cơ phải cạnh tranh với các đối thủ nặng ký, cho nên doanh nghiệp nội cần có sự chuẩn bị trước để đối mặt với những thách thức này.\r\n\r\nMinh Quyên – Ngọc Minh\r\n\r\nĐọc toàn bộ bài viết trên báo Bưu điện Việt Nam số Xuân Kỷ Sửu 2009', 'Bưu chính: Thách thức và cơ hội', '', 'trash', 'open', 'open', '', 'hello-world', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 0);
INSERT INTO `dev_posts` VALUES(22, 1, '2012-06-22 16:56:57', '2012-06-22 16:56:57', '<table border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top" width="100%">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td valign="top">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<div align="justify"><em>ICTnews</em> – Theo hầu hết các doanh nghiệp trong nước, thị trường bưu chính, chuyển phát nhanh năm 2009, dù vẫn còn những khó khăn nhưng không đáng lo ngại.</div>\r\n<div align="justify"></div></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top" width="100%">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%">Phạt 5 doanh nghiệp chuyển phát</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<div align="justify"><em>ICTnews -</em> Thanh tra Bộ TT&amp;TT đã kiến nghị Chánh thanh tra Bộ xử phạt 5 doanh nghiệp chuyển phát với tổng số tiền 49 triệu đồng.</div>\r\n<div align="justify">Đây là kiến nghị của Đoàn thanh tra sau khi làm việc tại 3 tỉnh: Thừa Thiên Huế, Đà Nẵng và Quảng Ngãi trong thời gian từ ngày 15/7 đến 1/8/2008.</div>\r\n<div align="justify"></div></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%">Định mức thời gian kiểm hoá bưu gửi quốc tế</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<div align="justify">\r\n\r\n<img src="http://www.aa-express.net/images/stories/buugui.bmp" alt="" width="150" height="82" align="right" border="0" />Khả thi hay không khả thi? - <em>ICTnews</em> - Hiện VNPT đã có định mức thời gian xử lý công đoạn trong nước đối với thư quốc tế chiều đến. Tuy nhiên, bưu kiện, hàng hoá quốc tế chiều đến lại chưa được quy định về thời gian xử lý trong nước.\r\n\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Tin tức', '', 'draft', 'open', 'open', '', 'tin-tuc-cong-ty', '', '', '2012-09-17 17:51:51', '2012-09-17 10:51:51', '', 0, 'http://localhost/aaexpress/?page_id=22', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(894, 4, '2012-06-24 17:09:55', '2012-06-24 10:09:55', '<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ chuyển phát nhanh</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900;">L</span>à dịch vụ vận chuyển thư từ, hàng hóa trong nước từ TP HCM hoặc TP Hà Nội đi tất cả các 64 tỉnh thành trong cả nước.\r\nDịch vụ này có thời gian quy định cụ thể 6h-&gt;72h tùy theo khu vực phát.</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=89" rel="attachment wp-att-89"><img class=" wp-image-89 aligncenter" title="fan2011990" src="http://localhost/aaexpress/wp-content/uploads/2012/06/fan2011990.png" alt="" width="153" height="119" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ phát trước 9h sáng</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900;">L</span>à dịch vụ rất tiện lợi khi khách hàng gửi tài liệu hàng hóa trước 17h mà yêu cầu A&amp;A phát trước 9h sáng hôm sau áp dụng trung tâm các tỉnh như : Hà Nội, Đà Nẵng, Cần Thơ, Nha Trang (Dịch vụ này có cộng thêm phí).</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=85" rel="attachment wp-att-85"><img class=" wp-image-85 aligncenter" title="A350" src="http://localhost/aaexpress/wp-content/uploads/2012/06/A350.png" alt="" width="153" height="113" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ điện hoa</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><strong><span style="color: #ff9900;">K</span></strong>hi khách hàng cần tặng hoa, quà đến người thân, cơ quan tổ chức, hội nghị liên hoan, khai trương, ma chay ... A&amp;A sẽ phục vụ Quý Khách được nhu cầu này.</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=86" rel="attachment wp-att-86"><img class=" wp-image-86 aligncenter" title="bld009124" src="http://localhost/aaexpress/wp-content/uploads/2012/06/bld009124.png" alt="" width="153" height="102" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ chuyển phát nhanh hỏa tốc (Phát trong ngày)</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900;">Đ</span>ây là dịch vụ mà khi khách hàng có nhu cầu chuyển gấp tài liệu, hàng hóa, hồ sơ đi từ <strong>TP HCM</strong> đi <strong>TP Hà Nội</strong>, <strong>Đà Nẵng</strong>,<strong>Hải Phòng</strong>, <strong>Hà Đông</strong>, <strong>Cần Thơ</strong>, <strong>Vũng Tàu</strong> ... để đến được trong ngày quý khách vui lòng sử dụng dịch vụ phát trong ngày (PTN).\r\nThời gian nhận hàng trước <strong>11h30</strong> thời gian phát hàng muộn nhất là <strong>19h30</strong> cùng ngày. (Dịch vụ này có cộng thêm cước phí).</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=87" rel="attachment wp-att-87"><img class=" wp-image-87 aligncenter" title="ddl_67a_7162" src="http://localhost/aaexpress/wp-content/uploads/2012/06/ddl_67a_7162.png" alt="" width="153" height="114" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"> <strong><span style="color: #800000;">Dịch vụ vận chuyển hàng bằng đường bộ</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900; font-size: large;">K</span>hi khách hàng có hàng chuyển đi mà không cần nhanh thì quý khách vui lòng sử dụng dịch vụ này. Dịch vụ này sẻ tiết kiệm được đáng kể chi phí của khách hàng. Nhưng thời gian giao hàng chậm hơn so với dịch vụ chuyển phát nhanh là 3-4 ngày.</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=88" rel="attachment wp-att-88"><img class=" wp-image-88 aligncenter" title="ti0601054" src="http://localhost/aaexpress/wp-content/uploads/2012/06/ti0601054.png" alt="" width="153" height="113" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;', 'Dịch vụ', '', 'inherit', 'open', 'open', '', '79-revision-18', '', '', '2012-06-24 17:09:55', '2012-06-24 10:09:55', '', 79, 'http://www.vnestore.com/aa/79-revision-18/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(79, 1, '2012-06-24 10:17:25', '2012-06-24 03:17:25', '<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ chuyển phát nhanh</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900;">L</span>à dịch vụ vận chuyển thư từ, hàng hóa trong nước từ TP HCM hoặc TP Hà Nội đi tất cả các 64 tỉnh thành trong cả nước.\r\nDịch vụ này có thời gian quy định cụ thể 6h-&gt;72h tùy theo khu vực phát.</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=89" rel="attachment wp-att-89"><img class=" wp-image-89 aligncenter" title="fan2011990" src="http://localhost/aaexpress/wp-content/uploads/2012/06/fan2011990.png" alt="" width="153" height="119" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ phát trước 9h sáng</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900;">L</span>à dịch vụ rất tiện lợi khi khách hàng gửi tài liệu hàng hóa trước 17h mà yêu cầu A&amp;A phát trước 9h sáng hôm sau áp dụng trung tâm các tỉnh như : Hà Nội, Đà Nẵng, Cần Thơ, Nha Trang (Dịch vụ này có cộng thêm phí).</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=85" rel="attachment wp-att-85"><img class=" wp-image-85 aligncenter" title="A350" src="http://localhost/aaexpress/wp-content/uploads/2012/06/A350.png" alt="" width="153" height="113" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ điện hoa</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><strong><span style="color: #ff9900;">K</span></strong>hi khách hàng cần tặng hoa, quà đến người thân, cơ quan tổ chức, hội nghị liên hoan, khai trương, ma chay ... A&amp;A sẽ phục vụ Quý Khách được nhu cầu này.</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=86" rel="attachment wp-att-86"><img class=" wp-image-86 aligncenter" title="bld009124" src="http://localhost/aaexpress/wp-content/uploads/2012/06/bld009124.png" alt="" width="153" height="102" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ chuyển phát nhanh hỏa tốc (Phát trong ngày)</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900;">Đ</span>ây là dịch vụ mà khi khách hàng có nhu cầu chuyển gấp tài liệu, hàng hóa, hồ sơ đi từ <strong>TP HCM</strong> đi <strong>TP Hà Nội</strong>, <strong>Đà Nẵng</strong>,<strong>Hải Phòng</strong>, <strong>Hà Đông</strong>, <strong>Cần Thơ</strong>, <strong>Vũng Tàu</strong> ... để đến được trong ngày quý khách vui lòng sử dụng dịch vụ phát trong ngày (PTN).\r\nThời gian nhận hàng trước <strong>11h30</strong> thời gian phát hàng muộn nhất là <strong>19h30</strong> cùng ngày. (Dịch vụ này có cộng thêm cước phí).</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=87" rel="attachment wp-att-87"><img class=" wp-image-87 aligncenter" title="ddl_67a_7162" src="http://localhost/aaexpress/wp-content/uploads/2012/06/ddl_67a_7162.png" alt="" width="153" height="114" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"> <strong><span style="color: #800000;">Dịch vụ vận chuyển hàng bằng đường bộ</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900; font-size: large;">K</span>hi khách hàng có hàng chuyển đi mà không cần nhanh thì quý khách vui lòng sử dụng dịch vụ này. Dịch vụ này sẻ tiết kiệm được đáng kể chi phí của khách hàng. Nhưng thời gian giao hàng chậm hơn so với dịch vụ chuyển phát nhanh là 3-4 ngày.</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=88" rel="attachment wp-att-88"><img class=" wp-image-88 aligncenter" title="ti0601054" src="http://localhost/aaexpress/wp-content/uploads/2012/06/ti0601054.png" alt="" width="153" height="113" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;', 'Dịch vụ', '', 'draft', 'open', 'open', '', 'dich-vu', '', '', '2012-09-17 17:51:35', '2012-09-17 10:51:35', '', 0, 'http://localhost/aaexpress/?page_id=79', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(817, 4, '2012-08-28 22:52:34', '2012-08-28 15:52:34', '<object width="570" height="230" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"><param name="quality" value="high" /><param name="src" value="http://www.vnestore.com/aa/wp-content/themes/easel/images/HomeBanner.swf" /><param name="pluginspage" value="http://www.macromedia.com/go/getflashplayer" /><embed width="570" height="230" type="application/x-shockwave-flash" src="http://www.vnestore.com/aa/wp-content/themes/easel/images/HomeBanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" /> </object>\r\n\r\n&nbsp;\r\n\r\n<span style="font-size: 17px; color: #a8040a;">Chào mừng bạn đến với A&amp;A Express</span>\r\n\r\n<strong><span style="color: #a8040a;">AA Express</span></strong> là công ty hàng đầu trong lĩnh vực chuyển phát nhanh tài liệu, hàng hóa trong nước và Quốc tế. Nhận từ tay người gửi, phát đến tay người nhận trong thời gian <span style="color: #008000;"><strong>NGẮN NHẤT</strong></span>, đảm bảo tuyệt đối <span style="color: #008000;"><strong>AN TOÀN</strong>,<strong>HIỆU QUẢ</strong></span>.\r\n\r\nVới đội ngũ nhân viên chuyên nghiệp và năng động, <span style="color: #a8040a;"><strong>AA Express</strong></span> luôn phấn đấu nỗ lực vì lợi ích khách hàng. Hiện nay công ty chúng tôi vẫn và đang hoàn thiện mở rộng quy mô phục vụ và đa dạng hóa các loại hình dịch vụ nhằm đảm bảo chất lượng phục vụ cho mọi khách hàng.\r\n\r\n<strong><span style="color: #a8040a;">AA Express</span></strong> sẵn sàng đáp ứng với các phương thức:\r\n<ul>\r\n	<li>Giao nhận hàng tại địa chỉ quý khách</li>\r\n	<li>Không giới hạn về số lượng, trọng lượng.</li>\r\n	<li>Khai thác, quản lý, vận chuyển hàng hóa, tài liệu.</li>\r\n	<li>24/24 trong ngày đến hơn 60 tỉnh thành phố trong cả nước và hơn 200 quốc gia trên thế giới.</li>\r\n</ul>\r\n<strong>Đặc biệt</strong>:\r\n<ul>\r\n	<li>Tra cứu thông tin bưu phẩm thông qua website.</li>\r\n	<li>Tra cứu trọng lượng gói bưu phẩm muốn vận chuyển.</li>\r\n</ul>\r\n&nbsp;\r\n<table width="100%" border="0" cellspacing="5" cellpadding="5">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vcduongbo.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vchangkhong.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vcduongthuy.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/dvdienhoa.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n</tr>\r\n<tr>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nĐƯỜNG BỘ</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nHÀNG KHÔNG</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nĐƯỜNG THỦY</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>DỊCH VỤ\r\nĐIỆN HOA</strong></span></a></span></td>\r\n</tr>\r\n<tr>\r\n<td colspan="4"></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Trang chủ', '', 'inherit', 'open', 'open', '', '807-autosave', '', '', '2012-08-28 22:52:34', '2012-08-28 15:52:34', '', 807, 'http://localhost/aaexpress/807-autosave/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(811, 1, '2012-07-24 00:58:08', '2012-07-23 17:58:08', '', 'Banner', '', 'publish', 'closed', 'closed', '', 'acf_banner', '', '', '2012-07-24 00:58:08', '2012-07-23 17:58:08', '', 0, 'http://localhost/aaexpress/?post_type=acf&#038;p=811', 0, 'acf', '', 0);
INSERT INTO `dev_posts` VALUES(895, 4, '2012-07-22 15:00:25', '2012-07-22 08:00:25', 'Khả thi hay không khả thi? \r\n\r\nICTnews - Hiện VNPT đã có định mức thời gian xử lý công đoạn trong nước đối với thư quốc tế chiều đến. Tuy nhiên, bưu kiện, hàng hoá quốc tế chiều đến lại chưa được quy định về thời gian xử lý trong nước.\r\n\r\nCâu hỏi đặt ra là xây dựng định mức về thời gian kiểm hoá bưu kiện, hàng hoá quốc tế chiều đến liệu có thực hiện được hay không?\r\n\r\nNgày 2/1/2007, Tập đoàn BCVT Việt Nam (VNPT) đã ban hành Quy định tạm thời về hệ thống chỉ tiêu chất lượng chuyển phát thư và báo chí nhằm nâng cao chất lượng 2 dịch vụ này trên mạng bưu chính. Bộ Thông tin và Truyền thông (TT&TT) cũng đang trong quá trình tập hợp ý kiến đóng góp để xây dựng Quy chuẩn quốc gia “Chất lượng dịch vụ bưu chính phổ cập và dịch vụ chuyển phát báo chí công ích”.\r\n\r\nTrong dự thảo, quy định về thời gian xử lý trong nước đối với thư quốc tế chiều đến tối đa là J+5 với tỷ lệ đạt chuẩn tối đa là 60% tổng số thư (J là ngày mà hãng vận chuyển quốc tế giao bưu gửi cho Bưu cục ngoại dịch của VNPT). Quy định này có thể hiểu là từ khi thư, bưu phẩm được chuyển đến Việt Nam tới khi phát tới tay người nhận là 5 ngày. Dự thảo này cũng phù hợp với định mức Quy định tạm thời mà VNPT đã đề ra. Nhiều ý kiến cho rằng, việc định mức thời gian xử lý thư quốc tế chiều đến là thực hiện được bởi các thủ tục đơn giản hơn. Tuy nhiên, một mảng quan trọng khác là bưu kiện, hàng hoá quốc tế chiều đến thì chưa được VNPT đặt ra định mức về thời gian.\r\n\r\nHàng hoá quốc tế gửi qua đường bưu điện chủ yếu là hàng quà biếu. Do đó, hàng qua cửa khẩu bưu điện có đặc thù là hàng đa chủng loại, xuất xứ từ nhiều nguồn gốc khác nhau, số lượng nhỏ lẻ. Lưu lượng hàng hoá cũng không đồng đều. Hiện hàng quốc tế gửi qua bưu điện được VNPT tổ chức thông quan tại hai Trung tâm Bưu chính liên tỉnh và quốc tế 1 và 2 (VPS1 và VPS2) ở Hà Nội và TPHCM.\r\n\r\nVì người nhận bưu phẩm, bưu kiện quốc tế nằm rải rác ở nhiều tỉnh, thành phố, theo quy định hiện hành, bưu điện thay mặt cho khách hàng làm thủ tục hải quan, đóng thuế sau đó chuyển đi các tỉnh. Như vậy, VPS1 và VPS2 đều có bộ phận chuyên trách làm thủ tục hải quan sau đó chuyển tiếp hàng đi, bưu điện các tỉnh khi phát hàng cho khách sẽ thu thuế và chuyển trả tiền thuế đã ứng trước về cho VPS.\r\n\r\nÔng Nguyễn Vĩnh Phúc – Chi cục trưởng Chi cục Hải quan Bưu điện Hà Nội cho rằng: “Việc quy định chuẩn hoá thời gian kiểm hoá bưu gửi quốc tế chiều đến hoàn toàn có thể thực hiện được nếu như cả 2 bên hải quan và bưu điện phối hợp chặt chẽ với nhau”. Ông Phúc cho biết, từ 3 năm nay Chi cục Hải quan Bưu điện Hà Nội và VPS1 đã có quy chế phối hợp qua đó đẩy nhanh tiến trình kiểm hoá lên rất nhiều. Phía Hải quan đã bố trí người sẵn sàng làm việc bất cứ lúc nào bưu điện khai thác hàng quốc tế. Tiêu chí được đặt ra là hàng phải được kiểm hoá ngay trong ngày, cho nên khi bưu điện khai thác và xuất trình lên là Hải quan khai thác hết trong ngày. Theo đánh giá của ông Phúc, mặc dù 2 bên đã tổ chức các lớp tập huấn về khai thuê hải quan cho nhân viên bưu điện, nhưng trong thực tế trình độ của đội ngũ công nhân làm nhiệm vụ này không đồng đều. Hàng qua Hải quan Bưu điện là hàng phi mậu dịch, nhiều đơn hàng không có trong biểu giá thuế tối thiểu, nhân viên bưu điện khai giá thấp hơn giá thị trường, Hải quan phải đi khảo lại giá để tính thuế đúng, mất nhiều thời gian.\r\n\r\nTheo tìm hiểu của báo BĐVN, không ít trường hợp hàng về đến bưu cục ngoại dịch tới hơn 1 tháng, thậm chí 2 tháng sau mới được thông quan. Một lý do cơ bản được kể đến là do chờ thẩm định lại giá tính thuế. Ông Phúc cho rằng, nếu người khai thuế có hiểu biết về thương phẩm, khai đúng giá, đầu tư máy soi tốt, quá trình làm việc tính toán làm sao bỏ bớt được thời gian chết thì định mức về thời gian thông quan sẽ thực hiện được.\r\n\r\nTuy nhiên, bà Lê Thị Khang – Phó Giám đốc VPS1 lại không đồng tình với ý kiến của ông Phúc. Bà cho biết, với bưu kiện, hàng hoá nhập khẩu thì bưu điện khó có thể chủ động được về thời gian. Vì hàng qua bưu điện đủ các chủng loại, từ quần áo, giầy dép, thuốc tân dược, đồ gia dụng, băng đĩa, sách báo… Thông thường, hàng miễn thuế thông quan nhanh chỉ trong vòng 2-3 ngày. Nhưng đối với hàng tính thuế hoặc hàng nhập khẩu có điều kiện phải phụ thuộc vào Hải quan và các cơ quan chuyên ngành khác thẩm định nội dung và tính thuế, do đó ảnh hưởng tới thời gian toàn trình. “Khó có thể định mức được thời gian kiểm hoá đối với hàng hoá qua bưu điện, mà chỉ có thể đưa ra những biện pháp để giải phóng hàng nhanh nhất”, bà Khang nói.\r\n\r\nMặc dù vẫn có hai luồng ý kiến khác nhau trong vấn đề này nhưng trong điều kiện nào thì việc tính toán để rút ngắn thời gian chuyển phát bưu phẩm, bưu kiện nói chung, để nâng cao chất lượng là tiêu chí đầu tiên mà Bưu chính Việt Nam cần quan tâm.', 'Định mức thời gian kiểm hoá bưu gửi quốc tế', '', 'inherit', 'open', 'open', '', '56-revision-4', '', '', '2012-07-22 15:00:25', '2012-07-22 08:00:25', '', 56, 'http://www.vnestore.com/aa/56-revision-4/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(56, 1, '2012-06-23 23:08:35', '2012-06-23 16:08:35', 'Khả thi hay không khả thi? \r\n\r\nICTnews - Hiện VNPT đã có định mức thời gian xử lý công đoạn trong nước đối với thư quốc tế chiều đến. Tuy nhiên, bưu kiện, hàng hoá quốc tế chiều đến lại chưa được quy định về thời gian xử lý trong nước.\r\n\r\nCâu hỏi đặt ra là xây dựng định mức về thời gian kiểm hoá bưu kiện, hàng hoá quốc tế chiều đến liệu có thực hiện được hay không?\r\n\r\nNgày 2/1/2007, Tập đoàn BCVT Việt Nam (VNPT) đã ban hành Quy định tạm thời về hệ thống chỉ tiêu chất lượng chuyển phát thư và báo chí nhằm nâng cao chất lượng 2 dịch vụ này trên mạng bưu chính. Bộ Thông tin và Truyền thông (TT&TT) cũng đang trong quá trình tập hợp ý kiến đóng góp để xây dựng Quy chuẩn quốc gia “Chất lượng dịch vụ bưu chính phổ cập và dịch vụ chuyển phát báo chí công ích”.\r\n\r\nTrong dự thảo, quy định về thời gian xử lý trong nước đối với thư quốc tế chiều đến tối đa là J+5 với tỷ lệ đạt chuẩn tối đa là 60% tổng số thư (J là ngày mà hãng vận chuyển quốc tế giao bưu gửi cho Bưu cục ngoại dịch của VNPT). Quy định này có thể hiểu là từ khi thư, bưu phẩm được chuyển đến Việt Nam tới khi phát tới tay người nhận là 5 ngày. Dự thảo này cũng phù hợp với định mức Quy định tạm thời mà VNPT đã đề ra. Nhiều ý kiến cho rằng, việc định mức thời gian xử lý thư quốc tế chiều đến là thực hiện được bởi các thủ tục đơn giản hơn. Tuy nhiên, một mảng quan trọng khác là bưu kiện, hàng hoá quốc tế chiều đến thì chưa được VNPT đặt ra định mức về thời gian.\r\n\r\nHàng hoá quốc tế gửi qua đường bưu điện chủ yếu là hàng quà biếu. Do đó, hàng qua cửa khẩu bưu điện có đặc thù là hàng đa chủng loại, xuất xứ từ nhiều nguồn gốc khác nhau, số lượng nhỏ lẻ. Lưu lượng hàng hoá cũng không đồng đều. Hiện hàng quốc tế gửi qua bưu điện được VNPT tổ chức thông quan tại hai Trung tâm Bưu chính liên tỉnh và quốc tế 1 và 2 (VPS1 và VPS2) ở Hà Nội và TPHCM.\r\n\r\nVì người nhận bưu phẩm, bưu kiện quốc tế nằm rải rác ở nhiều tỉnh, thành phố, theo quy định hiện hành, bưu điện thay mặt cho khách hàng làm thủ tục hải quan, đóng thuế sau đó chuyển đi các tỉnh. Như vậy, VPS1 và VPS2 đều có bộ phận chuyên trách làm thủ tục hải quan sau đó chuyển tiếp hàng đi, bưu điện các tỉnh khi phát hàng cho khách sẽ thu thuế và chuyển trả tiền thuế đã ứng trước về cho VPS.\r\n\r\nÔng Nguyễn Vĩnh Phúc – Chi cục trưởng Chi cục Hải quan Bưu điện Hà Nội cho rằng: “Việc quy định chuẩn hoá thời gian kiểm hoá bưu gửi quốc tế chiều đến hoàn toàn có thể thực hiện được nếu như cả 2 bên hải quan và bưu điện phối hợp chặt chẽ với nhau”. Ông Phúc cho biết, từ 3 năm nay Chi cục Hải quan Bưu điện Hà Nội và VPS1 đã có quy chế phối hợp qua đó đẩy nhanh tiến trình kiểm hoá lên rất nhiều. Phía Hải quan đã bố trí người sẵn sàng làm việc bất cứ lúc nào bưu điện khai thác hàng quốc tế. Tiêu chí được đặt ra là hàng phải được kiểm hoá ngay trong ngày, cho nên khi bưu điện khai thác và xuất trình lên là Hải quan khai thác hết trong ngày. Theo đánh giá của ông Phúc, mặc dù 2 bên đã tổ chức các lớp tập huấn về khai thuê hải quan cho nhân viên bưu điện, nhưng trong thực tế trình độ của đội ngũ công nhân làm nhiệm vụ này không đồng đều. Hàng qua Hải quan Bưu điện là hàng phi mậu dịch, nhiều đơn hàng không có trong biểu giá thuế tối thiểu, nhân viên bưu điện khai giá thấp hơn giá thị trường, Hải quan phải đi khảo lại giá để tính thuế đúng, mất nhiều thời gian.\r\n\r\nTheo tìm hiểu của báo BĐVN, không ít trường hợp hàng về đến bưu cục ngoại dịch tới hơn 1 tháng, thậm chí 2 tháng sau mới được thông quan. Một lý do cơ bản được kể đến là do chờ thẩm định lại giá tính thuế. Ông Phúc cho rằng, nếu người khai thuế có hiểu biết về thương phẩm, khai đúng giá, đầu tư máy soi tốt, quá trình làm việc tính toán làm sao bỏ bớt được thời gian chết thì định mức về thời gian thông quan sẽ thực hiện được.\r\n\r\nTuy nhiên, bà Lê Thị Khang – Phó Giám đốc VPS1 lại không đồng tình với ý kiến của ông Phúc. Bà cho biết, với bưu kiện, hàng hoá nhập khẩu thì bưu điện khó có thể chủ động được về thời gian. Vì hàng qua bưu điện đủ các chủng loại, từ quần áo, giầy dép, thuốc tân dược, đồ gia dụng, băng đĩa, sách báo… Thông thường, hàng miễn thuế thông quan nhanh chỉ trong vòng 2-3 ngày. Nhưng đối với hàng tính thuế hoặc hàng nhập khẩu có điều kiện phải phụ thuộc vào Hải quan và các cơ quan chuyên ngành khác thẩm định nội dung và tính thuế, do đó ảnh hưởng tới thời gian toàn trình. “Khó có thể định mức được thời gian kiểm hoá đối với hàng hoá qua bưu điện, mà chỉ có thể đưa ra những biện pháp để giải phóng hàng nhanh nhất”, bà Khang nói.\r\n\r\nMặc dù vẫn có hai luồng ý kiến khác nhau trong vấn đề này nhưng trong điều kiện nào thì việc tính toán để rút ngắn thời gian chuyển phát bưu phẩm, bưu kiện nói chung, để nâng cao chất lượng là tiêu chí đầu tiên mà Bưu chính Việt Nam cần quan tâm.', 'Định mức thời gian kiểm hoá bưu gửi quốc tế', '', 'trash', 'open', 'open', '', 'hom-nay-tao-khong-di-cho', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 0, 'http://localhost/aaexpress/?p=56', 0, 'post', '', 0);
INSERT INTO `dev_posts` VALUES(896, 4, '2012-06-24 00:49:40', '2012-06-23 17:49:40', '<table>\r\n<tbody>\r\n<tr>\r\n<td valign="top">\r\n<div align="justify"><em>ICTnews -</em> Thanh tra Bộ TT&amp;TT đã kiến nghị Chánh thanh tra Bộ xử phạt 5 doanh nghiệp chuyển phát với tổng số tiền 49 triệu đồng.</div>\r\n<div align="justify">Đây là kiến nghị của Đoàn thanh tra sau khi làm việc tại 3 tỉnh: Thừa Thiên Huế, Đà Nẵng và Quảng Ngãi trong thời gian từ ngày 15/7 đến 1/8/2008.</div>\r\n<div align="justify">Cụ thể, phạt Công ty cổ phần Tín Thành 9 triệu đồng vì tính cước sai với giá cước do công ty ban hành và sử dụng cân đã quá thời hạn kiểm định; công ty cổ phần Hợp Nhất miền Trung bị phạt 10 triệu đồng vì thu cước dịch vụ chuyển phát thư thấp hơn quy định trong giấy phép kinh doanh dịch vụ và thu cước sai so với bảng cước công ty ban hành. Ba công ty: Cổ phần Thương mại chuyển phát nhanh EPS, Cổ phần chuyển phát nhanh T.I.M (tại Đà Nẵng), Cổ phần thương mại và xuất nhập khẩu An Dương (tại Thừa Thiên Huế) mỗi công ty bị phạt 10 triệu đồng vì cung cấp dịch vụ chuyển phát thư không phép, đồng thời Thanh tra Bộ cũng đề nghị buộc dừng cung cấp dịch vụ đối với 3 doanh nghiệp này vì chưa có giấy phép kinh doanh dịch vụ chuyển phát thư.</div>\r\n<div align="justify">\r\n<div align="justify">\r\n\r\nThanh tra Bộ cho biết, một số doanh nghiệp khác có vi phạm ở mức độ nhẹ hơn đã được đoàn thanh tra xử lý bằng hình thức cảnh cáo, hoặc nhắc nhở phải tuân thủ đúng quy định của Chính phủ, của Bộ TT&amp;TT về kinh doanh dịch vụ chuyển phát.\r\n\r\nCác doanh nghiệp như Viettel, Sai Gon Postel, Netco, Tân Sơn Nhất tại 3 tỉnh, thành phố trên đã thực hiện tốt các quy định tại Nghị định 128/2007/NĐ-CP của Chính phủ về dịch vụ chuyển phát, ban hành bảng giá cước đúng quy định, tính cước đúng so với bảng cước ban hành, thực hiện tốt việc phát hàng chiều đến, bảo đảm an toàn, phát hết sản phẩm trong ngày, chế độ báo cáo chặt chẽ, có biện pháp quản lý chất lượng tốt.\r\n\r\n</div>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Phạt 5 doanh nghiệp chuyển phát', '', 'inherit', 'open', 'open', '', '63-revision-2', '', '', '2012-06-24 00:49:40', '2012-06-23 17:49:40', '', 63, 'http://www.vnestore.com/aa/63-revision-2/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(63, 1, '2012-06-24 00:49:40', '2012-06-23 17:49:40', '<table>\r\n<tbody>\r\n<tr>\r\n<td valign="top">\r\n<div align="justify"><em>ICTnews -</em> Thanh tra Bộ TT&amp;TT đã kiến nghị Chánh thanh tra Bộ xử phạt 5 doanh nghiệp chuyển phát với tổng số tiền 49 triệu đồng.</div>\r\n<div align="justify">Đây là kiến nghị của Đoàn thanh tra sau khi làm việc tại 3 tỉnh: Thừa Thiên Huế, Đà Nẵng và Quảng Ngãi trong thời gian từ ngày 15/7 đến 1/8/2008.</div>\r\n<div align="justify">Cụ thể, phạt Công ty cổ phần Tín Thành 9 triệu đồng vì tính cước sai với giá cước do công ty ban hành và sử dụng cân đã quá thời hạn kiểm định; công ty cổ phần Hợp Nhất miền Trung bị phạt 10 triệu đồng vì thu cước dịch vụ chuyển phát thư thấp hơn quy định trong giấy phép kinh doanh dịch vụ và thu cước sai so với bảng cước công ty ban hành. Ba công ty: Cổ phần Thương mại chuyển phát nhanh EPS, Cổ phần chuyển phát nhanh T.I.M (tại Đà Nẵng), Cổ phần thương mại và xuất nhập khẩu An Dương (tại Thừa Thiên Huế) mỗi công ty bị phạt 10 triệu đồng vì cung cấp dịch vụ chuyển phát thư không phép, đồng thời Thanh tra Bộ cũng đề nghị buộc dừng cung cấp dịch vụ đối với 3 doanh nghiệp này vì chưa có giấy phép kinh doanh dịch vụ chuyển phát thư.</div>\r\n<div align="justify">\r\n<div align="justify">\r\n\r\nThanh tra Bộ cho biết, một số doanh nghiệp khác có vi phạm ở mức độ nhẹ hơn đã được đoàn thanh tra xử lý bằng hình thức cảnh cáo, hoặc nhắc nhở phải tuân thủ đúng quy định của Chính phủ, của Bộ TT&amp;TT về kinh doanh dịch vụ chuyển phát.\r\n\r\nCác doanh nghiệp như Viettel, Sai Gon Postel, Netco, Tân Sơn Nhất tại 3 tỉnh, thành phố trên đã thực hiện tốt các quy định tại Nghị định 128/2007/NĐ-CP của Chính phủ về dịch vụ chuyển phát, ban hành bảng giá cước đúng quy định, tính cước đúng so với bảng cước ban hành, thực hiện tốt việc phát hàng chiều đến, bảo đảm an toàn, phát hết sản phẩm trong ngày, chế độ báo cáo chặt chẽ, có biện pháp quản lý chất lượng tốt.\r\n\r\n</div>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Phạt 5 doanh nghiệp chuyển phát', '', 'trash', 'open', 'open', '', 'phat-5-doanh-nghiep-chuyen-phat', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 0, 'http://localhost/aaexpress/?p=63', 0, 'post', '', 0);
INSERT INTO `dev_posts` VALUES(68, 1, '2012-06-24 01:19:54', '2012-06-23 18:19:54', '', 'Thư viện ảnh', '', 'publish', 'closed', 'closed', '', 'thu-vien-anh-aa-express', '', '', '2012-06-24 01:24:22', '2012-06-23 18:24:22', '', 0, 'http://localhost/aaexpress/?post_type=slideshow&#038;p=68', 0, 'slideshow', '', 0);
INSERT INTO `dev_posts` VALUES(72, 1, '2012-06-24 11:20:09', '0000-00-00 00:00:00', '[gallery]', 'Thư viện ảnh', '', 'draft', 'closed', 'closed', '', '', '', '', '2012-06-24 11:20:09', '2012-06-24 04:20:09', '', 0, 'http://localhost/aaexpress/?post_type=slide&#038;p=72', 0, 'slide', '', 0);
INSERT INTO `dev_posts` VALUES(81, 1, '2012-06-24 10:17:25', '2012-06-24 03:17:25', ' ', '', '', 'publish', 'open', 'open', '', '81', '', '', '2012-09-06 23:33:51', '2012-09-06 16:33:51', '', 0, 'http://localhost/aaexpress/?p=81', 3, 'nav_menu_item', '', 0);
INSERT INTO `dev_posts` VALUES(816, 1, '2012-07-25 21:07:42', '2012-07-25 14:07:42', ' ', '', '', 'publish', 'open', 'open', '', '816', '', '', '2012-09-06 23:33:51', '2012-09-06 16:33:51', '', 0, 'http://localhost/aaexpress/?p=816', 2, 'nav_menu_item', '', 0);
INSERT INTO `dev_posts` VALUES(897, 4, '2012-08-25 09:01:37', '2012-08-25 02:01:37', '[contact-form-7 id="104" title="Đăng ký vận chuyển"]', 'Đăng ký vận chuyển', '', 'inherit', 'open', 'open', '', '112-revision-4', '', '', '2012-08-25 09:01:37', '2012-08-25 02:01:37', '', 112, 'http://www.vnestore.com/aa/112-revision-4/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(104, 1, '2012-06-24 11:35:07', '2012-06-24 04:35:07', '<p>Họ tên (*)<br />\r\n    [text* your-name] </p>\r\n\r\n<p>Điện thoại (*)<br />\r\n    [text* your-name] </p>\r\n\r\n<p>Địa chỉ (*)<br />\r\n    [text* your-name] </p>\r\n\r\n<p>Email (*)<br />\r\n    [email* your-email] </p>\r\n\r\n<p>Yêu cầu<br />\r\n    [text your-subject] </p>\r\n\r\n<p>Nội dung<br />\r\n    [textarea your-message] </p>\r\n\r\n<p>[submit "Gửi yêu cầu"]</p>\n[your-subject]\n[your-name] <[your-email]>\nFrom: [your-name] <[your-email]>\r\nSubject: [your-subject]\r\n\r\nMessage Body:\r\n[your-message]\r\n\r\n--\r\nThis mail is sent via contact form on AA EXPRESS http://www.vnestore.com/aa\nlgthnha@yahoo.com.vn\n\n\n\n\n[your-subject]\n[your-name] <[your-email]>\nMessage body:\r\n[your-message]\r\n\r\n--\r\nThis mail is sent via contact form on AA EXPRESS http://localhost/aaexpress\n[your-email]\n\n\n\nCản ơn bạn đã gửi yêu cầu đến AA Express.\nKhông thể gửi yêu cầu, vui lòng kiểm tra lại thông tin nhập!\nDữ liệu nhập không hợp lệ!\nPlease accept the terms to proceed.\nEmail không hợp lệ!\nVui lòng nhập thông tin vào mục này!\nFailed to send your message. Please try later or contact the administrator by another method.\nYour entered code is incorrect.\nFailed to upload file.\nThis file type is not allowed.\nThis file is too large.\nFailed to upload file. Error occurred.\nYour answer is not correct.', 'Đăng ký vận chuyển', '', 'publish', 'open', 'open', '', 'contact-form-1', '', '', '2012-08-25 08:59:50', '2012-08-25 01:59:50', '', 0, 'http://localhost/aaexpress/?wpcf7_contact_form=contact-form-1', 0, 'wpcf7_contact_form', '', 0);
INSERT INTO `dev_posts` VALUES(112, 1, '2012-06-24 12:23:11', '2012-06-24 05:23:11', '[contact-form-7 id="104" title="Đăng ký vận chuyển"]', 'Đăng ký vận chuyển', '', 'trash', 'open', 'open', '', 'aa-express-dang-ky-van-chuyen', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 0, 'http://localhost/aaexpress/?page_id=112', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(898, 4, '2012-07-27 23:00:36', '2012-07-27 16:00:36', '<strong>AA Express</strong> là một trong những công ty hàng đầu trong lĩnh vực Chuyển phát nhanh bưu phẩm và bưu kiện trong nước và quốc tế. Do nhu cầu mở rộng thị trường, chúng tôi luôn cần tuyển dụng các ứng viên giàu kinh nghiệm, năng động, sáng tạo, nhiệt huyết yêu nghề.\r\n\r\nNếu bạn đang tìm kiếm một môi trường tốt, giúp bạn thực hiện những ước mơ, hãy gia nhập vào đội ngũ nhân viên của AA Express. Chúng tôi luôn chờ đón bạn!\r\n\r\nMọi thông tin vui lòng liên hệ:\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;\r\n\r\n<strong><span style="color: #ff9900;">CÔNG TY CP TM - DV TIẾP VẬN TOÀN CẦU A&amp;A</span></strong>\r\n\r\n<strong></strong><strong></strong><strong><span style="color: #66cc00;">HÀ NỘI</span></strong>\r\n\r\n<strong></strong>232/21 Tôn Đức Thắng, P.Hàng Bột, Q. Đống Đa, TP.Hà Nội\r\n\r\nTel: 043 511 11 24\r\n\r\nFax: 043 513 11 15\r\n\r\n<strong><span style="color: #66cc00;">TPHCM</span></strong>\r\n\r\n36/23 Giải Phóng, P.4, Q.Tân Bình, TPHCM\r\n\r\nTel: 083 948 0323/083 9480324\r\n\r\nFax: 083 9480325\r\n\r\nEmail: <a href="mailto:aaexpresshcm@vnn.vn">aaexpresshcm@vnn.vn</a>\r\n\r\n<strong><span style="color: #ff9900;">CÔNG TY THÀNH VIÊN</span></strong>\r\n\r\n<strong><span style="color: #66cc00;">Công ty cổ phần thương mại và giao nhận quốc tế Á Âu</span></strong>\r\n\r\nSố 21/11 Hẻm 108 Cộng Hòa, P.4, Q. Tân Bình, TP.HCM\r\n\r\nTel: 083 9480331/083 9484748\r\n\r\nFax: 083 9484487\r\n\r\n&nbsp;</td>\r\n<td valign="top"></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Tuyển dụng', '', 'inherit', 'open', 'open', '', '117-revision-11', '', '', '2012-07-27 23:00:36', '2012-07-27 16:00:36', '', 117, 'http://www.vnestore.com/aa/117-revision-11/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(117, 1, '2012-06-24 13:12:48', '2012-06-24 06:12:48', '<strong>AA Express</strong> là một trong những công ty hàng đầu trong lĩnh vực Chuyển phát nhanh bưu phẩm và bưu kiện trong nước và quốc tế. Do nhu cầu mở rộng thị trường, chúng tôi luôn cần tuyển dụng các ứng viên giàu kinh nghiệm, năng động, sáng tạo, nhiệt huyết yêu nghề.\r\n\r\nNếu bạn đang tìm kiếm một môi trường tốt, giúp bạn thực hiện những ước mơ, hãy gia nhập vào đội ngũ nhân viên của AA Express. Chúng tôi luôn chờ đón bạn!\r\n\r\nMọi thông tin vui lòng liên hệ:\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;\r\n\r\n<strong><span style="color: #ff9900;">CÔNG TY CP TM - DV TIẾP VẬN TOÀN CẦU A&amp;A</span></strong>\r\n\r\n<strong></strong><strong></strong><strong><span style="color: #66cc00;">HÀ NỘI</span></strong>\r\n\r\n<strong></strong>232/21 Tôn Đức Thắng, P.Hàng Bột, Q. Đống Đa, TP.Hà Nội\r\n\r\nTel: 043 511 11 24\r\n\r\nFax: 043 513 11 15\r\n\r\n<strong><span style="color: #66cc00;">TPHCM</span></strong>\r\n\r\n36/23 Giải Phóng, P.4, Q.Tân Bình, TPHCM\r\n\r\nTel: 083 948 0323/083 9480324\r\n\r\nFax: 083 9480325\r\n\r\nEmail: <a href="mailto:aaexpresshcm@vnn.vn">aaexpresshcm@vnn.vn</a>\r\n\r\n<strong><span style="color: #ff9900;">CÔNG TY THÀNH VIÊN</span></strong>\r\n\r\n<strong><span style="color: #66cc00;">Công ty cổ phần thương mại và giao nhận quốc tế Á Âu</span></strong>\r\n\r\nSố 21/11 Hẻm 108 Cộng Hòa, P.4, Q. Tân Bình, TP.HCM\r\n\r\nTel: 083 9480331/083 9484748\r\n\r\nFax: 083 9484487\r\n\r\n&nbsp;</td>\r\n<td valign="top"></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Tuyển dụng', '', 'draft', 'open', 'open', '', 'tuyen-dung', '', '', '2012-09-17 17:51:56', '2012-09-17 10:51:56', '', 0, 'http://localhost/aaexpress/?page_id=117', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(119, 1, '2012-06-24 13:12:48', '2012-06-24 06:12:48', ' ', '', '', 'publish', 'open', 'open', '', '119', '', '', '2012-09-06 23:33:51', '2012-09-06 16:33:51', '', 0, 'http://localhost/aaexpress/?p=119', 4, 'nav_menu_item', '', 0);
INSERT INTO `dev_posts` VALUES(899, 4, '2012-07-27 23:30:28', '2012-07-27 16:30:28', 'Đây là thông tin bảng giá chuyển phát nhanh ...', 'Chuyển phát nhanh', '', 'inherit', 'open', 'open', '', '835-revision-2', '', '', '2012-07-27 23:30:28', '2012-07-27 16:30:28', '', 835, 'http://www.vnestore.com/aa/835-revision-2/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(835, 1, '2012-07-27 23:30:28', '2012-07-27 16:30:28', 'Đây là thông tin bảng giá chuyển phát nhanh ...', 'Chuyển phát nhanh', '', 'trash', 'open', 'open', '', 'chuyen-phat-nhanh', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 0, 'http://localhost/aaexpress/?page_id=835', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(900, 4, '2012-08-14 00:25:49', '2012-08-13 17:25:49', '<p align="justify"><strong>Xin chân thành cảm ơn Quý khách đã ghé thăm website của chúng tôi.</strong></p>\r\n<p align="justify">Quý khách đang có nhu cầu gửi hàng hoá, tài liệu nhưng chưa dự kiến được mức cước, hãy truy cập vào mục "TÍNH GIÁ", nhập TP nơi có trụ sở công ty của Quý khách, nhập tỉnh, thành phố hoăc Quôc gia cần gửi đến, nhập khối lượng và chủng loại (hàng hoá hoặc tài liệu), chúng tôi sẽ cung cấp cho Quý khách cước phí Chuyển phát nhanh hàng hoá, tài liệu trong nước, Quốc tế một cách chính xác và tiện lợi!\r\nXin chân thành cảm ơn đã ghé thăm!\r\nHẹn gặp lại quý khách lần sau</p>\r\n<p align="justify"><a href="http://localhost/aaexpress/wp-content/uploads/2012/08/Trong-Nuoc.rar">Download bảng giá trong nước</a></p>\r\n<p align="justify"><a href="http://localhost/aaexpress/wp-content/uploads/2012/08/Quoc-Te.rar">Download bảng giá quốc tế</a></p>\r\n<p align="justify"></p>', 'Download giá', '', 'inherit', 'open', 'open', '', '859-revision', '', '', '2012-08-14 00:25:49', '2012-08-13 17:25:49', '', 859, 'http://www.vnestore.com/aa/859-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(861, 1, '2012-08-14 00:18:35', '2012-08-13 17:18:35', ' ', '', '', 'publish', 'open', 'open', '', '861', '', '', '2012-09-06 23:33:51', '2012-09-06 16:33:51', '', 0, 'http://localhost/aaexpress/?p=861', 6, 'nav_menu_item', '', 0);
INSERT INTO `dev_posts` VALUES(859, 1, '2012-08-14 00:17:24', '2012-08-13 17:17:24', '<p align="justify"><strong>Xin chân thành cảm ơn Quý khách đã ghé thăm website của chúng tôi.</strong></p>\r\n<p align="justify">Quý khách đang có nhu cầu gửi hàng hoá, tài liệu nhưng chưa dự kiến được mức cước, hãy truy cập vào mục "TÍNH GIÁ", nhập TP nơi có trụ sở công ty của Quý khách, nhập tỉnh, thành phố hoăc Quôc gia cần gửi đến, nhập khối lượng và chủng loại (hàng hoá hoặc tài liệu), chúng tôi sẽ cung cấp cho Quý khách cước phí Chuyển phát nhanh hàng hoá, tài liệu trong nước, Quốc tế một cách chính xác và tiện lợi!\r\nXin chân thành cảm ơn đã ghé thăm!\r\nHẹn gặp lại quý khách lần sau</p>\r\n<p align="justify"><a href="http://localhost/aaexpress/wp-content/uploads/2012/08/Trong-Nuoc.rar">Download bảng giá trong nước</a></p>\r\n<p align="justify"><a href="http://localhost/aaexpress/wp-content/uploads/2012/08/Quoc-Te.rar">Download bảng giá quốc tế</a></p>\r\n<p align="justify"></p>', 'Download giá', '', 'publish', 'open', 'open', '', 'download-bang-gia-aa-express', '', '', '2012-09-17 17:51:38', '2012-09-17 10:51:38', '', 0, 'http://localhost/aaexpress/?page_id=859', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(854, 1, '2012-08-13 23:43:47', '2012-08-13 16:43:47', ' ', '', '', 'publish', 'open', 'open', '', '854', '', '', '2012-09-06 23:33:51', '2012-09-06 16:33:51', '', 0, 'http://localhost/aaexpress/?p=854', 5, 'nav_menu_item', '', 0);
INSERT INTO `dev_posts` VALUES(892, 4, '2012-07-22 15:03:19', '2012-07-22 08:03:19', 'ICTnews – Theo hầu hết các doanh nghiệp trong nước, thị trường bưu chính, chuyển phát nhanh năm 2009, dù vẫn còn những khó khăn nhưng không đáng lo ngại.\r\nBưu chính không lo ngại\r\nNăm 2008, lạm phát và bão giá hoành hành, đặc biệt giá xăng dầu (một nguyên liệu đầu vào quan trọng của ngành bưu chính, chuyển phát nhanh) có lúc tăng tới 40%, song các doanh nghiệp bưu chính, chuyển phát nhanh trong nước vẫn tăng trưởng cả về sản lượng và doanh thu, cho dù mức tăng này có thấp hơn những năm trước. Năm 2009 và thậm chí là sang năm 2010, nền kinh tế thế giới và Việt Nam dự báo vẫn tiếp tục gặp nhiều khó khăn và chưa có dấu hiệu phục hồi. Sức mua các dịch vụ bưu chính có nguy cơ giảm đi rõ rệt. Điều này ảnh hưởng rất nhiều đến ngành bưu chính, bởi sức tăng trưởng của dịch vụ bưu chính phụ thuộc rất nhiều vào nhu cầu tiêu dùng của xã hội, vào nhu cầu mua sắm của người dân, vào việc lưu chuyển hàng hoá, trao đổi qua lại của mọi người.\r\n\r\nÔng Nguyễn Việt Dũng, Giám đốc Bưu điện TPHCM – nơi dịch vụ bưu chính cạnh tranh sôi động nhất cả nước cho rằng, tiềm năng thị trường bưu chính vẫn còn nhiều, hiện Bưu điện TPHCM mới chỉ chiếm lĩnh được khoảng trên 40%, cho nên vẫn còn nhiều cơ hội để phát triển. Vấn đề quan trọng là phải tìm được chiến lược cạnh tranh phù hợp. Hướng đi của TPHCM là sẽ tập trung nâng cao sản lượng và chất lượng các dịch vụ bưu chính truyền thống, dịch vụ chuyển phát nhanh, nhóm dịch vụ tài chính bưu chính. Cốt lõi sẽ tập trung đào tạo nhân lực, chăm sóc khách hàng, ứng dụng mạnh CNTT để nâng cao chất lượng dịch vụ.\r\n\r\nÔng Nguyễn Văn Tiến – Giám đốc Bưu điện Vĩnh Phúc cũng cho rằng, hiện các khu công nghiệp, các doanh nghiệp tiếp tục mở ra tại nhiều tỉnh là tiềm năng rất lớn cho dịch vụ bưu chính, chuyển phát phát triển. Bưu điện Vĩnh Phúc hiện mới chỉ chiếm được 30-40% thị phần dịch vụ bưu chính trên địa bàn tỉnh, cho nên cơ hội để giành lấy thị trường còn rất lớn. Ông Tiến cho biết, bưu chính cần tập trung phát triển các dịch vụ “lõi” của bưu chính, nhất là nhóm dịch vụ bưu chính, chuyển phát nhanh, phát hành báo chí, các dịch vụ tài chính bưu chính. Năm 2008, riêng nhóm dịch vụ thuần bưu chính, Bưu điện tỉnh Vĩnh Phúc tăng 18% so với năm 2007, năm 2009 dự kiến sẽ tăng khoảng 25% so với năm 2008. Với cơ sở vật chất như hiện nay, với tiềm năng thị trường còn rất lớn, không có lý do gì mà bưu chính không thể phát triển được. Ông Tiến đề xuất, Bưu chính Việt Nam cần mạnh dạn trong việc giải quyết bài toán lao động, đồng thời thực hiện một cơ chế khoán doanh thu giống như cơ chế “khoán 10” trong bưu chính để có thể nhanh chóng chống lỗ cho bưu chính.\r\n\r\nChuyển phát nhanh sẽ tăng chậm lại\r\n\r\nHiện dịch vụ EMS đang nắm giữ thị phần chuyển phát nhanh trong nước lớn nhất. Bà Đặng Thị Bích Hoà – Chủ tịch HĐQT kiêm Tổng giám đốc VNPost Express cho rằng, lạm phát khiến tốc độ tăng trưởng của dịch vụ EMS trong vòng 3-4 năm tới có nguy cơ chậm lại. Tuy nhiên nhu cầu vận chuyển của xã hội sẽ tiếp tục tăng, một mặt công ty đang có những chiến lược đầu tư để giữ vững thị phần và nâng cao chất lượng dịch vụ cho nên năm 2009 EMS dù có khó khăn hơn nhưng vẫn giữ vững được vai trò chủ đạo.\r\n\r\nÔng Phó Đức Hùng - Phó giám đốc Công ty Bưu chính Viettel, doanh nghiệp ở vị trí số 2 trong thị trường chuyển phát nhanh trong nước cho rằng, năm 2009 sẽ không có tăng trưởng đột biến. Khách hàng, lượng hàng hoá và tổng doanh thu của “miếng bánh” chuyển phát sẽ không tăng nhiều. Bưu chính Viettel (VTP) xác định dù có “quyết chiến” đi chăng nữa thì doanh thu chuyển phát nhanh của VTP năm 2009 tăng khoảng 40% so với 2008, trong khi những năm trước mức tăng trưởng năm sau so với những năm trước từ 80-100%.\r\n\r\nNhóm các doanh nghiệp nhỏ hơn, bắt đầu xây dựng được thương hiệu trên thị trường chuyển phát nhanh như: Netco, Tân Sơn Nhất, Hợp Nhất cũng đã có mức tăng trưởng ngoạn mục trong nhiều năm. Các doanh nghiệp này cho biết, năm 2009 tuy có dấu hiệu chậm hơn nhưng cũng không đáng lo ngại. Năm 2008 họ vẫn phát triển thêm được nhiều khách hàng mới, cho nên dù số lượng hàng gửi của mỗi khách hàng có giảm đi nhưng sản lượng tổng thể vẫn tăng. Giá xăng dầu giảm tới hơn 30% là tín hiệu đáng mừng cho ngành chuyển phát, bởi họ không phải tăng thêm phụ phí xăng dầu, giá dịch vụ mà khách hàng phải trả sẽ giảm.\r\n\r\n“Cá bé” coi chừng bị thôn tính\r\n\r\nNăm 2009, cuộc cạnh tranh trong lĩnh vực chuyển phát nhanh vốn đã khốc liệt nay lại càng khốc liệt hơn và các doanh nghiệp kinh doanh kém hiệu quả sẽ có nguy cơ bị thôn tính. Thực tế, chuyển phát nhanh là một trong số ít dịch vụ bưu chính bị cạnh tranh đầu tiên. Năm 2004, theo số liệu do của các Sở Kế hoạch và Đầu tư, tại Hà Nội và TPHCM có khoảng trên 200 doanh nghiệp đăng ký kinh doanh dịch vụ chuyển phát nhanh. Nhưng trong đợt thanh tra trên diện rộng dịch vụ chuyển phát do Thanh tra Bộ TT&TT tiến hành hồi giữa năm 2008 hiện chỉ có khoảng hơn 50 doanh nghiệp đang hoạt động. Qua thanh tra cho thấy, có nhiều doanh nghiệp đăng ký kinh doanh dịch vụ chuyển phát nhưng không hoạt động hoặc hoạt động không hiệu quả đã không còn tồn tại nữa.\r\n\r\nThực tế trong những năm qua, chỉ có duy nhất dịch vụ EMS của VNPT là cung cấp toàn quốc, còn các doanh nghiệp khác chỉ cung cấp dịch vụ ở những thành phố lớn, nơi có sản lượng nhiều và dễ tổ chức mạng lưới. Nhiều doanh nghiệp mới ra đời, do vốn ít, nhân lực mỏng nên thường chỉ hoạt động ở tuyến Hà Nội, TP.Hồ Chí Minh, còn những gói dịch vụ liên tỉnh, các công ty này thu gom và tái gửi lại trên mạng bưu chính công cộng. Tình trạng kinh doanh trên lưng của người khác kiểu này sẽ khó tiếp diễn trong năm tới.\r\n\r\nChưa hết, nguy cơ sụt giảm doanh thu từ việc làm đại lý thu gom và phát hàng quốc tế cũng dần hiện ra. Từ hơn 10 năm nay, Việt Nam đã có mặt hàng chục hãng chuyển phát quốc tế hàng đầu như DHL, Fedex, TNT, DPD, các hãng này hợp tác chủ yếu với Bưu chính Việt Nam theo hình thức đại lý, hoa hồng đại lý chiếm tới 1/3 tổng doanh thu của dịch vụ EMS. Tuy nhiên, từ năm 2006 trở lại đây mức hoa hồng ngày càng giảm. Cụ thể, năm 2006 đạt 87 tỷ đồng, đến năm 2007 giảm còn 69 tỷ đồng, năm 2008 còn thấp hơn con số này. Ông Đỗ Ngọc Bình – Tổng giám đốc Tổng công ty Bưu chính Việt Nam (VNPost) nhận định, theo cam kết gia nhập WTO, năm 2011 các doanh nghiệp nước ngoài được phép thành lập doanh nghiệp 100% vốn kinh doanh dịch vụ chuyển phát nhanh. Nguy cơ các hãng lớn sẽ rời bỏ các đại lý để lập doanh nghiệp 100% vốn không còn bao xa nữa. Và đến thời điểm đó các doanh nghiệp trong nước không những mất đi nguồn thu lớn mà còn có nguy cơ phải cạnh tranh với các đối thủ nặng ký, cho nên doanh nghiệp nội cần có sự chuẩn bị trước để đối mặt với những thách thức này.\r\n\r\nMinh Quyên – Ngọc Minh\r\n\r\nĐọc toàn bộ bài viết trên báo Bưu điện Việt Nam số Xuân Kỷ Sửu 2009', 'Bưu chính: Thách thức và cơ hội', '', 'inherit', 'open', 'open', '', '1-revision-4', '', '', '2012-07-22 15:03:19', '2012-07-22 08:03:19', '', 1, 'http://www.vnestore.com/aa/1-revision-4/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(901, 4, '2012-07-27 23:34:11', '2012-07-27 16:34:11', 'Đây là bảng giá chuyển phát bằng đường bộ ...', 'Chuyển phát bằng đường bộ', '', 'inherit', 'open', 'open', '', '839-revision-2', '', '', '2012-07-27 23:34:11', '2012-07-27 16:34:11', '', 839, 'http://www.vnestore.com/aa/839-revision-2/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(839, 1, '2012-07-27 23:34:11', '2012-07-27 16:34:11', 'Đây là bảng giá chuyển phát bằng đường bộ ...', 'Chuyển phát bằng đường bộ', '', 'draft', 'open', 'open', '', 'chuyen-phat-bang-duong-bo', '', '', '2012-09-17 17:51:26', '2012-09-17 10:51:26', '', 0, 'http://localhost/aaexpress/?page_id=839', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(902, 4, '2012-07-27 23:33:02', '2012-07-27 16:33:02', 'Đây là thông tin bảng giá chuyển phát nhanh tiết kiệm ...', 'Chuyển phát nhanh tiết kiệm', '', 'inherit', 'open', 'open', '', '837-revision', '', '', '2012-07-27 23:33:02', '2012-07-27 16:33:02', '', 837, 'http://www.vnestore.com/aa/837-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(837, 1, '2012-07-27 23:33:02', '2012-07-27 16:33:02', 'Đây là thông tin bảng giá chuyển phát nhanh tiết kiệm ...', 'Chuyển phát nhanh tiết kiệm', '', 'trash', 'open', 'open', '', 'chuyen-phat-nhanh-tiet-kiem', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 0, 'http://localhost/aaexpress/?page_id=837', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(903, 4, '2012-08-13 23:40:34', '2012-08-13 16:40:34', '<table width="100%" border="0" cellspacing="1" cellpadding="1">\r\n<tbody>\r\n<tr>\r\n<td></td>\r\n<td valign="top"></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"><strong>Đây sẽ phần giới thiệu ...</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Giới thiệu', '', 'inherit', 'open', 'open', '', '812-revision-2', '', '', '2012-08-13 23:40:34', '2012-08-13 16:40:34', '', 812, 'http://www.vnestore.com/aa/812-revision-2/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(812, 1, '2012-07-25 21:03:40', '2012-07-25 14:03:40', '<table width="100%" border="0" cellspacing="1" cellpadding="1">\r\n<tbody>\r\n<tr>\r\n<td></td>\r\n<td valign="top"></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"><strong>Đây sẽ phần giới thiệu ...</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Giới thiệu', '', 'draft', 'open', 'open', '', 'gioi_thieu_aaexpress', '', '', '2012-09-17 17:51:40', '2012-09-17 10:51:40', '', 0, 'http://localhost/aaexpress/?page_id=812', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(904, 4, '2012-08-13 23:42:40', '2012-08-13 16:42:40', 'Thông tin khuyến mãi ...', 'Khuyến mãi', '', 'inherit', 'open', 'open', '', '852-revision', '', '', '2012-08-13 23:42:40', '2012-08-13 16:42:40', '', 852, 'http://www.vnestore.com/aa/852-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(852, 1, '2012-08-13 23:42:40', '2012-08-13 16:42:40', 'Thông tin khuyến mãi ...', 'Khuyến mãi', '', 'trash', 'open', 'open', '', 'aa-express-khuyen-mai', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 0, 'http://localhost/aaexpress/?page_id=852', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(905, 4, '2012-07-22 15:34:56', '2012-07-22 08:34:56', '[STORE-LOCATOR]', 'Mạng lưới dịch vụ', '', 'inherit', 'open', 'open', '', '762-revision-3', '', '', '2012-07-22 15:34:56', '2012-07-22 08:34:56', '', 762, 'http://www.vnestore.com/aa/762-revision-3/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(762, 1, '2012-06-25 01:57:55', '2012-06-24 18:57:55', '[STORE-LOCATOR]', 'Mạng lưới dịch vụ', '', 'draft', 'open', 'open', '', 'vi-tri', '', '', '2012-09-17 17:51:45', '2012-09-17 10:51:45', '', 0, 'http://localhost/aaexpress/?page_id=762', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(767, 1, '2012-06-25 23:06:13', '2012-06-25 16:06:13', '&nbsp;\n\n<span style="color: #99cc00;">AA Express</span><span style="color: #000000;"> luôn có các chương trình khuyến mãi hấp dẫn dành cho quý khách hàng khi chọn tất cả các loại dịch vụ của chúng tôi.</span>\n\n<span style="color: #000000;">Hãy gọi điện cho chúng tôi để biết thêm thông tin chi tiết!</span>', '', '', 'trash', 'open', 'open', '', '767', '', '', '2012-09-08 13:33:27', '2012-09-08 06:33:27', '', 0, 'http://localhost/aaexpress/?page_id=767', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(907, 4, '2012-08-24 21:34:56', '2012-08-24 14:34:56', 'Hàng hoá gửi phải được gói bọc chắc chắn, bao bì phải phù hợp với hình thức và tính chất của vật phẩm bên trong, phù hợp với điều kiện vận chuyển. Hàng hoá gửi phải gói bọc đảm bảo không gây nguy hiểm cho nhân viên khi thực hiện nhiệm vụ, không làm bẩn hoặc làm hỏng các bưu gửi khác hoặc trang thiết bị bưu chính.\r\n\r\nĐối với hàng hoá gửi nếu không cần có điều kiện gói bọc đặc biệt thì phải đảm bảo có thể mở ra để kiểm soát nội dung.\r\n\r\nChú ý gói bọc một số chất đặc biệt\r\n\r\n1 - Các chất, sinh vật dễ hư hỏng và truyền nhiễm cho người và súc vật phải được ghi chú rõ hoặc dán nhãn “chất truyền nhiễm” trên hàng hoá gửi và phải được gói bọc theo qui định. Người gửi các chất truyền nhiễm phải đảm bảo bưu gửi đã được gói bọc kỹ không gây bất cứ nguy hiểm nào cho người và súc vật trong quá trình chuyển phát.\r\n\r\n2 - Vật phẩm làm bằng thuỷ tinh hoặc những chất dễ vỡ phải đựng vào hộp làm bằng kim loại, hoặc gỗ ,chèn bằng giấy vụn, vỏ bào hoặc bất kỳ thứ gì khác có tác dụng bảo vệ, tránh gây cọ sát và va chạm trong quá trình vận chuyển.\r\n\r\n3 - Chất lỏng phải đựng trong bình hoàn toàn kín, mỗi bình phải đựng trong một hộp làm bằng kim loại hoặc gỗ, chèn bằng mùn cưa, bông hoặc bất kỳ thứ gì khác có tác dụng bảo vệ.\r\n\r\n4 - Các chất dầu mỡ khó chảy như cao, xà phòng mềm, nhựa cây... phải gói bọc lớp thứ nhất bằng hộp, túi vải, chất dẻo...bỏ vào hộp làm bằng gỗ, kim loại hoặc chất khác có đủ độ bền để chất bên trong khỏi bị chảy ra.\r\n\r\n5 - Các loại hạt phải đựng trong vỏ bọc bằng vải, bằng ni lông, bằng bìa cứng, bằng gỗ hay kim loại.\r\n\r\n6- Chất bột khô có mầu chỉ được chấp nhận nếu đựng vào hộp kim loại hoàn toàn kín và bỏ vào trong một hộp bằng gỗ. Giữa hai lớp hộp đó được chèn bằng mùn cưa, các chất hút nước có tác dụng bảo vệ.\r\n\r\n7 - Chất bột khô không mầu phải được đựng trong hộp, túi bằng kim loại hoặc bằng gỗ. Vật chứa đó phải bỏ vào một hộp dai bền làm bằng một trong những vật liệu nói trên.', 'Cách gói bọc', '', 'inherit', 'open', 'open', '', '775-revision-5', '', '', '2012-08-24 21:34:56', '2012-08-24 14:34:56', '', 775, 'http://www.vnestore.com/aa/775-revision-5/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(775, 1, '2012-07-20 23:54:13', '2012-07-20 16:54:13', 'Hàng hoá gửi phải được gói bọc chắc chắn, bao bì phải phù hợp với hình thức và tính chất của vật phẩm bên trong, phù hợp với điều kiện vận chuyển. Hàng hoá gửi phải gói bọc đảm bảo không gây nguy hiểm cho nhân viên khi thực hiện nhiệm vụ, không làm bẩn hoặc làm hỏng các bưu gửi khác hoặc trang thiết bị bưu chính.\r\n\r\nĐối với hàng hoá gửi nếu không cần có điều kiện gói bọc đặc biệt thì phải đảm bảo có thể mở ra để kiểm soát nội dung.\r\n\r\nChú ý gói bọc một số chất đặc biệt\r\n\r\n1 - Các chất, sinh vật dễ hư hỏng và truyền nhiễm cho người và súc vật phải được ghi chú rõ hoặc dán nhãn “chất truyền nhiễm” trên hàng hoá gửi và phải được gói bọc theo qui định. Người gửi các chất truyền nhiễm phải đảm bảo bưu gửi đã được gói bọc kỹ không gây bất cứ nguy hiểm nào cho người và súc vật trong quá trình chuyển phát.\r\n\r\n2 - Vật phẩm làm bằng thuỷ tinh hoặc những chất dễ vỡ phải đựng vào hộp làm bằng kim loại, hoặc gỗ ,chèn bằng giấy vụn, vỏ bào hoặc bất kỳ thứ gì khác có tác dụng bảo vệ, tránh gây cọ sát và va chạm trong quá trình vận chuyển.\r\n\r\n3 - Chất lỏng phải đựng trong bình hoàn toàn kín, mỗi bình phải đựng trong một hộp làm bằng kim loại hoặc gỗ, chèn bằng mùn cưa, bông hoặc bất kỳ thứ gì khác có tác dụng bảo vệ.\r\n\r\n4 - Các chất dầu mỡ khó chảy như cao, xà phòng mềm, nhựa cây... phải gói bọc lớp thứ nhất bằng hộp, túi vải, chất dẻo...bỏ vào hộp làm bằng gỗ, kim loại hoặc chất khác có đủ độ bền để chất bên trong khỏi bị chảy ra.\r\n\r\n5 - Các loại hạt phải đựng trong vỏ bọc bằng vải, bằng ni lông, bằng bìa cứng, bằng gỗ hay kim loại.\r\n\r\n6- Chất bột khô có mầu chỉ được chấp nhận nếu đựng vào hộp kim loại hoàn toàn kín và bỏ vào trong một hộp bằng gỗ. Giữa hai lớp hộp đó được chèn bằng mùn cưa, các chất hút nước có tác dụng bảo vệ.\r\n\r\n7 - Chất bột khô không mầu phải được đựng trong hộp, túi bằng kim loại hoặc bằng gỗ. Vật chứa đó phải bỏ vào một hộp dai bền làm bằng một trong những vật liệu nói trên.', 'Cách gói bọc', '', 'draft', 'open', 'open', '', 'aa-express-canh-goi-boc', '', '', '2012-09-17 17:51:20', '2012-09-17 10:51:20', '', 0, 'http://localhost/aaexpress/?page_id=775', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(908, 4, '2012-07-21 00:13:26', '2012-07-20 17:13:26', '1. Điều kiện chấp nhận khiếu nai bưu gửi AA-Express\r\n\r\n- Thời hạn chấp nhận khiếu nại đốivới bưu gửi trong nước là 3 tháng và bưu gửi quốc tế là 4 tháng kể từ  ngày sau ngày kết thúc chỉ tiêu thời gian toàn trình đã công bố.\r\n\r\n- Chỉ chấp nhận khiếu nại tại những bưu cục có mở dịch vụ AA-Express. \r\n\r\n- Chỉ chấp nhận khiếu nại sau khi kết thúc chỉ tiêu thời gian toàn trình\r\n\r\n2. Những trường hợp không thuộc trách nhiệm bồi thường của doanh nghiệp cung cấp dịch vụ\r\n\r\n-Trường hợp bất khả kháng vì thiên tai, địch họa hoặc những tình huống bất ngờ vượt quá khả năng khắc phục của doanh nghiệp cung cấp dịch vụ. \r\n\r\n- Bưu gửi AA-Express bị hư hỏng do người gửi gói bọc không đảm bảo nội dung bên trong. \r\n\r\n- Bưu gửi AA-Express bị phát nhầm do lỗi của người gửi. \r\n\r\n- Bưu gửi AA-Express có vật phẩm, hàng hoá bị huỷ hoại do đặc tính tự nhiên. \r\n\r\n- Bưu gửi AA-Express có vật phẩm hàng hoá vi phạm quy định về hàng cấm gửi, gửi có điều kiện của Nhà nước, bị cơ quan Nhà nước có thẩm quyền tịch thu hoặc bị huỷ theo quy định của pháp luật. \r\n\r\n- Bưu gửi AA-Express gửi đi quốc tế bị thu giữ theo luật lệ của nước nhận.. \r\n\r\n- Phần giá trị khai man, khai vượt quá giá trị thực tế của bưu gửi AA-Express khai giá . \r\n\r\n- Bưu gửi AA-Express khiếu nại quá thời hạn quy định.\r\n\r\n- Đối với bưu gửi AA-Express quốc tế có nội dung là vật phẩm hàng hoá, doanh nghiệp không phải chịu trách nhiệm đối với việc khai Hải quan của người gửi hoặc người nhận và những quyết định xử lý củaHải quan khi làm thủ tục xuất khẩu, nhập khẩu.\r\n\r\n- Doanh nghiệp cung cấp dịch vụ không phải bồi thường những thiệt hại gián tiếp hoặc những nguồn lợi không thực hiện được do việc mất, suy suyển, hư hỏng bưu gửi AA-Express gây nên. \r\n\r\n3. Nguyên tắc bồi thường \r\n\r\nDoanh nghiệp cung cấp dịch vụ chịutrách nhiệm bồi thường thiệt hại vật chất do lỗi của doanh nghiệp gây ra cho người có quyền thụ hưởng \r\n\r\n- Tiền bồi thường được trả bằngtiền Việt Nam. \r\n\r\n- Tiền bồi thường được trả cho người gửi hoặc người được người gửi uỷ quyền nhận. Trường hợp người nhận đồng ý nhận bưu phẩm AA-Express bị suy suyển hư hỏng thì người nhận được quyền nhận bồithường. \r\n\r\n- Đối với bưu gửi AA-Express gửi từ ViệtNam đi quốc tế, nếu phải bồi thường, Công ty CP CPN Bưu điện chỉ bồi thường cho người gửi hoặc người được người gửi uỷ quyền đang ở tại Việt Nam. \r\n\r\n- Đối với bưu gửi AA-Express quốc tế đến Việt Nam: việc bồi thường được thực hiện theo Điều ước quốc tế mà Công ty CPCPN Bưu điện tham gia ký kết và thoả thuận song phương giữa Bưu chính hai nước.\r\n', 'Quy định về khiếu nại bồi thường', '', 'inherit', 'open', 'open', '', '778-revision', '', '', '2012-07-21 00:13:26', '2012-07-20 17:13:26', '', 778, 'http://www.vnestore.com/aa/778-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(778, 1, '2012-07-21 00:04:22', '2012-07-20 17:04:22', '1. Điều kiện chấp nhận khiếu nai bưu gửi AA-Express\r\n\r\n- Thời hạn chấp nhận khiếu nại đốivới bưu gửi trong nước là 3 tháng và bưu gửi quốc tế là 4 tháng kể từ  ngày sau ngày kết thúc chỉ tiêu thời gian toàn trình đã công bố.\r\n\r\n- Chỉ chấp nhận khiếu nại tại những bưu cục có mở dịch vụ AA-Express. \r\n\r\n- Chỉ chấp nhận khiếu nại sau khi kết thúc chỉ tiêu thời gian toàn trình\r\n\r\n2. Những trường hợp không thuộc trách nhiệm bồi thường của doanh nghiệp cung cấp dịch vụ\r\n\r\n-Trường hợp bất khả kháng vì thiên tai, địch họa hoặc những tình huống bất ngờ vượt quá khả năng khắc phục của doanh nghiệp cung cấp dịch vụ. \r\n\r\n- Bưu gửi AA-Express bị hư hỏng do người gửi gói bọc không đảm bảo nội dung bên trong. \r\n\r\n- Bưu gửi AA-Express bị phát nhầm do lỗi của người gửi. \r\n\r\n- Bưu gửi AA-Express có vật phẩm, hàng hoá bị huỷ hoại do đặc tính tự nhiên. \r\n\r\n- Bưu gửi AA-Express có vật phẩm hàng hoá vi phạm quy định về hàng cấm gửi, gửi có điều kiện của Nhà nước, bị cơ quan Nhà nước có thẩm quyền tịch thu hoặc bị huỷ theo quy định của pháp luật. \r\n\r\n- Bưu gửi AA-Express gửi đi quốc tế bị thu giữ theo luật lệ của nước nhận.. \r\n\r\n- Phần giá trị khai man, khai vượt quá giá trị thực tế của bưu gửi AA-Express khai giá . \r\n\r\n- Bưu gửi AA-Express khiếu nại quá thời hạn quy định.\r\n\r\n- Đối với bưu gửi AA-Express quốc tế có nội dung là vật phẩm hàng hoá, doanh nghiệp không phải chịu trách nhiệm đối với việc khai Hải quan của người gửi hoặc người nhận và những quyết định xử lý củaHải quan khi làm thủ tục xuất khẩu, nhập khẩu.\r\n\r\n- Doanh nghiệp cung cấp dịch vụ không phải bồi thường những thiệt hại gián tiếp hoặc những nguồn lợi không thực hiện được do việc mất, suy suyển, hư hỏng bưu gửi AA-Express gây nên. \r\n\r\n3. Nguyên tắc bồi thường \r\n\r\nDoanh nghiệp cung cấp dịch vụ chịutrách nhiệm bồi thường thiệt hại vật chất do lỗi của doanh nghiệp gây ra cho người có quyền thụ hưởng \r\n\r\n- Tiền bồi thường được trả bằngtiền Việt Nam. \r\n\r\n- Tiền bồi thường được trả cho người gửi hoặc người được người gửi uỷ quyền nhận. Trường hợp người nhận đồng ý nhận bưu phẩm AA-Express bị suy suyển hư hỏng thì người nhận được quyền nhận bồithường. \r\n\r\n- Đối với bưu gửi AA-Express gửi từ ViệtNam đi quốc tế, nếu phải bồi thường, Công ty CP CPN Bưu điện chỉ bồi thường cho người gửi hoặc người được người gửi uỷ quyền đang ở tại Việt Nam. \r\n\r\n- Đối với bưu gửi AA-Express quốc tế đến Việt Nam: việc bồi thường được thực hiện theo Điều ước quốc tế mà Công ty CPCPN Bưu điện tham gia ký kết và thoả thuận song phương giữa Bưu chính hai nước.\r\n', 'Quy định về khiếu nại bồi thường', '', 'draft', 'open', 'open', '', 'quy-dinh-ve-khieu-nai-boi-thuong', '', '', '2012-09-17 17:51:48', '2012-09-17 10:51:48', '', 0, 'http://localhost/aaexpress/?page_id=778', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(909, 4, '2012-07-21 00:13:30', '2012-07-20 17:13:30', 'I. Vật cấm gửi.\r\n1)      Các chất ma túy và chất kích thích thần kinh.\r\n2)      Vũ khí đạn dược, trang thiết bị kỹ thuật quân sự.\r\n3)      Các loại văn hóa phẩm đồi trụy, phản động; ấn phẩm, tài liệu nhằm phá hoại trật tực ông cộng chống lại Nhà nước Cộng hòa Xã hội Chủ nghĩa Việt Nam.\r\n4)      Vật hoặc chất dễ nổ, dễ cháy và các chất gây nguy hiểm hoặc làm mất vệ sinh, gây ô nhiễm môi trường.\r\n5)      Các loại vật phẩm hàng hóa mà nhà nước cấm lưu thông, cấm kinh doanh, cấm xuất khẩu, nhập khẩu.\r\n6)      Sinh vật sống.\r\n7)      Vật phẩm, ấn phẩm, hàng hóa cấm nhập vào nước nhận.\r\n8)      Tiền Việt Nam, tiền nước ngoài và các giấy tờ có giá trị như tiền.\r\n9)      Các loại kim khí quý (vàng, bạc, bạch kim…), các loại đá quí hay các sản phẩm khác được chế biến từ kim khí quí, đá quí.\r\n10)  Bưu gửi chứa nhiều bưu gửi, gửi cho nhiều địa chỉ nhận khác nhau.\r\nII. Vật gửi có điều kiện\r\n1)      Bưu gửi có hàng hóa để kinh doanh phải có chứng từ thuế theo qui định của phápluật.\r\n2)      Vật phẩm, hàng hóa xuất khẩu, nhập khẩu thuộc quản lý chuyên ngành phải thực hiện theo qui định của cơ quan quản lý chuyên ngành có thẩm quyền và theo thông báo của Hiệp hội AA-EXPRESS.\r\n3)      Vật phẩm hàng hóa dễ hư hỏng, chất lỏng, chất bột đóng gói phải đảm bảo không gây hư hỏng, ô nhiễm bưu gửi khác.\r\n4)      Vật phẩm hàng hóa gửi trong bưu gửi AA-EXPRESS vận chuyển qua đường hàng không phải tuân theo những qui định về an ninh hàng không.\r\nIII. Điều kiện nhận gửi bưu gửi đi Quốc tế\r\n Ngoài những qui định đối với bưu gửi trong nước, bưu gửi đi quốc tế phải tuân thủ các qui định sau:\r\n1)     Vật gửi trong bưu gửi phải thực hiện các qui định về xuất khẩu của nhà nước và điều kiện nhập khẩu vào các nước nhận (căn cứ qui định về hàng hóa và vật phẩm cấm nhập và nhập có điều kiện vào các nước. Danh mục hàng cấm gửi và gửi đến các nước như sau:\r\n2)      Bưu gửi có vật phẩm, hàng hóa phải qua thủ tục kiểm tra hải quan và phải nộp thuếvà lệ phí Hải quan theo các qui định hiện hành.\r\n3)      Doanh nghiệp cung cấp dịch vụ tổ chức nhận bưu gửi đi quốc tế phải đảm bảo thuận tiện cho người sử dụng dịch vụ và phảit uân theo những qui định trong thông tư và các văn bản hiện hành của cơ quan chức năng có liên quan.\r\n\r\nDANH SÁCH VẬT CẤM GỬI VÀ GỬI CÓ ĐIỀU KIỆN ĐẾN CÁC NƯỚC \r\nSTT	Nước đến	 	STT	Nước đến	 	STT	Nước đến\r\n1	Albania	 	36	Estonia	 	71	Norway\r\n2	Algeria	 	37	Ethiopia	 	72	Pakistan\r\n3	Angola	 	38	Finland	 	73	Panama\r\n3	Argentina	 	39	France (Pháp)	 	74	Paraguay\r\n5	Armenia	 	40	Georgia	 	75	Peru\r\n6	Autralia	 	41	Germany (Đức)	 	76	Philippines\r\n7	Autra	 	42	Ghana	 	77	Poland\r\n8	Bangladsh	 	43	Greece	 	78	Portugal\r\n9	Barbados	 	44	Guam	 	79	Qatar\r\n10	Belarus	 	45	Guatemala	 	80	Romania\r\n11	Belgium	 	46	Hong Kong	 	81	Russia ( Nga)\r\n12	Belize	 	47	Hungary	 	82	Saudi Arabia\r\n13	Bermura	 	48	India (Ấn Độ)	 	83	Senegal\r\n14	Bosnia – Hezegovina	 	49	Indonesia	 	84	Singapore\r\n15	Barzil	 	50	Ireland	 	85	Slovakia\r\n16	British virgin islands	 	51	Israel	 	86	Slovenia\r\n17	Brunei	 	52	Italy ( Ý)	 	87	South Africa\r\n18	Bulgaria	 	53	Jamaica	 	88	South Korea (Hàn Quốc)\r\n19	Cambodia (Cam Pu Chia)	 	54	Japan (Nhật bản)	 	89	Spain\r\n20	Cameroon	 	55	Luwait	 	90	Sri Lanka\r\n21	Canada	 	56	Laos (Lào)	 	91	Sweden (Thụy Điển)\r\n22	Cayman Islands	 	57	Latvia	 	92	Switzealand (Thụy Sỹ)\r\n23	Chile	 	58	Libya	 	93	Syria\r\n24	China (Trung Quốc)	 	59	Luxembourg	 	94	Taiwan (Đài Loan)\r\n25	Colombia	 	60	Macau	 	95	Thailand (Thái Lan)\r\n26	Cook Islands (Đảo Cook)	 	61	Malaysia	 	96	Turkey (Thổ Nhĩ Kỳ)\r\n27	Costarica	 	62	Mauritus	 	97	UAE\r\n28	Cote D’voire (Ivory Coast)	 	63	Mexico (Mê hi cô)	 	98	Ukraine\r\n29	Croatia	 	64	Monaco	 	99	Unitted Kingdom (Anh Quốc)\r\n30	Cyprus 	 	65	Morocco	 	100	Uruguay\r\n31	Czech Republic (CH Séc)	 	66	Mozambique	 	101	USA (Mỹ)\r\n32	East Timor	 	67	Myamar	 	102	Venezuela \r\n33	Ecuador	 	68	Netherlands	 	 	 \r\n34	Egypt	 	69	Newzealands	 	 	 \r\n35	Estonia	 	70	Nigeria	 	 	 \r\n\r\n', 'Vật cấm gửi và gửi có điều kiện', '', 'inherit', 'open', 'open', '', '781-revision-4', '', '', '2012-07-21 00:13:30', '2012-07-20 17:13:30', '', 781, 'http://www.vnestore.com/aa/781-revision-4/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(781, 1, '2012-07-21 00:07:44', '2012-07-20 17:07:44', 'I. Vật cấm gửi.\r\n1)      Các chất ma túy và chất kích thích thần kinh.\r\n2)      Vũ khí đạn dược, trang thiết bị kỹ thuật quân sự.\r\n3)      Các loại văn hóa phẩm đồi trụy, phản động; ấn phẩm, tài liệu nhằm phá hoại trật tực ông cộng chống lại Nhà nước Cộng hòa Xã hội Chủ nghĩa Việt Nam.\r\n4)      Vật hoặc chất dễ nổ, dễ cháy và các chất gây nguy hiểm hoặc làm mất vệ sinh, gây ô nhiễm môi trường.\r\n5)      Các loại vật phẩm hàng hóa mà nhà nước cấm lưu thông, cấm kinh doanh, cấm xuất khẩu, nhập khẩu.\r\n6)      Sinh vật sống.\r\n7)      Vật phẩm, ấn phẩm, hàng hóa cấm nhập vào nước nhận.\r\n8)      Tiền Việt Nam, tiền nước ngoài và các giấy tờ có giá trị như tiền.\r\n9)      Các loại kim khí quý (vàng, bạc, bạch kim…), các loại đá quí hay các sản phẩm khác được chế biến từ kim khí quí, đá quí.\r\n10)  Bưu gửi chứa nhiều bưu gửi, gửi cho nhiều địa chỉ nhận khác nhau.\r\nII. Vật gửi có điều kiện\r\n1)      Bưu gửi có hàng hóa để kinh doanh phải có chứng từ thuế theo qui định của phápluật.\r\n2)      Vật phẩm, hàng hóa xuất khẩu, nhập khẩu thuộc quản lý chuyên ngành phải thực hiện theo qui định của cơ quan quản lý chuyên ngành có thẩm quyền và theo thông báo của Hiệp hội AA-EXPRESS.\r\n3)      Vật phẩm hàng hóa dễ hư hỏng, chất lỏng, chất bột đóng gói phải đảm bảo không gây hư hỏng, ô nhiễm bưu gửi khác.\r\n4)      Vật phẩm hàng hóa gửi trong bưu gửi AA-EXPRESS vận chuyển qua đường hàng không phải tuân theo những qui định về an ninh hàng không.\r\nIII. Điều kiện nhận gửi bưu gửi đi Quốc tế\r\n Ngoài những qui định đối với bưu gửi trong nước, bưu gửi đi quốc tế phải tuân thủ các qui định sau:\r\n1)     Vật gửi trong bưu gửi phải thực hiện các qui định về xuất khẩu của nhà nước và điều kiện nhập khẩu vào các nước nhận (căn cứ qui định về hàng hóa và vật phẩm cấm nhập và nhập có điều kiện vào các nước. Danh mục hàng cấm gửi và gửi đến các nước như sau:\r\n2)      Bưu gửi có vật phẩm, hàng hóa phải qua thủ tục kiểm tra hải quan và phải nộp thuếvà lệ phí Hải quan theo các qui định hiện hành.\r\n3)      Doanh nghiệp cung cấp dịch vụ tổ chức nhận bưu gửi đi quốc tế phải đảm bảo thuận tiện cho người sử dụng dịch vụ và phảit uân theo những qui định trong thông tư và các văn bản hiện hành của cơ quan chức năng có liên quan.\r\n\r\nDANH SÁCH VẬT CẤM GỬI VÀ GỬI CÓ ĐIỀU KIỆN ĐẾN CÁC NƯỚC \r\nSTT	Nước đến	 	STT	Nước đến	 	STT	Nước đến\r\n1	Albania	 	36	Estonia	 	71	Norway\r\n2	Algeria	 	37	Ethiopia	 	72	Pakistan\r\n3	Angola	 	38	Finland	 	73	Panama\r\n3	Argentina	 	39	France (Pháp)	 	74	Paraguay\r\n5	Armenia	 	40	Georgia	 	75	Peru\r\n6	Autralia	 	41	Germany (Đức)	 	76	Philippines\r\n7	Autra	 	42	Ghana	 	77	Poland\r\n8	Bangladsh	 	43	Greece	 	78	Portugal\r\n9	Barbados	 	44	Guam	 	79	Qatar\r\n10	Belarus	 	45	Guatemala	 	80	Romania\r\n11	Belgium	 	46	Hong Kong	 	81	Russia ( Nga)\r\n12	Belize	 	47	Hungary	 	82	Saudi Arabia\r\n13	Bermura	 	48	India (Ấn Độ)	 	83	Senegal\r\n14	Bosnia – Hezegovina	 	49	Indonesia	 	84	Singapore\r\n15	Barzil	 	50	Ireland	 	85	Slovakia\r\n16	British virgin islands	 	51	Israel	 	86	Slovenia\r\n17	Brunei	 	52	Italy ( Ý)	 	87	South Africa\r\n18	Bulgaria	 	53	Jamaica	 	88	South Korea (Hàn Quốc)\r\n19	Cambodia (Cam Pu Chia)	 	54	Japan (Nhật bản)	 	89	Spain\r\n20	Cameroon	 	55	Luwait	 	90	Sri Lanka\r\n21	Canada	 	56	Laos (Lào)	 	91	Sweden (Thụy Điển)\r\n22	Cayman Islands	 	57	Latvia	 	92	Switzealand (Thụy Sỹ)\r\n23	Chile	 	58	Libya	 	93	Syria\r\n24	China (Trung Quốc)	 	59	Luxembourg	 	94	Taiwan (Đài Loan)\r\n25	Colombia	 	60	Macau	 	95	Thailand (Thái Lan)\r\n26	Cook Islands (Đảo Cook)	 	61	Malaysia	 	96	Turkey (Thổ Nhĩ Kỳ)\r\n27	Costarica	 	62	Mauritus	 	97	UAE\r\n28	Cote D’voire (Ivory Coast)	 	63	Mexico (Mê hi cô)	 	98	Ukraine\r\n29	Croatia	 	64	Monaco	 	99	Unitted Kingdom (Anh Quốc)\r\n30	Cyprus 	 	65	Morocco	 	100	Uruguay\r\n31	Czech Republic (CH Séc)	 	66	Mozambique	 	101	USA (Mỹ)\r\n32	East Timor	 	67	Myamar	 	102	Venezuela \r\n33	Ecuador	 	68	Netherlands	 	 	 \r\n34	Egypt	 	69	Newzealands	 	 	 \r\n35	Estonia	 	70	Nigeria	 	 	 \r\n\r\n', 'Vật cấm gửi và gửi có điều kiện', '', 'draft', 'open', 'open', '', 'vat-cam-gui-va-gui-co-dieu-kien', '', '', '2012-09-17 17:51:59', '2012-09-17 10:51:59', '', 0, 'http://localhost/aaexpress/?page_id=781', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(788, 1, '2012-07-21 00:18:43', '2012-07-20 17:18:43', 'AA Express luôn có các chương trình khuyến mãi hấp dẫn dành cho quý khách hàng khi chọn tất cả các loại dịch vụ của chúng tôi. \r\nHãy gọi điện cho chúng tôi để biết thêm thông tin chi tiết! ', 'Thông tin cần biết', '', 'publish', 'closed', 'closed', '', 'thong-tin-can-biet', '', '', '2012-07-21 00:18:43', '2012-07-20 17:18:43', '', 0, 'http://localhost/aaexpress/?post_type=pt-widget&#038;p=788', 0, 'pt-widget', '', 0);
INSERT INTO `dev_posts` VALUES(910, 4, '2012-07-22 15:09:05', '2012-07-22 08:09:05', '(Dân trí) - Bất ngờ kiểm tra chiếc xe của ngành bưu chính, lực lượng chức năng phát hiện hơn 100 chai rượu Chivas nhập lậu.\r\nNgày 10/1, Đội 6 - Phòng Cảnh sát phòng chống tội phạm về môi trường (PC49 - CATP Hà Nội) cho biết đang tiếp tục làm rõ, xử lý vụ vận chuyển rượu lậu vừa bị phát hiện, bắt giữ.\r\n \r\nTrước đó, Đội 6 nhận nguồn tin quần chúng nhân dân về việc có một số đối tượng chuyên dùng xe chuyển phát nhanh của ngành bưu chính để vận chuyển rượu lậu. Qua quá trình trinh sát, 21h tối 9/1, Đội 6 - PC49 phối hợp với Đội Quản lý thị trường số 1 - Chi cục QLTT Hà Nội bất ngờ kiểm tra chiếc xe tải BKS 54V-7290 của Công ty cổ phần và dịch vụ Bưu chính Viễn thông Sài Gòn tại khu vực gầm cầu Thanh Trì (quốc lộ 5, Gia Lâm, Hà Nội).\r\n \r\nTrong thùng xe, bên cạnh những kiện hàng bưu chính là 12 bao tải đựng 21 hộp rượu Chivas, tổng số 123 chai, trong đó có 108 chai Chivas 18; 12 chai Chivas 21 và 3 chai Chivas 38. Thời điểm kiểm tra, lái xe không xuất trình được giấy tờ chứng minh nguồn gốc số rượu này. Các chai rượu cũng không được dán tem hợp chuẩn.\r\n \r\nTại cơ quan công an, lái xe khai tên Lưu Minh Châu, nhân viên Công ty cổ phần và dịch vụ Bưu chính Viễn Thông Sài Gòn. Theo lái xe Châu, anh được người khác nhờ chở số rượu trên, lần này là lần thứ 2.\r\nCơ quan chức năng xác định, số rượu lậu bị thu giữ có tổng giá trị là 170 triệu đồng.\r\n\r\nHiện lực lượng chức năng đang làm rõ chủ số hàng trên để xử lý.\r\n\r\nTiến Nguyên', 'Hà Nội: Xe bưu chính “chở thuê” rượu lậu', '', 'inherit', 'open', 'open', '', '795-revision-2', '', '', '2012-07-22 15:09:05', '2012-07-22 08:09:05', '', 795, 'http://www.vnestore.com/aa/795-revision-2/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(795, 1, '2012-07-22 15:09:05', '2012-07-22 08:09:05', '(Dân trí) - Bất ngờ kiểm tra chiếc xe của ngành bưu chính, lực lượng chức năng phát hiện hơn 100 chai rượu Chivas nhập lậu.\r\nNgày 10/1, Đội 6 - Phòng Cảnh sát phòng chống tội phạm về môi trường (PC49 - CATP Hà Nội) cho biết đang tiếp tục làm rõ, xử lý vụ vận chuyển rượu lậu vừa bị phát hiện, bắt giữ.\r\n \r\nTrước đó, Đội 6 nhận nguồn tin quần chúng nhân dân về việc có một số đối tượng chuyên dùng xe chuyển phát nhanh của ngành bưu chính để vận chuyển rượu lậu. Qua quá trình trinh sát, 21h tối 9/1, Đội 6 - PC49 phối hợp với Đội Quản lý thị trường số 1 - Chi cục QLTT Hà Nội bất ngờ kiểm tra chiếc xe tải BKS 54V-7290 của Công ty cổ phần và dịch vụ Bưu chính Viễn thông Sài Gòn tại khu vực gầm cầu Thanh Trì (quốc lộ 5, Gia Lâm, Hà Nội).\r\n \r\nTrong thùng xe, bên cạnh những kiện hàng bưu chính là 12 bao tải đựng 21 hộp rượu Chivas, tổng số 123 chai, trong đó có 108 chai Chivas 18; 12 chai Chivas 21 và 3 chai Chivas 38. Thời điểm kiểm tra, lái xe không xuất trình được giấy tờ chứng minh nguồn gốc số rượu này. Các chai rượu cũng không được dán tem hợp chuẩn.\r\n \r\nTại cơ quan công an, lái xe khai tên Lưu Minh Châu, nhân viên Công ty cổ phần và dịch vụ Bưu chính Viễn Thông Sài Gòn. Theo lái xe Châu, anh được người khác nhờ chở số rượu trên, lần này là lần thứ 2.\r\nCơ quan chức năng xác định, số rượu lậu bị thu giữ có tổng giá trị là 170 triệu đồng.\r\n\r\nHiện lực lượng chức năng đang làm rõ chủ số hàng trên để xử lý.\r\n\r\nTiến Nguyên', 'Hà Nội: Xe bưu chính “chở thuê” rượu lậu', '', 'trash', 'open', 'open', '', 'ha-noi-xe-buu-chinh-cho-thue-ruou-lau', '', '', '2012-09-08 13:33:27', '2012-09-08 06:33:27', '', 0, 'http://localhost/aaexpress/?p=795', 0, 'post', '', 0);
INSERT INTO `dev_posts` VALUES(911, 4, '2012-07-22 15:10:42', '2012-07-22 08:10:42', 'Để đối phó với tình trạng bị hàng không lùi chuyến, chậm chuyển hàng gây ảnh hưởng chất lượng dịch vụ, một số doanh nghiệp (DN) bưu chính lớn đã dự định hợp tác để đầu tư thuê, mua máy bay chuyên vận chuyển hàng.\r\nSong đến nay ý tưởng này vẫn còn vướng nhiều “rào cản”.\r\n  \r\nTình trạng bưu gửi của các DN bưu chính bị hàng không cho “lùi” chuyến, chậm chuyển đã trở thành chuyện “thường tình ở huyện” từ hơn 10 năm qua.\r\n \r\nTrong lĩnh vực bưu chính chuyển phát, một tiêu chí quan trọng để đánh giá chất lượng dịch vụ của các DN là việc DN có thực hiện đúng cam kết với khách hàng về thời gian toàn trình của bưu gửi hay không.\r\n \r\nTuy nhiên, nhiều năm qua, việc này vẫn luôn là bài toán khó, làm đau đầu nhiều lãnh đạo DN bưu chính. Và một nguyên nhân không nhỏ của thực trạng thời gian toàn trình bưu gửi của các DN bưu chính bị kéo dài hơn so với cam kết chính là bởi sự phụ thuộc quá lớn vào các hãng vận tải hàng không.\r\n \r\nĐại diện lãnh đạo một số DN bưu chính lớn trên thị trường như VietnamPost, ViettelPost, Netco, Tín Thành… đều thừa nhận tình trạng hàng hóa, bưu gửi của các DN bưu chính bị hàng không cho “lùi” chuyến, chậm chuyển, đặc biệt là vào các dịp cao điểm như lễ, tết đã trở thành chuyện “thường tình ở huyện” từ hơn 10 năm qua.\r\n \r\nTrao đổi về vấn đề này, ông Lương Ngọc Hải - Tổng giám đốc ViettelPost nhận định, cùng với điện lực, hàng không cũng là lĩnh vực mà hiện khách hàng - những “thượng đế” - vẫn phải năn nỉ, quỵ lụy để được sử dụng dịch vụ.\r\n \r\n“Lý do thường trực khiến cho hàng hóa, bưu gửi của các DN bưu chính bị các hãng hàng không lùi chuyến bay là do chuyến đó có nhiều khách, nhiều hàng đông lạnh (loại hàng có giá vận chuyển cao - PV). Điều này đã ảnh hưởng đến chỉ tiêu thời gian toàn trình cam kết với khách hàng của DN bưu chính. Đó là chưa kể đến vấn đề an toàn bưu gửi, hàng hóa chuyển qua đường hàng không nhiều khi không đảm bảo, tình trạng mất mát bưu phẩm xảy ra không ít”, ông Hải nói.\r\n \r\nĐồng tình với nhận định của lãnh đạo ViettelPost, ông Nguyễn Văn Tú - Tổng giám đốc Công ty CP chuyển phát nhanh Tín Thành cho hay, khó khăn với các DN bưu chính hiện nay là Việt Nam chưa có hãng hàng không chuyên về vận tải hàng hóa (cargo) mà các hãng hàng không nước ta vẫn chủ yếu là vận tải hành khách, có kết hợp thêm vận chuyển hàng. Do vậy, ưu tiên hàng đầu của các hãng hàng không vẫn là chở khách.  \r\n \r\nCòn theo ông Đỗ Ngọc Bình - Tổng giám đốc VietnamPost, hầu hết các DN hoạt động trong lĩnh vực bưu chính chuyển phát đều đang “vướng” một vấn đề rất lớn, đó là làm sao để bưu chính có thể kết nối vận chuyển “over night”, tức là làm cách nào để DN bưu chính vận chuyển được hàng trên trục Bắc-Nam trong đêm và sáng hôm sau có thể phát hàng đến người nhận. Do đặc điểm địa hình Việt Nam giống như một chiếc đòn gánh dài nên phương thức vận chuyển hàng hiệu quả, đảm bảo chỉ tiêu thời gian trên trục Bắc-Nam vẫn là vận tải hàng không.\r\n \r\n“Cũng vì thế, để phục vụ nhu cầu phát triển, đảm bảo được yêu cầu về chất lượng dịch vụ, phục vụ khách hàng, rõ ràng các DN bưu chính rất cần máy bay để vận chuyển hàng hóa, bưu gửi trong đêm”, ông Bình chia sẻ.\r\n \r\nVẫn nhiều “rào cản”!\r\n \r\nTrên thực tế, để đối phó với khó khăn trên, có được sự chủ động nhất định trong phương thức chuyên chở hàng hóa, bưu gửi qua đường hàng không; góp phần nâng cao chất lượng dịch vụ, đồng thời tăng khả năng cạnh tranh của đơn vị mình, một số DN bưu chính đã ấp ủ kế hoạch tham gia vào lĩnh vực kinh doanh vận tải hàng không.\r\n \r\nCó thể nói, Tín Thành đã là DN “nổ phát súng” đầu tiên khi góp gần 33 tỷ đồng để tham gia đồng sáng lập hãng hàng không lưỡng dụng Ngôi sao Việt (Vietstar Airlines) vào giữa năm 2011. Động thái này được đánh giá là khá khôn ngoan bởi khi Vietstar Airlines đi vào khai thác, chắc chắn Tín Thành sẽ chủ động hơn về thời gian chuyển hàng cho khách, về năng lực vận tải hàng không.\r\n \r\nMới đây, trong cuộc tọa đàm “Mở cửa thị trường bưu chính: cơ hội và thách thức” do Báo Bưu điện Việt Nam và Vụ Bưu chính thuộc Bộ TT&TT phối hợp tổ chức, Tổng giám đốc ViettelPost Lương Ngọc Hải đã mạnh dạn đề xuất các DN bưu chính thời gian tới hợp tác với nhau để khai thác dịch vụ vận tải hàng không.\r\n \r\nÔng Hải nhấn mạnh: “Nếu các DN bưu chính có máy bay riêng để chuyên trở hàng hóa, đảm bảo kết nối giữa trục Bắc-Nam thì sẽ có thể chủ động hơn trong vận chuyển hàng và chất lượng dịch vụ sẽ ổn định, được kiểm soát chặt chẽ hơn”.\r\n \r\nLiên quan đến việc tháo gỡ khó khăn trong lĩnh vực vận tải hàng, ông Bình cũng đề nghị, trước mắt, các DN cần bàn bạc cách thức hợp tác để có thể đảm bảo chuyển hàng trong đêm trên trục Bắc-Nam. Còn về lâu dài, trong trường hợp bưu chính đã có máy bay để chuyên vận chuyển hàng hóa, bưu gửi trong đêm thì các DN bưu chính vẫn cần “cộng lực” để thu gom đủ chân hàng.\r\n \r\nÔng Đỗ Ngọc Bình đã “bật mí”: trước đây lãnh đạo VietnamPost và 1 DN bưu chính khác từng bàn phương án hợp tác để cùng thuê hoặc mua máy bay chuyên vận chuyển hàng; với phương thức hợp tác dự kiến là sẽ hình thành 1 đơn vị liên doanh chịu trách nhiệm vận hành hoạt động chuyển hàng của máy bay đó. Tuy nhiên, do nhiều nguyên nhân, ý định này đã không thể trở thành hiện thực.\r\n\r\nCụ thể, theo phân tích của lãnh đạo VietnamPost, thị trường cargo của Việt Nam hiện chưa phát triển, lợi nhuận của các hãng hàng không vẫn chủ yếu là từ dịch vụ chở khách, chỉ cần 70% số ghế trên máy bay đầy là hãng đã có lợi nhuận; còn việc vận chuyển hàng chỉ để tận dụng các ghế chở khách còn trống trên máy bay, do đó giá cước dịch vụ vận chuyển hàng của các hãng hàng không thiếu minh bạch, không phản ánh đúng giá thành dịch vụ và thường được các hãng hàng không cung cấp với mức giá rất rẻ cho các DN chuyên làm giao nhận (forwarder) đặt mua tải trọng lớn, khoảng vài chục ngàn tấn/năm. Cũng bởi sự thiếu minh bạch này, nếu các DN bưu chính hợp tác thuê, mua máy bay chuyên vận chuyển hàng hóa thì chắc chắn sẽ không thể cạnh tranh được. Bởi lẽ, đơn giá vận chuyển cho 1 kg hàng hóa sẽ gấp đôi, thậm chí là sẽ cao hơn nhiều so với giá mà các hãng hàng không trong nước đang cung cấp.\r\n \r\nTheo M.T\r\nBưu điện Việt Nam', 'Lo hàng không độc quyền: Bưu chính muốn sắm máy bay riêng', '', 'inherit', 'open', 'open', '', '798-revision-2', '', '', '2012-07-22 15:10:42', '2012-07-22 08:10:42', '', 798, 'http://www.vnestore.com/aa/798-revision-2/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(798, 1, '2012-07-22 15:10:42', '2012-07-22 08:10:42', 'Để đối phó với tình trạng bị hàng không lùi chuyến, chậm chuyển hàng gây ảnh hưởng chất lượng dịch vụ, một số doanh nghiệp (DN) bưu chính lớn đã dự định hợp tác để đầu tư thuê, mua máy bay chuyên vận chuyển hàng.\r\nSong đến nay ý tưởng này vẫn còn vướng nhiều “rào cản”.\r\n  \r\nTình trạng bưu gửi của các DN bưu chính bị hàng không cho “lùi” chuyến, chậm chuyển đã trở thành chuyện “thường tình ở huyện” từ hơn 10 năm qua.\r\n \r\nTrong lĩnh vực bưu chính chuyển phát, một tiêu chí quan trọng để đánh giá chất lượng dịch vụ của các DN là việc DN có thực hiện đúng cam kết với khách hàng về thời gian toàn trình của bưu gửi hay không.\r\n \r\nTuy nhiên, nhiều năm qua, việc này vẫn luôn là bài toán khó, làm đau đầu nhiều lãnh đạo DN bưu chính. Và một nguyên nhân không nhỏ của thực trạng thời gian toàn trình bưu gửi của các DN bưu chính bị kéo dài hơn so với cam kết chính là bởi sự phụ thuộc quá lớn vào các hãng vận tải hàng không.\r\n \r\nĐại diện lãnh đạo một số DN bưu chính lớn trên thị trường như VietnamPost, ViettelPost, Netco, Tín Thành… đều thừa nhận tình trạng hàng hóa, bưu gửi của các DN bưu chính bị hàng không cho “lùi” chuyến, chậm chuyển, đặc biệt là vào các dịp cao điểm như lễ, tết đã trở thành chuyện “thường tình ở huyện” từ hơn 10 năm qua.\r\n \r\nTrao đổi về vấn đề này, ông Lương Ngọc Hải - Tổng giám đốc ViettelPost nhận định, cùng với điện lực, hàng không cũng là lĩnh vực mà hiện khách hàng - những “thượng đế” - vẫn phải năn nỉ, quỵ lụy để được sử dụng dịch vụ.\r\n \r\n“Lý do thường trực khiến cho hàng hóa, bưu gửi của các DN bưu chính bị các hãng hàng không lùi chuyến bay là do chuyến đó có nhiều khách, nhiều hàng đông lạnh (loại hàng có giá vận chuyển cao - PV). Điều này đã ảnh hưởng đến chỉ tiêu thời gian toàn trình cam kết với khách hàng của DN bưu chính. Đó là chưa kể đến vấn đề an toàn bưu gửi, hàng hóa chuyển qua đường hàng không nhiều khi không đảm bảo, tình trạng mất mát bưu phẩm xảy ra không ít”, ông Hải nói.\r\n \r\nĐồng tình với nhận định của lãnh đạo ViettelPost, ông Nguyễn Văn Tú - Tổng giám đốc Công ty CP chuyển phát nhanh Tín Thành cho hay, khó khăn với các DN bưu chính hiện nay là Việt Nam chưa có hãng hàng không chuyên về vận tải hàng hóa (cargo) mà các hãng hàng không nước ta vẫn chủ yếu là vận tải hành khách, có kết hợp thêm vận chuyển hàng. Do vậy, ưu tiên hàng đầu của các hãng hàng không vẫn là chở khách.  \r\n \r\nCòn theo ông Đỗ Ngọc Bình - Tổng giám đốc VietnamPost, hầu hết các DN hoạt động trong lĩnh vực bưu chính chuyển phát đều đang “vướng” một vấn đề rất lớn, đó là làm sao để bưu chính có thể kết nối vận chuyển “over night”, tức là làm cách nào để DN bưu chính vận chuyển được hàng trên trục Bắc-Nam trong đêm và sáng hôm sau có thể phát hàng đến người nhận. Do đặc điểm địa hình Việt Nam giống như một chiếc đòn gánh dài nên phương thức vận chuyển hàng hiệu quả, đảm bảo chỉ tiêu thời gian trên trục Bắc-Nam vẫn là vận tải hàng không.\r\n \r\n“Cũng vì thế, để phục vụ nhu cầu phát triển, đảm bảo được yêu cầu về chất lượng dịch vụ, phục vụ khách hàng, rõ ràng các DN bưu chính rất cần máy bay để vận chuyển hàng hóa, bưu gửi trong đêm”, ông Bình chia sẻ.\r\n \r\nVẫn nhiều “rào cản”!\r\n \r\nTrên thực tế, để đối phó với khó khăn trên, có được sự chủ động nhất định trong phương thức chuyên chở hàng hóa, bưu gửi qua đường hàng không; góp phần nâng cao chất lượng dịch vụ, đồng thời tăng khả năng cạnh tranh của đơn vị mình, một số DN bưu chính đã ấp ủ kế hoạch tham gia vào lĩnh vực kinh doanh vận tải hàng không.\r\n \r\nCó thể nói, Tín Thành đã là DN “nổ phát súng” đầu tiên khi góp gần 33 tỷ đồng để tham gia đồng sáng lập hãng hàng không lưỡng dụng Ngôi sao Việt (Vietstar Airlines) vào giữa năm 2011. Động thái này được đánh giá là khá khôn ngoan bởi khi Vietstar Airlines đi vào khai thác, chắc chắn Tín Thành sẽ chủ động hơn về thời gian chuyển hàng cho khách, về năng lực vận tải hàng không.\r\n \r\nMới đây, trong cuộc tọa đàm “Mở cửa thị trường bưu chính: cơ hội và thách thức” do Báo Bưu điện Việt Nam và Vụ Bưu chính thuộc Bộ TT&TT phối hợp tổ chức, Tổng giám đốc ViettelPost Lương Ngọc Hải đã mạnh dạn đề xuất các DN bưu chính thời gian tới hợp tác với nhau để khai thác dịch vụ vận tải hàng không.\r\n \r\nÔng Hải nhấn mạnh: “Nếu các DN bưu chính có máy bay riêng để chuyên trở hàng hóa, đảm bảo kết nối giữa trục Bắc-Nam thì sẽ có thể chủ động hơn trong vận chuyển hàng và chất lượng dịch vụ sẽ ổn định, được kiểm soát chặt chẽ hơn”.\r\n \r\nLiên quan đến việc tháo gỡ khó khăn trong lĩnh vực vận tải hàng, ông Bình cũng đề nghị, trước mắt, các DN cần bàn bạc cách thức hợp tác để có thể đảm bảo chuyển hàng trong đêm trên trục Bắc-Nam. Còn về lâu dài, trong trường hợp bưu chính đã có máy bay để chuyên vận chuyển hàng hóa, bưu gửi trong đêm thì các DN bưu chính vẫn cần “cộng lực” để thu gom đủ chân hàng.\r\n \r\nÔng Đỗ Ngọc Bình đã “bật mí”: trước đây lãnh đạo VietnamPost và 1 DN bưu chính khác từng bàn phương án hợp tác để cùng thuê hoặc mua máy bay chuyên vận chuyển hàng; với phương thức hợp tác dự kiến là sẽ hình thành 1 đơn vị liên doanh chịu trách nhiệm vận hành hoạt động chuyển hàng của máy bay đó. Tuy nhiên, do nhiều nguyên nhân, ý định này đã không thể trở thành hiện thực.\r\n\r\nCụ thể, theo phân tích của lãnh đạo VietnamPost, thị trường cargo của Việt Nam hiện chưa phát triển, lợi nhuận của các hãng hàng không vẫn chủ yếu là từ dịch vụ chở khách, chỉ cần 70% số ghế trên máy bay đầy là hãng đã có lợi nhuận; còn việc vận chuyển hàng chỉ để tận dụng các ghế chở khách còn trống trên máy bay, do đó giá cước dịch vụ vận chuyển hàng của các hãng hàng không thiếu minh bạch, không phản ánh đúng giá thành dịch vụ và thường được các hãng hàng không cung cấp với mức giá rất rẻ cho các DN chuyên làm giao nhận (forwarder) đặt mua tải trọng lớn, khoảng vài chục ngàn tấn/năm. Cũng bởi sự thiếu minh bạch này, nếu các DN bưu chính hợp tác thuê, mua máy bay chuyên vận chuyển hàng hóa thì chắc chắn sẽ không thể cạnh tranh được. Bởi lẽ, đơn giá vận chuyển cho 1 kg hàng hóa sẽ gấp đôi, thậm chí là sẽ cao hơn nhiều so với giá mà các hãng hàng không trong nước đang cung cấp.\r\n \r\nTheo M.T\r\nBưu điện Việt Nam', 'Lo hàng không độc quyền: Bưu chính muốn sắm máy bay riêng', '', 'trash', 'open', 'open', '', 'lo-hang-khong-doc-quyen-buu-chinh-muon-sam-may-bay-rieng', '', '', '2012-09-08 13:33:27', '2012-09-08 06:33:27', '', 0, 'http://localhost/aaexpress/?p=798', 0, 'post', '', 0);
INSERT INTO `dev_posts` VALUES(912, 4, '2012-07-22 15:16:15', '2012-07-22 08:16:15', 'Là 1 công ty chuyển phát nhanh lớn nhất thế giới, FedEx Express đã thiết lập 1 mạng lưới vận chuyển hàng không và trên đất liền toàn cầu nhằm cung cấp việc vận chuyển nhanh và đáng tin cậy đến hơn 220 quốc gia và vùng lãnh thổ trên toàn thế giới. Tất cả 143,000 nhân viên của FedEx Express đều cùng thực hiện lời cam kết: “Luôn tạo ra sự trải nghiệm khác biệt…”\r\nTHỊ TRƯỜNG\r\n\r\nMặc dầu những điều kiện kinh tế toàn cầu đầy thách thức không ngừng gia tăng, FedEx Express vẫn liên tục đạt đươc những kết quả kinh doanh khả quan, đạt doanh thu 1,740 triệu USD trong năm tài chính 2007/08, tăng 8% so với cùng kỳ năm trước. Từ chính những kết quả trên cho thấy FedEx Express đã hưởng nhiều lợi ích từ việc phát triển mạnh mẽ, liên tục của ngành kinh doanh chuyển phát nhanh quốc tế và từ chính sự đầu tư để mở rộng thị phần cung cấp thêm nhiều dịch vụ khác nhằm gia tăng công suất và doanh thu của họ.\r\n\r\nTHÀNH TỰU ĐẠT ĐƯỢC\r\n\r\nVào năm 2008, FedEx Express đã tổ chức lễ kỷ niệm 35 năm thành lập.Được thành lập vào năm 1973, FedEx Express là một sản phẩm trí tuệ của người thành lập ra nó, Frederick Smith người hiện thời vừa là chủ tịch, giám đốc, và CEO và là người đã được xem là "nhân vật ấn tượng nhất của năm”.\r\n\r\nFedEx Express xuất phát từ những lá thư chuyển qua đêm, và là công ty chuyển phát nhanh đầu tiên xúc tiến cung cấp việc vận chuyển đóng gói thâu đêm và giao nhận trước 10h-am hôm sau, FedEx Express cũng là công ty đầu tiên đưa ra dịch vụ chuyển hàng theo giờ xác định và cam kết hoàn trả hoặc vận chuyển lại miễn phí. Vào năm 1983, FedEx Express đã tạo nên lịch sử trong ngành kinh doanh khi trở thành công ty Mỹ đẩu tiên đạt được cột mốc doanh thu 1 tỷ USD sau 10 năm thành lâp mà không thông qua viêc tiếp nhận hay sát nhập với công ty khác.\r\n\r\nNhững thành quả xuất sắc này đã giúp FedEx Express được nhận rất nhiều giải thưởng và danh hiệu. Năm 1990 FedEx Express đã trở thành công ty  đẩu tiên đạt đươc Giải Thưởng Chất Lượng Quốc Gia Malcolm Baldrige trong lĩnh vực dịch vụ, chứng nhận ISO 9001 cho tất cả các lĩnh vực kinh doanh trên toàn cầu vào năm 1994,trở thành công ty chuyển phát nhanh toàn cầu đầu tiên nhận được chứng nhận này trên toàn hệ thống cùng một thời điểm.\r\n\r\nNăm 2008, FedEx Express được tạp chí Fortune xếp thứ 6 trong danh sách những công ty nổi bật và đứng đầu về lĩnh vực dịch vụ khách hàng qua cuộc khảo sát của Harris Interactive Reputation Quotient\r\n\r\nCác sản phẩm  của FedEx Express bao gồm dịch vụ vận chuyển quốc tế theo đơn hàng tận nhà, theo thời gian xác định và cả các gói hàng đòi hỏi tính cấp bách, quà tặng gấp, các thiết bị phục vụ khoa học dễ vỡ, hàng hoá cồng kềnh và có tính nguy hiểm.Mỗi gói hàng được chuyển đi được FedEx Express kiểm tra trung bình 17 lần/chuyến nhằm đảm bảo rằng khách hàng có thể dễ dàng theo dõi vị trí chính xác của từng gói hàng thông qua kiểm tra Email, truy  cập Internet, hoặc gọi điện trực tiếp 24h/ngày. FedEx Express luôn xem việc vận chuyển mỗi gói hàng như thê là chỉ có duy nhất 1 gói hàng đó được vận chuyển trong ngày.\r\n\r\n\r\n\r\nNgoài những gói sản phẩm dịch vụ đã được FedEx Express triển khai trên toàn cầu, chi nhánh FedEx Express ở Vương Quốc Anh còn cung cấp dịch vụ vận chuyển trong nước với nhiều sự lựa chọn bao gồm: dịch vụ vận chuyển theo thời gian định sẵn, qua ngày hôm sau hay ngày Thứ 7 cuối tuần. Tất cả những dịch vụ trên đều được hỗ trợ miễn phí bằng nhiều dịch vụ có tính tự động hóa cao và dễ sử dụng nhằm giúp khách hàng dễ dàng nhận hàng hoặc theo dõi các gói hàng vận chuyển thông qua mang Internet.\r\n\r\nCHIẾN DỊCH QUẢNG CÁO\r\n\r\nNăm 2006, FedEx Express đã  mua lại công ty ANC Holdings, hiện nay đã đổi tên thành FedEx Express UK, là một công ty quản lý 1 mạng lưới hơn 2000 xe chuyên dụng và sở hữu 1,5 feet vuông măt bằng kinh doanh xuyên suốt vương quốc Anh, tuyển dụng hơn 4000 nhân viên nhiều kinh nghiêm cùng các nhà thầu phụ. Việc tiếp nhận ANC đã giúp cho FedEx cung cấp đầy đủ các dịch vụ vẩn chuyển cả trên thị trường quốc tế lẫn nội địa. Tháng 10-2008, FedEx Express đẩy mạnh dịch vụ vận chuyển “next-business-day” (vận chuyển trong ngày cuối tuần) đến vùng lãnh hải phía Đông nước Mỹ bằng cách thiết lập 1 đường bay mới hướng Tây, xuyên Đại Tây Dương giữa Paris và Neward. Chính vì điều này đã giúp cho khách hàng ở Vương Quốc Anh và trên toàn châu Âu hiện nay có thể lựa chọn thời gian nhận hàng trễ hơn mà vẫn đảm bảo việc vận chuyển trong ngày kế tiếp.\r\n\r\nTháng 11-2007, FedEx Express đã tung ra chiến dịch quảng cáo "Behind the Scenes" với 9 loại ngôn ngữ, triển khai ở 13 quốc gia, bằng các phương tiện truyền thông như sách báo, tạp chí và cả truyền thông kỹ thuật số…Mục tiêu chủ yếu của chiến dịch này là tạo dựng thương hiệu hàng đầu trong thị trường chuyển phát nhanh toàn cầu bằng cách đẩy mạnh sự nhận biết thương hiệu, danh tiếng của công ty, và giá trị cốt lõi bền vững của FedEx trên toàn cầu.\r\n\r\nChiến dịch này được xây dựng là minh chứng cho những những nỗ lực của công ty FedEx để đạt được mục tiêu trên toàn cầu. Tất cả các chương trình quảng cáo qua mạng hay qua báo chí đều hướng độc giả truy cập vào trang Web www.experience.FedEx.com để cung cấp sự nhìn nhận vĩ mô về những thông tin và thị trường toàn cầu nhằm giúp các nhà kinh doanh có thể tiếp cận được các cơ hội kinh doanh toàn cầu. Về tổng thể, chiến dịch đã tạo sức hút đến hơn 1,9 tỷ truy cập và đươc trao giải thưởng “Web Marketing Association’s 2008 WebAward” cho website thương mại toàn cẩu xuất sắc nhất.\r\n\r\nGIÁ TRÍ THƯƠNG HIỆU\r\n\r\nChiến lươc của FedEx,mà toàn bộ nhân viên của công ty khắc ghi như “Sự cam kết trọn đời”đó là : “Luôn tạo ra sự trải nghiệm khác biệt …”. “Sự cam kết trọn đời” này là một chiến lược lâu dài giúp cho FedEx phát triển hơn nữa các mối quan hệ bền vững với khách hàng. Mục tiêu của công ty hướng đến là : nâng cao giá trị con người và sự thịnh vượng, đưa ra các dịch vụ mà luôn xem khách hàng là trọng tâm, đầu tư công nghệ kỹ thuật và dịch vụ nhằm tăng năng suất làm việc và đời sống của nhân viên, quản trị hoạt động kinh doanh, tài chính và dịch vụ bằng sự trung thực, hiệu quả và tin cậy, môi trường làm việc an toàn và lành mạnh, và đạt được sự tin tưởng và tôn trọng từ mỗi nhân viên, khách hàng và nhà đẩu tư.\r\n\r\n\r\n\r\nFedEx và các cột mốc\r\n\r\n·   Năm 1971, Frederick W Smith đã  quản lý ở Arkansas Aviation Sales và nhanh chóng nhận ra những khó khăn trong việc đóng gói vận chuyển hàng, ý tưởng thành lập FedEx xuất phát từ đây.\r\n\r\n·   Năm 1973, Federal Express chính thức bắt đầu hoạt động với 14 máy bay chuyên chở loại nhỏ xuất phát từ phi trường quốc tế Memphis, Họ đã vận chuyển được 186 kiện hàng đến 25 thành phố trong ngày đầu tiên.\r\n\r\n·   Năm 1977, sự bãi bõ quy định về chuyên chở bằng đường hàng không  cho phép sử dụng các máy bay chuyên chở loai lớn như Boeing 727s và McDonnell-Douglas DC-10s đã giúp Federal Express phát triển nhanh chóng.\r\n\r\n·   Năm 1984,khai trương dịch vụ vận chuyển xuyên luc địa đến Châu Âu và Châu Á,trong năm tiếp theo đã thiết lập lịch bay định kỳ đầu tiên đến Châu Âu.\r\n\r\n·   Năm 1989, với việc tiếp nhận Flying Tiger Network, FedEx Express đã trở thành công ty vận chuyển hàng không đa dịch vụ lớn nhất.\r\n\r\n·   Năm 1994, Federal Express chính thức công bố FedEx là tên thương hiêu đầu tiên của công ty,dựa trên gợi ý của khách hàng cho một cái tên ngắn gọn hơn.\r\n\r\n·   Năm 1995, Federal Express trở thành công ty Mỹ duy nhất được quyền cung cấp dịch vụ vận chuyển bằng đường hàng không đến Trung Quốc.\r\n\r\n·   Năm 2000, đổi tên thành FedEx Express để phản ánh vị trí của nó với tổng thể thị phần dịch vụ của FedEx Corporation.\r\n\r\n·  Năm 2006, FedEx đẩy mạnh khả năng cung cấp dịch vụ bằng việc tiếp nhận UK domestic express company ANC, và đổi tên thành FedEx UK vào năm 2007.\r\n\r\n·   Năm 2008, FedEx kỷ niệm 35 năm thành lập và hiện nay trở thành công ty vận chuyển nhanh lớn nhất thế giới với 672 may bay và 44,500 xe chuyên dụng.\r\n\r\nNHỮNG ĐIỀU CÓ THỂ BẠN CHƯA BIẾT VỀ THƯƠNG HIỆU FEDEX EXPRESS\r\n\r\n·   Tháng 5-2008, FedEx Express hợp tác cùng Heart to Heart International, chuyển 31 tấn hàng cứu trợ, trị giá 1,5 triệu USD, tới tỉnh Tứ Xuyên, Trung Quốc vừa bị tàn phá nặng nề bởi cơn động đất gần 8.0 độ Richter.\r\n\r\n·   Vào năm 2006, FedEx Express đã vận chuyển 1 mảnh xác tàu Titanic nặng 3000 pound từ Milan, Italia đến Atlanta, Mỹ. \r\n\r\n·   FedEx Express nổi tiếng với việc vận chuyển nhiều món hàng “độc”; từ gấu trúc, chim cánh cụt đến xe đua và thậm chí cả cối xay gió.\r\n\r\nTheo VnBrand\r\n', 'FexEd Express - Luôn tạo ra sự trải nghiệm khác biệt', '', 'inherit', 'open', 'open', '', '800-revision-2', '', '', '2012-07-22 15:16:15', '2012-07-22 08:16:15', '', 800, 'http://www.vnestore.com/aa/800-revision-2/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(800, 1, '2012-07-22 15:16:15', '2012-07-22 08:16:15', 'Là 1 công ty chuyển phát nhanh lớn nhất thế giới, FedEx Express đã thiết lập 1 mạng lưới vận chuyển hàng không và trên đất liền toàn cầu nhằm cung cấp việc vận chuyển nhanh và đáng tin cậy đến hơn 220 quốc gia và vùng lãnh thổ trên toàn thế giới. Tất cả 143,000 nhân viên của FedEx Express đều cùng thực hiện lời cam kết: “Luôn tạo ra sự trải nghiệm khác biệt…”\r\nTHỊ TRƯỜNG\r\n\r\nMặc dầu những điều kiện kinh tế toàn cầu đầy thách thức không ngừng gia tăng, FedEx Express vẫn liên tục đạt đươc những kết quả kinh doanh khả quan, đạt doanh thu 1,740 triệu USD trong năm tài chính 2007/08, tăng 8% so với cùng kỳ năm trước. Từ chính những kết quả trên cho thấy FedEx Express đã hưởng nhiều lợi ích từ việc phát triển mạnh mẽ, liên tục của ngành kinh doanh chuyển phát nhanh quốc tế và từ chính sự đầu tư để mở rộng thị phần cung cấp thêm nhiều dịch vụ khác nhằm gia tăng công suất và doanh thu của họ.\r\n\r\nTHÀNH TỰU ĐẠT ĐƯỢC\r\n\r\nVào năm 2008, FedEx Express đã tổ chức lễ kỷ niệm 35 năm thành lập.Được thành lập vào năm 1973, FedEx Express là một sản phẩm trí tuệ của người thành lập ra nó, Frederick Smith người hiện thời vừa là chủ tịch, giám đốc, và CEO và là người đã được xem là "nhân vật ấn tượng nhất của năm”.\r\n\r\nFedEx Express xuất phát từ những lá thư chuyển qua đêm, và là công ty chuyển phát nhanh đầu tiên xúc tiến cung cấp việc vận chuyển đóng gói thâu đêm và giao nhận trước 10h-am hôm sau, FedEx Express cũng là công ty đầu tiên đưa ra dịch vụ chuyển hàng theo giờ xác định và cam kết hoàn trả hoặc vận chuyển lại miễn phí. Vào năm 1983, FedEx Express đã tạo nên lịch sử trong ngành kinh doanh khi trở thành công ty Mỹ đẩu tiên đạt được cột mốc doanh thu 1 tỷ USD sau 10 năm thành lâp mà không thông qua viêc tiếp nhận hay sát nhập với công ty khác.\r\n\r\nNhững thành quả xuất sắc này đã giúp FedEx Express được nhận rất nhiều giải thưởng và danh hiệu. Năm 1990 FedEx Express đã trở thành công ty  đẩu tiên đạt đươc Giải Thưởng Chất Lượng Quốc Gia Malcolm Baldrige trong lĩnh vực dịch vụ, chứng nhận ISO 9001 cho tất cả các lĩnh vực kinh doanh trên toàn cầu vào năm 1994,trở thành công ty chuyển phát nhanh toàn cầu đầu tiên nhận được chứng nhận này trên toàn hệ thống cùng một thời điểm.\r\n\r\nNăm 2008, FedEx Express được tạp chí Fortune xếp thứ 6 trong danh sách những công ty nổi bật và đứng đầu về lĩnh vực dịch vụ khách hàng qua cuộc khảo sát của Harris Interactive Reputation Quotient\r\n\r\nCác sản phẩm  của FedEx Express bao gồm dịch vụ vận chuyển quốc tế theo đơn hàng tận nhà, theo thời gian xác định và cả các gói hàng đòi hỏi tính cấp bách, quà tặng gấp, các thiết bị phục vụ khoa học dễ vỡ, hàng hoá cồng kềnh và có tính nguy hiểm.Mỗi gói hàng được chuyển đi được FedEx Express kiểm tra trung bình 17 lần/chuyến nhằm đảm bảo rằng khách hàng có thể dễ dàng theo dõi vị trí chính xác của từng gói hàng thông qua kiểm tra Email, truy  cập Internet, hoặc gọi điện trực tiếp 24h/ngày. FedEx Express luôn xem việc vận chuyển mỗi gói hàng như thê là chỉ có duy nhất 1 gói hàng đó được vận chuyển trong ngày.\r\n\r\n\r\n\r\nNgoài những gói sản phẩm dịch vụ đã được FedEx Express triển khai trên toàn cầu, chi nhánh FedEx Express ở Vương Quốc Anh còn cung cấp dịch vụ vận chuyển trong nước với nhiều sự lựa chọn bao gồm: dịch vụ vận chuyển theo thời gian định sẵn, qua ngày hôm sau hay ngày Thứ 7 cuối tuần. Tất cả những dịch vụ trên đều được hỗ trợ miễn phí bằng nhiều dịch vụ có tính tự động hóa cao và dễ sử dụng nhằm giúp khách hàng dễ dàng nhận hàng hoặc theo dõi các gói hàng vận chuyển thông qua mang Internet.\r\n\r\nCHIẾN DỊCH QUẢNG CÁO\r\n\r\nNăm 2006, FedEx Express đã  mua lại công ty ANC Holdings, hiện nay đã đổi tên thành FedEx Express UK, là một công ty quản lý 1 mạng lưới hơn 2000 xe chuyên dụng và sở hữu 1,5 feet vuông măt bằng kinh doanh xuyên suốt vương quốc Anh, tuyển dụng hơn 4000 nhân viên nhiều kinh nghiêm cùng các nhà thầu phụ. Việc tiếp nhận ANC đã giúp cho FedEx cung cấp đầy đủ các dịch vụ vẩn chuyển cả trên thị trường quốc tế lẫn nội địa. Tháng 10-2008, FedEx Express đẩy mạnh dịch vụ vận chuyển “next-business-day” (vận chuyển trong ngày cuối tuần) đến vùng lãnh hải phía Đông nước Mỹ bằng cách thiết lập 1 đường bay mới hướng Tây, xuyên Đại Tây Dương giữa Paris và Neward. Chính vì điều này đã giúp cho khách hàng ở Vương Quốc Anh và trên toàn châu Âu hiện nay có thể lựa chọn thời gian nhận hàng trễ hơn mà vẫn đảm bảo việc vận chuyển trong ngày kế tiếp.\r\n\r\nTháng 11-2007, FedEx Express đã tung ra chiến dịch quảng cáo "Behind the Scenes" với 9 loại ngôn ngữ, triển khai ở 13 quốc gia, bằng các phương tiện truyền thông như sách báo, tạp chí và cả truyền thông kỹ thuật số…Mục tiêu chủ yếu của chiến dịch này là tạo dựng thương hiệu hàng đầu trong thị trường chuyển phát nhanh toàn cầu bằng cách đẩy mạnh sự nhận biết thương hiệu, danh tiếng của công ty, và giá trị cốt lõi bền vững của FedEx trên toàn cầu.\r\n\r\nChiến dịch này được xây dựng là minh chứng cho những những nỗ lực của công ty FedEx để đạt được mục tiêu trên toàn cầu. Tất cả các chương trình quảng cáo qua mạng hay qua báo chí đều hướng độc giả truy cập vào trang Web www.experience.FedEx.com để cung cấp sự nhìn nhận vĩ mô về những thông tin và thị trường toàn cầu nhằm giúp các nhà kinh doanh có thể tiếp cận được các cơ hội kinh doanh toàn cầu. Về tổng thể, chiến dịch đã tạo sức hút đến hơn 1,9 tỷ truy cập và đươc trao giải thưởng “Web Marketing Association’s 2008 WebAward” cho website thương mại toàn cẩu xuất sắc nhất.\r\n\r\nGIÁ TRÍ THƯƠNG HIỆU\r\n\r\nChiến lươc của FedEx,mà toàn bộ nhân viên của công ty khắc ghi như “Sự cam kết trọn đời”đó là : “Luôn tạo ra sự trải nghiệm khác biệt …”. “Sự cam kết trọn đời” này là một chiến lược lâu dài giúp cho FedEx phát triển hơn nữa các mối quan hệ bền vững với khách hàng. Mục tiêu của công ty hướng đến là : nâng cao giá trị con người và sự thịnh vượng, đưa ra các dịch vụ mà luôn xem khách hàng là trọng tâm, đầu tư công nghệ kỹ thuật và dịch vụ nhằm tăng năng suất làm việc và đời sống của nhân viên, quản trị hoạt động kinh doanh, tài chính và dịch vụ bằng sự trung thực, hiệu quả và tin cậy, môi trường làm việc an toàn và lành mạnh, và đạt được sự tin tưởng và tôn trọng từ mỗi nhân viên, khách hàng và nhà đẩu tư.\r\n\r\n\r\n\r\nFedEx và các cột mốc\r\n\r\n·   Năm 1971, Frederick W Smith đã  quản lý ở Arkansas Aviation Sales và nhanh chóng nhận ra những khó khăn trong việc đóng gói vận chuyển hàng, ý tưởng thành lập FedEx xuất phát từ đây.\r\n\r\n·   Năm 1973, Federal Express chính thức bắt đầu hoạt động với 14 máy bay chuyên chở loại nhỏ xuất phát từ phi trường quốc tế Memphis, Họ đã vận chuyển được 186 kiện hàng đến 25 thành phố trong ngày đầu tiên.\r\n\r\n·   Năm 1977, sự bãi bõ quy định về chuyên chở bằng đường hàng không  cho phép sử dụng các máy bay chuyên chở loai lớn như Boeing 727s và McDonnell-Douglas DC-10s đã giúp Federal Express phát triển nhanh chóng.\r\n\r\n·   Năm 1984,khai trương dịch vụ vận chuyển xuyên luc địa đến Châu Âu và Châu Á,trong năm tiếp theo đã thiết lập lịch bay định kỳ đầu tiên đến Châu Âu.\r\n\r\n·   Năm 1989, với việc tiếp nhận Flying Tiger Network, FedEx Express đã trở thành công ty vận chuyển hàng không đa dịch vụ lớn nhất.\r\n\r\n·   Năm 1994, Federal Express chính thức công bố FedEx là tên thương hiêu đầu tiên của công ty,dựa trên gợi ý của khách hàng cho một cái tên ngắn gọn hơn.\r\n\r\n·   Năm 1995, Federal Express trở thành công ty Mỹ duy nhất được quyền cung cấp dịch vụ vận chuyển bằng đường hàng không đến Trung Quốc.\r\n\r\n·   Năm 2000, đổi tên thành FedEx Express để phản ánh vị trí của nó với tổng thể thị phần dịch vụ của FedEx Corporation.\r\n\r\n·  Năm 2006, FedEx đẩy mạnh khả năng cung cấp dịch vụ bằng việc tiếp nhận UK domestic express company ANC, và đổi tên thành FedEx UK vào năm 2007.\r\n\r\n·   Năm 2008, FedEx kỷ niệm 35 năm thành lập và hiện nay trở thành công ty vận chuyển nhanh lớn nhất thế giới với 672 may bay và 44,500 xe chuyên dụng.\r\n\r\nNHỮNG ĐIỀU CÓ THỂ BẠN CHƯA BIẾT VỀ THƯƠNG HIỆU FEDEX EXPRESS\r\n\r\n·   Tháng 5-2008, FedEx Express hợp tác cùng Heart to Heart International, chuyển 31 tấn hàng cứu trợ, trị giá 1,5 triệu USD, tới tỉnh Tứ Xuyên, Trung Quốc vừa bị tàn phá nặng nề bởi cơn động đất gần 8.0 độ Richter.\r\n\r\n·   Vào năm 2006, FedEx Express đã vận chuyển 1 mảnh xác tàu Titanic nặng 3000 pound từ Milan, Italia đến Atlanta, Mỹ. \r\n\r\n·   FedEx Express nổi tiếng với việc vận chuyển nhiều món hàng “độc”; từ gấu trúc, chim cánh cụt đến xe đua và thậm chí cả cối xay gió.\r\n\r\nTheo VnBrand\r\n', 'FexEd Express - Luôn tạo ra sự trải nghiệm khác biệt', '', 'trash', 'open', 'open', '', 'fexed-express-luon-tao-ra-su-trai-nghiem-khac-biet', '', '', '2012-09-08 13:33:27', '2012-09-08 06:33:27', '', 0, 'http://localhost/aaexpress/?p=800', 0, 'post', '', 0);
INSERT INTO `dev_posts` VALUES(913, 4, '2012-08-24 21:30:07', '2012-08-24 14:30:07', '<span><span style="color: #ff0000;"><strong>Câu hỏi 1.</strong></span> Mức bồi thường căn cứ trên cơ sở nào?</span>\r\n\r\nTheo quy định của <span style="color: #0000ff;"><strong>CÔNG TY CP TM - DV TIẾP VẬN TOÀN CẦU A&amp;A</strong></span>, quyền lợi của Khách hàng luôn đượ<span style="color: #000000;">c <span style="color: #0000ff;"><strong>CÔNG TY CP TM - DV TIẾP VẬN TOÀN CẦU A&amp;A</strong></span> đả</span>m bảo.\r\n\r\n<span style="color: #993300;"><strong>\r\n<span style="color: #ff0000;">Câu hỏi 2.</span></strong></span> Thời hạn khiếu nại được tính như thế nào?\r\n\r\nThời hạn giải quyết khiếu nại đối với dịch vụ <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thoả thuận trong nước là 3 tháng, đối với dịch vụ AA Express quốc tế là 4 tháng kể ngày sau ngày kết thúc chỉ tiêu thời gian toàn trình đã công bố.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 3</span></strong><span style="color: #ff0000;">.</span></span> Mức bảo hiểm được tính như thế nào nếu sử dụng dịch vụ khai giá?\r\n\r\nĐối với dịch vụ <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thoả thuận trong nước khách hàng được bảo hiểm theo giá trị đã khai và các khoản cước trừ cước khai giá. Giá trị đã khai không vược quá giá trị thực tế và mức tối đa cho phép.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 4.</span></strong></span> Khách hàng có thể dùng phương thức thanh toán nào khi gửi tài liệu, hàng hóa tại <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span>?\r\n\r\nKhách hàng có thể thanh toán ngay hoặc thanh toán theo định kỳ (hàng tháng) và chọn lựa các phương thức thanh toán như: tiền mặt, chuyển khoản.\r\n\r\nChúng tôi sẵn sàng ký hợp đồng cung cấp dịch vụ với quý Khách hàng là các doanh nghiệp để quý Khách hàng có thể chọn lựa phương thức thanh toán thuận tiện nhất.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 5.</span></strong></span> Khách hàng có thể biết được tình trạng của bưu gửi trong thời gian chuyển phát không?\r\n\r\nHiện nay, chúng tôi đã có mạng định vị bưu gửi cho dịch vụ chuyển phát nhanh <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thỏa thuận trong nước và một số dịch vụ chuyển phát nhanh quốc tế.\r\n\r\nQuý khách hàng có thể kiểm tra và xác định lộ trình, tình trạng của bưu gửi theo mã số của bưu gửi. Với mạng định vị này, quy khách hàng hoàn toàn yên tâm vì bưu gửi luôn trong tầm tay mình.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 6.</span></strong></span><span style="color: #ff0000;"> </span>Khi nhận/gửi bưu phẩm, hàng hóa trong nước và nước ngoài tại <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span>, khách hàng được hỗ trợ những gì?\r\n\r\nTại Công ty Cổ phần <span style="color: #0000ff;">TM - DV Tiếp Vận Toàn Cầu A&amp;A</span>, Quý Khách hàng sẽ được phục vụ theo một cung cách hiện đại nhất. Bưu gửi của khách hàng sẽ được nhận và phát tận nơi trong thời gian nhanh nhất dựa trên chỉ tiêu thời gian đã công bố.\r\n\r\nNgoài ra, hàng hóa xuất, nhập khẩu sẽ được <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span> thay mặt khách hàng hoàn tất thủ tục hải quan và các thủ tục kiểm dịch, kiểm tra văn hóa phẩm xuất, nhập khẩu.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 7.</span></strong></span> Địa bàn cung cấp dịch vụ của <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span> đến các tỉnh, khu vực, quốc gia nào?\r\n\r\nHiện nay, dịch vụ <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thoả thuận trong nước phục vụ đến 64 tỉnh thành phố trong cả nước, <span style="color: #0000ff;">AA Express</span> quốc tế phục vụ đến 48 quốc gia trong Liên minh Bưu chính thế giới.\r\n\r\nNgoài ra, các dịch vụ hợp tác với các công ty chuyển phát nhanh toàn cầu lớn nhất thế giới có mặt tại  hơn 200 quốc gia.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 8.</span></strong></span> Những ưu điểm của các dịch vụ mà <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span> cung cấp so với các dịch vụ khác?\r\n\r\nDịch vụ chuyển phát nhanh trong nước và quốc tế có thể đáp ứng mọi nhu cầu của khách hàng về chất lượng dịch vụ, thời gian vận chuyển với giá cả hợp lý theo từng loại hình dịch vụ mà Công ty đang cung cấp cho thị trường hiện nay.\r\n\r\nChúng tôi cam kết dành cho Quý Khách hàng sự thuận tiện và hiệu quả nhất và là trợ thủ đắc lực nhất của quý Khách hàng trong các giải pháp kinh doanh.', 'Câu hỏi thường gặp', '', 'inherit', 'open', 'open', '', '805-revision-11', '', '', '2012-08-24 21:30:07', '2012-08-24 14:30:07', '', 805, 'http://www.vnestore.com/aa/805-revision-11/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(805, 1, '2012-07-23 22:00:04', '2012-07-23 15:00:04', '<span><span style="color: #ff0000;"><strong>Câu hỏi 1.</strong></span> Mức bồi thường căn cứ trên cơ sở nào?</span>\r\n\r\nTheo quy định của <span style="color: #0000ff;"><strong>CÔNG TY CP TM - DV TIẾP VẬN TOÀN CẦU A&amp;A</strong></span>, quyền lợi của Khách hàng luôn đượ<span style="color: #000000;">c <span style="color: #0000ff;"><strong>CÔNG TY CP TM - DV TIẾP VẬN TOÀN CẦU A&amp;A</strong></span> đả</span>m bảo.\r\n\r\n<span style="color: #993300;"><strong>\r\n<span style="color: #ff0000;">Câu hỏi 2.</span></strong></span> Thời hạn khiếu nại được tính như thế nào?\r\n\r\nThời hạn giải quyết khiếu nại đối với dịch vụ <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thoả thuận trong nước là 3 tháng, đối với dịch vụ AA Express quốc tế là 4 tháng kể ngày sau ngày kết thúc chỉ tiêu thời gian toàn trình đã công bố.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 3</span></strong><span style="color: #ff0000;">.</span></span> Mức bảo hiểm được tính như thế nào nếu sử dụng dịch vụ khai giá?\r\n\r\nĐối với dịch vụ <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thoả thuận trong nước khách hàng được bảo hiểm theo giá trị đã khai và các khoản cước trừ cước khai giá. Giá trị đã khai không vược quá giá trị thực tế và mức tối đa cho phép.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 4.</span></strong></span> Khách hàng có thể dùng phương thức thanh toán nào khi gửi tài liệu, hàng hóa tại <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span>?\r\n\r\nKhách hàng có thể thanh toán ngay hoặc thanh toán theo định kỳ (hàng tháng) và chọn lựa các phương thức thanh toán như: tiền mặt, chuyển khoản.\r\n\r\nChúng tôi sẵn sàng ký hợp đồng cung cấp dịch vụ với quý Khách hàng là các doanh nghiệp để quý Khách hàng có thể chọn lựa phương thức thanh toán thuận tiện nhất.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 5.</span></strong></span> Khách hàng có thể biết được tình trạng của bưu gửi trong thời gian chuyển phát không?\r\n\r\nHiện nay, chúng tôi đã có mạng định vị bưu gửi cho dịch vụ chuyển phát nhanh <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thỏa thuận trong nước và một số dịch vụ chuyển phát nhanh quốc tế.\r\n\r\nQuý khách hàng có thể kiểm tra và xác định lộ trình, tình trạng của bưu gửi theo mã số của bưu gửi. Với mạng định vị này, quy khách hàng hoàn toàn yên tâm vì bưu gửi luôn trong tầm tay mình.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 6.</span></strong></span><span style="color: #ff0000;"> </span>Khi nhận/gửi bưu phẩm, hàng hóa trong nước và nước ngoài tại <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span>, khách hàng được hỗ trợ những gì?\r\n\r\nTại Công ty Cổ phần <span style="color: #0000ff;">TM - DV Tiếp Vận Toàn Cầu A&amp;A</span>, Quý Khách hàng sẽ được phục vụ theo một cung cách hiện đại nhất. Bưu gửi của khách hàng sẽ được nhận và phát tận nơi trong thời gian nhanh nhất dựa trên chỉ tiêu thời gian đã công bố.\r\n\r\nNgoài ra, hàng hóa xuất, nhập khẩu sẽ được <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span> thay mặt khách hàng hoàn tất thủ tục hải quan và các thủ tục kiểm dịch, kiểm tra văn hóa phẩm xuất, nhập khẩu.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 7.</span></strong></span> Địa bàn cung cấp dịch vụ của <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span> đến các tỉnh, khu vực, quốc gia nào?\r\n\r\nHiện nay, dịch vụ <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thoả thuận trong nước phục vụ đến 64 tỉnh thành phố trong cả nước, <span style="color: #0000ff;">AA Express</span> quốc tế phục vụ đến 48 quốc gia trong Liên minh Bưu chính thế giới.\r\n\r\nNgoài ra, các dịch vụ hợp tác với các công ty chuyển phát nhanh toàn cầu lớn nhất thế giới có mặt tại  hơn 200 quốc gia.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 8.</span></strong></span> Những ưu điểm của các dịch vụ mà <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span> cung cấp so với các dịch vụ khác?\r\n\r\nDịch vụ chuyển phát nhanh trong nước và quốc tế có thể đáp ứng mọi nhu cầu của khách hàng về chất lượng dịch vụ, thời gian vận chuyển với giá cả hợp lý theo từng loại hình dịch vụ mà Công ty đang cung cấp cho thị trường hiện nay.\r\n\r\nChúng tôi cam kết dành cho Quý Khách hàng sự thuận tiện và hiệu quả nhất và là trợ thủ đắc lực nhất của quý Khách hàng trong các giải pháp kinh doanh.', 'Câu hỏi thường gặp', '', 'draft', 'open', 'open', '', 'aa-express-cau-hoi-thuong-gap', '', '', '2012-09-17 17:51:23', '2012-09-17 10:51:23', '', 0, 'http://localhost/aaexpress/?page_id=805', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(914, 4, '2012-08-30 23:12:19', '2012-08-30 16:12:19', '<object width="570" height="230" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"><param name="wmode" value="opaque"><param name="quality" value="high" /><param name="src" value="http://www.vnestore.com/aa/wp-content/themes/easel/images/HomeBanner.swf" /><param name="pluginspage" value="http://www.macromedia.com/go/getflashplayer" /><embed width="570" height="230" type="application/x-shockwave-flash" src="http://www.vnestore.com/aa/wp-content/themes/easel/images/HomeBanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" /> </object>\r\n\r\n&nbsp;\r\n\r\n<span style="font-size: 17px; color: #a8040a;">Chào mừng bạn đến với A&amp;A Express</span>\r\n\r\n<strong><span style="color: #a8040a;">AA Express</span></strong> là công ty hàng đầu trong lĩnh vực chuyển phát nhanh tài liệu, hàng hóa trong nước và Quốc tế. Nhận từ tay người gửi, phát đến tay người nhận trong thời gian <span style="color: #008000;"><strong>NGẮN NHẤT</strong></span>, đảm bảo tuyệt đối <span style="color: #008000;"><strong>AN TOÀN</strong>,<strong>HIỆU QUẢ</strong></span>.\r\n\r\nVới đội ngũ nhân viên chuyên nghiệp và năng động, <span style="color: #a8040a;"><strong>AA Express</strong></span> luôn phấn đấu nỗ lực vì lợi ích khách hàng. Hiện nay công ty chúng tôi vẫn và đang hoàn thiện mở rộng quy mô phục vụ và đa dạng hóa các loại hình dịch vụ nhằm đảm bảo chất lượng phục vụ cho mọi khách hàng.\r\n\r\n<strong><span style="color: #a8040a;">AA Express</span></strong> sẵn sàng đáp ứng với các phương thức:\r\n<ul>\r\n	<li>Giao nhận hàng tại địa chỉ quý khách</li>\r\n	<li>Không giới hạn về số lượng, trọng lượng.</li>\r\n	<li>Khai thác, quản lý, vận chuyển hàng hóa, tài liệu.</li>\r\n	<li>24/24 trong ngày đến hơn 60 tỉnh thành phố trong cả nước và hơn 200 quốc gia trên thế giới.</li>\r\n</ul>\r\n<strong>Đặc biệt</strong>:\r\n<ul>\r\n	<li>Tra cứu thông tin bưu phẩm thông qua website.</li>\r\n	<li>Tra cứu trọng lượng gói bưu phẩm muốn vận chuyển.</li>\r\n</ul>\r\n&nbsp;\r\n<table width="100%" border="0" cellspacing="5" cellpadding="5">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vcduongbo.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vchangkhong.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vcduongthuy.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/dvdienhoa.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n</tr>\r\n<tr>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nĐƯỜNG BỘ</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nHÀNG KHÔNG</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nĐƯỜNG THỦY</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>DỊCH VỤ\r\nĐIỆN HOA</strong></span></a></span></td>\r\n</tr>\r\n<tr>\r\n<td colspan="4"></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Trang chủ', '', 'inherit', 'open', 'open', '', '807-revision-2', '', '', '2012-08-30 23:12:19', '2012-08-30 16:12:19', '', 807, 'http://www.vnestore.com/aa/807-revision-2/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(807, 1, '2012-07-23 23:29:03', '2012-07-23 16:29:03', '<object width="570" height="230" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"><param name="wmode" value="opaque"><param name="quality" value="high" /><param name="src" value="http://www.vnestore.com/aa/wp-content/themes/easel/images/HomeBanner.swf" /><param name="pluginspage" value="http://www.macromedia.com/go/getflashplayer" /><embed width="570" height="230" type="application/x-shockwave-flash" src="http://www.vnestore.com/aa/wp-content/themes/easel/images/HomeBanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" /> </object>\r\n\r\n&nbsp;\r\n\r\n<span style="font-size: 17px; color: #a8040a;">Chào mừng bạn đến với A&amp;A Express</span>\r\n\r\n<strong><span style="color: #a8040a;">AA Express</span></strong> là công ty hàng đầu trong lĩnh vực chuyển phát nhanh tài liệu, hàng hóa trong nước và Quốc tế. Nhận từ tay người gửi, phát đến tay người nhận trong thời gian <span style="color: #008000;"><strong>NGẮN NHẤT</strong></span>, đảm bảo tuyệt đối <span style="color: #008000;"><strong>AN TOÀN</strong>,<strong>HIỆU QUẢ</strong></span>.\r\n\r\nVới đội ngũ nhân viên chuyên nghiệp và năng động, <span style="color: #a8040a;"><strong>AA Express</strong></span> luôn phấn đấu nỗ lực vì lợi ích khách hàng. Hiện nay công ty chúng tôi vẫn và đang hoàn thiện mở rộng quy mô phục vụ và đa dạng hóa các loại hình dịch vụ nhằm đảm bảo chất lượng phục vụ cho mọi khách hàng.\r\n\r\n<strong><span style="color: #a8040a;">AA Express</span></strong> sẵn sàng đáp ứng với các phương thức:\r\n<ul>\r\n	<li>Giao nhận hàng tại địa chỉ quý khách</li>\r\n	<li>Không giới hạn về số lượng, trọng lượng.</li>\r\n	<li>Khai thác, quản lý, vận chuyển hàng hóa, tài liệu.</li>\r\n	<li>24/24 trong ngày đến hơn 60 tỉnh thành phố trong cả nước và hơn 200 quốc gia trên thế giới.</li>\r\n</ul>\r\n<strong>Đặc biệt</strong>:\r\n<ul>\r\n	<li>Tra cứu thông tin bưu phẩm thông qua website.</li>\r\n	<li>Tra cứu trọng lượng gói bưu phẩm muốn vận chuyển.</li>\r\n</ul>\r\n&nbsp;\r\n<table width="100%" border="0" cellspacing="5" cellpadding="5">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vcduongbo.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vchangkhong.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vcduongthuy.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/dvdienhoa.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n</tr>\r\n<tr>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nĐƯỜNG BỘ</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nHÀNG KHÔNG</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nĐƯỜNG THỦY</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>DỊCH VỤ\r\nĐIỆN HOA</strong></span></a></span></td>\r\n</tr>\r\n<tr>\r\n<td colspan="4"></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Trang chủ', '', 'draft', 'open', 'open', '', 'trang-chu', '', '', '2012-09-17 17:51:53', '2012-09-17 10:51:53', '', 0, 'http://localhost/aaexpress/?page_id=807', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(809, 1, '2012-07-23 23:31:28', '2012-07-23 16:31:28', ' ', '', '', 'publish', 'open', 'open', '', '809', '', '', '2012-09-06 23:33:51', '2012-09-06 16:33:51', '', 0, 'http://localhost/aaexpress/?p=809', 1, 'nav_menu_item', '', 0);
INSERT INTO `dev_posts` VALUES(937, 1, '2012-09-08 13:33:27', '2012-09-08 06:33:27', 'I. Vật cấm gửi.\r\n1)      Các chất ma túy và chất kích thích thần kinh.\r\n2)      Vũ khí đạn dược, trang thiết bị kỹ thuật quân sự.\r\n3)      Các loại văn hóa phẩm đồi trụy, phản động; ấn phẩm, tài liệu nhằm phá hoại trật tực ông cộng chống lại Nhà nước Cộng hòa Xã hội Chủ nghĩa Việt Nam.\r\n4)      Vật hoặc chất dễ nổ, dễ cháy và các chất gây nguy hiểm hoặc làm mất vệ sinh, gây ô nhiễm môi trường.\r\n5)      Các loại vật phẩm hàng hóa mà nhà nước cấm lưu thông, cấm kinh doanh, cấm xuất khẩu, nhập khẩu.\r\n6)      Sinh vật sống.\r\n7)      Vật phẩm, ấn phẩm, hàng hóa cấm nhập vào nước nhận.\r\n8)      Tiền Việt Nam, tiền nước ngoài và các giấy tờ có giá trị như tiền.\r\n9)      Các loại kim khí quý (vàng, bạc, bạch kim…), các loại đá quí hay các sản phẩm khác được chế biến từ kim khí quí, đá quí.\r\n10)  Bưu gửi chứa nhiều bưu gửi, gửi cho nhiều địa chỉ nhận khác nhau.\r\nII. Vật gửi có điều kiện\r\n1)      Bưu gửi có hàng hóa để kinh doanh phải có chứng từ thuế theo qui định của phápluật.\r\n2)      Vật phẩm, hàng hóa xuất khẩu, nhập khẩu thuộc quản lý chuyên ngành phải thực hiện theo qui định của cơ quan quản lý chuyên ngành có thẩm quyền và theo thông báo của Hiệp hội AA-EXPRESS.\r\n3)      Vật phẩm hàng hóa dễ hư hỏng, chất lỏng, chất bột đóng gói phải đảm bảo không gây hư hỏng, ô nhiễm bưu gửi khác.\r\n4)      Vật phẩm hàng hóa gửi trong bưu gửi AA-EXPRESS vận chuyển qua đường hàng không phải tuân theo những qui định về an ninh hàng không.\r\nIII. Điều kiện nhận gửi bưu gửi đi Quốc tế\r\n Ngoài những qui định đối với bưu gửi trong nước, bưu gửi đi quốc tế phải tuân thủ các qui định sau:\r\n1)     Vật gửi trong bưu gửi phải thực hiện các qui định về xuất khẩu của nhà nước và điều kiện nhập khẩu vào các nước nhận (căn cứ qui định về hàng hóa và vật phẩm cấm nhập và nhập có điều kiện vào các nước. Danh mục hàng cấm gửi và gửi đến các nước như sau:\r\n2)      Bưu gửi có vật phẩm, hàng hóa phải qua thủ tục kiểm tra hải quan và phải nộp thuếvà lệ phí Hải quan theo các qui định hiện hành.\r\n3)      Doanh nghiệp cung cấp dịch vụ tổ chức nhận bưu gửi đi quốc tế phải đảm bảo thuận tiện cho người sử dụng dịch vụ và phảit uân theo những qui định trong thông tư và các văn bản hiện hành của cơ quan chức năng có liên quan.\r\n\r\nDANH SÁCH VẬT CẤM GỬI VÀ GỬI CÓ ĐIỀU KIỆN ĐẾN CÁC NƯỚC \r\nSTT	Nước đến	 	STT	Nước đến	 	STT	Nước đến\r\n1	Albania	 	36	Estonia	 	71	Norway\r\n2	Algeria	 	37	Ethiopia	 	72	Pakistan\r\n3	Angola	 	38	Finland	 	73	Panama\r\n3	Argentina	 	39	France (Pháp)	 	74	Paraguay\r\n5	Armenia	 	40	Georgia	 	75	Peru\r\n6	Autralia	 	41	Germany (Đức)	 	76	Philippines\r\n7	Autra	 	42	Ghana	 	77	Poland\r\n8	Bangladsh	 	43	Greece	 	78	Portugal\r\n9	Barbados	 	44	Guam	 	79	Qatar\r\n10	Belarus	 	45	Guatemala	 	80	Romania\r\n11	Belgium	 	46	Hong Kong	 	81	Russia ( Nga)\r\n12	Belize	 	47	Hungary	 	82	Saudi Arabia\r\n13	Bermura	 	48	India (Ấn Độ)	 	83	Senegal\r\n14	Bosnia – Hezegovina	 	49	Indonesia	 	84	Singapore\r\n15	Barzil	 	50	Ireland	 	85	Slovakia\r\n16	British virgin islands	 	51	Israel	 	86	Slovenia\r\n17	Brunei	 	52	Italy ( Ý)	 	87	South Africa\r\n18	Bulgaria	 	53	Jamaica	 	88	South Korea (Hàn Quốc)\r\n19	Cambodia (Cam Pu Chia)	 	54	Japan (Nhật bản)	 	89	Spain\r\n20	Cameroon	 	55	Luwait	 	90	Sri Lanka\r\n21	Canada	 	56	Laos (Lào)	 	91	Sweden (Thụy Điển)\r\n22	Cayman Islands	 	57	Latvia	 	92	Switzealand (Thụy Sỹ)\r\n23	Chile	 	58	Libya	 	93	Syria\r\n24	China (Trung Quốc)	 	59	Luxembourg	 	94	Taiwan (Đài Loan)\r\n25	Colombia	 	60	Macau	 	95	Thailand (Thái Lan)\r\n26	Cook Islands (Đảo Cook)	 	61	Malaysia	 	96	Turkey (Thổ Nhĩ Kỳ)\r\n27	Costarica	 	62	Mauritus	 	97	UAE\r\n28	Cote D’voire (Ivory Coast)	 	63	Mexico (Mê hi cô)	 	98	Ukraine\r\n29	Croatia	 	64	Monaco	 	99	Unitted Kingdom (Anh Quốc)\r\n30	Cyprus 	 	65	Morocco	 	100	Uruguay\r\n31	Czech Republic (CH Séc)	 	66	Mozambique	 	101	USA (Mỹ)\r\n32	East Timor	 	67	Myamar	 	102	Venezuela \r\n33	Ecuador	 	68	Netherlands	 	 	 \r\n34	Egypt	 	69	Newzealands	 	 	 \r\n35	Estonia	 	70	Nigeria	 	 	 \r\n\r\n', 'Vật cấm gửi và gửi có điều kiện', '', 'inherit', 'open', 'open', '', '781-revision', '', '', '2012-09-08 13:33:27', '2012-09-08 06:33:27', '', 781, 'http://www.vnestore.com/aa/781-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(930, 1, '2012-09-08 13:33:26', '2012-09-08 06:33:26', '<table width="100%" border="0" cellspacing="1" cellpadding="1">\r\n<tbody>\r\n<tr>\r\n<td></td>\r\n<td valign="top"></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"><strong>Đây sẽ phần giới thiệu ...</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Giới thiệu', '', 'inherit', 'open', 'open', '', '812-revision', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 812, 'http://www.vnestore.com/aa/812-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(931, 1, '2012-09-08 13:33:27', '2012-09-08 06:33:27', '[STORE-LOCATOR]', 'Mạng lưới dịch vụ', '', 'inherit', 'open', 'open', '', '762-revision', '', '', '2012-09-08 13:33:27', '2012-09-08 06:33:27', '', 762, 'http://www.vnestore.com/aa/762-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(932, 1, '2012-09-08 13:33:27', '2012-09-08 06:33:27', '1. Điều kiện chấp nhận khiếu nai bưu gửi AA-Express\r\n\r\n- Thời hạn chấp nhận khiếu nại đốivới bưu gửi trong nước là 3 tháng và bưu gửi quốc tế là 4 tháng kể từ  ngày sau ngày kết thúc chỉ tiêu thời gian toàn trình đã công bố.\r\n\r\n- Chỉ chấp nhận khiếu nại tại những bưu cục có mở dịch vụ AA-Express. \r\n\r\n- Chỉ chấp nhận khiếu nại sau khi kết thúc chỉ tiêu thời gian toàn trình\r\n\r\n2. Những trường hợp không thuộc trách nhiệm bồi thường của doanh nghiệp cung cấp dịch vụ\r\n\r\n-Trường hợp bất khả kháng vì thiên tai, địch họa hoặc những tình huống bất ngờ vượt quá khả năng khắc phục của doanh nghiệp cung cấp dịch vụ. \r\n\r\n- Bưu gửi AA-Express bị hư hỏng do người gửi gói bọc không đảm bảo nội dung bên trong. \r\n\r\n- Bưu gửi AA-Express bị phát nhầm do lỗi của người gửi. \r\n\r\n- Bưu gửi AA-Express có vật phẩm, hàng hoá bị huỷ hoại do đặc tính tự nhiên. \r\n\r\n- Bưu gửi AA-Express có vật phẩm hàng hoá vi phạm quy định về hàng cấm gửi, gửi có điều kiện của Nhà nước, bị cơ quan Nhà nước có thẩm quyền tịch thu hoặc bị huỷ theo quy định của pháp luật. \r\n\r\n- Bưu gửi AA-Express gửi đi quốc tế bị thu giữ theo luật lệ của nước nhận.. \r\n\r\n- Phần giá trị khai man, khai vượt quá giá trị thực tế của bưu gửi AA-Express khai giá . \r\n\r\n- Bưu gửi AA-Express khiếu nại quá thời hạn quy định.\r\n\r\n- Đối với bưu gửi AA-Express quốc tế có nội dung là vật phẩm hàng hoá, doanh nghiệp không phải chịu trách nhiệm đối với việc khai Hải quan của người gửi hoặc người nhận và những quyết định xử lý củaHải quan khi làm thủ tục xuất khẩu, nhập khẩu.\r\n\r\n- Doanh nghiệp cung cấp dịch vụ không phải bồi thường những thiệt hại gián tiếp hoặc những nguồn lợi không thực hiện được do việc mất, suy suyển, hư hỏng bưu gửi AA-Express gây nên. \r\n\r\n3. Nguyên tắc bồi thường \r\n\r\nDoanh nghiệp cung cấp dịch vụ chịutrách nhiệm bồi thường thiệt hại vật chất do lỗi của doanh nghiệp gây ra cho người có quyền thụ hưởng \r\n\r\n- Tiền bồi thường được trả bằngtiền Việt Nam. \r\n\r\n- Tiền bồi thường được trả cho người gửi hoặc người được người gửi uỷ quyền nhận. Trường hợp người nhận đồng ý nhận bưu phẩm AA-Express bị suy suyển hư hỏng thì người nhận được quyền nhận bồithường. \r\n\r\n- Đối với bưu gửi AA-Express gửi từ ViệtNam đi quốc tế, nếu phải bồi thường, Công ty CP CPN Bưu điện chỉ bồi thường cho người gửi hoặc người được người gửi uỷ quyền đang ở tại Việt Nam. \r\n\r\n- Đối với bưu gửi AA-Express quốc tế đến Việt Nam: việc bồi thường được thực hiện theo Điều ước quốc tế mà Công ty CPCPN Bưu điện tham gia ký kết và thoả thuận song phương giữa Bưu chính hai nước.\r\n', 'Quy định về khiếu nại bồi thường', '', 'inherit', 'open', 'open', '', '778-revision-2', '', '', '2012-09-08 13:33:27', '2012-09-08 06:33:27', '', 778, 'http://www.vnestore.com/aa/778-revision-2/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(929, 1, '2012-09-08 13:33:26', '2012-09-08 06:33:26', '<p align="justify"><strong>Xin chân thành cảm ơn Quý khách đã ghé thăm website của chúng tôi.</strong></p>\r\n<p align="justify">Quý khách đang có nhu cầu gửi hàng hoá, tài liệu nhưng chưa dự kiến được mức cước, hãy truy cập vào mục "TÍNH GIÁ", nhập TP nơi có trụ sở công ty của Quý khách, nhập tỉnh, thành phố hoăc Quôc gia cần gửi đến, nhập khối lượng và chủng loại (hàng hoá hoặc tài liệu), chúng tôi sẽ cung cấp cho Quý khách cước phí Chuyển phát nhanh hàng hoá, tài liệu trong nước, Quốc tế một cách chính xác và tiện lợi!\r\nXin chân thành cảm ơn đã ghé thăm!\r\nHẹn gặp lại quý khách lần sau</p>\r\n<p align="justify"><a href="http://localhost/aaexpress/wp-content/uploads/2012/08/Trong-Nuoc.rar">Download bảng giá trong nước</a></p>\r\n<p align="justify"><a href="http://localhost/aaexpress/wp-content/uploads/2012/08/Quoc-Te.rar">Download bảng giá quốc tế</a></p>\r\n<p align="justify"></p>', 'Download giá', '', 'inherit', 'open', 'open', '', '859-revision-2', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 859, 'http://www.vnestore.com/aa/859-revision-2/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(934, 1, '2012-09-08 13:33:27', '2012-09-08 06:33:27', '<object width="570" height="230" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"><param name="wmode" value="opaque"><param name="quality" value="high" /><param name="src" value="http://www.vnestore.com/aa/wp-content/themes/easel/images/HomeBanner.swf" /><param name="pluginspage" value="http://www.macromedia.com/go/getflashplayer" /><embed width="570" height="230" type="application/x-shockwave-flash" src="http://www.vnestore.com/aa/wp-content/themes/easel/images/HomeBanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" /> </object>\r\n\r\n&nbsp;\r\n\r\n<span style="font-size: 17px; color: #a8040a;">Chào mừng bạn đến với A&amp;A Express</span>\r\n\r\n<strong><span style="color: #a8040a;">AA Express</span></strong> là công ty hàng đầu trong lĩnh vực chuyển phát nhanh tài liệu, hàng hóa trong nước và Quốc tế. Nhận từ tay người gửi, phát đến tay người nhận trong thời gian <span style="color: #008000;"><strong>NGẮN NHẤT</strong></span>, đảm bảo tuyệt đối <span style="color: #008000;"><strong>AN TOÀN</strong>,<strong>HIỆU QUẢ</strong></span>.\r\n\r\nVới đội ngũ nhân viên chuyên nghiệp và năng động, <span style="color: #a8040a;"><strong>AA Express</strong></span> luôn phấn đấu nỗ lực vì lợi ích khách hàng. Hiện nay công ty chúng tôi vẫn và đang hoàn thiện mở rộng quy mô phục vụ và đa dạng hóa các loại hình dịch vụ nhằm đảm bảo chất lượng phục vụ cho mọi khách hàng.\r\n\r\n<strong><span style="color: #a8040a;">AA Express</span></strong> sẵn sàng đáp ứng với các phương thức:\r\n<ul>\r\n	<li>Giao nhận hàng tại địa chỉ quý khách</li>\r\n	<li>Không giới hạn về số lượng, trọng lượng.</li>\r\n	<li>Khai thác, quản lý, vận chuyển hàng hóa, tài liệu.</li>\r\n	<li>24/24 trong ngày đến hơn 60 tỉnh thành phố trong cả nước và hơn 200 quốc gia trên thế giới.</li>\r\n</ul>\r\n<strong>Đặc biệt</strong>:\r\n<ul>\r\n	<li>Tra cứu thông tin bưu phẩm thông qua website.</li>\r\n	<li>Tra cứu trọng lượng gói bưu phẩm muốn vận chuyển.</li>\r\n</ul>\r\n&nbsp;\r\n<table width="100%" border="0" cellspacing="5" cellpadding="5">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vcduongbo.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vchangkhong.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/vcduongthuy.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://www.vnestore.com/aa/wp-content/themes/easel/images/dvdienhoa.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n</tr>\r\n<tr>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nĐƯỜNG BỘ</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nHÀNG KHÔNG</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nĐƯỜNG THỦY</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://www.vnestore.com/aa/dich-vu.html"><span style="color: #0000ff;"><strong>DỊCH VỤ\r\nĐIỆN HOA</strong></span></a></span></td>\r\n</tr>\r\n<tr>\r\n<td colspan="4"></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Trang chủ', '', 'inherit', 'open', 'open', '', '807-revision', '', '', '2012-09-08 13:33:27', '2012-09-08 06:33:27', '', 807, 'http://www.vnestore.com/aa/807-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(936, 1, '2012-09-08 13:33:26', '2012-09-08 06:33:26', '<strong>AA Express</strong> là một trong những công ty hàng đầu trong lĩnh vực Chuyển phát nhanh bưu phẩm và bưu kiện trong nước và quốc tế. Do nhu cầu mở rộng thị trường, chúng tôi luôn cần tuyển dụng các ứng viên giàu kinh nghiệm, năng động, sáng tạo, nhiệt huyết yêu nghề.\r\n\r\nNếu bạn đang tìm kiếm một môi trường tốt, giúp bạn thực hiện những ước mơ, hãy gia nhập vào đội ngũ nhân viên của AA Express. Chúng tôi luôn chờ đón bạn!\r\n\r\nMọi thông tin vui lòng liên hệ:\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;\r\n\r\n<strong><span style="color: #ff9900;">CÔNG TY CP TM - DV TIẾP VẬN TOÀN CẦU A&amp;A</span></strong>\r\n\r\n<strong></strong><strong></strong><strong><span style="color: #66cc00;">HÀ NỘI</span></strong>\r\n\r\n<strong></strong>232/21 Tôn Đức Thắng, P.Hàng Bột, Q. Đống Đa, TP.Hà Nội\r\n\r\nTel: 043 511 11 24\r\n\r\nFax: 043 513 11 15\r\n\r\n<strong><span style="color: #66cc00;">TPHCM</span></strong>\r\n\r\n36/23 Giải Phóng, P.4, Q.Tân Bình, TPHCM\r\n\r\nTel: 083 948 0323/083 9480324\r\n\r\nFax: 083 9480325\r\n\r\nEmail: <a href="mailto:aaexpresshcm@vnn.vn">aaexpresshcm@vnn.vn</a>\r\n\r\n<strong><span style="color: #ff9900;">CÔNG TY THÀNH VIÊN</span></strong>\r\n\r\n<strong><span style="color: #66cc00;">Công ty cổ phần thương mại và giao nhận quốc tế Á Âu</span></strong>\r\n\r\nSố 21/11 Hẻm 108 Cộng Hòa, P.4, Q. Tân Bình, TP.HCM\r\n\r\nTel: 083 9480331/083 9484748\r\n\r\nFax: 083 9484487\r\n\r\n&nbsp;</td>\r\n<td valign="top"></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Tuyển dụng', '', 'inherit', 'open', 'open', '', '117-revision', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 117, 'http://www.vnestore.com/aa/117-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(906, 4, '2012-06-25 23:06:13', '2012-06-25 16:06:13', '&nbsp;\n\n<span style="color: #99cc00;">AA Express</span><span style="color: #000000;"> luôn có các chương trình khuyến mãi hấp dẫn dành cho quý khách hàng khi chọn tất cả các loại dịch vụ của chúng tôi.</span>\n\n<span style="color: #000000;">Hãy gọi điện cho chúng tôi để biết thêm thông tin chi tiết!</span>', '', '', 'inherit', 'open', 'open', '', '767-revision', '', '', '2012-06-25 23:06:13', '2012-06-25 16:06:13', '', 767, 'http://www.vnestore.com/aa/767-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(933, 1, '2012-09-08 13:33:26', '2012-09-08 06:33:26', '<table border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top" width="100%">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td valign="top">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<div align="justify"><em>ICTnews</em> – Theo hầu hết các doanh nghiệp trong nước, thị trường bưu chính, chuyển phát nhanh năm 2009, dù vẫn còn những khó khăn nhưng không đáng lo ngại.</div>\r\n<div align="justify"></div></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top" width="100%">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%">Phạt 5 doanh nghiệp chuyển phát</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<div align="justify"><em>ICTnews -</em> Thanh tra Bộ TT&amp;TT đã kiến nghị Chánh thanh tra Bộ xử phạt 5 doanh nghiệp chuyển phát với tổng số tiền 49 triệu đồng.</div>\r\n<div align="justify">Đây là kiến nghị của Đoàn thanh tra sau khi làm việc tại 3 tỉnh: Thừa Thiên Huế, Đà Nẵng và Quảng Ngãi trong thời gian từ ngày 15/7 đến 1/8/2008.</div>\r\n<div align="justify"></div></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%">Định mức thời gian kiểm hoá bưu gửi quốc tế</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<div align="justify">\r\n\r\n<img src="http://www.aa-express.net/images/stories/buugui.bmp" alt="" width="150" height="82" align="right" border="0" />Khả thi hay không khả thi? - <em>ICTnews</em> - Hiện VNPT đã có định mức thời gian xử lý công đoạn trong nước đối với thư quốc tế chiều đến. Tuy nhiên, bưu kiện, hàng hoá quốc tế chiều đến lại chưa được quy định về thời gian xử lý trong nước.\r\n\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Tin tức', '', 'inherit', 'open', 'open', '', '22-revision', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 22, 'http://www.vnestore.com/aa/22-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(927, 1, '2012-09-08 13:33:26', '2012-09-08 06:33:26', 'Đây là bảng giá chuyển phát bằng đường bộ ...', 'Chuyển phát bằng đường bộ', '', 'inherit', 'open', 'open', '', '839-revision', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 839, 'http://www.vnestore.com/aa/839-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(928, 1, '2012-09-08 13:33:26', '2012-09-08 06:33:26', '<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ chuyển phát nhanh</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900;">L</span>à dịch vụ vận chuyển thư từ, hàng hóa trong nước từ TP HCM hoặc TP Hà Nội đi tất cả các 64 tỉnh thành trong cả nước.\r\nDịch vụ này có thời gian quy định cụ thể 6h-&gt;72h tùy theo khu vực phát.</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=89" rel="attachment wp-att-89"><img class=" wp-image-89 aligncenter" title="fan2011990" src="http://localhost/aaexpress/wp-content/uploads/2012/06/fan2011990.png" alt="" width="153" height="119" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ phát trước 9h sáng</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900;">L</span>à dịch vụ rất tiện lợi khi khách hàng gửi tài liệu hàng hóa trước 17h mà yêu cầu A&amp;A phát trước 9h sáng hôm sau áp dụng trung tâm các tỉnh như : Hà Nội, Đà Nẵng, Cần Thơ, Nha Trang (Dịch vụ này có cộng thêm phí).</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=85" rel="attachment wp-att-85"><img class=" wp-image-85 aligncenter" title="A350" src="http://localhost/aaexpress/wp-content/uploads/2012/06/A350.png" alt="" width="153" height="113" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ điện hoa</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><strong><span style="color: #ff9900;">K</span></strong>hi khách hàng cần tặng hoa, quà đến người thân, cơ quan tổ chức, hội nghị liên hoan, khai trương, ma chay ... A&amp;A sẽ phục vụ Quý Khách được nhu cầu này.</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=86" rel="attachment wp-att-86"><img class=" wp-image-86 aligncenter" title="bld009124" src="http://localhost/aaexpress/wp-content/uploads/2012/06/bld009124.png" alt="" width="153" height="102" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"><strong><span style="color: #800000;">Dịch vụ chuyển phát nhanh hỏa tốc (Phát trong ngày)</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900;">Đ</span>ây là dịch vụ mà khi khách hàng có nhu cầu chuyển gấp tài liệu, hàng hóa, hồ sơ đi từ <strong>TP HCM</strong> đi <strong>TP Hà Nội</strong>, <strong>Đà Nẵng</strong>,<strong>Hải Phòng</strong>, <strong>Hà Đông</strong>, <strong>Cần Thơ</strong>, <strong>Vũng Tàu</strong> ... để đến được trong ngày quý khách vui lòng sử dụng dịch vụ phát trong ngày (PTN).\r\nThời gian nhận hàng trước <strong>11h30</strong> thời gian phát hàng muộn nhất là <strong>19h30</strong> cùng ngày. (Dịch vụ này có cộng thêm cước phí).</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=87" rel="attachment wp-att-87"><img class=" wp-image-87 aligncenter" title="ddl_67a_7162" src="http://localhost/aaexpress/wp-content/uploads/2012/06/ddl_67a_7162.png" alt="" width="153" height="114" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%"> <strong><span style="color: #800000;">Dịch vụ vận chuyển hàng bằng đường bộ</span></strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top"><span style="color: #ff9900; font-size: large;">K</span>hi khách hàng có hàng chuyển đi mà không cần nhanh thì quý khách vui lòng sử dụng dịch vụ này. Dịch vụ này sẻ tiết kiệm được đáng kể chi phí của khách hàng. Nhưng thời gian giao hàng chậm hơn so với dịch vụ chuyển phát nhanh là 3-4 ngày.</td>\r\n<td width="170"><a href="http://localhost/aaexpress/?attachment_id=88" rel="attachment wp-att-88"><img class=" wp-image-88 aligncenter" title="ti0601054" src="http://localhost/aaexpress/wp-content/uploads/2012/06/ti0601054.png" alt="" width="153" height="113" /></a></td>\r\n<td></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;', 'Dịch vụ', '', 'inherit', 'open', 'open', '', '79-revision', '', '', '2012-09-08 13:33:26', '2012-09-08 06:33:26', '', 79, 'http://www.vnestore.com/aa/79-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(893, 4, '2012-06-23 23:06:44', '2012-06-23 16:06:44', '<table border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top" width="100%">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td valign="top">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<div align="justify"><em>ICTnews</em> – Theo hầu hết các doanh nghiệp trong nước, thị trường bưu chính, chuyển phát nhanh năm 2009, dù vẫn còn những khó khăn nhưng không đáng lo ngại.</div>\r\n<div align="justify"></div></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="top">\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top" width="100%">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%">Phạt 5 doanh nghiệp chuyển phát</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<div align="justify"><em>ICTnews -</em> Thanh tra Bộ TT&amp;TT đã kiến nghị Chánh thanh tra Bộ xử phạt 5 doanh nghiệp chuyển phát với tổng số tiền 49 triệu đồng.</div>\r\n<div align="justify">Đây là kiến nghị của Đoàn thanh tra sau khi làm việc tại 3 tỉnh: Thừa Thiên Huế, Đà Nẵng và Quảng Ngãi trong thời gian từ ngày 15/7 đến 1/8/2008.</div>\r\n<div align="justify"></div></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td align="right" width="100%">Định mức thời gian kiểm hoá bưu gửi quốc tế</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td colspan="2" valign="top">\r\n<div align="justify">\r\n\r\n<img src="http://www.aa-express.net/images/stories/buugui.bmp" alt="" width="150" height="82" align="right" border="0" />Khả thi hay không khả thi? - <em>ICTnews</em> - Hiện VNPT đã có định mức thời gian xử lý công đoạn trong nước đối với thư quốc tế chiều đến. Tuy nhiên, bưu kiện, hàng hoá quốc tế chiều đến lại chưa được quy định về thời gian xử lý trong nước.\r\n\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2"></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Tin tức', '', 'inherit', 'open', 'open', '', '22-revision-3', '', '', '2012-06-23 23:06:44', '2012-06-23 16:06:44', '', 22, 'http://www.vnestore.com/aa/22-revision-3/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(889, 4, '2012-08-27 22:07:40', '2012-08-27 15:07:40', '<object width="570" height="230" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"><param name="quality" value="high" /><param name="src" value="http://www.vnestore.com/aa/wp-content/themes/easel/images/HomeBanner.swf" /><param name="pluginspage" value="http://www.macromedia.com/go/getflashplayer" /><embed width="570" height="230" type="application/x-shockwave-flash" src="http://www.vnestore.com/aa/wp-content/themes/easel/images/HomeBanner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" /> </object>\r\n\r\n&nbsp;\r\n\r\n<span style="font-size: 17px; color: #a8040a;">Chào mừng bạn đến với A&amp;A Express</span>\r\n\r\n<strong><span style="color: #a8040a;">AA Express</span></strong> là công ty hàng đầu trong lĩnh vực chuyển phát nhanh tài liệu, hàng hóa trong nước và Quốc tế. Nhận từ tay người gửi, phát đến tay người nhận trong thời gian <span style="color: #008000;"><strong>NGẮN NHẤT</strong></span>, đảm bảo tuyệt đối <span style="color: #008000;"><strong>AN TOÀN</strong>,<strong>HIỆU QUẢ</strong></span>.\r\n\r\nVới đội ngũ nhân viên chuyên nghiệp và năng động, <span style="color: #a8040a;"><strong>AA Express</strong></span> luôn phấn đấu nỗ lực vì lợi ích khách hàng. Hiện nay công ty chúng tôi vẫn và đang hoàn thiện mở rộng quy mô phục vụ và đa dạng hóa các loại hình dịch vụ nhằm đảm bảo chất lượng phục vụ cho mọi khách hàng.\r\n\r\n<strong><span style="color: #a8040a;">AA Express</span></strong> sẵn sàng đáp ứng với các phương thức:\r\n<ul>\r\n	<li>Giao nhận hàng tại địa chỉ quý khách</li>\r\n	<li>Không giới hạn về số lượng, trọng lượng.</li>\r\n	<li>Khai thác, quản lý, vận chuyển hàng hóa, tài liệu.</li>\r\n	<li>24/24 trong ngày đến hơn 60 tỉnh thành phố trong cả nước và hơn 200 quốc gia trên thế giới.</li>\r\n</ul>\r\n<strong>Đặc biệt</strong>:\r\n<ul>\r\n	<li>Tra cứu thông tin bưu phẩm thông qua website.</li>\r\n	<li>Tra cứu trọng lượng gói bưu phẩm muốn vận chuyển.</li>\r\n</ul>\r\n&nbsp;\r\n<table width="100%" border="0" cellspacing="5" cellpadding="5">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<div><img src="http://localhost/aaexpress/wp-content/themes/easel/images/vcduongbo.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://localhost/aaexpress/wp-content/themes/easel/images/vchangkhong.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://localhost/aaexpress/wp-content/themes/easel/images/vcduongthuy.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n<td>\r\n<div><img src="http://localhost/aaexpress/wp-content/themes/easel/images/dvdienhoa.jpg" alt="" width="100" height="100" border="0" /></div></td>\r\n</tr>\r\n<tr>\r\n<td><span style="color: #0000ff;"><a href="http://localhost/aaexpress/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nĐƯỜNG BỘ</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://localhost/aaexpress/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nHÀNG KHÔNG</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://localhost/aaexpress/dich-vu.html"><span style="color: #0000ff;"><strong>VẬN CHUYỂN\r\nĐƯỜNG THỦY</strong></span></a></span></td>\r\n<td><span style="color: #0000ff;"><a href="http://localhost/aaexpress/dich-vu.html"><span style="color: #0000ff;"><strong>DỊCH VỤ\r\nĐIỆN HOA</strong></span></a></span></td>\r\n</tr>\r\n<tr>\r\n<td colspan="4"></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Trang chủ', '', 'inherit', 'open', 'open', '', '807-revision-22', '', '', '2012-08-27 22:07:40', '2012-08-27 15:07:40', '', 807, 'http://www.vnestore.com/aa/807-revision-22/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(920, 1, '2012-09-17 10:21:24', '2012-09-17 03:21:24', '', 'AA', '', 'trash', 'open', 'open', '', 'aa', '', '', '2012-09-17 17:51:55', '2012-09-17 10:51:55', '', 0, 'http://www.vnestore.com/aa/?page_id=920', 0, 'page', '', 0);
INSERT INTO `dev_posts` VALUES(921, 1, '2012-09-17 10:21:23', '2012-09-17 03:21:23', '', 'AA', '', 'inherit', 'open', 'open', '', '920-revision', '', '', '2012-09-17 10:21:23', '2012-09-17 03:21:23', '', 920, 'http://www.vnestore.com/aa/920-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(922, 1, '2012-09-17 17:48:47', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-17 17:48:47', '0000-00-00 00:00:00', '', 0, 'http://www.vnestore.com/aa/?p=922', 0, 'post', '', 0);
INSERT INTO `dev_posts` VALUES(923, 1, '2012-09-17 17:49:02', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-17 17:49:02', '0000-00-00 00:00:00', '', 0, 'http://www.vnestore.com/aa/?p=923', 0, 'post', '', 0);
INSERT INTO `dev_posts` VALUES(924, 1, '2012-09-17 17:49:55', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-17 17:49:55', '0000-00-00 00:00:00', '', 0, 'http://www.vnestore.com/aa/?p=924', 0, 'post', '', 0);
INSERT INTO `dev_posts` VALUES(925, 1, '2012-09-08 13:33:27', '2012-09-08 06:33:27', 'Hàng hoá gửi phải được gói bọc chắc chắn, bao bì phải phù hợp với hình thức và tính chất của vật phẩm bên trong, phù hợp với điều kiện vận chuyển. Hàng hoá gửi phải gói bọc đảm bảo không gây nguy hiểm cho nhân viên khi thực hiện nhiệm vụ, không làm bẩn hoặc làm hỏng các bưu gửi khác hoặc trang thiết bị bưu chính.\r\n\r\nĐối với hàng hoá gửi nếu không cần có điều kiện gói bọc đặc biệt thì phải đảm bảo có thể mở ra để kiểm soát nội dung.\r\n\r\nChú ý gói bọc một số chất đặc biệt\r\n\r\n1 - Các chất, sinh vật dễ hư hỏng và truyền nhiễm cho người và súc vật phải được ghi chú rõ hoặc dán nhãn “chất truyền nhiễm” trên hàng hoá gửi và phải được gói bọc theo qui định. Người gửi các chất truyền nhiễm phải đảm bảo bưu gửi đã được gói bọc kỹ không gây bất cứ nguy hiểm nào cho người và súc vật trong quá trình chuyển phát.\r\n\r\n2 - Vật phẩm làm bằng thuỷ tinh hoặc những chất dễ vỡ phải đựng vào hộp làm bằng kim loại, hoặc gỗ ,chèn bằng giấy vụn, vỏ bào hoặc bất kỳ thứ gì khác có tác dụng bảo vệ, tránh gây cọ sát và va chạm trong quá trình vận chuyển.\r\n\r\n3 - Chất lỏng phải đựng trong bình hoàn toàn kín, mỗi bình phải đựng trong một hộp làm bằng kim loại hoặc gỗ, chèn bằng mùn cưa, bông hoặc bất kỳ thứ gì khác có tác dụng bảo vệ.\r\n\r\n4 - Các chất dầu mỡ khó chảy như cao, xà phòng mềm, nhựa cây... phải gói bọc lớp thứ nhất bằng hộp, túi vải, chất dẻo...bỏ vào hộp làm bằng gỗ, kim loại hoặc chất khác có đủ độ bền để chất bên trong khỏi bị chảy ra.\r\n\r\n5 - Các loại hạt phải đựng trong vỏ bọc bằng vải, bằng ni lông, bằng bìa cứng, bằng gỗ hay kim loại.\r\n\r\n6- Chất bột khô có mầu chỉ được chấp nhận nếu đựng vào hộp kim loại hoàn toàn kín và bỏ vào trong một hộp bằng gỗ. Giữa hai lớp hộp đó được chèn bằng mùn cưa, các chất hút nước có tác dụng bảo vệ.\r\n\r\n7 - Chất bột khô không mầu phải được đựng trong hộp, túi bằng kim loại hoặc bằng gỗ. Vật chứa đó phải bỏ vào một hộp dai bền làm bằng một trong những vật liệu nói trên.', 'Cách gói bọc', '', 'inherit', 'open', 'open', '', '775-revision', '', '', '2012-09-08 13:33:27', '2012-09-08 06:33:27', '', 775, 'http://www.vnestore.com/aa/775-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(926, 1, '2012-09-08 13:33:27', '2012-09-08 06:33:27', '<span><span style="color: #ff0000;"><strong>Câu hỏi 1.</strong></span> Mức bồi thường căn cứ trên cơ sở nào?</span>\r\n\r\nTheo quy định của <span style="color: #0000ff;"><strong>CÔNG TY CP TM - DV TIẾP VẬN TOÀN CẦU A&amp;A</strong></span>, quyền lợi của Khách hàng luôn đượ<span style="color: #000000;">c <span style="color: #0000ff;"><strong>CÔNG TY CP TM - DV TIẾP VẬN TOÀN CẦU A&amp;A</strong></span> đả</span>m bảo.\r\n\r\n<span style="color: #993300;"><strong>\r\n<span style="color: #ff0000;">Câu hỏi 2.</span></strong></span> Thời hạn khiếu nại được tính như thế nào?\r\n\r\nThời hạn giải quyết khiếu nại đối với dịch vụ <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thoả thuận trong nước là 3 tháng, đối với dịch vụ AA Express quốc tế là 4 tháng kể ngày sau ngày kết thúc chỉ tiêu thời gian toàn trình đã công bố.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 3</span></strong><span style="color: #ff0000;">.</span></span> Mức bảo hiểm được tính như thế nào nếu sử dụng dịch vụ khai giá?\r\n\r\nĐối với dịch vụ <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thoả thuận trong nước khách hàng được bảo hiểm theo giá trị đã khai và các khoản cước trừ cước khai giá. Giá trị đã khai không vược quá giá trị thực tế và mức tối đa cho phép.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 4.</span></strong></span> Khách hàng có thể dùng phương thức thanh toán nào khi gửi tài liệu, hàng hóa tại <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span>?\r\n\r\nKhách hàng có thể thanh toán ngay hoặc thanh toán theo định kỳ (hàng tháng) và chọn lựa các phương thức thanh toán như: tiền mặt, chuyển khoản.\r\n\r\nChúng tôi sẵn sàng ký hợp đồng cung cấp dịch vụ với quý Khách hàng là các doanh nghiệp để quý Khách hàng có thể chọn lựa phương thức thanh toán thuận tiện nhất.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 5.</span></strong></span> Khách hàng có thể biết được tình trạng của bưu gửi trong thời gian chuyển phát không?\r\n\r\nHiện nay, chúng tôi đã có mạng định vị bưu gửi cho dịch vụ chuyển phát nhanh <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thỏa thuận trong nước và một số dịch vụ chuyển phát nhanh quốc tế.\r\n\r\nQuý khách hàng có thể kiểm tra và xác định lộ trình, tình trạng của bưu gửi theo mã số của bưu gửi. Với mạng định vị này, quy khách hàng hoàn toàn yên tâm vì bưu gửi luôn trong tầm tay mình.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 6.</span></strong></span><span style="color: #ff0000;"> </span>Khi nhận/gửi bưu phẩm, hàng hóa trong nước và nước ngoài tại <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span>, khách hàng được hỗ trợ những gì?\r\n\r\nTại Công ty Cổ phần <span style="color: #0000ff;">TM - DV Tiếp Vận Toàn Cầu A&amp;A</span>, Quý Khách hàng sẽ được phục vụ theo một cung cách hiện đại nhất. Bưu gửi của khách hàng sẽ được nhận và phát tận nơi trong thời gian nhanh nhất dựa trên chỉ tiêu thời gian đã công bố.\r\n\r\nNgoài ra, hàng hóa xuất, nhập khẩu sẽ được <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span> thay mặt khách hàng hoàn tất thủ tục hải quan và các thủ tục kiểm dịch, kiểm tra văn hóa phẩm xuất, nhập khẩu.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 7.</span></strong></span> Địa bàn cung cấp dịch vụ của <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span> đến các tỉnh, khu vực, quốc gia nào?\r\n\r\nHiện nay, dịch vụ <span style="color: #0000ff;">AA Express</span>, <span style="color: #0000ff;">AA Express</span> thoả thuận trong nước phục vụ đến 64 tỉnh thành phố trong cả nước, <span style="color: #0000ff;">AA Express</span> quốc tế phục vụ đến 48 quốc gia trong Liên minh Bưu chính thế giới.\r\n\r\nNgoài ra, các dịch vụ hợp tác với các công ty chuyển phát nhanh toàn cầu lớn nhất thế giới có mặt tại  hơn 200 quốc gia.\r\n\r\n<span style="color: #993300;"><strong><strong>\r\n</strong><span style="color: #ff0000;">Câu hỏi 8.</span></strong></span> Những ưu điểm của các dịch vụ mà <span style="color: #0000ff;">Công ty Cổ phần TM - DV Tiếp Vận Toàn Cầu A&amp;A</span> cung cấp so với các dịch vụ khác?\r\n\r\nDịch vụ chuyển phát nhanh trong nước và quốc tế có thể đáp ứng mọi nhu cầu của khách hàng về chất lượng dịch vụ, thời gian vận chuyển với giá cả hợp lý theo từng loại hình dịch vụ mà Công ty đang cung cấp cho thị trường hiện nay.\r\n\r\nChúng tôi cam kết dành cho Quý Khách hàng sự thuận tiện và hiệu quả nhất và là trợ thủ đắc lực nhất của quý Khách hàng trong các giải pháp kinh doanh.', 'Câu hỏi thường gặp', '', 'inherit', 'open', 'open', '', '805-revision', '', '', '2012-09-08 13:33:27', '2012-09-08 06:33:27', '', 805, 'http://www.vnestore.com/aa/805-revision/', 0, 'revision', '', 0);
INSERT INTO `dev_posts` VALUES(935, 1, '2012-09-17 10:21:24', '2012-09-17 03:21:24', '', 'AA', '', 'inherit', 'open', 'open', '', '920-revision-2', '', '', '2012-09-17 10:21:24', '2012-09-17 03:21:24', '', 920, 'http://www.vnestore.com/aa/920-revision-2/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dev_slp_rep_query`
--

CREATE TABLE `dev_slp_rep_query` (
  `slp_repq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slp_repq_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `slp_repq_query` varchar(255) NOT NULL,
  `slp_repq_tags` varchar(255) DEFAULT NULL,
  `slp_repq_address` varchar(255) DEFAULT NULL,
  `slp_repq_radius` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`slp_repq_id`),
  KEY `slp_repq_time` (`slp_repq_time`),
  KEY `slp_repq_time_2` (`slp_repq_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_slp_rep_query`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_slp_rep_query_results`
--

CREATE TABLE `dev_slp_rep_query_results` (
  `slp_repqr_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slp_repq_id` bigint(20) unsigned NOT NULL,
  `sl_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`slp_repqr_id`),
  KEY `slp_repq_id` (`slp_repq_id`),
  KEY `slp_repq_id_2` (`slp_repq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_slp_rep_query_results`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_store_locator`
--

CREATE TABLE `dev_store_locator` (
  `sl_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sl_store` varchar(255) DEFAULT NULL,
  `sl_address` varchar(255) DEFAULT NULL,
  `sl_address2` varchar(255) DEFAULT NULL,
  `sl_city` varchar(255) DEFAULT NULL,
  `sl_state` varchar(255) DEFAULT NULL,
  `sl_zip` varchar(255) DEFAULT NULL,
  `sl_country` varchar(255) DEFAULT NULL,
  `sl_latitude` varchar(255) DEFAULT NULL,
  `sl_longitude` varchar(255) DEFAULT NULL,
  `sl_tags` mediumtext,
  `sl_description` text,
  `sl_email` varchar(255) DEFAULT NULL,
  `sl_url` varchar(255) DEFAULT NULL,
  `sl_hours` varchar(255) DEFAULT NULL,
  `sl_phone` varchar(255) DEFAULT NULL,
  `sl_image` varchar(255) DEFAULT NULL,
  `sl_private` varchar(1) DEFAULT NULL,
  `sl_neat_title` varchar(255) DEFAULT NULL,
  `sl_linked_postid` int(11) DEFAULT NULL,
  `sl_pages_url` varchar(255) DEFAULT NULL,
  `sl_pages_on` varchar(1) DEFAULT NULL,
  `sl_lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sl_id`),
  KEY `sl_store` (`sl_store`),
  KEY `sl_longitude` (`sl_longitude`),
  KEY `sl_latitude` (`sl_latitude`),
  KEY `sl_store_2` (`sl_store`),
  KEY `sl_longitude_2` (`sl_longitude`),
  KEY `sl_latitude_2` (`sl_latitude`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dev_store_locator`
--

INSERT INTO `dev_store_locator` VALUES(1, 'Hà Nội', '135 Trần Hữu Tước', 'P. Nam Đồng&#44; Q. Đống Đa', 'Hà Nội', '', '', 'Việt Nam', '21.0128774', '105.8298504', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2012-06-25 01:45:54');
INSERT INTO `dev_store_locator` VALUES(2, 'Hồ Chí Minh', '21/11 Hẻm 108 Cộng Hòa', 'P.4&#44; Q. Tân Bình', 'Hồ Chí Minh', '', '', 'Việt Nam', '10.8230989', '106.6296638', '', 'Head office', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2012-06-25 01:46:39');
INSERT INTO `dev_store_locator` VALUES(3, 'Cần Thơ', '', 'Q. Ninh Kiều', 'Cần Thơ', '', '', 'Việt Nam', '10.03183', '105.783798', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2012-08-24 21:40:38');
INSERT INTO `dev_store_locator` VALUES(4, 'Đà Nẵng', '', '', 'Đà Nẵng', '', '', 'Việt Nam', '16.051571', '108.214897', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2012-08-24 21:43:34');
INSERT INTO `dev_store_locator` VALUES(5, 'Hải Phòng', '', '', 'Hải Phòng', '', '', 'Việt Nam', '20.861361', '106.679802', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2012-08-24 21:45:53');
INSERT INTO `dev_store_locator` VALUES(6, 'Huế', '', 'TP Huế', 'Huế', '', '', 'Việt Nam', '16.463461', '107.584702', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2012-08-24 21:46:17');

-- --------------------------------------------------------

--
-- Table structure for table `dev_terms`
--

CREATE TABLE `dev_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `dev_terms`
--

INSERT INTO `dev_terms` VALUES(1, 'Tin tức', 'tin-tuc-aa-express', 0);
INSERT INTO `dev_terms` VALUES(2, 'Thông tin cần biết', 'thong-tin-can-biet-chuyen-phat-nhanh', 0);
INSERT INTO `dev_terms` VALUES(7, 'Menu', 'menu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dev_term_relationships`
--

CREATE TABLE `dev_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dev_term_relationships`
--

INSERT INTO `dev_term_relationships` VALUES(800, 1, 0);
INSERT INTO `dev_term_relationships` VALUES(1, 1, 0);
INSERT INTO `dev_term_relationships` VALUES(81, 7, 0);
INSERT INTO `dev_term_relationships` VALUES(861, 7, 0);
INSERT INTO `dev_term_relationships` VALUES(854, 7, 0);
INSERT INTO `dev_term_relationships` VALUES(119, 7, 0);
INSERT INTO `dev_term_relationships` VALUES(816, 7, 0);
INSERT INTO `dev_term_relationships` VALUES(56, 1, 0);
INSERT INTO `dev_term_relationships` VALUES(63, 1, 0);
INSERT INTO `dev_term_relationships` VALUES(809, 7, 0);
INSERT INTO `dev_term_relationships` VALUES(798, 1, 0);
INSERT INTO `dev_term_relationships` VALUES(795, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dev_term_taxonomy`
--

CREATE TABLE `dev_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `dev_term_taxonomy`
--

INSERT INTO `dev_term_taxonomy` VALUES(1, 1, 'category', '', 0, 0);
INSERT INTO `dev_term_taxonomy` VALUES(2, 2, 'link_category', '', 0, 0);
INSERT INTO `dev_term_taxonomy` VALUES(7, 7, 'nav_menu', '', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `dev_the_welcomizer`
--

CREATE TABLE `dev_the_welcomizer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `export_id` varchar(13) NOT NULL DEFAULT '',
  `section_id` varchar(22) NOT NULL DEFAULT 'home',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `type` varchar(5) NOT NULL DEFAULT 'id',
  `layer_id` varchar(50) NOT NULL DEFAULT '',
  `on_event` varchar(15) NOT NULL DEFAULT '',
  `lock_event` tinyint(3) NOT NULL DEFAULT '1',
  `start_delay` varchar(100) NOT NULL DEFAULT '0',
  `duration` varchar(100) NOT NULL DEFAULT '0',
  `output` varchar(1) NOT NULL DEFAULT 'b',
  `output_pos` varchar(1) NOT NULL DEFAULT 'b',
  `javascript` text NOT NULL,
  `start_top_pos_sign` varchar(1) NOT NULL DEFAULT '',
  `start_top_pos` int(5) DEFAULT NULL,
  `start_top_pos_format` varchar(2) NOT NULL DEFAULT 'px',
  `start_left_pos_sign` varchar(1) NOT NULL DEFAULT '',
  `start_left_pos` int(5) DEFAULT NULL,
  `start_left_pos_format` varchar(2) NOT NULL DEFAULT 'px',
  `position` varchar(8) NOT NULL DEFAULT '',
  `zindex` varchar(5) NOT NULL DEFAULT '',
  `easing_a` varchar(20) NOT NULL DEFAULT 'swing',
  `easing_b` varchar(20) NOT NULL DEFAULT 'swing',
  `move_top_pos_sign_a` varchar(1) NOT NULL DEFAULT '',
  `move_top_pos_a` int(5) DEFAULT NULL,
  `move_top_pos_format_a` varchar(2) NOT NULL DEFAULT 'px',
  `move_left_pos_sign_a` varchar(1) NOT NULL DEFAULT '',
  `move_left_pos_a` int(5) DEFAULT NULL,
  `move_left_pos_format_a` varchar(2) NOT NULL DEFAULT 'px',
  `move_top_pos_sign_b` varchar(1) NOT NULL DEFAULT '',
  `move_top_pos_b` int(5) DEFAULT NULL,
  `move_top_pos_format_b` varchar(2) NOT NULL DEFAULT 'px',
  `move_left_pos_sign_b` varchar(1) NOT NULL DEFAULT '',
  `move_left_pos_b` int(5) DEFAULT NULL,
  `move_left_pos_format_b` varchar(2) NOT NULL DEFAULT 'px',
  `options_a` text NOT NULL,
  `options_b` text NOT NULL,
  `extra_js_a` text NOT NULL,
  `extra_js_b` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_the_welcomizer`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_usermeta`
--

CREATE TABLE `dev_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=115 ;

--
-- Dumping data for table `dev_usermeta`
--

INSERT INTO `dev_usermeta` VALUES(3, 1, 'nickname', 'admin');
INSERT INTO `dev_usermeta` VALUES(2, 1, 'last_name', '');
INSERT INTO `dev_usermeta` VALUES(1, 1, 'first_name', '');
INSERT INTO `dev_usermeta` VALUES(114, 7, 'jabber', '0101718968001');
INSERT INTO `dev_usermeta` VALUES(113, 7, 'yim', '39480325');
INSERT INTO `dev_usermeta` VALUES(112, 7, 'aim', '39480323');
INSERT INTO `dev_usermeta` VALUES(110, 7, 'dev_user_level', '0');
INSERT INTO `dev_usermeta` VALUES(111, 7, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_media_uploader,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link');
INSERT INTO `dev_usermeta` VALUES(109, 7, 'dev_capabilities', 'a:1:{s:10:"subscriber";s:1:"1";}');
INSERT INTO `dev_usermeta` VALUES(108, 7, 'show_admin_bar_front', 'true');
INSERT INTO `dev_usermeta` VALUES(106, 7, 'admin_color', 'fresh');
INSERT INTO `dev_usermeta` VALUES(107, 7, 'use_ssl', '0');
INSERT INTO `dev_usermeta` VALUES(103, 7, 'description', '');
INSERT INTO `dev_usermeta` VALUES(104, 7, 'rich_editing', 'true');
INSERT INTO `dev_usermeta` VALUES(105, 7, 'comment_shortcuts', 'false');
INSERT INTO `dev_usermeta` VALUES(100, 7, 'first_name', 'phuong');
INSERT INTO `dev_usermeta` VALUES(101, 7, 'last_name', 'cty phuong');
INSERT INTO `dev_usermeta` VALUES(102, 7, 'nickname', '108/21/11 Cong hoa, p4, q tân bình');
INSERT INTO `dev_usermeta` VALUES(99, 6, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_media_uploader,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link');
INSERT INTO `dev_usermeta` VALUES(98, 6, 'dev_user_level', '0');
INSERT INTO `dev_usermeta` VALUES(96, 6, 'show_admin_bar_front', 'true');
INSERT INTO `dev_usermeta` VALUES(97, 6, 'dev_capabilities', 'a:1:{s:10:"subscriber";s:1:"1";}');
INSERT INTO `dev_usermeta` VALUES(95, 6, 'use_ssl', '0');
INSERT INTO `dev_usermeta` VALUES(94, 6, 'admin_color', 'fresh');
INSERT INTO `dev_usermeta` VALUES(93, 6, 'comment_shortcuts', 'false');
INSERT INTO `dev_usermeta` VALUES(91, 6, 'description', '');
INSERT INTO `dev_usermeta` VALUES(92, 6, 'rich_editing', 'true');
INSERT INTO `dev_usermeta` VALUES(88, 6, 'first_name', 'nga');
INSERT INTO `dev_usermeta` VALUES(89, 6, 'last_name', 'cong ty nga');
INSERT INTO `dev_usermeta` VALUES(90, 6, 'nickname', 'AA1001');
INSERT INTO `dev_usermeta` VALUES(17, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}');
INSERT INTO `dev_usermeta` VALUES(16, 1, 'dev_user-settings-time', '1346343282');
INSERT INTO `dev_usermeta` VALUES(14, 1, 'dev_dashboard_quick_press_last_post_id', '867');
INSERT INTO `dev_usermeta` VALUES(15, 1, 'dev_user-settings', 'editor=html&uploader=1&mfold=o&galcols=1&hidetb=1&widgets_access=off&urlbutton=file');
INSERT INTO `dev_usermeta` VALUES(13, 1, 'show_welcome_panel', '1');
INSERT INTO `dev_usermeta` VALUES(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_media_uploader,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link');
INSERT INTO `dev_usermeta` VALUES(11, 1, 'dev_user_level', '10');
INSERT INTO `dev_usermeta` VALUES(10, 1, 'dev_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}');
INSERT INTO `dev_usermeta` VALUES(9, 1, 'show_admin_bar_front', 'true');
INSERT INTO `dev_usermeta` VALUES(8, 1, 'use_ssl', '0');
INSERT INTO `dev_usermeta` VALUES(7, 1, 'admin_color', 'classic');
INSERT INTO `dev_usermeta` VALUES(4, 1, 'description', '');
INSERT INTO `dev_usermeta` VALUES(5, 1, 'rich_editing', 'true');
INSERT INTO `dev_usermeta` VALUES(6, 1, 'comment_shortcuts', 'false');
INSERT INTO `dev_usermeta` VALUES(62, 4, 'first_name', 'Lê Phú Khánh Chi');
INSERT INTO `dev_usermeta` VALUES(63, 4, 'last_name', 'AA Express');
INSERT INTO `dev_usermeta` VALUES(64, 4, 'nickname', 'khanhchi');
INSERT INTO `dev_usermeta` VALUES(65, 4, 'description', '');
INSERT INTO `dev_usermeta` VALUES(66, 4, 'rich_editing', 'true');
INSERT INTO `dev_usermeta` VALUES(67, 4, 'comment_shortcuts', 'false');
INSERT INTO `dev_usermeta` VALUES(68, 4, 'admin_color', 'fresh');
INSERT INTO `dev_usermeta` VALUES(69, 4, 'use_ssl', '0');
INSERT INTO `dev_usermeta` VALUES(70, 4, 'show_admin_bar_front', 'true');
INSERT INTO `dev_usermeta` VALUES(71, 4, 'dev_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}');
INSERT INTO `dev_usermeta` VALUES(72, 4, 'dev_user_level', '10');
INSERT INTO `dev_usermeta` VALUES(73, 4, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_media_uploader,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link');
INSERT INTO `dev_usermeta` VALUES(74, 4, 'dev_user-settings', 'editor=html');
INSERT INTO `dev_usermeta` VALUES(75, 4, 'dev_user-settings-time', '1346169074');
INSERT INTO `dev_usermeta` VALUES(76, 5, 'first_name', 'Thieu Thi Nga');
INSERT INTO `dev_usermeta` VALUES(77, 5, 'last_name', 'Cong Ty Chuyen Phat Nhanh A Au');
INSERT INTO `dev_usermeta` VALUES(78, 5, 'nickname', 'AA11111');
INSERT INTO `dev_usermeta` VALUES(79, 5, 'description', '');
INSERT INTO `dev_usermeta` VALUES(80, 5, 'rich_editing', 'true');
INSERT INTO `dev_usermeta` VALUES(81, 5, 'comment_shortcuts', 'false');
INSERT INTO `dev_usermeta` VALUES(82, 5, 'admin_color', 'fresh');
INSERT INTO `dev_usermeta` VALUES(83, 5, 'use_ssl', '0');
INSERT INTO `dev_usermeta` VALUES(84, 5, 'show_admin_bar_front', 'true');
INSERT INTO `dev_usermeta` VALUES(85, 5, 'dev_capabilities', 'a:1:{s:10:"subscriber";s:1:"1";}');
INSERT INTO `dev_usermeta` VALUES(86, 5, 'dev_user_level', '0');
INSERT INTO `dev_usermeta` VALUES(87, 5, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_media_uploader,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link');
INSERT INTO `dev_usermeta` VALUES(18, 1, 'metaboxhidden_nav-menus', 'a:4:{i:0;s:24:"nav-menu-theme-locations";i:1;s:16:"add-custom-links";i:2;s:8:"add-post";i:3;s:12:"add-post_tag";}');
INSERT INTO `dev_usermeta` VALUES(21, 1, 'manageedit-commentscolumnshidden', 'a:4:{i:0;s:6:"author";i:1;s:8:"response";i:2;s:0:"";i:3;s:0:"";}');
INSERT INTO `dev_usermeta` VALUES(19, 1, 'closedpostboxes_nav-menus', 'a:0:{}');
INSERT INTO `dev_usermeta` VALUES(20, 1, 'nav_menu_recently_edited', '7');
INSERT INTO `dev_usermeta` VALUES(22, 1, 'manageedit-postcolumnshidden', 'a:8:{i:0;s:6:"author";i:1;s:4:"tags";i:2;s:8:"comments";i:3;s:4:"date";i:4;s:0:"";i:5;s:0:"";i:6;s:0:"";i:7;s:0:"";}');
INSERT INTO `dev_usermeta` VALUES(23, 1, 'edit_post_per_page', '20');
INSERT INTO `dev_usermeta` VALUES(24, 1, 'aim', 'yyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `dev_usermeta` VALUES(25, 1, 'yim', 'yyyyyyyyyyyyyyyyyyyy');
INSERT INTO `dev_usermeta` VALUES(26, 1, 'jabber', 'yyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `dev_usermeta` VALUES(27, 1, 'twitter', 'yyyyyyyyyyyyyyyyyyyy');
INSERT INTO `dev_usermeta` VALUES(28, 1, 'facebook', 'yyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `dev_usermeta` VALUES(29, 1, 'msn', 'yyyyyyyyyyyyyyyyyyyy');
INSERT INTO `dev_usermeta` VALUES(30, 1, 'manageedit-categorycolumnshidden', 'a:2:{i:0;s:11:"description";i:1;s:0:"";}');
INSERT INTO `dev_usermeta` VALUES(31, 1, 'edit_category_per_page', '20');

-- --------------------------------------------------------

--
-- Table structure for table `dev_users`
--

CREATE TABLE `dev_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `dev_users`
--

INSERT INTO `dev_users` VALUES(6, 'AA1001', '$P$BBdU1B4Jvmn7MfEl7PJTDLGgx3fojr1', 'aa1001', 'gaf@yahoo.com', '', '2012-09-08 07:20:22', '', 0, 'AA1001');
INSERT INTO `dev_users` VALUES(7, 'AA1002', '$P$Bsv6Cgrt1SZYxseOUE0IQJ7MkylCIY1', 'aa1002', 'phuong@yahoo.com', 'http://phương', '2012-09-08 07:21:55', '', 0, 'AA1002');
INSERT INTO `dev_users` VALUES(1, 'admin', '$P$B.7nM2LyZRI653Yx52X21kNc7Z9ttb1', 'admin', 'vdloi_it2k@yahoo.com.vn', '', '0000-00-00 00:00:00', '', 0, 'admin');
INSERT INTO `dev_users` VALUES(4, 'khanhchi', '$P$BEU./3cH5zBqfkfiLlEUYFQqT9ILv71', 'khanhchi', 'khanhchi@yahoo.com', 'http://aa-express.net', '2012-08-26 15:11:08', '', 0, 'khanhchi');
INSERT INTO `dev_users` VALUES(5, 'AA11111', '$P$BbEz.I8hztW93wVwfv2vbVq0aHnmtk/', 'aa11111', 'startkhachi@yahoo.com', '', '2012-09-08 04:38:02', '', 0, 'AA11111');

-- --------------------------------------------------------

--
-- Table structure for table `dev_vs_current_online_users`
--

CREATE TABLE `dev_vs_current_online_users` (
  `IP` varchar(15) NOT NULL COMMENT 'IP of user which enters page',
  `time` varchar(255) NOT NULL COMMENT 'time when user enters page (unix timestamp)',
  PRIMARY KEY (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dev_vs_current_online_users`
--

INSERT INTO `dev_vs_current_online_users` VALUES('150.70.172.108', '1347891402');

-- --------------------------------------------------------

--
-- Table structure for table `dev_vs_overall_counter`
--

CREATE TABLE `dev_vs_overall_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period` varchar(255) DEFAULT NULL COMMENT 'period from which this record handle value: overall = NULL, weekly = weekn_number, daily = current_day',
  `visits` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dev_vs_overall_counter`
--

INSERT INTO `dev_vs_overall_counter` VALUES(1, 'overall', 411);
INSERT INTO `dev_vs_overall_counter` VALUES(2, '2012-09-17', 6);
INSERT INTO `dev_vs_overall_counter` VALUES(3, '38', 6);

-- --------------------------------------------------------

--
-- Table structure for table `dev_wct1`
--

CREATE TABLE `dev_wct1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('active','draft','passive') NOT NULL DEFAULT 'active',
  `Kategory` enum('Bar','Cantine','Company','Restaurant') DEFAULT NULL,
  `Companyname` varchar(32) DEFAULT NULL,
  `Street` varchar(32) DEFAULT NULL,
  `PoBox` int(11) DEFAULT NULL,
  `City` varchar(32) DEFAULT NULL,
  `Date` int(10) DEFAULT NULL,
  `picture` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=211 ;

--
-- Dumping data for table `dev_wct1`
--

INSERT INTO `dev_wct1` VALUES(1, 'active', 'Company', 'web updates kmu', 'Morgenacherstr. 20', 5452, 'Oberrohrdorf', 1325466061, '');
INSERT INTO `dev_wct1` VALUES(2, 'active', 'Restaurant', 'AAFES-EUR-EIA', 'Kirchheimerstr. 104', 0, 'Gr', 1326416461, '');
INSERT INTO `dev_wct1` VALUES(3, 'active', 'Cantine', 'Abel & Schafer GmbH & Co. KG', 'Schloastr. 8-12', 0, 'V', 1327626061, '');
INSERT INTO `dev_wct1` VALUES(4, 'active', 'Restaurant', 'AEG Hausgerate GmbH', 'Muggenhofer Str. 135', 0, 'N', 1326243661, '');
INSERT INTO `dev_wct1` VALUES(5, 'active', 'Restaurant', 'Alb Gold Teigwaren', 'Im Grindel 1', 0, 'Trochtelfingen', 1324515661, '');
INSERT INTO `dev_wct1` VALUES(6, 'active', 'Bar', 'Alfred Ritter GmbH & Co. KG Pers', 'Alfred Ritter-Str. 25', 0, 'Waldenbuch', 1304174724, NULL);
INSERT INTO `dev_wct1` VALUES(7, 'active', 'Cantine', 'Alnatura Produktions- und Handel', 'Darmstadter Str. 3', 0, 'Bickenbach', 1145724574, NULL);
INSERT INTO `dev_wct1` VALUES(8, 'active', 'Restaurant', 'Alten-und Pflegeheim', 'Herzogenbuscher Str. 37', 0, 'Trier', 1304174724, NULL);
INSERT INTO `dev_wct1` VALUES(9, 'active', 'Restaurant', 'Anastift Trier', 'Krahnenstr. 32', 0, 'Trier', 1326243661, NULL);
INSERT INTO `dev_wct1` VALUES(10, 'active', 'Restaurant', 'Arbeitsamt Saarlouis', 'Ludwigstr. 10', 0, 'Saarlouis', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(11, 'active', 'Restaurant', 'arotop food creation GmbH & Co K', 'Dekan-Laist-Str. 9', 0, 'Mainz', 1325466061, NULL);
INSERT INTO `dev_wct1` VALUES(12, 'active', 'Restaurant', 'Backerei-Konditorei Manfred Jung', 'Kuchenbergstr. 50', 0, 'Neunkirchen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(13, 'active', 'Restaurant', 'Badischer Winzerkeller eG', 'Zum Kaiserstuhl 6', 32767, 'Breisach am Rhein', 1326243661, NULL);
INSERT INTO `dev_wct1` VALUES(14, 'active', 'Bar', 'BASF Aktiengesellschaft', 'Carl-Bosch-Str. 38', 0, 'Ludwigshafen', 1145724574, NULL);
INSERT INTO `dev_wct1` VALUES(15, 'active', 'Restaurant', 'Bayer AG', '', 0, 'Leverkusen', 1145724574, NULL);
INSERT INTO `dev_wct1` VALUES(16, 'active', 'Restaurant', 'Bayer AG, Werk Leverkusen', '', 0, 'Leverkusen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(17, 'active', 'Bar', 'Beleuchtung & Technik', 'Kirchweg 11', 0, 'Farschweiler', 1326243661, NULL);
INSERT INTO `dev_wct1` VALUES(18, 'active', 'Cantine', 'BIB-Ulmer Spatz', 'Mainzer Str. 152-160', 0, 'Bingen am Rhein', 1094247411, NULL);
INSERT INTO `dev_wct1` VALUES(19, 'active', 'Restaurant', 'Binding-Brauerei AG', 'Darmstadter Landstr. 185', 0, 'Frankfurt', 1094247411, NULL);
INSERT INTO `dev_wct1` VALUES(20, 'active', 'Restaurant', 'Biol. Bundesanst. far Land-und F', 'Messeweg 11/12', 0, 'Braunschweig', 1325466061, NULL);
INSERT INTO `dev_wct1` VALUES(21, 'active', 'Restaurant', 'Bioland Bundesverband', 'Kaiserstr. 18', 0, 'Mainz', 1326243661, NULL);
INSERT INTO `dev_wct1` VALUES(22, 'active', 'Restaurant', 'Birkenhof Milchprodukte GmbH', 'Birkenhof', 0, 'Osterbr', 1094247411, NULL);
INSERT INTO `dev_wct1` VALUES(23, 'active', 'Restaurant', 'Bitburger Brauerei Th. Simon Gmb', 'Ramermauer 3', 32767, 'Bitburg', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(24, 'active', 'Restaurant', 'Boehringer Backmittel GmbH & Co.', 'Mainzerstr. 152-160', 0, 'Bingen', 1326243661, NULL);
INSERT INTO `dev_wct1` VALUES(25, 'active', 'Bar', 'Brauerei Ganter GmbH & Co. KG', 'Schwarzwaldstr.43', 32767, 'Freiburg i. Br.', 1325466061, NULL);
INSERT INTO `dev_wct1` VALUES(26, 'active', 'Restaurant', 'Brauerei Schwelm', 'Neumarkt 1', 32767, 'Schwelm', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(27, 'active', 'Restaurant', 'Breisgaumilch GmbH', 'Haslacher Str. 12', 0, 'Freiburg', 1145724574, NULL);
INSERT INTO `dev_wct1` VALUES(28, 'active', 'Bar', 'BSB Nahrungsmittel GmbH', 'Birkelstr.', 0, 'Weinstadt-Endersbach', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(29, 'active', 'Cantine', 'BSH Bosch und Siemens Hausgerate', '', 32767, 'Giengen/ Benz', 1325466061, NULL);
INSERT INTO `dev_wct1` VALUES(30, 'active', 'Restaurant', 'Bundesanstalt far Landwirtschaft', '', 0, 'Frankfurt/ Main', 1248324875, NULL);
INSERT INTO `dev_wct1` VALUES(31, 'active', 'Restaurant', 'Bundesanstalt far Milchforschung', 'Herrmann-Weigmann-Str. 1', 24121, 'Kiel', 1248324875, NULL);
INSERT INTO `dev_wct1` VALUES(32, 'active', 'Restaurant', 'Bundesforschungsanstalt far Erna', 'Haid-und-Neu-Str. 9', 0, 'Karlsruhe', 1248324875, NULL);
INSERT INTO `dev_wct1` VALUES(33, 'active', 'Restaurant', 'Bundesverband Naturkost Naturwar', 'Robert-Bosch-Str. 6', 0, 'H', 1248324875, NULL);
INSERT INTO `dev_wct1` VALUES(34, 'active', 'Restaurant', 'Campina GmbH, Zentrale Heilbronn', 'Wimpfener Str. 125', 0, 'Heilbronn ', 1325466061, NULL);
INSERT INTO `dev_wct1` VALUES(35, 'active', 'Restaurant', 'Carl Kankele zur Schapfenmahle G', 'Franzenhauserweg 21', 0, 'Ulm-Jungingen', 1248324875, NULL);
INSERT INTO `dev_wct1` VALUES(36, 'active', 'Bar', 'CBA GmbH', 'Konrad-Zuse-Str. 10', 0, 'Kirkel-Limbach', 1325466061, NULL);
INSERT INTO `dev_wct1` VALUES(37, 'active', 'Restaurant', 'CCS Clinic Catering Service GmbH', 'Lazarettgarten 18', 0, 'Landau', 1248324875, NULL);
INSERT INTO `dev_wct1` VALUES(38, 'active', 'Restaurant', 'Cerestar Deutschland GmbH', 'George-C.-Marshall-Str. 210', 32767, 'Krefeld', 1145724574, NULL);
INSERT INTO `dev_wct1` VALUES(39, 'active', 'Cantine', 'Chemisches Untersuchungsamt', 'Maximineracht 11a', 0, 'Trier', 1325466061, NULL);
INSERT INTO `dev_wct1` VALUES(40, 'active', 'Restaurant', 'Chemisches Untersuchungsamt Kobl', 'Neverstr.4-6', 32767, 'Koblenz', 1304174724, NULL);
INSERT INTO `dev_wct1` VALUES(41, 'active', 'Restaurant', 'Clemens & Co. GmbH', 'Rudolf-Diesel-Str. 8', 32767, 'Wittlich', 1145724574, NULL);
INSERT INTO `dev_wct1` VALUES(42, 'active', 'Bar', 'Danone GmbH', 'Heinrich-Wieland-Str. 170', 0, 'M', 1304174724, NULL);
INSERT INTO `dev_wct1` VALUES(43, 'active', 'Cantine', 'Dauner Sprudel GmbH', 'Maria-Hilf-Str. 22', 32767, 'Daun', 1145724574, NULL);
INSERT INTO `dev_wct1` VALUES(44, 'active', 'Restaurant', 'Deutsches Institut far Lebensmit', 'Prof.-vonKlitzing-Str. 7', 0, 'Quakenbr', 1248324875, NULL);
INSERT INTO `dev_wct1` VALUES(45, 'active', 'Restaurant', 'Diamantquelle Klee & Jungblut Gm', 'Am Sauerbrunnen 33', 0, 'Schwollen', 1248324875, NULL);
INSERT INTO `dev_wct1` VALUES(46, 'active', 'Restaurant', 'Diosna Dierks & Sahne GmbH', 'Sandbachstr. 1', 32767, 'Osnabr', 1248324875, NULL);
INSERT INTO `dev_wct1` VALUES(47, 'active', 'Restaurant', 'DiverseyLever', 'Morschheimer Str. 12', 0, 'Kirchheimbolanden', 1325466061, NULL);
INSERT INTO `dev_wct1` VALUES(48, 'active', 'Restaurant', 'DahlerGrruppe', 'Riedstr.', 0, 'Darmstadt', 1145724574, NULL);
INSERT INTO `dev_wct1` VALUES(49, 'active', 'Restaurant', 'Dr. Marcus GmbH', 'Geesthachter Str. 103', 0, 'Geesthacht', 1304174724, NULL);
INSERT INTO `dev_wct1` VALUES(50, 'active', 'Bar', 'Dr. Otto Suwelak Nachf. GmbH & C', 'Josef-Suwelack-Str.', 0, 'Billerbeck', 1145724574, NULL);
INSERT INTO `dev_wct1` VALUES(51, 'active', 'Restaurant', 'Dr.Oetker', 'Werkstr.', 0, 'Wittlich', 1304174724, NULL);
INSERT INTO `dev_wct1` VALUES(52, 'active', 'Restaurant', 'DreiStern Konserven & Co. KG', 'Philipp-Oehmigke-Str. 4', 0, 'Neuruppin', 1304174724, NULL);
INSERT INTO `dev_wct1` VALUES(53, 'active', 'Bar', 'E.G.O. Elektro-Geratebau GmbH', '', 1180, 'Obererdingen', 1304174724, NULL);
INSERT INTO `dev_wct1` VALUES(54, 'active', 'Cantine', 'Eckert''s Wachholder Brennerei Gm', 'Trierer Str.59', 32767, 'Tholey', 1145724574, NULL);
INSERT INTO `dev_wct1` VALUES(55, 'active', 'Restaurant', 'Eckes-GraniniGmbH & Co. KG', 'Ludwig-Eckes-Allee 6', 32767, 'Nieder-Olm', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(56, 'active', 'Restaurant', 'Ecolab GmbH & Co. OHG', 'Reisholzerstr. 38-42', 32767, 'D', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(57, 'active', 'Restaurant', 'EDNA International GmbH', 'Gollenhoferstr. 3', 0, 'Zusmarshausen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(58, 'active', 'Restaurant', 'EDNA Tiefkahlkost GmbH', 'Fernstr. 49', 0, 'Neunkirchen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(59, 'active', 'Restaurant', 'Eichbaum Brauerei AG', 'Kafertaler Straae 170', 0, 'Mannheim', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(60, 'active', 'Restaurant', 'Eigenbetrieb Abfallwirtschaft Fr', 'Berliner Allee 29', 0, 'Freiburg i. Br.', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(61, 'active', 'Bar', 'Eppers', 'Industriestr.1 b', 32767, 'Saarbr', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(62, 'active', 'Restaurant', 'erlenbacher backwaren GmbH', 'Wasserweg 39', 0, 'Gro', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(63, 'active', 'Restaurant', 'Ernst Backer GmbH & Co. KG', 'Ringstr. 55-57', 0, 'Minden', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(64, 'active', 'Bar', 'ETO Nahrungsmittel', 'Marscher Str. 17-25', 0, 'Ettlingen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(65, 'active', 'Cantine', 'Exquisa Karwendel-Werke Huber Gm', 'Karwendel Str. 6-16', 0, 'Buchloe', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(66, 'active', 'Restaurant', 'Fabry''s Fast Food e. K. ', 'Gewerbegebiet', 0, 'Dudeldorf', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(67, 'active', 'Restaurant', 'Fissler GmbH', 'Harald-Fissler-Str. 1', 0, 'Idar-Oberstein', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(68, 'active', 'Restaurant', 'Fokken & Maller GmbH', 'Am Eisenbahndock', 26700, 'Emden', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(69, 'active', 'Restaurant', 'Francois Entsorgungsbetrieb', 'Nimsstr. 27', 0, 'Rittersdorf', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(70, 'active', 'Restaurant', 'Franz Zentis GmbH & Co.', '', 32767, 'Aachen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(71, 'active', 'Restaurant', 'Fraunhofer Institut far Verfahre', 'Giggenhauser Str. 35', 0, 'Freising', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(72, 'active', 'Bar', 'Fangers Feinkost GmbH & Co', 'Einsteinstr. 132-140', 0, 'Oranienbaum bei Dessau', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(73, 'active', 'Restaurant', 'G. C. Hahn & Co.', 'Aegidienstr. 22', 23503, 'L', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(74, 'active', 'Restaurant', 'Garley Spezialitaten Brauerei', 'Sandstr. 58-60', 32767, 'Gardelegen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(75, 'active', 'Cantine', 'Gartenfrisch Jung GmbH', 'Bahnhofstr. 18', 0, 'Jagsthausen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(76, 'active', 'Restaurant', 'Gebr. Jung GmbH', 'Homburger Landstr. 602', 32767, 'Frankfurt am Main', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(77, 'active', 'Restaurant', 'Georg Breuer GmbH Food Ingredien', 'Limburgerstr. 42 A', 0, 'K', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(78, 'active', 'Bar', 'Gerolsteiner Brunnen GmbH&Co', 'Vulkanring', 0, 'Gerolstein', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(79, 'active', 'Cantine', 'Gewarzmaller GmbH', 'Klagenfurterstr. 1-3', 0, 'Stuttgart', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(80, 'active', 'Restaurant', 'Girrbach Sachsen', 'August-Horch-Str. 68', 0, 'Reinsdorf', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(81, 'active', 'Restaurant', 'Givaudan-Roure GmbH', 'Giselherstr. 11', 32767, 'Dortmund', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(82, 'active', 'Restaurant', 'Gramss GmbH', 'Laubanger 10', 32767, 'Bamberg', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(83, 'active', 'Restaurant', 'Griesson - de Beukelaer GmbH & C', 'August-Horch-Str. 23', 0, 'Polch', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(84, 'active', 'Restaurant', 'Grosswald Brauerei Bauer GmbH & ', '', 0, 'Heusweiler', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(85, 'active', 'Restaurant', 'H. Thanes Fleischwaren GmbH', 'Rudolf-Dieselstr. 11', 32767, 'Wittlich', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(86, 'active', 'Bar', 'Haribo GmbH & Co. KG', 'Hans-Riegel-Str. 1', 32767, 'Bonn', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(87, 'active', 'Restaurant', 'Hassia & Luisen Mineralquellen', 'Gieaener Str. 18-28', 32767, 'Bad Vilbel', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(88, 'active', 'Restaurant', 'HC Catering Service GmbH', 'Wackenstr. 9', 0, 'Zweibr', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(89, 'active', 'Bar', 'Heideblume Molkerei Elsdorf/Rote', 'Molkereistr. 6', 0, 'Elsdorf', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(90, 'active', 'Cantine', 'Hengstenberg GmbH & Co.', 'Mettingerstr. 109', 0, 'Esslingen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(91, 'active', 'Restaurant', 'Herbstreith & Fox KG Pektin Fabr', 'Turnstr. 37', 0, 'Neuenb', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(92, 'active', 'Restaurant', 'Hiestand Backwaren GmbH', 'Kolpingstr. 1-3', 0, 'Gerolzhofen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(93, 'active', 'Restaurant', 'Hipp GmbH & Co. Vertrieb KG', 'Georg-Hipp-Str. 7', 0, 'Pfaffenhofen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(94, 'active', 'Restaurant', 'HOBART GmbH', 'Robert-Bosch-Str. 17', 32767, 'Offenburg/ Elgersweier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(95, 'active', 'Restaurant', 'Hochland AG', 'Kemptener Str. 17', 0, 'Heimenkirch', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(96, 'active', 'Restaurant', 'Hochwald Nahrungsmittel-Werke', 'Bahnhofstr. 37-43', 32767, 'Thalfang', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(97, 'active', 'Bar', 'Holsten-Brauerei AG', 'Wolfenbatteler Str. 33', 0, 'Braunschweig', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(98, 'active', 'Restaurant', 'IMO Institut far Marktakologie G', 'Obere Laube 51-53', 0, 'Konstanz', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(99, 'active', 'Restaurant', 'Institut Fresenius', 'Im Maisel 14', 32767, 'Taunusstein', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(100, 'active', 'Bar', 'J. Bauer KG Milchverarbeitung', '', 32767, 'Wasserburg/Inn', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(101, 'active', 'Cantine', 'JohnsonDiversey GmbH & Co.oHG', 'Mallaustr. 50-56', 0, 'Mannheim', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(102, 'active', 'Restaurant', 'Juchem GmbH', 'Pramburgstr. 3', 32767, 'Eppelborn', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(103, 'active', 'Restaurant', 'Kalfany Bonbon GmbH', 'Renkenrunsstr. 14', 0, 'M', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(104, 'active', 'Restaurant', 'Kamps AG', 'Prinzenallee 11', 0, 'D', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(105, 'active', 'Restaurant', 'Karl Kahne KG (GmbH)', 'Schatzenstr. 38', 0, 'Hamburg', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(106, 'active', 'Restaurant', 'Karlsberg Brauerei  GmbH & Co KG', 'Karlsbergstr. 62', 32767, 'Homburg', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(107, 'active', 'Restaurant', 'Kath. Alten- und Pflegeheim St.-', 'Apothekergasse 6', 0, 'Bretten', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(108, 'active', 'Bar', 'Katjes FASSIN GmbH + Co. KG', 'Dechant-Spranken-Str. 53-57', 0, 'Emmerich', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(109, 'active', 'Restaurant', 'KESSKO KESSLER & COMP. GMBH & CO', 'Kanigswinterer Str. 11-21', 32767, 'Bonn', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(110, 'active', 'Restaurant', 'KEVAG', 'Schatzenstr. 80-82', 0, 'Koblenz', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(111, 'active', 'Cantine', 'Konditorei-Caf', 'Jakobstr. 2-3', 0, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(112, 'active', 'Restaurant', 'Kanigsbacher Brauerei AG', 'An der Kanigsbach 8', 32767, 'Koblenz', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(113, 'active', 'Restaurant', 'Koordination GLOBUS-Betriebe Gmb', 'Leipziger Str. 8', 0, 'St. Wendel', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(114, 'active', 'Bar', 'Kraft Foods Deutschland GmbH & C', 'Langemarckstr. 4-20', 0, 'Bremen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(115, 'active', 'Cantine', 'Krankenhaus der Barmherz. Brader', 'Nordallee 1', 32767, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(116, 'active', 'Restaurant', 'Kreisverwaltung Trier-Saarburg', 'Willy-BrandtPlatz 1', 0, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(117, 'active', 'Restaurant', 'Kreiswasserwerk Bitburg-Pram', 'Kalvarienbergstr. 4', 32767, 'Pr', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(118, 'active', 'Restaurant', 'Krombacher Brauerei', 'Hagener Str. 261', 0, 'Kreuztal', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(119, 'active', 'Restaurant', 'Langnese-Iglo GmbH', 'Luther Weg 50', 31513, 'Wunstorf', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(120, 'active', 'Restaurant', 'Life Food GmbH', 'Bebelstr. 8', 0, 'Freiburg', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(121, 'active', 'Restaurant', 'Lindemeyer GmbH & Co.', 'Neckarsulmer Str. 24', 0, 'Heilbronn a. N.', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(122, 'active', 'Bar', 'Lindt & Sprangli GmbH', 'Sasterfeldstr. 130', 32767, 'Aachen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(123, 'active', 'Restaurant', 'Lorenz Bahlsen Snack-World ', 'Siemensstr. 14', 0, 'Neu Isenburg', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(124, 'active', 'Restaurant', 'LSG Hygiene Institute GmbH', 'Dornhofstr. 40', 0, 'Neu Isenburg', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(125, 'active', 'Bar', 'Ludwig Scheid GmbH + Co.', '', 32767, 'berherrn/ Saar', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(126, 'active', 'Cantine', 'Ludwig Schokolade GmbH&Co.KG', 'Lebacherstr.1-3', 0, 'Saarlouis', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(127, 'active', 'Restaurant', 'Lukullus Lukullus', 'Hauptstr. 47', 0, 'Wallerfangen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(128, 'active', 'Restaurant', 'Madaus Ag, Abt. Aus- und Weiterb', 'Ostmerheimer Str.198', 0, 'K', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(129, 'active', 'Restaurant', 'MAJA-Maschinenfabrik', 'Tullastr. 4', 0, 'Kehl-Goldscheuer', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(130, 'active', 'Restaurant', 'Markant-Sadwest', 'Winzler-Str. 152-160', 0, 'Pirmasens', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(131, 'active', 'Restaurant', 'Martin Braun Backmittel und Esse', 'Tillystr. 17', 0, 'Hannover', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(132, 'active', 'Restaurant', 'Masterfoods GmbH', 'Industriering 17', 32767, 'Viersen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(133, 'active', 'Bar', 'Medizinaluntersuchungsamt', 'Maximineracht 11 b', 0, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(134, 'active', 'Restaurant', 'Meistermarken GmbH', 'Theodor-Heuss-Allee 8', 0, 'Bremen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(135, 'active', 'Restaurant', 'Merl Edmund Feinkost', 'Wesselinger Str. 18-20', 0, 'Br', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(136, 'active', 'Bar', 'Merziger Fruchtgetranke GmbH & C', 'Gewerbegebiet Siebend', 32767, 'Merzig', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(137, 'active', 'Cantine', 'Milch-Union Hocheifel eG', '', 0, 'Pronsfeld', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(138, 'active', 'Restaurant', 'Milupa GmbH & Co. KG', 'Bahnstr. 14-30', 0, 'Friedrichsdorf', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(139, 'active', 'Restaurant', 'Miwe Michael Wenz GmbH', 'Michael-Wenz-Str. 2-10', 0, 'Arnstein', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(140, 'active', 'Restaurant', 'Molkerei H. Strothmann GmbH', 'Hans-Boeckler-Str. 50', 0, 'G', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(141, 'active', 'Restaurant', 'Molkerei Sabbeke GmbH & Co. KG', 'Amelandsbrackenweg 131', 0, 'Gronau-Epe', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(142, 'active', 'Restaurant', 'Moselkellerei Weinbund GmbH & Co', 'Am arziger Bahnhof Gewerbegebiet', 0, 'Kinheim', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(143, 'active', 'Restaurant', 'Mahlenchemie GmbH', 'Kornkamp 40', 0, 'Ahrensburg', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(144, 'active', 'Bar', 'Maller-Brot Neufahrn GmbH & Co. ', 'Ludwig-Erhard-Str. 2-6', 0, 'Neufahrn bei M', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(145, 'active', 'Restaurant', 'National Starch & Chemical GmbH ', 'Kalkarer Str. 81', 0, 'Kleve', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(146, 'active', 'Restaurant', 'Naturmittel Begon GmbH', 'Am Tower 11', 0, 'Bitburg', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(147, 'active', 'Cantine', 'Nestle Foodservice GmbH Schulung', 'Odenwaldstr. 5-7', 0, 'Heppenheim', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(148, 'active', 'Restaurant', 'NGI-Niederrheinische Getranke-In', 'Marie-Bernays-Ring 37', 0, 'M', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(149, 'active', 'Restaurant', 'Niehoffs Vaihinger Fruchtsafte G', '', 32767, 'Lauterecken', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(150, 'active', 'Bar', 'Nordwest Getranke', 'Oldenburger Landstr. 2', 0, 'Osnabr', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(151, 'active', 'Cantine', 'Nutrinova GmbH', 'Industriepark Hachst', 0, 'Frankfurt', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(152, 'active', 'Restaurant', 'Odenwald-Konserven GmbH', 'Bahnhofstr. 31', 0, 'Breuberg', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(153, 'active', 'Restaurant', 'Onken GmbH', 'Dr. Berns-Str.. 23', 0, 'Moers', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(154, 'active', 'Restaurant', 'Parkbrauerei AG', 'Zweibrackerstr . 3-5', 32767, 'Pirmasens', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(155, 'active', 'Restaurant', 'Peppino''s Pizza', 'Niederkircherstr. 4', 0, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(156, 'active', 'Restaurant', 'Peter Mertes KG', 'Bornwiese 4', 0, 'Bernkastel-Kues', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(157, 'active', 'Restaurant', 'Philipp Born GmbH - Schokoladenf', 'Industriestr. 29', 0, 'Friedrichsdorf', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(158, 'active', 'Bar', 'PROFIL Gastronomie Planung und I', '', 0, '', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(159, 'active', 'Restaurant', 'Quint GmbH&Co.KG', 'Gewerbegebiet', 32767, 'Kenn/ Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(160, 'active', 'Restaurant', 'RANCH MASTER', 'Luther Weg 50', 0, 'Wunstorf', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(161, 'active', 'Bar', 'Rasselstein Hoesch GmbH (RHG)', 'Koblenzerstr. 141', 0, 'Andernach', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(162, 'active', 'Cantine', 'Rational AG', 'Iglinger Str. 62', 0, 'Landsberg a. Lech', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(163, 'active', 'Restaurant', 'REGINARIS AG Mineral- und Heilbr', 'Reginarisbrunnen 1', 32767, 'Mendig', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(164, 'active', 'Restaurant', 'Rhein-Main-Sieg Getranke GmbH&Co', 'Brauereistr. 42', 0, 'Bendorf', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(165, 'active', 'Restaurant', 'Riegeler Brauerei', '', 0, 'Riegel', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(166, 'active', 'Restaurant', 'Rudolf Wild GmbH & Co.KG', 'Rudolf.Wild-Str. 4-6', 0, 'Heidelberg/ Eppelheim', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(167, 'active', 'Restaurant', 'Sander Gourmet GmbH & Co. KG', 'Industriepark 12', 0, 'Wiesbaden', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(168, 'active', 'Restaurant', 'Sanitas Alpenklinik Inzell', 'Schulstr. 4', 0, 'Inzell', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(169, 'active', 'Bar', 'SATRO Milchwerk Lippstadt GmbH &', 'Wiedenbrackerstr. 80', 32767, 'Lippstadt', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(170, 'active', 'Restaurant', 'Scheffel Backwaren GmbH', 'Hattenstr. 37', 32767, 'Raubach', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(171, 'active', 'Restaurant', 'Scheffler Plant & Life', 'Am Sportplatz 3', 0, 'Leiningen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(172, 'active', 'Bar', 'Scheibel Schwarzwald-Brennerei G', 'Graner Winkel 32', 0, 'Kappelrodeck', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(173, 'active', 'Cantine', 'Schill-Malz GmbH & Co. KG', 'Ludwig-Schwamb-Str. 9-11', 0, 'Osthofen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(174, 'active', 'Restaurant', 'Schloss Veldenz GmbH & Co. KG.', 'Burgstr. 14', 0, 'Lauterecken', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(175, 'active', 'Restaurant', 'Sektkellerei Faber GmbH&Co.KG', 'Niederkircher Str. 27', 32767, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(176, 'active', 'Restaurant', 'Sektkellerei Henkell & Co.', 'Biebricher Allee 142', 0, 'Wiesbaden', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(177, 'active', 'Restaurant', 'Sektkellerei Peter Herres GmbH', 'Rudolf-Diesel-Str. 7-9', 32767, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(178, 'active', 'Restaurant', 'Sektkellerei Schloss Wachenheim ', 'Niederkircher Str. 27', 32767, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(179, 'active', 'Restaurant', 'Silesia Gerhard Henke GmbH & Co.', 'Am alten Bach 20-24', 0, 'Neuss', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(180, 'active', 'Bar', 'SMW Saar-Mosel-Winzersekt GmbH', 'Gilbertstr. 34', 0, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(181, 'active', 'Restaurant', 'Staatliche Molkerei Weihenstepha', 'Vattinger Str. 43', 0, 'Freising', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(182, 'active', 'Restaurant', 'Staatliches Institut', 'Malstatter-Str.17', 0, 'Saarbr', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(183, 'active', 'Cantine', 'Stadtwerke Trier GmbH', 'Ostallee 7-13', 0, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(184, 'active', 'Restaurant', 'Sadzucker AG', 'Maximilianstr. 10', 0, 'Mannheim', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(185, 'active', 'Restaurant', 'T.I.P. Biehl & Wagner', 'Neustr.27', 0, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(186, 'active', 'Bar', 'Tartex + Dr. Ritter GmbH', 'Hans-Bunte-Str. 8a', 0, 'Freiburg', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(187, 'active', 'Cantine', 'Teekanne GmbH', 'Kevelaerer Str. 21-23', 0, 'D', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(188, 'active', 'Restaurant', 'Theresienkrankenhaus', '', 0, 'Mannheim', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(189, 'active', 'Restaurant', 'Tiefkahlprodukte-Frozen Food Hor', 'Gutenberdring 1-5', 22825, 'Norderstedt', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(190, 'active', 'Restaurant', 'Tucher Brau Verwaltung', 'Schwabacherstr. 10', 0, 'F', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(191, 'active', 'Restaurant', 'Uldo Backmittel', 'Dornierstr. 14', 32767, 'Neu-Ulm', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(192, 'active', 'Restaurant', 'UNIFERM GmbH & Co. KG', 'Brede 4', 0, 'Werne', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(193, 'active', 'Restaurant', 'Unilever Bestfoods DeutschlandGm', 'Knorrstr. 1', 32767, 'Heilbronn a. N.', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(194, 'active', 'Bar', 'Urbacher Saamosterei', 'Puderbacherstr. 13', 0, 'Urbach', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(195, 'active', 'Restaurant', 'Verbandsgemeindeverwaltung Konz', '', 32767, 'Konz', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(196, 'active', 'Restaurant', 'Verbraucher-Zentrale NRW e.V.', 'Mittelstr. 7', 0, 'Hagen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(197, 'active', 'Bar', 'Verbraucherzentrale Rheinland-Pf', 'Johann-Philipp-Str. 3-4', 0, 'Trier', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(198, 'active', 'Cantine', 'Vorwerk Elektrowerke Stiftung & ', 'Rauental 38', 0, 'Wuppertal', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(199, 'active', 'Restaurant', 'Wagner Tiefkahlprodukte GmbH', 'Kurzer Weg 1', 0, 'Nonnweiler-Braunshausen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(200, 'active', 'Restaurant', 'WALTER RAU Lebensmittelwerke Gmb', 'Mansterstr. 9-11', 0, 'Hilter', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(201, 'active', 'Restaurant', 'Wiesheu GmbH', 'Daimlerstr. 10', 0, 'Affalterbach', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(202, 'active', 'Restaurant', 'Wild Flavour/ Ingredient Divisio', 'Am Schlangengraben 3-5', 0, 'Berlin', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(203, 'active', 'Restaurant', 'WMF Aktiengesellschaft', '', 0, 'Geisslingen/ Steige', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(204, 'active', 'Restaurant', 'Wolf Butterback GmbH & Co. KG', 'Magazinstr. 77', 0, 'F', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(205, 'active', 'Bar', 'Zamek Nahrungs-mittelfabriken Gm', 'Kappeler Str. 147-167', 0, 'D', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(206, 'active', 'Restaurant', 'Zentis GmbH & Co.', 'Jalicher Str. 177', 32767, 'Aachen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(207, 'active', 'Restaurant', 'Zimmermann-Graeff GmbH&Co.KG.', 'Marientaler Au 23', 0, 'Zell/ Mosel', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(208, 'active', 'Bar', 'Zitterwalder Brotfabrik', 'Trierer Str. 9-11', 0, 'Hallschlag', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(209, 'active', 'Cantine', 'ZOTT GmbH & Co. KG', 'Dr. Steichele Str. 4', 0, 'Mertingen', NULL, NULL);
INSERT INTO `dev_wct1` VALUES(210, 'active', 'Restaurant', 'Aachener Printen- und Schokolade', 'Borchersstr. 18', 0, 'Aachen', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dev_wct3`
--

CREATE TABLE `dev_wct3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('active','draft','passive') NOT NULL DEFAULT 'active',
  `nha` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dev_wct3`
--

INSERT INTO `dev_wct3` VALUES(1, 'active', 'ff dsfd');
INSERT INTO `dev_wct3` VALUES(2, 'active', 'dfdfdf');

-- --------------------------------------------------------

--
-- Table structure for table `dev_wct_cron`
--

CREATE TABLE `dev_wct_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule` enum('h','t','d') NOT NULL DEFAULT 'd',
  `command` text NOT NULL,
  `nextrun` int(11) NOT NULL DEFAULT '0',
  `error` text,
  `active` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_wct_cron`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_wct_fields`
--

CREATE TABLE `dev_wct_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `definition` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `def` (`definition`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=100 ;

--
-- Dumping data for table `dev_wct_fields`
--

INSERT INTO `dev_wct_fields` VALUES(1, 'varchar(32)', 'varchar(32)', '1');
INSERT INTO `dev_wct_fields` VALUES(2, 'varchar(64)', 'varchar(64)', '1');
INSERT INTO `dev_wct_fields` VALUES(3, 'varchar(128)', 'varchar(128)', '1');
INSERT INTO `dev_wct_fields` VALUES(4, 'smallint(6)', 'smallint(6)', '1');
INSERT INTO `dev_wct_fields` VALUES(5, 'date', 'int(10)', '1');
INSERT INTO `dev_wct_fields` VALUES(6, 'int(11)', 'int(11)', '1');
INSERT INTO `dev_wct_fields` VALUES(7, 'text', 'text', '1');
INSERT INTO `dev_wct_fields` VALUES(8, 'float(8,2)', 'float(8,2)', '1');
INSERT INTO `dev_wct_fields` VALUES(9, 'enum', 'enum', '1');
INSERT INTO `dev_wct_fields` VALUES(10, 'set', 'set', '1');
INSERT INTO `dev_wct_fields` VALUES(11, 'picture', 'varchar(160)', '1');
INSERT INTO `dev_wct_fields` VALUES(12, 'varchar(254)', 'varchar(254)', '1');
INSERT INTO `dev_wct_fields` VALUES(13, 'relationship', 'int(12)', '1');

-- --------------------------------------------------------

--
-- Table structure for table `dev_wct_form`
--

CREATE TABLE `dev_wct_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `t_setup` text,
  `e_setup` text,
  `r_fields` text,
  `r_table` text,
  `r_filter` text,
  `rights` int(4) DEFAULT NULL,
  `htmlview` enum('0','1') NOT NULL DEFAULT '0',
  `smail` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_wct_form`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_wct_list`
--

CREATE TABLE `dev_wct_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `t_setup` text,
  `e_setup` text,
  `o_setup` text,
  `sheme` enum('0','1') NOT NULL DEFAULT '0',
  `overlay` enum('0','1') NOT NULL DEFAULT '0',
  `headerline` enum('0','1') NOT NULL DEFAULT '1',
  `header` text,
  `headersort` text,
  `vortext` text,
  `nachtext` text,
  `sort` varchar(32) NOT NULL DEFAULT 'id',
  `sortB` enum('ASC','DESC') NOT NULL DEFAULT 'ASC',
  `searchaddon` varchar(120) DEFAULT NULL,
  `dl` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `rowcount` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `dev_wct_list`
--

INSERT INTO `dev_wct_list` VALUES(4, 'Archive', '', '<td>{date}</td><td>{title}</td><td>{comment_count}</td>', '', '<b>{date} ', '0', '1', '1', 'Datum,Artikel,Kommentare', 'date,title,comment_count', '', '', 'post_date', 'DESC', '', '0', 1);
INSERT INTO `dev_wct_list` VALUES(1, 'Demo DB', 'ce692dbe3a841250dd22cac946c379e1', '<td>{Kategory}</td><td>{City}</td><td>{Companyname}</td>', '<strong>Category:</strong> {Kategory}<br/><strong>Name:</strong> {Companyname}<br/><strong>Street:</strong> {Street}<br/><strong>City:</strong> {PoBox} {City}<br/><strong>ID:</strong> <em>{id}</em><br/>[BACK]', '<em>Overlay Demo</em><br/><br/><strong>{Companyname}</strong><br/>{Street}<br/>{PoBox} {City}', '0', '1', '1', '[wctselect field="Kategory" maintext="Category"],City,Company Name', 'Kategory,City,Companyname', '[wctsearch felder="*"]\nPlease find here the list of all companies:', 'Note: This list is on the internet available for all with number and mail, I take only not so high private data from it.', 'id', 'ASC', '', '0', 1);
INSERT INTO `dev_wct_list` VALUES(3, 'nha', '2862ef9084e49e0c1d04ceb393ca0766', NULL, NULL, NULL, '0', '', '', NULL, NULL, NULL, NULL, 'id', 'ASC', NULL, '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dev_wct_relations`
--

CREATE TABLE `dev_wct_relations` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_table` int(11) NOT NULL,
  `s_field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `t_table` int(11) NOT NULL,
  `t_field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `z_field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_wct_relations`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_wct_setup`
--

CREATE TABLE `dev_wct_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `table_id` int(11) NOT NULL,
  `t_setup` text,
  `e_setup` text,
  `o_setup` text,
  `sheme` enum('0','1') NOT NULL DEFAULT '0',
  `overlay` enum('0','1') NOT NULL DEFAULT '0',
  `headerline` enum('0','1') NOT NULL DEFAULT '1',
  `header` text,
  `headersort` text,
  `vortext` text,
  `nachtext` text,
  `sort` varchar(32) NOT NULL DEFAULT 'id',
  `sortB` enum('ASC','DESC') NOT NULL DEFAULT 'ASC',
  `searchaddon` varchar(120) DEFAULT NULL,
  `dl` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `rowcount` int(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_wct_setup`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_wpj_categories`
--

CREATE TABLE `dev_wpj_categories` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(5) unsigned NOT NULL DEFAULT '0',
  `c_title` varchar(128) NOT NULL DEFAULT '',
  `c_img` varchar(150) NOT NULL DEFAULT '',
  `c_sort` int(5) NOT NULL DEFAULT '0',
  `c_affprice` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `dev_wpj_categories`
--

INSERT INTO `dev_wpj_categories` VALUES(1, 0, 'Small Business and Website Designs', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(3, 1, 'Telecommunication Systems', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(4, 1, 'Computer Operator / Networking ', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(15, 1, 'programming languages / platforms (Linux, Windows, Unix, etc.)', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(5, 0, 'Web Development / Designer ', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(6, 5, 'Graphic, Photography and Animation', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(2, 5, 'Digital Media and Multimedia Design ', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(7, 0, 'Project Management and Solution Manager', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(8, 7, 'Data Management and System Administrator', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(9, 7, 'Sales Manager / Marketing & Promotion', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(10, 7, 'Assistant Manager  / Operations Manager', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(11, 7, 'Quality Control / Process Work Flow Analyst', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(16, 0, 'Help Desk / Medical & Technician', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(12, 16, 'Security / Production Support ', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(13, 16, 'Customer Support & Service / Call Center', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(14, 16, 'Develops and Maintains / Services & Training and Seminars ', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_categories` VALUES(17, 7, 'Software developer', 'default.gif', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dev_wpj_companies`
--

CREATE TABLE `dev_wpj_companies` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(128) NOT NULL DEFAULT '',
  `c_address` varchar(128) NOT NULL DEFAULT '',
  `c_address2` varchar(128) NOT NULL DEFAULT '',
  `c_city` varchar(128) NOT NULL DEFAULT '',
  `c_state` varchar(128) NOT NULL DEFAULT '',
  `c_zip` varchar(20) NOT NULL DEFAULT '',
  `c_phone` varchar(32) NOT NULL DEFAULT '',
  `c_fax` varchar(32) NOT NULL DEFAULT '',
  `c_url` varchar(150) NOT NULL DEFAULT '',
  `c_img` varchar(150) NOT NULL DEFAULT '',
  `c_usid` varchar(6) NOT NULL DEFAULT '',
  `c_author_ip` varchar(6) NOT NULL DEFAULT '',
  `c_author` varchar(6) NOT NULL DEFAULT '',
  `c_contact` text NOT NULL,
  `c_date_added` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_id`),
  KEY `c_name` (`c_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_wpj_companies`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_wpj_created_resumes`
--

CREATE TABLE `dev_wpj_created_resumes` (
  `cr_id` int(11) NOT NULL AUTO_INCREMENT,
  `cl_id` int(11) NOT NULL DEFAULT '0',
  `cr_made_resume` text NOT NULL,
  `cr_date` int(10) NOT NULL DEFAULT '0',
  `cr_usid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cr_id`),
  KEY `cr_id` (`cr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_wpj_created_resumes`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_wpj_job`
--

CREATE TABLE `dev_wpj_job` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `lc_id` int(11) NOT NULL DEFAULT '0',
  `l_title` varchar(128) NOT NULL DEFAULT '',
  `l_status` int(3) NOT NULL DEFAULT '0',
  `l_expire` int(3) DEFAULT NULL,
  `l_type` varchar(128) NOT NULL DEFAULT '',
  `l_company` varchar(128) NOT NULL DEFAULT '',
  `l_desctext` text NOT NULL,
  `l_requirements` text NOT NULL,
  `l_tel` varchar(32) DEFAULT NULL,
  `l_price` varchar(128) NOT NULL DEFAULT '',
  `l_typeprice` varchar(128) NOT NULL DEFAULT '',
  `l_contactinfo` mediumtext NOT NULL,
  `l_date` varchar(64) DEFAULT NULL,
  `l_email` varchar(128) NOT NULL DEFAULT '',
  `l_submitter` varchar(60) NOT NULL DEFAULT '',
  `l_usid` varchar(6) NOT NULL DEFAULT '',
  `l_town` varchar(128) NOT NULL DEFAULT '',
  `l_state` varchar(128) NOT NULL DEFAULT '',
  `l_valid` varchar(11) NOT NULL DEFAULT '',
  `l_photo` varchar(128) NOT NULL DEFAULT '',
  `l_view` int(5) NOT NULL DEFAULT '0',
  `l_author_ip` varchar(16) NOT NULL DEFAULT '',
  `l_fax` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_wpj_job`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_wpj_pictures`
--

CREATE TABLE `dev_wpj_pictures` (
  `p_img` int(11) NOT NULL AUTO_INCREMENT,
  `p_title` varchar(255) NOT NULL,
  `p_date_added` int(10) NOT NULL DEFAULT '0',
  `p_date_modified` int(10) NOT NULL DEFAULT '0',
  `pl_id` int(11) NOT NULL DEFAULT '0',
  `p_uid_owner` varchar(50) NOT NULL,
  `p_url` text NOT NULL,
  PRIMARY KEY (`p_img`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_wpj_pictures`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_wpj_price`
--

CREATE TABLE `dev_wpj_price` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_nom` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dev_wpj_price`
--

INSERT INTO `dev_wpj_price` VALUES(1, 'Hourly');
INSERT INTO `dev_wpj_price` VALUES(2, 'Annual');
INSERT INTO `dev_wpj_price` VALUES(3, 'Yearly');

-- --------------------------------------------------------

--
-- Table structure for table `dev_wpj_replies`
--

CREATE TABLE `dev_wpj_replies` (
  `rp_id` int(11) NOT NULL DEFAULT '0',
  `rl_id` int(11) NOT NULL DEFAULT '0',
  `rp_title` varchar(128) NOT NULL DEFAULT '',
  `rp_date` int(10) NOT NULL DEFAULT '0',
  `rp_submitter` varchar(60) NOT NULL DEFAULT '',
  `rp_message` text NOT NULL,
  `rp_resume` varchar(128) NOT NULL DEFAULT '',
  `rp_tele` varchar(32) NOT NULL DEFAULT '',
  `rp_email` varchar(128) NOT NULL DEFAULT '',
  `rp_usid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rp_id`),
  KEY `lid` (`rl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dev_wpj_replies`
--


-- --------------------------------------------------------

--
-- Table structure for table `dev_wpj_res_categories`
--

CREATE TABLE `dev_wpj_res_categories` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rcp_id` int(5) unsigned NOT NULL DEFAULT '0',
  `rc_title` varchar(128) NOT NULL DEFAULT '',
  `rc_img` varchar(150) NOT NULL DEFAULT '',
  `rc_sort` int(5) NOT NULL DEFAULT '0',
  `rc_affprice` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `dev_wpj_res_categories`
--

INSERT INTO `dev_wpj_res_categories` VALUES(1, 0, 'E-Commerce / Internet Technologies, ', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_res_categories` VALUES(2, 1, 'Engineering and Information Technology', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_res_categories` VALUES(3, 1, 'IT Software / System Programming, ', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_res_categories` VALUES(4, 1, 'IT Hardware / Telecommunication, ', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_res_categories` VALUES(10, 1, 'Training and Seminars', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_res_categories` VALUES(5, 0, 'Marketing & Promotion, etc...', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_res_categories` VALUES(6, 5, 'Account & Finace / Tax', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_res_categories` VALUES(7, 5, 'Coporate Planning / Consulting, etc...', 'close.gif', 0, 1);
INSERT INTO `dev_wpj_res_categories` VALUES(8, 5, 'Film & TV Produktion / Werbung', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_res_categories` VALUES(12, 0, 'Website Builder / Designer', 'open.gif', 0, 1);
INSERT INTO `dev_wpj_res_categories` VALUES(13, 12, 'Data Management and System Administrator', 'close.gif', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dev_wpj_type`
--

CREATE TABLE `dev_wpj_type` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_nom` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dev_wpj_type`
--

INSERT INTO `dev_wpj_type` VALUES(1, 'Full Time');
INSERT INTO `dev_wpj_type` VALUES(2, 'Part Time');
INSERT INTO `dev_wpj_type` VALUES(3, 'Intership');

-- --------------------------------------------------------

--
-- Table structure for table `dev_wppartner_links`
--

CREATE TABLE `dev_wppartner_links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dev_wppartner_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `gia_bang_gia`
--

CREATE TABLE `gia_bang_gia` (
  `ma_bang_gia` int(11) NOT NULL AUTO_INCREMENT,
  `ma_dich_vu` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ma_tinh_di` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ma tinh di',
  `ma_tinh_den` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Danh sach ma tinh den cach nhau bang dau phau {,}',
  `khoi_luong_tu` int(11) NOT NULL COMMENT 'gram',
  `khoi_luong_den` int(11) NOT NULL COMMENT 'gram',
  `ma_phuong_tien` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gia` decimal(20,0) NOT NULL COMMENT 'VND',
  `co_vuot_khoi_luong` int(1) DEFAULT '0' COMMENT '0/1 Gia tinh theo don vi',
  `don_vi_khoi_luong_vuot` int(10) DEFAULT NULL COMMENT 'Gia tinh theo don vi',
  `gia_toi_da_can_tren` decimal(20,0) DEFAULT NULL COMMENT 'Neu gia tinh theo don vi lon hon gia toi da thi lay gia toi da',
  `gia_cong_them_gui_sau_12h` decimal(20,0) DEFAULT NULL COMMENT 'Ap dung chuyen phat nhanh tp_hcm di ha_noi gui sau 12h',
  `gia_toi_da_can_tren_gui_sau_12h` decimal(20,0) DEFAULT NULL COMMENT 'Neu gia tinh theo don vi lon hon gia toi da thi lay gia toi da gui sau 12',
  PRIMARY KEY (`ma_bang_gia`),
  KEY `bang_gia_ma_dich_vu_fk` (`ma_dich_vu`),
  KEY `bang_gia_ma_tinh_di` (`ma_tinh_di`),
  KEY `bang_gia_ma_tinh_den` (`ma_tinh_den`(255)),
  KEY `bang_gia_ma_phuong_tien` (`ma_phuong_tien`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=313 ;

--
-- Dumping data for table `gia_bang_gia`
--

INSERT INTO `gia_bang_gia` VALUES(13, 'chuyen_phat_nhanh_hoa_toc', 'tp_hcm', ',tp_hcm,', 0, 2000, NULL, 35000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(14, 'chuyen_phat_nhanh_hoa_toc', 'tp_hcm', ',tp_hcm,', 2001, 999999999, NULL, 2200, 1, 500, 35000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(15, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',tp_hcm,', 0, 2000, NULL, 35000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(16, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',tp_hcm,', 2001, 999999999, NULL, 10000, 1, 500, 35000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(17, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ha_noi,', 0, 5000, NULL, 80000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(18, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ha_noi,', 5001, 20000, NULL, 9500, 1, 5000, 80000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(19, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ha_noi,', 20001, 100000, NULL, 9000, 1, 5000, 108500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(20, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ha_noi,', 100001, 200000, NULL, 8500, 1, 5000, 252500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(21, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ha_noi,', 200001, 500000, NULL, 8000, 1, 5000, 422500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(22, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ha_noi,', 500001, 999999999, NULL, 7500, 1, 5000, 902500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(23, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 0, 10000, 'tau_hoa', 60000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(24, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 10001, 100000, 'tau_hoa', 3500, 1, 10000, 60000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(25, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 100001, 200000, 'tau_hoa', 3000, 1, 10000, 91500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(26, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 200001, 500000, 'tau_hoa', 2800, 1, 10000, 121500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(27, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 500001, 2000000, 'tau_hoa', 2500, 1, 10000, 205500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(28, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 2000001, 999999999, 'tau_hoa', 2300, 1, 10000, 580500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(29, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 0, 10000, 'xe_container', 80000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(30, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 10001, 100000, 'xe_container', 5300, 1, 10000, 60000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(31, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 100001, 200000, 'xe_container', 5000, 1, 10000, 91500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(32, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 200001, 500000, 'xe_container', 4700, 1, 10000, 121500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(33, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 500001, 2000000, 'xe_container', 4500, 1, 10000, 205500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(34, 'chuyen_bang_duong_bo', 'tp_hcm', ',ha_noi,', 2000001, 999999999, 'xe_container', 4000, 1, 10000, 580500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(35, 'chuyen_bang_duong_bo', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 0, 10000, NULL, 90000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(36, 'chuyen_bang_duong_bo', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 10001, 100000, NULL, 5300, 1, 10000, 90000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(37, 'chuyen_bang_duong_bo', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 100001, 200000, NULL, 5000, 1, 10000, 137700, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(38, 'chuyen_bang_duong_bo', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 200001, 500000, NULL, 4700, 1, 10000, 187700, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(39, 'chuyen_bang_duong_bo', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 500001, 2000000, NULL, 4500, 1, 10000, 328700, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(40, 'chuyen_bang_duong_bo', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 2000001, 999999999, NULL, 4000, 1, 10000, 1003700, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(41, 'chuyen_bang_duong_bo', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 0, 10000, NULL, 90000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(42, 'chuyen_bang_duong_bo', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 10001, 100000, NULL, 5500, 1, 10000, 90000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(43, 'chuyen_bang_duong_bo', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 100001, 200000, NULL, 5200, 1, 10000, 139500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(44, 'chuyen_bang_duong_bo', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 200001, 500000, NULL, 4800, 1, 10000, 191500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(45, 'chuyen_bang_duong_bo', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 500001, 2000000, NULL, 4600, 1, 10000, 335500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(46, 'chuyen_bang_duong_bo', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 2000001, 999999999, NULL, 4200, 1, 10000, 1025500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(47, 'chuyen_bang_duong_bo', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 0, 10000, NULL, 100000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(48, 'chuyen_bang_duong_bo', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 10001, 100000, NULL, 8000, 1, 10000, 100000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(49, 'chuyen_bang_duong_bo', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 100001, 200000, NULL, 7500, 1, 10000, 172000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(50, 'chuyen_bang_duong_bo', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 200001, 500000, NULL, 7000, 1, 10000, 247000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(51, 'chuyen_bang_duong_bo', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 500001, 2000000, NULL, 6500, 1, 10000, 457000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(52, 'chuyen_bang_duong_bo', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 2000001, 999999999, NULL, 6000, 1, 10000, 1432000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(53, 'chuyen_bang_duong_bo', 'tp_hcm', ',da_nang,', 0, 10000, 'tau_hoa', 50000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(54, 'chuyen_bang_duong_bo', 'tp_hcm', ',da_nang,', 10001, 100000, 'tau_hoa', 3500, 1, 10000, 50000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(55, 'chuyen_bang_duong_bo', 'tp_hcm', ',da_nang,', 100001, 200000, 'tau_hoa', 3000, 1, 10000, 81500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(56, 'chuyen_bang_duong_bo', 'tp_hcm', ',da_nang,', 200001, 1000000, 'tau_hoa', 2800, 1, 10000, 111500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(57, 'chuyen_bang_duong_bo', 'tp_hcm', ',da_nang,', 1000001, 999999999, 'tau_hoa', 2500, 1, 10000, 335500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(58, 'chuyen_bang_duong_bo', 'tp_hcm', ',da_nang,', 0, 10000, 'xe_container', 60000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(59, 'chuyen_bang_duong_bo', 'tp_hcm', ',da_nang,', 10001, 100000, 'xe_container', 4000, 1, 10000, 50000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(60, 'chuyen_bang_duong_bo', 'tp_hcm', ',da_nang,', 100001, 200000, 'xe_container', 3600, 1, 10000, 81500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(61, 'chuyen_bang_duong_bo', 'tp_hcm', ',da_nang,', 200001, 1000000, 'xe_container', 3400, 1, 10000, 111500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(62, 'chuyen_bang_duong_bo', 'tp_hcm', ',da_nang,', 1000001, 999999999, 'xe_container', 3200, 1, 10000, 335500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(63, 'chuyen_bang_duong_bo', 'tp_hcm', ',khanh_hoa,', 0, 10000, NULL, 40000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(64, 'chuyen_bang_duong_bo', 'tp_hcm', ',khanh_hoa,', 10001, 100000, NULL, 3000, 1, 10000, 40000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(65, 'chuyen_bang_duong_bo', 'tp_hcm', ',khanh_hoa,', 100001, 200000, NULL, 2800, 1, 10000, 67000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(66, 'chuyen_bang_duong_bo', 'tp_hcm', ',khanh_hoa,', 200001, 1000000, NULL, 2500, 1, 10000, 95000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(67, 'chuyen_bang_duong_bo', 'tp_hcm', ',khanh_hoa,', 1000001, 999999999, NULL, 2200, 1, 10000, 295000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(68, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_dinh,gia_lai,dak_lak,kom_tum,lam_dong,', 0, 10000, NULL, 60000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(69, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_dinh,gia_lai,dak_lak,kom_tum,lam_dong,', 10001, 100000, NULL, 3500, 1, 10000, 60000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(70, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_dinh,gia_lai,dak_lak,kom_tum,lam_dong,', 100001, 200000, NULL, 3300, 1, 10000, 91500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(71, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_dinh,gia_lai,dak_lak,kom_tum,lam_dong,', 200001, 1000000, NULL, 3000, 1, 10000, 124500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(72, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_dinh,gia_lai,dak_lak,kom_tum,lam_dong,', 1000001, 999999999, NULL, 2500, 1, 10000, 364500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(73, 'chuyen_bang_duong_bo', 'tp_hcm', ',nghe_an,ha_tinh,quang_binh,', 0, 10000, NULL, 90000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(74, 'chuyen_bang_duong_bo', 'tp_hcm', ',nghe_an,ha_tinh,quang_binh,', 10001, 100000, NULL, 5300, 1, 10000, 90000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(75, 'chuyen_bang_duong_bo', 'tp_hcm', ',nghe_an,ha_tinh,quang_binh,', 100001, 200000, NULL, 5000, 1, 10000, 137700, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(76, 'chuyen_bang_duong_bo', 'tp_hcm', ',nghe_an,ha_tinh,quang_binh,', 200001, 1000000, NULL, 4500, 1, 10000, 187700, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(77, 'chuyen_bang_duong_bo', 'tp_hcm', ',nghe_an,ha_tinh,quang_binh,', 1000001, 999999999, NULL, 4300, 1, 10000, 547700, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(78, 'chuyen_bang_duong_bo', 'tp_hcm', ',hue,quang_nam,quang_ngai,phu_yen,quang_tri,dak_nong,', 0, 10000, NULL, 80000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(79, 'chuyen_bang_duong_bo', 'tp_hcm', ',hue,quang_nam,quang_ngai,phu_yen,quang_tri,dak_nong,', 10001, 100000, NULL, 5000, 1, 10000, 80000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(80, 'chuyen_bang_duong_bo', 'tp_hcm', ',hue,quang_nam,quang_ngai,phu_yen,quang_tri,dak_nong,', 100001, 200000, NULL, 4600, 1, 10000, 125000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(81, 'chuyen_bang_duong_bo', 'tp_hcm', ',hue,quang_nam,quang_ngai,phu_yen,quang_tri,dak_nong,', 200001, 1000000, NULL, 4300, 1, 10000, 171000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(82, 'chuyen_bang_duong_bo', 'tp_hcm', ',hue,quang_nam,quang_ngai,phu_yen,quang_tri,dak_nong,', 1000001, 999999999, NULL, 4000, 1, 10000, 515000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(83, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_duong,dong_nai,vung_tau,', 0, 10000, NULL, 50000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(84, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_duong,dong_nai,vung_tau,', 10001, 100000, NULL, 3000, 1, 10000, 50000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(85, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_duong,dong_nai,vung_tau,', 100001, 200000, NULL, 2500, 1, 10000, 77000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(86, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_duong,dong_nai,vung_tau,', 200001, 1000000, NULL, 2200, 1, 10000, 102000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(87, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_duong,dong_nai,vung_tau,', 1000001, 999999999, NULL, 1800, 1, 10000, 278000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(88, 'chuyen_bang_duong_bo', 'tp_hcm', ',can_tho,tien_giang,long_an,an_giang,', 0, 10000, NULL, 60000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(89, 'chuyen_bang_duong_bo', 'tp_hcm', ',can_tho,tien_giang,long_an,an_giang,', 10001, 100000, NULL, 3500, 1, 10000, 60000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(90, 'chuyen_bang_duong_bo', 'tp_hcm', ',can_tho,tien_giang,long_an,an_giang,', 100001, 200000, NULL, 3200, 1, 10000, 91500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(91, 'chuyen_bang_duong_bo', 'tp_hcm', ',can_tho,tien_giang,long_an,an_giang,', 200001, 1000000, NULL, 3000, 1, 10000, 123500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(92, 'chuyen_bang_duong_bo', 'tp_hcm', ',can_tho,tien_giang,long_an,an_giang,', 1000001, 999999999, NULL, 2800, 1, 10000, 363500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(93, 'chuyen_bang_duong_bo', 'tp_hcm', ',ca_mau,kien_giang,dong_thap,binh_thuan,', 0, 10000, NULL, 60000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(94, 'chuyen_bang_duong_bo', 'tp_hcm', ',ca_mau,kien_giang,dong_thap,binh_thuan,', 10001, 100000, NULL, 3600, 1, 10000, 60000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(95, 'chuyen_bang_duong_bo', 'tp_hcm', ',ca_mau,kien_giang,dong_thap,binh_thuan,', 100001, 200000, NULL, 3300, 1, 10000, 92400, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(96, 'chuyen_bang_duong_bo', 'tp_hcm', ',ca_mau,kien_giang,dong_thap,binh_thuan,', 200001, 1000000, NULL, 3100, 1, 10000, 125400, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(97, 'chuyen_bang_duong_bo', 'tp_hcm', ',ca_mau,kien_giang,dong_thap,binh_thuan,', 1000001, 999999999, NULL, 2900, 1, 10000, 373400, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(98, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_phuoc,ninh_thuan,tay_ninh,', 0, 10000, NULL, 60000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(99, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_phuoc,ninh_thuan,tay_ninh,', 10001, 100000, NULL, 4300, 1, 10000, 60000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(100, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_phuoc,ninh_thuan,tay_ninh,', 100001, 200000, NULL, 3800, 1, 10000, 98700, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(101, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_phuoc,ninh_thuan,tay_ninh,', 200001, 1000000, NULL, 3500, 1, 10000, 136700, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(102, 'chuyen_bang_duong_bo', 'tp_hcm', ',binh_phuoc,ninh_thuan,tay_ninh,', 1000001, 999999999, NULL, 3200, 1, 10000, 416700, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(103, 'chuyen_bang_duong_bo', 'tp_hcm', ',bac_lieu,tra_vinh,soc_trang,', 0, 10000, NULL, 70000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(104, 'chuyen_bang_duong_bo', 'tp_hcm', ',bac_lieu,tra_vinh,soc_trang,', 10001, 100000, NULL, 4500, 1, 10000, 70000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(105, 'chuyen_bang_duong_bo', 'tp_hcm', ',bac_lieu,tra_vinh,soc_trang,', 100001, 200000, NULL, 4000, 1, 10000, 110500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(106, 'chuyen_bang_duong_bo', 'tp_hcm', ',bac_lieu,tra_vinh,soc_trang,', 200001, 1000000, NULL, 3700, 1, 10000, 150500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(107, 'chuyen_bang_duong_bo', 'tp_hcm', ',bac_lieu,tra_vinh,soc_trang,', 1000001, 999999999, NULL, 3500, 1, 10000, 446500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(108, 'chuyen_bang_duong_bo', 'tp_hcm', ',hau_giang,vinh_long,ben_tre,', 0, 10000, NULL, 60000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(109, 'chuyen_bang_duong_bo', 'tp_hcm', ',hau_giang,vinh_long,ben_tre,', 10001, 100000, NULL, 3800, 1, 10000, 60000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(110, 'chuyen_bang_duong_bo', 'tp_hcm', ',hau_giang,vinh_long,ben_tre,', 100001, 200000, NULL, 3500, 1, 10000, 94200, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(111, 'chuyen_bang_duong_bo', 'tp_hcm', ',hau_giang,vinh_long,ben_tre,', 200001, 1000000, NULL, 3200, 1, 10000, 129200, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(112, 'chuyen_bang_duong_bo', 'tp_hcm', ',hau_giang,vinh_long,ben_tre,', 1000001, 999999999, NULL, 3000, 1, 10000, 385200, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(113, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 0, 5000, NULL, 100000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(114, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 5001, 20000, NULL, 10500, 1, 5000, 100000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(115, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 20001, 100000, NULL, 10000, 1, 5000, 131500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(116, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 100001, 200000, NULL, 9500, 1, 5000, 291500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(117, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 200001, 500000, NULL, 9000, 1, 5000, 481500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(118, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',lang_son,lai_chau,cao_bang,son_lai,yen_bai,tuyen_quang,ha_giang,dien_bien,lao_cai,bac_kan,bac_giang,', 500001, 999999999, NULL, 8500, 1, 5000, 1021500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(119, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 0, 5000, NULL, 90000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(120, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 5001, 20000, NULL, 9500, 1, 5000, 90000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(121, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 20001, 100000, NULL, 9500, 1, 5000, 118500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(122, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 100001, 200000, NULL, 9000, 1, 5000, 270500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(123, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 200001, 500000, NULL, 8500, 1, 5000, 450500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(124, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hoa_binh,vinh_phuc,ninh_binh,thai_nguyen,bac_ninh,ha_nam,hung_yen,', 500001, 999999999, NULL, 8000, 1, 5000, 960500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(125, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 0, 5000, NULL, 90000, 0, 0, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(126, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 5001, 20000, NULL, 10000, 1, 5000, 90000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(127, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 20001, 100000, NULL, 9500, 1, 5000, 120000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(128, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 100001, 200000, NULL, 9000, 1, 5000, 272000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(129, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 200001, 500000, NULL, 8000, 1, 5000, 452000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(130, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hai_phong,hai_duong,quang_ninh,nam_dinh,thai_binh,thanh_hoa,ha_tay,phu_tho,', 500001, 999999999, NULL, 7500, 1, 5000, 932000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(131, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',da_nang,', 0, 5000, NULL, 80000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(132, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',da_nang,', 5001, 20000, NULL, 8500, 1, 5000, 80000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(133, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',da_nang,', 20001, 100000, NULL, 8000, 1, 5000, 105500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(134, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',da_nang,', 100001, 200000, NULL, 7500, 1, 5000, 233500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(135, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',da_nang,', 200001, 500000, NULL, 7000, 1, 5000, 383500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(136, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',da_nang,', 500001, 999999999, NULL, 6500, 1, 5000, 803500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(137, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',khanh_hoa,', 0, 5000, NULL, 60000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(138, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',khanh_hoa,', 5001, 20000, NULL, 5000, 1, 5000, 60000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(139, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',khanh_hoa,', 20001, 100000, NULL, 4500, 1, 5000, 75000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(140, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',khanh_hoa,', 100001, 200000, NULL, 4000, 1, 5000, 147000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(141, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',khanh_hoa,', 200001, 500000, NULL, 3500, 1, 5000, 227000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(142, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',khanh_hoa,', 500001, 999999999, NULL, 3000, 1, 5000, 437000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(143, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_dinh,gia_lai,dak_lak,kom_tum,lam_dong,', 0, 5000, NULL, 70000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(144, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_dinh,gia_lai,dak_lak,kom_tum,lam_dong,', 5001, 20000, NULL, 6000, 1, 5000, 70000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(145, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_dinh,gia_lai,dak_lak,kom_tum,lam_dong,', 20001, 100000, NULL, 5700, 1, 5000, 88000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(146, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_dinh,gia_lai,dak_lak,kom_tum,lam_dong,', 100001, 200000, NULL, 5400, 1, 5000, 179200, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(147, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_dinh,gia_lai,dak_lak,kom_tum,lam_dong,', 200001, 500000, NULL, 5100, 1, 5000, 287200, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(148, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_dinh,gia_lai,dak_lak,kom_tum,lam_dong,', 500001, 999999999, NULL, 5000, 1, 5000, 593200, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(149, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',nghe_an,ha_tinh,quang_binh,', 0, 5000, NULL, 95000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(150, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',nghe_an,ha_tinh,quang_binh,', 5001, 20000, NULL, 9500, 1, 5000, 95000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(151, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',nghe_an,ha_tinh,quang_binh,', 20001, 100000, NULL, 9000, 1, 5000, 123500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(152, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',nghe_an,ha_tinh,quang_binh,', 100001, 200000, NULL, 8500, 1, 5000, 267500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(153, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',nghe_an,ha_tinh,quang_binh,', 200001, 500000, NULL, 8000, 1, 5000, 437500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(154, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',nghe_an,ha_tinh,quang_binh,', 500001, 999999999, NULL, 7500, 1, 5000, 917500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(155, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hue,quang_nam,quang_ngai,phu_yen,quang_tri,dak_nong,', 0, 5000, NULL, 90000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(156, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hue,quang_nam,quang_ngai,phu_yen,quang_tri,dak_nong,', 5001, 20000, NULL, 9000, 1, 5000, 90000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(157, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hue,quang_nam,quang_ngai,phu_yen,quang_tri,dak_nong,', 20001, 100000, NULL, 8500, 1, 5000, 117000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(158, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hue,quang_nam,quang_ngai,phu_yen,quang_tri,dak_nong,', 100001, 200000, NULL, 8000, 1, 5000, 253000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(159, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hue,quang_nam,quang_ngai,phu_yen,quang_tri,dak_nong,', 200001, 500000, NULL, 7500, 1, 5000, 413000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(160, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hue,quang_nam,quang_ngai,phu_yen,quang_tri,dak_nong,', 500001, 999999999, NULL, 7000, 1, 5000, 863000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(161, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_duong,dong_nai,vung_tau,', 0, 5000, NULL, 60000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(162, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_duong,dong_nai,vung_tau,', 5001, 20000, NULL, 4500, 1, 5000, 60000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(163, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_duong,dong_nai,vung_tau,', 20001, 100000, NULL, 4000, 1, 5000, 73500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(164, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_duong,dong_nai,vung_tau,', 100001, 200000, NULL, 3500, 1, 5000, 137500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(165, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_duong,dong_nai,vung_tau,', 200001, 500000, NULL, 3000, 1, 5000, 207500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(166, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_duong,dong_nai,vung_tau,', 500001, 999999999, NULL, 2800, 1, 5000, 387500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(167, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',can_tho,tien_giang,long_an,an_giang,', 0, 5000, NULL, 70000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(168, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',can_tho,tien_giang,long_an,an_giang,', 5001, 20000, NULL, 5000, 1, 5000, 70000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(169, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',can_tho,tien_giang,long_an,an_giang,', 20001, 100000, NULL, 4500, 1, 5000, 85000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(170, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',can_tho,tien_giang,long_an,an_giang,', 100001, 200000, NULL, 4000, 1, 5000, 157000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(171, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',can_tho,tien_giang,long_an,an_giang,', 200001, 500000, NULL, 3500, 1, 5000, 237000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(172, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',can_tho,tien_giang,long_an,an_giang,', 500001, 999999999, NULL, 3200, 1, 5000, 447000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(173, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ca_mau,kien_giang,dong_thap,binh_thuan,', 0, 5000, NULL, 70000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(174, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ca_mau,kien_giang,dong_thap,binh_thuan,', 5001, 20000, NULL, 5500, 1, 5000, 70000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(175, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ca_mau,kien_giang,dong_thap,binh_thuan,', 20001, 100000, NULL, 5000, 1, 5000, 86500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(176, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ca_mau,kien_giang,dong_thap,binh_thuan,', 100001, 200000, NULL, 4500, 1, 5000, 166500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(177, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ca_mau,kien_giang,dong_thap,binh_thuan,', 200001, 500000, NULL, 4000, 1, 5000, 256500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(178, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',ca_mau,kien_giang,dong_thap,binh_thuan,', 500001, 999999999, NULL, 3500, 1, 5000, 496500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(179, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_phuoc,ninh_thuan,tay_ninh,', 0, 5000, NULL, 70000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(180, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_phuoc,ninh_thuan,tay_ninh,', 5001, 20000, NULL, 5500, 1, 5000, 70000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(181, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_phuoc,ninh_thuan,tay_ninh,', 20001, 100000, NULL, 5000, 1, 5000, 86500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(182, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_phuoc,ninh_thuan,tay_ninh,', 100001, 200000, NULL, 4800, 1, 5000, 166500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(183, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_phuoc,ninh_thuan,tay_ninh,', 200001, 500000, NULL, 4500, 1, 5000, 262500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(184, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',binh_phuoc,ninh_thuan,tay_ninh,', 500001, 999999999, NULL, 4000, 1, 5000, 532500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(185, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',bac_lieu,tra_vinh,soc_trang,', 0, 5000, NULL, 80000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(186, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',bac_lieu,tra_vinh,soc_trang,', 5001, 20000, NULL, 6000, 1, 5000, 80000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(187, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',bac_lieu,tra_vinh,soc_trang,', 20001, 100000, NULL, 5500, 1, 5000, 98000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(188, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',bac_lieu,tra_vinh,soc_trang,', 100001, 200000, NULL, 5000, 1, 5000, 186000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(189, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',bac_lieu,tra_vinh,soc_trang,', 200001, 500000, NULL, 4800, 1, 5000, 286000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(190, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',bac_lieu,tra_vinh,soc_trang,', 500001, 999999999, NULL, 4500, 1, 5000, 574000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(191, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hau_giang,vinh_long,ben_tre,', 0, 5000, NULL, 70000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(192, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hau_giang,vinh_long,ben_tre,', 5001, 20000, NULL, 5500, 1, 5000, 70000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(193, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hau_giang,vinh_long,ben_tre,', 20001, 100000, NULL, 5000, 1, 5000, 86500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(194, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hau_giang,vinh_long,ben_tre,', 100001, 200000, NULL, 4500, 1, 5000, 166500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(195, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hau_giang,vinh_long,ben_tre,', 200001, 500000, NULL, 4000, 1, 5000, 256500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(196, 'chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', ',hau_giang,vinh_long,ben_tre,', 500001, 999999999, NULL, 3800, 1, 5000, 496500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(197, 'chuyen_phat_nhanh_hoa_toc', 'tp_hcm', ',ha_noi,da_nang,', 0, 2000, NULL, 95000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(198, 'chuyen_phat_nhanh_hoa_toc', 'tp_hcm', ',ha_noi,da_nang,', 2001, 999999999, NULL, 12000, 1, 500, 95000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(199, 'chuyen_phat_nhanh_hoa_toc', 'tp_hcm', ',hai_phong,', 0, 2000, NULL, 115000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(200, 'chuyen_phat_nhanh_hoa_toc', 'tp_hcm', ',hai_phong,', 2001, 999999999, NULL, 14000, 1, 500, 115000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(201, 'chuyen_phat_nhanh_hoa_toc', 'tp_hcm', ',binh_duong,dong_nai,', 0, 2000, NULL, 110000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(202, 'chuyen_phat_nhanh_hoa_toc', 'tp_hcm', ',binh_duong,dong_nai,', 2001, 999999999, NULL, 6000, 1, 500, 110000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(203, 'chuyen_phat_nhanh_hoa_toc', 'tp_hcm', ',vung_tau,can_tho,', 0, 2000, NULL, 70000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(204, 'chuyen_phat_nhanh_hoa_toc', 'tp_hcm', ',vung_tau,can_tho,', 2001, 999999999, NULL, 7000, 1, 500, 70000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(205, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',ha_noi,', 0, 2000, NULL, 35000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(206, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',ha_noi,', 2001, 999999999, NULL, 10000, 1, 500, 35000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(207, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',da_nang,', 0, 2000, NULL, 35000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(208, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',da_nang,', 2001, 999999999, NULL, 8500, 1, 500, 35000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(209, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',binh_dinh,nha_trang,', 0, 2000, NULL, 30000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(210, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',binh_dinh,nha_trang,', 2001, 999999999, NULL, 9000, 1, 500, 30000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(211, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',can_tho,tien_giang,an_giang,', 0, 2000, NULL, 25000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(212, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',can_tho,tien_giang,an_giang,', 2001, 999999999, NULL, 5500, 1, 500, 25000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(213, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',dong_nai,binh_duong,vung_tau,', 0, 2000, NULL, 30000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(214, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',dong_nai,binh_duong,vung_tau,', 2001, 999999999, NULL, 6000, 1, 500, 30000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(215, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',phan_thiet,dak_lak,lam_dong,', 0, 2000, NULL, 30000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(216, 'chuyen_phat_nhanh_truoc_9h', 'tp_hcm', ',phan_thiet,dak_lak,lam_dong,', 2001, 999999999, NULL, 6500, 1, 500, 30000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(228, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 0, 50, NULL, 7600, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(229, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 51, 100, NULL, 8000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(230, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 101, 250, NULL, 10000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(231, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 251, 500, NULL, 13000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(232, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 501, 1000, NULL, 16000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(233, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 1001, 1500, NULL, 18500, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(234, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 1501, 2000, NULL, 21000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(235, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 2001, 30000, NULL, 1600, 1, 500, 21000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(236, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 30001, 100000, NULL, 2500, 1, 30000, 110600, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(237, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 100001, 300000, NULL, 2400, 1, 30000, 118100, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(238, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 300001, 500000, NULL, 2100, 1, 30000, 134900, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(239, 'chuyen_phat_nhanh', 'tp_hcm', ',tp_hcm,', 500001, 999999999, NULL, 1800, 1, 30000, 149600, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(240, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 0, 50, NULL, 11000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(241, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 51, 100, NULL, 14500, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(242, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 101, 250, NULL, 21000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(243, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 251, 500, NULL, 26000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(244, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 501, 1000, NULL, 39000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(245, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 1001, 1500, NULL, 49000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(246, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 1501, 2000, NULL, 54000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(247, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 2001, 30000, NULL, 5500, 1, 500, 54000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(248, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 30001, 100000, NULL, 10000, 1, 30000, 362000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(249, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 100001, 300000, NULL, 9500, 1, 30000, 392000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(250, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 300001, 500000, NULL, 9000, 1, 30000, 458500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(251, 'chuyen_phat_nhanh', 'tp_hcm', ',dak_lak,gia_lai,lam_dong,khanh_hoa,binh_dinh,ca_mau,phu_yen,', 500001, 999999999, NULL, 8000, 1, 30000, 521500, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(252, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 0, 50, NULL, 9500, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(253, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 51, 100, NULL, 13000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(254, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 101, 250, NULL, 19000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(255, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 251, 500, NULL, 26000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(256, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 501, 1000, NULL, 38000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(257, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 1001, 1500, NULL, 47000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(258, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 1501, 2000, NULL, 56000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(259, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 2001, 30000, NULL, 7750, 1, 500, 56000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(260, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 30001, 100000, NULL, 15400, 1, 30000, 490000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(261, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 100001, 300000, NULL, 15200, 1, 30000, 536200, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(262, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 300001, 500000, NULL, 15000, 1, 30000, 642600, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(263, 'chuyen_phat_nhanh', 'tp_hcm', ',da_nang,', 500001, 999999999, NULL, 14800, 1, 30000, 747600, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(264, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 0, 50, NULL, 9500, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(265, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 51, 100, NULL, 13000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(266, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 101, 250, NULL, 19000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(267, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 251, 500, NULL, 26000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(268, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 501, 1000, NULL, 38000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(269, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 1001, 1500, NULL, 47000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(270, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 1501, 2000, NULL, 56000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(271, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 2001, 30000, NULL, 8750, 1, 500, 56000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(272, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 30001, 100000, NULL, 16400, 1, 30000, 546000, 18900, 546000);
INSERT INTO `gia_bang_gia` VALUES(273, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 100001, 300000, NULL, 16200, 1, 30000, 595200, 18700, 602700);
INSERT INTO `gia_bang_gia` VALUES(274, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 300001, 500000, NULL, 16000, 1, 30000, 708600, 18500, 733600);
INSERT INTO `gia_bang_gia` VALUES(275, 'chuyen_phat_nhanh', 'tp_hcm', ',ha_noi,', 500001, 999999999, NULL, 15800, 1, 30000, 820600, 18300, 863100);
INSERT INTO `gia_bang_gia` VALUES(289, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 0, 50, NULL, 11000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(290, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 51, 100, NULL, 14000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(291, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 101, 250, NULL, 19000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(292, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 251, 500, NULL, 25000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(293, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 501, 1000, NULL, 35000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(294, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 1001, 1500, NULL, 44000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(295, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 1501, 2000, NULL, 52000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(296, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 2001, 30000, NULL, 4800, 1, 500, 52000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(297, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 30001, 100000, NULL, 9000, 1, 30000, 320800, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(298, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 100001, 300000, NULL, 8500, 1, 30000, 347800, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(299, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 300001, 500000, NULL, 8300, 1, 30000, 407300, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(300, 'chuyen_phat_nhanh', 'tp_hcm', ',den_300km,', 500001, 999999999, NULL, 7700, 1, 30000, 465400, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(301, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 0, 50, NULL, 12000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(302, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 51, 100, NULL, 15000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(303, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 101, 250, NULL, 22000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(304, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 251, 500, NULL, 29000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(305, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 501, 1000, NULL, 42000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(306, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 1001, 1500, NULL, 54000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(307, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 1501, 2000, NULL, 63000, 0, NULL, NULL, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(308, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 2001, 30000, NULL, 8950, 1, 500, 63000, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(309, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 30001, 100000, NULL, 17800, 1, 30000, 564200, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(310, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 100001, 300000, NULL, 17600, 1, 30000, 617600, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(311, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 300001, 500000, NULL, 17300, 1, 30000, 740800, NULL, NULL);
INSERT INTO `gia_bang_gia` VALUES(312, 'chuyen_phat_nhanh', 'tp_hcm', ',tren_300km,', 500001, 999999999, NULL, 17100, 1, 30000, 861900, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gia_bang_ke_no`
--

CREATE TABLE `gia_bang_ke_no` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `thang` int(2) DEFAULT NULL,
  `nam` int(4) DEFAULT NULL,
  `ma_khach_hang` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `so_tien` int(20) DEFAULT NULL,
  `nguoi_thu_tien` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ghi_chu` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `da_thu` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `gia_bang_ke_no`
--

INSERT INTO `gia_bang_ke_no` VALUES(1, 9, 2012, 'AA11111', NULL, 'Thien Trang', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gia_chuc_vu`
--

CREATE TABLE `gia_chuc_vu` (
  `ma_tinh_di` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `giam_doc` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ke_toan_truong` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ke_toan_cong_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ke_toan_du_lieu` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lien_he` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ma_tinh_di`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gia_chuc_vu`
--

INSERT INTO `gia_chuc_vu` VALUES('tp_hcm', '', '', 'Phan Phạm Thiên Trang', 'Thiều Thiên Nga', '9480325');

-- --------------------------------------------------------

--
-- Table structure for table `gia_dang_ky_van_chuyen`
--

CREATE TABLE `gia_dang_ky_van_chuyen` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ten_lien_he` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten_cong_ty` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dien_thoai` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noi_dung` text COLLATE utf8_unicode_ci,
  `ma_tinh_di` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_tinh_den` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `maketime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `gia_dang_ky_van_chuyen`
--

INSERT INTO `gia_dang_ky_van_chuyen` VALUES(4, 'Vu Dai Loi', NULL, '3434545', 'vl@dd.com', 'http://nothing', 'Yeu cau van chuyen', NULL, NULL, 0, '0000-00-00 00:00:00');
INSERT INTO `gia_dang_ky_van_chuyen` VALUES(2, 'Công Ty Cổ Phần Gentraco', NULL, '0944978892', 'tranchaulong@gmail.com', 'http://nothing', 'Hello', NULL, NULL, 0, '0000-00-00 00:00:00');
INSERT INTO `gia_dang_ky_van_chuyen` VALUES(3, 'Công Ty Cổ Phần Lương Thanh Nhã', NULL, '0944978892', 'tranchaulong@gmail.com', 'http://nothing', 'Đây là nội dung', NULL, NULL, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gia_dich_vu`
--

CREATE TABLE `gia_dich_vu` (
  `ma_dich_vu` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ten_dich_vu` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thoi_gian_van_chuyen` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mo_ta` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `la_dich_vu_cong_them` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '0/1',
  `gia_cong_them` decimal(20,0) DEFAULT NULL COMMENT 'VND',
  `ti_le_phu_phi` double DEFAULT '15' COMMENT '%',
  `vat` double DEFAULT '10' COMMENT '%',
  PRIMARY KEY (`ma_dich_vu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gia_dich_vu`
--

INSERT INTO `gia_dich_vu` VALUES('chuyen_bang_duong_bo', 'Chuyển phát bằng đường bộ', NULL, NULL, 0, NULL, 0, 10);
INSERT INTO `gia_dich_vu` VALUES('chuyen_phat_nhanh', 'Chuyển phát nhanh', NULL, NULL, 0, NULL, 15, 10);
INSERT INTO `gia_dich_vu` VALUES('chuyen_phat_nhanh_hoa_toc', 'Chuyển phát nhanh hỏa tốc', NULL, NULL, 1, NULL, 15, 10);
INSERT INTO `gia_dich_vu` VALUES('chuyen_phat_nhanh_tiet_kiem', 'Chuyển phát nhanh tiết kiệm', NULL, NULL, 0, NULL, 0, 10);
INSERT INTO `gia_dich_vu` VALUES('chuyen_phat_nhanh_truoc_9h', 'Chuyển phát nhanh trước 9h sáng', NULL, NULL, 1, NULL, 15, 10);

-- --------------------------------------------------------

--
-- Table structure for table `gia_dich_vu_tinh_thanh`
--

CREATE TABLE `gia_dich_vu_tinh_thanh` (
  `ma_dich_vu` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ma_tinh` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `la_tinh_di` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ma_dich_vu`,`ma_tinh`,`la_tinh_di`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gia_dich_vu_tinh_thanh`
--

INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_bang_duong_bo', 'bac_giang', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_bang_duong_bo', 'bac_lieu', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_bang_duong_bo', 'bac_lieu', 1);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_bang_duong_bo', 'ben_tre', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_bang_duong_bo', 'binh_dinh', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_bang_duong_bo', 'da_nang', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_bang_duong_bo', 'ha_noi', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_bang_duong_bo', 'ha_tinh', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_bang_duong_bo', 'hai_duong', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_bang_duong_bo', 'hai_phong', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_bang_duong_bo', 'tp_hcm', 1);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh', 'da_nang', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh', 'dak_lak', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh', 'den_300km', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh', 'gia_lai', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh', 'ha_noi', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh', 'lam_dong', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh', 'tp_hcm', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh', 'tp_hcm', 1);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh', 'tren_300km', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh_tiet_kiem', 'an_giang', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh_tiet_kiem', 'can_tho', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh_tiet_kiem', 'cao_bang', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh_tiet_kiem', 'da_nang', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh_tiet_kiem', 'dak_lak', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh_tiet_kiem', 'lam_dong', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh_tiet_kiem', 'nam_dinh', 0);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', 1);
INSERT INTO `gia_dich_vu_tinh_thanh` VALUES('chuyen_phat_nhanh_tiet_kiem', 'vinh_long', 0);

-- --------------------------------------------------------

--
-- Table structure for table `gia_dich_vu_tinh_thanh_pho`
--

CREATE TABLE `gia_dich_vu_tinh_thanh_pho` (
  `ma_dich_vu` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ma_tinh_di` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ma_tinh_den` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ma_dich_vu`,`ma_tinh_di`,`ma_tinh_den`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gia_dich_vu_tinh_thanh_pho`
--

INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_bang_duong_bo', 'tp_hcm', 'can_tho');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_bang_duong_bo', 'tp_hcm', 'da_nang');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_bang_duong_bo', 'tp_hcm', 'gia_lai');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_bang_duong_bo', 'tp_hcm', 'ha_noi');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_phat_nhanh', 'tp_hcm', 'da_nang');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_phat_nhanh', 'tp_hcm', 'den_300km');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_phat_nhanh', 'tp_hcm', 'ha_noi');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_phat_nhanh', 'tp_hcm', 'hai_phong');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_phat_nhanh', 'tp_hcm', 'tp_hcm');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_phat_nhanh', 'tp_hcm', 'tren_300km');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', 'ha_noi');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', 'hai_duong');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', 'hai_phong');
INSERT INTO `gia_dich_vu_tinh_thanh_pho` VALUES('chuyen_phat_nhanh_tiet_kiem', 'tp_hcm', 'hoa_binh');

-- --------------------------------------------------------

--
-- Table structure for table `gia_khu_vuc`
--

CREATE TABLE `gia_khu_vuc` (
  `ma_khu_vuc` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ten_khu_vuc` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ma_khu_vuc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gia_khu_vuc`
--


-- --------------------------------------------------------

--
-- Table structure for table `gia_loai_hang_hoa`
--

CREATE TABLE `gia_loai_hang_hoa` (
  `ma_loai_hang_hoa` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ten_loai_hang_hoa` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ma_loai_hang_hoa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gia_loai_hang_hoa`
--

INSERT INTO `gia_loai_hang_hoa` VALUES('dien_thoai_di_dong', 'Điện thoại di động');
INSERT INTO `gia_loai_hang_hoa` VALUES('phong_bi', 'Phong bì');

-- --------------------------------------------------------

--
-- Table structure for table `gia_phuong_tien`
--

CREATE TABLE `gia_phuong_tien` (
  `ma_phuong_tien` varchar(30) NOT NULL,
  `ten_phuong_tien` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ma_phuong_tien`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gia_phuong_tien`
--

INSERT INTO `gia_phuong_tien` VALUES('tau_hoa', 'Tàu hoả');
INSERT INTO `gia_phuong_tien` VALUES('xe_container', 'Xe container');

-- --------------------------------------------------------

--
-- Table structure for table `gia_phu_thu_khoang_cach`
--

CREATE TABLE `gia_phu_thu_khoang_cach` (
  `ma_phu_thu_khoang_cach` int(11) NOT NULL AUTO_INCREMENT,
  `ma_bang_gia` int(11) NOT NULL,
  `khoi_luong_tu` int(11) DEFAULT NULL COMMENT 'gram',
  `khoi_luong_den` int(11) DEFAULT NULL COMMENT 'gram',
  `khoang_cach_tu` int(11) DEFAULT NULL COMMENT 'km',
  `khoang_cach_den` int(11) DEFAULT NULL COMMENT 'km',
  `gia_cong_them` decimal(20,0) DEFAULT NULL COMMENT 'VND',
  `ti_le_cong_them` decimal(10,0) DEFAULT NULL COMMENT '%',
  PRIMARY KEY (`ma_phu_thu_khoang_cach`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gia_phu_thu_khoang_cach`
--


-- --------------------------------------------------------

--
-- Table structure for table `gia_tinh_thanh_pho`
--

CREATE TABLE `gia_tinh_thanh_pho` (
  `ma_tinh` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ten_tinh` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_khu_vuc` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vi_tri_x` int(11) DEFAULT NULL,
  `vi_tri_y` int(11) DEFAULT NULL,
  `trung_tam_tinh` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ma_tinh`),
  KEY `ma_khu_vuc_fk` (`ma_khu_vuc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gia_tinh_thanh_pho`
--

INSERT INTO `gia_tinh_thanh_pho` VALUES('an_giang', 'An Giang', NULL, 20, 2500, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('bac_kan', 'Bắc Cạn', NULL, 500, 100, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('bac_giang', 'Bắc Giang', NULL, 700, 200, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('bac_lieu', 'Bac Liêu', NULL, 200, 2500, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('bac_ninh', 'Bắc Ninh', NULL, 800, 500, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('ben_tre', 'Bến Tre', NULL, 200, 2300, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('binh_dinh', 'Bình Định', NULL, 500, 1800, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('binh_duong', 'Bình Dương', NULL, 300, 2100, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('binh_phuoc', 'Bình Phước', NULL, 250, 1950, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('binh_thuan', 'Bình Thuận', NULL, 350, 1950, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('can_tho', 'Cần Thơ', NULL, 150, 2300, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('cao_bang', 'Cao Bằng', NULL, 350, 30, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('ca_mau', 'Cà Mau', NULL, 200, 2600, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('dak_lak', 'Đăk Lăk', NULL, 50, 1800, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('dak_nong', 'Đăk Nông', NULL, 50, 1700, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('da_nang', 'Đà Nẵng', NULL, 700, 1200, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('dien_bien', 'Điện Biên', NULL, 20, 100, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('dong_nai', 'Đồng Nai', NULL, 400, 2100, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('dong_thap', 'Đồng Tháp', NULL, 100, 2400, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('gia_lai', 'Gia Lai', NULL, 50, 1700, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('hai_duong', 'Hải Dương', NULL, 600, 200, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('hai_phong', 'Hải Phòng', NULL, 600, 250, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('hau_giang', 'Hậu Giang', NULL, 150, 2350, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('ha_giang', 'Hà Giang', NULL, 20, 100, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('ha_nam', 'Hà Nam', NULL, 500, 300, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('ha_noi', 'Hà Nội', NULL, 500, 250, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('ha_tay', 'Hà Tây', NULL, 300, 300, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('ha_tinh', 'Hà Tĩnh', NULL, 200, 500, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('hoa_binh', 'Hoà Bình', NULL, 550, 300, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('hue', 'Huế', NULL, 200, 900, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('hung_yen', 'Hưng Yên', NULL, 600, 400, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('khanh_hoa', 'Khanh Hoà', NULL, 750, 1600, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('kien_giang', 'Kiên Giang', NULL, 100, 2600, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('kom_tum', 'Kom Tum', NULL, 50, 1600, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('lai_chau', 'Lai Châu', NULL, 300, 200, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('lam_dong', 'Lâm Đồng', NULL, 100, 1900, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('lang_son', 'Lạng Sơn', NULL, 400, 50, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('lao_cai', 'Lài Cai', NULL, 30, 50, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('long_an', 'Long An', NULL, 200, 2250, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('nam_dinh', 'Nam Định', NULL, 300, 400, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('nghe_an', 'Nghệ An', NULL, 300, 600, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('ninh_binh', 'Ninh Bình', NULL, 400, 700, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('ninh_thuan', 'Ninh Thuận', NULL, 400, 1800, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('phu_tho', 'Phú Thọ', NULL, 200, 200, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('phu_yen', 'Phú Yên', NULL, 500, 1600, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('quang_binh', 'Quãng Bình', NULL, 600, 400, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('quang_nam', 'Quảng Nam', NULL, 600, 1300, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('quang_ngai', 'Quãng Ngãi', NULL, 500, 1000, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('quang_ninh', 'Quảng Ninh', NULL, 700, 100, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('quang_tri', 'Quãng Trị', NULL, 500, 800, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('soc_trang', 'Sóc Trăng', NULL, 200, 2400, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('son_la', 'Sơn La', NULL, 500, 50, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('tay_ninh', 'Tây Ninh', NULL, 200, 2200, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('thai_binh', 'Thái Bình', NULL, 600, 600, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('thai_nguyen', 'Thái Nguyên', NULL, 400, 300, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('thanh_hoa', 'Thanh Hoá', NULL, 400, 700, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('tien_giang', 'Tiền Giang', NULL, 200, 2350, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('tp_hcm', 'TP. Hồ Chí Minh', NULL, 250, 2200, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('tra_vinh', 'Trà Vinh', NULL, 100, 2400, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('tuyen_quang', 'Tuyên Quang', NULL, 300, 100, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('vinh_long', 'Vĩnh Long', NULL, 150, 2400, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('vinh_phuc', 'Vĩnh Phúc', NULL, 450, 300, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('vung_tau', 'Vũng Tàu', NULL, 350, 2100, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('yen_bai', 'Yên Bái', NULL, 300, 150, NULL);
INSERT INTO `gia_tinh_thanh_pho` VALUES('den_300km', 'Đến 300km', 'null', 0, 0, '');
INSERT INTO `gia_tinh_thanh_pho` VALUES('tren_300km', 'Trên 300km', 'null', 0, 0, '');
INSERT INTO `gia_tinh_thanh_pho` VALUES('nha_trang', 'Nha Trang', 'NULL', 500, 1700, 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `gia_van_chuyen`
--

CREATE TABLE `gia_van_chuyen` (
  `ma_van_chuyen` int(20) NOT NULL AUTO_INCREMENT,
  `ma_loai_hang_hoa` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten_hang_hoa` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Neu hang hoa khong nam trong danh muc thi nhap ten hang hoa vao muc nay',
  `ma_tinh_di` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_van_phong_di` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ho tro tu dong lay ma van phong khi chon tinh',
  `ma_tinh_den` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_van_phong_den` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ho tro tu dong lay ma van phong khi chon tinh',
  `ma_tinh_den_2` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_van_phong_den_2` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ho tro tu dong lay ma van phong khi chon tinh',
  `khoi_luong` int(11) DEFAULT NULL COMMENT 'gram',
  `chieu_cao` int(11) DEFAULT NULL COMMENT 'cm',
  `chieu_dai` int(11) DEFAULT NULL COMMENT 'cm',
  `chieu_rong` int(11) DEFAULT NULL COMMENT 'cm',
  `ghi_chu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ngay_nhan_hang` datetime DEFAULT NULL,
  `ngay_giao_hang` datetime DEFAULT NULL,
  PRIMARY KEY (`ma_van_chuyen`),
  KEY `van_chuyen_ma_loai_hh_fk` (`ma_loai_hang_hoa`),
  KEY `van_chuyen_ma_tinh_di_fk` (`ma_tinh_di`),
  KEY `van_chuyen_ma_tinh_den_fk` (`ma_tinh_den`),
  KEY `van_chuyen_ma_tinh_den_2_fk` (`ma_tinh_den_2`),
  KEY `van_chuyen_ma_vp_di_fk` (`ma_van_phong_di`),
  KEY `van_chuyen_ma_vp_den_fk` (`ma_van_phong_den`),
  KEY `van_chuyen_ma_vp_den_2_fk` (`ma_van_phong_den_2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gia_van_chuyen`
--


-- --------------------------------------------------------

--
-- Table structure for table `gia_van_chuyen_dich_vu`
--

CREATE TABLE `gia_van_chuyen_dich_vu` (
  `ma_van_chuyen_dich_vu` int(20) NOT NULL AUTO_INCREMENT,
  `ma_van_chuyen` int(20) NOT NULL,
  `ma_dich_vu` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `gia` decimal(20,0) DEFAULT NULL,
  PRIMARY KEY (`ma_van_chuyen_dich_vu`),
  KEY `ma_van_chuyen_fk` (`ma_van_chuyen`),
  KEY `ma_dich_vu_fk` (`ma_dich_vu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gia_van_chuyen_dich_vu`
--


-- --------------------------------------------------------

--
-- Table structure for table `gia_van_chuyen_dn`
--

CREATE TABLE `gia_van_chuyen_dn` (
  `ma_van_chuyen` int(20) NOT NULL AUTO_INCREMENT,
  `ma_dich_vu` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_tinh_di` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_tinh_den` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `khoi_luong` int(11) DEFAULT '0' COMMENT 'gram',
  `cuoc_phi` bigint(20) DEFAULT '0',
  `phu_thu` bigint(20) DEFAULT '0',
  `tong` bigint(20) DEFAULT '0',
  `ghi_chu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ngay` date DEFAULT NULL,
  `ck_sale` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_khach_hang` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `so_bill` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ma_van_chuyen`),
  UNIQUE KEY `so_bill` (`so_bill`),
  KEY `ma_khach_hang` (`ma_khach_hang`),
  KEY `ngay` (`ngay`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `gia_van_chuyen_dn`
--

INSERT INTO `gia_van_chuyen_dn` VALUES(32, 'chuyen_bang_duong_bo', 'tp_hcm', 'da_nang', 100, 50000, 2500, 52500, '', '2012-08-16', NULL, 'admin', 'A111');
INSERT INTO `gia_van_chuyen_dn` VALUES(33, 'chuyen_bang_duong_bo', 'tp_hcm', 'bac_giang', 2000, 100000, 0, 100000, '', '2012-08-16', NULL, 'admin', 'A112');
INSERT INTO `gia_van_chuyen_dn` VALUES(34, 'chuyen_phat_nhanh', 'tp_hcm', 'da_nang', 500, 26000, 5000, 31000, '', '2012-08-16', NULL, 'admin', 'A114');
INSERT INTO `gia_van_chuyen_dn` VALUES(40, 'chuyen_phat_nhanh', 'tp_hcm', 'da_nang', 2000000, 1487600, 1300, 1488900, 'co phu thu 1300', '2012-08-25', NULL, 'admin', 'A117');
INSERT INTO `gia_van_chuyen_dn` VALUES(35, 'chuyen_phat_nhanh', 'tp_hcm', 'da_nang', 100, 13000, 0, 13000, '', '2012-08-16', NULL, 'admin', 'A115');
INSERT INTO `gia_van_chuyen_dn` VALUES(38, 'chuyen_phat_nhanh', 'tp_hcm', 'da_nang', 1000, 38000, 0, 38000, '', '2012-08-17', NULL, 'admin', 'A116');
INSERT INTO `gia_van_chuyen_dn` VALUES(42, 'chuyen_phat_nhanh', 'tp_hcm', 'ha_noi', 4600, 137252, 0, 137252, '', '2012-09-07', NULL, 'admin', 'A1234');
INSERT INTO `gia_van_chuyen_dn` VALUES(43, 'chuyen_phat_nhanh', 'tp_hcm', 'ha_noi', 80, 16445, 0, 16445, '', '2012-09-08', NULL, 'admin', 'A1235');
INSERT INTO `gia_van_chuyen_dn` VALUES(49, 'chuyen_phat_nhanh', 'tp_hcm', 'an_giang', 60, 0, 0, 0, '', '2012-09-08', NULL, 'admin', 'A1236');
INSERT INTO `gia_van_chuyen_dn` VALUES(45, 'chuyen_phat_nhanh', 'tp_hcm', 'an_giang', 0, 0, 0, 0, '', '2012-09-08', NULL, 'AA11111', '115');
INSERT INTO `gia_van_chuyen_dn` VALUES(46, 'chuyen_phat_nhanh', 'tp_hcm', 'an_giang', 0, 0, 0, 0, '', '2012-09-08', NULL, 'AA11111', '116');
INSERT INTO `gia_van_chuyen_dn` VALUES(47, 'chuyen_bang_duong_bo', 'tp_hcm', 'hoa_binh', 6400, 0, 0, 0, '', '2012-09-08', NULL, 'AA11111', '117');
INSERT INTO `gia_van_chuyen_dn` VALUES(48, 'chuyen_bang_duong_bo', 'tp_hcm', 'hoa_binh', 0, 113850, 0, 113850, '', '2012-09-08', NULL, 'AA11111', '118');
INSERT INTO `gia_van_chuyen_dn` VALUES(50, 'chuyen_phat_nhanh', 'tp_hcm', 'da_nang', 30000, 0, 0, 0, '', '2012-09-08', NULL, 'AA11111', '119');
INSERT INTO `gia_van_chuyen_dn` VALUES(51, 'chuyen_phat_nhanh', 'tp_hcm', 'khanh_hoa', 10, 0, 0, 0, '', '2012-09-08', NULL, 'AA11111', '120');
INSERT INTO `gia_van_chuyen_dn` VALUES(52, 'chuyen_phat_nhanh', 'tp_hcm', 'khanh_hoa', 10, 13915, 0, 13915, '', '2012-09-08', NULL, 'AA11111', '121');
INSERT INTO `gia_van_chuyen_dn` VALUES(53, 'chuyen_phat_nhanh', 'tp_hcm', 'da_nang', 30000, 619850, 5000, 624850, '', '2012-09-08', NULL, 'AA11111', '122');
INSERT INTO `gia_van_chuyen_dn` VALUES(54, 'chuyen_phat_nhanh', 'tp_hcm', 'vung_tau', 11000, 175076, 0, 175076, '', '2012-09-08', NULL, 'AA1001', '1089563');
INSERT INTO `gia_van_chuyen_dn` VALUES(55, 'chuyen_phat_nhanh', 'tp_hcm', 'an_giang', 9000, 238199, 0, 238199, '', '2012-09-08', NULL, 'AA1001', '1089566');
INSERT INTO `gia_van_chuyen_dn` VALUES(56, 'chuyen_phat_nhanh', 'tp_hcm', 'kien_giang', 3500, 113660, 0, 113660, '', '2012-09-08', NULL, 'AA1001', '1089564');
INSERT INTO `gia_van_chuyen_dn` VALUES(57, 'chuyen_phat_nhanh', 'tp_hcm', 'tien_giang', 3000, 77924, 0, 77924, '', '2012-09-08', NULL, 'AA1001', '1089568');
INSERT INTO `gia_van_chuyen_dn` VALUES(58, 'chuyen_phat_nhanh', 'tp_hcm', 'an_giang', 3200, 113660, 0, 113660, '', '2012-09-08', NULL, 'AA1002', '1089570');
INSERT INTO `gia_van_chuyen_dn` VALUES(59, 'chuyen_phat_nhanh', 'tp_hcm', 'kien_giang', 14500, 362738, 0, 362738, '', '2012-09-08', NULL, 'AA1002', '1089081');
INSERT INTO `gia_van_chuyen_dn` VALUES(60, 'chuyen_phat_nhanh', 'tp_hcm', 'ha_noi', 14500, 347558, 0, 347558, '', '2012-09-08', NULL, 'AA1002', '1089567');
INSERT INTO `gia_van_chuyen_dn` VALUES(61, 'chuyen_phat_nhanh', 'tp_hcm', 'an_giang', 11, 15180, 0, 15180, '', '2012-09-08', NULL, 'AA11111', '');
INSERT INTO `gia_van_chuyen_dn` VALUES(62, 'chuyen_phat_nhanh', 'tp_hcm', 'an_giang', 11, 15180, 0, 15180, '', '2012-09-08', NULL, 'AA1001', '1089569');
INSERT INTO `gia_van_chuyen_dn` VALUES(63, 'chuyen_phat_nhanh', 'tp_hcm', 'tp_hcm', 60, 10120, 0, 10120, '', '2012-09-10', NULL, 'AA1002', '1046988');
INSERT INTO `gia_van_chuyen_dn` VALUES(64, 'chuyen_phat_nhanh', 'tp_hcm', 'thai_nguyen', 120, 27830, 0, 27830, '', '2012-09-10', NULL, 'AA1002', '1046989');
INSERT INTO `gia_van_chuyen_dn` VALUES(65, 'chuyen_phat_nhanh', 'tp_hcm', 'tp_hcm', 4300, 36685, 0, 36685, '', '2012-09-10', NULL, 'AA1002', '1046986');

-- --------------------------------------------------------

--
-- Table structure for table `gia_van_chuyen_dn_import`
--

CREATE TABLE `gia_van_chuyen_dn_import` (
  `ma_van_chuyen` int(20) NOT NULL AUTO_INCREMENT,
  `ma_dich_vu` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_tinh_di` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_tinh_den` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `khoi_luong` int(11) DEFAULT '0' COMMENT 'gram',
  `cuoc_phi` bigint(20) DEFAULT '0',
  `phu_thu` bigint(20) DEFAULT '0',
  `tong` bigint(20) DEFAULT '0',
  `ghi_chu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ngay` date DEFAULT NULL,
  `ck_sale` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ma_khach_hang` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `so_bill` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ma_van_chuyen`),
  KEY `ma_khach_hang` (`ma_khach_hang`),
  KEY `ngay` (`ngay`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `gia_van_chuyen_dn_import`
--

INSERT INTO `gia_van_chuyen_dn_import` VALUES(30, 'chuyen_phat_nhanh', '', 'can_tho', 10, 10500, 0, 10500, '', '2012-01-01', '', '', 'A122');
INSERT INTO `gia_van_chuyen_dn_import` VALUES(31, 'chuyen_phat_nhanh', '', 'tp_hcm', 100, 11000, 0, 11000, '', '2012-01-02', '', '', 'A123');
INSERT INTO `gia_van_chuyen_dn_import` VALUES(32, 'chuyen_phat_nhanh', '', 'can_tho', 10, 10500, 0, 10500, '', '2012-09-01', '', '', 'A122');
INSERT INTO `gia_van_chuyen_dn_import` VALUES(33, 'chuyen_phat_nhanh', '', 'tp_hcm', 100, 11000, 0, 11000, '', '2012-09-02', '', '', 'A123');
INSERT INTO `gia_van_chuyen_dn_import` VALUES(34, 'chuyen_phat_nhanh', '', 'can_tho', 10, 10500, 0, 10500, '', '2012-09-01', '', '', 'A122');
INSERT INTO `gia_van_chuyen_dn_import` VALUES(35, 'chuyen_phat_nhanh', '', 'tp_hcm', 100, 11000, 0, 11000, '', '2012-09-02', '', '', 'A123');

-- --------------------------------------------------------

--
-- Table structure for table `gia_van_phong`
--

CREATE TABLE `gia_van_phong` (
  `ma_van_phong` varchar(30) NOT NULL,
  `ten_van_phong` varchar(200) NOT NULL,
  `dia_chi` varchar(200) DEFAULT NULL,
  `dien_thoai` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `hotline` varchar(30) DEFAULT NULL,
  `ma_tinh` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ma_van_phong`),
  KEY `ma_tinh_fk` (`ma_tinh`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gia_van_phong`
--

INSERT INTO `gia_van_phong` VALUES('da_nang', 'Văn phòng Đà Nẳng', NULL, NULL, NULL, NULL, 'da_nang');
INSERT INTO `gia_van_phong` VALUES('ha_noi', 'Văn phòng Hà Nội', NULL, NULL, NULL, NULL, 'ha_noi');
INSERT INTO `gia_van_phong` VALUES('ho_chi_minh', 'Văn phòng Hồ Chí Minh', NULL, NULL, NULL, NULL, 'tp_hcm');

-- --------------------------------------------------------

--
-- Table structure for table `th_commentmeta`
--

CREATE TABLE `th_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `th_commentmeta`
--

INSERT INTO `th_commentmeta` VALUES(1, 2, 'rating', '5');
INSERT INTO `th_commentmeta` VALUES(2, 3, 'is_customer_note', '0');
INSERT INTO `th_commentmeta` VALUES(3, 4, 'is_customer_note', '0');
INSERT INTO `th_commentmeta` VALUES(4, 5, 'is_customer_note', '0');
INSERT INTO `th_commentmeta` VALUES(5, 6, 'is_customer_note', '0');

-- --------------------------------------------------------

--
-- Table structure for table `th_comments`
--

CREATE TABLE `th_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_approved` (`comment_approved`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `th_comments`
--

INSERT INTO `th_comments` VALUES(2, 18, 'admin', 'lgthnha@yahoo.com.vn', '', '127.0.0.1', '2012-09-15 16:59:49', '2012-09-15 16:59:49', 'Ngon do!', 0, '1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1', '', 0, 1);
INSERT INTO `th_comments` VALUES(3, 41, 'WooCommerce', 'woocommerce@localhost', '', '', '2012-09-16 07:51:25', '2012-09-16 07:51:25', 'Awaiting BACS payment Order status changed from pending to on-hold.', 0, '1', 'WooCommerce', 'order_note', 0, 0);
INSERT INTO `th_comments` VALUES(4, 41, 'WooCommerce', 'woocommerce@localhost', '', '', '2012-09-16 07:51:25', '2012-09-16 07:51:25', 'Order item stock reduced successfully.', 0, '1', 'WooCommerce', 'order_note', 0, 0);
INSERT INTO `th_comments` VALUES(5, 42, 'WooCommerce', 'woocommerce@localhost', '', '', '2012-09-16 08:12:08', '2012-09-16 08:12:08', 'Awaiting BACS payment Order status changed from pending to on-hold.', 0, '1', 'WooCommerce', 'order_note', 0, 0);
INSERT INTO `th_comments` VALUES(6, 42, 'WooCommerce', 'woocommerce@localhost', '', '', '2012-09-16 08:12:08', '2012-09-16 08:12:08', 'Order item stock reduced successfully.', 0, '1', 'WooCommerce', 'order_note', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `th_links`
--

CREATE TABLE `th_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `th_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `th_options`
--

CREATE TABLE `th_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=616 ;

--
-- Dumping data for table `th_options`
--

INSERT INTO `th_options` VALUES(610, 0, '_site_transient_timeout_theme_roots', '1347902142', 'yes');
INSERT INTO `th_options` VALUES(611, 0, '_site_transient_theme_roots', 'a:1:{s:12:"twentyeleven";s:7:"/themes";}', 'yes');
INSERT INTO `th_options` VALUES(3, 0, 'siteurl', 'http://www.vnestore.com/trathonghong', 'yes');
INSERT INTO `th_options` VALUES(4, 0, 'blogname', 'THÔNG HỒNG', 'yes');
INSERT INTO `th_options` VALUES(5, 0, 'blogdescription', 'Tinh hoa của thiên nhiên, món quà cho sức khoẻ', 'yes');
INSERT INTO `th_options` VALUES(6, 0, 'users_can_register', '0', 'yes');
INSERT INTO `th_options` VALUES(7, 0, 'admin_email', 'lgthnha@yahoo.com.vn', 'yes');
INSERT INTO `th_options` VALUES(8, 0, 'start_of_week', '1', 'yes');
INSERT INTO `th_options` VALUES(9, 0, 'use_balanceTags', '0', 'yes');
INSERT INTO `th_options` VALUES(10, 0, 'use_smilies', '1', 'yes');
INSERT INTO `th_options` VALUES(11, 0, 'require_name_email', '1', 'yes');
INSERT INTO `th_options` VALUES(12, 0, 'comments_notify', '1', 'yes');
INSERT INTO `th_options` VALUES(13, 0, 'posts_per_rss', '10', 'yes');
INSERT INTO `th_options` VALUES(14, 0, 'rss_use_excerpt', '0', 'yes');
INSERT INTO `th_options` VALUES(15, 0, 'mailserver_url', 'mail.example.com', 'yes');
INSERT INTO `th_options` VALUES(16, 0, 'mailserver_login', 'login@example.com', 'yes');
INSERT INTO `th_options` VALUES(17, 0, 'mailserver_pass', 'password', 'yes');
INSERT INTO `th_options` VALUES(18, 0, 'mailserver_port', '110', 'yes');
INSERT INTO `th_options` VALUES(19, 0, 'default_category', '1', 'yes');
INSERT INTO `th_options` VALUES(20, 0, 'default_comment_status', 'open', 'yes');
INSERT INTO `th_options` VALUES(21, 0, 'default_ping_status', 'open', 'yes');
INSERT INTO `th_options` VALUES(22, 0, 'default_pingback_flag', '1', 'yes');
INSERT INTO `th_options` VALUES(23, 0, 'default_post_edit_rows', '20', 'yes');
INSERT INTO `th_options` VALUES(24, 0, 'posts_per_page', '10', 'yes');
INSERT INTO `th_options` VALUES(25, 0, 'date_format', 'd/m/Y', 'yes');
INSERT INTO `th_options` VALUES(26, 0, 'time_format', 'H:i', 'yes');
INSERT INTO `th_options` VALUES(27, 0, 'links_updated_date_format', 'F j, Y g:i a', 'yes');
INSERT INTO `th_options` VALUES(28, 0, 'links_recently_updated_prepend', '<em>', 'yes');
INSERT INTO `th_options` VALUES(29, 0, 'links_recently_updated_append', '</em>', 'yes');
INSERT INTO `th_options` VALUES(30, 0, 'links_recently_updated_time', '120', 'yes');
INSERT INTO `th_options` VALUES(31, 0, 'comment_moderation', '0', 'yes');
INSERT INTO `th_options` VALUES(32, 0, 'moderation_notify', '1', 'yes');
INSERT INTO `th_options` VALUES(33, 0, 'permalink_structure', '/%postname%/', 'yes');
INSERT INTO `th_options` VALUES(34, 0, 'gzipcompression', '0', 'yes');
INSERT INTO `th_options` VALUES(35, 0, 'hack_file', '0', 'yes');
INSERT INTO `th_options` VALUES(36, 0, 'blog_charset', 'UTF-8', 'yes');
INSERT INTO `th_options` VALUES(37, 0, 'moderation_keys', '', 'no');
INSERT INTO `th_options` VALUES(38, 0, 'active_plugins', 'a:4:{i:0;s:16:"dang-ky/main.php";i:1;s:33:"visits-counter/visits_counter.php";i:2;s:27:"woocommerce/woocommerce.php";i:3;s:37:"yahoo-and-skype-status/yahooskype.php";}', 'yes');
INSERT INTO `th_options` VALUES(39, 0, 'home', 'http://www.vnestore.com/trathonghong', 'yes');
INSERT INTO `th_options` VALUES(40, 0, 'category_base', '', 'yes');
INSERT INTO `th_options` VALUES(41, 0, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes');
INSERT INTO `th_options` VALUES(42, 0, 'advanced_edit', '0', 'yes');
INSERT INTO `th_options` VALUES(43, 0, 'comment_max_links', '2', 'yes');
INSERT INTO `th_options` VALUES(44, 0, 'gmt_offset', '0', 'yes');
INSERT INTO `th_options` VALUES(45, 0, 'default_email_category', '1', 'yes');
INSERT INTO `th_options` VALUES(46, 0, 'recently_edited', '', 'no');
INSERT INTO `th_options` VALUES(47, 0, 'template', 'twentyeleven', 'yes');
INSERT INTO `th_options` VALUES(48, 0, 'stylesheet', 'twentyeleven', 'yes');
INSERT INTO `th_options` VALUES(49, 0, 'comment_whitelist', '1', 'yes');
INSERT INTO `th_options` VALUES(50, 0, 'blacklist_keys', '', 'no');
INSERT INTO `th_options` VALUES(51, 0, 'comment_registration', '0', 'yes');
INSERT INTO `th_options` VALUES(52, 0, 'rss_language', 'en', 'yes');
INSERT INTO `th_options` VALUES(53, 0, 'html_type', 'text/html', 'yes');
INSERT INTO `th_options` VALUES(54, 0, 'use_trackback', '0', 'yes');
INSERT INTO `th_options` VALUES(55, 0, 'default_role', 'subscriber', 'yes');
INSERT INTO `th_options` VALUES(56, 0, 'db_version', '19470', 'yes');
INSERT INTO `th_options` VALUES(57, 0, 'uploads_use_yearmonth_folders', '1', 'yes');
INSERT INTO `th_options` VALUES(58, 0, 'upload_path', '', 'yes');
INSERT INTO `th_options` VALUES(59, 0, 'blog_public', '1', 'yes');
INSERT INTO `th_options` VALUES(60, 0, 'default_link_category', '2', 'yes');
INSERT INTO `th_options` VALUES(61, 0, 'show_on_front', 'posts', 'yes');
INSERT INTO `th_options` VALUES(62, 0, 'tag_base', '', 'yes');
INSERT INTO `th_options` VALUES(63, 0, 'show_avatars', '1', 'yes');
INSERT INTO `th_options` VALUES(64, 0, 'avatar_rating', 'G', 'yes');
INSERT INTO `th_options` VALUES(65, 0, 'upload_url_path', '', 'yes');
INSERT INTO `th_options` VALUES(66, 0, 'thumbnail_size_w', '150', 'yes');
INSERT INTO `th_options` VALUES(67, 0, 'thumbnail_size_h', '150', 'yes');
INSERT INTO `th_options` VALUES(68, 0, 'thumbnail_crop', '1', 'yes');
INSERT INTO `th_options` VALUES(69, 0, 'medium_size_w', '300', 'yes');
INSERT INTO `th_options` VALUES(70, 0, 'medium_size_h', '300', 'yes');
INSERT INTO `th_options` VALUES(71, 0, 'avatar_default', 'mystery', 'yes');
INSERT INTO `th_options` VALUES(72, 0, 'enable_app', '0', 'yes');
INSERT INTO `th_options` VALUES(73, 0, 'enable_xmlrpc', '0', 'yes');
INSERT INTO `th_options` VALUES(74, 0, 'large_size_w', '1024', 'yes');
INSERT INTO `th_options` VALUES(75, 0, 'large_size_h', '1024', 'yes');
INSERT INTO `th_options` VALUES(76, 0, 'image_default_link_type', 'file', 'yes');
INSERT INTO `th_options` VALUES(77, 0, 'image_default_size', '', 'yes');
INSERT INTO `th_options` VALUES(78, 0, 'image_default_align', '', 'yes');
INSERT INTO `th_options` VALUES(79, 0, 'close_comments_for_old_posts', '0', 'yes');
INSERT INTO `th_options` VALUES(80, 0, 'close_comments_days_old', '14', 'yes');
INSERT INTO `th_options` VALUES(81, 0, 'thread_comments', '1', 'yes');
INSERT INTO `th_options` VALUES(82, 0, 'thread_comments_depth', '5', 'yes');
INSERT INTO `th_options` VALUES(83, 0, 'page_comments', '0', 'yes');
INSERT INTO `th_options` VALUES(84, 0, 'comments_per_page', '50', 'yes');
INSERT INTO `th_options` VALUES(85, 0, 'default_comments_page', 'newest', 'yes');
INSERT INTO `th_options` VALUES(86, 0, 'comment_order', 'asc', 'yes');
INSERT INTO `th_options` VALUES(87, 0, 'sticky_posts', 'a:0:{}', 'yes');
INSERT INTO `th_options` VALUES(88, 0, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(89, 0, 'widget_text', 'a:0:{}', 'yes');
INSERT INTO `th_options` VALUES(90, 0, 'widget_rss', 'a:0:{}', 'yes');
INSERT INTO `th_options` VALUES(91, 0, 'timezone_string', '', 'yes');
INSERT INTO `th_options` VALUES(92, 0, 'embed_autourls', '1', 'yes');
INSERT INTO `th_options` VALUES(93, 0, 'embed_size_w', '', 'yes');
INSERT INTO `th_options` VALUES(94, 0, 'embed_size_h', '600', 'yes');
INSERT INTO `th_options` VALUES(95, 0, 'page_for_posts', '0', 'yes');
INSERT INTO `th_options` VALUES(96, 0, 'page_on_front', '0', 'yes');
INSERT INTO `th_options` VALUES(97, 0, 'default_post_format', '0', 'yes');
INSERT INTO `th_options` VALUES(98, 0, 'initial_db_version', '19470', 'yes');
INSERT INTO `th_options` VALUES(99, 0, 'th_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:68:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:25:"manage_woocommerce_orders";b:1;s:26:"manage_woocommerce_coupons";b:1;s:27:"manage_woocommerce_products";b:1;s:24:"view_woocommerce_reports";b:1;s:10:"manage_slp";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:3:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop Manager";s:12:"capabilities";a:34:{s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:18:"manage_woocommerce";b:1;s:25:"manage_woocommerce_orders";b:1;s:26:"manage_woocommerce_coupons";b:1;s:27:"manage_woocommerce_products";b:1;s:24:"view_woocommerce_reports";b:1;}}}', 'yes');
INSERT INTO `th_options` VALUES(100, 0, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(101, 0, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:9:"TIN TỨC";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(102, 0, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(383, 0, '_transient_timeout_wc_ship_cf844360cb50d2ffb88406b3e7804ced', '1347771142', 'no');
INSERT INTO `th_options` VALUES(103, 0, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(378, 0, 'widget_woocommerce_login', 'a:2:{i:2;a:2:{s:16:"logged_out_title";s:13:"ĐĂNG NHẬP";s:15:"logged_in_title";s:12:"Xin chào %s";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(104, 0, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(105, 0, 'sidebars_widgets', 'a:7:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:15:"shopping_cart-2";i:1;s:19:"woocommerce_login-2";i:2;s:10:"nav_menu-2";i:3;s:14:"recent-posts-2";i:4;s:29:"woocommerce_random_products-2";i:5;s:20:"yahoo_skype_status-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:9:"sidebar-4";a:1:{i:0;s:21:"visits counter widget";}s:9:"sidebar-5";a:0:{}s:13:"array_version";i:3;}', 'yes');
INSERT INTO `th_options` VALUES(106, 0, 'cron', 'a:3:{i:1347937970;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1347981184;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes');
INSERT INTO `th_options` VALUES(111, 0, '_site_transient_timeout_browser_c8abce9ca233d7b42203a3e5cb7510a1', '1348240378', 'yes');
INSERT INTO `th_options` VALUES(108, 0, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:1:{i:0;O:8:"stdClass":9:{s:8:"response";s:7:"upgrade";s:8:"download";s:40:"http://wordpress.org/wordpress-3.4.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":4:{s:4:"full";s:40:"http://wordpress.org/wordpress-3.4.2.zip";s:10:"no_content";s:51:"http://wordpress.org/wordpress-3.4.2-no-content.zip";s:11:"new_bundled";s:52:"http://wordpress.org/wordpress-3.4.2-new-bundled.zip";s:7:"partial";b:0;}s:7:"current";s:5:"3.4.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.2";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1347894940;s:15:"version_checked";s:5:"3.3.2";}', 'yes');
INSERT INTO `th_options` VALUES(109, 0, '_site_transient_update_plugins', 'O:8:"stdClass":3:{s:12:"last_checked";i:1347894940;s:7:"checked";a:7:{s:19:"akismet/akismet.php";s:5:"2.5.3";s:9:"hello.php";s:3:"1.6";s:19:"ql_bill/ql_bill.php";s:3:"1.0";s:27:"woocommerce/woocommerce.php";s:7:"1.6.5.2";s:33:"visits-counter/visits_counter.php";s:5:"1.4.1";s:37:"yahoo-and-skype-status/yahooskype.php";s:3:"1.0";s:16:"dang-ky/main.php";s:3:"1.0";}s:8:"response";a:2:{s:19:"akismet/akismet.php";O:8:"stdClass":5:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:11:"new_version";s:5:"2.5.6";s:3:"url";s:44:"http://wordpress.org/extend/plugins/akismet/";s:7:"package";s:55:"http://downloads.wordpress.org/plugin/akismet.2.5.6.zip";}s:33:"visits-counter/visits_counter.php";O:8:"stdClass":5:{s:2:"id";s:5:"28064";s:4:"slug";s:14:"visits-counter";s:11:"new_version";s:5:"1.4.2";s:3:"url";s:51:"http://wordpress.org/extend/plugins/visits-counter/";s:7:"package";s:62:"http://downloads.wordpress.org/plugin/visits-counter.1.4.2.zip";}}}', 'yes');
INSERT INTO `th_options` VALUES(614, 0, '_transient_wc_uf_pid_3be1a653f13d689f5ba5fd2e3024ade5', 'a:7:{i:0;s:3:"101";i:1;s:2:"99";i:2;s:2:"96";i:3;s:2:"93";i:4;s:2:"91";i:5;s:2:"89";i:6;s:2:"86";}', 'yes');
INSERT INTO `th_options` VALUES(110, 0, '_site_transient_update_themes', 'O:8:"stdClass":3:{s:12:"last_checked";i:1347894943;s:7:"checked";a:1:{s:12:"twentyeleven";s:3:"1.3";}s:8:"response";a:1:{s:12:"twentyeleven";a:3:{s:11:"new_version";s:3:"1.4";s:3:"url";s:47:"http://wordpress.org/extend/themes/twentyeleven";s:7:"package";s:64:"http://wordpress.org/extend/themes/download/twentyeleven.1.4.zip";}}}', 'yes');
INSERT INTO `th_options` VALUES(613, 0, '_transient_wc_uf_pid_74877cd6e58ac64b5a877572b7f1ae7f', 'a:6:{i:0;s:2:"76";i:1;s:2:"74";i:2;s:2:"72";i:3;s:2:"25";i:4;s:2:"18";i:5;s:2:"16";}', 'yes');
INSERT INTO `th_options` VALUES(112, 0, '_site_transient_browser_c8abce9ca233d7b42203a3e5cb7510a1', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"21.0.1180.89";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes');
INSERT INTO `th_options` VALUES(113, 0, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:29:"http://localhost/trathonghong";s:4:"link";s:105:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://localhost/trathonghong/";s:3:"url";s:135:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost/wordpress/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:14:"WordPress Blog";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:20:"Other WordPress News";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes');
INSERT INTO `th_options` VALUES(114, 0, 'current_theme', 'Twenty Eleven', 'yes');
INSERT INTO `th_options` VALUES(116, 0, 'can_compress_scripts', '1', 'yes');
INSERT INTO `th_options` VALUES(296, 0, '_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f', '1347736256', 'no');
INSERT INTO `th_options` VALUES(297, 0, '_transient_dash_20494a3d90a6669585674ed0eb8dcd8f', '<p><strong>RSS Error</strong>: WP HTTP Error: Could not resolve host: blogsearch.google.com; No data record of requested type</p>', 'no');
INSERT INTO `th_options` VALUES(298, 0, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1347736266', 'no');
INSERT INTO `th_options` VALUES(299, 0, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Could not resolve host: wordpress.org; No data record of requested type</p></div>', 'no');
INSERT INTO `th_options` VALUES(300, 0, '_transient_timeout_dash_aa95765b5cc111c56d5993d476b1c2f0', '1347736292', 'no');
INSERT INTO `th_options` VALUES(301, 0, '_transient_dash_aa95765b5cc111c56d5993d476b1c2f0', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Could not resolve host: planet.wordpress.org; No data record of requested type</p></div>', 'no');
INSERT INTO `th_options` VALUES(309, 0, '_transient_timeout_wc_ship_ae962d87616a2363a6cabe90a5254980', '1347725782', 'no');
INSERT INTO `th_options` VALUES(367, 0, '_site_transient_timeout_wporg_theme_feature_list', '1347774556', 'yes');
INSERT INTO `th_options` VALUES(368, 0, '_site_transient_wporg_theme_feature_list', 'a:5:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:7:"Columns";a:6:{i:0;s:10:"one-column";i:1;s:11:"two-columns";i:2;s:13:"three-columns";i:3;s:12:"four-columns";i:4;s:12:"left-sidebar";i:5;s:13:"right-sidebar";}s:5:"Width";a:2:{i:0;s:11:"fixed-width";i:1;s:14:"flexible-width";}s:8:"Features";a:19:{i:0;s:8:"blavatar";i:1;s:10:"buddypress";i:2;s:17:"custom-background";i:3;s:13:"custom-colors";i:4;s:13:"custom-header";i:5;s:11:"custom-menu";i:6;s:12:"editor-style";i:7;s:21:"featured-image-header";i:8;s:15:"featured-images";i:9;s:15:"flexible-header";i:10;s:20:"front-page-post-form";i:11;s:19:"full-width-template";i:12;s:12:"microformats";i:13;s:12:"post-formats";i:14;s:20:"rtl-language-support";i:15;s:11:"sticky-post";i:16;s:13:"theme-options";i:17;s:17:"threaded-comments";i:18;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}}', 'yes');
INSERT INTO `th_options` VALUES(335, 0, '_transient_timeout_wc_ship_6499fe629230469cb3dfab3df7b20dc2', '1347729694', 'no');
INSERT INTO `th_options` VALUES(413, 0, 'sl_map_theme', '', 'yes');
INSERT INTO `th_options` VALUES(414, 0, 'sl_google_map_country', 'United States', 'yes');
INSERT INTO `th_options` VALUES(415, 0, 'sl_google_map_domain', 'maps.google.com', 'yes');
INSERT INTO `th_options` VALUES(416, 0, 'sl_map_end_icon', 'http://www.vnestore.com/trathonghong/wp-content/plugins/store-locator-le/core/images/icons/marker.png', 'yes');
INSERT INTO `th_options` VALUES(417, 0, 'sl_map_home_icon', 'http://www.vnestore.com/trathonghong/wp-content/plugins/store-locator-le/core/images/icons/arrow.png', 'yes');
INSERT INTO `th_options` VALUES(418, 0, 'sl_map_height', '350', 'yes');
INSERT INTO `th_options` VALUES(419, 0, 'sl_map_height_units', 'px', 'yes');
INSERT INTO `th_options` VALUES(420, 0, 'sl_map_width', '100', 'yes');
INSERT INTO `th_options` VALUES(421, 0, 'sl_map_width_units', '%', 'yes');
INSERT INTO `th_options` VALUES(422, 0, 'sl_map_radii', '10,25,50,100,(200),500', 'yes');
INSERT INTO `th_options` VALUES(427, 0, '_transient_timeout_wc_ship_18aa616c01add31c47b2de092b31f96b', '1347781881', 'no');
INSERT INTO `th_options` VALUES(506, 0, '_transient_wc_product_type_93', 'simple', 'yes');
INSERT INTO `th_options` VALUES(429, 0, '_transient_timeout_wc_ship_6e858232e81b352a6ade8d97a3b2cab2', '1347781901', 'no');
INSERT INTO `th_options` VALUES(560, 0, '_transient_wc_product_type_105', 'simple', 'yes');
INSERT INTO `th_options` VALUES(432, 0, '_transient_timeout_wc_ship_90216e07ea464a1c53865f776f63f301', '1347786629', 'no');
INSERT INTO `th_options` VALUES(510, 0, '_transient_wc_product_type_91', 'simple', 'yes');
INSERT INTO `th_options` VALUES(453, 0, 'vs_online_offset', '0', 'yes');
INSERT INTO `th_options` VALUES(454, 0, 'vs_overall_offset', '0', 'yes');
INSERT INTO `th_options` VALUES(455, 0, 'vs_startUnixTimeStamp', '1347809176', 'yes');
INSERT INTO `th_options` VALUES(456, 0, 'vs_startTimeFormat', 'Y-m-d H:s', 'yes');
INSERT INTO `th_options` VALUES(457, 0, 'vs_disconnectTime', '300', 'yes');
INSERT INTO `th_options` VALUES(458, 0, 'vs_countBots', '0', 'yes');
INSERT INTO `th_options` VALUES(459, 0, 'vs_countAdmins', '1', 'yes');
INSERT INTO `th_options` VALUES(460, 0, 'vs_displayTotal', '1', 'yes');
INSERT INTO `th_options` VALUES(461, 0, 'vs_displayCurrent', '1', 'yes');
INSERT INTO `th_options` VALUES(462, 0, 'vs_displayDaily', '0', 'yes');
INSERT INTO `th_options` VALUES(463, 0, 'vs_displayWeekly', '0', 'yes');
INSERT INTO `th_options` VALUES(338, 0, '_transient_timeout_wc_ship_e3a2af4d73897fa25b4184fbf0ad2ecc', '1347729789', 'no');
INSERT INTO `th_options` VALUES(467, 0, 'rewrite_rules', 'a:94:{s:7:"shop/?$";s:27:"index.php?post_type=product";s:37:"shop/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:32:"shop/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:24:"shop/page/([0-9]{1,})/?$";s:45:"index.php?post_type=product&paged=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:55:"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:50:"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:43:"product-category/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?product_cat=$matches[1]&paged=$matches[2]";s:25:"product-category/(.+?)/?$";s:33:"index.php?product_cat=$matches[1]";s:52:"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:47:"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:40:"product-tag/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?product_tag=$matches[1]&paged=$matches[2]";s:22:"product-tag/([^/]+)/?$";s:33:"index.php?product_tag=$matches[1]";s:32:"shop/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"shop/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:62:"shop/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"shop/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"shop/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:25:"shop/([^/]+)/trackback/?$";s:34:"index.php?product=$matches[1]&tb=1";s:45:"shop/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:40:"shop/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:33:"shop/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&paged=$matches[2]";s:40:"shop/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&cpage=$matches[2]";s:25:"shop/([^/]+)(/[0-9]+)?/?$";s:46:"index.php?product=$matches[1]&page=$matches[2]";s:21:"shop/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:31:"shop/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:51:"shop/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"shop/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"shop/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:29:"comments/page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes');
INSERT INTO `th_options` VALUES(572, 0, '_transient_wc_product_type_18', 'simple', 'yes');
INSERT INTO `th_options` VALUES(512, 0, '_transient_wc_product_type_74', 'simple', 'yes');
INSERT INTO `th_options` VALUES(513, 0, '_transient_wc_product_type_72', 'simple', 'yes');
INSERT INTO `th_options` VALUES(567, 0, '_transient_wc_product_type_25', 'simple', 'yes');
INSERT INTO `th_options` VALUES(380, 0, 'widget_nav_menu', 'a:2:{i:2;a:2:{s:5:"title";s:28:"GIỚI THIỆU THÔNG HỒNG";s:8:"nav_menu";i:18;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(381, 0, 'widget_shopping_cart', 'a:2:{i:2;a:2:{s:5:"title";s:11:"GIỎ HÀNG";s:13:"hide_if_empty";i:1;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(382, 0, 'widget_woocommerce_random_products', 'a:2:{i:2;a:3:{s:5:"title";s:24:"SẢN PHẨM THAM KHẢO";s:6:"number";i:5;s:15:"show_variations";b:0;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(387, 0, '_transient_timeout_wc_ship_793eb17ed13386d3447c5916da974611', '1347771511', 'no');
INSERT INTO `th_options` VALUES(507, 0, '_transient_wc_product_type_89', 'simple', 'yes');
INSERT INTO `th_options` VALUES(390, 0, 'magic_contact_version', '0.2', 'yes');
INSERT INTO `th_options` VALUES(391, 0, 'sl_map_type', 'roadmap', 'yes');
INSERT INTO `th_options` VALUES(392, 0, 'csl-slplus-installed_base_version', '3.0.8', 'yes');
INSERT INTO `th_options` VALUES(304, 0, '_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e', '1347755109', 'no');
INSERT INTO `th_options` VALUES(305, 0, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '', 'no');
INSERT INTO `th_options` VALUES(141, 0, '_transient_timeout_plugin_slugs', '1347984586', 'no');
INSERT INTO `th_options` VALUES(142, 0, '_transient_plugin_slugs', 'a:7:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";i:2;s:19:"ql_bill/ql_bill.php";i:3;s:27:"woocommerce/woocommerce.php";i:4;s:33:"visits-counter/visits_counter.php";i:5;s:37:"yahoo-and-skype-status/yahooskype.php";i:6;s:16:"dang-ky/main.php";}', 'no');
INSERT INTO `th_options` VALUES(389, 0, 'magic_contact_options', 'a:15:{s:17:"recipient_contact";s:20:"lgthnha@yahoo.com.vn";s:15:"subject_contact";s:21:"Nội dung liên hệ";s:18:"label_name_contact";s:15:"Tên liên hệ";s:19:"label_email_contact";s:6:"E-mail";s:19:"label_phone_contact";s:15:"Điện thoại";s:21:"label_website_contact";s:7:"Website";s:22:"label_feedback_contact";s:10:"Nội dung";s:18:"label_send_contact";s:5:"Gửi";s:19:"recievedMsg_contact";s:38:"Cảm ơn bạn đã gửi thông tin!";s:22:"notRecievedMsg_contact";s:56:"Yêu cầu không gửi được, vui lòng thử lại!";s:18:"disclaimer_contact";s:106:"Xin vui lòng điền thông tin yêu cầu, chúng tôi xin hân hạnh được phục vụ quý khách!";s:18:"hide_email_contact";b:0;s:18:"hide_phone_contact";b:0;s:20:"hide_website_contact";b:1;s:12:"side_contact";s:5:"right";}', 'yes');
INSERT INTO `th_options` VALUES(314, 0, 'custom_page_extensions_options', 'a:1:{s:12:"random-value";s:5:"81538";}', 'yes');
INSERT INTO `th_options` VALUES(410, 0, 'sl_search_label', 'Address', 'yes');
INSERT INTO `th_options` VALUES(411, 0, 'sl_name_label', '', 'yes');
INSERT INTO `th_options` VALUES(412, 0, 'sl_location_table_view', 'Normal', 'yes');
INSERT INTO `th_options` VALUES(511, 0, '_transient_wc_product_type_76', 'simple', 'yes');
INSERT INTO `th_options` VALUES(408, 0, 'sl_zoom_level', '4', 'yes');
INSERT INTO `th_options` VALUES(409, 0, 'sl_zoom_tweak', '1', 'yes');
INSERT INTO `th_options` VALUES(394, 0, 'sl_map_character_encoding', '', 'yes');
INSERT INTO `th_options` VALUES(395, 0, 'sl_instruction_message', 'Enter Your Address or Zip Code Above.', 'yes');
INSERT INTO `th_options` VALUES(396, 0, 'sl_admin_locations_per_page', '100', 'yes');
INSERT INTO `th_options` VALUES(397, 0, 'sl_map_overview_control', '0', 'yes');
INSERT INTO `th_options` VALUES(398, 0, 'sl_distance_unit', 'miles', 'yes');
INSERT INTO `th_options` VALUES(399, 0, 'sl_load_locations_default', '1', 'yes');
INSERT INTO `th_options` VALUES(400, 0, 'sl_num_initial_displayed', '25', 'yes');
INSERT INTO `th_options` VALUES(401, 0, 'sl_website_label', 'Website', 'yes');
INSERT INTO `th_options` VALUES(402, 0, 'sl_radius_label', 'Radius', 'yes');
INSERT INTO `th_options` VALUES(403, 0, 'sl_remove_credits', '0', 'yes');
INSERT INTO `th_options` VALUES(404, 0, 'sl_use_name_search', '0', 'yes');
INSERT INTO `th_options` VALUES(405, 0, 'sl_use_city_search', '1', 'yes');
INSERT INTO `th_options` VALUES(406, 0, 'sl_use_country_search', '1', 'yes');
INSERT INTO `th_options` VALUES(407, 0, 'slplus_show_state_pd', '1', 'yes');
INSERT INTO `th_options` VALUES(147, 0, 'recently_activated', 'a:1:{s:37:"store-locator-le/store-locator-le.php";i:1347863540;}', 'yes');
INSERT INTO `th_options` VALUES(148, 0, 'skip_install_woocommerce_pages', '1', 'yes');
INSERT INTO `th_options` VALUES(149, 0, 'woocommerce_installed', '0', 'yes');
INSERT INTO `th_options` VALUES(150, 0, 'woocommerce_default_country', 'VN', 'yes');
INSERT INTO `th_options` VALUES(151, 0, 'woocommerce_currency', 'đ', 'yes');
INSERT INTO `th_options` VALUES(152, 0, 'woocommerce_allowed_countries', 'specific', 'yes');
INSERT INTO `th_options` VALUES(153, 0, 'woocommerce_specific_allowed_countries', 'a:0:{}', 'yes');
INSERT INTO `th_options` VALUES(154, 0, 'woocommerce_informal_localisation_type', 'no', 'yes');
INSERT INTO `th_options` VALUES(155, 0, 'woocommerce_enable_guest_checkout', 'yes', 'yes');
INSERT INTO `th_options` VALUES(156, 0, 'woocommerce_enable_order_comments', 'yes', 'yes');
INSERT INTO `th_options` VALUES(157, 0, 'woocommerce_force_ssl_checkout', 'no', 'yes');
INSERT INTO `th_options` VALUES(158, 0, 'woocommerce_unforce_ssl_checkout', 'no', 'yes');
INSERT INTO `th_options` VALUES(159, 0, 'woocommerce_enable_coupons', 'yes', 'yes');
INSERT INTO `th_options` VALUES(160, 0, 'woocommerce_enable_coupon_form_on_cart', 'yes', 'yes');
INSERT INTO `th_options` VALUES(161, 0, 'woocommerce_enable_coupon_form_on_checkout', 'no', 'yes');
INSERT INTO `th_options` VALUES(162, 0, 'woocommerce_enable_signup_and_login_from_checkout', 'yes', 'yes');
INSERT INTO `th_options` VALUES(163, 0, 'woocommerce_enable_myaccount_registration', 'no', 'yes');
INSERT INTO `th_options` VALUES(164, 0, 'woocommerce_registration_email_for_username', 'no', 'yes');
INSERT INTO `th_options` VALUES(165, 0, 'woocommerce_lock_down_admin', 'no', 'yes');
INSERT INTO `th_options` VALUES(166, 0, 'woocommerce_clear_cart_on_logout', 'no', 'yes');
INSERT INTO `th_options` VALUES(167, 0, 'woocommerce_allow_customers_to_reorder', 'no', 'yes');
INSERT INTO `th_options` VALUES(168, 0, 'woocommerce_frontend_css', 'yes', 'yes');
INSERT INTO `th_options` VALUES(169, 0, 'woocommerce_demo_store', 'no', 'yes');
INSERT INTO `th_options` VALUES(170, 0, 'woocommerce_demo_store_notice', 'This is a demo store for testing purposes — no orders shall be fulfilled.', 'yes');
INSERT INTO `th_options` VALUES(171, 0, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes');
INSERT INTO `th_options` VALUES(172, 0, 'woocommerce_enable_lightbox', 'yes', 'yes');
INSERT INTO `th_options` VALUES(173, 0, 'woocommerce_enable_chosen', 'yes', 'yes');
INSERT INTO `th_options` VALUES(174, 0, 'woocommerce_file_download_method', 'force', 'yes');
INSERT INTO `th_options` VALUES(175, 0, 'woocommerce_downloads_require_login', 'no', 'yes');
INSERT INTO `th_options` VALUES(176, 0, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'yes');
INSERT INTO `th_options` VALUES(177, 0, 'woocommerce_limit_downloadable_product_qty', 'yes', 'yes');
INSERT INTO `th_options` VALUES(178, 0, 'woocommerce_shop_page_id', '4', 'yes');
INSERT INTO `th_options` VALUES(179, 0, 'woocommerce_shop_page_title', 'Tất cả sản phẩm', 'yes');
INSERT INTO `th_options` VALUES(180, 0, 'woocommerce_terms_page_id', '', 'yes');
INSERT INTO `th_options` VALUES(181, 0, 'woocommerce_menu_logout_link', 'yes', 'yes');
INSERT INTO `th_options` VALUES(182, 0, 'woocommerce_prepend_shop_page_to_urls', 'no', 'yes');
INSERT INTO `th_options` VALUES(183, 0, 'woocommerce_product_category_slug', '', 'yes');
INSERT INTO `th_options` VALUES(184, 0, 'woocommerce_product_tag_slug', '', 'yes');
INSERT INTO `th_options` VALUES(185, 0, 'woocommerce_prepend_shop_page_to_products', 'yes', 'yes');
INSERT INTO `th_options` VALUES(186, 0, 'woocommerce_prepend_category_to_products', 'no', 'yes');
INSERT INTO `th_options` VALUES(187, 0, 'woocommerce_cart_page_id', '5', 'yes');
INSERT INTO `th_options` VALUES(188, 0, 'woocommerce_checkout_page_id', '6', 'yes');
INSERT INTO `th_options` VALUES(189, 0, 'woocommerce_pay_page_id', '12', 'yes');
INSERT INTO `th_options` VALUES(190, 0, 'woocommerce_thanks_page_id', '13', 'yes');
INSERT INTO `th_options` VALUES(191, 0, 'woocommerce_myaccount_page_id', '8', 'yes');
INSERT INTO `th_options` VALUES(192, 0, 'woocommerce_edit_address_page_id', '9', 'yes');
INSERT INTO `th_options` VALUES(193, 0, 'woocommerce_view_order_page_id', '10', 'yes');
INSERT INTO `th_options` VALUES(194, 0, 'woocommerce_change_password_page_id', '11', 'yes');
INSERT INTO `th_options` VALUES(195, 0, 'woocommerce_default_catalog_orderby', 'title', 'yes');
INSERT INTO `th_options` VALUES(196, 0, 'woocommerce_show_subcategories', 'no', 'yes');
INSERT INTO `th_options` VALUES(197, 0, 'woocommerce_shop_show_subcategories', 'no', 'yes');
INSERT INTO `th_options` VALUES(198, 0, 'woocommerce_hide_products_when_showing_subcategories', 'no', 'yes');
INSERT INTO `th_options` VALUES(199, 0, 'woocommerce_cart_redirect_after_add', 'no', 'yes');
INSERT INTO `th_options` VALUES(200, 0, 'woocommerce_redirect_on_single_search_result', 'no', 'yes');
INSERT INTO `th_options` VALUES(201, 0, 'woocommerce_enable_sku', 'yes', 'yes');
INSERT INTO `th_options` VALUES(202, 0, 'woocommerce_enable_weight', 'yes', 'yes');
INSERT INTO `th_options` VALUES(203, 0, 'woocommerce_enable_dimensions', 'yes', 'yes');
INSERT INTO `th_options` VALUES(204, 0, 'woocommerce_enable_dimension_product_attributes', 'yes', 'yes');
INSERT INTO `th_options` VALUES(205, 0, 'woocommerce_weight_unit', 'kg', 'yes');
INSERT INTO `th_options` VALUES(206, 0, 'woocommerce_dimension_unit', 'cm', 'yes');
INSERT INTO `th_options` VALUES(207, 0, 'woocommerce_enable_review_rating', 'yes', 'yes');
INSERT INTO `th_options` VALUES(208, 0, 'woocommerce_review_rating_required', 'yes', 'yes');
INSERT INTO `th_options` VALUES(209, 0, 'woocommerce_review_rating_verification_label', 'yes', 'yes');
INSERT INTO `th_options` VALUES(210, 0, 'woocommerce_currency_pos', 'left', 'yes');
INSERT INTO `th_options` VALUES(211, 0, 'woocommerce_price_thousand_sep', ',', 'yes');
INSERT INTO `th_options` VALUES(212, 0, 'woocommerce_price_decimal_sep', '.', 'yes');
INSERT INTO `th_options` VALUES(213, 0, 'woocommerce_price_num_decimals', '2', 'yes');
INSERT INTO `th_options` VALUES(214, 0, 'woocommerce_price_trim_zeros', 'yes', 'yes');
INSERT INTO `th_options` VALUES(215, 0, 'woocommerce_catalog_image_width', '150', 'yes');
INSERT INTO `th_options` VALUES(216, 0, 'woocommerce_catalog_image_height', '150', 'yes');
INSERT INTO `th_options` VALUES(217, 0, 'woocommerce_single_image_width', '300', 'yes');
INSERT INTO `th_options` VALUES(218, 0, 'woocommerce_single_image_height', '300', 'yes');
INSERT INTO `th_options` VALUES(219, 0, 'woocommerce_thumbnail_image_width', '90', 'yes');
INSERT INTO `th_options` VALUES(220, 0, 'woocommerce_thumbnail_image_height', '90', 'yes');
INSERT INTO `th_options` VALUES(221, 0, 'woocommerce_manage_stock', 'yes', 'yes');
INSERT INTO `th_options` VALUES(222, 0, 'woocommerce_notify_low_stock', 'yes', 'yes');
INSERT INTO `th_options` VALUES(223, 0, 'woocommerce_notify_no_stock', 'yes', 'yes');
INSERT INTO `th_options` VALUES(224, 0, 'woocommerce_notify_low_stock_amount', '2', 'yes');
INSERT INTO `th_options` VALUES(225, 0, 'woocommerce_notify_no_stock_amount', '0', 'yes');
INSERT INTO `th_options` VALUES(226, 0, 'woocommerce_hide_out_of_stock_items', 'no', 'yes');
INSERT INTO `th_options` VALUES(227, 0, 'woocommerce_stock_format', '', 'yes');
INSERT INTO `th_options` VALUES(228, 0, 'woocommerce_calc_shipping', 'yes', 'yes');
INSERT INTO `th_options` VALUES(229, 0, 'woocommerce_enable_shipping_calc', 'yes', 'yes');
INSERT INTO `th_options` VALUES(230, 0, 'woocommerce_shipping_cost_requires_address', 'no', 'yes');
INSERT INTO `th_options` VALUES(231, 0, 'woocommerce_shipping_method_format', '', 'yes');
INSERT INTO `th_options` VALUES(232, 0, 'woocommerce_ship_to_billing_address_only', 'no', 'yes');
INSERT INTO `th_options` VALUES(233, 0, 'woocommerce_ship_to_same_address', 'yes', 'yes');
INSERT INTO `th_options` VALUES(234, 0, 'woocommerce_require_shipping_address', 'no', 'yes');
INSERT INTO `th_options` VALUES(235, 0, 'woocommerce_calc_taxes', 'yes', 'yes');
INSERT INTO `th_options` VALUES(236, 0, 'woocommerce_display_cart_taxes', 'yes', 'yes');
INSERT INTO `th_options` VALUES(237, 0, 'woocommerce_display_cart_taxes_if_zero', 'no', 'yes');
INSERT INTO `th_options` VALUES(238, 0, 'woocommerce_tax_round_at_subtotal', 'no', 'yes');
INSERT INTO `th_options` VALUES(239, 0, 'woocommerce_prices_include_tax', 'no', 'yes');
INSERT INTO `th_options` VALUES(240, 0, 'woocommerce_display_cart_prices_excluding_tax', 'yes', 'yes');
INSERT INTO `th_options` VALUES(241, 0, 'woocommerce_display_totals_excluding_tax', 'yes', 'yes');
INSERT INTO `th_options` VALUES(242, 0, 'woocommerce_tax_classes', 'Reduced Rate\r\nZero Rate', 'yes');
INSERT INTO `th_options` VALUES(243, 0, 'woocommerce_tax_rates', '', 'yes');
INSERT INTO `th_options` VALUES(244, 0, 'woocommerce_new_order_email_recipient', 'lgthnha@yahoo.com.vn', 'yes');
INSERT INTO `th_options` VALUES(245, 0, 'woocommerce_stock_email_recipient', 'lgthnha@yahoo.com.vn', 'yes');
INSERT INTO `th_options` VALUES(246, 0, 'woocommerce_email_from_name', 'TRÀ THÔNG HỒNG', 'yes');
INSERT INTO `th_options` VALUES(247, 0, 'woocommerce_email_from_address', 'lgthnha@yahoo.com.vn', 'yes');
INSERT INTO `th_options` VALUES(248, 0, 'woocommerce_email_header_image', '', 'yes');
INSERT INTO `th_options` VALUES(249, 0, 'woocommerce_email_footer_text', 'TRÀ THÔNG HỒNG', 'yes');
INSERT INTO `th_options` VALUES(250, 0, 'woocommerce_email_base_color', '#557da1', 'yes');
INSERT INTO `th_options` VALUES(251, 0, 'woocommerce_email_background_color', '#eeeeee', 'yes');
INSERT INTO `th_options` VALUES(252, 0, 'woocommerce_email_body_background_color', '#fdfdfd', 'yes');
INSERT INTO `th_options` VALUES(253, 0, 'woocommerce_email_text_color', '#505050', 'yes');
INSERT INTO `th_options` VALUES(254, 0, 'woocommerce_shop_slug', 'shop', 'yes');
INSERT INTO `th_options` VALUES(576, 0, '_transient_woocommerce_processing_order_count', '0', 'yes');
INSERT INTO `th_options` VALUES(256, 0, 'woocommerce_db_version', '1.6.5.2', 'yes');
INSERT INTO `th_options` VALUES(257, 0, 'woocommerce_order_tracking_page_id', '7', 'yes');
INSERT INTO `th_options` VALUES(258, 0, 'woocommerce_frontend_css_colors', 'a:5:{s:7:"primary";s:7:"#ad74a2";s:9:"secondary";s:7:"#f7f6f7";s:9:"highlight";s:7:"#85ad74";s:10:"content_bg";s:7:"#ffffff";s:7:"subtext";s:7:"#777777";}', 'yes');
INSERT INTO `th_options` VALUES(259, 0, 'woocommerce_catalog_image_crop', '1', 'yes');
INSERT INTO `th_options` VALUES(260, 0, 'woocommerce_single_image_crop', '1', 'yes');
INSERT INTO `th_options` VALUES(261, 0, 'woocommerce_thumbnail_image_crop', '1', 'yes');
INSERT INTO `th_options` VALUES(262, 0, 'theme_mods_twentyeleven', 'a:2:{s:18:"nav_menu_locations";a:1:{s:7:"primary";i:14;}s:16:"background_color";s:0:"";}', 'yes');
INSERT INTO `th_options` VALUES(263, 0, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes');
INSERT INTO `th_options` VALUES(266, 0, 'woocommerce_errors', '', 'yes');
INSERT INTO `th_options` VALUES(452, 0, 'product_cat_children', 'a:2:{i:15;a:3:{i:0;i:22;i:1;i:23;i:2;i:24;}i:16;a:2:{i:0;i:25;i:1;i:26;}}', 'yes');
INSERT INTO `th_options` VALUES(278, 0, 'product_shipping_class_children', 'a:0:{}', 'yes');
INSERT INTO `th_options` VALUES(283, 0, 'category_children', 'a:0:{}', 'yes');
INSERT INTO `th_options` VALUES(284, 0, 'widget_product_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(393, 0, 'csl-slplus-db_version', '2.7', 'yes');
INSERT INTO `th_options` VALUES(509, 0, '_transient_wc_product_type_86', 'simple', 'yes');
INSERT INTO `th_options` VALUES(385, 0, '_transient_timeout_wc_ship_828eabc1827c3ed399a0134cfea1825a', '1347771309', 'no');
INSERT INTO `th_options` VALUES(561, 0, '_transient_wc_product_type_103', 'simple', 'yes');
INSERT INTO `th_options` VALUES(562, 0, '_transient_wc_product_type_99', 'simple', 'yes');
INSERT INTO `th_options` VALUES(505, 0, '_transient_wc_product_type_96', 'simple', 'yes');
INSERT INTO `th_options` VALUES(528, 0, '_transient_wc_product_type_101', 'simple', 'yes');
INSERT INTO `th_options` VALUES(549, 0, '_transient_wc_product_type_121', 'simple', 'yes');
INSERT INTO `th_options` VALUES(550, 0, '_transient_wc_product_type_119', 'simple', 'yes');
INSERT INTO `th_options` VALUES(551, 0, '_transient_wc_product_type_117', 'simple', 'yes');
INSERT INTO `th_options` VALUES(552, 0, '_transient_wc_product_type_115', 'simple', 'yes');
INSERT INTO `th_options` VALUES(557, 0, '_transient_wc_product_type_123', 'simple', 'yes');
INSERT INTO `th_options` VALUES(553, 0, '_transient_wc_product_type_113', 'simple', 'yes');
INSERT INTO `th_options` VALUES(558, 0, '_transient_wc_product_type_111', 'simple', 'yes');
INSERT INTO `th_options` VALUES(559, 0, '_transient_wc_product_type_109', 'simple', 'yes');
INSERT INTO `th_options` VALUES(556, 0, '_transient_wc_product_type_107', 'simple', 'yes');
INSERT INTO `th_options` VALUES(615, 0, 'widget_yahoo_skype_status', 'a:2:{i:2;a:61:{s:5:"title";s:25:"HỖ TRỢ TRỰC TUYẾN";s:6:"nick_1";s:10:"tranlu_244";s:14:"is_show_name_1";s:1:"1";s:11:"nick_name_1";s:11:"TRẦN LỰ";s:11:"nick_type_1";s:5:"yahoo";s:19:"yahoo_status_type_1";s:1:"0";s:19:"skype_status_type_1";s:12:"smallclassic";s:6:"nick_2";s:12:"trathonghong";s:14:"is_show_name_2";s:1:"1";s:11:"nick_name_2";s:18:"TRÀ THÔNG HỒNG";s:11:"nick_type_2";s:5:"yahoo";s:19:"yahoo_status_type_2";s:1:"0";s:19:"skype_status_type_2";s:12:"smallclassic";s:6:"nick_3";s:0:"";s:14:"is_show_name_3";s:1:"1";s:11:"nick_name_3";s:0:"";s:11:"nick_type_3";s:5:"yahoo";s:19:"yahoo_status_type_3";s:1:"0";s:19:"skype_status_type_3";s:12:"smallclassic";s:6:"nick_4";s:0:"";s:14:"is_show_name_4";s:1:"1";s:11:"nick_name_4";s:0:"";s:11:"nick_type_4";s:5:"yahoo";s:19:"yahoo_status_type_4";s:1:"0";s:19:"skype_status_type_4";s:12:"smallclassic";s:6:"nick_5";s:0:"";s:14:"is_show_name_5";s:1:"1";s:11:"nick_name_5";s:0:"";s:11:"nick_type_5";s:5:"yahoo";s:19:"yahoo_status_type_5";s:1:"0";s:19:"skype_status_type_5";s:12:"smallclassic";s:6:"nick_6";s:0:"";s:14:"is_show_name_6";s:1:"1";s:11:"nick_name_6";s:0:"";s:11:"nick_type_6";s:5:"yahoo";s:19:"yahoo_status_type_6";s:1:"0";s:19:"skype_status_type_6";s:12:"smallclassic";s:6:"nick_7";s:0:"";s:14:"is_show_name_7";s:1:"1";s:11:"nick_name_7";s:0:"";s:11:"nick_type_7";s:5:"yahoo";s:19:"yahoo_status_type_7";s:1:"0";s:19:"skype_status_type_7";s:12:"smallclassic";s:6:"nick_8";s:0:"";s:14:"is_show_name_8";s:1:"1";s:11:"nick_name_8";s:0:"";s:11:"nick_type_8";s:5:"yahoo";s:19:"yahoo_status_type_8";s:1:"0";s:19:"skype_status_type_8";s:12:"smallclassic";s:6:"nick_9";s:0:"";s:14:"is_show_name_9";s:1:"1";s:11:"nick_name_9";s:0:"";s:11:"nick_type_9";s:5:"yahoo";s:19:"yahoo_status_type_9";s:1:"0";s:19:"skype_status_type_9";s:12:"smallclassic";s:7:"nick_10";s:0:"";s:15:"is_show_name_10";s:1:"1";s:12:"nick_name_10";s:0:"";s:12:"nick_type_10";s:5:"yahoo";s:20:"yahoo_status_type_10";s:1:"0";s:20:"skype_status_type_10";s:12:"smallclassic";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO `th_options` VALUES(612, 0, '_transient_wc_uf_pid_d94c6737d45169a786926646edd08ca9', 'a:6:{i:0;s:3:"126";i:1;s:3:"150";i:2;s:3:"147";i:3;s:3:"144";i:4;s:3:"141";i:5;s:3:"139";}', 'yes');
INSERT INTO `th_options` VALUES(605, 0, '_transient_wc_uf_pid_370d6573ee6dd9b33902ae6fb5abc865', 'a:13:{i:0;s:3:"101";i:1;s:2:"99";i:2;s:2:"96";i:3;s:2:"93";i:4;s:2:"91";i:5;s:2:"89";i:6;s:2:"86";i:7;s:2:"76";i:8;s:2:"74";i:9;s:2:"72";i:10;s:2:"25";i:11;s:2:"18";i:12;s:2:"16";}', 'yes');
INSERT INTO `th_options` VALUES(578, 0, '_transient_wc_product_type_16', 'simple', 'yes');
INSERT INTO `th_options` VALUES(593, 0, '_transient_wc_product_type_150', 'simple', 'yes');
INSERT INTO `th_options` VALUES(594, 0, '_transient_wc_product_type_147', 'simple', 'yes');
INSERT INTO `th_options` VALUES(597, 0, '_transient_wc_product_type_144', 'simple', 'yes');
INSERT INTO `th_options` VALUES(599, 0, '_transient_wc_product_type_139', 'simple', 'yes');
INSERT INTO `th_options` VALUES(598, 0, '_transient_wc_product_type_141', 'simple', 'yes');
INSERT INTO `th_options` VALUES(603, 0, '_transient_wc_product_type_126', 'simple', 'yes');
INSERT INTO `th_options` VALUES(604, 0, '_transient_wc_uf_pid_98445f98e21fece4c092bccf3dc7ac25', 'a:30:{i:0;s:3:"126";i:1;s:3:"150";i:2;s:3:"147";i:3;s:3:"144";i:4;s:3:"141";i:5;s:3:"139";i:6;s:3:"123";i:7;s:3:"121";i:8;s:3:"119";i:9;s:3:"117";i:10;s:3:"115";i:11;s:3:"113";i:12;s:3:"111";i:13;s:3:"109";i:14;s:3:"107";i:15;s:3:"105";i:16;s:3:"103";i:17;s:3:"101";i:18;s:2:"99";i:19;s:2:"96";i:20;s:2:"93";i:21;s:2:"91";i:22;s:2:"89";i:23;s:2:"86";i:24;s:2:"76";i:25;s:2:"74";i:26;s:2:"72";i:27;s:2:"25";i:28;s:2:"18";i:29;s:2:"16";}', 'yes');
INSERT INTO `th_options` VALUES(607, 0, '_transient_wc_uf_pid_046fb472fb690fc7a407ac891209a3ec', 'a:1:{i:0;s:3:"150";}', 'yes');
INSERT INTO `th_options` VALUES(608, 0, '_transient_wc_uf_pid_13bc2774a8652b84a338134dbc967f12', 'a:2:{i:0;s:3:"147";i:1;s:3:"144";}', 'yes');
INSERT INTO `th_options` VALUES(609, 0, '_transient_wc_uf_pid_6b8d8e9526ba9cd40d143982b81e4ced', 'a:3:{i:0;s:3:"126";i:1;s:3:"141";i:2;s:3:"139";}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `th_postmeta`
--

CREATE TABLE `th_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1208 ;

--
-- Dumping data for table `th_postmeta`
--

INSERT INTO `th_postmeta` VALUES(1, 2, '_wp_page_template', 'default');
INSERT INTO `th_postmeta` VALUES(915, 130, '_menu_item_object', 'custom');
INSERT INTO `th_postmeta` VALUES(914, 130, '_menu_item_object_id', '130');
INSERT INTO `th_postmeta` VALUES(913, 130, '_menu_item_menu_item_parent', '128');
INSERT INTO `th_postmeta` VALUES(912, 130, '_menu_item_type', 'custom');
INSERT INTO `th_postmeta` VALUES(971, 136, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(21, 16, '_edit_lock', '1347897663:1');
INSERT INTO `th_postmeta` VALUES(11, 15, '_menu_item_type', 'post_type');
INSERT INTO `th_postmeta` VALUES(12, 15, '_menu_item_menu_item_parent', '0');
INSERT INTO `th_postmeta` VALUES(13, 15, '_menu_item_object_id', '4');
INSERT INTO `th_postmeta` VALUES(14, 15, '_menu_item_object', 'page');
INSERT INTO `th_postmeta` VALUES(15, 15, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(16, 15, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(17, 15, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(18, 15, '_menu_item_url', '');
INSERT INTO `th_postmeta` VALUES(20, 16, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(22, 16, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(23, 16, '_regular_price', '30000');
INSERT INTO `th_postmeta` VALUES(24, 16, '_sale_price', '20000');
INSERT INTO `th_postmeta` VALUES(25, 16, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(26, 16, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(27, 16, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(28, 16, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(29, 16, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(30, 16, '_weight', '3');
INSERT INTO `th_postmeta` VALUES(31, 16, '_length', '');
INSERT INTO `th_postmeta` VALUES(32, 16, '_width', '');
INSERT INTO `th_postmeta` VALUES(33, 16, '_height', '');
INSERT INTO `th_postmeta` VALUES(34, 16, '_sku', '');
INSERT INTO `th_postmeta` VALUES(35, 16, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(36, 16, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(37, 16, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(38, 16, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(39, 16, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(40, 16, '_price', '20000');
INSERT INTO `th_postmeta` VALUES(41, 16, '_stock', '');
INSERT INTO `th_postmeta` VALUES(42, 16, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(43, 16, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(44, 16, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(45, 18, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(46, 18, '_edit_lock', '1347897650:1');
INSERT INTO `th_postmeta` VALUES(47, 18, 'total_sales', '3');
INSERT INTO `th_postmeta` VALUES(48, 18, '_regular_price', '12000');
INSERT INTO `th_postmeta` VALUES(49, 18, '_sale_price', '1000');
INSERT INTO `th_postmeta` VALUES(50, 18, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(51, 18, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(52, 18, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(53, 18, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(54, 18, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(55, 18, '_weight', '2');
INSERT INTO `th_postmeta` VALUES(56, 18, '_length', '');
INSERT INTO `th_postmeta` VALUES(57, 18, '_width', '');
INSERT INTO `th_postmeta` VALUES(58, 18, '_height', '');
INSERT INTO `th_postmeta` VALUES(59, 18, '_sku', '');
INSERT INTO `th_postmeta` VALUES(60, 18, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(61, 18, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(62, 18, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(63, 18, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(64, 18, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(65, 18, '_price', '1000');
INSERT INTO `th_postmeta` VALUES(66, 18, '_stock', '');
INSERT INTO `th_postmeta` VALUES(67, 18, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(68, 18, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(69, 18, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(972, 136, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(887, 125, '_wp_attached_file', '2012/09/atiso.jpg');
INSERT INTO `th_postmeta` VALUES(891, 125, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(889, 125, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:17:"2012/09/atiso.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:3:{s:4:"file";s:17:"atiso-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:15:"atiso-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:17:"atiso-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(893, 126, '_edit_lock', '1347895228:1');
INSERT INTO `th_postmeta` VALUES(916, 130, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(917, 130, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(918, 130, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(919, 130, '_menu_item_url', '/trathonghong/product-category/tra-thong-hong-tra-vinh-tien/tra-vinh-tien/');
INSERT INTO `th_postmeta` VALUES(970, 136, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(921, 131, '_menu_item_type', 'custom');
INSERT INTO `th_postmeta` VALUES(922, 131, '_menu_item_menu_item_parent', '0');
INSERT INTO `th_postmeta` VALUES(923, 131, '_menu_item_object_id', '131');
INSERT INTO `th_postmeta` VALUES(924, 131, '_menu_item_object', 'custom');
INSERT INTO `th_postmeta` VALUES(925, 131, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(926, 131, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(927, 131, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(928, 131, '_menu_item_url', '/trathonghong/product-category/quan-ao-thoi-trang-len-thong-hong/');
INSERT INTO `th_postmeta` VALUES(930, 132, '_menu_item_type', 'custom');
INSERT INTO `th_postmeta` VALUES(931, 132, '_menu_item_menu_item_parent', '131');
INSERT INTO `th_postmeta` VALUES(932, 132, '_menu_item_object_id', '132');
INSERT INTO `th_postmeta` VALUES(933, 132, '_menu_item_object', 'custom');
INSERT INTO `th_postmeta` VALUES(934, 132, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(935, 132, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(936, 132, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(937, 132, '_menu_item_url', '/trathonghong/product-category/quan-ao-thoi-trang-len-thong-hong/quan-ao-len/');
INSERT INTO `th_postmeta` VALUES(939, 133, '_menu_item_type', 'custom');
INSERT INTO `th_postmeta` VALUES(940, 133, '_menu_item_menu_item_parent', '131');
INSERT INTO `th_postmeta` VALUES(941, 133, '_menu_item_object_id', '133');
INSERT INTO `th_postmeta` VALUES(942, 133, '_menu_item_object', 'custom');
INSERT INTO `th_postmeta` VALUES(943, 133, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(944, 133, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(945, 133, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(946, 133, '_menu_item_url', '/trathonghong/product-category/quan-ao-thoi-trang-len-thong-hong/tui-xach-len/');
INSERT INTO `th_postmeta` VALUES(948, 134, '_menu_item_type', 'custom');
INSERT INTO `th_postmeta` VALUES(949, 134, '_menu_item_menu_item_parent', '131');
INSERT INTO `th_postmeta` VALUES(950, 134, '_menu_item_object_id', '134');
INSERT INTO `th_postmeta` VALUES(951, 134, '_menu_item_object', 'custom');
INSERT INTO `th_postmeta` VALUES(952, 134, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(953, 134, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(954, 134, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(955, 134, '_menu_item_url', '/trathonghong/product-category/quan-ao-thoi-trang-len-thong-hong/san-pham-len-khac/');
INSERT INTO `th_postmeta` VALUES(957, 135, '_menu_item_type', 'custom');
INSERT INTO `th_postmeta` VALUES(958, 135, '_menu_item_menu_item_parent', '0');
INSERT INTO `th_postmeta` VALUES(959, 135, '_menu_item_object_id', '135');
INSERT INTO `th_postmeta` VALUES(960, 135, '_menu_item_object', 'custom');
INSERT INTO `th_postmeta` VALUES(961, 135, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(962, 135, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(963, 135, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(964, 135, '_menu_item_url', '/trathonghong/product-category/nuoc-cot-trai-cay-thong-hong/');
INSERT INTO `th_postmeta` VALUES(966, 136, '_menu_item_type', 'custom');
INSERT INTO `th_postmeta` VALUES(967, 136, '_menu_item_menu_item_parent', '0');
INSERT INTO `th_postmeta` VALUES(968, 136, '_menu_item_object_id', '136');
INSERT INTO `th_postmeta` VALUES(969, 136, '_menu_item_object', 'custom');
INSERT INTO `th_postmeta` VALUES(1017, 139, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(993, 140, '_wp_attached_file', '2012/09/DSC00801.jpg');
INSERT INTO `th_postmeta` VALUES(994, 140, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(995, 140, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:4:"2592";s:6:"height";s:4:"1944";s:14:"hwstring_small";s:23:"height=''96'' width=''128''";s:4:"file";s:20:"2012/09/DSC00801.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"DSC00801-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"DSC00801-300x225.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"225";}s:5:"large";a:3:{s:4:"file";s:21:"DSC00801-1024x768.jpg";s:5:"width";s:4:"1024";s:6:"height";s:3:"768";}s:14:"post-thumbnail";a:3:{s:4:"file";s:21:"DSC00801-1000x288.jpg";s:5:"width";s:4:"1000";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:21:"DSC00801-1000x288.jpg";s:5:"width";s:4:"1000";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"DSC00801-400x300.jpg";s:5:"width";s:3:"400";s:6:"height";s:3:"300";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:18:"DSC00801-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:20:"DSC00801-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:11:"shop_single";a:3:{s:4:"file";s:20:"DSC00801-300x300.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(996, 139, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(997, 139, '_edit_lock', '1347895529:1');
INSERT INTO `th_postmeta` VALUES(998, 139, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(999, 139, '_regular_price', '120000');
INSERT INTO `th_postmeta` VALUES(1000, 139, '_sale_price', '100000');
INSERT INTO `th_postmeta` VALUES(1001, 139, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(1002, 139, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(1003, 139, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(1004, 139, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(1005, 139, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(1006, 139, '_weight', '');
INSERT INTO `th_postmeta` VALUES(1007, 139, '_length', '');
INSERT INTO `th_postmeta` VALUES(1008, 139, '_width', '');
INSERT INTO `th_postmeta` VALUES(1009, 139, '_height', '');
INSERT INTO `th_postmeta` VALUES(1010, 139, '_sku', '');
INSERT INTO `th_postmeta` VALUES(1011, 139, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(1012, 139, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(1013, 139, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(1014, 139, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(1015, 139, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(1016, 139, '_price', '100000');
INSERT INTO `th_postmeta` VALUES(92, 25, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(93, 25, '_edit_lock', '1347897635:1');
INSERT INTO `th_postmeta` VALUES(973, 136, '_menu_item_url', '/trathonghong/product-category/ruoi-vang-thong-hong/');
INSERT INTO `th_postmeta` VALUES(975, 137, '_menu_item_type', 'custom');
INSERT INTO `th_postmeta` VALUES(976, 137, '_menu_item_menu_item_parent', '0');
INSERT INTO `th_postmeta` VALUES(977, 137, '_menu_item_object_id', '137');
INSERT INTO `th_postmeta` VALUES(978, 137, '_menu_item_object', 'custom');
INSERT INTO `th_postmeta` VALUES(979, 137, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(980, 137, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(981, 137, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(982, 137, '_menu_item_url', '/trathonghong/shop/muc-keo-da-lat');
INSERT INTO `th_postmeta` VALUES(984, 138, '_menu_item_type', 'custom');
INSERT INTO `th_postmeta` VALUES(985, 138, '_menu_item_menu_item_parent', '0');
INSERT INTO `th_postmeta` VALUES(986, 138, '_menu_item_object_id', '138');
INSERT INTO `th_postmeta` VALUES(987, 138, '_menu_item_object', 'custom');
INSERT INTO `th_postmeta` VALUES(988, 138, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(989, 138, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(990, 138, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(991, 138, '_menu_item_url', '/trathonghong/product-category/san-pham-bo-duong-thong-hong/');
INSERT INTO `th_postmeta` VALUES(102, 25, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(103, 25, '_regular_price', '');
INSERT INTO `th_postmeta` VALUES(104, 25, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(105, 25, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(106, 25, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(107, 25, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(108, 25, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(109, 25, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(110, 25, '_weight', '');
INSERT INTO `th_postmeta` VALUES(111, 25, '_length', '');
INSERT INTO `th_postmeta` VALUES(112, 25, '_width', '');
INSERT INTO `th_postmeta` VALUES(113, 25, '_height', '');
INSERT INTO `th_postmeta` VALUES(114, 25, '_sku', '');
INSERT INTO `th_postmeta` VALUES(115, 25, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(116, 25, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(117, 25, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(118, 25, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(119, 25, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(120, 25, '_price', '');
INSERT INTO `th_postmeta` VALUES(121, 25, '_stock', '');
INSERT INTO `th_postmeta` VALUES(122, 25, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(123, 25, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(124, 25, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(125, 5, '_edit_lock', '1347727082:1');
INSERT INTO `th_postmeta` VALUES(126, 25, '_wp_old_slug', 'tra-kh%e1%bb%95-qua');
INSERT INTO `th_postmeta` VALUES(127, 32, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(128, 32, '_edit_lock', '1347765889:1');
INSERT INTO `th_postmeta` VALUES(129, 32, '_wp_page_template', 'default');
INSERT INTO `th_postmeta` VALUES(130, 39, '_menu_item_type', 'post_type');
INSERT INTO `th_postmeta` VALUES(131, 39, '_menu_item_menu_item_parent', '0');
INSERT INTO `th_postmeta` VALUES(132, 39, '_menu_item_object_id', '32');
INSERT INTO `th_postmeta` VALUES(133, 39, '_menu_item_object', 'page');
INSERT INTO `th_postmeta` VALUES(134, 39, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(135, 39, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(136, 39, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(137, 39, '_menu_item_url', '');
INSERT INTO `th_postmeta` VALUES(139, 40, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(140, 40, '_edit_lock', '1347853976:1');
INSERT INTO `th_postmeta` VALUES(141, 41, '_billing_first_name', 'sdf');
INSERT INTO `th_postmeta` VALUES(142, 41, '_billing_last_name', 'fdf');
INSERT INTO `th_postmeta` VALUES(143, 41, '_billing_company', '');
INSERT INTO `th_postmeta` VALUES(144, 41, '_billing_address_1', 'dfdf');
INSERT INTO `th_postmeta` VALUES(145, 41, '_billing_address_2', '');
INSERT INTO `th_postmeta` VALUES(146, 41, '_billing_city', 'fdf');
INSERT INTO `th_postmeta` VALUES(147, 41, '_billing_email', 'lgthnha@yahoo.com.vn');
INSERT INTO `th_postmeta` VALUES(148, 41, '_billing_phone', '45454');
INSERT INTO `th_postmeta` VALUES(149, 41, '_shipping_first_name', 'sdf');
INSERT INTO `th_postmeta` VALUES(150, 41, '_shipping_last_name', 'fdf');
INSERT INTO `th_postmeta` VALUES(151, 41, '_shipping_company', '');
INSERT INTO `th_postmeta` VALUES(152, 41, '_shipping_address_1', 'dfdf');
INSERT INTO `th_postmeta` VALUES(153, 41, '_shipping_address_2', '');
INSERT INTO `th_postmeta` VALUES(154, 41, '_shipping_city', 'fdf');
INSERT INTO `th_postmeta` VALUES(155, 41, '_shipping_method', '');
INSERT INTO `th_postmeta` VALUES(156, 41, '_payment_method', 'bacs');
INSERT INTO `th_postmeta` VALUES(157, 41, '_shipping_method_title', '');
INSERT INTO `th_postmeta` VALUES(158, 41, '_payment_method_title', 'Chuyển khoản ngân hàng');
INSERT INTO `th_postmeta` VALUES(159, 41, '_order_shipping', '0.00');
INSERT INTO `th_postmeta` VALUES(160, 41, '_order_discount', '0.00');
INSERT INTO `th_postmeta` VALUES(161, 41, '_cart_discount', '0.00');
INSERT INTO `th_postmeta` VALUES(162, 41, '_order_tax', '0.00');
INSERT INTO `th_postmeta` VALUES(163, 41, '_order_shipping_tax', '0.00');
INSERT INTO `th_postmeta` VALUES(164, 41, '_order_total', '20.00');
INSERT INTO `th_postmeta` VALUES(165, 41, '_order_key', 'order_505584fb08411');
INSERT INTO `th_postmeta` VALUES(166, 41, '_customer_user', '1');
INSERT INTO `th_postmeta` VALUES(167, 41, '_order_items', 'a:1:{i:0;a:10:{s:2:"id";s:2:"18";s:12:"variation_id";s:0:"";s:4:"name";s:19:"Trà thảo dược";s:3:"qty";s:1:"2";s:9:"item_meta";a:0:{}s:13:"line_subtotal";s:2:"20";s:17:"line_subtotal_tax";s:1:"0";s:10:"line_total";s:2:"20";s:8:"line_tax";s:1:"0";s:9:"tax_class";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(168, 41, '_order_taxes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(169, 41, '_order_currency', 'đ');
INSERT INTO `th_postmeta` VALUES(170, 41, '_prices_include_tax', 'no');
INSERT INTO `th_postmeta` VALUES(171, 41, 'Customer IP Address', '127.0.0.1');
INSERT INTO `th_postmeta` VALUES(172, 41, 'Customer UA', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1');
INSERT INTO `th_postmeta` VALUES(173, 41, '_recorded_sales', 'yes');
INSERT INTO `th_postmeta` VALUES(174, 41, '_recorded_coupon_usage_counts', 'yes');
INSERT INTO `th_postmeta` VALUES(175, 42, '_billing_first_name', 'sdf');
INSERT INTO `th_postmeta` VALUES(176, 42, '_billing_last_name', 'fdf');
INSERT INTO `th_postmeta` VALUES(177, 42, '_billing_company', '');
INSERT INTO `th_postmeta` VALUES(178, 42, '_billing_address_1', 'dfdf');
INSERT INTO `th_postmeta` VALUES(179, 42, '_billing_address_2', '');
INSERT INTO `th_postmeta` VALUES(180, 42, '_billing_city', 'fdf');
INSERT INTO `th_postmeta` VALUES(181, 42, '_billing_email', 'lgthnha@yahoo.com.vn');
INSERT INTO `th_postmeta` VALUES(182, 42, '_billing_phone', '45454');
INSERT INTO `th_postmeta` VALUES(183, 42, '_shipping_first_name', 'sdf');
INSERT INTO `th_postmeta` VALUES(184, 42, '_shipping_last_name', 'fdf');
INSERT INTO `th_postmeta` VALUES(185, 42, '_shipping_company', '');
INSERT INTO `th_postmeta` VALUES(186, 42, '_shipping_address_1', 'dfdf');
INSERT INTO `th_postmeta` VALUES(187, 42, '_shipping_address_2', '');
INSERT INTO `th_postmeta` VALUES(188, 42, '_shipping_city', 'fdf');
INSERT INTO `th_postmeta` VALUES(189, 42, '_shipping_method', '');
INSERT INTO `th_postmeta` VALUES(190, 42, '_payment_method', 'bacs');
INSERT INTO `th_postmeta` VALUES(191, 42, '_shipping_method_title', '');
INSERT INTO `th_postmeta` VALUES(192, 42, '_payment_method_title', 'Chuyển khoản ngân hàng');
INSERT INTO `th_postmeta` VALUES(193, 42, '_order_shipping', '0.00');
INSERT INTO `th_postmeta` VALUES(194, 42, '_order_discount', '0.00');
INSERT INTO `th_postmeta` VALUES(195, 42, '_cart_discount', '0.00');
INSERT INTO `th_postmeta` VALUES(196, 42, '_order_tax', '0.00');
INSERT INTO `th_postmeta` VALUES(197, 42, '_order_shipping_tax', '0.00');
INSERT INTO `th_postmeta` VALUES(198, 42, '_order_total', '10.00');
INSERT INTO `th_postmeta` VALUES(199, 42, '_order_key', 'order_505589d67c304');
INSERT INTO `th_postmeta` VALUES(200, 42, '_customer_user', '1');
INSERT INTO `th_postmeta` VALUES(201, 42, '_order_items', 'a:1:{i:0;a:10:{s:2:"id";s:2:"18";s:12:"variation_id";s:0:"";s:4:"name";s:19:"Trà thảo dược";s:3:"qty";s:1:"1";s:9:"item_meta";a:0:{}s:13:"line_subtotal";s:2:"10";s:17:"line_subtotal_tax";s:1:"0";s:10:"line_total";s:2:"10";s:8:"line_tax";s:1:"0";s:9:"tax_class";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(202, 42, '_order_taxes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(203, 42, '_order_currency', 'đ');
INSERT INTO `th_postmeta` VALUES(204, 42, '_prices_include_tax', 'no');
INSERT INTO `th_postmeta` VALUES(205, 42, 'Customer IP Address', '127.0.0.1');
INSERT INTO `th_postmeta` VALUES(206, 42, 'Customer UA', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1');
INSERT INTO `th_postmeta` VALUES(207, 42, '_recorded_sales', 'yes');
INSERT INTO `th_postmeta` VALUES(208, 42, '_recorded_coupon_usage_counts', 'yes');
INSERT INTO `th_postmeta` VALUES(209, 13, '_edit_lock', '1347783158:1');
INSERT INTO `th_postmeta` VALUES(210, 13, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(211, 13, '_wp_page_template', 'default');
INSERT INTO `th_postmeta` VALUES(212, 40, '_wp_page_template', 'default');
INSERT INTO `th_postmeta` VALUES(213, 48, '_menu_item_type', 'post_type');
INSERT INTO `th_postmeta` VALUES(214, 48, '_menu_item_menu_item_parent', '0');
INSERT INTO `th_postmeta` VALUES(215, 48, '_menu_item_object_id', '40');
INSERT INTO `th_postmeta` VALUES(216, 48, '_menu_item_object', 'page');
INSERT INTO `th_postmeta` VALUES(217, 48, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(218, 48, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(219, 48, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(220, 48, '_menu_item_url', '');
INSERT INTO `th_postmeta` VALUES(222, 4, '_edit_lock', '1347809959:1');
INSERT INTO `th_postmeta` VALUES(910, 129, '_menu_item_url', '/trathonghong/product-category/tra-thong-hong-tra-vinh-tien/tra-thong-hong/');
INSERT INTO `th_postmeta` VALUES(909, 129, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(908, 129, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(907, 129, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(906, 129, '_menu_item_object', 'custom');
INSERT INTO `th_postmeta` VALUES(905, 129, '_menu_item_object_id', '129');
INSERT INTO `th_postmeta` VALUES(904, 129, '_menu_item_menu_item_parent', '128');
INSERT INTO `th_postmeta` VALUES(903, 129, '_menu_item_type', 'custom');
INSERT INTO `th_postmeta` VALUES(901, 128, '_menu_item_url', '/trathonghong/product-category/tra-thong-hong-tra-vinh-tien/');
INSERT INTO `th_postmeta` VALUES(900, 128, '_menu_item_xfn', '');
INSERT INTO `th_postmeta` VALUES(899, 128, '_menu_item_classes', 'a:1:{i:0;s:0:"";}');
INSERT INTO `th_postmeta` VALUES(898, 128, '_menu_item_target', '');
INSERT INTO `th_postmeta` VALUES(897, 128, '_menu_item_object', 'custom');
INSERT INTO `th_postmeta` VALUES(896, 128, '_menu_item_object_id', '128');
INSERT INTO `th_postmeta` VALUES(895, 128, '_menu_item_menu_item_parent', '0');
INSERT INTO `th_postmeta` VALUES(894, 128, '_menu_item_type', 'custom');
INSERT INTO `th_postmeta` VALUES(250, 69, '_wp_attached_file', '2012/09/traxanhhop.jpg');
INSERT INTO `th_postmeta` VALUES(254, 69, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(252, 69, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:22:"2012/09/traxanhhop.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:3:{s:4:"file";s:22:"traxanhhop-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:20:"traxanhhop-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:22:"traxanhhop-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(255, 16, '_wp_old_slug', 'tra-xanh');
INSERT INTO `th_postmeta` VALUES(256, 70, '_wp_attached_file', '2012/09/khoquahop.jpg');
INSERT INTO `th_postmeta` VALUES(886, 70, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(258, 70, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"220";s:6:"height";s:3:"200";s:14:"hwstring_small";s:23:"height=''96'' width=''105''";s:4:"file";s:21:"2012/09/khoquahop.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:3:{s:4:"file";s:21:"khoquahop-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:19:"khoquahop-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:21:"khoquahop-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(261, 18, '_wp_old_slug', 'tra-th%e1%ba%a3o-d%c6%b0%e1%bb%a3c');
INSERT INTO `th_postmeta` VALUES(262, 72, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(263, 72, '_edit_lock', '1347897620:1');
INSERT INTO `th_postmeta` VALUES(264, 73, '_wp_attached_file', '2012/09/tralai.jpg');
INSERT INTO `th_postmeta` VALUES(268, 73, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(266, 73, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:18:"2012/09/tralai.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:3:{s:4:"file";s:18:"tralai-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:16:"tralai-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:18:"tralai-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(269, 72, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(270, 72, '_regular_price', '');
INSERT INTO `th_postmeta` VALUES(271, 72, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(272, 72, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(273, 72, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(274, 72, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(275, 72, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(276, 72, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(277, 72, '_weight', '');
INSERT INTO `th_postmeta` VALUES(278, 72, '_length', '');
INSERT INTO `th_postmeta` VALUES(279, 72, '_width', '');
INSERT INTO `th_postmeta` VALUES(280, 72, '_height', '');
INSERT INTO `th_postmeta` VALUES(281, 72, '_sku', '');
INSERT INTO `th_postmeta` VALUES(282, 72, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(283, 72, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(284, 72, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(285, 72, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(286, 72, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(287, 72, '_price', '');
INSERT INTO `th_postmeta` VALUES(288, 72, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(289, 72, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(290, 72, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(291, 72, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(292, 74, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(293, 74, '_edit_lock', '1347897606:1');
INSERT INTO `th_postmeta` VALUES(294, 75, '_wp_attached_file', '2012/09/tragung.jpg');
INSERT INTO `th_postmeta` VALUES(298, 75, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(296, 75, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"220";s:6:"height";s:3:"200";s:14:"hwstring_small";s:23:"height=''96'' width=''105''";s:4:"file";s:19:"2012/09/tragung.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:3:{s:4:"file";s:19:"tragung-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:17:"tragung-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:19:"tragung-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(299, 74, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(300, 74, '_regular_price', '');
INSERT INTO `th_postmeta` VALUES(301, 74, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(302, 74, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(303, 74, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(304, 74, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(305, 74, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(306, 74, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(307, 74, '_weight', '');
INSERT INTO `th_postmeta` VALUES(308, 74, '_length', '');
INSERT INTO `th_postmeta` VALUES(309, 74, '_width', '');
INSERT INTO `th_postmeta` VALUES(310, 74, '_height', '');
INSERT INTO `th_postmeta` VALUES(311, 74, '_sku', '');
INSERT INTO `th_postmeta` VALUES(312, 74, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(313, 74, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(314, 74, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(315, 74, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(316, 74, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(317, 74, '_price', '');
INSERT INTO `th_postmeta` VALUES(318, 74, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(319, 74, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(320, 74, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(321, 74, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(322, 76, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(323, 76, '_edit_lock', '1347897589:1');
INSERT INTO `th_postmeta` VALUES(329, 76, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(330, 76, '_regular_price', '');
INSERT INTO `th_postmeta` VALUES(331, 76, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(332, 76, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(333, 76, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(334, 76, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(335, 76, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(336, 76, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(337, 76, '_weight', '');
INSERT INTO `th_postmeta` VALUES(338, 76, '_length', '');
INSERT INTO `th_postmeta` VALUES(339, 76, '_width', '');
INSERT INTO `th_postmeta` VALUES(340, 76, '_height', '');
INSERT INTO `th_postmeta` VALUES(341, 76, '_sku', '');
INSERT INTO `th_postmeta` VALUES(342, 76, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(343, 76, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(344, 76, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(345, 76, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(346, 76, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(347, 76, '_price', '');
INSERT INTO `th_postmeta` VALUES(348, 76, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(349, 76, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(350, 76, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(351, 76, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(352, 78, '_wp_attached_file', '2012/09/bongatiso.jpg');
INSERT INTO `th_postmeta` VALUES(884, 78, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(354, 78, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"220";s:6:"height";s:3:"200";s:14:"hwstring_small";s:23:"height=''96'' width=''105''";s:4:"file";s:21:"2012/09/bongatiso.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:3:{s:4:"file";s:21:"bongatiso-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:19:"bongatiso-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:21:"bongatiso-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(357, 79, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(358, 79, '_edit_lock', '1347857109:1');
INSERT INTO `th_postmeta` VALUES(362, 81, '_edit_lock', '1347857168:1');
INSERT INTO `th_postmeta` VALUES(361, 81, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(366, 83, '_edit_lock', '1347859414:1');
INSERT INTO `th_postmeta` VALUES(365, 83, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(370, 86, '_edit_lock', '1347897572:1');
INSERT INTO `th_postmeta` VALUES(369, 86, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(371, 86, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(372, 86, '_regular_price', '8000');
INSERT INTO `th_postmeta` VALUES(373, 86, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(374, 86, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(375, 86, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(376, 86, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(377, 86, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(378, 86, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(379, 86, '_weight', '');
INSERT INTO `th_postmeta` VALUES(380, 86, '_length', '');
INSERT INTO `th_postmeta` VALUES(381, 86, '_width', '');
INSERT INTO `th_postmeta` VALUES(382, 86, '_height', '');
INSERT INTO `th_postmeta` VALUES(383, 86, '_sku', '');
INSERT INTO `th_postmeta` VALUES(384, 86, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(385, 86, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(386, 86, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(387, 86, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(388, 86, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(389, 86, '_price', '8000');
INSERT INTO `th_postmeta` VALUES(390, 86, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(391, 86, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(392, 86, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(393, 86, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(394, 88, '_wp_attached_file', '2012/09/Atis___Tea_One_4e1c137a00b5b.jpg');
INSERT INTO `th_postmeta` VALUES(398, 88, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(396, 88, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:40:"2012/09/Atis___Tea_One_4e1c137a00b5b.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:40:"Atis___Tea_One_4e1c137a00b5b-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:40:"Atis___Tea_One_4e1c137a00b5b-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:40:"Atis___Tea_One_4e1c137a00b5b-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:38:"Atis___Tea_One_4e1c137a00b5b-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:40:"Atis___Tea_One_4e1c137a00b5b-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(399, 89, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(400, 89, '_edit_lock', '1347897555:1');
INSERT INTO `th_postmeta` VALUES(401, 90, '_wp_attached_file', '2012/09/2.jpg');
INSERT INTO `th_postmeta` VALUES(402, 90, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(403, 90, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:13:"2012/09/2.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:13:"2-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:13:"2-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:13:"2-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:11:"2-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:13:"2-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(404, 89, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(405, 89, '_regular_price', '14000');
INSERT INTO `th_postmeta` VALUES(406, 89, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(407, 89, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(408, 89, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(409, 89, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(410, 89, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(411, 89, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(412, 89, '_weight', '');
INSERT INTO `th_postmeta` VALUES(413, 89, '_length', '');
INSERT INTO `th_postmeta` VALUES(414, 89, '_width', '');
INSERT INTO `th_postmeta` VALUES(415, 89, '_height', '');
INSERT INTO `th_postmeta` VALUES(416, 89, '_sku', '');
INSERT INTO `th_postmeta` VALUES(417, 89, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(418, 89, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(419, 89, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(420, 89, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(421, 89, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(422, 89, '_price', '14000');
INSERT INTO `th_postmeta` VALUES(423, 89, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(424, 89, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(425, 89, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(426, 89, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(427, 91, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(428, 91, '_edit_lock', '1347897536:1');
INSERT INTO `th_postmeta` VALUES(429, 92, '_wp_attached_file', '2012/09/3.jpg');
INSERT INTO `th_postmeta` VALUES(430, 92, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(431, 92, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:13:"2012/09/3.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:13:"3-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:13:"3-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:13:"3-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:11:"3-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:13:"3-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(432, 91, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(433, 91, '_regular_price', '33000');
INSERT INTO `th_postmeta` VALUES(434, 91, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(435, 91, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(436, 91, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(437, 91, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(438, 91, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(439, 91, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(440, 91, '_weight', '');
INSERT INTO `th_postmeta` VALUES(441, 91, '_length', '');
INSERT INTO `th_postmeta` VALUES(442, 91, '_width', '');
INSERT INTO `th_postmeta` VALUES(443, 91, '_height', '');
INSERT INTO `th_postmeta` VALUES(444, 91, '_sku', '');
INSERT INTO `th_postmeta` VALUES(445, 91, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(446, 91, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(447, 91, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(448, 91, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(449, 91, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(450, 91, '_price', '33000');
INSERT INTO `th_postmeta` VALUES(451, 91, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(452, 91, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(453, 91, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(454, 91, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(455, 93, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(456, 93, '_edit_lock', '1347897521:1');
INSERT INTO `th_postmeta` VALUES(457, 93, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(458, 93, '_regular_price', '51000');
INSERT INTO `th_postmeta` VALUES(459, 93, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(460, 93, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(461, 93, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(462, 93, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(463, 93, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(464, 93, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(465, 93, '_weight', '');
INSERT INTO `th_postmeta` VALUES(466, 93, '_length', '');
INSERT INTO `th_postmeta` VALUES(467, 93, '_width', '');
INSERT INTO `th_postmeta` VALUES(468, 93, '_height', '');
INSERT INTO `th_postmeta` VALUES(469, 93, '_sku', '');
INSERT INTO `th_postmeta` VALUES(470, 93, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(471, 93, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(472, 93, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(473, 93, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(474, 93, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(475, 93, '_price', '51000');
INSERT INTO `th_postmeta` VALUES(476, 93, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(477, 93, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(478, 93, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(479, 93, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(480, 94, '_wp_attached_file', '2012/09/Tr___Atis___h____4d1c51d755d2a.jpg');
INSERT INTO `th_postmeta` VALUES(481, 94, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(482, 94, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:42:"2012/09/Tr___Atis___h____4d1c51d755d2a.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:42:"Tr___Atis___h____4d1c51d755d2a-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:42:"Tr___Atis___h____4d1c51d755d2a-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:42:"Tr___Atis___h____4d1c51d755d2a-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:40:"Tr___Atis___h____4d1c51d755d2a-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:42:"Tr___Atis___h____4d1c51d755d2a-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(483, 96, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(484, 96, '_edit_lock', '1347897481:1');
INSERT INTO `th_postmeta` VALUES(485, 97, '_wp_attached_file', '2012/09/4.jpg');
INSERT INTO `th_postmeta` VALUES(486, 97, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(487, 97, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:13:"2012/09/4.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:13:"4-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:13:"4-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:13:"4-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:11:"4-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:13:"4-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(488, 96, '_wp_old_slug', 'tra-atiso-dac-san-hp-100-goi');
INSERT INTO `th_postmeta` VALUES(489, 96, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(490, 96, '_regular_price', '51000');
INSERT INTO `th_postmeta` VALUES(491, 96, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(492, 96, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(493, 96, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(494, 96, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(495, 96, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(496, 96, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(497, 96, '_weight', '');
INSERT INTO `th_postmeta` VALUES(498, 96, '_length', '');
INSERT INTO `th_postmeta` VALUES(499, 96, '_width', '');
INSERT INTO `th_postmeta` VALUES(500, 96, '_height', '');
INSERT INTO `th_postmeta` VALUES(501, 96, '_sku', '');
INSERT INTO `th_postmeta` VALUES(502, 96, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(503, 96, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(504, 96, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(505, 96, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(506, 96, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(507, 96, '_price', '51000');
INSERT INTO `th_postmeta` VALUES(508, 96, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(509, 96, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(510, 96, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(511, 96, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(512, 99, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(513, 99, '_edit_lock', '1347897464:1');
INSERT INTO `th_postmeta` VALUES(514, 100, '_wp_attached_file', '2012/09/5.jpg');
INSERT INTO `th_postmeta` VALUES(515, 100, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(516, 100, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:13:"2012/09/5.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:13:"5-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:13:"5-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:13:"5-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:11:"5-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:13:"5-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(517, 99, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(518, 99, '_regular_price', '85000');
INSERT INTO `th_postmeta` VALUES(519, 99, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(520, 99, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(521, 99, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(522, 99, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(523, 99, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(524, 99, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(525, 99, '_weight', '');
INSERT INTO `th_postmeta` VALUES(526, 99, '_length', '');
INSERT INTO `th_postmeta` VALUES(527, 99, '_width', '');
INSERT INTO `th_postmeta` VALUES(528, 99, '_height', '');
INSERT INTO `th_postmeta` VALUES(529, 99, '_sku', '');
INSERT INTO `th_postmeta` VALUES(530, 99, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(531, 99, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(532, 99, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(533, 99, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(534, 99, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(535, 99, '_price', '85000');
INSERT INTO `th_postmeta` VALUES(536, 99, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(537, 99, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(538, 99, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(539, 99, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(540, 99, '_wp_old_slug', 'ha-th%e1%bb%a7-o-lat-tui-500-gram');
INSERT INTO `th_postmeta` VALUES(541, 89, '_wp_old_slug', 'tra-atiso-h%e1%ba%a1ng-nh%e1%ba%a5t-h%e1%bb%99p-20-goi');
INSERT INTO `th_postmeta` VALUES(542, 91, '_wp_old_slug', 'tra-atiso-h%e1%ba%a1ng-nh%e1%ba%a5t-h%e1%bb%99p-50-goi');
INSERT INTO `th_postmeta` VALUES(543, 86, '_wp_old_slug', 'tra-atiso-thanh-nhi%e1%bb%87t');
INSERT INTO `th_postmeta` VALUES(544, 76, '_wp_old_slug', 'tra-thanh-nhi%e1%bb%87t');
INSERT INTO `th_postmeta` VALUES(892, 126, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(545, 101, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(546, 101, '_edit_lock', '1347897445:1');
INSERT INTO `th_postmeta` VALUES(547, 102, '_wp_attached_file', '2012/09/6.jpg');
INSERT INTO `th_postmeta` VALUES(548, 102, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(549, 102, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:13:"2012/09/6.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:13:"6-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:13:"6-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:13:"6-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:11:"6-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:13:"6-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(550, 101, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(551, 101, '_regular_price', '15000');
INSERT INTO `th_postmeta` VALUES(552, 101, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(553, 101, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(554, 101, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(555, 101, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(556, 101, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(557, 101, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(558, 101, '_weight', '');
INSERT INTO `th_postmeta` VALUES(559, 101, '_length', '');
INSERT INTO `th_postmeta` VALUES(560, 101, '_width', '');
INSERT INTO `th_postmeta` VALUES(561, 101, '_height', '');
INSERT INTO `th_postmeta` VALUES(562, 101, '_sku', '');
INSERT INTO `th_postmeta` VALUES(563, 101, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(564, 101, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(565, 101, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(566, 101, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(567, 101, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(568, 101, '_price', '15000');
INSERT INTO `th_postmeta` VALUES(569, 101, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(570, 101, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(571, 101, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(572, 101, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(573, 101, '_wp_old_slug', 'kh-qua-lat-tui-80-gram');
INSERT INTO `th_postmeta` VALUES(574, 103, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(575, 103, '_edit_lock', '1347897423:1');
INSERT INTO `th_postmeta` VALUES(576, 104, '_wp_attached_file', '2012/09/7.jpg');
INSERT INTO `th_postmeta` VALUES(577, 104, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(578, 104, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:13:"2012/09/7.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:13:"7-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:13:"7-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:13:"7-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:11:"7-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:13:"7-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(579, 103, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(580, 103, '_regular_price', '80000');
INSERT INTO `th_postmeta` VALUES(581, 103, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(582, 103, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(583, 103, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(584, 103, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(585, 103, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(586, 103, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(587, 103, '_weight', '');
INSERT INTO `th_postmeta` VALUES(588, 103, '_length', '');
INSERT INTO `th_postmeta` VALUES(589, 103, '_width', '');
INSERT INTO `th_postmeta` VALUES(590, 103, '_height', '');
INSERT INTO `th_postmeta` VALUES(591, 103, '_sku', '');
INSERT INTO `th_postmeta` VALUES(592, 103, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(593, 103, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(594, 103, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(595, 103, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(596, 103, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(597, 103, '_price', '80000');
INSERT INTO `th_postmeta` VALUES(598, 103, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(599, 103, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(600, 103, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(601, 103, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(602, 105, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(603, 105, '_edit_lock', '1347897402:1');
INSERT INTO `th_postmeta` VALUES(604, 106, '_wp_attached_file', '2012/09/71.jpg');
INSERT INTO `th_postmeta` VALUES(605, 106, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(606, 106, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:14:"2012/09/71.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:14:"71-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:14:"71-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:14:"71-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:12:"71-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:14:"71-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(607, 105, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(608, 105, '_regular_price', '200000');
INSERT INTO `th_postmeta` VALUES(609, 105, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(610, 105, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(611, 105, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(612, 105, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(613, 105, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(614, 105, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(615, 105, '_weight', '');
INSERT INTO `th_postmeta` VALUES(616, 105, '_length', '');
INSERT INTO `th_postmeta` VALUES(617, 105, '_width', '');
INSERT INTO `th_postmeta` VALUES(618, 105, '_height', '');
INSERT INTO `th_postmeta` VALUES(619, 105, '_sku', '');
INSERT INTO `th_postmeta` VALUES(620, 105, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(621, 105, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(622, 105, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(623, 105, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(624, 105, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(625, 105, '_price', '200000');
INSERT INTO `th_postmeta` VALUES(626, 105, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(627, 105, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(628, 105, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(629, 105, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(630, 105, '_wp_old_slug', 'nm-linh-chi-kho-tui-500-gram');
INSERT INTO `th_postmeta` VALUES(631, 107, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(632, 107, '_edit_lock', '1347897381:1');
INSERT INTO `th_postmeta` VALUES(633, 107, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(634, 107, '_regular_price', '35000');
INSERT INTO `th_postmeta` VALUES(635, 107, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(636, 107, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(637, 107, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(638, 107, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(639, 107, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(640, 107, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(641, 107, '_weight', '');
INSERT INTO `th_postmeta` VALUES(642, 107, '_length', '');
INSERT INTO `th_postmeta` VALUES(643, 107, '_width', '');
INSERT INTO `th_postmeta` VALUES(644, 107, '_height', '');
INSERT INTO `th_postmeta` VALUES(645, 107, '_sku', '');
INSERT INTO `th_postmeta` VALUES(646, 107, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(647, 107, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(648, 107, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(649, 107, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(650, 107, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(651, 107, '_price', '35000');
INSERT INTO `th_postmeta` VALUES(652, 107, '_stock', '');
INSERT INTO `th_postmeta` VALUES(653, 107, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(654, 107, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(655, 107, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(656, 108, '_wp_attached_file', '2012/09/8.jpg');
INSERT INTO `th_postmeta` VALUES(657, 108, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(658, 108, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:13:"2012/09/8.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:13:"8-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:13:"8-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:13:"8-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:11:"8-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:13:"8-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(659, 109, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(660, 109, '_edit_lock', '1347897884:1');
INSERT INTO `th_postmeta` VALUES(661, 110, '_wp_attached_file', '2012/09/9.jpg');
INSERT INTO `th_postmeta` VALUES(662, 110, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(663, 110, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:13:"2012/09/9.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:13:"9-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:13:"9-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:13:"9-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:11:"9-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:13:"9-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(664, 109, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(665, 109, '_regular_price', '60000');
INSERT INTO `th_postmeta` VALUES(666, 109, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(667, 109, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(668, 109, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(669, 109, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(670, 109, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(671, 109, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(672, 109, '_weight', '');
INSERT INTO `th_postmeta` VALUES(673, 109, '_length', '');
INSERT INTO `th_postmeta` VALUES(674, 109, '_width', '');
INSERT INTO `th_postmeta` VALUES(675, 109, '_height', '');
INSERT INTO `th_postmeta` VALUES(676, 109, '_sku', '');
INSERT INTO `th_postmeta` VALUES(677, 109, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(678, 109, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(679, 109, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(680, 109, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(681, 109, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(682, 109, '_price', '60000');
INSERT INTO `th_postmeta` VALUES(683, 109, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(684, 109, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(685, 109, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(686, 109, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(687, 111, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(688, 111, '_edit_lock', '1347897329:1');
INSERT INTO `th_postmeta` VALUES(689, 111, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(690, 111, '_regular_price', '35000');
INSERT INTO `th_postmeta` VALUES(691, 111, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(692, 111, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(693, 111, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(694, 111, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(695, 111, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(696, 111, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(697, 111, '_weight', '');
INSERT INTO `th_postmeta` VALUES(698, 111, '_length', '');
INSERT INTO `th_postmeta` VALUES(699, 111, '_width', '');
INSERT INTO `th_postmeta` VALUES(700, 111, '_height', '');
INSERT INTO `th_postmeta` VALUES(701, 111, '_sku', '');
INSERT INTO `th_postmeta` VALUES(702, 111, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(703, 111, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(704, 111, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(705, 111, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(706, 111, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(707, 111, '_price', '35000');
INSERT INTO `th_postmeta` VALUES(708, 111, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(709, 111, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(710, 111, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(711, 111, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(712, 112, '_wp_attached_file', '2012/09/10.jpg');
INSERT INTO `th_postmeta` VALUES(713, 112, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(714, 112, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:14:"2012/09/10.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:14:"10-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:14:"10-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:14:"10-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:12:"10-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:14:"10-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(715, 113, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(716, 113, '_edit_lock', '1347897304:1');
INSERT INTO `th_postmeta` VALUES(717, 114, '_wp_attached_file', '2012/09/11.jpg');
INSERT INTO `th_postmeta` VALUES(718, 114, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(719, 114, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:14:"2012/09/11.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:14:"11-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:14:"11-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:14:"11-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:12:"11-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:14:"11-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(720, 113, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(721, 113, '_regular_price', '149000');
INSERT INTO `th_postmeta` VALUES(722, 113, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(723, 113, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(724, 113, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(725, 113, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(726, 113, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(727, 113, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(728, 113, '_weight', '');
INSERT INTO `th_postmeta` VALUES(729, 113, '_length', '');
INSERT INTO `th_postmeta` VALUES(730, 113, '_width', '');
INSERT INTO `th_postmeta` VALUES(731, 113, '_height', '');
INSERT INTO `th_postmeta` VALUES(732, 113, '_sku', '');
INSERT INTO `th_postmeta` VALUES(733, 113, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(734, 113, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(735, 113, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(736, 113, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(737, 113, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(738, 113, '_price', '149000');
INSERT INTO `th_postmeta` VALUES(739, 113, '_stock', '');
INSERT INTO `th_postmeta` VALUES(740, 113, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(741, 113, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(742, 113, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(743, 115, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(744, 115, '_edit_lock', '1347897282:1');
INSERT INTO `th_postmeta` VALUES(745, 116, '_wp_attached_file', '2012/09/12.jpg');
INSERT INTO `th_postmeta` VALUES(746, 116, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(747, 116, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:14:"2012/09/12.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:14:"12-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:14:"12-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:14:"12-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:12:"12-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:14:"12-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(748, 115, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(749, 115, '_regular_price', '45000');
INSERT INTO `th_postmeta` VALUES(750, 115, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(751, 115, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(752, 115, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(753, 115, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(754, 115, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(755, 115, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(756, 115, '_weight', '');
INSERT INTO `th_postmeta` VALUES(757, 115, '_length', '');
INSERT INTO `th_postmeta` VALUES(758, 115, '_width', '');
INSERT INTO `th_postmeta` VALUES(759, 115, '_height', '');
INSERT INTO `th_postmeta` VALUES(760, 115, '_sku', '');
INSERT INTO `th_postmeta` VALUES(761, 115, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(762, 115, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(763, 115, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(764, 115, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(765, 115, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(766, 115, '_price', '45000');
INSERT INTO `th_postmeta` VALUES(767, 115, '_stock', '');
INSERT INTO `th_postmeta` VALUES(768, 115, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(769, 115, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(770, 115, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(771, 117, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(772, 117, '_edit_lock', '1347897257:1');
INSERT INTO `th_postmeta` VALUES(773, 118, '_wp_attached_file', '2012/09/13.jpg');
INSERT INTO `th_postmeta` VALUES(774, 118, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(775, 118, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:14:"2012/09/13.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:14:"13-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:14:"13-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:14:"13-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:12:"13-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:14:"13-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(776, 117, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(777, 117, '_regular_price', '180000');
INSERT INTO `th_postmeta` VALUES(778, 117, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(779, 117, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(780, 117, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(781, 117, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(782, 117, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(783, 117, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(784, 117, '_weight', '');
INSERT INTO `th_postmeta` VALUES(785, 117, '_length', '');
INSERT INTO `th_postmeta` VALUES(786, 117, '_width', '');
INSERT INTO `th_postmeta` VALUES(787, 117, '_height', '');
INSERT INTO `th_postmeta` VALUES(788, 117, '_sku', '');
INSERT INTO `th_postmeta` VALUES(789, 117, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(790, 117, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(791, 117, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(792, 117, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(793, 117, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(794, 117, '_price', '180000');
INSERT INTO `th_postmeta` VALUES(795, 117, '_stock', '');
INSERT INTO `th_postmeta` VALUES(796, 117, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(797, 117, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(798, 117, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(799, 119, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(800, 119, '_edit_lock', '1347897229:1');
INSERT INTO `th_postmeta` VALUES(801, 120, '_wp_attached_file', '2012/09/14.jpg');
INSERT INTO `th_postmeta` VALUES(802, 120, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(803, 120, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:14:"2012/09/14.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:14:"14-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:14:"14-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:14:"14-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:12:"14-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:14:"14-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(804, 119, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(805, 119, '_regular_price', '48000');
INSERT INTO `th_postmeta` VALUES(806, 119, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(807, 119, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(808, 119, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(809, 119, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(810, 119, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(811, 119, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(812, 119, '_weight', '');
INSERT INTO `th_postmeta` VALUES(813, 119, '_length', '');
INSERT INTO `th_postmeta` VALUES(814, 119, '_width', '');
INSERT INTO `th_postmeta` VALUES(815, 119, '_height', '');
INSERT INTO `th_postmeta` VALUES(816, 119, '_sku', '');
INSERT INTO `th_postmeta` VALUES(817, 119, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(818, 119, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(819, 119, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(820, 119, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(821, 119, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(822, 119, '_price', '48000');
INSERT INTO `th_postmeta` VALUES(823, 119, '_stock', '');
INSERT INTO `th_postmeta` VALUES(824, 119, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(825, 119, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(826, 119, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(827, 121, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(828, 121, '_edit_lock', '1347897212:1');
INSERT INTO `th_postmeta` VALUES(829, 122, '_wp_attached_file', '2012/09/15.jpg');
INSERT INTO `th_postmeta` VALUES(830, 122, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(831, 122, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:14:"2012/09/15.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:14:"15-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:14:"15-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:14:"15-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:12:"15-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:14:"15-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(832, 121, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(833, 121, '_regular_price', '90000');
INSERT INTO `th_postmeta` VALUES(834, 121, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(835, 121, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(836, 121, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(837, 121, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(838, 121, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(839, 121, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(840, 121, '_weight', '');
INSERT INTO `th_postmeta` VALUES(841, 121, '_length', '');
INSERT INTO `th_postmeta` VALUES(842, 121, '_width', '');
INSERT INTO `th_postmeta` VALUES(843, 121, '_height', '');
INSERT INTO `th_postmeta` VALUES(844, 121, '_sku', '');
INSERT INTO `th_postmeta` VALUES(845, 121, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(846, 121, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(847, 121, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(848, 121, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(849, 121, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(850, 121, '_price', '90000');
INSERT INTO `th_postmeta` VALUES(851, 121, '_stock', '');
INSERT INTO `th_postmeta` VALUES(852, 121, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(853, 121, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(854, 121, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(855, 121, '_wp_old_slug', 'ruu-vang-sauvignon-blanc-12');
INSERT INTO `th_postmeta` VALUES(856, 123, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(857, 123, '_edit_lock', '1347897173:1');
INSERT INTO `th_postmeta` VALUES(858, 124, '_wp_attached_file', '2012/09/16.jpg');
INSERT INTO `th_postmeta` VALUES(859, 124, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(860, 124, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:14:"hwstring_small";s:22:"height=''96'' width=''96''";s:4:"file";s:14:"2012/09/16.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:3:{s:4:"file";s:14:"16-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:14:"post-thumbnail";a:3:{s:4:"file";s:14:"16-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:14:"16-300x288.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"288";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:12:"16-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:14:"16-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(861, 123, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(862, 123, '_regular_price', '95000');
INSERT INTO `th_postmeta` VALUES(863, 123, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(864, 123, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(865, 123, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(866, 123, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(867, 123, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(868, 123, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(869, 123, '_weight', '');
INSERT INTO `th_postmeta` VALUES(870, 123, '_length', '');
INSERT INTO `th_postmeta` VALUES(871, 123, '_width', '');
INSERT INTO `th_postmeta` VALUES(872, 123, '_height', '');
INSERT INTO `th_postmeta` VALUES(873, 123, '_sku', '');
INSERT INTO `th_postmeta` VALUES(874, 123, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(875, 123, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(876, 123, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(877, 123, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(878, 123, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(879, 123, '_price', '95000');
INSERT INTO `th_postmeta` VALUES(880, 123, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(881, 123, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(882, 123, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(883, 123, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(1018, 139, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(1019, 139, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(1020, 139, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(1021, 141, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(1022, 141, '_edit_lock', '1347895482:1');
INSERT INTO `th_postmeta` VALUES(1023, 142, '_wp_attached_file', '2012/09/DSC00788.jpg');
INSERT INTO `th_postmeta` VALUES(1024, 142, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(1025, 142, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:4:"1944";s:6:"height";s:4:"2592";s:14:"hwstring_small";s:22:"height=''96'' width=''72''";s:4:"file";s:20:"2012/09/DSC00788.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"DSC00788-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"DSC00788-225x300.jpg";s:5:"width";s:3:"225";s:6:"height";s:3:"300";}s:5:"large";a:3:{s:4:"file";s:21:"DSC00788-768x1024.jpg";s:5:"width";s:3:"768";s:6:"height";s:4:"1024";}s:14:"post-thumbnail";a:3:{s:4:"file";s:21:"DSC00788-1000x288.jpg";s:5:"width";s:4:"1000";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:21:"DSC00788-1000x288.jpg";s:5:"width";s:4:"1000";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"DSC00788-225x300.jpg";s:5:"width";s:3:"225";s:6:"height";s:3:"300";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:18:"DSC00788-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:20:"DSC00788-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:11:"shop_single";a:3:{s:4:"file";s:20:"DSC00788-300x300.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(1026, 143, '_wp_attached_file', '2012/09/DSC00792.jpg');
INSERT INTO `th_postmeta` VALUES(1027, 143, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(1028, 143, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:4:"1944";s:6:"height";s:4:"2592";s:14:"hwstring_small";s:22:"height=''96'' width=''72''";s:4:"file";s:20:"2012/09/DSC00792.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"DSC00792-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"DSC00792-225x300.jpg";s:5:"width";s:3:"225";s:6:"height";s:3:"300";}s:5:"large";a:3:{s:4:"file";s:21:"DSC00792-768x1024.jpg";s:5:"width";s:3:"768";s:6:"height";s:4:"1024";}s:14:"post-thumbnail";a:3:{s:4:"file";s:21:"DSC00792-1000x288.jpg";s:5:"width";s:4:"1000";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:21:"DSC00792-1000x288.jpg";s:5:"width";s:4:"1000";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"DSC00792-225x300.jpg";s:5:"width";s:3:"225";s:6:"height";s:3:"300";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:18:"DSC00792-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:20:"DSC00792-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:11:"shop_single";a:3:{s:4:"file";s:20:"DSC00792-300x300.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(1029, 141, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(1030, 141, '_regular_price', '200000');
INSERT INTO `th_postmeta` VALUES(1031, 141, '_sale_price', '190000');
INSERT INTO `th_postmeta` VALUES(1032, 141, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(1033, 141, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(1034, 141, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(1035, 141, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(1036, 141, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(1037, 141, '_weight', '');
INSERT INTO `th_postmeta` VALUES(1038, 141, '_length', '');
INSERT INTO `th_postmeta` VALUES(1039, 141, '_width', '');
INSERT INTO `th_postmeta` VALUES(1040, 141, '_height', '');
INSERT INTO `th_postmeta` VALUES(1041, 141, '_sku', '');
INSERT INTO `th_postmeta` VALUES(1042, 141, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(1043, 141, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(1044, 141, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(1045, 141, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(1046, 141, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(1047, 141, '_price', '190000');
INSERT INTO `th_postmeta` VALUES(1048, 141, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(1049, 141, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(1050, 141, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(1051, 141, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(1052, 144, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(1053, 144, '_edit_lock', '1347895374:1');
INSERT INTO `th_postmeta` VALUES(1054, 145, '_wp_attached_file', '2012/09/DSC00777.jpg');
INSERT INTO `th_postmeta` VALUES(1055, 145, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(1056, 145, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"500";s:6:"height";s:3:"375";s:14:"hwstring_small";s:23:"height=''96'' width=''128''";s:4:"file";s:20:"2012/09/DSC00777.jpg";s:5:"sizes";a:8:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"DSC00777-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"DSC00777-300x225.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"225";}s:14:"post-thumbnail";a:3:{s:4:"file";s:20:"DSC00777-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:20:"DSC00777-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"DSC00777-400x300.jpg";s:5:"width";s:3:"400";s:6:"height";s:3:"300";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:18:"DSC00777-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:20:"DSC00777-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:11:"shop_single";a:3:{s:4:"file";s:20:"DSC00777-300x300.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(1057, 146, '_wp_attached_file', '2012/09/DSC00778.jpg');
INSERT INTO `th_postmeta` VALUES(1058, 146, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(1059, 146, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"500";s:6:"height";s:3:"375";s:14:"hwstring_small";s:23:"height=''96'' width=''128''";s:4:"file";s:20:"2012/09/DSC00778.jpg";s:5:"sizes";a:8:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"DSC00778-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"DSC00778-300x225.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"225";}s:14:"post-thumbnail";a:3:{s:4:"file";s:20:"DSC00778-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:20:"DSC00778-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"DSC00778-400x300.jpg";s:5:"width";s:3:"400";s:6:"height";s:3:"300";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:18:"DSC00778-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:20:"DSC00778-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:11:"shop_single";a:3:{s:4:"file";s:20:"DSC00778-300x300.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(1060, 144, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(1061, 144, '_regular_price', '50000');
INSERT INTO `th_postmeta` VALUES(1062, 144, '_sale_price', '40000');
INSERT INTO `th_postmeta` VALUES(1063, 144, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(1064, 144, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(1065, 144, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(1066, 144, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(1067, 144, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(1068, 144, '_weight', '');
INSERT INTO `th_postmeta` VALUES(1069, 144, '_length', '');
INSERT INTO `th_postmeta` VALUES(1070, 144, '_width', '');
INSERT INTO `th_postmeta` VALUES(1071, 144, '_height', '');
INSERT INTO `th_postmeta` VALUES(1072, 144, '_sku', '');
INSERT INTO `th_postmeta` VALUES(1073, 144, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(1074, 144, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(1075, 144, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(1076, 144, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(1077, 144, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(1078, 144, '_price', '40000');
INSERT INTO `th_postmeta` VALUES(1079, 144, '_stock', '0');
INSERT INTO `th_postmeta` VALUES(1080, 144, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(1081, 144, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(1082, 144, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(1083, 147, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(1084, 147, '_edit_lock', '1347895336:1');
INSERT INTO `th_postmeta` VALUES(1085, 148, '_wp_attached_file', '2012/09/DSC00784.jpg');
INSERT INTO `th_postmeta` VALUES(1086, 148, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(1087, 148, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"500";s:6:"height";s:3:"375";s:14:"hwstring_small";s:23:"height=''96'' width=''128''";s:4:"file";s:20:"2012/09/DSC00784.jpg";s:5:"sizes";a:8:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"DSC00784-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"DSC00784-300x225.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"225";}s:14:"post-thumbnail";a:3:{s:4:"file";s:20:"DSC00784-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:20:"DSC00784-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"DSC00784-400x300.jpg";s:5:"width";s:3:"400";s:6:"height";s:3:"300";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:18:"DSC00784-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:20:"DSC00784-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:11:"shop_single";a:3:{s:4:"file";s:20:"DSC00784-300x300.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(1088, 149, '_wp_attached_file', '2012/09/DSC00785.jpg');
INSERT INTO `th_postmeta` VALUES(1089, 149, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(1090, 149, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"500";s:6:"height";s:3:"375";s:14:"hwstring_small";s:23:"height=''96'' width=''128''";s:4:"file";s:20:"2012/09/DSC00785.jpg";s:5:"sizes";a:8:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"DSC00785-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"DSC00785-300x225.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"225";}s:14:"post-thumbnail";a:3:{s:4:"file";s:20:"DSC00785-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:20:"DSC00785-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"DSC00785-400x300.jpg";s:5:"width";s:3:"400";s:6:"height";s:3:"300";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:18:"DSC00785-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:20:"DSC00785-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:11:"shop_single";a:3:{s:4:"file";s:20:"DSC00785-300x300.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(1091, 147, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(1092, 147, '_regular_price', '54000');
INSERT INTO `th_postmeta` VALUES(1093, 147, '_sale_price', '50000');
INSERT INTO `th_postmeta` VALUES(1094, 147, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(1095, 147, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(1096, 147, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(1097, 147, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(1098, 147, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(1099, 147, '_weight', '');
INSERT INTO `th_postmeta` VALUES(1100, 147, '_length', '');
INSERT INTO `th_postmeta` VALUES(1101, 147, '_width', '');
INSERT INTO `th_postmeta` VALUES(1102, 147, '_height', '');
INSERT INTO `th_postmeta` VALUES(1103, 147, '_sku', '');
INSERT INTO `th_postmeta` VALUES(1104, 147, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(1105, 147, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(1106, 147, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(1107, 147, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(1108, 147, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(1109, 147, '_price', '50000');
INSERT INTO `th_postmeta` VALUES(1110, 147, '_stock', '');
INSERT INTO `th_postmeta` VALUES(1111, 147, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(1112, 147, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(1113, 147, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(1114, 151, '_wp_attached_file', '2012/09/DSC00888.jpg');
INSERT INTO `th_postmeta` VALUES(1115, 151, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(1116, 151, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"500";s:6:"height";s:3:"375";s:14:"hwstring_small";s:23:"height=''96'' width=''128''";s:4:"file";s:20:"2012/09/DSC00888.jpg";s:5:"sizes";a:8:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"DSC00888-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"DSC00888-300x225.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"225";}s:14:"post-thumbnail";a:3:{s:4:"file";s:20:"DSC00888-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:20:"DSC00888-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"DSC00888-400x300.jpg";s:5:"width";s:3:"400";s:6:"height";s:3:"300";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:18:"DSC00888-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:20:"DSC00888-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:11:"shop_single";a:3:{s:4:"file";s:20:"DSC00888-300x300.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(1117, 152, '_wp_attached_file', '2012/09/DSC00889.jpg');
INSERT INTO `th_postmeta` VALUES(1118, 152, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(1119, 152, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"500";s:6:"height";s:3:"375";s:14:"hwstring_small";s:23:"height=''96'' width=''128''";s:4:"file";s:20:"2012/09/DSC00889.jpg";s:5:"sizes";a:8:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"DSC00889-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"DSC00889-300x225.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"225";}s:14:"post-thumbnail";a:3:{s:4:"file";s:20:"DSC00889-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:20:"DSC00889-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"DSC00889-400x300.jpg";s:5:"width";s:3:"400";s:6:"height";s:3:"300";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:18:"DSC00889-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:20:"DSC00889-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:11:"shop_single";a:3:{s:4:"file";s:20:"DSC00889-300x300.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(1120, 150, '_edit_last', '1');
INSERT INTO `th_postmeta` VALUES(1121, 150, '_edit_lock', '1347895294:1');
INSERT INTO `th_postmeta` VALUES(1122, 150, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(1123, 150, '_regular_price', '30000');
INSERT INTO `th_postmeta` VALUES(1124, 150, '_sale_price', '28000');
INSERT INTO `th_postmeta` VALUES(1125, 150, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(1126, 150, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(1127, 150, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(1128, 150, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(1129, 150, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(1130, 150, '_weight', '');
INSERT INTO `th_postmeta` VALUES(1131, 150, '_length', '');
INSERT INTO `th_postmeta` VALUES(1132, 150, '_width', '');
INSERT INTO `th_postmeta` VALUES(1133, 150, '_height', '');
INSERT INTO `th_postmeta` VALUES(1134, 150, '_sku', '');
INSERT INTO `th_postmeta` VALUES(1135, 150, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(1136, 150, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(1137, 150, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(1138, 150, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(1139, 150, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(1140, 150, '_price', '28000');
INSERT INTO `th_postmeta` VALUES(1141, 150, '_stock', '');
INSERT INTO `th_postmeta` VALUES(1142, 150, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(1143, 150, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(1144, 150, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(1145, 150, '_wp_old_slug', 'non-len-th%e1%bb%9di-trang-n001');
INSERT INTO `th_postmeta` VALUES(1146, 141, '_wp_old_slug', 'ao-len-1001');
INSERT INTO `th_postmeta` VALUES(1147, 139, '_wp_old_slug', 'ao-len-1000');
INSERT INTO `th_postmeta` VALUES(1148, 153, '_wp_attached_file', '2012/09/DSC00793.jpg');
INSERT INTO `th_postmeta` VALUES(1149, 153, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(1150, 153, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"500";s:6:"height";s:3:"375";s:14:"hwstring_small";s:23:"height=''96'' width=''128''";s:4:"file";s:20:"2012/09/DSC00793.jpg";s:5:"sizes";a:8:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"DSC00793-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"DSC00793-300x225.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"225";}s:14:"post-thumbnail";a:3:{s:4:"file";s:20:"DSC00793-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:20:"DSC00793-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"DSC00793-400x300.jpg";s:5:"width";s:3:"400";s:6:"height";s:3:"300";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:18:"DSC00793-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:20:"DSC00793-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:11:"shop_single";a:3:{s:4:"file";s:20:"DSC00793-300x300.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(1151, 154, '_wp_attached_file', '2012/09/DSC00795.jpg');
INSERT INTO `th_postmeta` VALUES(1152, 154, '_woocommerce_exclude_image', '0');
INSERT INTO `th_postmeta` VALUES(1153, 154, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"500";s:6:"height";s:3:"375";s:14:"hwstring_small";s:23:"height=''96'' width=''128''";s:4:"file";s:20:"2012/09/DSC00795.jpg";s:5:"sizes";a:8:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"DSC00795-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"DSC00795-300x225.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"225";}s:14:"post-thumbnail";a:3:{s:4:"file";s:20:"DSC00795-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:20:"DSC00795-500x288.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"DSC00795-400x300.jpg";s:5:"width";s:3:"400";s:6:"height";s:3:"300";}s:14:"shop_thumbnail";a:3:{s:4:"file";s:18:"DSC00795-90x90.jpg";s:5:"width";s:2:"90";s:6:"height";s:2:"90";}s:12:"shop_catalog";a:3:{s:4:"file";s:20:"DSC00795-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:11:"shop_single";a:3:{s:4:"file";s:20:"DSC00795-300x300.jpg";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}');
INSERT INTO `th_postmeta` VALUES(1154, 126, 'total_sales', '0');
INSERT INTO `th_postmeta` VALUES(1155, 126, '_regular_price', '70000');
INSERT INTO `th_postmeta` VALUES(1156, 126, '_sale_price', '');
INSERT INTO `th_postmeta` VALUES(1157, 126, '_tax_status', 'taxable');
INSERT INTO `th_postmeta` VALUES(1158, 126, '_tax_class', '');
INSERT INTO `th_postmeta` VALUES(1159, 126, '_visibility', 'visible');
INSERT INTO `th_postmeta` VALUES(1160, 126, '_purchase_note', '');
INSERT INTO `th_postmeta` VALUES(1161, 126, '_featured', 'no');
INSERT INTO `th_postmeta` VALUES(1162, 126, '_weight', '');
INSERT INTO `th_postmeta` VALUES(1163, 126, '_length', '');
INSERT INTO `th_postmeta` VALUES(1164, 126, '_width', '');
INSERT INTO `th_postmeta` VALUES(1165, 126, '_height', '');
INSERT INTO `th_postmeta` VALUES(1166, 126, '_sku', '');
INSERT INTO `th_postmeta` VALUES(1167, 126, '_product_attributes', 'a:0:{}');
INSERT INTO `th_postmeta` VALUES(1168, 126, '_downloadable', 'no');
INSERT INTO `th_postmeta` VALUES(1169, 126, '_virtual', 'no');
INSERT INTO `th_postmeta` VALUES(1170, 126, '_sale_price_dates_from', '');
INSERT INTO `th_postmeta` VALUES(1171, 126, '_sale_price_dates_to', '');
INSERT INTO `th_postmeta` VALUES(1172, 126, '_price', '70000');
INSERT INTO `th_postmeta` VALUES(1173, 126, '_stock', '');
INSERT INTO `th_postmeta` VALUES(1174, 126, '_stock_status', 'instock');
INSERT INTO `th_postmeta` VALUES(1175, 126, '_backorders', 'no');
INSERT INTO `th_postmeta` VALUES(1176, 126, '_manage_stock', 'no');
INSERT INTO `th_postmeta` VALUES(1177, 126, '_wp_old_slug', 'ao-len-tr%e1%ba%bb-em-at001');
INSERT INTO `th_postmeta` VALUES(1178, 126, '_thumbnail_id', '154');
INSERT INTO `th_postmeta` VALUES(1179, 150, '_thumbnail_id', '152');
INSERT INTO `th_postmeta` VALUES(1180, 147, '_thumbnail_id', '148');
INSERT INTO `th_postmeta` VALUES(1181, 144, '_thumbnail_id', '146');
INSERT INTO `th_postmeta` VALUES(1182, 141, '_thumbnail_id', '142');
INSERT INTO `th_postmeta` VALUES(1183, 139, '_thumbnail_id', '140');
INSERT INTO `th_postmeta` VALUES(1184, 123, '_thumbnail_id', '124');
INSERT INTO `th_postmeta` VALUES(1185, 121, '_thumbnail_id', '122');
INSERT INTO `th_postmeta` VALUES(1186, 119, '_thumbnail_id', '120');
INSERT INTO `th_postmeta` VALUES(1187, 117, '_thumbnail_id', '118');
INSERT INTO `th_postmeta` VALUES(1188, 115, '_thumbnail_id', '116');
INSERT INTO `th_postmeta` VALUES(1189, 113, '_thumbnail_id', '114');
INSERT INTO `th_postmeta` VALUES(1190, 111, '_thumbnail_id', '112');
INSERT INTO `th_postmeta` VALUES(1191, 107, '_thumbnail_id', '108');
INSERT INTO `th_postmeta` VALUES(1192, 105, '_thumbnail_id', '106');
INSERT INTO `th_postmeta` VALUES(1193, 103, '_thumbnail_id', '104');
INSERT INTO `th_postmeta` VALUES(1194, 101, '_thumbnail_id', '102');
INSERT INTO `th_postmeta` VALUES(1195, 99, '_thumbnail_id', '100');
INSERT INTO `th_postmeta` VALUES(1196, 96, '_thumbnail_id', '97');
INSERT INTO `th_postmeta` VALUES(1197, 93, '_thumbnail_id', '94');
INSERT INTO `th_postmeta` VALUES(1198, 91, '_thumbnail_id', '92');
INSERT INTO `th_postmeta` VALUES(1199, 89, '_thumbnail_id', '90');
INSERT INTO `th_postmeta` VALUES(1200, 86, '_thumbnail_id', '88');
INSERT INTO `th_postmeta` VALUES(1201, 76, '_thumbnail_id', '78');
INSERT INTO `th_postmeta` VALUES(1202, 74, '_thumbnail_id', '75');
INSERT INTO `th_postmeta` VALUES(1203, 72, '_thumbnail_id', '73');
INSERT INTO `th_postmeta` VALUES(1204, 25, '_thumbnail_id', '70');
INSERT INTO `th_postmeta` VALUES(1205, 18, '_thumbnail_id', '125');
INSERT INTO `th_postmeta` VALUES(1206, 16, '_thumbnail_id', '69');
INSERT INTO `th_postmeta` VALUES(1207, 109, '_thumbnail_id', '110');

-- --------------------------------------------------------

--
-- Table structure for table `th_posts`
--

CREATE TABLE `th_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pinged` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=164 ;

--
-- Dumping data for table `th_posts`
--

INSERT INTO `th_posts` VALUES(45, 1, '2012-09-16 15:03:45', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 15:03:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?page_id=45', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(39, 1, '2012-09-16 03:34:29', '2012-09-16 03:34:29', ' ', '', '', 'publish', 'open', 'open', '', '39', '', '', '2012-09-16 15:07:59', '2012-09-16 15:07:59', '', 0, 'http://localhost/trathonghong/?p=39', 1, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(40, 1, '2012-09-16 15:06:10', '2012-09-16 15:06:10', '<strong>\r\n1. Thành Phố Hồ Chí Minh</strong>\r\n\r\n&nbsp;\r\n\r\nPhụ trách kinh doanh - 0988 436 483\r\n\r\nTiệm trà Anh Lợi\r\n\r\n&nbsp;\r\n\r\nĐC: Số 4 mặt tiền chợ Bình Tây – ĐT: 08. 3950 8848\r\n\r\nNhà thuốc Bảo Anh\r\n\r\nĐC: 82 Hải Thượng Lãn Ông, Q5 – ĐT: 08. 3944 6335\r\n\r\nĐại lý Kim Hưng\r\n\r\nĐC: 22 Điện Biên Phủ, P. Đa Kao, Q1 – ĐT: 08. 3820 6814\r\n\r\n&nbsp;\r\n\r\n<strong>2. Khu vực Bình Dương</strong><strong></strong>\r\n\r\nNhà phân phối Hoàng Trung\r\n\r\nĐC: 45/10 Ấp Tây B, Huyện Dĩ An.\r\n\r\nĐT: 0908 984 683\r\n\r\n&nbsp;\r\n\r\n<strong>3. Khu Vực Long Khánh</strong><strong></strong>\r\n\r\nNhà phân phối Anh Tuấn\r\n\r\nĐC: 20 Hoàng Diệu, khu Xuân Thanh I, xã Xuân Lộc, huyện Long Khánh, tỉnh Đồng Nai.\r\n\r\nĐT: 0949 121 709\r\n\r\n&nbsp;\r\n\r\n<strong>4. Khu Vực Đà Nẵng</strong><strong></strong>\r\n\r\nNhà phân phối Sang\r\n\r\nĐC: 32/25 Trần Hữu Trác, Sơn Trà – ĐT: 0905 114 390\r\n\r\nNhà phân phối Phương Được\r\n\r\nĐC: K46/52 đường Cao Thắng, TP Đà Nẵng – ĐT: 0511. 389 4025\r\n\r\n&nbsp;\r\n\r\n<strong>5. Khu Vực Nha Trang</strong><strong></strong>\r\n\r\nDNTN Hoàng Việt\r\n\r\nĐC: 18 Đoàn Thị Điểm, P. Sương Hưng, TP Nha Trang.\r\n\r\nĐT Nhà: 058. 3826 229 – ĐT Chợ: 058. 381 0208\r\n\r\n&nbsp;\r\n\r\n<strong>6. Khu Vực Buôn Mê Thuật</strong><strong></strong>\r\n\r\nNhà Phân Phối Qua Dung\r\n\r\nĐC: 101/6 Đào Duy Từ, Buôn Mê Thuột\r\n\r\nĐT: 0977 476 758 – 0918 564 891\r\n\r\n&nbsp;\r\n\r\n<strong>7. Khu Vực Cần Thơ</strong><strong></strong>\r\n\r\nNhà phân phối Hạnh\r\n\r\nĐT: 0918 508 638\r\n\r\n&nbsp;\r\n\r\n<strong>8. Khu vực Đà Lạt</strong><strong></strong>\r\n\r\nNhà phân phối Qua Dung\r\n\r\n16/3 Thái Phiên, P.12, Tp. Đà Lạt.\r\n\r\nĐT: 063. 358 5196\r\n\r\n&nbsp;\r\n\r\n<strong>9. Hoa kỳ</strong>\r\n\r\nCông ty TNHH Phương Tước\r\n\r\n&nbsp;\r\n\r\n8591 Mallard Ave, Garden Grove, CA 92844 - USA\r\n\r\nTel: 714-717-9176\r\n\r\nEmail: maituoc@hcm.fpt.vn', 'Đại lý', '', 'publish', 'open', 'open', '', 'dai-ly-tra-thong-hong', '', '', '2012-09-17 03:52:06', '2012-09-17 03:52:06', '', 0, 'http://localhost/trathonghong/?page_id=40', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(41, 1, '2012-09-16 07:51:22', '2012-09-16 07:51:22', '', 'Order &ndash; Sep 16, 2012 @ 07:51 AM', '', 'publish', 'open', 'closed', 'order_505584fae998a', 'order-sep-16-2012-0751-am', '', '', '2012-09-16 07:51:22', '2012-09-16 07:51:22', '', 0, 'http://localhost/trathonghong/?shop_order=order-sep-16-2012-0751-am', 0, 'shop_order', '', 2);
INSERT INTO `th_posts` VALUES(42, 1, '2012-09-16 08:12:06', '2012-09-16 08:12:06', '', 'Order &ndash; Sep 16, 2012 @ 08:12 AM', '', 'publish', 'open', 'closed', 'order_505589d66bb44', 'order-sep-16-2012-0812-am', '', '', '2012-09-16 08:12:06', '2012-09-16 08:12:06', '', 0, 'http://localhost/trathonghong/?shop_order=order-sep-16-2012-0812-am', 0, 'shop_order', '', 2);
INSERT INTO `th_posts` VALUES(43, 1, '2012-09-14 15:14:17', '2012-09-14 15:14:17', '[woocommerce_thankyou]', 'Order Received', '', 'inherit', 'open', 'open', '', '13-revision', '', '', '2012-09-14 15:14:17', '2012-09-14 15:14:17', '', 13, 'http://localhost/trathonghong/13-revision/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(44, 1, '2012-09-16 08:21:48', '0000-00-00 00:00:00', '', 'Order &ndash; September 16, 2012 @ 08:21 AM', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 08:21:48', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=shop_order&p=44', 0, 'shop_order', '', 0);
INSERT INTO `th_posts` VALUES(3, 1, '2012-09-14 15:12:58', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-14 15:12:58', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=3', 0, 'post', '', 0);
INSERT INTO `th_posts` VALUES(4, 1, '2012-09-14 15:14:17', '2012-09-14 15:14:17', '', 'Mua hàng online', '', 'publish', 'closed', 'open', '', 'shop', '', '', '2012-09-14 15:14:17', '2012-09-14 15:14:17', '', 0, 'http://localhost/wordpress/?page_id=4', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(5, 1, '2012-09-14 15:14:17', '2012-09-14 15:14:17', '[woocommerce_cart]', 'Giỏ hàng', '', 'publish', 'closed', 'open', '', 'cart', '', '', '2012-09-14 15:14:17', '2012-09-14 15:14:17', '', 0, 'http://localhost/wordpress/?page_id=5', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(6, 1, '2012-09-14 15:14:17', '2012-09-14 15:14:17', '[woocommerce_checkout]', 'Đặt hàng', '', 'publish', 'closed', 'open', '', 'checkout', '', '', '2012-09-14 15:14:17', '2012-09-14 15:14:17', '', 0, 'http://localhost/wordpress/?page_id=6', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(7, 1, '2012-09-14 15:14:17', '2012-09-14 15:14:17', '[woocommerce_order_tracking]', 'Huỷ đặt hàng', '', 'publish', 'closed', 'open', '', 'order-tracking', '', '', '2012-09-14 15:14:17', '2012-09-14 15:14:17', '', 0, 'http://localhost/wordpress/?page_id=7', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(8, 1, '2012-09-14 15:14:17', '2012-09-14 15:14:17', '[woocommerce_my_account]', 'Tài khoản', '', 'publish', 'closed', 'open', '', 'my-account', '', '', '2012-09-14 15:14:17', '2012-09-14 15:14:17', '', 0, 'http://localhost/wordpress/?page_id=8', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(9, 1, '2012-09-14 15:14:17', '2012-09-14 15:14:17', '[woocommerce_edit_address]', 'Cập nhật địa chỉ', '', 'publish', 'closed', 'open', '', 'edit-address', '', '', '2012-09-14 15:14:17', '2012-09-14 15:14:17', '', 8, 'http://localhost/wordpress/?page_id=9', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(10, 1, '2012-09-14 15:14:17', '2012-09-14 15:14:17', '[woocommerce_view_order]', 'Xem đặt hàng', '', 'publish', 'closed', 'open', '', 'view-order', '', '', '2012-09-14 15:14:17', '2012-09-14 15:14:17', '', 8, 'http://localhost/wordpress/?page_id=10', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(11, 1, '2012-09-14 15:14:17', '2012-09-14 15:14:17', '[woocommerce_change_password]', 'Đổi Password', '', 'publish', 'closed', 'open', '', 'change-password', '', '', '2012-09-14 15:14:17', '2012-09-14 15:14:17', '', 8, 'http://localhost/wordpress/?page_id=11', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(12, 1, '2012-09-14 15:14:17', '2012-09-14 15:14:17', '[woocommerce_pay]', 'Thanh toán', '', 'publish', 'closed', 'open', '', 'pay', '', '', '2012-09-14 15:14:17', '2012-09-14 15:14:17', '', 6, 'http://localhost/wordpress/?page_id=12', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(13, 1, '2012-09-14 15:14:17', '2012-09-14 15:14:17', '[woocommerce_thankyou]', 'Chấp nhận đơn hàng', '', 'publish', 'closed', 'open', '', 'order-received', '', '', '2012-09-16 08:14:26', '2012-09-16 08:14:26', '', 6, 'http://localhost/wordpress/?page_id=13', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(131, 1, '2012-09-17 06:51:12', '2012-09-17 06:51:12', '', 'THỜI TRANG LEN ', '', 'publish', 'open', 'open', '', 'th%e1%bb%9di-trang-len', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/trathonghong/?p=131', 5, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(15, 1, '2012-09-14 15:16:48', '2012-09-14 15:16:48', '', 'TẤT CẢ', 'Xem tất cả sản phẩm', 'publish', 'open', 'open', '', '15', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/wordpress/?p=15', 1, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(16, 1, '2012-09-14 15:19:25', '2012-09-14 15:19:25', 'Là hỗn hợp trà Xanh phảng phất hương vị theo sở thích của người Á đông, là loại trà cao cấp có mùi hương thơm ngát, có vị ngon truyền thống, là thức uống giải khát giàu Vitamin C, cung cấp nhiều Polyphenol.', 'TRÀ XANH', '', 'publish', 'open', 'closed', '', 'tra-xanh-thong-hong', '', '', '2012-09-17 14:13:49', '2012-09-17 14:13:49', '', 0, 'http://localhost/wordpress/?post_type=product&#038;p=16', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(17, 1, '2012-09-17 16:01:15', '2012-09-17 16:01:15', 'Là hỗn hợp trà Xanh phảng phất hương vị theo sở thích của người Á đông, là loại trà cao cấp có mùi hương thơm ngát, có vị ngon truyền thống, là thức uống giải khát giàu Vitamin C, cung cấp nhiều Polyphenol.', 'TRÀ XANH', '', 'inherit', 'open', 'open', '', '16-autosave', '', '', '2012-09-17 16:01:15', '2012-09-17 16:01:15', '', 16, 'http://localhost/wordpress/?p=17', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(18, 1, '2012-09-14 15:33:41', '2012-09-14 15:33:41', 'Trà <strong><strong>Atisô</strong></strong> của Thông Hồng được nhiều người biết đến bởi chất lượng tốt. Nguyên liệu được chọn lọc cẩn thận trước khi đưa vào sản xuất trên dây chuyền công nghệ hiện đại.\r\n\r\n&nbsp;\r\n\r\nĐược chế biến từ thân, rễ, hoa Atisô nguyên chất. Là thức uống giải khát hàng ngày, giúp dễ ngủ, mát gan, thông mật, hạ cholesterol và ure huyết, làm mịn da mặt.', 'TRÀ ATISÔ', '', 'publish', 'open', 'closed', '', 'tra-atiso-thong-hong', '', '', '2012-09-17 06:17:42', '2012-09-17 06:17:42', '', 0, 'http://localhost/wordpress/?post_type=product&#038;p=18', 0, 'product', '', 1);
INSERT INTO `th_posts` VALUES(19, 1, '2012-09-17 16:01:11', '2012-09-17 16:01:11', 'Trà <strong><strong>Atisô</strong></strong> của Thông Hồng được nhiều người biết đến bởi chất lượng tốt. Nguyên liệu được chọn lọc cẩn thận trước khi đưa vào sản xuất trên dây chuyền công nghệ hiện đại.\n\n&nbsp;\n\nĐược chế biến từ thân, rễ, hoa Atisô nguyên chất. Là thức uống giải khát hàng ngày, giúp dễ ngủ, mát gan, thông mật, hạ cholesterol và ure huyết, làm mịn da mặt.', 'TRÀ ATISÔ', '', 'inherit', 'open', 'open', '', '18-autosave', '', '', '2012-09-17 16:01:11', '2012-09-17 16:01:11', '', 18, 'http://localhost/wordpress/?p=19', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(125, 1, '2012-09-17 06:17:17', '2012-09-17 06:17:17', '', 'Trà Atiso', '', 'inherit', 'open', 'open', '', 'atiso', '', '', '2012-09-17 06:17:17', '2012-09-17 06:17:17', '', 18, 'http://localhost/trathonghong/wp-content/uploads/2012/09/atiso.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(139, 1, '2012-09-17 14:48:15', '2012-09-17 14:48:15', '', 'ÁO LEN A000', '', 'publish', 'open', 'closed', '', 'ao-len-a000', '', '', '2012-09-17 15:04:01', '2012-09-17 15:04:01', '', 0, 'http://www.vnestore.com/trathonghong/?post_type=product&#038;p=139', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(140, 1, '2012-09-17 14:47:26', '2012-09-17 14:47:26', '', 'DSC00801', '', 'inherit', 'open', 'open', '', 'dsc00801', '', '', '2012-09-17 14:47:26', '2012-09-17 14:47:26', '', 139, 'http://www.vnestore.com/trathonghong/wp-content/uploads/2012/09/DSC00801.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(25, 1, '2012-09-14 16:20:41', '2012-09-14 16:20:41', 'Được chế biến từ khổ qua nguyên chất, là thức uống giải khát, dùng thường xuyên có tác dụng bổ thận, lợi tiểu, nhuận gan, giải nhiệt, trợ tiêu hóa, giảm chất béo trong cơ thể. Thích hợp cho người bị tiểu đường.', 'TRÀ KHỔ QUA', '', 'publish', 'open', 'closed', '', 'tra-kho-qua', '', '', '2012-09-17 06:15:26', '2012-09-17 06:15:26', '', 0, 'http://localhost/wordpress/?post_type=product&#038;p=25', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(126, 1, '2012-09-17 15:06:36', '2012-09-17 15:06:36', '', 'ÁO LEN AT001', '', 'publish', 'open', 'closed', '', 'ao-len-tre-em-at001', '', '', '2012-09-17 15:08:18', '2012-09-17 15:08:18', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=126', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(127, 1, '2012-09-17 06:30:02', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-17 06:30:02', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=127', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(28, 1, '2012-09-15 13:35:57', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-15 13:35:57', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=28', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(29, 1, '2012-09-15 13:36:07', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-15 13:36:07', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=29', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(30, 1, '2012-09-15 13:40:17', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-15 13:40:17', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=30', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(31, 1, '2012-09-15 13:47:41', '0000-00-00 00:00:00', '', 'Order &ndash; September 15, 2012 @ 01:47 PM', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-15 13:47:41', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=shop_order&p=31', 0, 'shop_order', '', 0);
INSERT INTO `th_posts` VALUES(32, 1, '2012-09-16 02:59:34', '2012-09-16 02:59:34', '<table border="0" cellspacing="1" cellpadding="1">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">Sản phẩm trà THÔNG HỒNG là sự chắt lọc những dược thảo tinh túy từ thiên nhiên, với mong muốn đem đến người tiêu dùng những món quà bổ ích, thiết thực nhất cho sức khỏe.\r\n\r\nVới phương châm này, Công ty TNHH THÔNG HỒNG không ngừng cải tiến công nghệ, chú trọng triệt để vệ sinh an toàn thực phẩm từ khâu sản xuất đến khâu đóng gói để cho ra những sản phẩm ích lợi cao, chất lượng tốt.\r\n\r\nHiện nay, Công ty đang từng bước khẳng định thương hiệu của mình với hệ thống các siêu thị và đại lý phân phối rộng khắp ở hầu hết các tỉnh, thành trong cả nước. Đặc biệt, sản phẩm THÔNG HỒNG đã có mặt ở những thị trường "khó tính" nhất như châu Âu, châu Mỹ. Bên cạnh đó, trà THÔNG HỒNG luôn được người tiêu dùng đánh giá cao về chất lượng, mẫu mã, cũng như giá trị sử dụng của từng sản phẩm.\r\n\r\nĐược <strong>phục vụ và tri ân khách hàng</strong> là mục tiêu tâm đắc nhất của chúng tôi.</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Giới thiệu', '', 'publish', 'open', 'open', '', 'gioi-thieu-tra-thong-hong', '', '', '2012-09-16 03:10:14', '2012-09-16 03:10:14', '', 0, 'http://localhost/trathonghong/?page_id=32', 0, 'page', '', 0);
INSERT INTO `th_posts` VALUES(33, 1, '2012-09-16 02:59:02', '2012-09-16 02:59:02', '<table border="0" cellspacing="1" cellpadding="1">\n<tbody>\n<tr>\n<td colspan="2">Sản phẩm trà THÔNG HỒNG là sự chắt lọc những dược thảo tinh túy từ thiên nhiên, với mong muốn đem đến người tiêu dùng những món quà bổ ích, thiết thực nhất cho sức khỏe.\n\nVới phương châm này, Công ty TNHH THÔNG HỒNG không ngừng cải tiến công nghệ, chú trọng triệt để vệ sinh an toàn thực phẩm từ khâu sản xuất đến khâu đóng gói để cho ra những sản phẩm ích lợi cao, chất lượng tốt.\n\n&nbsp;\n\n&nbsp;\n\n&nbsp;\n\n&nbsp;\n\n&nbsp;\n\nHiện nay, Công ty đang từng bước khẳng định thương hiệu của mình với hệ thống các siêu thị và đại lý phân phối rộng khắp ở hầu hết các tỉnh, thành trong cả nước. Đặc biệt, sản phẩm THÔNG HỒNG đã có mặt ở những thị trường "khó tính" nhất như châu Âu, châu Mỹ. Bên cạnh đó, trà THÔNG HỒNG luôn được người tiêu dùng đánh giá cao về chất lượng, mẫu mã, cũng như giá trị sử dụng của từng sản phẩm.\n\n&nbsp;\n\n&nbsp;\n\nĐược <strong>phục vụ và tri ân khách hàng</strong> là mục tiêu tâm đắc nhất của chúng tôi.</td>\n</tr>\n</tbody>\n</table>', 'Giới thiệu', '', 'inherit', 'open', 'open', '', '32-revision', '', '', '2012-09-16 02:59:02', '2012-09-16 02:59:02', '', 32, 'http://localhost/trathonghong/32-revision/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(34, 1, '2012-09-16 03:09:46', '2012-09-16 03:09:46', '<table border="0" cellspacing="1" cellpadding="1">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">Sản phẩm trà THÔNG HỒNG là sự chắt lọc những dược thảo tinh túy từ thiên nhiên, với mong muốn đem đến người tiêu dùng những món quà bổ ích, thiết thực nhất cho sức khỏe.Với phương châm này, Công ty TNHH THÔNG HỒNG không ngừng cải tiến công nghệ, chú trọng triệt để vệ sinh an toàn thực phẩm từ khâu sản xuất đến khâu đóng gói để cho ra những sản phẩm ích lợi cao, chất lượng tốt.\r\n\r\nHiện nay, Công ty đang từng bước khẳng định thương hiệu của mình với hệ thống các siêu thị và đại lý phân phối rộng khắp ở hầu hết các tỉnh, thành trong cả nước. Đặc biệt, sản phẩm THÔNG HỒNG đã có mặt ở những thị trường "khó tính" nhất như châu Âu, châu Mỹ. Bên cạnh đó, trà THÔNG HỒNG luôn được người tiêu dùng đánh giá cao về chất lượng, mẫu mã, cũng như giá trị sử dụng của từng sản phẩm.\r\n\r\nĐược <strong>phục vụ và tri ân khách hàng</strong> là mục tiêu tâm đắc nhất của chúng tôi.</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Giới thiệu', '', 'inherit', 'open', 'open', '', '32-autosave', '', '', '2012-09-16 03:09:46', '2012-09-16 03:09:46', '', 32, 'http://localhost/trathonghong/32-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(35, 1, '2012-09-16 02:59:34', '2012-09-16 02:59:34', '<table border="0" cellspacing="1" cellpadding="1">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">Sản phẩm trà THÔNG HỒNG là sự chắt lọc những dược thảo tinh túy từ thiên nhiên, với mong muốn đem đến người tiêu dùng những món quà bổ ích, thiết thực nhất cho sức khỏe.\r\n\r\nVới phương châm này, Công ty TNHH THÔNG HỒNG không ngừng cải tiến công nghệ, chú trọng triệt để vệ sinh an toàn thực phẩm từ khâu sản xuất đến khâu đóng gói để cho ra những sản phẩm ích lợi cao, chất lượng tốt.\r\n\r\nHiện nay, Công ty đang từng bước khẳng định thương hiệu của mình với hệ thống các siêu thị và đại lý phân phối rộng khắp ở hầu hết các tỉnh, thành trong cả nước. Đặc biệt, sản phẩm THÔNG HỒNG đã có mặt ở những thị trường "khó tính" nhất như châu Âu, châu Mỹ. Bên cạnh đó, trà THÔNG HỒNG luôn được người tiêu dùng đánh giá cao về chất lượng, mẫu mã, cũng như giá trị sử dụng của từng sản phẩm.\r\n\r\nĐược <strong>phục vụ và tri ân khách hàng</strong> là mục tiêu tâm đắc nhất của chúng tôi.</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Giới thiệu', '', 'inherit', 'open', 'open', '', '32-revision-2', '', '', '2012-09-16 02:59:34', '2012-09-16 02:59:34', '', 32, 'http://localhost/trathonghong/32-revision-2/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(36, 1, '2012-09-16 03:01:54', '2012-09-16 03:01:54', '<table border="0" cellspacing="1" cellpadding="1">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">Sản phẩm trà THÔNG HỒNG là sự chắt lọc những dược thảo tinh túy từ thiên nhiên, với mong muốn đem đến người tiêu dùng những món quà bổ ích, thiết thực nhất cho sức khỏe.\r\n\r\nVới phương châm này, Công ty TNHH THÔNG HỒNG không ngừng cải tiến công nghệ, chú trọng triệt để vệ sinh an toàn thực phẩm từ khâu sản xuất đến khâu đóng gói để cho ra những sản phẩm ích lợi cao, chất lượng tốt.\r\n\r\nHiện nay, Công ty đang từng bước khẳng định thương hiệu của mình với hệ thống các siêu thị và đại lý phân phối rộng khắp ở hầu hết các tỉnh, thành trong cả nước. Đặc biệt, sản phẩm THÔNG HỒNG đã có mặt ở những thị trường "khó tính" nhất như châu Âu, châu Mỹ. Bên cạnh đó, trà THÔNG HỒNG luôn được người tiêu dùng đánh giá cao về chất lượng, mẫu mã, cũng như giá trị sử dụng của từng sản phẩm.\r\n\r\nĐược <strong>phục vụ và tri ân khách hàng</strong> là mục tiêu tâm đắc nhất của chúng tôi.</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Giới thiệu', '', 'inherit', 'open', 'open', '', '32-revision-3', '', '', '2012-09-16 03:01:54', '2012-09-16 03:01:54', '', 32, 'http://localhost/trathonghong/32-revision-3/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(37, 1, '2012-09-16 03:08:35', '2012-09-16 03:08:35', '<table border="0" cellspacing="1" cellpadding="1">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">Sản phẩm trà THÔNG HỒNG là sự chắt lọc những dược thảo tinh túy từ thiên nhiên, với mong muốn đem đến người tiêu dùng những món quà bổ ích, thiết thực nhất cho sức khỏe.\r\n\r\nVới phương châm này, Công ty TNHH THÔNG HỒNG không ngừng cải tiến công nghệ, chú trọng triệt để vệ sinh an toàn thực phẩm từ khâu sản xuất đến khâu đóng gói để cho ra những sản phẩm ích lợi cao, chất lượng tốt.\r\n\r\nHiện nay, Công ty đang từng bước khẳng định thương hiệu của mình với hệ thống các siêu thị và đại lý phân phối rộng khắp ở hầu hết các tỉnh, thành trong cả nước. Đặc biệt, sản phẩm THÔNG HỒNG đã có mặt ở những thị trường "khó tính" nhất như châu Âu, châu Mỹ. Bên cạnh đó, trà THÔNG HỒNG luôn được người tiêu dùng đánh giá cao về chất lượng, mẫu mã, cũng như giá trị sử dụng của từng sản phẩm.\r\n\r\nĐược <strong>phục vụ và tri ân khách hàng</strong> là mục tiêu tâm đắc nhất của chúng tôi.</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Giới thiệu', '', 'inherit', 'open', 'open', '', '32-revision-4', '', '', '2012-09-16 03:08:35', '2012-09-16 03:08:35', '', 32, 'http://localhost/trathonghong/32-revision-4/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(38, 1, '2012-09-16 03:09:41', '2012-09-16 03:09:41', '<table border="0" cellspacing="1" cellpadding="1">\r\n<tbody>\r\n<tr>\r\n<td colspan="2">Sản phẩm trà THÔNG HỒNG là sự chắt lọc những dược thảo tinh túy từ thiên nhiên, với mong muốn đem đến người tiêu dùng những món quà bổ ích, thiết thực nhất cho sức khỏe.\r\n\r\nVới phương châm này, Công ty TNHH THÔNG HỒNG không ngừng cải tiến công nghệ, chú trọng triệt để vệ sinh an toàn thực phẩm từ khâu sản xuất đến khâu đóng gói để cho ra những sản phẩm ích lợi cao, chất lượng tốt.\r\n\r\nHiện nay, Công ty đang từng bước khẳng định thương hiệu của mình với hệ thống các siêu thị và đại lý phân phối rộng khắp ở hầu hết các tỉnh, thành trong cả nước. Đặc biệt, sản phẩm THÔNG HỒNG đã có mặt ở những thị trường "khó tính" nhất như châu Âu, châu Mỹ. Bên cạnh đó, trà THÔNG HỒNG luôn được người tiêu dùng đánh giá cao về chất lượng, mẫu mã, cũng như giá trị sử dụng của từng sản phẩm.\r\n\r\nĐược <strong>phục vụ và tri ân khách hàng</strong> là mục tiêu tâm đắc nhất của chúng tôi.</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Giới thiệu', '', 'inherit', 'open', 'open', '', '32-revision-5', '', '', '2012-09-16 03:09:41', '2012-09-16 03:09:41', '', 32, 'http://localhost/trathonghong/32-revision-5/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(46, 1, '2012-09-16 06:22:28', '2012-09-16 06:22:28', '', 'Đại lý', '', 'inherit', 'open', 'open', '', '40-revision', '', '', '2012-09-16 06:22:28', '2012-09-16 06:22:28', '', 40, 'http://localhost/trathonghong/40-revision/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(47, 1, '2012-09-16 15:06:10', '2012-09-16 15:06:10', '', 'Đại lý', '', 'inherit', 'open', 'open', '', '40-revision-2', '', '', '2012-09-16 15:06:10', '2012-09-16 15:06:10', '', 40, 'http://localhost/trathonghong/40-revision-2/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(48, 1, '2012-09-16 15:07:59', '2012-09-16 15:07:59', ' ', '', '', 'publish', 'open', 'open', '', '48', '', '', '2012-09-16 15:07:59', '2012-09-16 15:07:59', '', 0, 'http://localhost/trathonghong/?p=48', 2, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(49, 1, '2012-09-16 15:10:04', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 15:10:04', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=49', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(130, 1, '2012-09-17 06:51:11', '2012-09-17 06:51:11', '', 'TRÀ VĨNH TIẾN', '', 'publish', 'open', 'open', '', 'tra-vinh-ti%e1%ba%bfn', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/trathonghong/?p=130', 4, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(129, 1, '2012-09-17 06:51:11', '2012-09-17 06:51:11', '', 'TRÀ THÔNG HỒNG', '', 'publish', 'open', 'open', '', 'tra-thong-h%e1%bb%93ng', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/trathonghong/?p=129', 3, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(128, 1, '2012-09-17 06:46:57', '2012-09-17 06:46:57', '', ' TRÀ ', '', 'publish', 'open', 'open', '', 'tra', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/trathonghong/?p=128', 2, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(53, 1, '2012-09-16 16:09:03', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:09:03', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=53', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(54, 1, '2012-09-16 16:13:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:13:53', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=54', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(55, 1, '2012-09-16 16:19:24', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:19:24', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=55', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(56, 1, '2012-09-16 16:21:15', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:21:15', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=56', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(57, 1, '2012-09-16 16:22:49', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:22:49', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=57', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(58, 1, '2012-09-16 16:24:34', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:24:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=58', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(59, 1, '2012-09-16 16:25:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:25:25', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=59', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(60, 1, '2012-09-16 16:30:03', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:30:03', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=60', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(61, 1, '2012-09-16 16:37:51', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:37:51', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=61', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(62, 1, '2012-09-16 16:40:23', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:40:23', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=62', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(63, 1, '2012-09-16 16:42:24', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:42:24', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=63', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(64, 1, '2012-09-16 16:47:13', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:47:13', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=64', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(65, 1, '2012-09-16 16:56:10', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:56:10', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=65', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(66, 1, '2012-09-16 16:58:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-16 16:58:53', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=66', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(67, 1, '2012-09-16 15:06:35', '2012-09-16 15:06:35', '', 'Đại lý', '', 'inherit', 'open', 'open', '', '40-revision-3', '', '', '2012-09-16 15:06:35', '2012-09-16 15:06:35', '', 40, 'http://localhost/trathonghong/40-revision-3/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(68, 1, '2012-09-17 03:53:08', '2012-09-17 03:53:08', '<strong>\n1. Thành Phố Hồ Chí Minh</strong>\n\n&nbsp;\n\nPhụ trách kinh doanh - 0988 436 483\n\nTiệm trà Anh Lợi\n\n&nbsp;\n\nĐC: Số 4 mặt tiền chợ Bình Tây – ĐT: 08. 3950 8848\n\nNhà thuốc Bảo Anh\n\nĐC: 82 Hải Thượng Lãn Ông, Q5 – ĐT: 08. 3944 6335\n\nĐại lý Kim Hưng\n\nĐC: 22 Điện Biên Phủ, P. Đa Kao, Q1 – ĐT: 08. 3820 6814\n\n&nbsp;\n\n<strong>2. Khu vực Bình Dương</strong><strong></strong>\n\nNhà phân phối Hoàng Trung\n\nĐC: 45/10 Ấp Tây B, Huyện Dĩ An.\n\nĐT: 0908 984 683\n\n&nbsp;\n\n<strong>3. Khu Vực Long Khánh</strong><strong></strong>\n\nNhà phân phối Anh Tuấn\n\nĐC: 20 Hoàng Diệu, khu Xuân Thanh I, xã Xuân Lộc, huyện Long Khánh, tỉnh Đồng Nai.\n\nĐT: 0949 121 709\n\n&nbsp;\n\n<strong>4. Khu Vực Đà Nẵng</strong><strong></strong>\n\nNhà phân phối Sang\n\nĐC: 32/25 Trần Hữu Trác, Sơn Trà – ĐT: 0905 114 390\n\nNhà phân phối Phương Được\n\nĐC: K46/52 đường Cao Thắng, TP Đà Nẵng – ĐT: 0511. 389 4025\n\n&nbsp;\n\n<strong>5. Khu Vực Nha Trang</strong><strong></strong>\n\nDNTN Hoàng Việt\n\nĐC: 18 Đoàn Thị Điểm, P. Sương Hưng, TP Nha Trang.\n\nĐT Nhà: 058. 3826 229 – ĐT Chợ: 058. 381 0208\n\n&nbsp;\n\n<strong>6. Khu Vực Buôn Mê Thuật</strong><strong></strong>\n\nNhà Phân Phối Qua Dung\n\nĐC: 101/6 Đào Duy Từ, Buôn Mê Thuột\n\nĐT: 0977 476 758 – 0918 564 891\n\n&nbsp;\n\n<strong>7. Khu Vực Cần Thơ</strong><strong></strong>\n\nNhà phân phối Hạnh\n\nĐT: 0918 508 638\n\n&nbsp;\n\n<strong>8. Khu vực Đà Lạt</strong><strong></strong>\n\nNhà phân phối Qua Dung\n\n16/3 Thái Phiên, P.12, Tp. Đà Lạt.\n\nĐT: 063. 358 5196\n\n&nbsp;\n\n<strong>9. Hoa kỳ</strong>\n\nCông ty TNHH Phương Tước\n\n&nbsp;\n\n8591 Mallard Ave, Garden Grove, CA 92844 - USA\n\nTel: 714-717-9176\n\nEmail: maituoc@hcm.fpt.vn', 'Đại lý', '', 'inherit', 'open', 'open', '', '40-autosave', '', '', '2012-09-17 03:53:08', '2012-09-17 03:53:08', '', 40, 'http://localhost/trathonghong/40-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(69, 1, '2012-09-17 04:36:16', '2012-09-17 04:36:16', '', 'traxanhhop', '', 'inherit', 'open', 'open', '', 'traxanhhop', '', '', '2012-09-17 04:36:16', '2012-09-17 04:36:16', '', 16, 'http://localhost/trathonghong/wp-content/uploads/2012/09/traxanhhop.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(70, 1, '2012-09-17 04:38:20', '2012-09-17 04:38:20', '', 'Trà khổ qua', '', 'inherit', 'open', 'open', '', 'khoquahop', '', '', '2012-09-17 04:38:20', '2012-09-17 04:38:20', '', 25, 'http://localhost/trathonghong/wp-content/uploads/2012/09/khoquahop.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(71, 1, '2012-09-17 04:40:46', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-09-17 04:40:46', '0000-00-00 00:00:00', '', 0, 'http://localhost/trathonghong/?post_type=product&p=71', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(72, 1, '2012-09-17 04:41:58', '2012-09-17 04:41:58', 'Được chế biến từ búp trà nguyên chất, là thức uống giải khát dùng thường xuyên có lợi cho sức khỏe, đặc biệt là tim mạch. Mùi thơm phảng phất từ hương lài tạo cảm giác sảng khoái và thoải mái.', 'TRÀ LÀI', '', 'publish', 'open', 'closed', '', 'tra-lai-thong-hong', '', '', '2012-09-17 05:44:01', '2012-09-17 05:44:01', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=72', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(73, 1, '2012-09-17 04:41:47', '2012-09-17 04:41:47', '', 'tralai', '', 'inherit', 'open', 'open', '', 'tralai', '', '', '2012-09-17 04:41:47', '2012-09-17 04:41:47', '', 72, 'http://localhost/trathonghong/wp-content/uploads/2012/09/tralai.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(74, 1, '2012-09-17 04:42:43', '2012-09-17 04:42:43', 'Được chế biến từ gừng nguyên chất, là thức uống giải khát có tác dụng tốt cho người bị đau bụng lạnh, đầy trướng, không tiêu hoặc thổ tả, bị nhiễm lạnh, chân tay lạnh, mạch nhỏ, ho do lạnh. Mùi thơm đặc trưng của gừng.', 'TRÀ GỪNG', '', 'publish', 'open', 'closed', '', 'tra-gung-thong-hong', '', '', '2012-09-17 05:43:45', '2012-09-17 05:43:45', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=74', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(75, 1, '2012-09-17 04:42:37', '2012-09-17 04:42:37', '', 'tragung', '', 'inherit', 'open', 'open', '', 'tragung', '', '', '2012-09-17 04:42:37', '2012-09-17 04:42:37', '', 74, 'http://localhost/trathonghong/wp-content/uploads/2012/09/tragung.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(76, 1, '2012-09-17 04:43:19', '2012-09-17 04:43:19', 'Thành phần: 100% bông Atisô\r\n\r\nCông dụng: Là thức uống giải khát hàng ngày, giúp mát gan, thông mật, lợi tiểu, tăng bài tiết mật, hạ cholesterol và ure huyết, đẹp da.\r\n\r\nCách dùng: Mỗi lần nấu khoảng 50 gram rửa sạch với 2 lít nước, bỏ vào ấm nấu sôi từ 10 đến 15 phút, có thể pha thêm đường phèn hoặc sửa tùy thích.', 'BÔNG ATISÔ', '', 'publish', 'open', 'closed', '', 'bong-atiso', '', '', '2012-09-17 05:43:18', '2012-09-17 05:43:18', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=76', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(78, 1, '2012-09-17 04:43:57', '2012-09-17 04:43:57', '', 'bongatiso', '', 'inherit', 'open', 'open', '', 'bongatiso', '', '', '2012-09-17 04:43:57', '2012-09-17 04:43:57', '', 76, 'http://localhost/trathonghong/wp-content/uploads/2012/09/bongatiso.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(79, 1, '2012-09-17 04:46:52', '2012-09-17 04:46:52', 'Trà đen, trà xanh đều là sản phẩm từ cây trà có tên khoa là <strong>CAMELLIA SINENSIS</strong>. Trà đen được ủ men còn trà xanh thì không (trà ô long được ủ men một phần) trà xanh là thức uống sức khoẻ phổ biến ở Châu Á từ hơn 5000 năm qua.\r\n<strong>Trà xanh giúp phòng chống bệnh ung thư vú:</strong>\r\nNhững chất Polyphennol có trong trà xanh có vai trò quan trọng trong việc phong chống bệnh ung thư. so với trà đen thì trà xanh có hàm lượng polyphenol cao hơn vì không bị quá trình ủ men làm thay đổi thành phần. Đặt biệt, chất chống oxy hoá EGCG (epigallotechin gallate) là loại polyphenol vô cùng mạnh mẽ , là nhân tố chủ yếu tạo nên dược tính của trà xanh. Nó có công dụng ngăn ngừa các enzyme kích hoạt sự sao chép nhân bản tế bào.\r\n\r\nTrong nhiều thí nghiệm khác nhau những con chuột bị khối u ở vú được cho uống trà xanh, so sánh với những con chuột tương tự cho uống nước lã. Kết quả cho thấy những con chuột cho uống trà xanh giảm kích thướt khối u, còn những khối u mới chậm phát triển hơn. các nhà khoa học nhật bản ở viện nghiên cứu ung thư Saitama đã khám phá ra rằng nhưng phụ nữ có thói quen uống hơn 5 tách trà xanh mỗi ngày thường ít có nguy cơ mắt bệnh hoặc tái phát bệnh ung thư vú và bệnh không di căn nhanh chống như những đối tượng bình thường khác\r\n\r\nĐây là một thông điệp tốt đẹp để phụ nữ chúng ta quan tâm đến trà xanh . Để đạt được những lợi ích sức khoẻ bạn chỉ cần uống 3-4 tách mỗi ngày và tốt hơn nữa là không nên pha thêm đường hay sữa.\r\n\r\n<strong>Trà xanh và bệnh viêm khớp:</strong>\r\nTiến sĩ Tariq công tác tại trường đại học Western Reverve ở Cleveland, Ohio (Mỹ), đã cùng nhóm nghiên cứu tìm hiểu tác động của polyphenol đối với bệnh viêm khớp tiến triển tăng dần với các triệu chứng: viêm sưng, đau nhức, thoái hoá khớp.\r\n\r\nNhững con chuột ở trong phòng thí nghiệm cho uống: hoặc là nước trà xanh với liều lượng tương đương 4 tách mỗi ngày ở người hoặc là uống nước lã. Sau đó chúng được thử nghiệm bị tiêm collagen vào để nhằm mục đích gây ra bệnh viêm khớp tiến triển tăng dần ở người. Kết quả nghiên cưu cho thấy con chuột uống trà xanh ít bị viêm khớp hơn so với con chuột uống nước lã. Tuy nhiên cho dù chúng có mắc bệnh viêm khớp đi chăng nữa thì con chuột uống trà xanh chỉ mắt bệnh sơ sài vào một thời gian khá lâu sau đó.\r\n\r\nCó một nhận xét thú vị rằng ở các quốc gia như Ấn Độ, Trung Quốc, Nhật Bản những nơi được xem trà là thức uống sức khỏe hàng ngày thì bệnh viêm khớp giảm hẳn so với nơi khác trên thế giới.\r\n\r\n<strong>Trà xanh và bệnh tim:</strong>\r\nVào tháng 5/2002 tạp chí "Circuration" của hội tim mạch Mỹ đã công bố cho thấy trà xanh nếu được uống thường xuyên sẽ giúp ít cho các bệnh nhân bệnh tim mạch . Kenneth J Mukamal mộy bác sĩ kiêm thạc sỉ công tác tại một trung tâm y khoa Beth Israel Deaconess cho biết "những lợi sức khoẻ lớn nhất của trà xanh đượ tìm thấy ở những bệnh nhân tim mạch".\r\nMukamal cùng các cộng sự đã khám pha ra rằng sau khi phát cơn đau tim những bệnh nhân nghiện trà xanh cỡ nặng "đô" có tỉ lệ tử vong ít hơn 44% so với bệnh nhân không uống trà, còn những bệnh nhân uống trà xanh ở mức độ vừa phải có tỉ lệ tử vong ít hơn 22% so với những người không uống trà. Chìa khóa cho tính năng bảo vệ sức khoẻ của trà xanh chính là các flavonoid. Flavonoid hiện diện trong cả trà xanh, trà đen, trong một số loại rau, táo, hành, bông cải, có khả năng ngăn ngừa cholesterol xấu LDL không bị Oxy hoá, chống tụ máu, chống xơ cứng động mạch. Tuy nhiên ,Mukamal cũng lưu ý rằng cần phaỉ có thêm nhiều nghiên cứu lâm sàng nữa  ngay trên cả cá nhân mạnh khoẻ lẫn bệnh tật.\r\n\r\n<strong>Trà xanh có công năng diệt khuẩn E-coli O-157:</strong>\r\nTháng 8/1996 giáo sư T. Shimamura công tác tại trường đại học y khoa Showa (Nhật Bản) đã có công trình diễn thuyết "về tác động diệt khuẩn E-coli-157" tại hội thảo chuyên đề diệt khuẩn của trà xanh.\r\n\r\nCatechin hợp chất tạo nên vị đắng của trà xanh có công dụng hữu hiệu trong việc tiêu diệt hầu hết các những loại vi khuẩn gây ngộ độc thực phẩm và giải trừ luôn những độc tố do vi khuẩn tiết ra cụ thể đây là độc tố Veratoxin của Ecoli -157. Nếu uống trà xanh trong và sau bữa ăn sẽ phát huy được cơ chế chất Catechin tiêu diệt tế bào ngoài của vi khuẩn. Trong các thử nghiệm này trà xanh được ngâm trong nước muối để tạo ra hợp chất pha loãng nồng độ 2,5% - 5% so với trà bình thường. Còn khi ngâm với nước nóng chất Catechin được giải thể nhiều hơn nên tác động diệt khuẩn cũng được cải thiện.\r\n\r\n<strong>Một số hợp chất hoá học và lợi ít sức khoẻ khác của trà xanh:</strong>\r\nCatechin giảm nguy cơ đột biến gen giảm cholesterol, cao huyết áp, đường máu, diệt vi khuẩn cúm, ngừa sâu răng, hơi thở hôi.\r\n\r\nCaffeine giúp bạn tỉnh táo giảm mỗi mệt, buồn ngủ, dùng như chất lợi tiểu.\r\nVitamin C giảm stress, ngừa cảm cúm.\r\n\r\nAcid Gama-AminoBityric(GABA) hạ huyết áp.\r\nFlavomoid tăng cường sức khoẻ thành động mạch, ngừa hôi miệng.\r\nPolysaccharide ngừa tăng đường máu Fluoride ngừa sâu răng.\r\n\r\nVitamin E như là chất chống oxy hoá duy trì tuổi xuân\r\nTheanine tăng cường khẩu vị\r\n\r\nBạn pha trà xanh để thưởng thức hương vị hay để đạt được lợi ích sức khoẻ. Pha một tách trà xanh tuyệt hảo không dể dàng như bạn nghĩ, nếu không được học "trà đạo" cẩn thận những chất polyphenol vốn có ích cho sức khoẻ có thể quay ra phá hỏng hương vị làm cho trà đắng và đầy bọt. Dùng nước nóng tốt hơn là dùng nước sôi ùng ục trên bếp.\r\nKích thước lá trà tốt nhất là chọn lá trà nhỏ xoăn ít vì nó giúp hãm trà nhanh hơn. Lá trà lớn xoăn tít quá mất nhiều thời gian hãm trà hơn.\r\n\r\nTrà lá rời và trà túi lọc: nên dùng trà lá rời hơn là trà túi lọc. Túi lọc nên nhấn chìm, không nên để nổi lều bều trên mặt nước.\r\n\r\nThời gian hãm độ 2-5 phút hàm lượng polyphenol tăng lên với thời gian hãm. Hãm trà nhanh chỉ cho bạn thứ nước nhiều caffeine nhưng lại ít polyphenol.\r\n\r\nTốt nhất là pha theo hướng dẫn của từng hảng sản xuất nhưng dưới đây là nguyên tắc chung để pha trà ngon:\r\n\r\nDùng một túi trà, hay 2-4 gam trà(1-2 muỗng trà lá tuỳ theo từng loại trà xanh bạn đang dùng ) cho mỗi một tách nước\r\nĐun sôi một ấm nước lạnh sau đó tắt bếp để nước nghỉ khoảng 3 phút\r\n\r\n+ Đổ nước nóng lên trà lá hay trà túi hãm độ 3 phút.\r\n+ Đợi thêm 3 phút nữa cho trà nguội bớt và thưởng thức', 'Trà xanh phòng chống nhiều bệnh', '', 'publish', 'open', 'open', '', 'tra-xanh-phong-chong-nhieu-benh', '', '', '2012-09-17 04:46:52', '2012-09-17 04:46:52', '', 0, 'http://localhost/trathonghong/?p=79', 0, 'post', '', 0);
INSERT INTO `th_posts` VALUES(80, 1, '2012-09-17 04:46:14', '2012-09-17 04:46:14', '', 'Trà xanh phòng chống nhiều bệnh', '', 'inherit', 'open', 'open', '', '79-revision', '', '', '2012-09-17 04:46:14', '2012-09-17 04:46:14', '', 79, 'http://localhost/trathonghong/79-revision/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(81, 1, '2012-09-17 04:47:48', '2012-09-17 04:47:48', 'Trà đạo là hoạt động uống trà đặc thù mang tính nghệ thuật, mang phong cách tình cảm riêng của người Nhật Bản, mà đặc điểm chính là pha trà và thưởng thức trà. Nghệ thuật này đã có hơn 500 năm lịch sử ở Nhật.\r\n\r\nNgười sáng lập trà đạo là một hòa thượng tên gọi Muratashu Mitsu. Ông đã tìm thấy hương vị tuyệt vời trong khi uống trà. Sau này, các đệ tử của ông đã phát huy ảnh hưởng và hình thành nên một môn nghệ thuật lưu truyền đến ngày nay.\r\n\r\nNhững người Nhật thích uống trà thường thành lập những nhóm nhỏ, chọn ngày mời nhau cùng thưởng thức. Số người tham gia mỗi lần không vượt quá 4 người và hoàn cảnh tổ chức một buổi trà đạo cũng có những quy định đặc biệt. Những gia đình khá giả thường cho xây ba căn phòng nhỏ trong vườn riêng nhà mình, hai phòng nối liền nhau, trong đó một phòng là phòng trà - nơi tổ chức trà đạo, phòng kia đặt than, bộ đồ trà và vòi nước. Phòng còn lại là nơi nghỉ ngơi của khách, phải cách hai phòng kia một khoảng nhất định. Trong vườn có những con đường nhỏ lát đá, quanh co với hai bên trồng hoa và cây cảnh làm cho không gian trong vườn yên tĩnh và thanh nhã. Bố trí trong phòng trà cũng rất được chú ý. Thông thường là treo tranh của các danh họa nổi tiếng, có hoa cắm nghệ thuật để khách mời được thưởng thức nghệ thuật mang hương sắc cổ kính.\r\n\r\nThời gian tổ chức trà đạo chia ra làm 4 loại: trà sáng (7h sáng), sau ăn cơm (8h sáng), giữa trưa (12h trưa) và câu chuyện buổi tối (6h tối). Khách mời đúng giờ đến phòng nghỉ, gõ vào chiếc chuông gỗ báo hiệu đã đến. Chủ nhà nghe tiếng chuông sẽ từ phòng trà ra đón khách. Trước cửa phòng trà có đặt một chiếc cối đá đựng đầy nước, khách phải rửa sạch tay trước khi vào phòng. Cửa ra vào có một ô cửa cao gần 3 thước để khách tháo giày đi vào. Khi bước vào phòng phải khom mình tỏ ý khiêm tốn. Nếu khách là võ sĩ thì phải tháo kiếm trước mới được bước vào để biểu thị không khí hòa bình. Trong số khách, người tinh thông trà đạo được cử làm người chủ trì. Người chủ trì phải cạo trọc đầu để biểu thị sạch sẽ, thanh khiết. Trong phòng trà, một góc chiếu có đặt bếp lò và nồi nước bằng gốm, trước bếp đặt bộ đồ trà. Bộ đồ trà phải thô, nặng có men màu cam hoặc đen đậm dáng vẻ cổ kính. Trong khi chủ nhân đun nước thì khách dùng điểm tâm. Món điểm tâm này hết sức tinh tế phải được làm căn cứ vào thời tiết. Ví dụ: tổ chức trà đạo vào mùa thu thì món điểm tâm phải làm giống như lá phong hoặc hoa cúc. Trà để pha là loại bột trà xanh được chế biến cẩn thận bằng cách giã nát trong cối đá - người Nhật gọi là nghiền trà.\r\n\r\nCó hai cách pha trà: pha đặc và pha loãng. Trà đặc thông thường ba người thay nhau uống một bát, mỗi người ba hớp rưỡi hết 1/3 bát. Trà loãng mỗi người uống riêng một bát. Trà đặc có màu xanh đậm, hương thơm hơi chát. Chủ nhân múc hai muôi gỗ trà cho vào bát, đổ nước sôi, dùng que trúc khuấy đều để trà có nước đặc như bột đậu. Bát đầu tiên mời người chủ trì, người chủ trì nâng bát trà ngang trán rồi mới uống. Khi uống phải chép miệng để tỏ ý thực sự được thưởng thức trà ngon của chủ nhân. Khi tất cả khách uống xong thì nghi thức trà đạo cũng kết thúc. Nhưng đôi khi còn một nghi lễ cao hơn là ăn cơm thường sau khi uống trà. Tuy gọi là cơm thường nhưng cũng thịnh soạn.\r\n\r\nTrà đạo đã hình thành nhiều trường phái khác nhau, chủ yếu có ba trường phái lớn là: Risenka, Hyosenka và Bushakoro Senka. Mỗi nhà đều theo chế độ gia truyền - tức là con thường kế nghiệp bố làm người chủ trì trà đạo của gia đình đó.\r\n\r\nChỉ một ly trà xanh nho nhỏ nhưng với người Nhật nó lại như một ốc đảo trong tâm hồn. Họ cho rằng thông qua trà đạo có thể phát hiện được giá trị tinh thần cần có của bản thân. Có người dùng 4 chữ "hòa, kính, thanh, tịnh" để khái quát tinh thần cơ bản của trà đạo. "Hòa" là hòa bình; "kính" là tôn trọng người trên, yêu thương bè bạn, con cháu; "thanh" tức là thanh tịnh, thanh khiết; còn "tịch" là giới hạn mỹ học cao nhất của trà đạo: an nhàn.\r\n\r\nTrà đạo ngày nay càng phổ biến hơn ở Nhật Bản, rất nhiều cô gái trẻ dồn tâm sức học tập trà đạo, tu nhân dưỡng tính để cuộc sống gia đình cũng như cuộc sống tinh thần phong phú và đẹp đẽ hơn.', 'Trà đạo Nhật Bản', '', 'publish', 'open', 'open', '', 'tra-dao-nhat-ban', '', '', '2012-09-17 04:47:48', '2012-09-17 04:47:48', '', 0, 'http://localhost/trathonghong/?p=81', 0, 'post', '', 0);
INSERT INTO `th_posts` VALUES(82, 1, '2012-09-17 04:47:09', '2012-09-17 04:47:09', '', 'Trà đạo Nhật Bản', '', 'inherit', 'open', 'open', '', '81-revision', '', '', '2012-09-17 04:47:09', '2012-09-17 04:47:09', '', 81, 'http://localhost/trathonghong/81-revision/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(83, 1, '2012-09-17 05:00:18', '2012-09-17 05:00:18', 'Thuốc nào vừa công vừa thủ?\r\n\r\nNếu xét về mặt cơ chế dược lý, không dễ tìm được loại thuốc có tác dụng kép, vừa công phá bệnh nguyên, vừa bảo vệ tế bào trên cùng cơ quan nội tạng. Atisô lại là một trường hợp ngoại lệ.\r\n\r\n&nbsp;\r\n\r\nMuốn kể cho hết công lao của Atisô phải bắt đầu với tác dụng lợi mật. Dưới tác dụng của  Atisô mật chẳng những được bài tiết nhiều hơn trong gan mà còn thoát xuống túi mật nhanh hơn bình thường. Chất độc trong gan nhờ đó cũng bị kéo theo qua túi mật rồi xuống ruột non nên không có đủ thời giờ phá hoại lá gan. Nhờ đó mà gan hóa giải đủ loại độc tố, từ chất phụ gia trong thực phẩm công nghệ bước qua hóa chất trong nông nghiệp cho đến chất cồn trong rượu bia. Người phải làm việc trong môi trường ô nhiễm, kẻ khó từ chối ly rượu vì chuyện làm ăn, vẫn có thể góp phần chủ động bảo vệ lá gan nếu biết cách kết hợp  Atisô cho thường trong bữa cơm hàng ngày.\r\n\r\nKhông chỉ vì thế, tình trạng ứ mật trong gan là nguyên nhân  dẫn đến nhiều triệu chứng khó chịu như đầy hơi, sình bụng, tiêu chảy hay táo bón. Đó cũng là đòn bẩy cho sỏi túi mật. Nhưng vấn đề chưa dừng lại ở đó. Mật ứ lại trong gan sớm muộn cũng quay lại tấn công ngay cấu trúc của gan. Nhiều người ắt hẳn sẽ không xem thường tình trạng ứ mật trong gan nếu biết đó là hậu quả khó tránh của bệnh túi mật, viêm gan siêu vi, nghiện rượu, bệnh tuyến giáp, thai kỳ, cũng như do việc lạm dụng thuốc  kháng viêm, giảm đau, trị thấp khớp, ngừa thai, nội tiết tố, an thần, kháng sinh … Viêm gan do ứ mật đúng là bệnh thật đáng tiếc khi biện pháp phòng ngừa có khó gì đâu với chén trà hoặc cc sản phẩm chứa Atisô sau mỗi bữa cơm nhiều thịt mỡ.\r\n\r\nBên cạnh tác dụng lợi mật, Actisô còn là phương tiện hiệu quả để cải thiện tiêu hóa, chống biếng ăn và điều trị đau bụng trong “hội chứng đường ruột quá nhạy cảm”. Doanh nhân càng căng thẳng vì công việc càng nên nhớ đến Atisô, nếu muốn tránh cảnh đứng ngồi không yên! Với người cao tuổi, Atisô là vị thuốc nhuận trường lý tưởng, vì không chỉ vì hòa hõan về tác dụng mà do an toàn khi dùng lâu dài.\r\n\r\nĐừng tưởng Atisô chỉ có tác dụng trực tiếp trên đường tiêu hóa. Actisô còn có công năng hạ chất mỡ trong máu thông qua tác dụng “kép”. Một mặt, Actisô ức chế tiến trình tổng hợp cholesterol trong gan. Mặt khác, Actisô thúc đẩy phản ứng phân hủy cholesterol để hàm lượng chất này trong máu không kịp vượt quá định mức bình thường. Kiểm soát đầu vào, đẩy mạnh đầu ra, đâu còn biện pháp nào khéo hơn để chống tình trạng tồn kho?!\r\n\r\nCần nói thêm một điểm dễ quên. Không dùng thì thôi, đã dùng Actisô thì đừng dùng theo kiểu thỉnh thoảng một lần cho có vẻ người sành điệu. Muốn tận dụng công năng của Atisô phải dùng nhiều ngày liên tục, tối thiểu l tuần. Uống trà Atisô theo kiểu chỉ để dành để mời khách quý thì đừng lấy làm lạ nếu cả chủ lẫn khách có ngày phải khám bệnh … gan!\r\n\r\nTrên võ đài thường khi võ sĩ chỉ có thể chọn một trong hai chiến thuật, hoặc công, hoặc thủ. Với người muốn phòng bệnh gan lại khác. Không thể chỉ công hay thủ. Hai mặt giáp công sao cho đồng bộ chính là nguyên tắc quan trọng hàng đầu để yểm trợ lá gan. Đó chính là lý do khiến Actisô đã có mặt trong kho tàng kinh nghiệm của y học dân gian trên khắp năm châu.\r\n\r\nBác sĩ Lương Lễ Hoàng.\r\n\r\n<em>(Nguồn: Website Thuốc &amp; biệt dược)</em>', 'Atisô - Công và thủ', '', 'publish', 'open', 'open', '', 'atiso-cong-va-th%e1%bb%a7', '', '', '2012-09-17 05:00:18', '2012-09-17 05:00:18', '', 0, 'http://localhost/trathonghong/?p=83', 0, 'post', '', 0);
INSERT INTO `th_posts` VALUES(84, 1, '2012-09-17 04:49:04', '2012-09-17 04:49:04', 'Thuốc nào vừa công vừa thủ?\n\nNếu xét về mặt cơ chế dược lý, không dễ tìm được loại thuốc có tác dụng kép, vừa công phá bệnh nguyên, vừa bảo vệ tế bào trên cùng cơ quan nội tạng. Atisô lại là một trường hợp ngoại lệ.\n\n&nbsp;\n\nMuốn kể cho hết công lao của Atisô phải bắt đầu với tác dụng lợi mật. Dưới tác dụng của  Atisô mật chẳng những được bài tiết nhiều hơn trong gan mà còn thoát xuống túi mật nhanh hơn bình thường. Chất độc trong gan nhờ đó cũng bị kéo theo qua túi mật rồi xuống ruột non nên không có đủ thời giờ phá hoại lá gan. Nhờ đó mà gan hóa giải đủ loại độc tố, từ chất phụ gia trong thực phẩm công nghệ bước qua hóa chất trong nông nghiệp cho đến chất cồn trong rượu bia. Người phải làm việc trong môi trường ô nhiễm, kẻ khó từ chối ly rượu vì chuyện làm ăn, vẫn có thể góp phần chủ động bảo vệ lá gan nếu biết cách kết hợp  Atisô cho thường trong bữa cơm hàng ngày.\n\nKhông chỉ vì thế, tình trạng ứ mật trong gan là nguyên nhân  dẫn đến nhiều triệu chứng khó chịu như đầy hơi, sình bụng, tiêu chảy hay táo bón. Đó cũng là đòn bẩy cho sỏi túi mật. Nhưng vấn đề chưa dừng lại ở đó. Mật ứ lại trong gan sớm muộn cũng quay lại tấn công ngay cấu trúc của gan. Nhiều người ắt hẳn sẽ không xem thường tình trạng ứ mật trong gan nếu biết đó là hậu quả khó tránh của bệnh túi mật, viêm gan siêu vi, nghiện rượu, bệnh tuyến giáp, thai kỳ, cũng như do việc lạm dụng thuốc  kháng viêm, giảm đau, trị thấp khớp, ngừa thai, nội tiết tố, an thần, kháng sinh … Viêm gan do ứ mật đúng là bệnh thật đáng tiếc khi biện pháp phòng ngừa có khó gì đâu với chén trà hoặc cc sản phẩm chứa Atisô sau mỗi bữa cơm nhiều thịt mỡ.\n\nBên cạnh tác dụng lợi mật, Actisô còn là phương tiện hiệu quả để cải thiện tiêu hóa, chống biếng ăn và điều trị đau bụng trong “hội chứng đường ruột quá nhạy cảm”. Doanh nhân càng căng thẳng vì công việc càng nên nhớ đến Atisô, nếu muốn tránh cảnh đứng ngồi không yên! Với người cao tuổi, Atisô là vị thuốc nhuận trường lý tưởng, vì không chỉ vì hòa hõan về tác dụng mà do an toàn khi dùng lâu dài.\n\nĐừng tưởng Atisô chỉ có tác dụng trực tiếp trên đường tiêu hóa. Actisô còn có công năng hạ chất mỡ trong máu thông qua tác dụng “kép”. Một mặt, Actisô ức chế tiến trình tổng hợp cholesterol trong gan. Mặt khác, Actisô thúc đẩy phản ứng phân hủy cholesterol để hàm lượng chất này trong máu không kịp vượt quá định mức bình thường. Kiểm soát đầu vào, đẩy mạnh đầu ra, đâu còn biện pháp nào khéo hơn để chống tình trạng tồn kho?!\n\nCần nói thêm một điểm dễ quên. Không dùng thì thôi, đã dùng Actisô thì đừng dùng theo kiểu thỉnh thoảng một lần cho có vẻ người sành điệu. Muốn tận dụng công năng của Atisô phải dùng nhiều ngày liên tục, tối thiểu l tuần. Uống trà Atisô theo kiểu chỉ để dành để mời khách quý thì đừng lấy làm lạ nếu cả chủ lẫn khách có ngày phải khám bệnh … gan!\n\nTrên võ đài thường khi võ sĩ chỉ có thể chọn một trong hai chiến thuật, hoặc công, hoặc thủ. Với người muốn phòng bệnh gan lại khác. Không thể chỉ công hay thủ. Hai mặt giáp công sao cho đồng bộ chính là nguyên tắc quan trọng hàng đầu để yểm trợ lá gan. Đó chính là lý do khiến Actisô đã có mặt trong kho tàng kinh nghiệm của y học dân gian trên khắp năm châu.\n\nBác sĩ Lương Lễ Hoàng.\n\n&nbsp;\n\n<em>(Nguồn: Website Thuốc &amp; biệt dược)</em>', 'Atisô - Công và thủ', '', 'inherit', 'open', 'open', '', '83-revision', '', '', '2012-09-17 04:49:04', '2012-09-17 04:49:04', '', 83, 'http://localhost/trathonghong/83-revision/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(85, 1, '2012-09-17 05:01:21', '2012-09-17 05:01:21', 'Thuốc nào vừa công vừa thủ?\n\nNếu xét về mặt cơ chế dược lý, không dễ tìm được loại thuốc có tác dụng kép, vừa công phá bệnh nguyên, vừa bảo vệ tế bào trên cùng cơ quan nội tạng. Atisô lại là một trường hợp ngoại lệ.\n\n&nbsp;\n\nMuốn kể cho hết công lao của Atisô phải bắt đầu với tác dụng lợi mật. Dưới tác dụng của  Atisô mật chẳng những được bài tiết nhiều hơn trong gan mà còn thoát xuống túi mật nhanh hơn bình thường. Chất độc trong gan nhờ đó cũng bị kéo theo qua túi mật rồi xuống ruột non nên không có đủ thời giờ phá hoại lá gan. Nhờ đó mà gan hóa giải đủ loại độc tố, từ chất phụ gia trong thực phẩm công nghệ bước qua hóa chất trong nông nghiệp cho đến chất cồn trong rượu bia. Người phải làm việc trong môi trường ô nhiễm, kẻ khó từ chối ly rượu vì chuyện làm ăn, vẫn có thể góp phần chủ động bảo vệ lá gan nếu biết cách kết hợp  Atisô cho thường trong bữa cơm hàng ngày.\n\nKhông chỉ vì thế, tình trạng ứ mật trong gan là nguyên nhân  dẫn đến nhiều triệu chứng khó chịu như đầy hơi, sình bụng, tiêu chảy hay táo bón. Đó cũng là đòn bẩy cho sỏi túi mật. Nhưng vấn đề chưa dừng lại ở đó. Mật ứ lại trong gan sớm muộn cũng quay lại tấn công ngay cấu trúc của gan. Nhiều người ắt hẳn sẽ không xem thường tình trạng ứ mật trong gan nếu biết đó là hậu quả khó tránh của bệnh túi mật, viêm gan siêu vi, nghiện rượu, bệnh tuyến giáp, thai kỳ, cũng như do việc lạm dụng thuốc  kháng viêm, giảm đau, trị thấp khớp, ngừa thai, nội tiết tố, an thần, kháng sinh … Viêm gan do ứ mật đúng là bệnh thật đáng tiếc khi biện pháp phòng ngừa có khó gì đâu với chén trà hoặc cc sản phẩm chứa Atisô sau mỗi bữa cơm nhiều thịt mỡ.\n\nBên cạnh tác dụng lợi mật, Actisô còn là phương tiện hiệu quả để cải thiện tiêu hóa, chống biếng ăn và điều trị đau bụng trong “hội chứng đường ruột quá nhạy cảm”. Doanh nhân càng căng thẳng vì công việc càng nên nhớ đến Atisô, nếu muốn tránh cảnh đứng ngồi không yên! Với người cao tuổi, Atisô là vị thuốc nhuận trường lý tưởng, vì không chỉ vì hòa hõan về tác dụng mà do an toàn khi dùng lâu dài.\n\nĐừng tưởng Atisô chỉ có tác dụng trực tiếp trên đường tiêu hóa. Actisô còn có công năng hạ chất mỡ trong máu thông qua tác dụng “kép”. Một mặt, Actisô ức chế tiến trình tổng hợp cholesterol trong gan. Mặt khác, Actisô thúc đẩy phản ứng phân hủy cholesterol để hàm lượng chất này trong máu không kịp vượt quá định mức bình thường. Kiểm soát đầu vào, đẩy mạnh đầu ra, đâu còn biện pháp nào khéo hơn để chống tình trạng tồn kho?!\n\nCần nói thêm một điểm dễ quên. Không dùng thì thôi, đã dùng Actisô thì đừng dùng theo kiểu thỉnh thoảng một lần cho có vẻ người sành điệu. Muốn tận dụng công năng của Atisô phải dùng nhiều ngày liên tục, tối thiểu l tuần. Uống trà Atisô theo kiểu chỉ để dành để mời khách quý thì đừng lấy làm lạ nếu cả chủ lẫn khách có ngày phải khám bệnh … gan!\n\nTrên võ đài thường khi võ sĩ chỉ có thể chọn một trong hai chiến thuật, hoặc công, hoặc thủ. Với người muốn phòng bệnh gan lại khác. Không thể chỉ công hay thủ. Hai mặt giáp công sao cho đồng bộ chính là nguyên tắc quan trọng hàng đầu để yểm trợ lá gan. Đó chính là lý do khiến Actisô đã có mặt trong kho tàng kinh nghiệm của y học dân gian trên khắp năm châu.\n\nBác sĩ Lương Lễ Hoàng.\n\n<em>(Nguồn: Website Thuốc &amp; biệt dược)</em>', 'Atisô - Công và thủ', '', 'inherit', 'open', 'open', '', '83-autosave', '', '', '2012-09-17 05:01:21', '2012-09-17 05:01:21', '', 83, 'http://localhost/trathonghong/83-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(86, 1, '2012-09-17 05:26:34', '2012-09-17 05:26:34', '<ul>\r\n	<li><strong>Công dụng:</strong></li>\r\n</ul>\r\nGiúp mát gan, thông mật, lợi tiểu, tăng bài tiết mật, hỗ trợ giảm cholesterol máu và urê huyết.\r\n\r\nLà nước uống hàng ngày có lợi cho sức khỏe, đem lại cảm giác mát lạnh, sảng khoái và bổ dưỡng.\r\n\r\nChú ý: Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.\r\n<ul>\r\n	<li><strong>Thành phần:</strong></li>\r\n</ul>\r\n- Lá tươi Atisô, rễ Atisô, Hoa Hòe, Hoa Cúc, Kim Ngân Hoa, Cam Thảo, Nước, Đường.\r\n\r\n- Chất bảo quản: Natribenzoat (211).\r\n<ul>\r\n	<li><strong>Quy cách đóng gói:</strong></li>\r\n</ul>\r\n- Chai pet 350 ml.\r\n\r\n- Block: 6 chai.\r\n\r\n- Thùng carton: 24 chai/ thùng.', 'TRÀ ATISÔ THANH NHIỆT', '', 'publish', 'open', 'closed', '', 'tra-atiso-thanh-nhiet', '', '', '2012-09-17 05:42:11', '2012-09-17 05:42:11', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=86', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(87, 1, '2012-09-17 16:01:06', '2012-09-17 16:01:06', '<ul>\n	<li><strong>Công dụng:</strong></li>\n</ul>\nGiúp mát gan, thông mật, lợi tiểu, tăng bài tiết mật, hỗ trợ giảm cholesterol máu và urê huyết.\n\nLà nước uống hàng ngày có lợi cho sức khỏe, đem lại cảm giác mát lạnh, sảng khoái và bổ dưỡng.\n\nChú ý: Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.\n<ul>\n	<li><strong>Thành phần:</strong></li>\n</ul>\n- Lá tươi Atisô, rễ Atisô, Hoa Hòe, Hoa Cúc, Kim Ngân Hoa, Cam Thảo, Nước, Đường.\n\n- Chất bảo quản: Natribenzoat (211).\n<ul>\n	<li><strong>Quy cách đóng gói:</strong></li>\n</ul>\n- Chai pet 350 ml.\n\n- Block: 6 chai.\n\n- Thùng carton: 24 chai/ thùng.', 'TRÀ ATISÔ THANH NHIỆT', '', 'inherit', 'open', 'open', '', '86-autosave', '', '', '2012-09-17 16:01:06', '2012-09-17 16:01:06', '', 86, 'http://localhost/trathonghong/86-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(88, 1, '2012-09-17 05:30:42', '2012-09-17 05:30:42', '', 'Atis___Tea_One_4e1c137a00b5b', '', 'inherit', 'open', 'open', '', 'atis___tea_one_4e1c137a00b5b', '', '', '2012-09-17 05:30:42', '2012-09-17 05:30:42', '', 86, 'http://localhost/trathonghong/wp-content/uploads/2012/09/Atis___Tea_One_4e1c137a00b5b.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(89, 1, '2012-09-17 05:32:40', '2012-09-17 05:32:40', '<ul>\r\n	<li><strong>Công dụng:</strong></li>\r\n</ul>\r\n- Giúp dễ ngủ, mát gan, thông mật, lợi tiểu, hạ cholesterrol máu và urê huyết. Dùng cho người yếu gan, thận, cao huyết áp.\r\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\r\n<ul>\r\n	<li><strong>Thành phần:</strong></li>\r\n</ul>\r\n- Atisô (thân, rễ, hoa)\r\n- Cam Thảo\r\n- Hương hoa tự nhiên\r\n<ul>\r\n	<li><strong>Quy cách đóng gói:</strong></li>\r\n</ul>\r\n- Hộp: 20 gói túi lọc x 2 gram.\r\n- Block: 10 hộp.\r\n- Thùng carton: 100 hộp.', 'TRÀ ATISÔ HẠNG NHẤT (HỘP 20 GÓI)', '', 'publish', 'open', 'closed', '', 'tra-atiso-hang-nhat-hop-20-goi', '', '', '2012-09-17 05:41:45', '2012-09-17 05:41:45', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=89', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(90, 1, '2012-09-17 05:32:27', '2012-09-17 05:32:27', '', '2', '', 'inherit', 'open', 'open', '', '2', '', '', '2012-09-17 05:32:27', '2012-09-17 05:32:27', '', 89, 'http://localhost/trathonghong/wp-content/uploads/2012/09/2.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(91, 1, '2012-09-17 05:34:25', '2012-09-17 05:34:25', '<ul>\r\n	<li><strong>Công dụng:</strong></li>\r\n</ul>\r\n- Giúp dễ ngủ, mát gan, thông mật, lợi tiểu, hạ cholesterrol máu và urê huyết. Dùng cho người yếu gan, thận, cao huyết áp.\r\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\r\n<ul>\r\n	<li><strong>Thành phần:</strong></li>\r\n</ul>\r\n- Atisô (thân, rễ, hoa)\r\n- Cam Thảo\r\n- Hương hoa tự nhiên\r\n<ul>\r\n	<li><strong>Quy cách đóng gói:</strong></li>\r\n</ul>\r\n- Hộp: 50 gói túi lọc x 2 gram.\r\n- Block:\r\n- Thùng carton: 36 hộp.', 'TRÀ ATISÔ HẠNG NHẤT (HỘP 50 GÓI)', '', 'publish', 'open', 'closed', '', 'tra-atiso-hang-nhat-hop-50-goi', '', '', '2012-09-17 05:42:19', '2012-09-17 05:42:19', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=91', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(92, 1, '2012-09-17 05:34:20', '2012-09-17 05:34:20', '', '3', '', 'inherit', 'open', 'open', '', '3', '', '', '2012-09-17 05:34:20', '2012-09-17 05:34:20', '', 91, 'http://localhost/trathonghong/wp-content/uploads/2012/09/3.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(93, 1, '2012-09-17 05:36:12', '2012-09-17 05:36:12', '<ul>\r\n	<li><strong>Công dụng:</strong></li>\r\n</ul>\r\n- Giúp dễ ngủ, mát gan, thông mật, lợi tiểu, hạ cholesterrol máu và urê huyết. Dùng cho người yếu gan, thận, cao huyết áp.\r\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\r\n<ul>\r\n	<li><strong>Thành phần:</strong></li>\r\n</ul>\r\n- Atisô (thân, rễ, hoa)\r\n- Cam Thảo\r\n- Hương hoa tự nhiên\r\n<ul>\r\n	<li><strong>Quy cách đóng gói:</strong></li>\r\n</ul>\r\n- Túi: 100 gói túi lọc x 2 gram.\r\n- Block:\r\n- Thùng carton: 40 túi.', 'TRÀ ATISÔ HẠNG NHẤT (TÚI 100 GÓI)', '', 'publish', 'open', 'closed', '', 'tra-atiso-hang-nhat-tui-100-goi', '', '', '2012-09-17 05:41:31', '2012-09-17 05:41:31', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=93', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(94, 1, '2012-09-17 05:36:28', '2012-09-17 05:36:28', '', 'Tr___Atis___h____4d1c51d755d2a', '', 'inherit', 'open', 'open', '', 'tr___atis___h____4d1c51d755d2a', '', '', '2012-09-17 05:36:28', '2012-09-17 05:36:28', '', 93, 'http://localhost/trathonghong/wp-content/uploads/2012/09/Tr___Atis___h____4d1c51d755d2a.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(95, 1, '2012-09-17 05:37:34', '2012-09-17 05:37:34', '<ul>\n	<li><strong>Công dụng:</strong></li>\n</ul>\n- Giúp dễ ngủ, mát gan, thông mật, lợi tiểu, hạ cholesterrol máu và urê huyết. Dùng cho người yếu gan, thận, cao huyết áp.\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\n<ul>\n	<li><strong>Thành phần:</strong></li>\n</ul>\n- Atisô (thân, rễ, hoa)\n- Cam Thảo\n- Hương hoa tự nhiên\n<ul>\n	<li><strong>Quy cách đóng gói:</strong></li>\n</ul>\n- Túi: 100 gói túi lọc x 2 gram.\n- Block:\n- Thùng carton: 40 túi.', 'TRÀ ATISÔ HẠNG NHẤT (TÚI 100 GÓI)', '', 'inherit', 'open', 'open', '', '93-autosave', '', '', '2012-09-17 05:37:34', '2012-09-17 05:37:34', '', 93, 'http://localhost/trathonghong/93-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(96, 1, '2012-09-17 05:38:47', '2012-09-17 05:38:47', '<ul>\r\n	<li><strong>Công dụng:</strong></li>\r\n</ul>\r\n- Giúp dễ ngủ, mát gan, thông mật, lợi tiểu, hạ cholesterrol máu và urê huyết. Dùng cho người yếu gan, thận, cao huyết áp.\r\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\r\n<ul>\r\n	<li><strong>Thành phần:</strong></li>\r\n</ul>\r\n- Atisô (thân, rễ, hoa)\r\n- Cam Thảo\r\n- Hương hoa tự nhiên\r\n<ul>\r\n	<li><strong>Quy cách đóng gói:</strong></li>\r\n</ul>\r\n- Hộp: 100 gói túi lọc x 2 gram.\r\n- Block:\r\n- Thùng carton: 32 hộp.', 'TRÀ ATISÔ ĐẶC SẢN (HỘP 100 GÓI)', '', 'publish', 'open', 'closed', '', 'tra-atiso-dac-san-hop-100-goi', '', '', '2012-09-17 05:41:21', '2012-09-17 05:41:21', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=96', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(97, 1, '2012-09-17 05:38:28', '2012-09-17 05:38:28', '', '4', '', 'inherit', 'open', 'open', '', '4', '', '', '2012-09-17 05:38:28', '2012-09-17 05:38:28', '', 96, 'http://localhost/trathonghong/wp-content/uploads/2012/09/4.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(98, 1, '2012-09-17 15:58:57', '2012-09-17 15:58:57', '<ul>\n	<li><strong>Công dụng:</strong></li>\n</ul>\n- Giúp dễ ngủ, mát gan, thông mật, lợi tiểu, hạ cholesterrol máu và urê huyết. Dùng cho người yếu gan, thận, cao huyết áp.\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\n<ul>\n	<li><strong>Thành phần:</strong></li>\n</ul>\n- Atisô (thân, rễ, hoa)\n- Cam Thảo\n- Hương hoa tự nhiên\n<ul>\n	<li><strong>Quy cách đóng gói:</strong></li>\n</ul>\n- Hộp: 100 gói túi lọc x 2 gram.\n- Block:\n- Thùng carton: 32 hộp.', 'TRÀ ATISÔ ĐẶC SẢN (HỘP 100 GÓI)', '', 'inherit', 'open', 'open', '', '96-autosave', '', '', '2012-09-17 15:58:57', '2012-09-17 15:58:57', '', 96, 'http://localhost/trathonghong/96-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(99, 1, '2012-09-17 05:40:44', '2012-09-17 05:40:44', '<ul>\r\n	<li><strong>Công dụng:</strong></li>\r\n</ul>\r\n- Giúp bổ huyết, khỏe gân cốt, làm đen tóc. Dùng cho người tóc bạc sớm, đau mỏi lưng gối, khí huyết kém, thần kinh suy nhược.\r\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\r\n<ul>\r\n	<li><strong>Thành phần:</strong></li>\r\n</ul>\r\nHà Thủ Ô miếng sấy khô: 100%\r\n<ul>\r\n	<li><strong>Quy cách đóng gói:</strong></li>\r\n</ul>\r\n- Túi: 500 gram.\r\n- Block:\r\n- Thùng carton', 'HÀ THỦ Ô LÁT (TÚI 500 GRAM)', '', 'publish', 'open', 'closed', '', 'ha-thu-o-lat-tui-500-gram', '', '', '2012-09-17 06:09:41', '2012-09-17 06:09:41', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=99', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(100, 1, '2012-09-17 05:40:40', '2012-09-17 05:40:40', '', '5', '', 'inherit', 'open', 'open', '', '5', '', '', '2012-09-17 05:40:40', '2012-09-17 05:40:40', '', 99, 'http://localhost/trathonghong/wp-content/uploads/2012/09/5.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(101, 1, '2012-09-17 05:46:15', '2012-09-17 05:46:15', '<ul>\r\n	<li><strong>Công dụng:</strong></li>\r\n</ul>\r\n- Giúp giải nhiệt, lợi tiểu, lợi mật, giảm đường huyết, phòng ngừa tiểu đường. Dùng cho người bị bệnh tiểu đường, mỡ máu.\r\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\r\n<ul>\r\n	<li><strong>Thành phần:</strong></li>\r\n</ul>\r\nKhổ qua (Mướp đắng) lát sấy khô: 100%\r\n<ul>\r\n	<li><strong>Quy cách đóng gói:</strong></li>\r\n</ul>\r\n- Túi: 80 gram.\r\n- Block:\r\n- Thùng carton: 100 túi.', 'KHỔ QUA LÁT (TÚI 80 GRAM)', '', 'publish', 'open', 'closed', '', 'kho-qua-lat-tui-80-gram', '', '', '2012-09-17 05:50:08', '2012-09-17 05:50:08', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=101', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(102, 1, '2012-09-17 05:46:00', '2012-09-17 05:46:00', '', '6', '', 'inherit', 'open', 'open', '', '6', '', '', '2012-09-17 05:46:00', '2012-09-17 05:46:00', '', 101, 'http://localhost/trathonghong/wp-content/uploads/2012/09/6.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(103, 1, '2012-09-17 05:47:50', '2012-09-17 05:47:50', '<ul>\r\n	<li><strong>Công dụng:</strong></li>\r\n</ul>\r\n- Có tác dụng điều hòa tim mạch, hạ cholesterrol máu, gúp tăng cường miễn dịch, cải thiện trí nhớ, an thần.\r\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\r\n<ul>\r\n	<li><strong>Thành phần:</strong></li>\r\n</ul>\r\nNấm Linh Chi khô: 100%\r\n<ul>\r\n	<li><strong>Quy cách đóng gói:</strong></li>\r\n</ul>\r\n- Túi: 200 gram.\r\n- Block:\r\n- Thùng carton', 'NẤM LINH CHI KHÔ (TÚI 200 GRAM)', '', 'publish', 'open', 'closed', '', 'nam-linh-chi-kho-tui-200-gram', '', '', '2012-09-17 06:09:23', '2012-09-17 06:09:23', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=103', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(104, 1, '2012-09-17 05:47:46', '2012-09-17 05:47:46', '', '7', '', 'inherit', 'open', 'open', '', '7', '', '', '2012-09-17 05:47:46', '2012-09-17 05:47:46', '', 103, 'http://localhost/trathonghong/wp-content/uploads/2012/09/7.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(105, 1, '2012-09-17 05:49:10', '2012-09-17 05:49:10', '<ul>\r\n	<li><strong>Công dụng:</strong></li>\r\n</ul>\r\n- Có tác dụng điều hòa tim mạch, hạ cholesterrol máu, gúp tăng cường miễn dịch, cải thiện trí nhớ, an thần.\r\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\r\n<ul>\r\n	<li><strong>Thành phần:</strong></li>\r\n</ul>\r\nNấm Linh Chi khô: 100%\r\n<ul>\r\n	<li><strong>Quy cách đóng gói:</strong></li>\r\n</ul>\r\n- Túi: 500 gram.\r\n- Block:\r\n- Thùng carton', 'NẤM LINH CHI KHÔ (TÚI 500 GRAM)', '', 'publish', 'open', 'closed', '', 'nam-linh-chi-kho-tui-500-gram', '', '', '2012-09-17 06:09:17', '2012-09-17 06:09:17', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=105', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(106, 1, '2012-09-17 05:48:51', '2012-09-17 05:48:51', '', '7', '', 'inherit', 'open', 'open', '', '7-2', '', '', '2012-09-17 05:48:51', '2012-09-17 05:48:51', '', 105, 'http://localhost/trathonghong/wp-content/uploads/2012/09/71.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(107, 1, '2012-09-17 05:51:23', '2012-09-17 05:51:23', 'Nước cốt Chanh Dây nguyên chất được chiết xuất từ trái Chanh Dây tươi Đà Lạt - Đây là sản phẩm giàu dưỡng chất thiên nhiên, là thức uống giải khát rất có lợi cho sức khỏe - Đặc biệt trợ tim mạch, tăng cường sức đề kháng.\r\n<ul id="idTab2">\r\n	<li>Thể tích: 500ml / 16.907 fl oz</li>\r\n	<li>Thùng carton: 6 chai</li>\r\n	<li>Trọng lượng: 1kg/chai</li>\r\n</ul>', 'NƯỚC CỐT CHANH DÂY', '', 'publish', 'open', 'closed', '', 'nuoc-cot-chanh-day', '', '', '2012-09-17 05:52:36', '2012-09-17 05:52:36', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=107', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(108, 1, '2012-09-17 05:52:31', '2012-09-17 05:52:31', '', '8', '', 'inherit', 'open', 'open', '', '8', '', '', '2012-09-17 05:52:31', '2012-09-17 05:52:31', '', 107, 'http://localhost/trathonghong/wp-content/uploads/2012/09/8.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(109, 1, '2012-09-17 05:54:10', '2012-09-17 05:54:10', 'Được chế biến từ trái dâu tằm vừa chín được tuyển lựa kỹ càng, kết hợp phương pháp truyền thống với hiện đại giữ được hương vị tự nhiên, tinh khiết - Là thức uống giải khát rất tốt cho sức khỏe, dùng thường xuyên giúp giảm đau lưng, nhức mỏi, thấp khớp, kích thích tiêu hóa.\r\n<ul id="idTab2">\r\n	<li>Thùng carton: 6 chai</li>\r\n	<li>Thể tích: 500ml / 16.907 fl oz</li>\r\n	<li>Trọng lượng: 6kg</li>\r\n</ul>', 'NƯỚC CỐT DÂU TẰM', '', 'publish', 'open', 'closed', '', 'nuoc-cot-dau-tam', '', '', '2012-09-17 06:08:46', '2012-09-17 06:08:46', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=109', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(110, 1, '2012-09-17 05:53:55', '2012-09-17 05:53:55', '', '9', '', 'inherit', 'open', 'open', '', '9', '', '', '2012-09-17 05:53:55', '2012-09-17 05:53:55', '', 109, 'http://localhost/trathonghong/wp-content/uploads/2012/09/9.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(111, 1, '2012-09-17 05:55:03', '2012-09-17 05:55:03', 'Được chế biến từ trái Dâu Tây vừa chín được tuyển lựa kỹ càng, kết hợp phương pháp truyền thống với hiện đại giữ được hương vị tự nhiên, tinh khiết - Là thức uống giải khát rất tốt cho sức khỏe, dùng thường xuyên giúp giảm đau lưng, nhức mỏi, thấp khớp, kích thích tiêu hóa.\r\n<ul id="idTab2">\r\n	<li>Thùng carton: 24 chai</li>\r\n	<li>Thể tích: 500ml</li>\r\n	<li>Trọng lượng: 14kg</li>\r\n</ul>', 'NƯỚC CỐT DÂU TÂY', '', 'publish', 'open', 'closed', '', 'nuoc-cot-dau-tay', '', '', '2012-09-17 06:08:34', '2012-09-17 06:08:34', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=111', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(112, 1, '2012-09-17 05:55:31', '2012-09-17 05:55:31', '', '10', '', 'inherit', 'open', 'open', '', '10', '', '', '2012-09-17 05:55:31', '2012-09-17 05:55:31', '', 111, 'http://localhost/trathonghong/wp-content/uploads/2012/09/10.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(113, 1, '2012-09-17 05:58:33', '2012-09-17 05:58:33', '<strong>Nươc cốt trái nhàu - Pure Noni Juice: điêu hòa lượng đường trong máu, tăng cường hệ thống miễn dịch </strong><strong>giúp ổ</strong><strong>n định sức khỏe người cao tuổi.</strong>\r\n\r\nSở lược về cây nhàu và nước cốt trái nhàu:<em>Trên quần đảo Polynesia của Pháp, người ta gọi trái nhàu là “quả thần kì” và nó trở thành một vị thuốc tự nhiên được sử dụng trong truyền thống. Người dân ở đảo Tahiti vùng Nam Thái Bình Dương xưng tụng là “Lễ vật trời ban”. Cuối thế kỉ XX, trái nhàu được biết đến như là một báu vật bảo vệ sức khoẻ cho con người.</em>\r\n\r\nNước cốt Trái nhàu của Công ty TNHH Vĩnh Tiến được chế biến từ trái nhàu vừa chín được tuyển lựa kỹ càng, kết hợp phương pháp truyền thống với máy móc hiện đại để giữ được hương vị tự nhiên, tinh khiết. Đây là thức uống giải khát rất tốt cho sức khỏe, dùng thường xuyên giúp điều hòa lượng đường trong máu cho người bị tiểu đường, điều hòa huyết áp cho người bị huyết áp cao, nhuận tràng, trợ tiêu hóa, ngừa đau nhức, thấp khớp, ho cảm, làm đẹp da và tăng cường hệ miễn dịch cơ thể. Sản phẩm này đã và đang được xuất khẩu sang Mỹ và Hàn Quốc và được người Mỹ và Hàn Quốc tin dùng.\r\n\r\nThùng carton: 12 chai\r\n\r\nThể tích: 1 lít\r\n\r\nSản phẩm được cấp giấy chưng nhận an toàn thực phẩm số 7789/2010/YT-CNTN của Cục an toàn vệ sinh thưc phẩm, Bộ y tế cấp ngày 16/7/2010.', 'NƯỚC CỐT TRÁI NHÀU', '', 'publish', 'open', 'closed', '', 'nuoc-cot-trai-nhau', '', '', '2012-09-17 05:58:40', '2012-09-17 05:58:40', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=113', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(114, 1, '2012-09-17 05:58:26', '2012-09-17 05:58:26', '', '11', '', 'inherit', 'open', 'open', '', '11', '', '', '2012-09-17 05:58:26', '2012-09-17 05:58:26', '', 113, 'http://localhost/trathonghong/wp-content/uploads/2012/09/11.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(115, 1, '2012-09-17 06:00:28', '2012-09-17 06:00:28', 'Là thức uống giải khát rất tốt cho sức khỏe, dùng thường xuyên giúp điều hòa tim mạch, kích thích tiêu hóa, an thần, dễ ngủ - Là thức uống không thể thiếu trong những bữa tiệc sang trọng.\r\nVang Demi-Sec: Với nồng độ, hương thơm nhẹ nhàng, quý phái, đặc biệt thích hợp cho phái nữ.\r\n<ul id="idTab2">\r\n	<li>Hộp quà: 2</li>\r\n	<li>Thùng carton: 6 chai</li>\r\n	<li>% Alcohol of Volume: 11% of Vol.</li>\r\n	<li>Thể tích: 750ml / 25.361 fl oz</li>\r\n	<li>Trọng lượng: 1kg/chai</li>\r\n</ul>', 'RƯỢU VANG DEMI SEC', '', 'publish', 'open', 'closed', '', 'ruou-vang-demi-sec', '', '', '2012-09-17 06:00:59', '2012-09-17 06:00:59', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=115', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(116, 1, '2012-09-17 06:00:12', '2012-09-17 06:00:12', '', '12', '', 'inherit', 'open', 'open', '', '12', '', '', '2012-09-17 06:00:12', '2012-09-17 06:00:12', '', 115, 'http://localhost/trathonghong/wp-content/uploads/2012/09/12.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(117, 1, '2012-09-17 06:02:26', '2012-09-17 06:02:26', 'Là thức uống giải khát rất tốt cho sức khỏe, dùng thường xuyên giúp điều hòa tim mạch, kích thích tiêu hóa, an thần, dễ ngủ - Là thức uống không thể thiếu trong những bữa tiệc sang trọng.\r\n- Thích hợp dùng kèm với các món ăn chế biến từ thịt (thịt nướng, thịt hun khói...)\r\n<div>\r\n<ul>\r\n	<li>Thể tích: 3 Litters</li>\r\n	<li>% Alcohol of Volume: 11.5% of Vol.</li>\r\n	<li>Trọng lượng: 4kg/thùng</li>\r\n</ul>\r\n</div>\r\n<strong>9 tác dụng tuyệt vời của rượu vang với sức khỏe</strong>\r\n\r\nCác nhà khoa học cho rằng, sử dụng rượu vang đỏ ở mức độ vừa phải sẽ mang lại nhiều lợi ích cho sức khỏe.\r\nSau đây là những lý do thiết thực để bạn không bỏ qua loại thức uống có ích này.\r\n\r\n<strong>1. Ngủ ngon hơn</strong>\r\n\r\nMột nghiên cứu khoa học gần đây cho thấy, các loại rượu vang đỏ như Cabernet Sauvignon, Chianti và Merlot có chứa các chất melatonin điều hòa đồng hồ sinh học của cơ thể hay chu kì ngủ - thức. Vì thế, uống một ly rượu vang trước khi đi ngủ sẽ làm bạn ngủ ngon giấc. Melatonin cũng là một chất chống ôxy hóa nên nó chống lại sự lão hóa và ngăn chặn các yếu tố gây bệnh ung thư.\r\n\r\n<strong>2. Kéo dài tuổi thọ</strong>\r\n\r\nMột hợp chất có trong rượu vang đỏ được gọi là resveratro có khả năng làm tăng tối đa tuổi thọ. Resveratro còn có khả năng ngăn chặn mật độ ôxy hoá của protein béo. Nó có thể ngăn chặn sự ngưng tụ bất thường của máu, mở rộng động mạch, huyết quản, cải thiện tuần hoàn, có khả năng phòng tránh bệnh tim, bệnh xơ cứng động mạch, bệnh mỡ máu cao.\r\n\r\nNgoài ra, nó còn có tác dụng kháng khuẩn, chống ôxy hoá, xoá bỏ cơ tự do, kháng chứng nghẽn mạch máu, kháng viêm nhiễm, chống dị ứng …\r\n\r\n<strong>3. Tăng cường trí tuệ</strong>\r\n\r\nResveratrol trong rượu vang đỏ có thể bảo vệ não bộ chống lại bệnh Alzheimer (bệnh sa sút trí tuệ) và chứng mất trí nhớ.\r\n\r\n<strong>4. Giúp tim khỏe mạnh</strong>\r\n\r\nRượu đỏ có khả năng giảm thiểu nguy cơ bệnh suy tim vì nó chứa chất resveratrol và các chất chống ôxy hóa khác.\r\n\r\n<strong>5. Giảm thiểu bệnh ung thư phổi</strong>\r\n\r\nCác nhà nghiên cứu của trường đại học Santiago de Compostela ở Tây Ban Nha cho biết, chỉ cần uống 1 ly rượu vang đỏ mỗi ngày sẽ làm giảm nguy cơ mắc bệnh ung thư phổi xuống 13%.\r\n\r\n<strong>6. Giảm thiểu bệnh ung thư tuyến tiền liệt</strong>\r\n\r\nViệc sử dụng từ 4 ly rượu vang đỏ hoặc nhiều hơn trong một tuần sẽ làm giảm thiểu nguy cơ mắc bệnh ung thư tuyến tiền liệt ở đàn ông tới 50%, và các dạng biến chứng nguy hiểm khác của bệnh ung thư tuyến tiền liệt tới 60%.\r\n\r\n<strong>7. Giảm thiểu bệnh ung thư vú</strong>\r\n\r\nSử dụng rượu vang đỏ ở mức độ vừa phải sẽ giảm thiểu nguy cơ mắc bệnh ung thư vú. Tuy nhiên, nếu uống quá nhiều thức uống có cồn mỗi ngày sẽ làm tăng nguy cơ mắc bệnh ung thư vú. Vì thế, bạn chỉ nên uống những loại thức uống này với liều lượng vừa phải.\r\n\r\n<strong>8. Phòng chống bệnh cảm lạnh</strong>\r\n\r\nCác nhà nghiên cứu khoa học Tây Ban Nha cho biết những người uống 2 ly rượu vang đỏ mỗi tuần sẽ ít mắc bệnh cảm lạnh hơn 44% so với những người không uống loại thức uống này.\r\n\r\n<strong>9. Chống viêm nhiễm</strong>\r\n\r\nChất resveratrol trong rượu vang đỏ có khả năng chống lại các yếu tố gây viêm nhiễm giúp cho cơ thể chống lại các bệnh khác có thể mắc phải.10. Giảm cholesterol\r\n\r\nRượu vang đỏ chứa chất resveratrol có thể làm giảm thấp lượng cholesterol LDL xấu (gây tắc nghẽn mạch máu và đột quỵ). Trong khi đó, các thành phần hóa học khác trong rượu vang đỏ như saponin cũng có thể làm giảm những đặc tính có hại của cholesterol.', 'RƯỢU VANG MIMOSA (HỘP 3 LÍT) 11,5%', '', 'publish', 'open', 'closed', '', 'ruou-vang-mimosa-hop-3-lit-115-vinh-tien-da-la', '', '', '2012-09-17 06:02:34', '2012-09-17 06:02:34', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=117', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(118, 1, '2012-09-17 06:02:07', '2012-09-17 06:02:07', '', '13', '', 'inherit', 'open', 'open', '', '13', '', '', '2012-09-17 06:02:07', '2012-09-17 06:02:07', '', 117, 'http://localhost/trathonghong/wp-content/uploads/2012/09/13.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(119, 1, '2012-09-17 06:04:25', '2012-09-17 06:04:25', 'Là thức uống giải khát rất tốt cho sức khỏe, dùng thường xuyên giúp điều hòa tim mạch, kích thích tiêu hóa, an thần, dễ ngủ - Là thức uống không thể thiếu trong những bữa tiệc sang trọng.\r\n- Thích hợp dùng kèm với các món ăn chế biến từ thịt (thịt nướng, thịt hun khói...)\r\n<div>\r\n<ul>\r\n	<li>Hộp quà: 2</li>\r\n	<li>Thùng carton: 6 chai</li>\r\n	<li>% Alcohol of Volume: 11.5% of Vol.</li>\r\n	<li>Thể tích: 750ml / 25.361 fl oz</li>\r\n	<li>Trọng lượng: 1kg/chai</li>\r\n</ul>\r\n</div>\r\n<strong>9 tác dụng tuyệt vời của rượu vang với sức khỏe</strong>\r\n\r\nCác nhà khoa học cho rằng, sử dụng rượu vang đỏ ở mức độ vừa phải sẽ mang lại nhiều lợi ích cho sức khỏe.\r\nSau đây là những lý do thiết thực để bạn không bỏ qua loại thức uống có ích này.\r\n\r\n<strong>1. Ngủ ngon hơn</strong>\r\n\r\nMột nghiên cứu khoa học gần đây cho thấy, các loại rượu vang đỏ như Cabernet Sauvignon, Chianti và Merlot có chứa các chất melatonin điều hòa đồng hồ sinh học của cơ thể hay chu kì ngủ - thức. Vì thế, uống một ly rượu vang trước khi đi ngủ sẽ làm bạn ngủ ngon giấc. Melatonin cũng là một chất chống ôxy hóa nên nó chống lại sự lão hóa và ngăn chặn các yếu tố gây bệnh ung thư.\r\n\r\n<strong>2. Kéo dài tuổi thọ</strong>\r\n\r\nMột hợp chất có trong rượu vang đỏ được gọi là resveratro có khả năng làm tăng tối đa tuổi thọ. Resveratro còn có khả năng ngăn chặn mật độ ôxy hoá của protein béo. Nó có thể ngăn chặn sự ngưng tụ bất thường của máu, mở rộng động mạch, huyết quản, cải thiện tuần hoàn, có khả năng phòng tránh bệnh tim, bệnh xơ cứng động mạch, bệnh mỡ máu cao.\r\n\r\nNgoài ra, nó còn có tác dụng kháng khuẩn, chống ôxy hoá, xoá bỏ cơ tự do, kháng chứng nghẽn mạch máu, kháng viêm nhiễm, chống dị ứng …\r\n\r\n<strong>3. Tăng cường trí tuệ</strong>\r\n\r\nResveratrol trong rượu vang đỏ có thể bảo vệ não bộ chống lại bệnh Alzheimer (bệnh sa sút trí tuệ) và chứng mất trí nhớ.\r\n\r\n<strong>4. Giúp tim khỏe mạnh</strong>\r\n\r\nRượu đỏ có khả năng giảm thiểu nguy cơ bệnh suy tim vì nó chứa chất resveratrol và các chất chống ôxy hóa khác.\r\n\r\n<strong>5. Giảm thiểu bệnh ung thư phổi</strong>\r\n\r\nCác nhà nghiên cứu của trường đại học Santiago de Compostela ở Tây Ban Nha cho biết, chỉ cần uống 1 ly rượu vang đỏ mỗi ngày sẽ làm giảm nguy cơ mắc bệnh ung thư phổi xuống 13%.\r\n\r\n<strong>6. Giảm thiểu bệnh ung thư tuyến tiền liệt</strong>\r\n\r\nViệc sử dụng từ 4 ly rượu vang đỏ hoặc nhiều hơn trong một tuần sẽ làm giảm thiểu nguy cơ mắc bệnh ung thư tuyến tiền liệt ở đàn ông tới 50%, và các dạng biến chứng nguy hiểm khác của bệnh ung thư tuyến tiền liệt tới 60%.\r\n\r\n<strong>7. Giảm thiểu bệnh ung thư vú</strong>\r\n\r\nSử dụng rượu vang đỏ ở mức độ vừa phải sẽ giảm thiểu nguy cơ mắc bệnh ung thư vú. Tuy nhiên, nếu uống quá nhiều thức uống có cồn mỗi ngày sẽ làm tăng nguy cơ mắc bệnh ung thư vú. Vì thế, bạn chỉ nên uống những loại thức uống này với liều lượng vừa phải.\r\n\r\n<strong>8. Phòng chống bệnh cảm lạnh</strong>\r\n\r\nCác nhà nghiên cứu khoa học Tây Ban Nha cho biết những người uống 2 ly rượu vang đỏ mỗi tuần sẽ ít mắc bệnh cảm lạnh hơn 44% so với những người không uống loại thức uống này.\r\n\r\n<strong>9. Chống viêm nhiễm</strong>\r\n\r\nChất resveratrol trong rượu vang đỏ có khả năng chống lại các yếu tố gây viêm nhiễm giúp cho cơ thể chống lại các bệnh khác có thể mắc phải.10. Giảm cholesterol\r\n\r\nRượu vang đỏ chứa chất resveratrol có thể làm giảm thấp lượng cholesterol LDL xấu (gây tắc nghẽn mạch máu và đột quỵ). Trong khi đó, các thành phần hóa học khác trong rượu vang đỏ như saponin cũng có thể làm giảm những đặc tính có hại của cholesterol.', 'RƯỢU VANG NHO LÀM TỪ NHO ĐỎ 11,5%', '', 'publish', 'open', 'closed', '', 'ruou-vang-nho-lam-tu-nho-do-115', '', '', '2012-09-17 06:04:30', '2012-09-17 06:04:30', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=119', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(120, 1, '2012-09-17 06:03:46', '2012-09-17 06:03:46', '', '14', '', 'inherit', 'open', 'open', '', '14-2', '', '', '2012-09-17 06:03:46', '2012-09-17 06:03:46', '', 119, 'http://localhost/trathonghong/wp-content/uploads/2012/09/14.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(121, 1, '2012-09-17 06:06:00', '2012-09-17 06:06:00', 'Là thức uống giải khát rất tốt cho sức khỏe, dùng thường xuyên giúp điều hòa tim mạch, kích thích tiêu hóa, an thần, dễ ngủ - Là thức uống không thể thiếu trong những bữa tiệc sang trọng.\r\n<div>\r\n<ul>\r\n	<li>Thể tích: 750 ml.</li>\r\n	<li>% Alcohol of Volume: 12% of Vol.</li>\r\n	<li>Đóng gói: 06 chai/ thùng</li>\r\n	<li>Trọng lượng:</li>\r\n</ul>\r\n</div>\r\n<strong>9 tác dụng tuyệt vời của rượu vang với sức khỏe</strong>\r\n\r\nCác nhà khoa học cho rằng, sử dụng rượu vang đỏ ở mức độ vừa phải sẽ mang lại nhiều lợi ích cho sức khỏe.\r\nSau đây là những lý do thiết thực để bạn không bỏ qua loại thức uống có ích này.\r\n\r\n<strong>1. Ngủ ngon hơn</strong>\r\n\r\nMột nghiên cứu khoa học gần đây cho thấy, các loại rượu vang đỏ như Cabernet Sauvignon, Chianti và Merlot có chứa các chất melatonin điều hòa đồng hồ sinh học của cơ thể hay chu kì ngủ - thức. Vì thế, uống một ly rượu vang trước khi đi ngủ sẽ làm bạn ngủ ngon giấc. Melatonin cũng là một chất chống ôxy hóa nên nó chống lại sự lão hóa và ngăn chặn các yếu tố gây bệnh ung thư.\r\n\r\n<strong>2. Kéo dài tuổi thọ</strong>\r\n\r\nMột hợp chất có trong rượu vang đỏ được gọi là resveratro có khả năng làm tăng tối đa tuổi thọ. Resveratro còn có khả năng ngăn chặn mật độ ôxy hoá của protein béo. Nó có thể ngăn chặn sự ngưng tụ bất thường của máu, mở rộng động mạch, huyết quản, cải thiện tuần hoàn, có khả năng phòng tránh bệnh tim, bệnh xơ cứng động mạch, bệnh mỡ máu cao.\r\n\r\nNgoài ra, nó còn có tác dụng kháng khuẩn, chống ôxy hoá, xoá bỏ cơ tự do, kháng chứng nghẽn mạch máu, kháng viêm nhiễm, chống dị ứng …\r\n\r\n<strong>3. Tăng cường trí tuệ</strong>\r\n\r\nResveratrol trong rượu vang đỏ có thể bảo vệ não bộ chống lại bệnh Alzheimer (bệnh sa sút trí tuệ) và chứng mất trí nhớ.\r\n\r\n<strong>4. Giúp tim khỏe mạnh</strong>\r\n\r\nRượu đỏ có khả năng giảm thiểu nguy cơ bệnh suy tim vì nó chứa chất resveratrol và các chất chống ôxy hóa khác.\r\n\r\n<strong>5. Giảm thiểu bệnh ung thư phổi</strong>\r\n\r\nCác nhà nghiên cứu của trường đại học Santiago de Compostela ở Tây Ban Nha cho biết, chỉ cần uống 1 ly rượu vang đỏ mỗi ngày sẽ làm giảm nguy cơ mắc bệnh ung thư phổi xuống 13%.\r\n\r\n<strong>6. Giảm thiểu bệnh ung thư tuyến tiền liệt</strong>\r\n\r\nViệc sử dụng từ 4 ly rượu vang đỏ hoặc nhiều hơn trong một tuần sẽ làm giảm thiểu nguy cơ mắc bệnh ung thư tuyến tiền liệt ở đàn ông tới 50%, và các dạng biến chứng nguy hiểm khác của bệnh ung thư tuyến tiền liệt tới 60%.\r\n\r\n<strong>7. Giảm thiểu bệnh ung thư vú</strong>\r\n\r\nSử dụng rượu vang đỏ ở mức độ vừa phải sẽ giảm thiểu nguy cơ mắc bệnh ung thư vú. Tuy nhiên, nếu uống quá nhiều thức uống có cồn mỗi ngày sẽ làm tăng nguy cơ mắc bệnh ung thư vú. Vì thế, bạn chỉ nên uống những loại thức uống này với liều lượng vừa phải.\r\n\r\n<strong>8. Phòng chống bệnh cảm lạnh</strong>\r\n\r\nCác nhà nghiên cứu khoa học Tây Ban Nha cho biết những người uống 2 ly rượu vang đỏ mỗi tuần sẽ ít mắc bệnh cảm lạnh hơn 44% so với những người không uống loại thức uống này.\r\n\r\n<strong>9. Chống viêm nhiễm</strong>\r\n\r\nChất resveratrol trong rượu vang đỏ có khả năng chống lại các yếu tố gây viêm nhiễm giúp cho cơ thể chống lại các bệnh khác có thể mắc phải.10. Giảm cholesterol\r\n\r\nRượu vang đỏ chứa chất resveratrol có thể làm giảm thấp lượng cholesterol LDL xấu (gây tắc nghẽn mạch máu và đột quỵ). Trong khi đó, các thành phần hóa học khác trong rượu vang đỏ như saponin cũng có thể làm giảm những đặc tính có hại của cholesterol.', 'RƯỢU VANG SAUVIGNON BLANC 12%', '', 'publish', 'open', 'closed', '', 'ruou-vang-sauvignon-blanc-12', '', '', '2012-09-17 06:06:15', '2012-09-17 06:06:15', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=121', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(122, 1, '2012-09-17 06:05:45', '2012-09-17 06:05:45', '', '15', '', 'inherit', 'open', 'open', '', '15-2', '', '', '2012-09-17 06:05:45', '2012-09-17 06:05:45', '', 121, 'http://localhost/trathonghong/wp-content/uploads/2012/09/15.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(123, 1, '2012-09-17 06:07:57', '2012-09-17 06:07:57', 'Là thức uống giải khát rất tốt cho sức khỏe, dùng thường xuyên giúp điều hòa tim mạch, kích thích tiêu hóa, an thần, dễ ngủ - Là thức uống không thể thiếu trong những bữa tiệc sang trọng.\r\n<div>\r\n<ul id="idTab2">\r\n	<li>Thể tích: 750 ml.</li>\r\n	<li>% Alcohol of Volume: 12.5% of Vol.</li>\r\n	<li>Đóng gói: 06 chai/ thùng</li>\r\n	<li>Trọng lượng:</li>\r\n</ul>\r\n</div>\r\n&nbsp;\r\n\r\nXin liên hệ với công ty nếu bạn muốn chở thành Đại Lý của cty Vĩnh Tiến\r\n\r\nĐiểm mạnh của vang Syrah:\r\n\r\nĐây là dòng vang mạnh cao cấp nhất của Vĩnh Tiến. Màu sắc rượu vang Syrah tươi sáng, sắc thái của rượu phụ thuộc nhiều vào tuổi rượu, rượu trẻ thường có màu sẫm xen lẫn tím violet nhẹ hoặc màu đỏ thắm. Khi rượu già, màu của nó sẽ chuyển sang màu ruby, sơri hoặc đỏ của ngọc hồng lựu.\r\nHương vị của Syrah thơm nồng đượm. Để thưởng thức trọn vẹn hương vị ấy,  đầu tiên bạn hãy ngửi vang Syrah khi còn trong ly, sau đó lắc rượu lên để rượu cuộn vào không khí nhằm khơi dậy đầy đủ hương vị của nó trước khi nếm thử. Hãy nhấp một ngụm nhỏ, dùng lưỡi di chuyển sao cho rượu có thể tiếp xúc đến mọi bề mặt trong vòm miệng của bạn, rồi từ từ hớp một chút không khí vào để cảm nhận đầy đủ hương vị của rượu. Bạn sẽ cảm nhận sự êm dịu, tinh tế của Syrah khi đi từ lưỡi, qua vòm miệng xuống họng. Dư vị của vang Syrah sẽ tạo cho bạn cảm giác mượt mà, kéo dài mãi…', 'RƯỢU VANG SYRAH 12,5%', '', 'publish', 'open', 'closed', '', 'ruou-vang-syrah-125', '', '', '2012-09-17 06:08:16', '2012-09-17 06:08:16', '', 0, 'http://localhost/trathonghong/?post_type=product&#038;p=123', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(124, 1, '2012-09-17 06:07:52', '2012-09-17 06:07:52', '', '16', '', 'inherit', 'open', 'open', '', '16', '', '', '2012-09-17 06:07:52', '2012-09-17 06:07:52', '', 123, 'http://localhost/trathonghong/wp-content/uploads/2012/09/16.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(132, 1, '2012-09-17 07:02:14', '2012-09-17 07:02:14', '', 'QUẦN ÁO LEN', '', 'publish', 'open', 'open', '', 'qu%e1%ba%a7n-ao-len', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/trathonghong/?p=132', 6, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(133, 1, '2012-09-17 07:02:14', '2012-09-17 07:02:14', '', 'TÚI XÁCH LEN', '', 'publish', 'open', 'open', '', 'tui-xach-len', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/trathonghong/?p=133', 7, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(134, 1, '2012-09-17 07:02:14', '2012-09-17 07:02:14', '', 'SẢN PHẨM LEN KHÁC', '', 'publish', 'open', 'open', '', 's%e1%ba%a3n-ph%e1%ba%a9m-len-khac', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/trathonghong/?p=134', 8, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(135, 1, '2012-09-17 07:02:14', '2012-09-17 07:02:14', '', 'NƯỚC CỐT TRÁI CÂY', '', 'publish', 'open', 'open', '', 'n%c6%b0%e1%bb%9bc-c%e1%bb%91t-trai-cay', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/trathonghong/?p=135', 9, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(136, 1, '2012-09-17 07:02:14', '2012-09-17 07:02:14', '', 'RƯỢU VANG', '', 'publish', 'open', 'open', '', 'r%c6%b0%e1%bb%a3u-vang', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/trathonghong/?p=136', 10, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(137, 1, '2012-09-17 07:02:14', '2012-09-17 07:02:14', '', 'MỨC KẸO ĐÀ LẠT', '', 'publish', 'open', 'open', '', 'm%e1%bb%a9c-k%e1%ba%b9o-da-l%e1%ba%a1t', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/trathonghong/?p=137', 11, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(138, 1, '2012-09-17 07:02:14', '2012-09-17 07:02:14', '', 'SẢN PHẨM BỔ DƯỠNG', '', 'publish', 'open', 'open', '', 's%e1%ba%a3n-ph%e1%ba%a9m-b%e1%bb%95-d%c6%b0%e1%bb%a1ng', '', '', '2012-09-17 15:16:06', '2012-09-17 15:16:06', '', 0, 'http://localhost/trathonghong/?p=138', 12, 'nav_menu_item', '', 0);
INSERT INTO `th_posts` VALUES(141, 1, '2012-09-17 14:53:04', '2012-09-17 14:53:04', '', 'ÁO LEN A001', '', 'publish', 'open', 'closed', '', 'ao-len-a001', '', '', '2012-09-17 15:03:43', '2012-09-17 15:03:43', '', 0, 'http://www.vnestore.com/trathonghong/?post_type=product&#038;p=141', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(142, 1, '2012-09-17 14:51:51', '2012-09-17 14:51:51', '', 'DSC00788', '', 'inherit', 'open', 'open', '', 'dsc00788', '', '', '2012-09-17 14:51:51', '2012-09-17 14:51:51', '', 141, 'http://www.vnestore.com/trathonghong/wp-content/uploads/2012/09/DSC00788.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(143, 1, '2012-09-17 14:52:47', '2012-09-17 14:52:47', '', 'DSC00792', '', 'inherit', 'open', 'open', '', 'dsc00792', '', '', '2012-09-17 14:52:47', '2012-09-17 14:52:47', '', 141, 'http://www.vnestore.com/trathonghong/wp-content/uploads/2012/09/DSC00792.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(144, 1, '2012-09-17 14:56:55', '2012-09-17 14:56:55', '', 'TÚI XÁCH LEN T002', '', 'publish', 'open', 'closed', '', 'tui-xach-len-2000', '', '', '2012-09-17 15:03:22', '2012-09-17 15:03:22', '', 0, 'http://www.vnestore.com/trathonghong/?post_type=product&#038;p=144', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(145, 1, '2012-09-17 14:56:41', '2012-09-17 14:56:41', '', 'DSC00777', '', 'inherit', 'open', 'open', '', 'dsc00777', '', '', '2012-09-17 14:56:41', '2012-09-17 14:56:41', '', 144, 'http://www.vnestore.com/trathonghong/wp-content/uploads/2012/09/DSC00777.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(146, 1, '2012-09-17 14:56:44', '2012-09-17 14:56:44', '', 'DSC00778', '', 'inherit', 'open', 'open', '', 'dsc00778', '', '', '2012-09-17 14:56:44', '2012-09-17 14:56:44', '', 144, 'http://www.vnestore.com/trathonghong/wp-content/uploads/2012/09/DSC00778.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(147, 1, '2012-09-17 14:59:09', '2012-09-17 14:59:09', '', 'TÚI XÁCH LEN T001', '', 'publish', 'open', 'closed', '', 'tui-xach-len-t001', '', '', '2012-09-17 14:59:09', '2012-09-17 14:59:09', '', 0, 'http://www.vnestore.com/trathonghong/?post_type=product&#038;p=147', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(148, 1, '2012-09-17 14:58:34', '2012-09-17 14:58:34', '', 'DSC00784', '', 'inherit', 'open', 'open', '', 'dsc00784', '', '', '2012-09-17 14:58:34', '2012-09-17 14:58:34', '', 147, 'http://www.vnestore.com/trathonghong/wp-content/uploads/2012/09/DSC00784.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(149, 1, '2012-09-17 14:58:36', '2012-09-17 14:58:36', '', 'DSC00785', '', 'inherit', 'open', 'open', '', 'dsc00785', '', '', '2012-09-17 14:58:36', '2012-09-17 14:58:36', '', 147, 'http://www.vnestore.com/trathonghong/wp-content/uploads/2012/09/DSC00785.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(150, 1, '2012-09-17 15:02:00', '2012-09-17 15:02:00', '', 'NÓN LEN THỜI TRANG N001', '', 'publish', 'open', 'closed', '', 'non-len-thoi-trang-n001', '', '', '2012-09-17 15:02:19', '2012-09-17 15:02:19', '', 0, 'http://www.vnestore.com/trathonghong/?post_type=product&#038;p=150', 0, 'product', '', 0);
INSERT INTO `th_posts` VALUES(151, 1, '2012-09-17 15:01:21', '2012-09-17 15:01:21', '', 'DSC00888', '', 'inherit', 'open', 'open', '', 'dsc00888', '', '', '2012-09-17 15:01:21', '2012-09-17 15:01:21', '', 150, 'http://www.vnestore.com/trathonghong/wp-content/uploads/2012/09/DSC00888.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(152, 1, '2012-09-17 15:01:23', '2012-09-17 15:01:23', '', 'DSC00889', '', 'inherit', 'open', 'open', '', 'dsc00889', '', '', '2012-09-17 15:01:23', '2012-09-17 15:01:23', '', 150, 'http://www.vnestore.com/trathonghong/wp-content/uploads/2012/09/DSC00889.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(153, 1, '2012-09-17 15:06:12', '2012-09-17 15:06:12', '', 'DSC00793', '', 'inherit', 'open', 'open', '', 'dsc00793', '', '', '2012-09-17 15:06:12', '2012-09-17 15:06:12', '', 126, 'http://www.vnestore.com/trathonghong/wp-content/uploads/2012/09/DSC00793.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(154, 1, '2012-09-17 15:06:16', '2012-09-17 15:06:16', '', 'DSC00795', '', 'inherit', 'open', 'open', '', 'dsc00795', '', '', '2012-09-17 15:06:16', '2012-09-17 15:06:16', '', 126, 'http://www.vnestore.com/trathonghong/wp-content/uploads/2012/09/DSC00795.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `th_posts` VALUES(155, 1, '2012-09-17 15:56:07', '2012-09-17 15:56:07', 'Là thức uống giải khát rất tốt cho sức khỏe, dùng thường xuyên giúp điều hòa tim mạch, kích thích tiêu hóa, an thần, dễ ngủ - Là thức uống không thể thiếu trong những bữa tiệc sang trọng.\nVang Demi-Sec: Với nồng độ, hương thơm nhẹ nhàng, quý phái, đặc biệt thích hợp cho phái nữ.\n<ul id="idTab2">\n	<li>Hộp quà: 2</li>\n	<li>Thùng carton: 6 chai</li>\n	<li>% Alcohol of Volume: 11% of Vol.</li>\n	<li>Thể tích: 750ml / 25.361 fl oz</li>\n	<li>Trọng lượng: 1kg/chai</li>\n</ul>', 'RƯỢU VANG DEMI SEC', '', 'inherit', 'open', 'open', '', '115-autosave', '', '', '2012-09-17 15:56:07', '2012-09-17 15:56:07', '', 115, 'http://www.vnestore.com/trathonghong/115-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(156, 1, '2012-09-17 15:56:07', '2012-09-17 15:56:07', '<strong>Nươc cốt trái nhàu - Pure Noni Juice: điêu hòa lượng đường trong máu, tăng cường hệ thống miễn dịch </strong><strong>giúp ổ</strong><strong>n định sức khỏe người cao tuổi.</strong>\n\nSở lược về cây nhàu và nước cốt trái nhàu:<em>Trên quần đảo Polynesia của Pháp, người ta gọi trái nhàu là “quả thần kì” và nó trở thành một vị thuốc tự nhiên được sử dụng trong truyền thống. Người dân ở đảo Tahiti vùng Nam Thái Bình Dương xưng tụng là “Lễ vật trời ban”. Cuối thế kỉ XX, trái nhàu được biết đến như là một báu vật bảo vệ sức khoẻ cho con người.</em>\n\nNước cốt Trái nhàu của Công ty TNHH Vĩnh Tiến được chế biến từ trái nhàu vừa chín được tuyển lựa kỹ càng, kết hợp phương pháp truyền thống với máy móc hiện đại để giữ được hương vị tự nhiên, tinh khiết. Đây là thức uống giải khát rất tốt cho sức khỏe, dùng thường xuyên giúp điều hòa lượng đường trong máu cho người bị tiểu đường, điều hòa huyết áp cho người bị huyết áp cao, nhuận tràng, trợ tiêu hóa, ngừa đau nhức, thấp khớp, ho cảm, làm đẹp da và tăng cường hệ miễn dịch cơ thể. Sản phẩm này đã và đang được xuất khẩu sang Mỹ và Hàn Quốc và được người Mỹ và Hàn Quốc tin dùng.\n\nThùng carton: 12 chai\n\nThể tích: 1 lít\n\nSản phẩm được cấp giấy chưng nhận an toàn thực phẩm số 7789/2010/YT-CNTN của Cục an toàn vệ sinh thưc phẩm, Bộ y tế cấp ngày 16/7/2010.', 'NƯỚC CỐT TRÁI NHÀU', '', 'inherit', 'open', 'open', '', '113-autosave', '', '', '2012-09-17 15:56:07', '2012-09-17 15:56:07', '', 113, 'http://www.vnestore.com/trathonghong/113-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(157, 1, '2012-09-17 15:56:10', '2012-09-17 15:56:10', 'Được chế biến từ trái Dâu Tây vừa chín được tuyển lựa kỹ càng, kết hợp phương pháp truyền thống với hiện đại giữ được hương vị tự nhiên, tinh khiết - Là thức uống giải khát rất tốt cho sức khỏe, dùng thường xuyên giúp giảm đau lưng, nhức mỏi, thấp khớp, kích thích tiêu hóa.\n<ul id="idTab2">\n	<li>Thùng carton: 24 chai</li>\n	<li>Thể tích: 500ml</li>\n	<li>Trọng lượng: 14kg</li>\n</ul>', 'NƯỚC CỐT DÂU TÂY', '', 'inherit', 'open', 'open', '', '111-autosave', '', '', '2012-09-17 15:56:10', '2012-09-17 15:56:10', '', 111, 'http://www.vnestore.com/trathonghong/111-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(158, 1, '2012-09-17 15:58:55', '2012-09-17 15:58:55', '<ul>\n	<li><strong>Công dụng:</strong></li>\n</ul>\n- Giúp giải nhiệt, lợi tiểu, lợi mật, giảm đường huyết, phòng ngừa tiểu đường. Dùng cho người bị bệnh tiểu đường, mỡ máu.\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\n<ul>\n	<li><strong>Thành phần:</strong></li>\n</ul>\nKhổ qua (Mướp đắng) lát sấy khô: 100%\n<ul>\n	<li><strong>Quy cách đóng gói:</strong></li>\n</ul>\n- Túi: 80 gram.\n- Block:\n- Thùng carton: 100 túi.', 'KHỔ QUA LÁT (TÚI 80 GRAM)', '', 'inherit', 'open', 'open', '', '101-autosave', '', '', '2012-09-17 15:58:55', '2012-09-17 15:58:55', '', 101, 'http://www.vnestore.com/trathonghong/101-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(159, 1, '2012-09-17 15:58:57', '2012-09-17 15:58:57', '<ul>\n	<li><strong>Công dụng:</strong></li>\n</ul>\n- Giúp bổ huyết, khỏe gân cốt, làm đen tóc. Dùng cho người tóc bạc sớm, đau mỏi lưng gối, khí huyết kém, thần kinh suy nhược.\n- Chú ý: Sản phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.\n<ul>\n	<li><strong>Thành phần:</strong></li>\n</ul>\nHà Thủ Ô miếng sấy khô: 100%\n<ul>\n	<li><strong>Quy cách đóng gói:</strong></li>\n</ul>\n- Túi: 500 gram.\n- Block:\n- Thùng carton', 'HÀ THỦ Ô LÁT (TÚI 500 GRAM)', '', 'inherit', 'open', 'open', '', '99-autosave', '', '', '2012-09-17 15:58:57', '2012-09-17 15:58:57', '', 99, 'http://www.vnestore.com/trathonghong/99-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(160, 1, '2012-09-17 16:01:07', '2012-09-17 16:01:07', 'Thành phần: 100% bông Atisô\n\nCông dụng: Là thức uống giải khát hàng ngày, giúp mát gan, thông mật, lợi tiểu, tăng bài tiết mật, hạ cholesterol và ure huyết, đẹp da.\n\nCách dùng: Mỗi lần nấu khoảng 50 gram rửa sạch với 2 lít nước, bỏ vào ấm nấu sôi từ 10 đến 15 phút, có thể pha thêm đường phèn hoặc sửa tùy thích.', 'BÔNG ATISÔ', '', 'inherit', 'open', 'open', '', '76-autosave', '', '', '2012-09-17 16:01:07', '2012-09-17 16:01:07', '', 76, 'http://www.vnestore.com/trathonghong/76-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(161, 1, '2012-09-17 16:01:08', '2012-09-17 16:01:08', 'Được chế biến từ gừng nguyên chất, là thức uống giải khát có tác dụng tốt cho người bị đau bụng lạnh, đầy trướng, không tiêu hoặc thổ tả, bị nhiễm lạnh, chân tay lạnh, mạch nhỏ, ho do lạnh. Mùi thơm đặc trưng của gừng.', 'TRÀ GỪNG', '', 'inherit', 'open', 'open', '', '74-autosave', '', '', '2012-09-17 16:01:08', '2012-09-17 16:01:08', '', 74, 'http://www.vnestore.com/trathonghong/74-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(162, 1, '2012-09-17 16:01:09', '2012-09-17 16:01:09', 'Được chế biến từ búp trà nguyên chất, là thức uống giải khát dùng thường xuyên có lợi cho sức khỏe, đặc biệt là tim mạch. Mùi thơm phảng phất từ hương lài tạo cảm giác sảng khoái và thoải mái.', 'TRÀ LÀI', '', 'inherit', 'open', 'open', '', '72-autosave', '', '', '2012-09-17 16:01:09', '2012-09-17 16:01:09', '', 72, 'http://www.vnestore.com/trathonghong/72-autosave/', 0, 'revision', '', 0);
INSERT INTO `th_posts` VALUES(163, 1, '2012-09-17 16:01:10', '2012-09-17 16:01:10', 'Được chế biến từ khổ qua nguyên chất, là thức uống giải khát, dùng thường xuyên có tác dụng bổ thận, lợi tiểu, nhuận gan, giải nhiệt, trợ tiêu hóa, giảm chất béo trong cơ thể. Thích hợp cho người bị tiểu đường.', 'TRÀ KHỔ QUA', '', 'inherit', 'open', 'open', '', '25-autosave', '', '', '2012-09-17 16:01:10', '2012-09-17 16:01:10', '', 25, 'http://www.vnestore.com/trathonghong/25-autosave/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `th_slp_rep_query`
--

CREATE TABLE `th_slp_rep_query` (
  `slp_repq_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slp_repq_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `slp_repq_query` varchar(255) NOT NULL,
  `slp_repq_tags` varchar(255) DEFAULT NULL,
  `slp_repq_address` varchar(255) DEFAULT NULL,
  `slp_repq_radius` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`slp_repq_id`),
  KEY `slp_repq_time` (`slp_repq_time`),
  KEY `slp_repq_time_2` (`slp_repq_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `th_slp_rep_query`
--


-- --------------------------------------------------------

--
-- Table structure for table `th_slp_rep_query_results`
--

CREATE TABLE `th_slp_rep_query_results` (
  `slp_repqr_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slp_repq_id` bigint(20) unsigned NOT NULL,
  `sl_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`slp_repqr_id`),
  KEY `slp_repq_id` (`slp_repq_id`),
  KEY `slp_repq_id_2` (`slp_repq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `th_slp_rep_query_results`
--


-- --------------------------------------------------------

--
-- Table structure for table `th_store_locator`
--

CREATE TABLE `th_store_locator` (
  `sl_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sl_store` varchar(255) DEFAULT NULL,
  `sl_address` varchar(255) DEFAULT NULL,
  `sl_address2` varchar(255) DEFAULT NULL,
  `sl_city` varchar(255) DEFAULT NULL,
  `sl_state` varchar(255) DEFAULT NULL,
  `sl_zip` varchar(255) DEFAULT NULL,
  `sl_country` varchar(255) DEFAULT NULL,
  `sl_latitude` varchar(255) DEFAULT NULL,
  `sl_longitude` varchar(255) DEFAULT NULL,
  `sl_tags` mediumtext,
  `sl_description` text,
  `sl_email` varchar(255) DEFAULT NULL,
  `sl_url` varchar(255) DEFAULT NULL,
  `sl_hours` varchar(255) DEFAULT NULL,
  `sl_phone` varchar(255) DEFAULT NULL,
  `sl_image` varchar(255) DEFAULT NULL,
  `sl_private` varchar(1) DEFAULT NULL,
  `sl_neat_title` varchar(255) DEFAULT NULL,
  `sl_linked_postid` int(11) DEFAULT NULL,
  `sl_pages_url` varchar(255) DEFAULT NULL,
  `sl_pages_on` varchar(1) DEFAULT NULL,
  `sl_lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sl_id`),
  KEY `sl_store` (`sl_store`),
  KEY `sl_longitude` (`sl_longitude`),
  KEY `sl_latitude` (`sl_latitude`),
  KEY `sl_store_2` (`sl_store`),
  KEY `sl_longitude_2` (`sl_longitude`),
  KEY `sl_latitude_2` (`sl_latitude`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `th_store_locator`
--

INSERT INTO `th_store_locator` VALUES(1, 'Trà Thông Hồng', '61/23 Đường 783 - Tạ Quang Bửu', 'Phường 4&#44; Quận 8', 'Tp. Hồ Chí Minh', '', '', 'Việt Nam', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2012-09-16 12:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `th_terms`
--

CREATE TABLE `th_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `th_terms`
--

INSERT INTO `th_terms` VALUES(1, 'Uncategorized', 'uncategorized', 0);
INSERT INTO `th_terms` VALUES(2, 'Blogroll', 'blogroll', 0);
INSERT INTO `th_terms` VALUES(3, 'simple', 'simple', 0);
INSERT INTO `th_terms` VALUES(4, 'grouped', 'grouped', 0);
INSERT INTO `th_terms` VALUES(5, 'variable', 'variable', 0);
INSERT INTO `th_terms` VALUES(6, 'external', 'external', 0);
INSERT INTO `th_terms` VALUES(7, 'pending', 'pending', 0);
INSERT INTO `th_terms` VALUES(8, 'failed', 'failed', 0);
INSERT INTO `th_terms` VALUES(9, 'on-hold', 'on-hold', 0);
INSERT INTO `th_terms` VALUES(10, 'processing', 'processing', 0);
INSERT INTO `th_terms` VALUES(11, 'completed', 'completed', 0);
INSERT INTO `th_terms` VALUES(12, 'refunded', 'refunded', 0);
INSERT INTO `th_terms` VALUES(13, 'cancelled', 'cancelled', 0);
INSERT INTO `th_terms` VALUES(14, 'MENU THÔNG HỒNG', 'menu-thong-h%e1%bb%93ng', 0);
INSERT INTO `th_terms` VALUES(15, 'Thời trang len', 'quan-ao-thoi-trang-len-thong-hong', 0);
INSERT INTO `th_terms` VALUES(16, 'Trà', 'tra-thong-hong-tra-vinh-tien', 0);
INSERT INTO `th_terms` VALUES(17, 'Nước cốt trái cây', 'nuoc-cot-trai-cay-thong-hong', 0);
INSERT INTO `th_terms` VALUES(18, 'MENU CHỨC NĂNG', 'menu-ch%e1%bb%a9c-nang', 0);
INSERT INTO `th_terms` VALUES(19, 'Rượi vang', 'ruoi-vang-thong-hong', 0);
INSERT INTO `th_terms` VALUES(20, 'Kẹo mức Đà Lạt', 'keo-muc-da-lat-thong-hong', 0);
INSERT INTO `th_terms` VALUES(21, 'Sản phẩm bổ dưỡng', 'san-pham-bo-duong-thong-hong', 0);
INSERT INTO `th_terms` VALUES(22, 'Quần áo len', 'quan-ao-len', 0);
INSERT INTO `th_terms` VALUES(23, 'Túi xách len', 'tui-xach-len', 0);
INSERT INTO `th_terms` VALUES(24, 'Sản phẩm len khác', 'san-pham-len-khac', 0);
INSERT INTO `th_terms` VALUES(25, 'Trà Thông Hồng', 'tra-thong-hong', 0);
INSERT INTO `th_terms` VALUES(26, 'Trà Vĩnh Tiến', 'tra-vinh-tien', 0);

-- --------------------------------------------------------

--
-- Table structure for table `th_term_relationships`
--

CREATE TABLE `th_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `th_term_relationships`
--

INSERT INTO `th_term_relationships` VALUES(1, 2, 0);
INSERT INTO `th_term_relationships` VALUES(2, 2, 0);
INSERT INTO `th_term_relationships` VALUES(3, 2, 0);
INSERT INTO `th_term_relationships` VALUES(4, 2, 0);
INSERT INTO `th_term_relationships` VALUES(5, 2, 0);
INSERT INTO `th_term_relationships` VALUES(6, 2, 0);
INSERT INTO `th_term_relationships` VALUES(7, 2, 0);
INSERT INTO `th_term_relationships` VALUES(1, 1, 0);
INSERT INTO `th_term_relationships` VALUES(131, 14, 0);
INSERT INTO `th_term_relationships` VALUES(15, 14, 0);
INSERT INTO `th_term_relationships` VALUES(16, 3, 0);
INSERT INTO `th_term_relationships` VALUES(72, 16, 0);
INSERT INTO `th_term_relationships` VALUES(18, 25, 0);
INSERT INTO `th_term_relationships` VALUES(25, 25, 0);
INSERT INTO `th_term_relationships` VALUES(25, 16, 0);
INSERT INTO `th_term_relationships` VALUES(18, 3, 0);
INSERT INTO `th_term_relationships` VALUES(25, 3, 0);
INSERT INTO `th_term_relationships` VALUES(39, 18, 0);
INSERT INTO `th_term_relationships` VALUES(48, 18, 0);
INSERT INTO `th_term_relationships` VALUES(41, 9, 0);
INSERT INTO `th_term_relationships` VALUES(42, 9, 0);
INSERT INTO `th_term_relationships` VALUES(130, 14, 0);
INSERT INTO `th_term_relationships` VALUES(129, 14, 0);
INSERT INTO `th_term_relationships` VALUES(128, 14, 0);
INSERT INTO `th_term_relationships` VALUES(16, 16, 0);
INSERT INTO `th_term_relationships` VALUES(16, 25, 0);
INSERT INTO `th_term_relationships` VALUES(72, 25, 0);
INSERT INTO `th_term_relationships` VALUES(72, 3, 0);
INSERT INTO `th_term_relationships` VALUES(74, 16, 0);
INSERT INTO `th_term_relationships` VALUES(74, 25, 0);
INSERT INTO `th_term_relationships` VALUES(74, 3, 0);
INSERT INTO `th_term_relationships` VALUES(76, 3, 0);
INSERT INTO `th_term_relationships` VALUES(76, 16, 0);
INSERT INTO `th_term_relationships` VALUES(76, 25, 0);
INSERT INTO `th_term_relationships` VALUES(79, 1, 0);
INSERT INTO `th_term_relationships` VALUES(81, 1, 0);
INSERT INTO `th_term_relationships` VALUES(83, 1, 0);
INSERT INTO `th_term_relationships` VALUES(86, 3, 0);
INSERT INTO `th_term_relationships` VALUES(89, 3, 0);
INSERT INTO `th_term_relationships` VALUES(89, 16, 0);
INSERT INTO `th_term_relationships` VALUES(89, 26, 0);
INSERT INTO `th_term_relationships` VALUES(91, 3, 0);
INSERT INTO `th_term_relationships` VALUES(93, 3, 0);
INSERT INTO `th_term_relationships` VALUES(96, 3, 0);
INSERT INTO `th_term_relationships` VALUES(99, 3, 0);
INSERT INTO `th_term_relationships` VALUES(99, 16, 0);
INSERT INTO `th_term_relationships` VALUES(99, 26, 0);
INSERT INTO `th_term_relationships` VALUES(96, 16, 0);
INSERT INTO `th_term_relationships` VALUES(96, 26, 0);
INSERT INTO `th_term_relationships` VALUES(93, 16, 0);
INSERT INTO `th_term_relationships` VALUES(93, 26, 0);
INSERT INTO `th_term_relationships` VALUES(86, 16, 0);
INSERT INTO `th_term_relationships` VALUES(86, 26, 0);
INSERT INTO `th_term_relationships` VALUES(91, 16, 0);
INSERT INTO `th_term_relationships` VALUES(91, 26, 0);
INSERT INTO `th_term_relationships` VALUES(101, 3, 0);
INSERT INTO `th_term_relationships` VALUES(103, 3, 0);
INSERT INTO `th_term_relationships` VALUES(105, 3, 0);
INSERT INTO `th_term_relationships` VALUES(133, 14, 0);
INSERT INTO `th_term_relationships` VALUES(103, 21, 0);
INSERT INTO `th_term_relationships` VALUES(132, 14, 0);
INSERT INTO `th_term_relationships` VALUES(99, 21, 0);
INSERT INTO `th_term_relationships` VALUES(101, 16, 0);
INSERT INTO `th_term_relationships` VALUES(101, 26, 0);
INSERT INTO `th_term_relationships` VALUES(107, 17, 0);
INSERT INTO `th_term_relationships` VALUES(107, 3, 0);
INSERT INTO `th_term_relationships` VALUES(109, 3, 0);
INSERT INTO `th_term_relationships` VALUES(111, 3, 0);
INSERT INTO `th_term_relationships` VALUES(113, 3, 0);
INSERT INTO `th_term_relationships` VALUES(113, 17, 0);
INSERT INTO `th_term_relationships` VALUES(115, 19, 0);
INSERT INTO `th_term_relationships` VALUES(115, 3, 0);
INSERT INTO `th_term_relationships` VALUES(117, 3, 0);
INSERT INTO `th_term_relationships` VALUES(117, 19, 0);
INSERT INTO `th_term_relationships` VALUES(119, 3, 0);
INSERT INTO `th_term_relationships` VALUES(119, 19, 0);
INSERT INTO `th_term_relationships` VALUES(121, 3, 0);
INSERT INTO `th_term_relationships` VALUES(121, 19, 0);
INSERT INTO `th_term_relationships` VALUES(123, 3, 0);
INSERT INTO `th_term_relationships` VALUES(123, 19, 0);
INSERT INTO `th_term_relationships` VALUES(111, 17, 0);
INSERT INTO `th_term_relationships` VALUES(109, 17, 0);
INSERT INTO `th_term_relationships` VALUES(105, 21, 0);
INSERT INTO `th_term_relationships` VALUES(134, 14, 0);
INSERT INTO `th_term_relationships` VALUES(135, 14, 0);
INSERT INTO `th_term_relationships` VALUES(136, 14, 0);
INSERT INTO `th_term_relationships` VALUES(137, 14, 0);
INSERT INTO `th_term_relationships` VALUES(138, 14, 0);
INSERT INTO `th_term_relationships` VALUES(139, 15, 0);
INSERT INTO `th_term_relationships` VALUES(139, 22, 0);
INSERT INTO `th_term_relationships` VALUES(139, 3, 0);
INSERT INTO `th_term_relationships` VALUES(141, 15, 0);
INSERT INTO `th_term_relationships` VALUES(141, 22, 0);
INSERT INTO `th_term_relationships` VALUES(141, 3, 0);
INSERT INTO `th_term_relationships` VALUES(144, 15, 0);
INSERT INTO `th_term_relationships` VALUES(144, 23, 0);
INSERT INTO `th_term_relationships` VALUES(144, 3, 0);
INSERT INTO `th_term_relationships` VALUES(147, 15, 0);
INSERT INTO `th_term_relationships` VALUES(147, 23, 0);
INSERT INTO `th_term_relationships` VALUES(147, 3, 0);
INSERT INTO `th_term_relationships` VALUES(150, 15, 0);
INSERT INTO `th_term_relationships` VALUES(150, 24, 0);
INSERT INTO `th_term_relationships` VALUES(150, 3, 0);
INSERT INTO `th_term_relationships` VALUES(126, 15, 0);
INSERT INTO `th_term_relationships` VALUES(126, 22, 0);
INSERT INTO `th_term_relationships` VALUES(126, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `th_term_taxonomy`
--

CREATE TABLE `th_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `th_term_taxonomy`
--

INSERT INTO `th_term_taxonomy` VALUES(1, 1, 'category', '', 0, 3);
INSERT INTO `th_term_taxonomy` VALUES(2, 2, 'link_category', '', 0, 7);
INSERT INTO `th_term_taxonomy` VALUES(3, 3, 'product_type', '', 0, 30);
INSERT INTO `th_term_taxonomy` VALUES(4, 4, 'product_type', '', 0, 0);
INSERT INTO `th_term_taxonomy` VALUES(5, 5, 'product_type', '', 0, 0);
INSERT INTO `th_term_taxonomy` VALUES(6, 6, 'product_type', '', 0, 0);
INSERT INTO `th_term_taxonomy` VALUES(7, 7, 'shop_order_status', '', 0, 0);
INSERT INTO `th_term_taxonomy` VALUES(8, 8, 'shop_order_status', '', 0, 0);
INSERT INTO `th_term_taxonomy` VALUES(9, 9, 'shop_order_status', '', 0, 2);
INSERT INTO `th_term_taxonomy` VALUES(10, 10, 'shop_order_status', '', 0, 0);
INSERT INTO `th_term_taxonomy` VALUES(11, 11, 'shop_order_status', '', 0, 0);
INSERT INTO `th_term_taxonomy` VALUES(12, 12, 'shop_order_status', '', 0, 0);
INSERT INTO `th_term_taxonomy` VALUES(13, 13, 'shop_order_status', '', 0, 0);
INSERT INTO `th_term_taxonomy` VALUES(14, 14, 'nav_menu', '', 0, 12);
INSERT INTO `th_term_taxonomy` VALUES(15, 15, 'product_cat', '', 0, 6);
INSERT INTO `th_term_taxonomy` VALUES(16, 16, 'product_cat', '', 0, 12);
INSERT INTO `th_term_taxonomy` VALUES(17, 17, 'product_cat', '', 0, 4);
INSERT INTO `th_term_taxonomy` VALUES(19, 19, 'product_cat', '', 0, 5);
INSERT INTO `th_term_taxonomy` VALUES(18, 18, 'nav_menu', '', 0, 2);
INSERT INTO `th_term_taxonomy` VALUES(20, 20, 'product_cat', '', 0, 0);
INSERT INTO `th_term_taxonomy` VALUES(21, 21, 'product_cat', '', 0, 3);
INSERT INTO `th_term_taxonomy` VALUES(22, 22, 'product_cat', '', 15, 3);
INSERT INTO `th_term_taxonomy` VALUES(23, 23, 'product_cat', '', 15, 2);
INSERT INTO `th_term_taxonomy` VALUES(24, 24, 'product_cat', '', 15, 1);
INSERT INTO `th_term_taxonomy` VALUES(25, 25, 'product_cat', '', 16, 6);
INSERT INTO `th_term_taxonomy` VALUES(26, 26, 'product_cat', '', 16, 7);

-- --------------------------------------------------------

--
-- Table structure for table `th_usermeta`
--

CREATE TABLE `th_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `th_usermeta`
--

INSERT INTO `th_usermeta` VALUES(1, 1, 'first_name', 'sdf');
INSERT INTO `th_usermeta` VALUES(2, 1, 'last_name', 'fdf');
INSERT INTO `th_usermeta` VALUES(3, 1, 'nickname', 'admin');
INSERT INTO `th_usermeta` VALUES(4, 1, 'description', '');
INSERT INTO `th_usermeta` VALUES(5, 1, 'rich_editing', 'true');
INSERT INTO `th_usermeta` VALUES(6, 1, 'comment_shortcuts', 'false');
INSERT INTO `th_usermeta` VALUES(7, 1, 'admin_color', 'classic');
INSERT INTO `th_usermeta` VALUES(8, 1, 'use_ssl', '0');
INSERT INTO `th_usermeta` VALUES(9, 1, 'show_admin_bar_front', 'true');
INSERT INTO `th_usermeta` VALUES(10, 1, 'th_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}');
INSERT INTO `th_usermeta` VALUES(11, 1, 'th_user_level', '10');
INSERT INTO `th_usermeta` VALUES(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_media_uploader,wp330_saving_widgets');
INSERT INTO `th_usermeta` VALUES(13, 1, 'show_welcome_panel', '1');
INSERT INTO `th_usermeta` VALUES(14, 1, 'th_dashboard_quick_press_last_post_id', '3');
INSERT INTO `th_usermeta` VALUES(15, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}');
INSERT INTO `th_usermeta` VALUES(16, 1, 'metaboxhidden_nav-menus', 'a:5:{i:0;s:8:"add-post";i:1;s:11:"add-product";i:2;s:12:"add-post_tag";i:3;s:15:"add-product_cat";i:4;s:15:"add-product_tag";}');
INSERT INTO `th_usermeta` VALUES(17, 1, 'th_user-settings', 'hidetb=0&editor=tinymce');
INSERT INTO `th_usermeta` VALUES(18, 1, 'th_user-settings-time', '1347765887');
INSERT INTO `th_usermeta` VALUES(19, 1, 'nav_menu_recently_edited', '14');
INSERT INTO `th_usermeta` VALUES(45, 1, 'closedpostboxes_nav-menus', 'a:1:{i:0;s:12:"add-category";}');
INSERT INTO `th_usermeta` VALUES(46, 1, 'closedpostboxes_product', 'a:2:{i:0;s:10:"postcustom";i:1;s:11:"postexcerpt";}');
INSERT INTO `th_usermeta` VALUES(48, 1, 'meta-box-order_product', 'a:3:{s:4:"side";s:57:"submitdiv,product_catdiv,tagsdiv-product_tag,postimagediv";s:6:"normal";s:55:"woocommerce-product-data,postcustom,slugdiv,postexcerpt";s:8:"advanced";s:0:"";}');
INSERT INTO `th_usermeta` VALUES(47, 1, 'metaboxhidden_product', 'a:1:{i:0;s:7:"slugdiv";}');
INSERT INTO `th_usermeta` VALUES(21, 1, 'billing_first_name', 'sdf');
INSERT INTO `th_usermeta` VALUES(22, 1, 'billing_last_name', 'fdf');
INSERT INTO `th_usermeta` VALUES(23, 1, 'billing_company', '');
INSERT INTO `th_usermeta` VALUES(24, 1, 'billing_address_1', 'dfdf');
INSERT INTO `th_usermeta` VALUES(25, 1, 'billing_address_2', '');
INSERT INTO `th_usermeta` VALUES(26, 1, 'billing_city', 'fdf');
INSERT INTO `th_usermeta` VALUES(27, 1, 'billing_postcode', '');
INSERT INTO `th_usermeta` VALUES(28, 1, 'billing_state', '');
INSERT INTO `th_usermeta` VALUES(29, 1, 'billing_country', '');
INSERT INTO `th_usermeta` VALUES(30, 1, 'billing_phone', '45454');
INSERT INTO `th_usermeta` VALUES(31, 1, 'billing_email', 'lgthnha@yahoo.com.vn');
INSERT INTO `th_usermeta` VALUES(32, 1, 'shipping_first_name', '');
INSERT INTO `th_usermeta` VALUES(33, 1, 'shipping_last_name', '');
INSERT INTO `th_usermeta` VALUES(34, 1, 'shipping_company', '');
INSERT INTO `th_usermeta` VALUES(35, 1, 'shipping_address_1', '');
INSERT INTO `th_usermeta` VALUES(36, 1, 'shipping_address_2', '');
INSERT INTO `th_usermeta` VALUES(37, 1, 'shipping_city', '');
INSERT INTO `th_usermeta` VALUES(38, 1, 'shipping_postcode', '');
INSERT INTO `th_usermeta` VALUES(39, 1, 'shipping_state', '');
INSERT INTO `th_usermeta` VALUES(40, 1, 'shipping_country', '');
INSERT INTO `th_usermeta` VALUES(41, 1, 'aim', '');
INSERT INTO `th_usermeta` VALUES(42, 1, 'yim', '');
INSERT INTO `th_usermeta` VALUES(43, 1, 'jabber', '');
INSERT INTO `th_usermeta` VALUES(49, 1, 'screen_layout_product', '2');

-- --------------------------------------------------------

--
-- Table structure for table `th_users`
--

CREATE TABLE `th_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `th_users`
--

INSERT INTO `th_users` VALUES(1, 'admin', '$P$BAX8/H/Al.YrNKkg2t09SNitB/4uYc/', 'admin', 'lgthnha@yahoo.com.vn', '', '2012-09-14 15:12:06', '', 0, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `th_vs_current_online_users`
--

CREATE TABLE `th_vs_current_online_users` (
  `IP` varchar(15) NOT NULL COMMENT 'IP of user which enters page',
  `time` varchar(255) NOT NULL COMMENT 'time when user enters page (unix timestamp)',
  PRIMARY KEY (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `th_vs_current_online_users`
--

INSERT INTO `th_vs_current_online_users` VALUES('150.70.97.40', '1347898672');
INSERT INTO `th_vs_current_online_users` VALUES('27.78.159.105', '1347898877');
INSERT INTO `th_vs_current_online_users` VALUES('150.70.172.110', '1347898643');

-- --------------------------------------------------------

--
-- Table structure for table `th_vs_overall_counter`
--

CREATE TABLE `th_vs_overall_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period` varchar(255) DEFAULT NULL COMMENT 'period from which this record handle value: overall = NULL, weekly = weekn_number, daily = current_day',
  `visits` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `th_vs_overall_counter`
--

INSERT INTO `th_vs_overall_counter` VALUES(1, 'overall', 53);
INSERT INTO `th_vs_overall_counter` VALUES(2, '2012-09-17', 50);
INSERT INTO `th_vs_overall_counter` VALUES(3, '38', 50);

-- --------------------------------------------------------

--
-- Table structure for table `th_woocommerce_attribute_taxonomies`
--

CREATE TABLE `th_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) NOT NULL,
  `attribute_label` longtext,
  `attribute_type` varchar(200) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `th_woocommerce_attribute_taxonomies`
--


-- --------------------------------------------------------

--
-- Table structure for table `th_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `th_woocommerce_downloadable_product_permissions` (
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL DEFAULT '0',
  `order_key` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `downloads_remaining` varchar(9) DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`order_id`,`order_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `th_woocommerce_downloadable_product_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `th_woocommerce_termmeta`
--

CREATE TABLE `th_woocommerce_termmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `woocommerce_term_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `th_woocommerce_termmeta`
--

INSERT INTO `th_woocommerce_termmeta` VALUES(1, 14, 'order', '2');
INSERT INTO `th_woocommerce_termmeta` VALUES(2, 15, 'order', '8');
INSERT INTO `th_woocommerce_termmeta` VALUES(3, 16, 'order', '5');
INSERT INTO `th_woocommerce_termmeta` VALUES(4, 18, 'order', '1');
INSERT INTO `th_woocommerce_termmeta` VALUES(5, 16, 'thumbnail_id', '');
INSERT INTO `th_woocommerce_termmeta` VALUES(6, 15, 'thumbnail_id', '');
INSERT INTO `th_woocommerce_termmeta` VALUES(7, 17, 'thumbnail_id', '');
INSERT INTO `th_woocommerce_termmeta` VALUES(8, 19, 'order', '3');
INSERT INTO `th_woocommerce_termmeta` VALUES(9, 17, 'order', '4');
INSERT INTO `th_woocommerce_termmeta` VALUES(10, 19, 'thumbnail_id', '');
INSERT INTO `th_woocommerce_termmeta` VALUES(11, 20, 'order', '2');
INSERT INTO `th_woocommerce_termmeta` VALUES(12, 20, 'thumbnail_id', '');
INSERT INTO `th_woocommerce_termmeta` VALUES(13, 21, 'order', '1');
INSERT INTO `th_woocommerce_termmeta` VALUES(14, 21, 'thumbnail_id', '');
INSERT INTO `th_woocommerce_termmeta` VALUES(15, 22, 'thumbnail_id', '');
INSERT INTO `th_woocommerce_termmeta` VALUES(16, 23, 'order', '10');
INSERT INTO `th_woocommerce_termmeta` VALUES(17, 22, 'order', '11');
INSERT INTO `th_woocommerce_termmeta` VALUES(18, 23, 'thumbnail_id', '');
INSERT INTO `th_woocommerce_termmeta` VALUES(19, 24, 'order', '9');
INSERT INTO `th_woocommerce_termmeta` VALUES(20, 24, 'thumbnail_id', '');
INSERT INTO `th_woocommerce_termmeta` VALUES(21, 25, 'thumbnail_id', '');
INSERT INTO `th_woocommerce_termmeta` VALUES(22, 26, 'order', '6');
INSERT INTO `th_woocommerce_termmeta` VALUES(23, 25, 'order', '7');
INSERT INTO `th_woocommerce_termmeta` VALUES(24, 26, 'thumbnail_id', '');
