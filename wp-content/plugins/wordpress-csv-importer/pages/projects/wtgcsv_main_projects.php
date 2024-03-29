<?php      
global $wtgcsv_mpt_arr,$wpdb,$wtgcsv_options_array,$wtgcsv_projectslist_array,$wtgcsv_currentproject_code,$wtgcsv_nav_type,$wtgcsv_project_array,$wtgcsv_is_free,$wtgcsv_is_dev;
$pageid = 'projects';// used to access variable.php configuration
$pagefolder = 'projects';// the folder in pages folder holding this pages files

// main page header
if($wtgcsv_is_free){
    $page_title_string = 'Your Project Configuration';    
}else{
    $page_title_string = $wtgcsv_mpt_arr[$pageid]['title'] . wtgcsv_get_current_project_name() . ' (ID: '.wtgcsv_convertvalue_projectcodefalse_toostring().')';
}
wtgcsv_header_page($page_title_string,0);
 
// create tab menu for the giving page
wtgcsv_createmenu($pageid);

// count number of panels, variable used as in code ID to pass to functions, not the TAB number users can see in url
$panel_number = 0;

// set tab number variable, a common use is in form hidden values
$wtgcsv_tab_number = wtgcsv_get_tabnumber();

// we can change the navigation type to CSS only, important for debugging javascript bugs
if($wtgcsv_nav_type == 'css'){ 

    $tab_number = 0;
    if(isset($_GET['tabnumber'])){
        $tab_number = $_GET['tabnumber'];
    }

    // build form action value, will be appended
    $wtgcsv_form_action = wtgcsv_link_toadmin('wtgcsv_yourprojects','&tabnumber=' . $tab_number);
    
    include(WTG_CSV_DIR.'pages/data/wtgcsv_tab'.$tab_number.'_pagedata.php');

}elseif($wtgcsv_nav_type == 'jquery'){
    
    // loop through tabs - held in menu pages tabs array
    $counttabs = 0;// used as tab id also
    foreach($wtgcsv_mpt_arr[$pageid]['tabs'] as $tab=>$values){
        
        // chekc if tab is to be displayed, if not, we do not add the div for it    
        if($wtgcsv_mpt_arr[ $pageid ]['tabs'][ $counttabs ]['display'] == true){
            
            // build form action value, will be appended
            $wtgcsv_form_action = wtgcsv_link_toadmin($_GET['page'],'#tabs-' . $counttabs);            
            //$wtgcsv_form_action = '';
                      
            echo '<div id="tabs-'.$counttabs.'">';
            include(WTG_CSV_DIR.'pages/'.$pagefolder.'/wtgcsv_tab'.$counttabs.'_page'.$pageid.'.php');
            echo '</div>';
                     
        }
        
        ++$counttabs;
    } 

}elseif($wtgcsv_nav_type == 'nonav'){
    
    // loop through tabs - held in menu pages tabs array
    $counttabs = 0;// used as tab id also
    foreach($wtgcsv_mpt_arr[$pageid]['tabs'] as $tab=>$values){
        
        // chekc if tab is to be displayed, if not, we do not add the div for it    
        if($wtgcsv_mpt_arr[ $pageid ]['tabs'][ $counttabs ]['display'] == true){
            
            $wtgcsv_form_action = wtgcsv_link_toadmin($_GET['page'],'#tabs-' . $counttabs);            

            include(WTG_CSV_DIR.'pages/'.$pagefolder.'/wtgcsv_tab'.$counttabs.'_page'.$pageid.'.php');
        
        }
        
        ++$counttabs;
    }    
    
} 
      
wtgcsv_footer(); ?>