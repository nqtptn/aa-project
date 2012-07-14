<?php
/**
 * @package Distance
 * @version 1.7
 */
/*
Plugin Name: WP Transportation
Description: WP Transportation consists of a User interface and an admin backend, along with a Login and registration system.WP Transportation will calculate how many miles the distance is between a starting point and an end point and will give a Quote on how much it should cost. This Quote is calculated according to the user's input, it also allow users to order online and pay via PayPal.
Version: 1.7
Author URI: http://appletechdesigns.com
Author Email: info@appletechdesigns.com
Author: Moe Farhat 
*/
//include('shortcodes.php');
add_shortcode('Your Distance','show');


function show_setting()
{
?>
<div class="wrap">
<div style="float:left;margin-top: 17px;">
<img src="~/images/shipping.png" />
</div>
<h2><?php echo esc_html( 'WP Transportation - Settings / Configuration ' ); ?></h2>
<?php
if($_REQUEST['check']==1)
{
update_option( 'google_api_key', $_POST['google_api_key'] );
update_option( 'dist_return_url', $_POST['dist_return_url'] );
update_option( 'paypal_business_email', $_POST['paypal_business_email'] ); 
update_option( 'mode', $_POST['mode'] ); 
update_option( 'CCmode', $_POST['CCmode'] ); 
update_option( 'my_api_username', $_POST['my_api_username'] ); 
update_option( 'my_api_password', $_POST['my_api_password'] ); 
update_option( 'my_api_signature', $_POST['my_api_signature'] ); 
update_option( 'to_admin', $_POST['to_admin'] ); 
update_option( 'from_admin', $_POST['from_admin'] ); 
update_option( 'application_url', $_POST['application_url'] ); 

}
?>
<h3>If you have any questions, Please don't hestitate to contact me at info@appletechdesigns.com or visit the plugin support page at <a href="http://www.appletechdesigns.com/wptransportation/"> Apple Tech Designs </a>  </h3>

You have to call this [Your Distance] short code  where you want to run this application.<br />
<br />
Your donation is greatly appreciated 
	<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="QSMD2HRKJ2FGE">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>

<br/>
Please change Google api key for your site else interface will not work.
<br />
<br /><br />
<form action="" method="post">
<table width="100%" border="0" cellspacing="2" cellpadding="2">

  <tr>
    <td><strong>Google API </strong><div style="float: left; margin-left: 1px;margin-top: -18px;">
<img src="~/images/app-48x48.gif" />
</div></td>
    <td>&nbsp;</td>
  </tr>
 
  
  <tr>
    <td width="31%">Google Map API key for your site : 
      <label></label></td>
    <td width="69%"><input type="text" name="google_api_key" value="<?php echo get_option('google_api_key'); ?>" style="width:500px;" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Paypal Settings </strong><div style="float: left; margin-left: 1px;margin-top: -18px;">
<img src="~/images/paypal.jpg" />
</div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Paypal return url : 
      <br /></td>
    <td><input type="text" name="dist_return_url" value="<?php echo get_option('dist_return_url'); ?>" style="width:500px;" /><br />
       <span style="color:#FF0000; font-size:10px;">If permalink is on please change it accordingly.</span></td>
  </tr>
  <tr>
    <td>Paypal Business email address :      </td>
    <td><input type="text" name="paypal_business_email" value="<?php echo get_option('paypal_business_email'); ?>" style="width:500px;"/></td>
  </tr>
  <tr>
    <td>Paypal Mode: </td>
    <td><label>
      <select name="mode">
        <option <?php if(get_option('mode')=='https://www.paypal.com/cgi-bin/webscr'){ ?> selected="selected"<?php } ?> value="https://www.paypal.com/cgi-bin/webscr">Paypal</option>
		<option <?php if(get_option('mode')=='https://www.sandbox.paypal.com/cgi-bin/webscr'){ ?> selected="selected"<?php } ?> value="https://www.sandbox.paypal.com/cgi-bin/webscr">Sandbox</option>
      </select>
    </label></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><strong>Credit Card Payment Settings - Paypal Do Direct (NVP) </strong><div style="float: left; margin-left: 1px;margin-top: -18px;">
<img src="~/images/credit_cards.png" />
</div></td>
  </tr>
  <tr>
    <td>Environment:</td>
    <td><select name="CCmode">
        <option <?php if(get_option('CCmode')=='sandbox'){ ?> selected="selected"<?php } ?> value="sandbox">sandbox</option>
		<option <?php if(get_option('CCmode')=='beta-sandbox'){ ?> selected="selected"<?php } ?> value="beta-sandbox">beta-sandbox</option>
		<option <?php if(get_option('CCmode')=='live'){ ?> selected="selected"<?php } ?> value="live">live</option>
      </select></td>
  </tr>
  <tr>
    <td>api username</td>
    <td><input type="text" name="my_api_username" value="<?php echo get_option('my_api_username'); ?>" style="width:500px;"/></td>
  </tr>
  <tr>
    <td>api password </td>
    <td><input type="text" name="my_api_password" value="<?php echo get_option('my_api_password'); ?>" style="width:500px;"/></td>
  </tr>
  <tr>
    <td>api signature </td>
    <td><input type="text" name="my_api_signature" value="<?php echo get_option('my_api_signature'); ?>" style="width:500px;"/></td>
  </tr>
    <tr>
    <td colspan="2"><strong>Shipping root address</strong></td>
  </tr>
  <tr>
    <td>To Address:</td>
    <td><input type="text" name="to_admin" value="<?php echo get_option('to_admin'); ?>" style="width:500px;"/></td>
  </tr>
    <tr>
    <td>From Address:</td>
    <td><input type="text" name="from_admin" value="<?php echo get_option('from_admin'); ?>" style="width:500px;"/></td>
  </tr>
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
      <tr>
    <td>Application URL (Give the site URL where application is running):</td>
    <td><input type="text" name="application_url" value="<?php echo get_option('application_url'); ?>" style="width:500px;"/></td>
  </tr>
  <tr>
    <td colspan="2"><label>
	<input type="hidden" name="check" value="1" />
      <input type="submit" name="Submit" value="Update Settings" />
    </label></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"></td>
  </tr>
</table>
</form>
</div>
<?php

}


// Add to admin_menu function

add_action('admin_menu', 'my_plugin_menu');
add_action('admin_menu', 'my_plugin_settings');
	
		function query($query){
		$result= mysql_query($query);
		return $result;
		}
		
		function loadrows($result){
		while(@$row = mysql_fetch_object($result)){
		$rows[] =$row;
		}
		if(!empty($rows)){
		return $rows;
		}
		}
		
function my_plugin_settings()
{
add_menu_page(__('WPT'), __('WPT'), 'manage_options', 'my_new_menu', 'show_setting', '', 7); 
//add_submenu_page( 'my_new_menu', 'Configure distance', 'Configure distance', 'manage_options','my-unique-identifier_con','show_setting');
add_submenu_page( 'my_new_menu', 'WPT Order', 'WPT Order', 'manage_options','my-unique-identifier','ordershow');

//add_options_page('My Plugin Options', 'Configure distance', 'manage_options', 'my-unique-identifier_con', 'show_setting');
}
add_action( 'admin_menu' , 'admin_menu_new_items' );
function admin_menu_new_items() {
    global $submenu;
    $submenu['profile.php'][500] = array( 'My Order', 'read' , get_option('application_url') );
}
	
