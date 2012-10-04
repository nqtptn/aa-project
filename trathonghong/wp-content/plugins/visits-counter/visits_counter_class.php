<?php

class visits_counter {
    
    private $online_counter_table;
    private $overall_counter_table;
    private $options_table;
    private $time_range;
    
    private $section_id;
    private $section_title;
    private $section_callback;
    private $section_page;
    
    private $online_offset_id;
    private $online_offset_title;
    private $online_offset_callback;
    private $online_offset_value;
    private $online_offset_default_value;
    
    private $overall_offset_id;
    private $overall_offset_title;
    private $overall_offset_callback;
    private $overall_offset_value;
    private $overall_offset_default_value;
    
    private $startTime_id;
    private $startTime_title;
    private $startTime_callback;
    private $startTime_value;
    private $startTime_default_value;
    
    private $startTimeFormat_id;
    private $startTimeFormat_title;
    private $startTimeFormat_callback;
    private $startTimeFormat_value;
    private $startTimeFormat_default_value;
    
    private $disconnectTime_id;
    private $disconnectTime_title;
    private $disconnectTime_callback;
    private $disconnectTime_value;
    private $disconnectTime_default_value;
    
    private $countBots_id;
    private $countBots_title;
    private $countBots_callback;
    private $countBots_value;
    private $countBots_default_value;
    
    private $countAdmins_id;
    private $countAdmins_title;
    private $countAdmins_callback;
    private $countAdmins_value;
    private $countAdmins_default_value;
    
    private $displayTotalValue_id;
    private $displayTotalValue_title;
    private $displayTotalValue_callback;
    private $displayTotalValue_value;
    private $displayTotalValue_default_value;
    
    private $displayCurrentValue_id;
    private $displayCurrentValue_title;
    private $displayCurrentValue_callback;
    private $displayCurrentValue_value;
    private $displayCurrentValue_default_value;
    
    private $displayDailyValue_id;
    private $displayDailyValue_title;
    private $displayDailyValue_callback;
    private $displayDailyValue_value;
    private $displayDailyValue_default_value;
    
    private $displayWeeklyValue_id;
    private $displayWeeklyValue_title;
    private $displayWeeklyValue_callback;
    private $displayWeeklyValue_value;
    private $displayWeeklyValue_default_value;
    
    private $options_page_name;
    
    
    /*
     * Class constructor
     * @params: $time = 120 - time range within user is online on page [in seconds]
     * @return: WP Error if time is less than 0 or none if everything is ok
     */
    public function __construct($time = 120){
        global $wpdb;
        global $table_prefix;
        $this->online_counter_table = $table_prefix."vs_current_online_users";
        $this->overall_counter_table = $table_prefix."vs_overall_counter";
        //$this->options_table = $wpdb->prefix."vs_options";
        
        $this->online_offset_id = 'vs_online_offset';
        $this->overall_offset_id = 'vs_overall_offset';
        $this->startTime_id = 'vs_startUnixTimeStamp';
        $this->startTimeFormat_id = 'vs_startTimeFormat';
        $this->disconnectTime_id = 'vs_disconnectTime';
        $this->countBots_id = 'vs_countBots';
        $this->countAdmins_id = 'vs_countAdmins';
        $this->displayTotalValue_id = 'vs_displayTotal';
        $this->displayCurrentValue_id = 'vs_displayCurrent';
        $this->displayDailyValue_id = 'vs_displayDaily';
        $this->displayWeeklyValue_id = 'vs_displayWeekly';
        
        $this->section_id = 'vs';
        
        $this->options_page_name = 'general';
        
        $this->online_offset_default_value = 0;
        $this->overall_offset_default_value = 0;
        $this->startTime_default_value = time();
        $this->startTimeFormat_default_value = "Y-m-d H:s";
        $this->disconnectTime_default_value = 300; // in seconds
        $this->countBots_default_value = 0; //false
        $this->countAdmins_default_value = 1; //true
        $this->displayTotalValue_default_value = 1; //true
        $this->displayCurrentValue_default_value = 1; //true
        $this->displayDailyValue_default_value = 0; //false
        $this->displayWeeklyValue_default_value = 0; //false
        
        if ($time < 0)
            return new WP_Error('wrong_time', "I can't check users from future. Parameter time range can't be less than 0 in visits counter plugin.");
        else
            $this->time_range = $time;
        
        load_plugin_textdomain('visits_counter', false, basename( dirname( __FILE__ ) ) . '/languages/');
    }
   

