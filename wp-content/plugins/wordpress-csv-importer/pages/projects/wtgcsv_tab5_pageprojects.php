<?php
if(!isset($wtgcsv_project_array['dates'])){
    echo wtgcsv_notice('Post publish dates will be the default decided by Wordpress.','warning','Tiny','','','return');
}else{
    if(isset($wtgcsv_project_array['dates']['currentmethod'])){
        if($wtgcsv_project_array['dates']['currentmethod'] == 'random'){
            echo wtgcsv_notice('Post publish dates will be random.','info','Tiny','','','return');
        }elseif($wtgcsv_project_array['dates']['currentmethod'] == 'increment'){
            echo wtgcsv_notice('Post publish dates will be incremental','info','Tiny','','','return');
        }                                                                    
    }
}
?>

<?php
### TODO:MEDIUMPRIORITY, add current date method to the panels title
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'projectdatemethod';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Projects Current Date Method');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('Displays your current date method');
$panel_array['panel_help'] = __('This panel tells you what publish date method is being used for your project. Change it by using and submitting a form for a different method. You can use the button in this panel to revert back to default Wordpress times for your publish dates.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(false,false);
// Form Settings - create the array that is passed to jQuery form functions
$jsform_set_override = array();
$jsform_set = wtgcsv_jqueryform_commonarrayvalues($pageid,$panel_array['tabnumber'],$panel_array['panel_number'],$panel_array['panel_name'],$panel_array['panel_title'],$jsform_set_override);                
$jsform_set['dialoguebox_title'] = 'Use Wordpress Default Publish Dates';
$jsform_set['noticebox_content'] = 'Do you want to cancel the current date method? Doing this will allow Wordpress to set your publish times based on when each post is created.';
// TODO: HIGHPRIORITY, write function to test dates, display on this panel and use in processing?>
<?php wtgcsv_panel_header( $panel_array );?>

    <?php wtgcsv_formstart_standard($jsform_set['form_name'],$jsform_set['form_id'],'post','wtgcsv_form','');?>

    <?php wtgcsv_display_date_method(); ?>  
    
    <?php
    // add the javascript that will handle our form action, prevent submission and display dialogue box
    wtgcsv_jqueryform_singleaction_middle($jsform_set,$wtgcsv_options_array);

    // add end of form - dialogue box does not need to be within the <form>
    wtgcsv_formend_standard('Use Wordpress Default Publish Dates',$jsform_set['form_id']);?>

    <?php wtgcsv_jquery_form_prompt($jsform_set);?>

<?php wtgcsv_panel_footer();?>

<?php
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'postdatescolumn';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = 'Set Publish Dates Column (currently ' .  wtgcsv_get_project_datecolumn($wtgcsv_currentproject_code).')';// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('You can select a column of dates if you do not want Wordpress to decide');
$panel_array['panel_help'] = __('The creation page allows you to configure dates and allow the plugin to set dates for posts. However if you have a column of pre-set dates you can over-ride all other date settings by selecting the dates column in this panel.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(false,false);
// Form Settings - create the array that is passed to jQuery form functions
$jsform_set_override = array();
$jsform_set = wtgcsv_jqueryform_commonarrayvalues($pageid,$panel_array['tabnumber'],$panel_array['panel_number'],$panel_array['panel_name'],$panel_array['panel_title'],$jsform_set_override);                
$jsform_set['dialoguebox_title'] = 'Save Data Column';
$jsform_set['noticebox_content'] = 'You are saving your dates column so that posts are published with the dates in your data. Do you wish to continue?';
// TODO: HIGHPRIORITY, write function to test dates, display on this panel and use in processing?>
<?php wtgcsv_panel_header( $panel_array );?>

    <?php wtgcsv_formstart_standard($jsform_set['form_name'],$jsform_set['form_id'],'post','wtgcsv_form','');?>

    <select name="wtgcsv_datecolumn_select_columnandtable" id="wtgcsv_datecolumn_select_columnandtable_formid" class="wtgcsv_multiselect_menu">
        
        <?php
        $table = ''; 
        if(isset($wtgcsv_project_array['dates']['date_column']['table_name'])){
            $table = $wtgcsv_project_array['dates']['date_column']['table_name'];    
        }
        
        $column = ''; 
        if(isset($wtgcsv_project_array['dates']['date_column']['column_name'])){
            $column = $wtgcsv_project_array['dates']['date_column']['column_name'];    
        }        
        ?>
        
        <?php wtgcsv_display_project_columnsandtables_menuoptions($wtgcsv_currentproject_code,$table,$column);?>                                                                                                                     
    </select>

    <script>
    $("#wtgcsv_datecolumn_select_columnandtable_formid").multiselect({
       multiple: false,
       header: "Select Database Column (table - column)",
       noneSelectedText: "Select Database Table",
       selectedList: 1
    });
    </script>
    
    <br />
    
    <?php
    // add the javascript that will handle our form action, prevent submission and display dialogue box
    wtgcsv_jqueryform_singleaction_middle($jsform_set,$wtgcsv_options_array);

    // add end of form - dialogue box does not need to be within the <form>
    wtgcsv_formend_standard('Use Dates Data',$jsform_set['form_id']);?>

    <?php wtgcsv_jquery_form_prompt($jsform_set);?>

<?php wtgcsv_panel_footer();?>

<?php
if(!$wtgcsv_is_free){
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'incrementalpublishdatessettings';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Incremental Publish Date Settings');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('Configure incremental publish dates methods if you plan to use the incremental approach');
$panel_array['panel_help'] = __('Incremental will apply a different post date per post and increase the date as posts are created. The start date is updated with the latest used date and time everytime a post is created. A slider allows you to set the increment value. You can create a random increment range, allowing you to force a short and long increment size for more natural publish dates. The increment values are in minutes. You can position the sliders so that the shortest and longest times match so fixing the exact number of minutes between each publish date.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(false,true);
// Form Settings - create the array that is passed to jQuery form functions
$jsform_set_override = array();
$jsform_set = wtgcsv_jqueryform_commonarrayvalues($pageid,$panel_array['tabnumber'],$panel_array['panel_number'],$panel_array['panel_name'],$panel_array['panel_title'],$jsform_set_override);     
$jsform_set['dialoguebox_title'] = 'Save Incremental Publish Date Settings';
$jsform_set['help_button'] = wtgcsv_helpbutton_text(false,true);
$jsform_set['noticebox_content'] = 'You are about to switch your project to incremental publish dates, do you want to continue?';
### TODO: LOWPRIORITY, displays hours,days,week on slider
?>
<?php wtgcsv_panel_header( $panel_array );?>

    <?php wtgcsv_formstart_standard($jsform_set['form_name'],$jsform_set['form_id'],'post','wtgcsv_form','');?>

    <script>
    $(function() {
        $( "#wtgcsv_publishdateincrement_start" ).datepicker();
    });
    </script>
    
    <?php
    $inc_start = '';
    if(isset($wtgcsv_project_array['dates']['increment']['start'])){
        $inc_start = $wtgcsv_project_array['dates']['increment']['start'];   
    }   
    ?>
              
    <p>Start Date: <input type="text" name="wtgcsv_publishdateincrement_start" id="wtgcsv_publishdateincrement_start" value="<?php echo $inc_start;?>"></p>

    <script>
    $(function() {
        $( "#wtgcsv_increment_slider" ).slider({
            range: true,
            min: 0,
            max: 50000,
            values: [ 0, 1440 ],
            slide: function( event, ui ) {
                $( "#wtgcsv_increment_range" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
            }
        });
        $( "#wtgcsv_increment_range" ).val( "" + $( "#wtgcsv_increment_slider" ).slider( "values", 0 ) +
            " - " + $( "#wtgcsv_increment_slider" ).slider( "values", 1 ) );
    });
    </script>

    <p>
        <label for="wtgcsv_increment_range">Increment range:</label>
        <input type="text" name="wtgcsv_increment_range" id="wtgcsv_increment_range" style="border:0; color:#f6931f; font-weight:bold;" readonly />
    </p>

    <div id="wtgcsv_increment_slider"></div>

    <?php
    // add the javascript that will handle our form action, prevent submission and display dialogue box
    wtgcsv_jqueryform_singleaction_middle($jsform_set,$wtgcsv_options_array);

    // add end of form - dialogue box does not need to be within the <form>
    wtgcsv_formend_standard('Use Incremental Dates Method',$jsform_set['form_id']);?>

    <?php wtgcsv_jquery_form_prompt($jsform_set);?>
   
<?php wtgcsv_panel_footer();
}?> 

<?php
if(!$wtgcsv_is_free){
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'randompublishdatesettings';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Random Publish Date Settings');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('Randomise your post publish dates within a specific range');
$panel_array['panel_help'] = __('If you want your blog posts to seem very natural this could be the option for you. You can set a start date and an end date. Wordpress CSV Importer will only make post dates within your set range. That includes saving a future date as your end date and causing posts to become schedule by Wordpress if Wordpress CSV Importer randomly creates a publish date set in the future. Wordpress handles that and publishes your post as scheduled.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(false,true);
// Form Settings - create the array that is passed to jQuery form functions
$jsform_set_override = array();
$jsform_set = wtgcsv_jqueryform_commonarrayvalues($pageid,$panel_array['tabnumber'],$panel_array['panel_number'],$panel_array['panel_name'],$panel_array['panel_title'],$jsform_set_override);     
$jsform_set['dialoguebox_title'] = 'Save Random Publish Date Settings';
$jsform_set['help_button'] = 'Paid Edition Only';
$jsform_set['noticebox_content'] = 'You are about to change your random publish date settings, this will only effect new posts. Do you want to continue?';?>
<?php wtgcsv_panel_header( $panel_array );?>

    <?php wtgcsv_formstart_standard($jsform_set['form_name'],$jsform_set['form_id'],'post','wtgcsv_form','');?>

    <script>
    $(function() {
        $( "#wtgcsv_randompublishdate_start" ).datepicker();
    });

    $(function() {
        $( "#wtgcsv_randompublishdate_end" ).datepicker();
    });
    </script>

    <?php
    $ran_start = '';
    if(isset($wtgcsv_project_array['dates']['random']['start'])){
        $ran_start = $wtgcsv_project_array['dates']['random']['start'];    
    }
    
    $ran_end = '';
    if(isset($wtgcsv_project_array['dates']['random']['end'])){
        $ran_end = $wtgcsv_project_array['dates']['random']['end'];    
    }    
    ?>
                  
    <p>Start Date: <input type="text" name="wtgcsv_randompublishdate_start" id="wtgcsv_randompublishdate_start" value="<?php echo $ran_start;?>"></p>
    <p>End Date: <input type="text" name="wtgcsv_randompublishdate_end" id="wtgcsv_randompublishdate_end" value="<?php echo $ran_end;?>"></p>
    
     <?php
    // add the javascript that will handle our form action, prevent submission and display dialogue box
    wtgcsv_jqueryform_singleaction_middle($jsform_set,$wtgcsv_options_array);

    // add end of form - dialogue box does not need to be within the <form>
    wtgcsv_formend_standard('Use Random Dates Method',$jsform_set['form_id']);?>

    <?php wtgcsv_jquery_form_prompt($jsform_set);?>
   
<?php wtgcsv_panel_footer();
}?> 