function my_plugin_menu() {

	//add_options_page('My Plugin Options', 'Distance Order', 'manage_options', 'my-unique-identifier', 'ordershow');
	
	    global $wpdb;
		  $utable = $wpdb->prefix."dist_users";
		$usertable = "CREATE TABLE $utable (
`userid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`name` VARCHAR( 255 ) NOT NULL ,
`username` VARCHAR( 255 ) NOT NULL ,
`email` VARCHAR( 255 ) NOT NULL ,
`passw` VARCHAR( 255 ) NOT NULL ,
`phn` VARCHAR( 255 ) NOT NULL ,
`ccno` VARCHAR( 255 ) NOT NULL
) ENGINE = MYISAM ;";
$wpdb->query($usertable);		

    $table = $wpdb->prefix."distance_order";
    $structure = "CREATE TABLE $table (
`ordid` INT( 11 ) NOT NULL AUTO_INCREMENT,
PRIMARY KEY ( `ordid` ),
`source_address` VARCHAR( 255 ) NOT NULL ,
`desti_address` VARCHAR( 255 ) NOT NULL ,
`total_distance` INT( 11 ) NOT NULL ,
`total_qty` INT( 11 ) NOT NULL ,
`total_weight` INT( 11 ) NOT NULL ,
`total_price` DECIMAL( 20, 2 ) NOT NULL ,
`payment_status` INT( 11 ) NOT NULL ,
`txn_id` VARCHAR( 255 ) NOT NULL ,
`phone` VARCHAR( 255 ) NOT NULL ,
`email` VARCHAR( 255 ) NOT NULL ,
`date_or` DATETIME NOT NULL,
`order_status` INT( 11 ) NOT NULL,
`service_type` VARCHAR( 255 ) NOT NULL,
`payment_type` VARCHAR( 255 ) NOT NULL
);";
$wpdb->query($structure);
$table_map = $wpdb->prefix."order_user_map";
$tab = "CREATE TABLE $table_map (
`oid` INT NOT NULL ,
`uid` INT NOT NULL
) ENGINE = MYISAM ;";
$wpdb->query($tab);
if(get_option('dist_return_url')=="")
{
$table_page = $wpdb->prefix."posts";	
$page ="INSERT INTO $table_page(
`ID` ,
`post_author` ,
`post_date` ,
`post_date_gmt` ,
`post_content` ,
`post_title` ,
`post_excerpt` ,
`post_status` ,
`comment_status` ,
`ping_status` ,
`post_password` ,
`post_name` ,
`to_ping` ,
`pinged` ,
`post_modified` ,
`post_modified_gmt` ,
`post_content_filtered` ,
`post_parent` ,
`guid` ,
`menu_order` ,
`post_type` ,
`post_mime_type` ,
`comment_count`
)
VALUES (
NULL , '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Thank you, You order completed successfully , we will get back to you with in 24 hrs.For order and payment confirmation please check your email. Team', 'Thank you', '', 'publish', 'close', 'open', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '100', '', '0', 'page', '', '0'
);";
	
$wpdb->query($page);
$lastinsertid = mysql_insert_id();		

$table_option = $wpdb->prefix."options";
$option ="INSERT INTO $table_option (
`option_id` ,
`blog_id` ,
`option_name` ,
`option_value` ,
`autoload`
)
VALUES (
NULL , '0', 'dist_return_url', '".bloginfo('wp-url')."/index.php?page_id=".$lastinsertid."', 'yes'
), (
NULL , '0', 'paypal_business_email', '', 'yes'
), (
NULL , '0', 'google_api_key', '', 'yes'
), (
NULL , '0', 'mode', 'https://www.sandbox.paypal.com/cgi-bin/webscr', 'yes'
), (
NULL , '0', 'CCmode', 'sandbox', 'yes'
), (
NULL , '0', 'my_api_username', '', 'yes'
), (
NULL , '0', 'my_api_password', '', 'yes'
), (
NULL , '0', 'my_api_signature', '', 'yes'
), (
NULL , '0', 'to_admin', '', 'yes'
), (
NULL , '0', 'from_admin', '', 'yes'
), (
NULL , '0', 'application_url', 'index.php', 'yes'
);"; 
	
$wpdb->query($option);	
}
	
}
function ordershow() {
  global $wpdb;


	if (!current_user_can('manage_options'))  {
		wp_die( __('You do not have sufficient permissions to access this page.') );
	}
	
	if(isset($_REQUEST['id'])&& isset($_REQUEST['status']))
	{
	$table_order = $wpdb->prefix."distance_order";
	$updateStatus = "update $table_order set order_status=".$_REQUEST['status']." where ordid=".$_REQUEST['id'];
	query($updateStatus);
	
	}
	?>
<div class="wrap">
<div style="float:left;margin-top: 8px;">
<img src="~/images/order.gif" />
</div>

<h2><?php echo esc_html( 'Order Page' ); ?></h2>


<script>
function updateStatus(id)
{
var status = document.getElementById('ship_status'+id).value;
window.location="admin.php?page=my-unique-identifier&statussort&id="+id+"&status="+status; 
}

function shipStatusSort()
{
var status = document.getElementById('ship_status_sort').value;
window.location="admin.php?page=my-unique-identifier&statussort="+status; 
}
function ordersearch()
{
var num = document.getElementById('ordernum').value;
window.location="admin.php?page=my-unique-identifier&ordernumcheck="+num; 

}
function printpage() {
  window.print();
  }
  function popup(mylink, windowname)
{
if (! window.focus)return true;
var href;
if (typeof(mylink) == 'string')
   href=mylink;
else
   href=mylink.href;
window.open(href, windowname, 'width=400,height=300,scrollbars=yes');
return false;
}


</script>
 <style>
 .tds{
 background:#CCCCCC;
 font-size:10px;
 color:#333333;
 border:1px #333333 solid; 
 border-right:0px;
 border-bottom:0px;
  padding:5px;
 }
 .tab
 {
 border-bottom:1px solid  #333333;
  border-right:1px solid  #333333	;
 }
 div.pagination {
font-family:Helvetica,Arial,sans-serif;
	padding: 3px;
	
	float: left;
}

div.pagination a {
font-family:Helvetica,Arial,sans-serif;
	padding: 2px 5px 2px 5px;
	margin: 2px;

	
	
	text-decoration: none; /* no underline */
	color: #000;
}
div.pagination a:hover, div.pagination a:active {
	

	color: #2CA1C8;
}
div.pagination span.current {
	padding: 2px 5px 2px 5px;
	margin: 2px;
		
		
		font-weight: bold;
		
		color: #2CA1C8;
	}
	div.pagination span.disabled {
		padding: 2px 5px 2px 5px;
		margin: 2px;

	
		color: #EAEAEA;
	}
	div.pagination a strong{
	
	
	color: #2CA1C8;
	}

 </style>
<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td>
	  <h3>If you have any questions, Please don't hestitate to contact me at info@appletechdesigns.com or visit the plugin support page at <a href="http://www.appletechdesigns.com/wptransportation/"> Apple Tech Designs </a>  </h3>
	 &nbsp;&nbsp; Your donation is greatly appreciated 
	<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="QSMD2HRKJ2FGE">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>
<br/> 
	
	Sort by Shipping Status : <select name="ship_status_sort" id="ship_status_sort" onchange="shipStatusSort();">
      <option <?php if($_REQUEST['statussort']==0){?> selected="selected"  <?php }?>  value="0">Pending</option>
      <option <?php if($_REQUEST['statussort']==1){?> selected="selected"  <?php }?> value="1">On the way</option>
      <option <?php if($_REQUEST['statussort']==2){?> selected="selected"  <?php }?> value="2">Postpone</option>
      <option <?php if($_REQUEST['statussort']==3){?> selected="selected"  <?php }?> value="3">Delay</option>
      <option <?php if($_REQUEST['statussort']==4){?> selected="selected"  <?php }?> value="4">Shipped Done</option>
	  <option <?php if($_REQUEST['statussort']==5){?> selected="selected"  <?php }?> value="5">Decline</option>
	  </select>&nbsp;&nbsp;<input name="ordernum" id="ordernum" type="text" value="Order Number" /> Ex:DIST-20&nbsp;<input name="ordernumcheck" id="ordernumcheck" type="button" onclick="ordersearch();" value="Search" />
	

	  </td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="2" class="tab">
  <tr>
    <td class="tds" ><strong>#</strong></td>
	 <td class="tds" ><strong>Order Id</strong></td>
	<td class="tds" ><strong>Phone</strong></td>
	<td class="tds" ><strong>Email</strong></td>
   <td class="tds" ><strong>From Add</strong></td>
   <td class="tds" ><strong>To Add</strong></td>
     <td class="tds" ><strong>Qty</strong></td>
	    <td class="tds" ><strong>Trans ID</strong></td>
	  <td class="tds" ><strong>Weight</strong></td>
	   <td class="tds" ><strong>Service Type</strong></td>
    <td class="tds" ><strong>Amount</strong></td>
	<td class="tds" ><strong>Payment Status</strong></td>
	<td class="tds" ><strong>Order date</strong></td>
    <td class="tds" ><strong>Order Status</strong></td>
  </tr>
  <?php

  $table_order = $wpdb->prefix."distance_order";
  if($_REQUEST['statussort']!="")
  {
   $selectOrder = "select * from $table_order where order_status='".$_REQUEST['statussort']."' order by ordid";
  }elseif($_REQUEST['ordernumcheck']!="")
  {
  $ordernum = str_replace("DIST-","",$_REQUEST['ordernumcheck']);
  $selectOrder = "select * from $table_order where ordid='".$ordernum."' order by ordid";
  }
  else
  {
  $selectOrder = "select * from $table_order order by ordid";
  }
  $resOr1 = query($selectOrder);
  $rowOr1 = loadrows($resOr1);
  
  $targetpage='admin.php?page=my-unique-identifier';
		$adjacents = 3;
		$limit = 6;
		
		$total_pages = count($rowOr1);
		$page = $_GET['page1'];
	if($page) 
	{
		$start = ($page - 1) * $limit; 	
		}		//first item to display on this page
	else
	{
		$start = 0;								//if no page var is given, set start to 0
			}
			//echo $query;


  if($_REQUEST['statussort']!="")
  {
   $select = "select * from $table_order where order_status='".$_REQUEST['statussort']."' order by ordid LIMIT $start, $limit";
 	}elseif($_REQUEST['ordernumcheck']!="")
  {
  $ordernum = str_replace("DIST-","",$_REQUEST['ordernumcheck']);
   $select = "select * from $table_order where ordid='".$ordernum."' order by ordid LIMIT $start, $limit";
  }
	else
	{
	  $select = "select * from $table_order  order by ordid LIMIT $start, $limit";
	}
	//$select_pag = "select * from products where ".$where." LIMIT $start, $limit";
			
  $resOr = query($select);
  $rowOr = loadrows($resOr);
	
						
				/* Setup page vars for display. */
	if ($page == 0) $page = 1;					//if no page var is given, default to 1.
	$prev = $page - 1;							//previous page is page - 1
	$next = $page + 1;							//next page is page + 1
	$lastpage = ceil($total_pages/$limit);		//lastpage is = total pages / items per page, rounded up.
	$lpm1 = $lastpage - 1;	

	$pagination = "";
	if($lastpage > 1)
	{	
		$pagination .= "<div class=\"pagination\">";
		//previous button
		if ($page > 1) 
			$pagination.= "<a href=\"$targetpage&page1=$prev\"><strong>&lt;&lt; Previous</strong></a>";
		else
			$pagination.= "&nbsp;";	
		
		//pages	
		if ($lastpage < 7 + ($adjacents * 2))	//not enough pages to bother breaking it up
		{	
			for ($counter = 1; $counter <= $lastpage; $counter++)
			{
				if ($counter == $page)
					$pagination.= "<span class=\"current\">$counter</span>";
				else
					$pagination.= "<a href=\"$targetpage&page1=$counter\">$counter</a>";					
			}
		}
		elseif($lastpage > 5 + ($adjacents * 2))	//enough pages to hide some
		{
			//close to beginning; only hide later pages
			if($page < 1 + ($adjacents * 2))		
			{
				for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
				{
					if ($counter == $page)
						$pagination.= "<span class=\"current\">$counter</span>";
					else
						$pagination.= "<a href=\"$targetpage&page1=$counter\">$counter</a>";					
				}
				$pagination.= "...";
				$pagination.= "<a href=\"$targetpage&page1=$lpm1\">$lpm1</a>";
				$pagination.= "<a href=\"$targetpage&page1=$lastpage\">$lastpage</a>";		
			}
			//in middle; hide some front and some back
			elseif($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2))
			{
				$pagination.= "<a href=\"$targetpage&page1=1\">1</a>";
				$pagination.= "<a href=\"$targetpage&page1=2\">2</a>";
				$pagination.= "...";
				for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++)
				{
					if ($counter == $page)
						$pagination.= "<span class=\"current\">$counter</span>";
					else
						$pagination.= "<a href=\"$targetpage&page1=$counter\">$counter</a>";					
				}
				$pagination.= "...";
				$pagination.= "<a href=\"$targetpage&page1=$lpm1\">$lpm1</a>";
				$pagination.= "<a href=\"$targetpage&page1=$lastpage\">$lastpage</a>";		
			}
			//close to end; only hide early pages
			else
			{
				$pagination.= "<a href=\"$targetpage&page1=1\">1</a>";
				$pagination.= "<a href=\"$targetpage&page1=2\">2</a>";
				$pagination.= "...";
				for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++)
				{
					if ($counter == $page)
						$pagination.= "<span class=\"current\">$counter</span>";
					else
						$pagination.= "<a href=\"$targetpage&page1=$counter\">$counter</a>";					
				}
			}
		}
		
		//next button
		if ($page < $counter - 1) 
			$pagination.= "<a href=\"$targetpage&page1=$next\"><strong>Next &gt;&gt;</strong></a>";
		else
			$pagination.= "&nbsp;";
		$pagination.= "</div>\n";		
	}
  
  
  //print_r($rowOr);
  if(count($rowOr) >0)
  {
  
  $i=0;
  foreach($rowOr as $rowOrs)
  {
  $i++;
//$date = new DateTime($rowOrs->date_or);
//$final_date = $date->format('d M Y');
  ?>
  
    <tr>
    <td class="tds" ><?php echo $i; ?></td>
	 <td class="tds" >DIST-<?php echo $rowOrs->ordid; ?></td>
   <td class="tds" ><?php echo $rowOrs->phone; ?></td>
     <td class="tds" ><?php echo $rowOrs->email; ?><br /><a 
   href="<?php echo bloginfo('wpurl');?>/wp-content/plugins/distance/mail.php?oid=<?php echo $rowOrs->ordid; ?>" 
   onClick="return popup(this, 'Mail Sent')"><img src="~/images/mail_icon.gif" border="0"/></a></td>
   <td class="tds" ><?php echo $rowOrs->source_address; ?></td>
   <td class="tds" ><?php echo $rowOrs->desti_address; ?></td>
     <td class="tds" ><?php echo $rowOrs->total_qty; ?></td>
	   <td class="tds" ><?php echo $rowOrs->txn_id; ?></td>
	    <td class="tds" ><?php echo $rowOrs->total_weight; ?>lb</td>
		<td class="tds" ><?php echo $rowOrs->service_type; ?></td>
		<td class="tds" >$<?php echo $rowOrs->total_price; ?></td>
	<td class="tds" ><?php if($rowOrs->payment_status==0){ echo "Pending";}else{echo "paid";} ?></td>
	<td class="tds" ><?php echo $rowOrs->date_or; ?></td>
    <td class="tds" ><form action="" method="post" ><select name="ship_status" id="ship_status<?php echo $rowOrs->ordid; ?>">
      <option <?php if($rowOrs->order_status==0){?> selected="selected"  <?php }?>  value="0">Pending</option>
      <option <?php if($rowOrs->order_status==1){?> selected="selected"  <?php }?> value="1">On the way</option>
      <option <?php if($rowOrs->order_status==2){?> selected="selected"  <?php }?> value="2">Postpone</option>
      <option <?php if($rowOrs->order_status==3){?> selected="selected"  <?php }?> value="3">Delay</option>
      <option <?php if($rowOrs->order_status==4){?> selected="selected"  <?php }?> value="4">Shipped Done</option>
	   <option <?php if($rowOrs->order_status==5){?> selected="selected"  <?php }?> value="5">Decline</option>
	  
	  </select>
	  <input name="change" id="change" type="button" value="Update Status" onclick="updateStatus(<?php echo $rowOrs->ordid;?>);" />
	  </form></td>
  </tr>
  <?php
  }
?>

 
<?php
  }
  else
  {
  ?>
    <tr>
    <td colspan="13" class="tds" ><div align="center"><strong>No order found</strong></div></td>   </tr>
  <?php
  
  }
  
  ?>

    <tr>
    <td class="tds" ><strong>#</strong></td>
	 <td class="tds" ><strong>Order Id</strong></td>
	<td class="tds" ><strong>Phone</strong></td>
	<td class="tds" ><strong>Email</strong></td>
   <td class="tds" ><strong>From Add</strong></td>
   <td class="tds" ><strong>To Add</strong></td>
     <td class="tds" ><strong>Qty</strong></td>
	    <td class="tds" ><strong>Trans ID</strong></td>
	  <td class="tds" ><strong>Weight</strong></td>
	  <td class="tds" ><strong>Service Type</strong></td>
    <td class="tds" ><strong>Amount</strong></td>
	<td class="tds" ><strong>Payment Status</strong></td>
	<td class="tds" ><strong>Order date</strong></td>
    <td class="tds" ><strong>Order Status</strong></td>
  </tr>
  <?php if($pagination!="")
  {
  ?>
    <tr>
    <td colspan="14" class="tds" ><div align="right"><?php  echo  $pagination;?></div></td>   </tr>
	<tr>
    <td colspan="14" class="tds" ><div align="left"><a href="javascript:;" onclick="printpage();">Print</a></div></td>   </tr>
	<?php 
	}
	?>
</table>

</div>
<?php } 
function show()
{
//print_r($_REQUEST);
global $wpdb;
//session_start();
if($_REQUEST['edit'])
{
$utable = $wpdb->prefix."dist_users";
$pass = $_REQUEST['rpwd'];
//echo "<br/>";
//echo $_SESSION['login_passw'];
if($pass==$_SESSION['login_passw'])
{

$update = "update $utable set name='".$_REQUEST['fullname']."',username='".$_REQUEST['uname']."',email='".$_REQUEST['remail']."',phn='".$_REQUEST['phn_no']."',ccno='".$_REQUEST['cc_no']."' where userid='".$_SESSION['login_id']."'";
}
else
{
$update = "update $utable set name='".$_REQUEST['fullname']."',username='".$_REQUEST['uname']."',email='".$_REQUEST['remail']."',passw='".$pass."',phn='".$_REQUEST['phn_no']."',ccno='".$_REQUEST['cc_no']."' where userid='".$_SESSION['login_id']."'";
}
//echo $update;
//query($update);
?>
<p>
Profile succussfully updated. <a href="<?php echo $_SERVER['REQUEST_URI']?>">View Profile</a>
</p>
<?php
}
elseif(isset($_REQUEST['profile']))
{
?>
<script>
function validationForm()
{
var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

var name = document.getElementById('fullname').value;

var remail = document.getElementById('remail').value;

var rpwd = document.getElementById('rpwd').value;

var phn_no = document.getElementById('phn_no').value;
var cc_no = document.getElementById('cc_no').value;


if(name=="")
{
alert("Please fill your name.");
return false;
}

if(remail=="")
{
alert("Please fill your email.");
return false;
}





if(reg.test(remail) == false) 
{
alert('Invalid Email Address');
return false;
}

if(rpwd=="")
{
alert("Please fill your password.");
return false;
}




if(phn_no=="")
{
alert("Please fill your phone number.");
return false;
}





document.forms["registrationFormEdit"].submit();

}
</script>
<?php
$utable = $wpdb->prefix."dist_users";
$checkLogin = "select * from $utable where userid='".$_SESSION['login_id']."'";
$resLog = query($checkLogin);
$rowLog = loadrows($resLog);
?>
<form action="" method="post" name="registrationFormEdit" >
<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td colspan="2"><strong>Register Here </strong></td>
  </tr>
  <tr>
    <td width="50%">Name </td>
    <td width="50%"><label>
      <input type="text" name="fullname" id="fullname" value="<?php echo $rowLog[0]->name ;?>" />
    </label></td>
  </tr>
  <tr>
    <td>Username* </td>
    <td><?php echo $rowLog[0]->username ;?></td>
  </tr>
  <tr>
    <td>Email* </td>
    <td><input type="text" name="remail" id="remail" value="<?php echo $rowLog[0]->email ;?>" /></td>
  </tr>

  <tr>
    <td>Password* </td>
	
    <td><input type="password" name="rpwd" id="rpwd" value="<?php echo $rowLog[0]->passw ;?>" /></td>
  </tr>

  <tr>
    <td>Phone number* </td>
    <td><input type="text" name="phn_no" id="phn_no" value="<?php echo $rowLog[0]->phn;?>" /></td>
  </tr>
  <tr>
    <td>Credit Card number </td>
    <td><input type="text" name="cc_no" id="cc_no" value="<?php echo $rowLog[0]->ccno;?>" /></td>
  </tr>

  <tr>
    <td>(*) marked fields are required fields.</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td></td>
    <td><label>
	<input name="edit" type="hidden" value="1" />
      <input type="button" name="button" value=" Update " onclick="return validationForm()" />
    </label></td>
  </tr>
</table>
</form>

<?php
}
elseif(isset($_REQUEST['logout']))
{
session_destroy();
?>
<p>
You successfully logged out. <a href="<?php echo $_SERVER['REQUEST_URI']?>">GO</a>
</p>
<?php
}
elseif(isset($_REQUEST['loginForm']))
{
$utable = $wpdb->prefix."dist_users";
$username = $_REQUEST['uname'];
$password = md5(ltrim(rtrim($_REQUEST['pass'])));
$checkLogin = "select * from $utable where username='".$username."' and passw='".$password."'";
$resLog = query($checkLogin);
$rowLog = loadrows($resLog);
if(count($rowLog)>0)
{
$_SESSION['login_id']= $rowLog[0]->userid;
$_SESSION['login_username']= $rowLog[0]->username;
$_SESSION['login_passw']= $rowLog[0]->passw;
$_SESSION['login_name']= $rowLog[0]->name;
$_SESSION['login_email']= $rowLog[0]->email;
$_SESSION['login_phn']= $rowLog[0]->phn;
$_SESSION['login_CC']= $rowLog[0]->ccno;
?>
<p>
<strong style="color:#009900;">SUCCESSFULL LOGIN</strong>
</p>
<p>
<a href="<?php echo $_SERVER['PHP_SELF'];?>">Proceed</a>
</p>
<?php
}
else
{
?>
<p>
<strong style="color:#FF3300;">INVALID LOGIN</strong>
</p>
<form name="userLogin" action="" method="post">
<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td colspan="2"><strong>Login Here </strong></td>
  </tr>
  <tr>
    <td width="50%">Username </td>
    <td width="50%"><label>
      <input type="text" name="uname" />
    </label></td>
  </tr>
  <tr>
    <td>Password</td>
    <td><input type="password" name="pass" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="loginForm" value=" Login " />
    </label></td>
  </tr>
</table>
</form>
<?php
}
}
else
{

if(isset($_REQUEST['loghidd']))
{
?>
<form name="userLogin" action="" method="post">
<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td colspan="2"><strong>Login Here </strong></td>
  </tr>
  <tr>
    <td width="50%">Username </td>
    <td width="50%"><label>
      <input type="text" name="uname" />
    </label></td>
  </tr>
  <tr>
    <td>Password</td>
    <td><input type="password" name="pass" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="loginForm" value=" Login " />
    </label></td>
  </tr>
</table>
</form>
<?php
}
else
{

if($_REQUEST['signup']==1)
{

$utable = $wpdb->prefix."dist_users";
$password = md5($_REQUEST['rpwd']);

$checkLogin = "select * from $utable where username='".$_REQUEST['uname']."' and md5(passw)='".$password."'";
$resLog = query($checkLogin);
$rowLog = loadrows($resLog);
if(count($rowLog)>0)
{
?>
<p>
Username already exist please try another. <a href="<?php echo $_SERVER['REQUEST_URI']?>?reghidd=1">GO</a>
</p>
<?php
}
else
{
$insertReg = "insert into $utable (name,username,email,passw,phn,ccno) values ('".$_REQUEST['fullname']."','".$_REQUEST['uname']."','".$_REQUEST['remail']."','".$password."','".$_REQUEST['phn_no']."','".$_REQUEST['cc_no']."')";
query($insertReg);
?>
<p>
Please check your mail for login credentials.
</p>
<p>
<script>
function ordersearch_userlog()
{
document.forms["user_login"].submit();
}
</script>
	<form id="user_login" name="user_login" method="post" action="">
	<input name="login" id="login" type="button" value="Login" onclick="ordersearch_userlog();" />
	<input name="loghidd" type="hidden" value="" />
	</form>
</p>
<?php

ob_start();
?>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td>Your Username</td> <td><?php echo $_REQUEST['uname'];?></td>
  </tr>
    <tr>
   <td>Your Password</td>  <td><?php echo $_REQUEST['rpwd'];?></td>
  </tr>
</table>


<?php
$content = ob_get_clean();
//$email = get_option('admin_email');
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
//$mail_to=$roww[0]->v_email;
$mail_subject='Your Login Credentials'; 
@mail($_REQUEST['remail'], $mail_subject, $content, $headers);
}
}
else
{
if(isset($_REQUEST['reghidd']))
{
?>
<script>
function validationForm()
{
var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

var name = document.getElementById('fullname').value;
var uname = document.getElementById('uname').value;
var remail = document.getElementById('remail').value;
var cemail = document.getElementById('cemail').value;
var rpwd = document.getElementById('rpwd').value;
var cpwd = document.getElementById('cpwd').value;
var phn_no = document.getElementById('phn_no').value;
var cc_no = document.getElementById('cc_no').value;
var cbox = document.getElementById('cbox').checked;

if(name=="")
{
alert("Please fill your name.");
return false;
}
if(uname=="")
{
alert("Please fill your user name.");
return false;
}
if(remail=="")
{
alert("Please fill your email.");
return false;
}

if(cemail=="")
{
alert("Please fill your re-email.");
return false;
}

if(cemail!=remail)
{
alert("Both email ids are not same.");
return false;
}

if(reg.test(remail) == false) 
{
alert('Invalid Email Address');
return false;
}

if(rpwd=="")
{
alert("Please fill your password.");
return false;
}

if(cpwd=="")
{
alert("Please fill your re-password.");
return false;
}

if(rpwd!=cpwd)
{
alert("Both password are not same.");
return false;
}





if(cbox!=true)
{
alert("Please check on the agreement.");
return false;
}

document.forms["registrationForm"].submit();

}
</script>
<form action="" method="post" name="registrationForm" >
<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td colspan="2"><strong>Register Here </strong></td>
  </tr>
  <tr>
    <td width="50%">Name </td>
    <td width="50%"><label>
      <input type="text" name="fullname" id="fullname" />
    </label></td>
  </tr>
  <tr>
    <td>Username* </td>
    <td><input type="text" name="uname" id="uname" /></td>
  </tr>
  <tr>
    <td>Email* </td>
    <td><input type="text" name="remail" id="remail" /></td>
  </tr>
  <tr>
    <td>Confirm Email </td>
    <td><input type="text" name="cemail" id="cemail" /></td>
  </tr>
  <tr>
    <td>Password* </td>
    <td><input type="password" name="rpwd" id="rpwd" /></td>
  </tr>
  <tr>
    <td>Confirm Password </td>
    <td><input type="password" name="cpwd" id="cpwd" /></td>
  </tr>
  <tr>
    <td>Phone number* </td>
    <td><input type="text" name="phn_no" id="phn_no" /></td>
  </tr>
  <tr>
    <td>Credit Card number </td>
    <td><input type="text" name="cc_no" id="cc_no" /></td>
  </tr>
  <tr>
    <td>I agree check box </td>
    <td><input type="checkbox" name="cbox" id="cbox" value="1" /></td>
  </tr>
  <tr>
    <td>(*) marked fields are required fields.</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td></td>
    <td><label>
	<input name="signup" type="hidden" value="1" />
      <input type="button" name="button" value=" Register " onclick="return validationForm()" />
    </label></td>
  </tr>
</table>
</form>
<?php
}
else
{

if($_REQUEST['ordernum_user']!="")
{ 
  $table_order = $wpdb->prefix."distance_order";
    $table_order_map = $wpdb->prefix."order_user_map";
	
  //$ordernum = str_replace("DIST-","",$_REQUEST['ordernum_user']);
 $selectOrder = "select t1.*,t2.* from $table_order t1,$table_order_map t2 where t1.ordid=t2.oid and t2.uid='".$_SESSION['login_id']."'  order by ordid";
  $resO = query($selectOrder);
  $row0 = loadrows($resO);
  
  if(count($row0)>0)
  {
  foreach($row0 as $row0s)
  {
  ?>
  <table width="100%" border="0" cellspacing="2" cellpadding="2" style="background:#CCCCCC; border:1px #999999 solid;">
  <tr>
    <td colspan="2"><strong style="font-size:18px;">Your Order # DIST-<?php echo $row0s->ordid;?> </strong></td>
  </tr>
  <tr>
    <td width="42%"><strong>From Address:</strong></td>
    <td width="58%"><?php echo $row0s->source_address ;?></td>
  </tr>
  <tr>
    <td><strong>To Address:</strong></td>
    <td><?php echo $row0s->desti_address ;?></td>
  </tr>
  <tr>
    <td><strong>Qty:</strong></td>
    <td><?php echo $row0s->total_qty ;?> </td>
  </tr>
  <tr>
    <td><strong>Weight:</strong></td>
    <td><?php echo $row0s->total_weight ;?> lb</td>
  </tr>
  <tr>
    <td><strong>Order date:</strong></td>
    <td><?php echo $row0s->date_or ;?></td>
  </tr>
      <tr>
    <td><strong>Payment Status:</strong></td>
    <td><?php if($row0s->payment_status==0) {echo "Unpaid";}else{echo "Paid";}?></td>
  </tr>
  <?php
  if($row0s->txn_id!="")
  {
  ?>
    <tr>
    <td><strong>Transaction ID:</strong></td>
    <td><?php echo $row0s->txn_id ;?></td>
  </tr>
  <?php } ?>
  <tr>
    <td><strong>Order Status:</strong></td>
    <td>
	<?php 
	if($row0s->order_status==0){ echo "Pending";}
	if($row0s->order_status==1){ echo "On the way";}
	if($row0s->order_status==2){ echo "Postpone";}
	if($row0s->order_status==3){ echo "Delay";}
	if($row0s->order_status==4){ echo "Shipped Done";}
	if($row0s->order_status==5){ echo "Decline";}
	
	?></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<?php
}
}
else
{
?>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td>There is no orders yet..</td>
  </tr>
</table>


<?php
  
}
?>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td>To <strong>Decline</strong> your order please mail to admin with your order details (<?php echo get_option('admin_email'); ?>) </td>
  </tr>
    <tr>
    <td><a href="<?php echo $_SERVER['HTTP_REFERER'];?>">Go back</a></td>
  </tr>
    <tr>
      <td></td>
    </tr>
</table>
<?php

}
else
{


if($_REQUEST['__payment']=="CC")
{
// Set request-specific fields.
$paymentType = urlencode('Sale');				// or 'Sale' Authorization
$firstName = urlencode($_REQUEST['firstName']);
$lastName = urlencode($_REQUEST['lastName']);
$creditCardType = urlencode($_REQUEST['CCType']);
$creditCardNumber = urlencode($_REQUEST['CCNo']);
$expDateMonth = $_REQUEST['CCExpiresMonth'];
// Month must be padded with leading zero
$padDateMonth = urlencode(str_pad($expDateMonth, 2, '0', STR_PAD_LEFT));

$expDateYear = urlencode($_REQUEST['CCExpiresYear']);
$cvv2Number = urlencode($_REQUEST['CVV']);
$address1 = urlencode($_REQUEST['address1']);
$address2 = urlencode($_REQUEST['address2']);
$city = urlencode($_REQUEST['city']);
$state = urlencode($_REQUEST['state']);
$zip = urlencode($_REQUEST['zip']);
$country = urlencode($_REQUEST['country']);				// US or other valid country code
$amount = urlencode($_SESSION['amount']);
$currencyID = urlencode('USD');							// or other currency ('GBP', 'EUR', 'JPY', 'CAD', 'AUD')

// Add request-specific fields to the request string.
$nvpStr =	"&PAYMENTACTION=$paymentType&AMT=$amount&CREDITCARDTYPE=$creditCardType&ACCT=$creditCardNumber".
			"&EXPDATE=$padDateMonth$expDateYear&CVV2=$cvv2Number&FIRSTNAME=$firstName&LASTNAME=$lastName".
			"&STREET=$address1&CITY=$city&STATE=$state&ZIP=$zip&COUNTRYCODE=$country&CURRENCYCODE=$currencyID";

// Execute the API operation; see the PPHttpPost function above.
$httpParsedResponseAr = PPHttpPost('DoDirectPayment', $nvpStr);

if("SUCCESS" == strtoupper($httpParsedResponseAr["ACK"]) || "SUCCESSWITHWARNING" == strtoupper($httpParsedResponseAr["ACK"])) {
	//exit('Direct Payment Completed Successfully: '.print_r($httpParsedResponseAr, true));
	//print_r($httpParsedResponseAr);
	//exit();
global $wpdb;

$table_order = $wpdb->prefix."distance_order";
//$updateOrder="update $table_order set payment_status='1' and txn_id='".$httpParsedResponseAr['TRANSACTIONID']."' where ordid='".$_SESSION['order_id']."'";

$updateOrder = "UPDATE $table_order SET `payment_status` = '1',
`txn_id` = '".$httpParsedResponseAr['TRANSACTIONID']."' WHERE `ordid` =".$_SESSION['order_id'];
query($updateOrder);


ob_start();

?>

Payment Successfull
</p>
<p>
Order ID : DIST-<?php echo $_SESSION['order_id'];?>
</p>
<p>
Transaction ID : <?php echo $httpParsedResponseAr['TRANSACTIONID'];?>
</p>
<p>
Total Amount : $<?php echo $_SESSION['amount'];?>
</p>
<p>
Item name : <?php echo $_SESSION['address1'];?> to <?php echo $_SESSION['address2'];?>-<?php echo $service;?> (<?php echo $_SESSION['qty'];?><?php echo $pack;?>)
</p>

<?php
$content = ob_get_clean();
//$email = get_option('admin_email');
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
//$mail_to=$roww[0]->v_email;
$mail_subject=$_SESSION['address1']." to ".$_SESSION['address2']." - ".$service." (".$_SESSION['qty'].$pack." )";
@mail($_SESSION['email'], $mail_subject, $content, $headers);
@mail(get_option('admin_email'), $mail_subject, $content, $headers);

?>
<p>
Thank you, You order this successfully , we will get back to you with in 24 hrs.For order and payment confirmation please check your email.
</p>
Payment Successfull
</p>
<p>
Order ID : DIST-<?php echo $_SESSION['order_id'];?>
</p>
<p>
Transaction ID : <?php echo $httpParsedResponseAr['TRANSACTIONID'];?>
</p>
<p>
Total Amount : $<?php echo $_SESSION['amount'];?>
</p>
<p>
Item name : <?php echo $_SESSION['address1'];?> to <?php echo $_SESSION['address2'];?>-<?php echo $service;?> (<?php echo $_SESSION['qty'];?><?php echo $pack;?>)
</p>
<p>
 Team
</p>

<?php
session_destroy();
//$return_url = str_replace("/","",get_option('dist_return_url'));
//echo "<br />";
//echo get_option('dist_return_url');
//header("Location:".$return_url);
} else  {

	$_SESSION['msg']=urldecode($httpParsedResponseAr["L_LONGMESSAGE0"]);
	$reff = $_SERVER['HTTP_REFERER'];
	$_SESSION['CCard']=1;
	header("Location:".$reff);
	
}

}
else
{
if($_REQUEST['CCard']==1 || $_SESSION['CCard']==1)
{
//print_r($_SESSION);
?>

<form method="post" action="">

<!-- required parameters CH_uId or CH_toEmail -->
<input type="hidden" name="amount" value="<?php echo $_REQUEST['amount']; ?>">


<!-- your regular form follows -->
<table width="100%" border="0" cellpadding="2" cellspacing="3" bgcolor="#FFFFFF">
<?php
if($_SESSION['msg']!="")
{
?>
 <tr bgcolor="#E5E5E5">
    <td height="22" colspan="3" align="left" valign="middle"><strong style="color:#FF0000;"><?php echo $_SESSION['msg'];?></strong></td>
  </tr>
  <?php } $_SESSION['msg']="";?>
  <tr bgcolor="#E5E5E5">
    <td height="22" colspan="3" align="left" valign="middle"><strong>&nbsp;Billing Information (required)</strong></td>
  </tr>
  <tr>
    <td height="22" width="383" align="right" valign="middle">First Name:</td>
    <td width="558" colspan="2" align="left"><input name="firstName" type="text" size="50" value="<?php echo $_SESSION['login_name'];?>"></td>
  </tr>
  <tr>
    <td height="22" align="right" valign="middle">Last Name:</td>
    <td colspan="2" align="left"><input name="lastName" type="text" size="50" value="<?php echo $_SESSION['login_name'];?>"></td>
  </tr>

  <tr>
    <td height="22" align="right" valign="middle">Street Address:</td>
    <td colspan="2" align="left"><input name="address1" type="text" value="" size="50"></td>
  </tr>
  <tr>
    <td height="22" align="right" valign="middle">Street Address (2):</td>
    <td colspan="2" align="left"><input name="address2" type="text" value="" size="50"></td>
  </tr>
  <tr>
    <td height="22" align="right" valign="middle">City:</td>
    <td colspan="2" align="left"><input name="city" type="text" value="" size="50"></td>
  </tr>
  <tr>
    <td height="22" align="right" valign="middle">State/Province:</td>
    <td colspan="2" align="left"><input name="state" type="text" value="" size="50"></td>
  </tr>
  <tr>
    <td height="22" align="right" valign="middle">Zip/Postal Code:</td>
    <td colspan="2" align="left"><input name="zip" type="text" value="" size="50"></td>
  </tr>
  <tr>
    <td height="22" align="right" valign="middle">Country:</td>
    <td colspan="2" align="left"><input name="country" type="text" value="" size="50"></td>
  </tr>
  <tr>
    <td height="22" align="right" valign="middle">Phone:</td>
    <td colspan="2" align="left"><input name="phone" type="text" size="50" value="<?php echo $_SESSION['login_phn'];?>"></td>
  </tr>
  <tr>
    <td height="22" colspan="3" align="left" valign="middle">&nbsp;</td>
  </tr>
  <tr bgcolor="#E5E5E5">
    <td height="22" colspan="3" align="left" valign="middle"><strong>&nbsp;Credit Card (required)</strong></td>
  </tr>
  <tr>
    <td height="22" align="right" valign="middle">Credit Card Number:</td>
    <td colspan="2" align="left"><input name="CCNo" type="text" size="19" maxlength="40" value="<?php echo $_SESSION['login_CC'];?>"></td>
  </tr> 
  
  <tr>
    <td height="22" align="right" valign="middle">Credit Card Type:</td>
    <td colspan="2" align="left"><select name="CCType">
	<option value="Visa">Visa</option>
	<option value="MasterCard">MasterCard</option>
	<option value="Discover">Discover</option>
	<option value="Amex">Amex</option></select></td>
  </tr>
    <tr>
    <td height="22" align="right" valign="middle">CVV:</td>
    <td colspan="2" align="left"><input name="CVV" type="text" value="" size="19" maxlength="40"></td>
  </tr> 
  <tr>
    <td height="22" align="right" valign="middle">Expiry Date:</td>
    <td colspan="2" align="left">
      <SELECT NAME="CCExpiresMonth" >
        <OPTION VALUE="" SELECTED>--Month--
        <OPTION VALUE="01">January (01)
        <OPTION VALUE="02">February (02)
        <OPTION VALUE="03">March (03)
        <OPTION VALUE="04">April (04)
        <OPTION VALUE="05">May (05)
        <OPTION VALUE="06">June (06)
        <OPTION VALUE="07">July (07)
        <OPTION VALUE="08">August (08)
        <OPTION VALUE="09">September (09)
        <OPTION VALUE="10">October (10)
        <OPTION VALUE="11">November (11)
        <OPTION VALUE="12">December (12)
      </SELECT> /
      <SELECT NAME="CCExpiresYear">
        <OPTION VALUE="" SELECTED>--Year--
        <OPTION VALUE="2004">2004
        <OPTION VALUE="2005">2005
        <OPTION VALUE="2006">2006
        <OPTION VALUE="2007">2007
        <OPTION VALUE="2008">2008
        <OPTION VALUE="2009">2009
        <OPTION VALUE="2010">2010
        <OPTION VALUE="2011">2011
        <OPTION VALUE="2012">2012
        <OPTION VALUE="2013">2013
        <OPTION VALUE="2014">2014
        <OPTION VALUE="2015">2015
      </SELECT>    </td>
  </tr>
  <tr>
    <td height="22" colspan="3" align="center" valign="top"><input type="image" src="http://www.win4dtoday.com/images/button_pay_by_credit_card.jpg" border="0" name="submit" alt="Make payments with Creditcard - it's fast, free and secure!"><input name="__payment" type="hidden" value="CC" size="19" maxlength="40"></td>
    </tr>
  <tr>
    <td height="22" colspan="3" align="left" valign="top"></td>
  </tr>
</table>

</form>
<?php
$_SESSION['CCard']="";
}
else
{
if($_REQUEST['payment']==1)
{
if($_REQUEST['payment']==1)
{
$_SESSION['service_readonly'] = $_REQUEST['service_readonly'];
$_SESSION['address1'] = $_REQUEST['address1'];
$_SESSION['address2'] = $_REQUEST['address2'];
$_SESSION['distance'] = $_REQUEST['distance'];
$_SESSION['qty'] = $_REQUEST['qty'];
$_SESSION['weight'] = $_REQUEST['weight'];
$_SESSION['amount'] = $_REQUEST['amount'];
$_SESSION['phn'] = $_REQUEST['phn'];
$_SESSION['email'] = $_REQUEST['email'];
}


if($_SESSION['service_readonly']==0.5)
{
$service = "Basic service";
}
elseif($_SESSION['service_readonly']==0.75)
{
$service = "Hotshot service";
}
elseif($_SESSION['service_readonly']==1)
{
$service = "Directshot";
}
else
{
$service = "18 wheel trcuk service";
}

if($_SESSION['pack_readonly']=='p1')
{
$pack = "Piece";
}
else
{
$pack = "Skid";
}

   if($_REQUEST['payment']==1)
{
$table_order = $wpdb->prefix."distance_order";
$insert_order  = "insert into $table_order (source_address,desti_address,total_distance,total_qty,total_weight,	total_price,payment_status,txn_id,phone,email,date_or,order_status,service_type) values ('".$_SESSION['address1']."','".$_SESSION['address2']."','".$_SESSION['distance']."','".$_SESSION['qty']."','".$_SESSION['weight']."','".$_SESSION['amount']."','0','','".$_SESSION['phn']."','".$_SESSION['email']."',NOW(),'0','".$service."')";

query($insert_order);
$order_id = mysql_insert_id();
$_SESSION['order_id']=$order_id;
if(isset($_SESSION['login_id']))
{
 wp_get_current_user();
 $userid = $current_user->ID;
$table_map = $wpdb->prefix."order_user_map";
$q = "INSERT INTO $table_map (`oid` ,`uid`)VALUES ('".$_SESSION['order_id']."','".$_SESSION['login_id']."')";
query($q);
}
}

?>
<h2>Your order Details</h2>
<p>
<strong>Item Name :</strong> FROM &nbsp; <?php echo $_SESSION['address1'];?> &nbsp;TO &nbsp; <?php echo $_SESSION['address2'];?> &nbsp;(<?php echo $_SESSION['distance'];?> mi.)
</p>
<p>
<strong>Service Type : </strong><?php echo $service;?>.
</p>
<p>
<strong>Package Type :</strong> <?php echo $pack;?>.
</p>
<p>
<strong>Qty :</strong> <?php echo $_SESSION['qty'];?>.
</p>
<p>
<strong>Weight : </strong><?php echo $_SESSION['weight'];?> lb.
</p>
<p>
<strong>Total Driving Distance : </strong><?php echo $_SESSION['distance'];?> mi.
</p>
<p>
<strong>Total Amount : </strong>$<?php echo $_SESSION['amount'];?>.
</p>
<p>
<strong>If any issues we will contact here : </strong><?php echo $_SESSION['email'];?> / <?php echo $_SESSION['phn'];?>.
</p>

<p>
<strong style="color:#0066FF;">Payment</strong>
</p>
<p style="color:#990000;;">
Paypal

</p>

<form name="pay" method="post" action="<?php echo get_option('mode'); ?>">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="notify_url" value="<?php bloginfo( 'siteurl' ); ?>/wp-content/plugins/distance/paypal.php">

<input type="hidden" name="return" value="<?php echo bloginfo('siteurl');?><?php echo get_option('dist_return_url'); ?>">
<input type="hidden" name="cancel_return" value="<?php echo bloginfo('siteurl');?><?php echo get_option('dist_return_url'); ?>">
<input type="hidden" name="business" value="<?php echo get_option('paypal_business_email'); ?>">
<input type="hidden" name="item_name" value="<?php echo $_SESSION['address1'];?> to <?php echo $_SESSION['address2'];?>-<?php echo $service;?> (<?php echo $_SESSION['qty'];?><?php echo $pack;?>) ">
<input type="hidden" name="item_number" value="<?php echo $order_id;?>">
<input type="hidden" name="amount" value="<?php echo $_REQUEST['amount']; ?>">
<input type="hidden" name="no_shipping" value="1">
<input type="hidden" name="rm" value="2">
<input type="hidden" name="quantity" value="">
<input type="hidden" name="custom" value="<?php echo $_REQUEST['email'];?> ">

  <input type="image" src="http://www.dioramaminiatures.com/i/logos%20home%20page/paypal_logo_copy_1.jpg" height="40" width="113" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
</form>
<p style="color:#990000;;">
Credit Card
</p>
<form action="" name="" method="post">
<input type="image" src="http://www.sacredmetaphysics.com/resources/paypal_logo.gif" height="" width="238" border="0" name="submit" alt="Make payments with Creditcard - it's fast, free and secure!">
<input type="hidden" name="CCard" value="1">
</form>


<?php 

}
else
{

?>
<script src="http://maps.google.com/maps?file=api&v=2&key=<?php echo get_option('google_api_key'); ?>" type="text/javascript"></script>
	<!-- According to the Google Maps API Terms of Service you are required display a Google map when using the Google Maps API. see: http://code.google.com/apis/maps/terms.html -->
	<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">

  var directionDisplay;
  var directionsService = new google.maps.DirectionsService();
  var map;
  
initialize();
 
 
  function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    var chicago = new google.maps.LatLng(41.850033, -87.6500523);
    var myOptions = {
      zoom: 6,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      center: chicago
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    directionsDisplay.setMap(map);
  }
  
  function calcRoute() {
  
  	     var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		if(document.getElementById('address1').value=="" || document.getElementById('address2').value=="")
		{
		alert('Plesae fill the address');
		return false;
		}
		if (isNaN(document.getElementById('weight').value)) {
		alert('Plesae enter the valid weight');
		return false;
		}
		
		if(document.getElementById('weight').value=="")
		{
		alert('Plesae fill the weight');
		return false;
		}
		if(document.getElementById('email').value=="")
		{
		alert('Plesae fill the email');
		return false;
		}
		if(document.getElementById('phn').value=="")
		{
		alert('Plesae fill the Phone number');
		return false;
		}
		var address = document.getElementById('email').value;
        if(reg.test(address) == false) {
        alert('Invalid Email Address');
        return false;
        }
	
	
		if (isNaN(document.getElementById('qty').value)) {
		alert('Plesae enter the valid qty');
		return false;
		}
  
    var start = document.getElementById("start").value;
    var end = document.getElementById("end").value;
	
    var waypts = [];
    var checkboxArray = Array(document.getElementById("address1"),document.getElementById("address2"));
	//alert(checkboxArray.length);
    for (var i = 0; i < checkboxArray.length; i++) {
      
	  
	  //alert(checkboxArray[i].value);
        waypts.push({
            location:checkboxArray[i].value,
            stopover:true});
     
    }

    var request = {
        origin: start, 
        destination: end,
        waypoints: waypts,
        optimizeWaypoints: true,
        travelMode: google.maps.DirectionsTravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
        var route = response.routes[0];
		// 1 Km = 0.621371192237 Miles
		// 1 m =  0.000621371 Miles
		// 1 Feet = 0.000189394 Miles
		// 1 Yrds = 0.000568181 Miles
		
        var summaryPanel = document.getElementById("directions_panel");
        summaryPanel.innerHTML = "";
        // For each route, display summary information.
		//var drivingDistanceMiles = gDir.getDistance().meters / 1609.344;
      /*  for (var i = 0; i < route.legs.length; i++) {
          var routeSegment = i + 1;
          summaryPanel.innerHTML += "<b>Route Segment: " + routeSegment + "</b><br />";
          summaryPanel.innerHTML += route.legs[i].start_address + " to ";
          summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
          summaryPanel.innerHTML += route.legs[i].distance.text + "<br /><br />";
		  
        }*/
		document.getElementById('distance').value = 0;
		  for (var i = 0; i < route.legs.length; i++) {
         // var routeSegment = i + 1;
       var distance_field = document.getElementById('distance').value;
			
	   
          var dist = route.legs[i].distance.text;
		  //alert(dist);
		  var mySplitResult = dist.split(" ");
		  //alert(mySplitResult[1]);
		  if(mySplitResult[1]=='mi')
		  {
		  var mySplitDistance = mySplitResult[0].replace(",", "");
		  document.getElementById('distance').value = Number(document.getElementById('distance').value) + Number(mySplitDistance);
		  }
		   if(mySplitResult[1]=='ft')
		  {
		  var mySplitDistance = mySplitResult[0].replace(",", "");
		  var mySplitDistance = Number(mySplitDistance)* Number(0.000189394);
		  document.getElementById('distance').value = Number(document.getElementById('distance').value) + Number(mySplitDistance);
		  }
		    if(mySplitResult[1]=='m')
		  {
		  var mySplitDistance = mySplitResult[0].replace(",", "");
		  var mySplitDistance = Number(mySplitDistance)* Number(0.000621371);
		  document.getElementById('distance').value = Number(document.getElementById('distance').value) + Number(mySplitDistance);
		  }
		  
          var routeSegment = i + 1;
          summaryPanel.innerHTML += "<b>Route Segment: " + routeSegment + "</b><br />";
          summaryPanel.innerHTML += route.legs[i].start_address + " to ";
          summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
          summaryPanel.innerHTML += mySplitDistance + " mi <br /><br />";
		  
		  
        }
      }
	  
			
			
			var miles = document.getElementById('distance').value;
			
			var weight = document.getElementById('weight').value;
			var qty = document.getElementById('qty').value;
			var service = document.getElementById('service').value;
			var pack = document.getElementById('pack').value;
			
			document.getElementById('pack_readonly').value = pack;
			document.getElementById('service_readonly').value = service;
			
	
			
			
			var amount  = service * miles;
			
			if(qty > 1 && pack=='p1')
			{
			
			amount = amount + (qty * 1);
			}
			
			if(qty > 1 && pack=='p2')
			{
			
			amount = amount + (qty * 2.5);
			}
			
			if(weight > 100)
			{
			
			amount = amount + (weight/100 * 1);
			}
			
			//  if (document.getElementById("dist").disabled==true) // some logic to determine if it is ok to go
   // {document.getElementById("dist").disabled = false;}
           //  else // in case it was enabled and the user changed their mind
    //{document.getElementById("dist").disabled = true;}
	
    amount = amount.toFixed(2);
	//alert(amount);
	document.getElementById('amount').value = amount;
	document.getElementById('total_amount').innerHTML ="<strong> Total Amount:</strong> $"+amount ;
	document.getElementById('directions_panel').style.display='block';
	
	document.getElementById('confirm_payment').style.display='block';

	
    });
	
  }


			
			//document.getElementById('results').innerHTML = '<strong>From: </strong>' + location1.address + ' (lat`' + location1.lat + '/lon`' + location1.lon + ')<br /><strong>To: </strong>' + location2.address + ' (lat`' + location2.lat + '/lon`' + location2.lon + ')<br /><strong>Driving Distance: </strong>' + drivingDistanceMiles + ' miles /' + drivingDistanceKilometers + ' kilometers';
			
	function defaultcnt()
	{
	
	document.getElementById('conf').checked==false;
	document.getElementById("dist").disabled = false;
	document.getElementById("pay").disabled = true;
	}
	function pay_foo()
	{
	//alert(document.getElementById('conf').value);
		if(document.getElementById('conf').checked==true)
		{
		document.getElementById("dist").disabled = true;
		document.getElementById("pay").disabled = false;
		
		document.getElementById("qty").readOnly = true;
		document.getElementById("weight").readOnly = true;
		document.getElementById("service").disabled = true;
		document.getElementById("pack").disabled = true;
		document.getElementById("address1").readOnly = true;
		document.getElementById("address2").readOnly = true;
		
		//document.getElementById("confirm_payment").style.display="block"
		}
		else
		{
		document.getElementById("dist").disabled = false;
		document.getElementById("pay").disabled = true;
		
		document.getElementById("qty").readOnly = false;
		document.getElementById("weight").readOnly = false;
		document.getElementById("service").disabled = false;
		document.getElementById("pack").disabled = false;
		document.getElementById("address1").readOnly = false;
		document.getElementById("address2").readOnly = false;
		
		document.getElementById("confirm_payment").style.display="none"
		}
		document.getElementById("payment").value=1;
		
	}
	
function ordersearch_user()
{
document.forms["myorder"].submit();
}

function ordersearch_userlog()
{
document.forms["user_login"].submit();
}
function ordersearch_userreg()
{
document.forms["user_register"].submit();
}
function ordersearch_logout()
{
document.forms["logout"].submit();
}
function ordersearch_profile()
{
document.forms["profile"].submit();
}


	</script>
	<style>
		.rot{
		float: right;
		margin-left: 369px;
		margin-top: 74px;
		position: absolute;
		z-index: 10000;
		}
		.source{
	    border: 1px solid #999999;
    float: left;
    height: 90px;
    position: absolute;
    width: 160px;
    z-index: 1000;
		
		
		}
		
		.desti{
   float: right;
    margin-top: 26px;
    margin-left: 159px;
    position: absolute;
    z-index: 1000;
		
		
		
		}
	</style>
</head>

<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td colspan="2"><strong>Get Distance </strong></td>
  </tr>  
  <tr>
    <td>
	<?php if (!isset($_SESSION['login_id'])){ ?>
	<div style="float:left;">
	<form id="user_login" name="user_login" method="post" action="">
	<input name="login" id="login" type="button" value="Login" onclick="ordersearch_userlog();" />
	<input name="loghidd" type="hidden" value="1" />
	</form>
	</div>
	<div style="float:left;">
	<form id="user_register" name="user_register" method="post" action="">
	<input name="register" id="register" type="button" value="Register" onclick="ordersearch_userreg();" />
	<input name="reghidd" type="hidden" value="1" />
	</form>
	</div>
	<?php } else {?>
	<p>
	 Welcome, <?php echo $_SESSION['login_name'];?>
	 </p>
	 <div style="float:left;">
	<form id="myorder" name="myorder" method="post" action="">
	<input name="myorder" id="myorder" type="button" value="My Orders" onclick="ordersearch_user();" />
	<input name="ordernum_user" type="hidden" value="1" />
	</form>
	</div>
	<div style="float:left;">
	<form id="logout" name="logout" method="post" action="">
	<input name="logout" id="logout" type="button" value="Logout" onclick="ordersearch_logout();" />
	<input name="logout" type="hidden" value="1" />
	</form>
	</div>
		<div style="float:left;">
	<form id="profile" name="logout" method="post" action="">
	<input name="profile" id="profile" type="button" value="Profile" onclick="ordersearch_profile();" />
	<input name="profile" type="hidden" value="1" />
	</form>
	</div>
	<?php } ?>
	</td>
  </tr>
</table>

	<?php //print_r($_SESSION); ?>
<form id="distance_calculate" name="distance_calculate" method="post" action="">
<table width="100%" border="0" cellspacing="2" cellpadding="2">


<!--  <tr>
    <td colspan="2" style="font-size:12px; color:#355890;">
a- basic service (second day or more than 2 hrs wait ) which is for $0.5/mile<br />

b- hotshot service (within 2 hrs wait) : $0.75/mile<br />

c- directshot (on the spot service ) : $1/mile<br />

d- 18 wheel trcuk service ( for items more than 4 palets "bobtails" ) : $3/mile<br />

**If it is greater than 100 pounds then we will add $1 for each hundred pounds<br />
**For any additional pieces charge $1 per piece and for any additional skid charge $2.5 / skid</td>
  </tr>-->
  <tr>
    <td width="33%">From*</td>
    <td width="67%">
     
      <!--div class="source"><?php echo get_option('to_admin'); ?></div--><input type="hidden" name="start" id="start" value="<?php echo get_option('to_admin'); ?>" style="width:150px;" readonly="readonly"/><input type="text" name="address1" id="address1" value="" style="width:150px;"/></div><div class="rot">&nbsp;<br />      </td>
  </tr>
  <tr>
    <td>To*</td>
    <td width="67%">
        <!--div class="source"><?php echo get_option('from_admin'); ?></div--><input type="hidden" name="end" id="end" value="<?php echo get_option('from_admin'); ?>" style="width:150px;" readonly="readonly"/><input type="text" name="address2" id="address2" value="" style="width:150px;"/><br />      </td>
  </tr>
  <tr>
    <td>Select Service Type* </td>
    <td><label>
      <select name="service" id="service">
        <option value="0.5">basic service</option>
		<option value="0.75">hotshot service</option>
		<option value="1">directshot</option>
		<option value="3">18 wheel trcuk service</option>
      </select>
	  <input name="service_readonly" id="service_readonly" type="hidden"  />
    </label></td>
  </tr>
  <tr>
    <td>Package Type* </td>
    <td><select name="pack" id="pack">
      <option value="p1">piece</option>
	  <option value="p2">skid</option>
    </select>
	 <input name="pack_readonly" id="pack_readonly" type="hidden"  />	</td>
  </tr>
  <tr>
    <td>Quantity*</td>
    <td><input type="text" name="qty" id="qty" value="1" /><br /></td>
  </tr>
  <tr>
    <td>Weight*</td>
    <td><input type="text" name="weight" id="weight" /></td>
  </tr>
  <tr>
    <td colspan="2"><p id="directions_panel" style="margin:20px; padding:20px;background-color:#FFEE77; display:none;"></p><p id="total_amount"> </p> <p id="confirm_payment" style="display:none;"> <strong>Please Confirm Payment :</strong> <input name="conf" id="conf" type="checkbox" value="" onClick="pay_foo()" /></p></td>
    </tr>
  <tr>
    <td colspan="2"><label>
      <input type="hidden" name="amount" id="amount" />
	   <input type="hidden" name="distance" id="distance" />

    </label></td>
    </tr>
 <!-- <tr>
    <td>Discount Code</td>
    <td><input type="text" name="discount" id="discount" /></td>
  </tr-->
  <tr>
    <td>Contact Email*: </td>
    <td><input type="text" name="email" id="email" value="<?php echo $_SESSION['login_email'];?>" /></td>
  </tr>
  <tr>
    <td>Contact Number*: </td>
    <td><input type="text" name="phn" id="phn" value="<?php echo $_SESSION['login_phn'];?>"/></td>
  </tr>
  <tr>
    <td><label>
	<input type="hidden" name="address1_hidden" id="address1_hidden" />
	
	<input type="hidden" name="address2_hidden" id="address2_hidden"/>
	
	<input type="hidden" name="payment" id="payment" value="0" />

      <input type="button" name="button" id="dist" value="Get Distance"  onclick="calcRoute(); return false ;" />&nbsp;
    </label></td>
    <td><input type="submit" name="submit" id="pay" value="Pay Now" disabled="disabled" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"></td>
    </tr>
</table>
</form>

<?php
}
}
}
}
}
}
}
}
}
//echo show();
//add_action( 'admin_print_scripts-' . $edit_options_page , 'wpsc_print_admin_scripts' );
function PPHttpPost($methodName_, $nvpStr_) {
	global $environment;
	$environment = get_option('CCmode');
	// Set up your API credentials, PayPal end point, and API version.
	$API_UserName = urlencode(get_option('my_api_username'));
	$API_Password = urlencode(get_option('my_api_password'));
	$API_Signature = urlencode(get_option('my_api_signature'));
	$API_Endpoint = "https://api-3t.paypal.com/nvp";
	if("sandbox" === $environment || "beta-sandbox" === $environment) {
		$API_Endpoint = "https://api-3t.$environment.paypal.com/nvp";
	}
	$version = urlencode('51.0');

	// Set the curl parameters.
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $API_Endpoint);
	curl_setopt($ch, CURLOPT_VERBOSE, 1);

	// Turn off the server and peer verification (TrustManager Concept).
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);

	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_POST, 1);

	// Set the API operation, version, and API signature in the request.
	$nvpreq = "METHOD=$methodName_&VERSION=$version&PWD=$API_Password&USER=$API_UserName&SIGNATURE=$API_Signature$nvpStr_";

	// Set the request as a POST FIELD for curl.
	curl_setopt($ch, CURLOPT_POSTFIELDS, $nvpreq);

	// Get response from the server.
	$httpResponse = curl_exec($ch);

	if(!$httpResponse) {
		exit("$methodName_ failed: ".curl_error($ch).'('.curl_errno($ch).')');
	}

	// Extract the response details.
	$httpResponseAr = explode("&", $httpResponse);

	$httpParsedResponseAr = array();
	foreach ($httpResponseAr as $i => $value) {
		$tmpAr = explode("=", $value);
		if(sizeof($tmpAr) > 1) {
			$httpParsedResponseAr[$tmpAr[0]] = $tmpAr[1];
		}
	}

	if((0 == sizeof($httpParsedResponseAr)) || !array_key_exists('ACK', $httpParsedResponseAr)) {
		exit("Invalid HTTP Response for POST request($nvpreq) to $API_Endpoint.");
	}

	return $httpParsedResponseAr;
}






?>