    /*
     * Installation function, it creates requires db tables if no exists
     * @params: none
     * @return: none
     */
    public function vc_installation(){
        $this->create_all_tables();
        $this->create_options();
    }
    
    /*
     * Admin options initialization
     * @params: none
     * @return: none
     */
    public function vc_adminInit(){
        register_setting($this->options_page_name, $this->online_offset_id, array($this, 'prepare_offset_value'));
        register_setting($this->options_page_name, $this->overall_offset_id, array($this, 'prepare_offset_value'));
        register_setting($this->options_page_name, $this->startTime_id, array($this, 'prepare_new_startTime'));
        register_setting($this->options_page_name, $this->startTimeFormat_id, array($this, 'prepare_startTimeFormat_value'));
        register_setting($this->options_page_name, $this->disconnectTime_id, array($this, 'prepare_disconnectTime_value'));
        register_setting($this->options_page_name, $this->countBots_id, array($this, 'prepare_bool_value'));
        register_setting($this->options_page_name, $this->countAdmins_id, array($this, 'prepare_bool_value'));
        register_setting($this->options_page_name, $this->displayTotalValue_id, array($this, 'prepare_bool_value'));
        register_setting($this->options_page_name, $this->displayCurrentValue_id, array($this, 'prepare_bool_value'));
        register_setting($this->options_page_name, $this->displayDailyValue_id, array($this, 'prepare_bool_value'));
        register_setting($this->options_page_name, $this->displayWeeklyValue_id, array($this, 'prepare_bool_value'));
        
        $this->create_options_form();
    }
    
    
    private function create_all_tables(){
        global $wpdb;
        if (function_exists('is_multisite') && is_multisite()) {
            // check if it is a network activation - if so, run the activation function for each blog id
            if (isset($_GET['networkwide']) && ($_GET['networkwide'] == 1)) {
                // Get all blog ids
                $blogids = $wpdb->get_col($wpdb->prepare("SELECT blog_id FROM $wpdb->blogs"));
                foreach ($blogids as $blog_id) {
                    if ($blog_id != 1){
                        $online_table = $wpdb->prefix.$blog_id."_".substr($this->online_counter_table, strlen($wpdb->prefix));
                        $overall_table = $wpdb->prefix.$blog_id."_".substr($this->overall_counter_table, strlen($wpdb->prefix));
                    } else {
                        $online_table = $this->online_counter_table;
                        $overall_table = $this->overall_counter_table;
                    }
                    $this->create_tables($online_table, $overall_table);
                }
                return;
            }   
        }
        $this->create_tables($this->online_counter_table, $this->overall_counter_table);
    }


