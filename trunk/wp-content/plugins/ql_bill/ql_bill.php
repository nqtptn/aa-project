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
//http://localhost/aaexpress/wp-admin/admin.php?page=ql_bill/ql_bill.php&noheader=1&nofooter=1&action=XML
add_action( 'admin_menu', 'ql_bill' );
function ql_bill() {
<<<<<<< .mine
	add_menu_page('Quản lý hóa đơn', 'Quản lý hóa đơn', 'administrator','ql_bill/ql_bill.php', 'ql_bill2',plugins_url('/59.gif', __FILE__));
	
	add_submenu_page('ql_bill/ql_bill.php','Quản lý dịch vụ', 'Quản lý dịch vụ', 'administrator','ql_bill/ql_dv.php');
	add_submenu_page('ql_bill/ql_bill.php','Quản lý tỉnh thành', 'Quản lý tỉnh thành', 'administrator','ql_bill/ql_tt.php');
	
=======
	add_menu_page('Quản lý hóa đơn', 'Quản lý hóa đơn', 'administrator','ql_bill/ql_bill.php', 'ql_bill2',plugins_url('/menu-vs.png', __FILE__));
	
	add_submenu_page('ql_bill/ql_bill.php','Quản lý dịch vụ', 'Quản lý dịch vụ', 'administrator','ql_bill/ql_dv.php');
	add_submenu_page('ql_bill/ql_bill.php','Quản lý tỉnh thành', 'Quản lý tỉnh thành', 'administrator','ql_bill/ql_tt.php');
	
>>>>>>> .r47
}
function ql_bill2() {
	if($_GET['action']=="XML"){
		include ("xml.php");
	}elseif($_GET['action']=="update_record"){
		include ("update2.php");
	}elseif($_GET['action']=="load_cuoc_phi"){
		include ("load_cuoc_phi.php");
	}elseif($_GET['action']=="load_tinh_tp"){
		include ("load_tinh_tp.php");
	}elseif($_GET['action']=="xuat_html"){
		include ("xuat_html.php");
	}else{
		include ("show_form.php");
	}
}
function ql_bill3() {
	echo "hello";
}
add_action('admin_head','add_header');
function add_header() {
?>
<link type="text/css" rel="stylesheet" href="<?php echo plugins_url('/style.css', __FILE__)?>" />
<link type="text/css" rel="stylesheet" href="<?php echo plugins_url('/jquery-ui-1.8.16.custom.css', __FILE__)?>" />
<script type="text/javascript" src="<?php echo plugins_url('/editablegrid-2.0.1.js', __FILE__)?>"></script>
<script type="text/javascript" src="<?php echo plugins_url('/jquery-1.7.2.min.js', __FILE__) ?>"></script>
<script type="text/javascript" src="<?php echo plugins_url('/jquery-ui-1.8.16.custom.min.js', __FILE__) ?>"></script>
<?
}