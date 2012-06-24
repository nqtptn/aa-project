<?php

class botaFramework {
    
    public $bridge;

    private $database;
    
    public function __construct($database = NULL, $external = FALSE) {

        // Check out database handle has been provided for us
        if (!$database) {
            throw new Exception('[ERROR] Invalid database handle passed to \bota\Bridge');
        } else {
            $this->database = $database;
        }
        
        // Since our plugin has a script that operates outside of WordPress
        // we want to be able to reuse this class using WordPress functions
        // when called within WordPress and PDO functions when otherwise.
        include ($external) ? 'bridge/external.php' : 'bridge/wordpress.php';
        $this->bridge = new botaBridge($this->database);
        
    }

    public function send_alert(array $bot) {

        // If alerts are active and set to immediate notification
        if ($this->bridge->get_option('bota_alerts') == 1 && $this->bridge->get_option('bota_alert_type') == 0) {
            
            $emails = explode(',', $this->bridge->get_option('bota_emails'));
            $subject = $this->bridge->get_option('bota_email_subject');
            $message = $this->bridge->get_option('bota_email_message');
            
            $subject = str_replace('{bot}', $bot['name'], $subject);
            $subject = str_replace('{mask}', $bot['mask'], $subject);
            $subject = str_replace('{url}', botaCommon::getCurrentURI(), $subject);
            $subject = str_replace('{refer}', $_SERVER["HTTP_REFERER"], $subject);
            $subject = str_replace('{ipaddress}', $_SERVER['REMOTE_ADDR'], $subject);
            $subject = str_replace('{time}', date('Y-m-d'), $subject);
            
            $message = str_replace('{bot}', $bot['name'], $message);
            $message = str_replace('{mask}', $bot['mask'], $message);
            $message = str_replace('{url}', botaCommon::getCurrentURI(), $message);
            $message = str_replace('{refer}', $_SERVER["HTTP_REFERER"], $message);
            $message = str_replace('{ipaddress}', $_SERVER['REMOTE_ADDR'], $message);
            $message = str_replace('{time}', date('Y-m-d'), $message);

            foreach ($emails as $email) {
                mail(trim($email), $subject, $message);
            }
        }

    }
    
}