    /*
     * Method which create new tables in wp db (if it is neccessary)
     * @params: none
     * @return: none
     */
    private function create_tables($online_counter_table, $overall_counter_table){
        global $wpdb;
        if ($wpdb->get_var("show tables like '$online_counter_table'") != $online_counter_table){
            $wpdb->query("CREATE TABLE IF NOT EXISTS `$online_counter_table` (
                                    `IP` varchar(15) NOT NULL COMMENT 'IP of user which enters page',
                                    `time` varchar(255) NOT NULL COMMENT 'time when user enters page (unix timestamp)',
                                PRIMARY KEY (`IP`)
                                ) ENGINE=MyISAM DEFAULT CHARSET=utf8;");
        }
        if ($wpdb->get_var("show tables like '$overall_counter_table'") != $overall_counter_table){
            $wpdb->query("CREATE TABLE IF NOT EXISTS `$overall_counter_table`(
                                    `id` int NOT NULL AUTO_INCREMENT,
                                    `period` varchar(255) NULL COMMENT 'period from which this record handle value: overall = NULL, weekly = weekn_number, daily = current_day',
                                    `visits` int NULL,
                                PRIMARY KEY (`id`)
                                ) ENGINE=MyISAM DEFAULT CHARSET=utf8;");
            $wpdb->insert($this->overall_counter_table, array('id'=>1, 'period'=>'overall', 'visits'=>0));
            $wpdb->insert($this->overall_counter_table, array('id'=>2, 'period'=>date("Y-m-d"), 'visits'=>0));
            $wpdb->insert($this->overall_counter_table, array('id'=>3, 'period'=>date("W"), 'visits'=>0));
        } else {
            //sprawdzamy czy tabela nie jest w starej wersji z mniejszą ilością kolumn
            if ($wpdb->query("DESCRIBE $overall_counter_table;") != 3) { 
                $wpdb->query("ALTER TABLE $overall_counter_table ADD period varchar(255) NULL COMMENT 'period from which this record handle value: overall = NULL, weekly = weekn_number, daily = current_day' AFTER `id`;");
                
                $wpdb->update($overall_counter_table, array('period'=>'overall'), array('id'=>1));
                $wpdb->update($overall_counter_table, array('period'=>date("Y-m-d")), array('id'=>2));
                $wpdb->update($overall_counter_table, array('period'=>date("W")), array('id'=>3));
            }
            
        }
    }


    /*
     * Method which create options records in wp_options table
     * @param: none;
     * @return: none
     */
    private function create_options(){
        add_option($this->online_offset_id, $this->online_offset_default_value, null, false);
        add_option($this->overall_offset_id, $this->overall_offset_default_value, null, false);
        add_option($this->startTime_id,$this->startTime_default_value, null, false);
        add_option($this->startTimeFormat_id, $this->startTimeFormat_default_value, null, false);
        add_option($this->disconnectTime_id, $this->disconnectTime_default_value, null, false);
        add_option($this->countBots_id, $this->countBots_default_value, null, false);
        add_option($this->countAdmins_id, $this->countAdmins_default_value, null, false);
        add_option($this->displayTotalValue_id, $this->displayTotalValue_default_value, null, false);
        add_option($this->displayCurrentValue_id, $this->displayCurrentValue_default_value, null, false);
        add_option($this->displayDailyValue_id, $this->displayDailyValue_default_value, null, false);
        add_option($this->displayWeeklyValue_id, $this->displayWeeklyValue_default_value, null, false);
    }
    
