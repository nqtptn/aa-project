<?php


class visits_counter_widget {
    
    private $counter = null;
    private $title;
    
    public function __construct() {
        $this->counter = new visits_counter();
        //$this->title = __('Users on page', 'visits_counter');
    }
    
    public function drawWidget($args){
        extract($args);
        $count_values = $this->counter->vc_count_users();
        $displayOptions = $this->counter->get_display_options();

        $onlineUsersLabel = __('Khách đang truy cập','visits_counter');
        $overallUsersLabel = __('Tổng lượt truy cập', 'visits_counter');
        $dailyUsersLabel = __('Hôm nay', 'visits_counter');
        $weeklyUsersLabel = __('Tuần này', 'visits_counter');
        
        $content = "<div style='font-size: 10px; padding: 10px 0 0 5px; font-weight: normal;'>";
        if ($displayOptions['displayCurrent'])
            $content .= $onlineUsersLabel.": ".$count_values['online_users']."<br />";
        if ($displayOptions['displayDaily'])
            $content .= $dailyUsersLabel.": ".$count_values['daily_counter']."<br />";
        if ($displayOptions['displayWeekly'])
            $content .= $weeklyUsersLabel.": ".$count_values['weekly_counter']."<br />";
        if ($displayOptions['displayOverall'])
            $content .= $overallUsersLabel.": ".$count_values['overall_counter']."<br />";
        
        //cut last <br /> tag in $content:
        $content = substr($content, 0, -6);
		$content .= "<div/>";
		$this->title = __($content, 'visits_counter');
        
    ?>
        <?php echo $before_widget; ?>
            <?php echo $before_title
                . $this->title
                . $after_title; ?>
            <?php //echo $content; ?>
        <?php echo $after_widget; ?>
    <?php
    }
    
}
?>
