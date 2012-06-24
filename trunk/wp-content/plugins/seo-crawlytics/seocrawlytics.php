<?php
/*
Plugin Name: SEO Crawlytics
Description: SEO Crawlytics helps you gain a better understanding of the behaviour of search engine robots on your website.
Plugin URI: http://www.elevatelocal.co.uk/seo-crawlytics
Version: 1.1.8
Author: Yousaf Sekander
Author URI: https://plus.google.com/114240873058453687530
License: GPLv2 or later
*/

define( 'BOTA_URL', plugin_dir_url(__FILE__) );
define( 'BOTA_PATH', plugin_dir_path(__FILE__) );

if (is_admin()) {
    include 'include/admin.php';
} else {
    include 'include/front.php';
}


/**
 * Function called at plugin activation
 *
 * This function could create tables, set default options, register scheduled actions etc.
 *
 */
function bota_activate() {
    global $wpdb;
    
    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    
    $sql = "CREATE TABLE IF NOT EXISTS `" . $wpdb->prefix . "plugin_bota` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `visited_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              `visited_ip` int(11) NOT NULL,
              `visited_uri` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
              `visited_by` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
              `visited_referral` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
              PRIMARY KEY (`id`),
              KEY `visited_on` (`visited_on`),
              KEY `visited_by` (`visited_by`)
            ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to contain Bot Alert plugin view page' AUTO_INCREMENT=1 ;";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);
    
    $wpdb->query('ALTER TABLE `' . $wpdb->prefix . 'plugin_bota` ADD `visited_referral` VARCHAR( 250 ) NOT NULL');
    
    $wpdb->query('ALTER TABLE `' . $wpdb->prefix . 'plugin_bota` ADD `visited_page` INT NULL DEFAULT NULL, ADD INDEX ( `visited_page` )');

    $defaultBots = array();
    $defaultBots[] = array('id' => 1, 'name' => 'GoogleBot', 'mask' => 'googlebot', 'rdns' => 'googlebot.com');
    $defaultBots[] = array('id' => 2, 'name' => 'BingBot', 'mask' => 'bingbot', 'rdns' => null);
    
    if (!get_option('bota_bots')) {
        update_option('bota_alerts', 1);
        update_option('bota_alert_type', 0);
        update_option('bota_bots', serialize($defaultBots));
        update_option('bota_emails', get_option('admin_email'));
        update_option('bota_email_subject', 'A bot has visited your site!');
        update_option('bota_email_message', 'A bot has visited your site!');
    }
    
    file_put_contents(BOTA_PATH . '/track/bota_config.php', 
            "<?php // This file is created by SEO Crawyltics and required to embed the tracking script on non-Wordpress pages
            // More details can be found in the configuration page for this plugin.
            define('DB_HOST', '" . DB_HOST . "'); define('DB_NAME', '" . DB_NAME . "'); define('DB_USER', '" . DB_USER . "'); define('DB_PASSWORD', '" . DB_PASSWORD . "'); define('DB_PREFIX', '" . $wpdb->prefix . "');");
    
    wp_schedule_event(strtotime('tomorrow midnight'), 'daily', 'bota_send_daily_report');
}

function bota_deactivate() {
    global $wpdb;
    
    wp_clear_scheduled_hook('bota_send_daily_report');
}

// Register (de)activation functions
register_activation_hook( __FILE__, 'bota_activate' );
register_deactivation_hook( __FILE__, 'bota_deactivate' );