    /*
     * Method which create options form in wp-admin panel
     * @params: none
     * @return: none
     */
    private function create_options_form(){
        
        $this->section_title = '';
        $this->section_callback = array($this, 'draw_section');
        $this->section_page = 'general';
        
        $this->online_offset_title = __('Online Users Offset', 'visits_counter');
        $this->online_offset_callback = array($this,'draw_online_offset_field');
        
        $this->overall_offset_title = __('Overall Users Offset', 'visits_counter');
        $this->overall_offset_callback = array($this,'draw_overall_offset_field');;
        
        $this->startTime_title = __('Overall counter start time', 'visits_counter');
        $this->startTime_callback = array($this,'draw_startTime_field');;
        
        $this->startTimeFormat_title = __('Start Time display format', 'visits_counter');
        $this->startTimeFormat_callback = array($this, 'draw_startTimeFormat_field');
        
        $this->disconnectTime_title = __('Disconnect Time [s]', 'visits_counter');
        $this->disconnectTime_callback = array($this, 'draw_disconnectTime_field');
        
        $this->countBots_title = __('Count Bots (like GoogleBot)', 'visits_counter');
        $this->countBots_callback = array($this, 'draw_countBots_field');
        
        $this->countAdmins_title = __('Count Admins on page (like You)', 'visits_counter');
        $this->countAdmins_callback = array($this, 'draw_countAdmins_field');
        
        $this->displayTotalValue_title = __('Display Total Counter in Widget', 'visits_counter');
        $this->displayTotalValue_callback = array($this, 'draw_displayTotal_field');
        
        $this->displayCurrentValue_title = __('Display Current Online Counter in Widget', 'visits_counter');
        $this->displayCurrentValue_callback = array($this, 'draw_displayCurrent_field');
        
        $this->displayDailyValue_title = __('Display Daily Counter in Widget', 'visits_counter');
        $this->displayDailyValue_callback = array($this, 'draw_displayDaily_field');
        
        $this->displayWeeklyValue_title = __('Display Weekly Counter in Widget', 'visits_counter');
        $this->displayWeeklyValue_callback = array($this, 'draw_displayWeekly_field');
        
        add_settings_section($this->section_id, $this->section_title, $this->section_callback, $this->section_page);
        add_settings_field($this->online_offset_id, $this->online_offset_title, $this->online_offset_callback, $this->section_page, $this->section_id);
        add_settings_field($this->overall_offset_id, $this->overall_offset_title, $this->overall_offset_callback, $this->section_page, $this->section_id);
        add_settings_field($this->startTime_id, $this->startTime_title, $this->startTime_callback, $this->section_page, $this->section_id);
        add_settings_field($this->startTimeFormat_id, $this->startTimeFormat_title, $this->startTimeFormat_callback, $this->section_page, $this->section_id);
        add_settings_field($this->disconnectTime_id, $this->disconnectTime_title, $this->disconnectTime_callback, $this->section_page, $this->section_id);
        add_settings_field($this->countBots_id, $this->countBots_title, $this->countBots_callback, $this->section_page, $this->section_id);
        add_settings_field($this->countAdmins_id, $this->countAdmins_title, $this->countAdmins_callback, $this->section_page, $this->section_id);
        add_settings_field($this->displayTotalValue_id, $this->displayTotalValue_title, $this->displayTotalValue_callback, $this->section_page, $this->section_id);
        add_settings_field($this->displayCurrentValue_id, $this->displayCurrentValue_title, $this->displayCurrentValue_callback, $this->section_page, $this->section_id);
        add_settings_field($this->displayDailyValue_id, $this->displayDailyValue_title, $this->displayDailyValue_callback, $this->section_page, $this->section_id);
        add_settings_field($this->displayWeeklyValue_id, $this->displayWeeklyValue_title, $this->displayWeeklyValue_callback, $this->section_page, $this->section_id);
    }
    
    /*
     * Callback method for setting section
     * @params: none
     * @return: none
     */
    public function draw_section(){
       echo '<h3>'.__('Visitors counter settings', 'visits_counter').'</h3>';
    }
    
    /*
     * Callback function for online offset setting field
     * @params: none
     * @return: none
     */
    public function draw_online_offset_field(){
        $option_value = get_option($this->online_offset_id);
        echo "<input type=\"text\" id=\"$this->online_offset_id\" name=\"$this->online_offset_id\" value=\"$option_value\" /><br />";
    }
    
    /*
     * Callback function for overall offset setting field
     * @params: none
     * @return: none
     */
    public function draw_overall_offset_field(){
        $option_value = get_option($this->overall_offset_id);
        echo "<input type=\"text\" id=\"$this->overall_offset_id\" name=\"$this->overall_offset_id\" value=\"$option_value\" /><br />";
    }
    
