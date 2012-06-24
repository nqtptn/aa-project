<?php

// Since we're not being controlled by WordPress here, we can include the config file
// and manage our own database connections. Since WordPress wants to include everything in
// the plugin folder, we'll skip over this part if WordPress is calling it.

include 'bota_config.php';
include '../include/framework.php';

try {

    $database = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME, DB_USER, DB_PASSWORD);
    $database->exec('SET CHARACTER SET utf8');
} catch (PDOException $e) {

    echo '[SQL Error] Unable to connect to server :: ' . $e->getMessage();
    die();
}

$frame = new botaFramework($database, TRUE);

// Fetch a list of our bots, and find out which one it matches
$knownBots = unserialize(unserialize($frame->bridge->get_option('bota_bots')));

foreach ($knownBots as $bot) {

    // Match the user agent against our bot mask list
    if (stripos($_SERVER['HTTP_USER_AGENT'], $bot['mask']) !== FALSE) {

        // If we have a Reverse DNS rule, make sure this request matches.
        if (!empty($bot['rdns'])) {
            if ($bot['rdns'] == botaCommon::getDomain('http://' . gethostbyaddr($_SERVER['REMOTE_ADDR']))) {
                $frame->bridge->log_access($bot);
                $frame->send_alert($bot);
            }
        } else {
            $frame->bridge->log_access($bot);
            $frame->send_alert($bot);
        }
    }
}

header('Content-type: image/gif');
echo file_get_contents('track.gif');