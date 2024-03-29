<?php
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'moreoffersspecialoffera';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Pre-Order');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('You can pre-order Wordpress CSV Importer');
$panel_array['panel_help'] = __('Please send payments to paypal@wordpresscsvimporter.com or visit www.wordpresscsvimporter.com and go through the checkout.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(false,false);
?>
<?php wtgcsv_panel_header( $panel_array );?>
<p>For a limited time only you can buy Wordpress CSV Importer for just &dollar;39/&pound;25 and as an extra bonus
you get Easy CSV Importer premium edition free, to give you something to use until Wordpress CSV Importer is complete.
The planned
sales price is &dollar;157/&pound;99.99. The plugin will be in development until 2013 but a well working beta will be
available by August. During 2013 many support services will be deployed also. Click on the help button
to read more.</p>
<?php wtgcsv_panel_footer();?> 