    /*
     * Callback function for start Time setting field
     * @params: none
     * @return: none
     */
    public function draw_startTime_field(){
        $option_value = date("Y-m-d H:s", get_option($this->startTime_id));
        echo "<input type=\"text\" id=\"$this->startTime_id\" name=\"$this->startTime_id\" value=\"$option_value\" /><br />";
    }
    
    /*
     * Callback function for startTime Format field
     * @params: none
     * @return: none
     */
    public function draw_startTimeFormat_field(){
        $option_value = get_option($this->startTimeFormat_id);
        echo "<input type=\"text\" id=\"$this->startTimeFormat_id\" name=\"$this->startTimeFormat_id\" value=\"$option_value\" /><br />";
    }
    
    /**
     * Callback function for disconnect time field
     * @params: none
     * @return: none
     */
    public function draw_disconnectTime_field(){
        $option_value = get_option($this->disconnectTime_id);
        echo "<input type=\"text\" id=\"$this->disconnectTime_id\" name=\"$this->disconnectTime_id\" value=\"$option_value\" /><br />";
    }
    
    /**
     * Callback function for countBots field
     * @params: none
     * @return: none
     */
    public function draw_countBots_field(){
        $option_value = get_option($this->countBots_id);
        if ($option_value)
            $check_value = 'checked="checked"';
        else
            $check_value = "";
        echo "<input type=\"checkbox\" id=\"$this->countBots_id\" name=\"$this->countBots_id\" value=\"true\" $check_value /><br />";
    }
    
    /**
     * Callback function for countAdmins field
     * @params: none
     * @return: none
     */
    public function draw_countAdmins_field(){
        $option_value = get_option($this->countAdmins_id);
        if ($option_value)
            $check_value = 'checked="checked"';
        else
            $check_value = "";
        echo "<input type=\"checkbox\" id=\"$this->countAdmins_id\" name=\"$this->countAdmins_id\" value=\"true\" $check_value /><br />";
    }
    
    /*
     * Callback function for displayTotal value
     * @params: none
     * @return: none
     */
    public function draw_displayTotal_field(){
        $option_value = get_option($this->displayTotalValue_id);
        if ($option_value)
            $check_value = 'checked="checked"';
        else
            $check_value = "";
        echo "<input type=\"checkbox\" id=\"$this->displayTotalValue_id\" name=\"$this->displayTotalValue_id\" value=\"true\" $check_value /><br />";
    }
    
    /*
     * Callback function for displayCurrent value
     * @params: none
     * @return: none
     */
    public function draw_displayCurrent_field(){
        $option_value = get_option($this->displayCurrentValue_id);
        if ($option_value)
            $check_value = 'checked="checked"';
        else
            $check_value = "";
        echo "<input type=\"checkbox\" id=\"$this->displayCurrentValue_id\" name=\"$this->displayCurrentValue_id\" value=\"true\" $check_value /><br />";
    }
    
    /*
     * Callback function for displayDaily value
     * @params: none
     * @return: none
     */
    public function draw_displayDaily_field(){
        $option_value = get_option($this->displayDailyValue_id);
        if ($option_value)
            $check_value = 'checked="checked"';
        else
            $check_value = "";
        echo "<input type=\"checkbox\" id=\"$this->displayDailyValue_id\" name=\"$this->displayDailyValue_id\" value=\"true\" $check_value /><br />";
    }
    
    /*
     * Callback function for displayWeekly value
     * @params: none
     * @return: none
     */
    public function draw_displayWeekly_field(){
        $option_value = get_option($this->displayWeeklyValue_id);
        if ($option_value)
            $check_value = 'checked="checked"';
        else
            $check_value = "";
        echo "<input type=\"checkbox\" id=\"$this->displayWeeklyValue_id\" name=\"$this->displayWeeklyValue_id\" value=\"true\" $check_value /><br />";
    }
    
    
    /*
     * Method which prepare offset value 
     * @params: $inputData
     * @return: $new_data
     */
    public function prepare_offset_value($inputData){
        if ($inputData == '')
            $new_data = '0';
        else
            $new_data = (int)$inputData;
        return $new_data;
    }
    
