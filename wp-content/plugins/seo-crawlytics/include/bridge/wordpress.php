<?php

class botaBridge {
    
    public function __construct($database = NULL) {

        // Check out database handle has been provided for us
        if (!$database) {
            throw new Exception('[ERROR] Invalid database handle passed to \bota\Bridge');
        } else {
            $this->database = $database;
        }

        include 'common.php';
    }

    public function log_access($botDetails, $page) {

        if (empty($_SERVER['HTTP_REFERER'])) {
            $botDetails['referral'] = '';
            $botDetails['url']      = botaCommon::getCurrentURI();
        } else {
            $botDetails['referral'] = $_SERVER['HTTP_REFERER'];
            $botDetails['url']      = $_SERVER['HTTP_REFERER'];
        }

        $pageID = (!empty($page)) ? $page->ID : NULL;

        $sql = 'INSERT INTO `' . $this->database->prefix . 'plugin_bota` (`visited_ip`, `visited_uri`, `visited_by`, `visited_referral`, `visited_page`) VALUES (INET_ATON(%s), %s, %s, %s, %d);';
        $this->database->query($this->database->prepare($sql, $_SERVER['REMOTE_ADDR'], $botDetails['url'], $botDetails['name'], $botDetails['referral'], $pageID));

    }

    public function get_option($option) {
        return get_option($option);
    }
    
}