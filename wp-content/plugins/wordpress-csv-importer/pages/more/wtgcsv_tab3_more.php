<?php
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'affiliateservicestatus';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Affiliate Service Status');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('Will indicate your connection to my affiliate web service and if the plugins site is offline for maintenance etc.');
$panel_array['panel_help'] = __('The system being put in place will make every buyer of a Premium WebTechGlobal plugin an affiliate with us. You do not need to provide any extra information or take part if you do not wish to. By default payments will be sent to the email address used to purchase the plugin. It is my ambition to pay every affiliate a bonus on their first sale and bonuses every 5 sales. This will not be setup for a while but the more participation in the affiliate program the more priority will be giving to this exciting idea.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(true,true);
?>
<?php wtgcsv_panel_header( $panel_array );?>

<p>Service not yet available</p>

 <?php wtgcsv_panel_footer();?> 

<?php
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'trafficstatistics';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Traffic Statistics');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('View the traffic your links are getting, as calculated by the Tips and Tricks Affiliate Plugin.');
$panel_array['panel_help'] = __('I currently use the premium affiliate plugin created by the Tips and Tricks team. All information provided is generated by that plugin. I plan to create my own however and offer key features no other affiliate plugin has.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(true,true);
?>
<?php wtgcsv_panel_header( $panel_array );?>

              <p>Service not yet available</p>

 <?php wtgcsv_panel_footer();?> 

<?php
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'unpaidcommission';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Unpaid Commission');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('You affiliate transactions, currently managed by the Tips and Tricks affiliate plugin.');
$panel_array['panel_help'] = __('The success of affiliates in 2011 told me that more support had to be giving. It will take a while to get everything in place, the existing affiliate plugin was purchased and so it takes longer to integrate with my own plugins plus website. I will eventually create an affiliate plugin that I am confident will help affiliates earn a lot of money once all my ideas are in place.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(true,true);
?>
<?php wtgcsv_panel_header( $panel_array );?>

              <p>Service not yet available</p>
              
 <?php wtgcsv_panel_footer();?> 

<?php
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'payouthistory';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Payout History');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('Details the payments made to yourself via our affiliate program.');
$panel_array['panel_help'] = __('You must be logged in to your blog using the credentials we have for you in our database in order for your payout history to be displayed here. If you have not activated Premium Services the API will also not be active and nothing will be displayed.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(true,true);
?>
<?php wtgcsv_panel_header( $panel_array );?>

<p>Service not yet available</p>

 <?php wtgcsv_panel_footer();?> 

<?php
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'instantadvertising';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Instant Advertising');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('Display ads and banners with your affiliate links on your site at the click of a button.');
$panel_array['panel_help'] = __('This feature will start of basic until I estbalish how popular it is but I do intend to expand it in many ways that will help you place advertisements in the way you need. This feature allows you to advertise all WebTechGlobal premium plugins not just this one.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(true,true);
?>
<?php wtgcsv_panel_header( $panel_array );?>

              <p>Service not yet available</p>
              
<?php wtgcsv_panel_footer();?> 

<?php
++$panel_number;// increase panel counter so this panel has unique ID
$panel_array = array();
$panel_array['panel_name'] = 'bannersamples';// slug to act as a name and part of the panel ID 
$panel_array['panel_number'] = $panel_number;// number of panels counted on page, used to create object ID
$panel_array['panel_title'] = __('Banner Samples');// user seen panel header text 
$panel_array['pageid'] = $pageid;// store the $pageid for sake of ease
$panel_array['tabnumber'] = $wtgcsv_tab_number; 
$panel_array['panel_id'] = $panel_array['panel_name'].$panel_number;// creates a unique id, may change from version to version but within a version it should be unique
$panel_array['panel_intro'] = __('This is the style of banner I use, if you need more created please send a request.');
$panel_array['panel_help'] = __('This is simply a sample of the kind of banners I like to use. I can create or hire someone to create more on request but will only do so if the request is for banners very different to what we have already or the request is for a design that suits a specific website in a way that no current designs do.');
$panel_array['help_button'] = wtgcsv_helpbutton_text(true,true);
?>
<?php wtgcsv_panel_header( $panel_array );?>

              <p>Service not yet available</p>

<?php wtgcsv_panel_footer();?> 