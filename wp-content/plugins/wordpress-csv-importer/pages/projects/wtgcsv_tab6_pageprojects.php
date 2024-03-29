<?php
if(!isset($wtgcsv_project_array['custom_fields'])){
    echo wtgcsv_notice('No post meta (custom fields) have been saved.','warning','Tiny','','','return');
}else{
    echo wtgcsv_notice('You have saved post meta settings (custom fields) for this project.','info','Tiny','','','return');
}
?>

<?php
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'createbasiccustomfieldrules';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Create Basic Custom Field Rules');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('Put your data into custom fields by entering the key and selecting the data column');
$panel_array['panel_help'] = __('You can setup as many custom fields as you wish. Enter your custom field key (meta-key) you wish all your posts to have. Then select the column of data that you wish to populate your custom field value with.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(false,false);
// Form Settings - create the array that is passed to jQuery form functions
$jsform_set_override = array();
$jsform_set = wtgcsv_jqueryform_commonarrayvalues($pageid,$panel_array['tabnumber'],$panel_array['panel_number'],$panel_array['panel_name'],$panel_array['panel_title'],$jsform_set_override);               
$jsform_set['dialoguebox_title'] = 'Save Custom Field Rule';
$jsform_set['noticebox_content'] = 'Do you want to save your new custom field rule and put the selected data into your entered meta-key?';
// TODO:MEDIUMPRIORITY,add option for default value for null data or option for custom field not to be added at all
?>
<?php wtgcsv_panel_header( $panel_array );?>

    <?php wtgcsv_formstart_standard($jsform_set['form_name'],$jsform_set['form_id'],'post','wtgcsv_form','');?>

    Enter Custom Field Key: <input type="text" name="wtgcsv_key" />
    
    <br /><br />

    Select Data Column: 
    <select name="wtgcsv_customfield_select_columnandtable" id="wtgcsv_customfield_select_columnandtable_formid" class="wtgcsv_multiselect_menu">
        <?php wtgcsv_display_project_columnsandtables_menuoptions($wtgcsv_currentproject_code);?>                                                                                                                     
    </select>

    <script>
    $("#wtgcsv_customfield_select_columnandtable_formid").multiselect({
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
    wtgcsv_formend_standard('Submit',$jsform_set['form_id']);?>

    <?php wtgcsv_jquery_form_prompt($jsform_set);?>

<?php wtgcsv_panel_footer();?>

<?php
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'deletebasiccustomfieldrules';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Delete Basic Custom Field Rules');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('Your basic custom field rules are listed here for reference and to delete');
$panel_array['panel_help'] = __('Deleting a custom field/meta-key rule has no effect on posts already created with your current project. It will only discontinue the custom field from being created for new posts.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(false,false);
// Form Settings - create the array that is passed to jQuery form functions
$jsform_set_override = array();
$jsform_set = wtgcsv_jqueryform_commonarrayvalues($pageid,$panel_array['tabnumber'],$panel_array['panel_number'],$panel_array['panel_name'],$panel_array['panel_title'],$jsform_set_override);               
$jsform_set['dialoguebox_title'] = 'Delete Custom Field Rule';
$jsform_set['noticebox_content'] = 'Do you want to delete your custom field rule and discontinue the meta-key plus value being added to posts created by this project?';
// TODO:MEDIUMPRIORITY,add option for default value for null data or option for custom field not to be added at all
?>
<?php wtgcsv_panel_header( $panel_array );?>

    <?php wtgcsv_formstart_standard($jsform_set['form_name'],$jsform_set['form_id'],'post','wtgcsv_form','');?>

    <?php wtgcsv_table_customfield_rules_basic(); ?>

    <?php
    // add the javascript that will handle our form action, prevent submission and display dialogue box
    wtgcsv_jqueryform_singleaction_middle($jsform_set,$wtgcsv_options_array);

    // add end of form - dialogue box does not need to be within the <form>
    wtgcsv_formend_standard('Submit',$jsform_set['form_id']);?>

    <?php wtgcsv_jquery_form_prompt($jsform_set);?>

<?php wtgcsv_panel_footer();?> 

<?php
if(!$wtgcsv_is_free){
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'createadvancedcustomfieldrules';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Create Advanced Custom Field Rules');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('Create meta data with dynamic and unique content for good SEO');
$panel_array['panel_help'] = __('This feature is used to add meta values to your posts but as a feature we use the Custom Field term. You can setup as many custom field rules as you wish. Most themes require specific keys to be entered, please refer to your themes guide for a list of keys. Enter your custom field key (meta-key) you wish all your posts to have. Then select the column of data that you wish to populate your custom field value with or select a template. The template method allows you to create a template using the WYSIWYG editor on the Content screen. The result can be a very unique value and great for SEO. Keep in mind however that this is a little more work for Wordpress CSV Importer to do during post creation.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(true,true);
// Form Settings - create the array that is passed to jQuery form functions
$jsform_set_override = array();
$jsform_set = wtgcsv_jqueryform_commonarrayvalues($pageid,$panel_array['tabnumber'],$panel_array['panel_number'],$panel_array['panel_name'],$panel_array['panel_title'],$jsform_set_override);               
$jsform_set['dialoguebox_title'] = 'Save Advanced Custom Field Rule';
$jsform_set['noticebox_content'] = 'Do you want to save your new custom field rule and put the selected data into your entered meta-key?';
### TODO:MEDIUMPRIORITY,add option for default value for null data or option for custom field not to be added at all
?>
<?php wtgcsv_panel_header( $panel_array );?>

    <?php wtgcsv_formstart_standard($jsform_set['form_name'],$jsform_set['form_id'],'post','wtgcsv_form','');?>

    Enter Custom Field Key: <input type="text" name="wtgcsv_key" />
    
    <br /><br />

    Select Data Column: 
    <select name="wtgcsv_customfield_select_columnandtable" id="wtgcsv_advancedcustomfields_datacolumn" class="wtgcsv_multiselect_menu">
        <option value="notselected">Not Required</option>       
        <?php wtgcsv_display_project_columnsandtables_menuoptions($wtgcsv_currentproject_code);?>                                                                                                                     
    </select>

    <script>
    $("#wtgcsv_advancedcustomfields_datacolumn").multiselect({
       multiple: false,
       header: "Select Database Column",
       noneSelectedText: "Select Database Table",
       selectedList: 1
    });
    </script>

    <br />
    
    <p>                    
        Design: 
        <select name="wtgcsv_customfields_selecttemplate" id="wtgcsv_customfields_selecttemplate" class="wtgcsv_multiselect_menu">
            <option value="notselected">Not Required</option>
            <?php wtgcsv_display_contenttemplate_menuoptions();?>                                                                                                                     
        </select>        
    </p>
    
    <script>
    $("#wtgcsv_customfields_selecttemplate").multiselect({
       multiple: false,
       header: "Template",
       noneSelectedText: "Template",
       selectedList: 1
    });
    </script>    
    
    <script>
    $(function() {
        $( "#wtgcsv_advancedcustomfields_updatemeta" ).buttonset();
    });
    </script>

    <div id="wtgcsv_advancedcustomfields_updatemeta">
        Allow Updating: <input type="radio" id="wtgcsv_metaupdating_switch_on" name="wtgcsv_updatesettings_metaupdating_switch_inputname" value="on" /><label for="wtgcsv_metaupdating_switch_on">Yes</label>
        <input type="radio" id="wtgcsv_metaupdating_switch_off" name="wtgcsv_updatesettings_metaupdating_switch_inputname" value="off" /><label for="wtgcsv_metaupdating_switch_off">No</label>            
    </div>
        
    <?php
    // add the javascript that will handle our form action, prevent submission and display dialogue box
    wtgcsv_jqueryform_singleaction_middle($jsform_set,$wtgcsv_options_array);

    // add end of form - dialogue box does not need to be within the <form>
    wtgcsv_formend_standard('Submit',$jsform_set['form_id']);?>

    <?php wtgcsv_jquery_form_prompt($jsform_set);?>

<?php wtgcsv_panel_footer();
}?>

<?php 
### TODO:HIGHPRIORITY, ClassiPress panel listing all keys and options for adding data too them
### TODO:HIGHPRIORITY, ShopperPress panel listing all keys
### TODO:LOWPRIORITY, panel for submitting a list of keys for a giving theme name via web service
?>

<?php
if(!$wtgcsv_is_free){
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'deleteadvancedcustomfieldrules';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Delete Advanced Field Rules');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('Your advanced custom field rules are listed here for reference and to delete');
$panel_array['panel_help'] = __('Deleting a custom field/meta-key rule has no effect on posts already created with your current project. It will only discontinue the custom field from being created for new posts.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(false,true);
// Form Settings - create the array that is passed to jQuery form functions
$jsform_set_override = array();
$jsform_set = wtgcsv_jqueryform_commonarrayvalues($pageid,$panel_array['tabnumber'],$panel_array['panel_number'],$panel_array['panel_name'],$panel_array['panel_title'],$jsform_set_override);               
$jsform_set['dialoguebox_title'] = 'Delete Custom Field Rule';
$jsform_set['noticebox_content'] = 'Do you want to delete your custom field rule and discontinue the meta-key plus value being added to posts created by this project?';
// TODO:MEDIUMPRIORITY,add option for default value for null data or option for custom field not to be added at all
?>
<?php wtgcsv_panel_header( $panel_array );?>

    <?php wtgcsv_formstart_standard($jsform_set['form_name'],$jsform_set['form_id'],'post','wtgcsv_form','');?>

    <?php wtgcsv_table_customfield_rules_advanced(); ?>

    <?php
    // add the javascript that will handle our form action, prevent submission and display dialogue box
    wtgcsv_jqueryform_singleaction_middle($jsform_set,$wtgcsv_options_array);

    // add end of form - dialogue box does not need to be within the <form>
    wtgcsv_formend_standard('Submit',$jsform_set['form_id']);?>

    <?php wtgcsv_jquery_form_prompt($jsform_set);?>

<?php wtgcsv_panel_footer();
}?>

<?php
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'usedcustomfieldkeys';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Used Custom Field (meta) Keys *global panel*');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('A list of all distinct meta-keys (used as custom field keys) for reference only');
$panel_array['panel_help'] = __('Any meta-key (custom field key) key you enter for a post will appear in this list. Some of Wordpress own standard/default meta-keys will also show, some will not. I have excluded custom field keys that I feel no one will ever wish to use. Should your project require a standard Wordpress meta-key not displayed in the list or in the menus please request it to be removed from the list of exclusions.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(false,false);
?>
<?php wtgcsv_panel_header( $panel_array );?>
<?php wtgcsv_list_customfields(); ?>
<?php wtgcsv_panel_footer();?>