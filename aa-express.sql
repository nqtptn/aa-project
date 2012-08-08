/*
SQLyog Community Edition- MySQL GUI v7.15 
MySQL - 5.0.51b-community-nt-log : Database - aaexpress
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`aaexpress` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `aaexpress`;

/*Table structure for table `dev_commentmeta` */

DROP TABLE IF EXISTS `dev_commentmeta`;

CREATE TABLE `dev_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL auto_increment,
  `comment_id` bigint(20) unsigned NOT NULL default '0',
  `meta_key` varchar(255) default NULL,
  `meta_value` longtext,
  PRIMARY KEY  (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_comments` */

DROP TABLE IF EXISTS `dev_comments`;

CREATE TABLE `dev_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL auto_increment,
  `comment_post_ID` bigint(20) unsigned NOT NULL default '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL default '',
  `comment_author_url` varchar(200) NOT NULL default '',
  `comment_author_IP` varchar(100) NOT NULL default '',
  `comment_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL default '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL default '0',
  `comment_approved` varchar(20) NOT NULL default '1',
  `comment_agent` varchar(255) NOT NULL default '',
  `comment_type` varchar(20) NOT NULL default '',
  `comment_parent` bigint(20) unsigned NOT NULL default '0',
  `user_id` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_dist_users` */

DROP TABLE IF EXISTS `dev_dist_users`;

CREATE TABLE `dev_dist_users` (
  `userid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passw` varchar(255) NOT NULL,
  `phn` varchar(255) NOT NULL,
  `ccno` varchar(255) NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_distance_order` */

DROP TABLE IF EXISTS `dev_distance_order`;

