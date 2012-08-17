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
add_action( 'admin_menu', 'ql_bill' );
function ql_bill() {
	add_menu_page('Quản lý hóa đơn', 'Quản lý hóa đơn', 'administrator','quan_ly_hoa_don', 'ql_bill2',plugins_url('/images/menu-vs.png', __FILE__));
	add_submenu_page('quan_ly_hoa_don','Dịch vụ', 'Dịch vụ', 'administrator','quan_ly_dich_vu','ql_dv');
	add_submenu_page('quan_ly_hoa_don','Tỉnh thành', 'Tỉnh thành', 'administrator','quan_ly_tinh_thanh','ql_tt');
	add_submenu_page('quan_ly_hoa_don','Dịch vụ Tỉnh thành', 'Dịch vụ Tỉnh thành', 'administrator','dich_vu_tinh_thanh','dv_tt');
	add_submenu_page('quan_ly_hoa_don','Quản lý bảng giá', 'Quản lý bảng giá', 'administrator','quan_ly_bang_gia','ql_bg');
}
//Quan ly hoa don
function ql_bill2() {
	if($_GET['action']=="XML"){
		require_once('EditableGrid.php');
		require_once("quan_ly_hoa_don/xml.php");
	}elseif($_GET['action']=="update_record"){
		require_once("quan_ly_hoa_don/update2.php");
	}elseif($_GET['action']=="load_cuoc_phi"){
		require_once("quan_ly_hoa_don/load_cuoc_phi.php");
	}elseif($_GET['action']=="load_tinh_tp"){
		require_once("quan_ly_hoa_don/load_tinh_tp.php");
	}elseif($_GET['action']=="xuat_html"){
		require_once('pdf/html2pdf.class.php');
		require_once("quan_ly_hoa_don/xuat_html.php");
	}else{
		require_once("quan_ly_hoa_don/show_form.php");
	}
}

//Quan ly dich vu
function ql_dv() {
	if($_GET['action']=="XML"){
		require_once('EditableGrid.php');
		require_once("quan_ly_dich_vu/xml.php");
	}elseif($_GET['action']=="update_record"){
		require_once("quan_ly_dich_vu/update2.php");
	}else{
		require_once("quan_ly_dich_vu/show_form.php");
	}
}

//Quan ly tinh thanh
function ql_tt() {
	if($_GET['action']=="XML"){
		require_once('EditableGrid.php');
		require_once("quan_ly_tinh_thanh/xml.php");
	}elseif($_GET['action']=="update_record"){
		require_once("quan_ly_tinh_thanh/update2.php");
	}else{
		require_once("quan_ly_tinh_thanh/show_form.php");
	}
}

//Quan ly quan he dich vu & tinh thanh
function dv_tt() {
	echo "hello";
}

//Quan ly bang gia
function ql_bg() {
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