    /*
     * Method which prepare unix time stamp data before save in db
     * @params: $inputData
     * @return: $new_date
     */
    public function prepare_new_startTime($inputData){
        if (!$inputData)
            $new_date = time();
        else {
            $inputData = explode(" ", $inputData);
            $day = explode("-",$inputData[0]);
            $time = explode(":",$inputData[1]);
            $new_date = mktime($time[0], $time[1], 0, $day[1], $day[2], $day[0]);
        }
        return $new_date;
    }
    
    /*
     * Method which prepare time format value
     * @params: $inputData
     * @return: $new_data
     */
    public function prepare_startTimeFormat_value($inputData){
        if (!$inputData)
            $new_data = 'Y-m-d H:s';
        else
            $new_data = $inputData;
        return $new_data;
    }
    
    /*
     * Method which prepare disconnect time value 
     * @params: $inputData
     * @return: $new_data
     */
    public function prepare_disconnectTime_value($inputData){
        if ($inputData == '')
            $new_data = 300;
        else
            $new_data = (int)$inputData;
        return $new_data;
    }
    
    /*
     * Method which prepare boolean value
     * @params: $inputData
     * @return: $new_data
     */
    public function prepare_bool_value($inputData){
        if (!$inputData)
            $new_data = 0;
        else
            $new_data = 1;
        return $new_data;
    }

    /**
     * Method which get widget display values options
     * @param: none
     * @return: array($displayTotal, $current, $displayDaily, $displayWeekly)
     */
    public function get_display_options(){
        return array('displayOverall' => get_option($this->displayTotalValue_id),
                     'displayCurrent' => get_option($this->displayCurrentValue_id),
                     'displayDaily'   => get_option($this->displayDailyValue_id),
                     'displayWeekly'  => get_option($this->displayWeeklyValue_id));
    }

    /*
     * Method which get options values from db
     * @params: none
     * @return: none
     */
    private function get_option_values(){
        $this->online_offset_value = get_option($this->online_offset_id);
        $this->overall_offset_value = get_option($this->overall_offset_id);
        $this->startTime_value = get_option($this->startTime_id);
        $this->startTimeFormat_value = get_option($this->startTimeFormat_id);
        $this->disconnectTime_value = get_option($this->disconnectTime_id);
        $this->countBots_value = get_option($this->countBots_id);
        $this->countAdmins_value = get_option($this->countAdmins_id);
        $this->displayTotalValue_value = get_option($this->displayTotalValue_id);
        $this->displayCurrentValue_value = get_option($this->displayCurrentValue_id);
        $this->displayDailyValue_value = get_option($this->displayDailyValue_id);
        $this->displayWeeklyValue_value = get_option($this->displayWeeklyValue_id);

        if ($this->online_offset_value === FALSE) {
            add_option($this->online_offset_id, $this->online_offset_default_value, null, false);
            $this->online_offset_value = $this->online_offset_default_value;
        }
        
        if ($this->overall_offset_value === FALSE) {
            add_option($this->overall_offset_id, $this->overall_offset_default_value, null, false);
            $this->overall_offset_value = $this->overall_offset_default_value;
        }
        
        if ($this->startTime_value === FALSE) {
            add_option($this->startTime_id,$this->startTime_default_value, null, false);
            $this->startTime_value = $this->startTime_default_value;
        }
        
        if ($this->startTimeFormat_value === FALSE) {
            add_option($this->startTimeFormat_id, $this->startTimeFormat_default_value, null, false);
            $this->startTimeFormat_value = $this->startTimeFormat_default_value;
        }
        
        if ($this->disconnectTime_value === FALSE) {
            add_option($this->disconnectTime_id, $this->disconnectTime_default_value, null, false);
            $this->disconnectTime_value = $this->disconnectTime_default_value;
        }
        
        if ($this->countBots_value === FALSE) {
            add_option($this->countBots_id, $this->countBots_default_value, null, false);
            $this->countBots_value = $this->countBots_default_value;
        }
        
        if ($this->countAdmins_value === FALSE) {
            add_option($this->countAdmins_id, $this->countAdmins_default_value, null, false);
            $this->countAdmins_value = $this->countAdmins_default_value;
        }
        
        if ($this->displayTotalValue_value === FALSE) {
            add_option($this->displayTotalValue_id, $this->displayTotalValue_default_value, null, false);
            $this->displayTotalValue_value = $this->displayTotalValue_default_value;
        }
        
        if ($this->displayCurrentValue_value === FALSE) {
            add_option($this->displayCurrentValue_id, $this->displayCurrentValue_default_value, null, false);
            $this->displayCurrentValue_value = $this->displayCurrentValue_default_value;
        }
        
        if ($this->displayDailyValue_value === FALSE) {
            add_option($this->displayDailyValue_id, $this->displayDailyValue_default_value, null, false);
            $this->displayDailyValue_value = $this->displayDailyValue_default_value;
        }
        
        if ($this->displayWeeklyValue_value === FALSE) {
            add_option($this->displayWeeklyValue_id, $this->displayWeeklyValue_default_value, null, false);
            $this->displayWeeklyValue_value = $this->displayWeeklyValue_default_value;
        }
    }
    
