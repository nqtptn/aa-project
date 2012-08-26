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
	add_menu_page('Quản lý hóa đơn', 'Nhập hóa đơn', 'administrator','quan_ly_hoa_don', 'ql_bill2',plugins_url('/images/menu-vs.png', __FILE__));
	add_submenu_page('quan_ly_hoa_don','Dịch vụ', 'Dịch vụ', 'administrator','quan_ly_dich_vu','quan_ly_dich_vu');
	add_submenu_page('quan_ly_hoa_don','Tỉnh thành', 'Tỉnh thành', 'administrator','quan_ly_tinh_thanh','quan_ly_tinh_thanh');
	add_submenu_page('quan_ly_hoa_don','Dịch vụ & tỉnh thành', 'Dịch vụ & tỉnh thành', 'administrator','quan_ly_dich_vu_tinh_thanh','quan_ly_dich_vu_tinh_thanh');
	add_submenu_page('quan_ly_hoa_don','Phần chân hoá đơn', 'Phần chân hoá đơn', 'administrator','quan_ly_chan_hoa_don','quan_ly_chan_hoa_don');
	add_submenu_page('quan_ly_hoa_don','Nhập bảng giá', 'Nhập bảng giá', 'administrator','quan_ly_bang_gia','quan_ly_bang_gia');
}
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
	}elseif($_GET['action']=="export_function"){
		require_once('pdf/html2pdf.class.php');
		require_once("quan_ly_hoa_don/export_function.php");
	}else{
		require_once("quan_ly_hoa_don/show_form.php");
	}
}
function quan_ly_dich_vu() {
	if($_GET['action']=="XML"){
		require_once('EditableGrid.php');
		require_once("quan_ly_dich_vu/xml.php");
	}elseif($_GET['action']=="update_record"){
		require_once("quan_ly_dich_vu/update2.php");
	}elseif($_GET['action']=="export_function"){
		require_once('pdf/html2pdf.class.php');
		require_once("quan_ly_dich_vu/export_function.php");
	}else{
		require_once("quan_ly_dich_vu/show_form.php");
	}
}
function quan_ly_tinh_thanh() {
	if($_GET['action']=="XML"){
		require_once('EditableGrid.php');
		require_once("quan_ly_tinh_thanh/xml.php");
	}elseif($_GET['action']=="update_record"){
		require_once("quan_ly_tinh_thanh/update2.php");
	}elseif($_GET['action']=="export_function"){
		require_once('pdf/html2pdf.class.php');
		require_once("quan_ly_tinh_thanh/export_function.php");
	}else{
		require_once("quan_ly_tinh_thanh/show_form.php");
	}
}
function quan_ly_dich_vu_tinh_thanh() {
	if($_GET['action']=="XML"){
		require_once('EditableGrid.php');
		require_once("quan_ly_dich_vu_tinh_thanh/xml.php");
	}elseif($_GET['action']=="update_record"){
		require_once("quan_ly_dich_vu_tinh_thanh/update2.php");
	}elseif($_GET['action']=="export_function"){
		require_once('pdf/html2pdf.class.php');
		require_once("quan_ly_dich_vu_tinh_thanh/export_function.php");
	}else{
		require_once("quan_ly_dich_vu_tinh_thanh/show_form.php");
	}
}
function quan_ly_chan_hoa_don() {
	if($_GET['action']=="XML"){
		require_once('EditableGrid.php');
		require_once("quan_ly_chan_hoa_don/xml.php");
	}elseif($_GET['action']=="update_record"){
		require_once("quan_ly_chan_hoa_don/update2.php");
	}else{
		require_once("quan_ly_chan_hoa_don/show_form.php");
	}
}
function quan_ly_bang_gia() {
	if($_GET['action']=="XML"){
		require_once('EditableGrid.php');
		require_once("quan_ly_bang_gia/xml.php");
	}elseif($_GET['action']=="update_record"){
		require_once("quan_ly_bang_gia/update2.php");
	}elseif($_GET['action']=="load_cuoc_phi"){
		require_once("quan_ly_bang_gia/load_cuoc_phi.php");
	}elseif($_GET['action']=="load_tinh_tp"){
		require_once("quan_ly_bang_gia/load_tinh_tp.php");
	}elseif($_GET['action']=="export_function"){
		require_once('pdf/html2pdf.class.php');
		require_once("quan_ly_bang_gia/export_function.php");
	}else{
		require_once("quan_ly_bang_gia/show_form.php");
	}
}
function fetch_pairs($mysqli,$query){
	if (!($res = $mysqli->query($query)))return FALSE;
	$rows = array();
	while ($row = $res->fetch_assoc()) {
		$first = true;
		$key = $value = null;
		foreach ($row as $val) {
			if ($first) { $key = $val; $first = false; }
			else { $value = $val; break; }
		}
		$rows[$key] = $value;
	}
	return $rows;
}
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
if(!$mysqli->real_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME)){
	echo "Die";
}
global $wpdb;
$mysqli->set_charset($wpdb->charset);
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

