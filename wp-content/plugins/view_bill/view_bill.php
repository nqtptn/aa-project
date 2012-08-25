<?php
/*
Plugin Name: Quản lý hóa đơn
Plugin URI: http://vnestore.com
Description: Plugin quản lý hóa đơn
Version: 1.0
Author: LLN Group
Author URI: http://vnestore.com
License: GPL
*/
add_action( 'admin_menu', 'view_bill' );
function view_bill() {
	add_menu_page('In hóa đơn', 'In hóa đơn', 'subscriber','in_hoa_don', 'view_bill2',plugins_url('/images/menu-vs.png', __FILE__));
}
function view_bill2() {
	if($_GET['action']=="XML"){
		require_once('EditableGrid.php');
		require_once("in_hoa_don/xml.php");
	}elseif($_GET['action']=="update_record"){
		require_once("in_hoa_don/update2.php");
	}elseif($_GET['action']=="load_cuoc_phi"){
		require_once("in_hoa_don/load_cuoc_phi.php");
	}elseif($_GET['action']=="load_tinh_tp"){
		require_once("in_hoa_don/load_tinh_tp.php");
	}elseif($_GET['action']=="export_function"){
		require_once('pdf/html2pdf.class.php');
		require_once("in_hoa_don/export_function.php");
	}else{
		require_once("in_hoa_don/show_form.php");
	}
}

$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
if(!$mysqli->real_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME)){
	echo "Die";
}
global $wpdb;
$mysqli->set_charset($wpdb->charset);
add_action('admin_head','add_header_in_bill');
function add_header_in_bill() {
?>
<link type="text/css" rel="stylesheet" href="<?php echo plugins_url('/style.css', __FILE__)?>" />
<link type="text/css" rel="stylesheet" href="<?php echo plugins_url('/jquery-ui-1.8.16.custom.css', __FILE__)?>" />
<script type="text/javascript" src="<?php echo plugins_url('/editablegrid-2.0.1.js', __FILE__)?>"></script>
<script type="text/javascript" src="<?php echo plugins_url('/jquery-1.7.2.min.js', __FILE__) ?>"></script>
<script type="text/javascript" src="<?php echo plugins_url('/jquery-ui-1.8.16.custom.min.js', __FILE__) ?>"></script>
<?
}