    /**
     * Method which check is user already online on page
     * @param: $userIP
     * @return: true or false
     */
    private function check_user_online($userIP){
        global $wpdb;
        $check = $wpdb->get_row("SELECT time FROM $this->online_counter_table WHERE IP = '$userIP'");
        if ($check)
            $result = true;
        else
            $result = false;
        return $result;
    }
    
    /**
     * Main method which counts users actuall online and overall users which visits page
     * @param: none
     * @return: none;
     */
    public function vc_count_users(){
        global $wpdb;
        $this->get_option_values();
        $IP = $_SERVER['REMOTE_ADDR'];
        $current_time = time();
        $checking_time_range = $current_time - $this->disconnectTime_value;
        
        $this->removeOldUsers($checking_time_range);
        
        $user_already_here = $this->check_user_online($IP);
        if ($user_already_here){
            $wpdb->update($this->online_counter_table, array('time'=>$current_time), array('IP' => $IP));
        } else { 
            if ($this->checkCountCurrentUser() && $this->checkCountBotUser()){
                $wpdb->insert($this->online_counter_table, array('IP'=>$IP, 'time'=>$current_time));
                $this->increase_counters();
            }
        }
        
        $online_users = $wpdb->get_results("SELECT * FROM $this->online_counter_table");
        $overall_count = $this->get_count_value('overall');
        $daily_count = $this->get_count_value('daily');
        $weekly_count = $this->get_count_value('weekly');
        $result = array('online_users'      => sizeof($online_users)+$this->online_offset_value, 
                        'overall_counter'   => $overall_count+$this->overall_offset_value,
                        'daily_counter'     => $daily_count,
                        'weekly_counter'      => $weekly_count,
                        'counterStartTime'  => date($this->startTimeFormat_value, $this->startTime_value));
        return $result;
    }
    
    
    /**
     * Function which remove old entries:
     * @param: $timeRange
     * @return: none
     */
    private function removeOldUsers($timeRange){
        global $wpdb;
        $wpdb->query("DELETE FROM $this->online_counter_table WHERE time < $timeRange");
    }
    
    /**
     * Function which increase counters: overall, daily and weekly (+1)
     * @param: none
     * @return: none
     */
    private function increase_counters(){
        global $wpdb;
        
        
        //$wpdb->query("UPDATE $this->overall_counter_table SET visits = visits+1 WHERE id = 1");
        $this->increase_counter("overall");
        $this->increase_counter("daily");
        $this->increase_counter("weekly");
    }
    
