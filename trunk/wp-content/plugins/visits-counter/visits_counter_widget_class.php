<?php


class visits_counter_widget {
    
    private $counter = null;
    private $title;
    
    public function __construct() {
        $this->counter = new visits_counter();
        $this->title = __('Users on page', 'visits_counter');
    }
    
    public function drawWidget($args){
        extract($args);
        $count_values = $this->counter->vc_count_users();
        $displayOptions = $this->counter->get_display_options();

        $onlineUsersLabel = __('Now online','visits_counter');
        $overallUsersLabel = __('Overall', 'visits_counter');
        $dailyUsersLabel = __('Today', 'visits_counter');
        $weeklyUsersLabel = __('This week', 'visits_counter');
        
        $content = "";
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
        
    ?>
        <?php echo $before_widget; ?>
            <?php echo $before_title
                . $this->title
                . $after_title; ?>
            <?php echo $content; ?>
        <?php echo $after_widget; ?>
    <?php
    }
    
}
?>
