<?php

include 'common.php';
add_action('wp_footer', 'bota_check_request');

function bota_check_request() {
    global $wpdb, $post;

    include 'framework.php';
    $frame = new botaFramework($wpdb, FALSE);
    
    $knownBots = unserialize($frame->bridge->get_option('bota_bots'));
    
    foreach ($knownBots as $bot) {
        if (stripos($_SERVER['HTTP_USER_AGENT'], $bot['mask']) !== FALSE) {
            if (!empty($bot['rdns'])) {
                if ($bot['rdns'] == botaCommon::getDomain('http://' . gethostbyaddr($_SERVER['REMOTE_ADDR']))) {
                    $frame->bridge->log_access($bot, $post);
                    $frame->send_alert($bot);
                }
            } else {
                $frame->bridge->log_access($bot, $post);
                $frame->send_alert($bot);
            }
        }
    }
}