    /**
     * Function which gets count value
     * @param: $valueType = 'overall'
     * @return: overall count value
     */
    private function get_count_value($valueType = 'overall'){
        global $wpdb;
        switch ($valueType) {
            case "overall" : $period = "overall"; $id = 1; break;
            case "daily"   : $period = date("Y-m-d"); $id = 2; break;
            case "weekly"  : $period = date("W"); $id = 3; break;
            default        : $period = "overall"; $id = 1; break; //domyślnie pobieramy ogólny licznik
        }
        
        $count = $wpdb->get_row("SELECT visits FROM $this->overall_counter_table WHERE period = '$period'");
        if (!$count){
            $wpdb->insert($this->overall_counter_table, array('id'=>$id, 'period'=>$period, 'visits'=>0));
            $result = 0;
        } else {
            $result = $count->visits;
        }
        return $result;
    }
    
        
    /**
     * Method which check is it Bot or "normal" user on website
     * @param: none
     * @return: true or false
     */
    private function isBot(){
        include_once 'visits_counter_uaList.php';
        $ua = $_SERVER['HTTP_USER_AGENT'];
        foreach($uaList as $agent){
            if (strstr($ua, $agent)){
                return True;
            }
        }
        return False;
    }
    
    /**
     * Method which check is daily or weekly counter already setted for current day or weekly
     * @param: $valueType (daily, weekly) to check
     * @return: true or false
     */
    private function isActualCounter($valueType){
        global $wpdb;
        switch ($valueType) {
            case "overall" : $period = "overall"; $id = 1; break;
            case "daily"   : $period = date("Y-m-d"); $id = 2; break;
            case "weekly"  : $period = date("W"); $id = 3; break;
            default        : $period = "overall"; $id = 1; break;
        }
        $count = $wpdb->get_row("SELECT period FROM $this->overall_counter_table WHERE period = '$period'");
        if (!$count) {
            $wpdb->query("DELETE FROM $this->overall_counter_table WHERE id=$id;");
            $wpdb->insert($this->overall_counter_table, array('id'=>$id, 'period'=>$period, 'visits'=>1));
            return FALSE;
        } else {
            return TRUE;
        }
    }
    
    /**
     * Method which increase one counter
     * @param: $counterType
     * @return: none
     */
    private function increase_counter($counterType){
        global $wpdb;
        
        switch ($counterType) {
            case "overall" : $period = "overall"; $id = 1; break;
            case "daily"   : $period = date("Y-m-d"); $id = 2; $current_date = date("Y-m-d"); break;
            case "weekly"  : $period = date("W"); $id = 3; $current_date = date("W"); break;
            default        : $period = "overall"; $id = 1; break; //domyślnie pobieramy ogólny licznik
        }
        
        if ($this->isActualCounter($counterType))
            $wpdb->query("UPDATE $this->overall_counter_table SET visits = visits+1 WHERE id = $id");
        else
            $wpdb->query("UPDATE $this->overall_counter_table SET visits = 1 AND period = '$current_date' WHERE id = $id");
    }
    
    /**
     * Method which check should bot be counted and is it bot user or not
     * @param: none
     * @return: True if user is not bot or bots should be also counted
     *          False if user is bot and bot shouldn't be counted
     */
    private function checkCountBotUser(){
        if ($this->countBots_value == 1 || $this->isBot() == false)
            $result = TRUE;
        else 
            $result = FALSE;

        return $result;
    }
    
    
    /**
     * Method which check should admin user be counted and is it admin user or not
     * @param: none
     * @return: True if user is not admin or admins should be also counted
     *          False if user is admin and admins shouldn't be counted
     */
    private function checkCountCurrentUser(){
        if ($this->countAdmins_value == 1 || current_user_can('administrator') == false)
            $result = TRUE;
        else 
            $result = FALSE;
        
        return $result;
    }
}