CREATE TABLE `dev_distance_order` (
  `ordid` int(11) NOT NULL auto_increment,
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
  PRIMARY KEY  (`ordid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_dynamic_widgets` */

DROP TABLE IF EXISTS `dev_dynamic_widgets`;

CREATE TABLE `dev_dynamic_widgets` (
  `id` int(11) NOT NULL auto_increment,
  `widget_id` varchar(40) collate utf8_unicode_ci NOT NULL,
  `maintype` varchar(50) collate utf8_unicode_ci NOT NULL,
  `name` varchar(40) collate utf8_unicode_ci NOT NULL,
  `value` longtext collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `widget_id` (`widget_id`,`maintype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `dev_links` */

DROP TABLE IF EXISTS `dev_links`;

CREATE TABLE `dev_links` (
  `link_id` bigint(20) unsigned NOT NULL auto_increment,
  `link_url` varchar(255) NOT NULL default '',
  `link_name` varchar(255) NOT NULL default '',
  `link_image` varchar(255) NOT NULL default '',
  `link_target` varchar(25) NOT NULL default '',
  `link_description` varchar(255) NOT NULL default '',
  `link_visible` varchar(20) NOT NULL default 'Y',
  `link_owner` bigint(20) unsigned NOT NULL default '1',
  `link_rating` int(11) NOT NULL default '0',
  `link_updated` datetime NOT NULL default '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL default '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_llm` */

DROP TABLE IF EXISTS `dev_llm`;

CREATE TABLE `dev_llm` (
  `id` int(11) NOT NULL auto_increment,
  `category` int(11) default NULL,
  `name` varchar(255) default NULL,
  `alt` varchar(255) default NULL,
  `link` varchar(255) default NULL,
  `target` varchar(255) default NULL,
  `images` varchar(255) default NULL,
  `imagestype` varchar(255) default NULL,
  `imagesfloat` varchar(255) default NULL,
  `orderby` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_my_calendar` */

DROP TABLE IF EXISTS `dev_my_calendar`;

CREATE TABLE `dev_my_calendar` (
  `event_id` int(11) NOT NULL auto_increment,
  `event_begin` date NOT NULL,
  `event_end` date NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_desc` text NOT NULL,
  `event_short` text NOT NULL,
  `event_open` int(3) default '2',
  `event_time` time default NULL,
  `event_endtime` time default NULL,
  `event_recur` char(1) default NULL,
  `event_repeats` int(3) default NULL,
  `event_status` int(1) NOT NULL default '1',
  `event_author` bigint(20) unsigned default NULL,
  `event_host` bigint(20) unsigned default NULL,
  `event_category` bigint(20) unsigned NOT NULL default '1',
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
  `event_longitude` float(10,6) NOT NULL default '0.000000',
  `event_latitude` float(10,6) NOT NULL default '0.000000',
  `event_zoom` int(2) NOT NULL default '14',
  `event_phone` varchar(32) NOT NULL,
  `event_group` int(1) NOT NULL default '0',
  `event_group_id` int(11) NOT NULL default '0',
  `event_span` int(1) NOT NULL default '0',
  `event_approved` int(1) NOT NULL default '1',
  `event_flagged` int(1) NOT NULL default '0',
  `event_holiday` int(1) NOT NULL default '0',
  `event_fifth_week` int(1) NOT NULL default '0',
  `event_image` text,
  `event_added` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`event_id`),
  KEY `event_recur` (`event_recur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_my_calendar_categories` */

DROP TABLE IF EXISTS `dev_my_calendar_categories`;

CREATE TABLE `dev_my_calendar_categories` (
  `category_id` int(11) NOT NULL auto_increment,
  `category_name` varchar(255) NOT NULL,
  `category_color` varchar(7) NOT NULL,
  `category_icon` varchar(128) NOT NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_my_calendar_locations` */

DROP TABLE IF EXISTS `dev_my_calendar_locations`;

CREATE TABLE `dev_my_calendar_locations` (
  `location_id` int(11) NOT NULL auto_increment,
  `location_label` varchar(60) NOT NULL,
  `location_street` varchar(60) NOT NULL,
  `location_street2` varchar(60) NOT NULL,
  `location_city` varchar(60) NOT NULL,
  `location_state` varchar(60) NOT NULL,
  `location_postcode` varchar(10) NOT NULL,
  `location_region` varchar(255) NOT NULL,
  `location_url` text,
  `location_country` varchar(60) NOT NULL,
  `location_longitude` float(10,6) NOT NULL default '0.000000',
  `location_latitude` float(10,6) NOT NULL default '0.000000',
  `location_zoom` int(2) NOT NULL default '14',
  `location_phone` varchar(32) NOT NULL,
  PRIMARY KEY  (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_options` */

DROP TABLE IF EXISTS `dev_options`;

CREATE TABLE `dev_options` (
  `option_id` bigint(20) unsigned NOT NULL auto_increment,
  `option_name` varchar(64) NOT NULL default '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL default 'yes',
  PRIMARY KEY  (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3246 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_order_user_map` */

DROP TABLE IF EXISTS `dev_order_user_map`;

CREATE TABLE `dev_order_user_map` (
  `oid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_plugin_bota` */

DROP TABLE IF EXISTS `dev_plugin_bota`;

CREATE TABLE `dev_plugin_bota` (
  `id` int(11) NOT NULL auto_increment,
  `visited_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `visited_ip` int(11) NOT NULL,
  `visited_uri` varchar(250) collate utf8_unicode_ci NOT NULL,
  `visited_by` varchar(30) collate utf8_unicode_ci NOT NULL,
  `visited_referral` varchar(250) collate utf8_unicode_ci NOT NULL,
  `visited_page` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `visited_on` (`visited_on`),
  KEY `visited_by` (`visited_by`),
  KEY `visited_page` (`visited_page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to contain Bot Alert plugin view page';

/*Table structure for table `dev_pollsa` */

DROP TABLE IF EXISTS `dev_pollsa`;

CREATE TABLE `dev_pollsa` (
  `polla_aid` int(10) NOT NULL auto_increment,
  `polla_qid` int(10) NOT NULL default '0',
  `polla_answers` varchar(200) NOT NULL default '',
  `polla_votes` int(10) NOT NULL default '0',
  PRIMARY KEY  (`polla_aid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_pollsip` */

DROP TABLE IF EXISTS `dev_pollsip`;

CREATE TABLE `dev_pollsip` (
  `pollip_id` int(10) NOT NULL auto_increment,
  `pollip_qid` varchar(10) NOT NULL default '',
  `pollip_aid` varchar(10) NOT NULL default '',
  `pollip_ip` varchar(100) NOT NULL default '',
  `pollip_host` varchar(200) NOT NULL default '',
  `pollip_timestamp` varchar(20) NOT NULL default '0000-00-00 00:00:00',
  `pollip_user` tinytext NOT NULL,
  `pollip_userid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`pollip_id`),
  KEY `pollip_ip` (`pollip_id`),
  KEY `pollip_qid` (`pollip_qid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_pollsq` */

DROP TABLE IF EXISTS `dev_pollsq`;

CREATE TABLE `dev_pollsq` (
  `pollq_id` int(10) NOT NULL auto_increment,
  `pollq_question` varchar(200) NOT NULL default '',
  `pollq_timestamp` varchar(20) NOT NULL default '',
  `pollq_totalvotes` int(10) NOT NULL default '0',
  `pollq_active` tinyint(1) NOT NULL default '1',
  `pollq_expiry` varchar(20) NOT NULL default '',
  `pollq_multiple` tinyint(3) NOT NULL default '0',
  `pollq_totalvoters` int(10) NOT NULL default '0',
  PRIMARY KEY  (`pollq_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_postmeta` */

DROP TABLE IF EXISTS `dev_postmeta`;

CREATE TABLE `dev_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL auto_increment,
  `post_id` bigint(20) unsigned NOT NULL default '0',
  `meta_key` varchar(255) default NULL,
  `meta_value` longtext,
  PRIMARY KEY  (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM AUTO_INCREMENT=1283 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_posts` */

DROP TABLE IF EXISTS `dev_posts`;

CREATE TABLE `dev_posts` (
  `ID` bigint(20) unsigned NOT NULL auto_increment,
  `post_author` bigint(20) unsigned NOT NULL default '0',
  `post_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL default 'publish',
  `comment_status` varchar(20) NOT NULL default 'open',
  `ping_status` varchar(20) NOT NULL default 'open',
  `post_password` varchar(20) NOT NULL default '',
  `post_name` varchar(200) NOT NULL default '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL default '0',
  `guid` varchar(255) NOT NULL default '',
  `menu_order` int(11) NOT NULL default '0',
  `post_type` varchar(20) NOT NULL default 'post',
  `post_mime_type` varchar(100) NOT NULL default '',
  `comment_count` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=849 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_slp_rep_query` */

DROP TABLE IF EXISTS `dev_slp_rep_query`;

CREATE TABLE `dev_slp_rep_query` (
  `slp_repq_id` bigint(20) unsigned NOT NULL auto_increment,
  `slp_repq_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `slp_repq_query` varchar(255) NOT NULL,
  `slp_repq_tags` varchar(255) default NULL,
  `slp_repq_address` varchar(255) default NULL,
  `slp_repq_radius` varchar(5) default NULL,
  PRIMARY KEY  (`slp_repq_id`),
  KEY `slp_repq_time` (`slp_repq_time`),
  KEY `slp_repq_time_2` (`slp_repq_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_slp_rep_query_results` */

DROP TABLE IF EXISTS `dev_slp_rep_query_results`;

CREATE TABLE `dev_slp_rep_query_results` (
  `slp_repqr_id` bigint(20) unsigned NOT NULL auto_increment,
  `slp_repq_id` bigint(20) unsigned NOT NULL,
  `sl_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`slp_repqr_id`),
  KEY `slp_repq_id` (`slp_repq_id`),
  KEY `slp_repq_id_2` (`slp_repq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_store_locator` */

DROP TABLE IF EXISTS `dev_store_locator`;

CREATE TABLE `dev_store_locator` (
  `sl_id` mediumint(8) unsigned NOT NULL auto_increment,
  `sl_store` varchar(255) default NULL,
  `sl_address` varchar(255) default NULL,
  `sl_address2` varchar(255) default NULL,
  `sl_city` varchar(255) default NULL,
  `sl_state` varchar(255) default NULL,
  `sl_zip` varchar(255) default NULL,
  `sl_country` varchar(255) default NULL,
  `sl_latitude` varchar(255) default NULL,
  `sl_longitude` varchar(255) default NULL,
  `sl_tags` mediumtext,
  `sl_description` text,
  `sl_email` varchar(255) default NULL,
  `sl_url` varchar(255) default NULL,
  `sl_hours` varchar(255) default NULL,
  `sl_phone` varchar(255) default NULL,
  `sl_image` varchar(255) default NULL,
  `sl_private` varchar(1) default NULL,
  `sl_neat_title` varchar(255) default NULL,
  `sl_linked_postid` int(11) default NULL,
  `sl_pages_url` varchar(255) default NULL,
  `sl_pages_on` varchar(1) default NULL,
  `sl_lastupdated` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`sl_id`),
  KEY `sl_store` (`sl_store`),
  KEY `sl_longitude` (`sl_longitude`),
  KEY `sl_latitude` (`sl_latitude`),
  KEY `sl_store_2` (`sl_store`),
  KEY `sl_longitude_2` (`sl_longitude`),
  KEY `sl_latitude_2` (`sl_latitude`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_term_relationships` */

DROP TABLE IF EXISTS `dev_term_relationships`;

CREATE TABLE `dev_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL default '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL default '0',
  `term_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_term_taxonomy` */

DROP TABLE IF EXISTS `dev_term_taxonomy`;

CREATE TABLE `dev_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL auto_increment,
  `term_id` bigint(20) unsigned NOT NULL default '0',
  `taxonomy` varchar(32) NOT NULL default '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL default '0',
  `count` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_terms` */

DROP TABLE IF EXISTS `dev_terms`;

CREATE TABLE `dev_terms` (
  `term_id` bigint(20) unsigned NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `slug` varchar(200) NOT NULL default '',
  `term_group` bigint(10) NOT NULL default '0',
  PRIMARY KEY  (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_the_welcomizer` */

DROP TABLE IF EXISTS `dev_the_welcomizer`;

CREATE TABLE `dev_the_welcomizer` (
  `id` int(11) NOT NULL auto_increment,
  `export_id` varchar(13) NOT NULL default '',
  `section_id` varchar(22) NOT NULL default 'home',
  `status` tinyint(3) NOT NULL default '0',
  `type` varchar(5) NOT NULL default 'id',
  `layer_id` varchar(50) NOT NULL default '',
  `on_event` varchar(15) NOT NULL default '',
  `lock_event` tinyint(3) NOT NULL default '1',
  `start_delay` varchar(100) NOT NULL default '0',
  `duration` varchar(100) NOT NULL default '0',
  `output` varchar(1) NOT NULL default 'b',
  `output_pos` varchar(1) NOT NULL default 'b',
  `javascript` text NOT NULL,
  `start_top_pos_sign` varchar(1) NOT NULL default '',
  `start_top_pos` int(5) default NULL,
  `start_top_pos_format` varchar(2) NOT NULL default 'px',
  `start_left_pos_sign` varchar(1) NOT NULL default '',
  `start_left_pos` int(5) default NULL,
  `start_left_pos_format` varchar(2) NOT NULL default 'px',
  `position` varchar(8) NOT NULL default '',
  `zindex` varchar(5) NOT NULL default '',
  `easing_a` varchar(20) NOT NULL default 'swing',
  `easing_b` varchar(20) NOT NULL default 'swing',
  `move_top_pos_sign_a` varchar(1) NOT NULL default '',
  `move_top_pos_a` int(5) default NULL,
  `move_top_pos_format_a` varchar(2) NOT NULL default 'px',
  `move_left_pos_sign_a` varchar(1) NOT NULL default '',
  `move_left_pos_a` int(5) default NULL,
  `move_left_pos_format_a` varchar(2) NOT NULL default 'px',
  `move_top_pos_sign_b` varchar(1) NOT NULL default '',
  `move_top_pos_b` int(5) default NULL,
  `move_top_pos_format_b` varchar(2) NOT NULL default 'px',
  `move_left_pos_sign_b` varchar(1) NOT NULL default '',
  `move_left_pos_b` int(5) default NULL,
  `move_left_pos_format_b` varchar(2) NOT NULL default 'px',
  `options_a` text NOT NULL,
  `options_b` text NOT NULL,
  `extra_js_a` text NOT NULL,
  `extra_js_b` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_usermeta` */

DROP TABLE IF EXISTS `dev_usermeta`;

CREATE TABLE `dev_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL auto_increment,
  `user_id` bigint(20) unsigned NOT NULL default '0',
  `meta_key` varchar(255) default NULL,
  `meta_value` longtext,
  PRIMARY KEY  (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_users` */

DROP TABLE IF EXISTS `dev_users`;

CREATE TABLE `dev_users` (
  `ID` bigint(20) unsigned NOT NULL auto_increment,
  `user_login` varchar(60) NOT NULL default '',
  `user_pass` varchar(64) NOT NULL default '',
  `user_nicename` varchar(50) NOT NULL default '',
  `user_email` varchar(100) NOT NULL default '',
  `user_url` varchar(100) NOT NULL default '',
  `user_registered` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL default '',
  `user_status` int(11) NOT NULL default '0',
  `display_name` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_vs_current_online_users` */

DROP TABLE IF EXISTS `dev_vs_current_online_users`;

CREATE TABLE `dev_vs_current_online_users` (
  `IP` varchar(15) NOT NULL COMMENT 'IP of user which enters page',
  `time` varchar(255) NOT NULL COMMENT 'time when user enters page (unix timestamp)',
  PRIMARY KEY  (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_vs_overall_counter` */

DROP TABLE IF EXISTS `dev_vs_overall_counter`;

CREATE TABLE `dev_vs_overall_counter` (
  `id` int(11) NOT NULL auto_increment,
  `period` varchar(255) default NULL COMMENT 'period from which this record handle value: overall = NULL, weekly = weekn_number, daily = current_day',
  `visits` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wct1` */

DROP TABLE IF EXISTS `dev_wct1`;

CREATE TABLE `dev_wct1` (
  `id` int(11) NOT NULL auto_increment,
  `status` enum('active','draft','passive') NOT NULL default 'active',
  `Kategory` enum('Bar','Cantine','Company','Restaurant') default NULL,
  `Companyname` varchar(32) default NULL,
  `Street` varchar(32) default NULL,
  `PoBox` int(11) default NULL,
  `City` varchar(32) default NULL,
  `Date` int(10) default NULL,
  `picture` varchar(254) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wct3` */

DROP TABLE IF EXISTS `dev_wct3`;

CREATE TABLE `dev_wct3` (
  `id` int(11) NOT NULL auto_increment,
  `status` enum('active','draft','passive') NOT NULL default 'active',
  `nha` varchar(32) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wct_cron` */

DROP TABLE IF EXISTS `dev_wct_cron`;

CREATE TABLE `dev_wct_cron` (
  `id` int(11) NOT NULL auto_increment,
  `schedule` enum('h','t','d') NOT NULL default 'd',
  `command` text NOT NULL,
  `nextrun` int(11) NOT NULL default '0',
  `error` text,
  `active` enum('1','0') NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wct_fields` */

DROP TABLE IF EXISTS `dev_wct_fields`;

CREATE TABLE `dev_wct_fields` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) collate utf8_unicode_ci default NULL,
  `definition` varchar(32) collate utf8_unicode_ci default NULL,
  `special` enum('1','0') collate utf8_unicode_ci NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `def` (`definition`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `dev_wct_form` */

DROP TABLE IF EXISTS `dev_wct_form`;

CREATE TABLE `dev_wct_form` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `t_setup` text,
  `e_setup` text,
  `r_fields` text,
  `r_table` text,
  `r_filter` text,
  `rights` int(4) default NULL,
  `htmlview` enum('0','1') NOT NULL default '0',
  `smail` enum('0','1') NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wct_list` */

DROP TABLE IF EXISTS `dev_wct_list`;

CREATE TABLE `dev_wct_list` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `secret` varchar(32) default NULL,
  `t_setup` text,
  `e_setup` text,
  `o_setup` text,
  `sheme` enum('0','1') NOT NULL default '0',
  `overlay` enum('0','1') NOT NULL default '0',
  `headerline` enum('0','1') NOT NULL default '1',
  `header` text,
  `headersort` text,
  `vortext` text,
  `nachtext` text,
  `sort` varchar(32) NOT NULL default 'id',
  `sortB` enum('ASC','DESC') NOT NULL default 'ASC',
  `searchaddon` varchar(120) default NULL,
  `dl` enum('0','1','2','3') NOT NULL default '0',
  `rowcount` int(2) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wct_relations` */

DROP TABLE IF EXISTS `dev_wct_relations`;

CREATE TABLE `dev_wct_relations` (
  `r_id` int(11) NOT NULL auto_increment,
  `s_table` int(11) NOT NULL,
  `s_field` varchar(32) collate utf8_unicode_ci NOT NULL,
  `t_table` int(11) NOT NULL,
  `t_field` varchar(32) collate utf8_unicode_ci NOT NULL,
  `z_field` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`r_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `dev_wct_setup` */

DROP TABLE IF EXISTS `dev_wct_setup`;

CREATE TABLE `dev_wct_setup` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL default '',
  `table_id` int(11) NOT NULL,
  `t_setup` text,
  `e_setup` text,
  `o_setup` text,
  `sheme` enum('0','1') NOT NULL default '0',
  `overlay` enum('0','1') NOT NULL default '0',
  `headerline` enum('0','1') NOT NULL default '1',
  `header` text,
  `headersort` text,
  `vortext` text,
  `nachtext` text,
  `sort` varchar(32) NOT NULL default 'id',
  `sortB` enum('ASC','DESC') NOT NULL default 'ASC',
  `searchaddon` varchar(120) default NULL,
  `dl` enum('0','1','2','3') NOT NULL default '0',
  `rowcount` int(2) default '1',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wpj_categories` */

DROP TABLE IF EXISTS `dev_wpj_categories`;

CREATE TABLE `dev_wpj_categories` (
  `c_id` int(11) NOT NULL auto_increment,
  `cp_id` int(5) unsigned NOT NULL default '0',
  `c_title` varchar(128) NOT NULL default '',
  `c_img` varchar(150) NOT NULL default '',
  `c_sort` int(5) NOT NULL default '0',
  `c_affprice` int(5) NOT NULL default '0',
  PRIMARY KEY  (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wpj_companies` */

DROP TABLE IF EXISTS `dev_wpj_companies`;

CREATE TABLE `dev_wpj_companies` (
  `c_id` int(11) NOT NULL auto_increment,
  `c_name` varchar(128) NOT NULL default '',
  `c_address` varchar(128) NOT NULL default '',
  `c_address2` varchar(128) NOT NULL default '',
  `c_city` varchar(128) NOT NULL default '',
  `c_state` varchar(128) NOT NULL default '',
  `c_zip` varchar(20) NOT NULL default '',
  `c_phone` varchar(32) NOT NULL default '',
  `c_fax` varchar(32) NOT NULL default '',
  `c_url` varchar(150) NOT NULL default '',
  `c_img` varchar(150) NOT NULL default '',
  `c_usid` varchar(6) NOT NULL default '',
  `c_author_ip` varchar(6) NOT NULL default '',
  `c_author` varchar(6) NOT NULL default '',
  `c_contact` text NOT NULL,
  `c_date_added` int(10) NOT NULL default '0',
  PRIMARY KEY  (`c_id`),
  KEY `c_name` (`c_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wpj_created_resumes` */

DROP TABLE IF EXISTS `dev_wpj_created_resumes`;

CREATE TABLE `dev_wpj_created_resumes` (
  `cr_id` int(11) NOT NULL auto_increment,
  `cl_id` int(11) NOT NULL default '0',
  `cr_made_resume` text NOT NULL,
  `cr_date` int(10) NOT NULL default '0',
  `cr_usid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cr_id`),
  KEY `cr_id` (`cr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wpj_job` */

DROP TABLE IF EXISTS `dev_wpj_job`;

CREATE TABLE `dev_wpj_job` (
  `l_id` int(11) NOT NULL auto_increment,
  `lc_id` int(11) NOT NULL default '0',
  `l_title` varchar(128) NOT NULL default '',
  `l_status` int(3) NOT NULL default '0',
  `l_expire` int(3) default NULL,
  `l_type` varchar(128) NOT NULL default '',
  `l_company` varchar(128) NOT NULL default '',
  `l_desctext` text NOT NULL,
  `l_requirements` text NOT NULL,
  `l_tel` varchar(32) default NULL,
  `l_price` varchar(128) NOT NULL default '',
  `l_typeprice` varchar(128) NOT NULL default '',
  `l_contactinfo` mediumtext NOT NULL,
  `l_date` varchar(64) default NULL,
  `l_email` varchar(128) NOT NULL default '',
  `l_submitter` varchar(60) NOT NULL default '',
  `l_usid` varchar(6) NOT NULL default '',
  `l_town` varchar(128) NOT NULL default '',
  `l_state` varchar(128) NOT NULL default '',
  `l_valid` varchar(11) NOT NULL default '',
  `l_photo` varchar(128) NOT NULL default '',
  `l_view` int(5) NOT NULL default '0',
  `l_author_ip` varchar(16) NOT NULL default '',
  `l_fax` varchar(32) default NULL,
  PRIMARY KEY  (`l_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wpj_pictures` */

DROP TABLE IF EXISTS `dev_wpj_pictures`;

CREATE TABLE `dev_wpj_pictures` (
  `p_img` int(11) NOT NULL auto_increment,
  `p_title` varchar(255) NOT NULL,
  `p_date_added` int(10) NOT NULL default '0',
  `p_date_modified` int(10) NOT NULL default '0',
  `pl_id` int(11) NOT NULL default '0',
  `p_uid_owner` varchar(50) NOT NULL,
  `p_url` text NOT NULL,
  PRIMARY KEY  (`p_img`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wpj_price` */

DROP TABLE IF EXISTS `dev_wpj_price`;

CREATE TABLE `dev_wpj_price` (
  `p_id` int(11) NOT NULL auto_increment,
  `p_nom` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`p_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wpj_replies` */

DROP TABLE IF EXISTS `dev_wpj_replies`;

CREATE TABLE `dev_wpj_replies` (
  `rp_id` int(11) NOT NULL default '0',
  `rl_id` int(11) NOT NULL default '0',
  `rp_title` varchar(128) NOT NULL default '',
  `rp_date` int(10) NOT NULL default '0',
  `rp_submitter` varchar(60) NOT NULL default '',
  `rp_message` text NOT NULL,
  `rp_resume` varchar(128) NOT NULL default '',
  `rp_tele` varchar(32) NOT NULL default '',
  `rp_email` varchar(128) NOT NULL default '',
  `rp_usid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`rp_id`),
  KEY `lid` (`rl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wpj_res_categories` */

DROP TABLE IF EXISTS `dev_wpj_res_categories`;

CREATE TABLE `dev_wpj_res_categories` (
  `rc_id` int(11) NOT NULL auto_increment,
  `rcp_id` int(5) unsigned NOT NULL default '0',
  `rc_title` varchar(128) NOT NULL default '',
  `rc_img` varchar(150) NOT NULL default '',
  `rc_sort` int(5) NOT NULL default '0',
  `rc_affprice` int(5) NOT NULL default '0',
  PRIMARY KEY  (`rc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wpj_type` */

DROP TABLE IF EXISTS `dev_wpj_type`;

CREATE TABLE `dev_wpj_type` (
  `t_id` int(11) NOT NULL auto_increment,
  `t_nom` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`t_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `dev_wppartner_links` */

DROP TABLE IF EXISTS `dev_wppartner_links`;

CREATE TABLE `dev_wppartner_links` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL,
  `url` varchar(100) collate utf8_unicode_ci NOT NULL,
  `image` varchar(100) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `gia_bang_gia` */

DROP TABLE IF EXISTS `gia_bang_gia`;

CREATE TABLE `gia_bang_gia` (
  `ma_bang_gia` int(11) NOT NULL auto_increment,
  `ma_dich_vu` varchar(30) character set utf8 collate utf8_unicode_ci NOT NULL,
  `ma_tinh_di` varchar(30) character set utf8 collate utf8_unicode_ci NOT NULL COMMENT 'Ma tinh di',
  `ma_tinh_den` varchar(500) character set utf8 collate utf8_unicode_ci NOT NULL COMMENT 'Danh sach ma tinh den cach nhau bang dau phau {,}',
  `khoi_luong_tu` int(11) NOT NULL COMMENT 'gram',
  `khoi_luong_den` int(11) NOT NULL COMMENT 'gram',
  `ma_phuong_tien` varchar(30) character set utf8 collate utf8_unicode_ci default NULL,
  `gia` decimal(20,0) NOT NULL COMMENT 'VND',
  `co_vuot_khoi_luong` int(1) default '0' COMMENT '0/1 Gia tinh theo don vi',
  `don_vi_khoi_luong_vuot` int(10) default NULL COMMENT 'Gia tinh theo don vi',
  `gia_toi_da_can_tren` decimal(20,0) default NULL COMMENT 'Neu gia tinh theo don vi lon hon gia toi da thi lay gia toi da',
  `gia_cong_them_gui_sau_12h` decimal(20,0) default NULL COMMENT 'Ap dung chuyen phat nhanh tp_hcm di ha_noi gui sau 12h',
  `gia_toi_da_can_tren_gui_sau_12h` decimal(20,0) default NULL COMMENT 'Neu gia tinh theo don vi lon hon gia toi da thi lay gia toi da gui sau 12',
  PRIMARY KEY  (`ma_bang_gia`),
  KEY `bang_gia_ma_dich_vu_fk` (`ma_dich_vu`),
  KEY `bang_gia_ma_tinh_di` (`ma_tinh_di`),
  KEY `bang_gia_ma_tinh_den` (`ma_tinh_den`(255)),
  KEY `bang_gia_ma_phuong_tien` (`ma_phuong_tien`)
) ENGINE=MyISAM AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;

/*Table structure for table `gia_dich_vu` */

DROP TABLE IF EXISTS `gia_dich_vu`;

CREATE TABLE `gia_dich_vu` (
  `ma_dich_vu` varchar(30) character set utf8 collate utf8_unicode_ci NOT NULL,
  `ten_dich_vu` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL,
  `thoi_gian_van_chuyen` varchar(300) character set utf8 collate utf8_unicode_ci default NULL,
  `mo_ta` text character set utf8 collate utf8_unicode_ci,
  `la_dich_vu_cong_them` int(1) unsigned NOT NULL default '0' COMMENT '0/1',
  `gia_cong_them` decimal(20,0) default NULL COMMENT 'VND',
  `ti_le_cong_them` double default NULL COMMENT '%',
  PRIMARY KEY  (`ma_dich_vu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gia_khu_vuc` */

DROP TABLE IF EXISTS `gia_khu_vuc`;

CREATE TABLE `gia_khu_vuc` (
  `ma_khu_vuc` varchar(30) character set utf8 collate utf8_unicode_ci NOT NULL,
  `ten_khu_vuc` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`ma_khu_vuc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gia_loai_hang_hoa` */

DROP TABLE IF EXISTS `gia_loai_hang_hoa`;

CREATE TABLE `gia_loai_hang_hoa` (
  `ma_loai_hang_hoa` varchar(30) character set utf8 collate utf8_unicode_ci NOT NULL,
  `ten_loai_hang_hoa` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`ma_loai_hang_hoa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gia_phu_thu_khoang_cach` */

DROP TABLE IF EXISTS `gia_phu_thu_khoang_cach`;

CREATE TABLE `gia_phu_thu_khoang_cach` (
  `ma_phu_thu_khoang_cach` int(11) NOT NULL auto_increment,
  `ma_bang_gia` int(11) NOT NULL,
  `khoi_luong_tu` int(11) default NULL COMMENT 'gram',
  `khoi_luong_den` int(11) default NULL COMMENT 'gram',
  `khoang_cach_tu` int(11) default NULL COMMENT 'km',
  `khoang_cach_den` int(11) default NULL COMMENT 'km',
  `gia_cong_them` decimal(20,0) default NULL COMMENT 'VND',
  `ti_le_cong_them` decimal(10,0) default NULL COMMENT '%',
  PRIMARY KEY  (`ma_phu_thu_khoang_cach`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gia_phuong_tien` */

DROP TABLE IF EXISTS `gia_phuong_tien`;

CREATE TABLE `gia_phuong_tien` (
  `ma_phuong_tien` varchar(30) NOT NULL,
  `ten_phuong_tien` varchar(200) default NULL,
  PRIMARY KEY  (`ma_phuong_tien`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gia_tinh_thanh_pho` */

DROP TABLE IF EXISTS `gia_tinh_thanh_pho`;

CREATE TABLE `gia_tinh_thanh_pho` (
  `ma_tinh` varchar(30) character set utf8 collate utf8_unicode_ci NOT NULL,
  `ten_tinh` varchar(200) character set utf8 collate utf8_unicode_ci default NULL,
  `ma_khu_vuc` varchar(30) character set utf8 collate utf8_unicode_ci default NULL,
  `vi_tri_x` int(11) default NULL,
  `vi_tri_y` int(11) default NULL,
  `trung_tam_tinh` varchar(200) character set utf8 collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`ma_tinh`),
  KEY `ma_khu_vuc_fk` (`ma_khu_vuc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gia_van_chuyen` */

DROP TABLE IF EXISTS `gia_van_chuyen`;

CREATE TABLE `gia_van_chuyen` (
  `ma_van_chuyen` int(20) NOT NULL auto_increment,
  `ma_loai_hang_hoa` varchar(30) character set utf8 collate utf8_unicode_ci default NULL,
  `ten_hang_hoa` varchar(200) character set utf8 collate utf8_unicode_ci default NULL COMMENT 'Neu hang hoa khong nam trong danh muc thi nhap ten hang hoa vao muc nay',
  `ma_tinh_di` varchar(30) character set utf8 collate utf8_unicode_ci default NULL,
  `ma_van_phong_di` varchar(30) character set utf8 collate utf8_unicode_ci default NULL COMMENT 'Ho tro tu dong lay ma van phong khi chon tinh',
  `ma_tinh_den` varchar(30) character set utf8 collate utf8_unicode_ci default NULL,
  `ma_van_phong_den` varchar(30) character set utf8 collate utf8_unicode_ci default NULL COMMENT 'Ho tro tu dong lay ma van phong khi chon tinh',
  `ma_tinh_den_2` varchar(30) character set utf8 collate utf8_unicode_ci default NULL,
  `ma_van_phong_den_2` varchar(30) character set utf8 collate utf8_unicode_ci default NULL COMMENT 'Ho tro tu dong lay ma van phong khi chon tinh',
  `khoi_luong` int(11) default NULL COMMENT 'gram',
  `chieu_cao` int(11) default NULL COMMENT 'cm',
  `chieu_dai` int(11) default NULL COMMENT 'cm',
  `chieu_rong` int(11) default NULL COMMENT 'cm',
  `ghi_chu` text character set utf8 collate utf8_unicode_ci,
  `ngay_nhan_hang` datetime default NULL,
  `ngay_giao_hang` datetime default NULL,
  PRIMARY KEY  (`ma_van_chuyen`),
  KEY `van_chuyen_ma_loai_hh_fk` (`ma_loai_hang_hoa`),
  KEY `van_chuyen_ma_tinh_di_fk` (`ma_tinh_di`),
  KEY `van_chuyen_ma_tinh_den_fk` (`ma_tinh_den`),
  KEY `van_chuyen_ma_tinh_den_2_fk` (`ma_tinh_den_2`),
  KEY `van_chuyen_ma_vp_di_fk` (`ma_van_phong_di`),
  KEY `van_chuyen_ma_vp_den_fk` (`ma_van_phong_den`),
  KEY `van_chuyen_ma_vp_den_2_fk` (`ma_van_phong_den_2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gia_van_chuyen_dich_vu` */

DROP TABLE IF EXISTS `gia_van_chuyen_dich_vu`;

CREATE TABLE `gia_van_chuyen_dich_vu` (
  `ma_van_chuyen_dich_vu` int(20) NOT NULL auto_increment,
  `ma_van_chuyen` int(20) NOT NULL,
  `ma_dich_vu` varchar(30) character set utf8 collate utf8_unicode_ci NOT NULL,
  `ghi_chu` text character set utf8 collate utf8_unicode_ci,
  `gia` decimal(20,0) default NULL,
  PRIMARY KEY  (`ma_van_chuyen_dich_vu`),
  KEY `ma_van_chuyen_fk` (`ma_van_chuyen`),
  KEY `ma_dich_vu_fk` (`ma_dich_vu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gia_van_chuyen_dn` */

DROP TABLE IF EXISTS `gia_van_chuyen_dn`;

CREATE TABLE `gia_van_chuyen_dn` (
  `ma_van_chuyen` int(20) NOT NULL auto_increment,
  `ma_dich_vu` varchar(30) character set utf8 collate utf8_unicode_ci default NULL,
  `ma_tinh_di` varchar(30) character set utf8 collate utf8_unicode_ci default NULL,
  `ma_tinh_den` varchar(30) character set utf8 collate utf8_unicode_ci default NULL,
  `khoi_luong` int(11) default '0' COMMENT 'gram',
  `cuoc_phi` bigint(20) default '0',
  `phu_thu` bigint(20) default '0',
  `tong` bigint(20) default '0',
  `ghi_chu` text character set utf8 collate utf8_unicode_ci,
  `ngay` datetime default NULL,
  `ck_sale` varchar(200) character set utf8 collate utf8_unicode_ci default NULL,
  `ma_khach_hang` varchar(30) character set utf8 collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`ma_van_chuyen`),
  KEY `van_chuyen_ma_dich_vu_fk` (`ma_dich_vu`),
  KEY `van_chuyen_ma_tinh_di_fk` (`ma_tinh_di`),
  KEY `van_chuyen_ma_tinh_den_fk` (`ma_tinh_den`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `gia_van_phong` */

DROP TABLE IF EXISTS `gia_van_phong`;

CREATE TABLE `gia_van_phong` (
  `ma_van_phong` varchar(30) NOT NULL,
  `ten_van_phong` varchar(200) NOT NULL,
  `dia_chi` varchar(200) default NULL,
  `dien_thoai` varchar(30) default NULL,
  `fax` varchar(30) default NULL,
  `hotline` varchar(30) default NULL,
  `ma_tinh` varchar(30) default NULL,
  PRIMARY KEY  (`ma_van_phong`),
  KEY `ma_tinh_fk` (`ma_tinh`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Function  structure for function  `fn_cap_nhat_gia_toi_da_can_tren` */

/*!50003 DROP FUNCTION IF EXISTS `fn_cap_nhat_gia_toi_da_can_tren` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_cap_nhat_gia_toi_da_can_tren`() RETURNS varchar(200) CHARSET utf8
    DETERMINISTIC
BEGIN
	
	update gia_bang_gia
	set gia_toi_da_can_tren=fn_tinh_gia_toi_da_can_tren(`ma_dich_vu`,`ma_tinh_di`,`ma_tinh_den`,`khoi_luong_tu`)	
	WHERE co_vuot_khoi_luong=1
	order by ma_dich_vu,ma_tinh_di,ma_tinh_den,khoi_luong_tu; 
	UPDATE gia_bang_gia
	SET gia_toi_da_can_tren_gui_sau_12h=fn_tinh_gia_toi_da_can_tren_gui_sau_12h(`ma_dich_vu`,`ma_tinh_di`,`ma_tinh_den`,`khoi_luong_tu`)	
	WHERE co_vuot_khoi_luong=1 and gia_cong_them_gui_sau_12h>0
	ORDER BY ma_dich_vu,ma_tinh_di,ma_tinh_den,khoi_luong_tu; 
		
	return '1';
	
END */$$
DELIMITER ;

/* Function  structure for function  `fn_tinh_gia` */

/*!50003 DROP FUNCTION IF EXISTS `fn_tinh_gia` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_tinh_gia`(
	p_ma_dich_vu varchar(30),
	p_ma_tinh_di varchar(30),
	p_ma_tinh_den varchar(30),
	p_khoi_luong int,
	p_gui_sau_12h int
	) RETURNS decimal(20,0)
    DETERMINISTIC
BEGIN
	DECLARE d_gia DECIMAL(20,0);
	DECLARE d_co_vuot_khoi_luong INT;	
	DECLARE d_don_vi_khoi_luong_vuot INT;
	DECLARE d_gia_toi_da_can_tren DECIMAL(20,0);
	DECLARE d_gia_cong_them_gui_sau_12h DECIMAL(20,0);
	DECLARE d_gia_toi_da_can_tren_gui_sau_12h DECIMAL(20,0);
	DECLARE d_khoi_luong_tu INT;
	
	select gia,co_vuot_khoi_luong,don_vi_khoi_luong_vuot,gia_toi_da_can_tren,gia_cong_them_gui_sau_12h,gia_toi_da_can_tren_gui_sau_12h,khoi_luong_tu
		into d_gia,d_co_vuot_khoi_luong,d_don_vi_khoi_luong_vuot,d_gia_toi_da_can_tren,d_gia_cong_them_gui_sau_12h,d_gia_toi_da_can_tren_gui_sau_12h,d_khoi_luong_tu
	FROM gia_bang_gia
	WHERE ma_dich_vu = p_ma_dich_vu
		and ma_tinh_di = p_ma_tinh_di 
		AND ma_tinh_den LIKE CONCAT('%,',p_ma_tinh_den,',%')
		and p_khoi_luong >= khoi_luong_tu
		and p_khoi_luong <= khoi_luong_den
	limit 1; 
	
	if d_co_vuot_khoi_luong=1 then
	begin
		IF d_gia_cong_them_gui_sau_12h > 0 && p_gui_sau_12h = 1 THEN
		BEGIN
			SET d_gia = d_gia_cong_them_gui_sau_12h;
			SET d_gia_toi_da_can_tren = d_gia_toi_da_can_tren_gui_sau_12h;
		END;
		END IF;	
	
		RETURN d_gia_toi_da_can_tren + ceil((p_khoi_luong-d_khoi_luong_tu+1) / d_don_vi_khoi_luong_vuot) * d_gia;
	end;
	end if;
	return d_gia;
END */$$
DELIMITER ;

/* Function  structure for function  `fn_tinh_gia_toi_da_can_tren` */

/*!50003 DROP FUNCTION IF EXISTS `fn_tinh_gia_toi_da_can_tren` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_tinh_gia_toi_da_can_tren`(
	p_ma_dich_vu VARCHAR(30),
	p_ma_tinh_di varchar(30),
	p_ma_tinh_den varchar(500),
	p_khoi_luong_tu int
	) RETURNS decimal(20,0)
    DETERMINISTIC
BEGIN
	DECLARE d_gia DECIMAL(20,0);
	DECLARE d_co_vuot_khoi_luong INT;	
	DECLARE d_don_vi_khoi_luong_vuot INT;
	DECLARE d_khoi_luong_tu INT;
	DECLARE d_khoi_luong_den INT;
	DECLARE d_gia_max_can_tren DECIMAL(20,0);
	
	select gia,co_vuot_khoi_luong,don_vi_khoi_luong_vuot,khoi_luong_tu,khoi_luong_den,gia_toi_da_can_tren
		into d_gia,d_co_vuot_khoi_luong,d_don_vi_khoi_luong_vuot,d_khoi_luong_tu,d_khoi_luong_den,d_gia_max_can_tren
	FROM gia_bang_gia
	WHERE ma_dich_vu=p_ma_dich_vu
		and ma_tinh_di=p_ma_tinh_di 
		AND ma_tinh_den=p_ma_tinh_den
		and khoi_luong_den=p_khoi_luong_tu-1
	limit 1; 
	
	if d_co_vuot_khoi_luong=1 then
	begin		
		RETURN d_gia_max_can_tren + ceil((d_khoi_luong_den-d_khoi_luong_tu+1) / d_don_vi_khoi_luong_vuot) * d_gia;
	end;
	end if;
	return d_gia;
END */$$
DELIMITER ;

/* Function  structure for function  `fn_tinh_gia_toi_da_can_tren_gui_sau_12h` */

/*!50003 DROP FUNCTION IF EXISTS `fn_tinh_gia_toi_da_can_tren_gui_sau_12h` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_tinh_gia_toi_da_can_tren_gui_sau_12h`(
	p_ma_dich_vu VARCHAR(30),
	p_ma_tinh_di varchar(30),
	p_ma_tinh_den varchar(500),
	p_khoi_luong_tu int
	) RETURNS decimal(20,0)
    DETERMINISTIC
BEGIN
	DECLARE d_gia DECIMAL(20,0);
	DECLARE d_co_vuot_khoi_luong INT;	
	DECLARE d_don_vi_khoi_luong_vuot INT;
	DECLARE d_khoi_luong_tu INT;
	DECLARE d_khoi_luong_den INT;
	DECLARE d_gia_max_can_tren DECIMAL(20,0);
	DECLARE d_gia_cong_them_gui_sau_12h DECIMAL(20,0);
	DECLARE d_gia_max_can_tren_gui_sau_12h DECIMAL(20,0);
	
	select gia,co_vuot_khoi_luong,don_vi_khoi_luong_vuot,khoi_luong_tu,khoi_luong_den,gia_toi_da_can_tren,gia_cong_them_gui_sau_12h,gia_toi_da_can_tren_gui_sau_12h
		into d_gia,d_co_vuot_khoi_luong,d_don_vi_khoi_luong_vuot,d_khoi_luong_tu,d_khoi_luong_den,d_gia_max_can_tren,d_gia_cong_them_gui_sau_12h,d_gia_max_can_tren_gui_sau_12h
	FROM gia_bang_gia
	WHERE ma_dich_vu=p_ma_dich_vu
		and ma_tinh_di=p_ma_tinh_di 
		AND ma_tinh_den=p_ma_tinh_den
		and khoi_luong_den=p_khoi_luong_tu-1
	limit 1; 
	
	if d_co_vuot_khoi_luong=1 then
	begin
		if d_gia_cong_them_gui_sau_12h > 0 then
		begin
			set d_gia = d_gia_cong_them_gui_sau_12h;
			set d_gia_max_can_tren = d_gia_max_can_tren_gui_sau_12h;
		end;
		end if;
		
		RETURN d_gia_max_can_tren + ceil((d_khoi_luong_den-d_khoi_luong_tu+1) / d_don_vi_khoi_luong_vuot) * d_gia;
	end;
	end if;
	return d_gia;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
