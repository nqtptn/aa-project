<?php

class botaBridge {

    private $database;
    
    public function __construct($database = NULL) {

        // Check out database handle has been provided for us
        if (!$database) {
            throw new Exception('[ERROR] Invalid database handle passed to \bota\Bridge');
        } else {
            $this->database = $database;
        }

        include 'common.php';
    }

    public function log_access(array $botDetails) {

        if (empty($_SERVER['HTTP_REFERER'])) {
            $botDetails['referral'] = '';
            $botDetails['url']      = botaCommon::getCurrentURI();
        } else {
            $botDetails['referral'] = $_SERVER['HTTP_REFERER'];
            $botDetails['url']      = $_SERVER['HTTP_REFERER'];
        }

        $statement = $this->database->prepare('INSERT INTO `' . DB_PREFIX . 'plugin_bota` (`visited_ip`, `visited_uri`, `visited_by`, `visited_referral`) VALUES (INET_ATON(:ipaddress), :uri, :bot, :referral);');
        $statement->execute(array(':ipaddress' => $_SERVER['REMOTE_ADDR'], ':uri' => $botDetails['url'], ':bot' => $botDetails['name'], ':referral' => $botDetails['referral']));

    }

    public function get_option($option) {

        $statement = $this->database->prepare('SELECT `option_value` FROM `' . DB_PREFIX . 'options` WHERE `option_name` = :option;');
        $statement->execute(array(':option' => $option));
        $statement->setFetchMode(\PDO::FETCH_ASSOC);

        $result = $statement->fetch();
        return $result['option_value'];

    }
    
}