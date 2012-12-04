<?php
/**
 * WordPress AJAX Process Execution.
 *
 * @package WordPress
 * @subpackage Administration
 *
 * @link http://codex.wordpress.org/AJAX_in_Plugins
 */

/**
 * Executing AJAX process.
 *
 * @since 2.1.0
 */
define( 'DOING_AJAX', true );
define( 'WP_ADMIN', true );

// Require an action parameter
if ( empty( $_REQUEST['action'] ) )
	die( '0' );

/** Load WordPress Bootstrap */
require_once( dirname( dirname( __FILE__ ) ) . '/wp-load.php' );

/** Load WordPress Administration APIs */
require_once( ABSPATH . 'wp-admin/includes/admin.php' );

/** Load Ajax Handlers for WordPress Core */
require_once( ABSPATH . 'wp-admin/includes/ajax-actions.php' );

@header( 'Content-Type: text/html; charset=' . get_option( 'blog_charset' ) );
@header( 'X-Robots-Tag: noindex' );

send_nosniff_header();

do_action( 'admin_init' );

$core_actions_get = array(
	'fetch-list', 'ajax-tag-search', 'wp-compression-test', 'imgedit-preview', 'oembed-cache',
	'autocomplete-user', 'dashboard-widgets', 'logged-in',
);

$core_actions_post = array(
	'oembed-cache', 'image-editor', 'delete-comment', 'delete-tag', 'delete-link',
	'delete-meta', 'delete-post', 'trash-post', 'untrash-post', 'delete-page', 'dim-comment',
	'add-link-category', 'add-tag', 'get-tagcloud', 'get-comments', 'replyto-comment',
	'edit-comment', 'add-menu-item', 'add-meta', 'add-user', 'autosave', 'closed-postboxes',
	'hidden-columns', 'update-welcome-panel', 'menu-get-metabox', 'wp-link-ajax',
	'menu-locations-save', 'menu-quick-search', 'meta-box-order', 'get-permalink',
	'sample-permalink', 'inline-save', 'inline-save-tax', 'find_posts', 'widgets-order',
	'save-widget', 'set-post-thumbnail', 'date_format', 'time_format', 'wp-fullscreen-save-post',
	'wp-remove-post-lock', 'dismiss-wp-pointer', 'upload-attachment',
);

// Register core Ajax calls.
if ( ! empty( $_GET['action'] ) && in_array( $_GET['action'], $core_actions_get ) )
	add_action( 'wp_ajax_' . $_GET['action'], 'wp_ajax_' . str_replace( '-', '_', $_GET['action'] ), 1 );

if ( ! empty( $_POST['action'] ) && in_array( $_POST['action'], $core_actions_post ) )
	add_action( 'wp_ajax_' . $_POST['action'], 'wp_ajax_' . str_replace( '-', '_', $_POST['action'] ), 1 );

add_action( 'wp_ajax_nopriv_autosave', 'wp_ajax_nopriv_autosave', 1 );

if ( is_user_logged_in() )
	do_action( 'wp_ajax_' . $_REQUEST['action'] ); // Authenticated actions
else
	do_action( 'wp_ajax_nopriv_' . $_REQUEST['action'] ); // Non-admin actions
if ( ! empty( $_POST['action'] ) && $_POST['action']=="tinh_gia"){
	add_action( 'wp_ajax_nopriv_tinh_gia', 'tinh_gia', 1 );
	do_action( 'wp_ajax_nopriv_tinh_gia');
}elseif ( ! empty( $_POST['action'] ) && $_POST['action']=="danh_sach_tinh_di"){
	add_action( 'wp_ajax_nopriv_danh_sach_tinh_di', 'danh_sach_tinh_di', 1 );
	do_action( 'wp_ajax_nopriv_danh_sach_tinh_di');
}elseif ( ! empty( $_POST['action'] ) && $_POST['action']=="danh_sach_tinh_den"){
	add_action( 'wp_ajax_nopriv_danh_sach_tinh_den', 'danh_sach_tinh_den', 1 );
	do_action( 'wp_ajax_nopriv_danh_sach_tinh_den');
}elseif ( ! empty( $_POST['action'] ) && $_POST['action']=="danh_sach_dich_vu"){
	add_action( 'wp_ajax_nopriv_danh_sach_dich_vu', 'danh_sach_dich_vu', 1 );
	do_action( 'wp_ajax_nopriv_danh_sach_dich_vu');
}elseif ( ! empty( $_POST['action'] ) && $_POST['action']=="tra_cuu"){
	add_action( 'wp_ajax_nopriv_tra_cuu', 'tra_cuu', 1 );
	do_action( 'wp_ajax_nopriv_tra_cuu');
}
	
function tinh_gia() {
	global $wpdb;
	$dich_vu=$_POST['dich_vu'];
	$noi_nhan=$_POST['noi_nhan'];
	$noi_giao=$_POST['noi_giao'];
	$trong_luong=$_POST['trong_luong'];
	$province = $wpdb->get_row("select fn_tinh_gia('','$dich_vu','$noi_nhan','$noi_giao','',$trong_luong,0) as returnvalue");
	echo "Giá tiền: <b>".($province->returnvalue ? number_format($province->returnvalue,0,'',',') : 0)."đ</b>";
}
function tra_cuu() {
	global $wpdb;
	$so_bill=$_POST['so_bill'];
	$province = $wpdb->get_row("SELECT ten_khach_hang,ten_nguoi_nhan,noi_gui,noi_nhan,thoi_gian_nhan,trang_thai,ghi_chu FROM gia_van_don WHERE ma_van_don='$so_bill'");
	if($province->ten_khach_hang == "" || $province->ten_khach_hang == null)
	{
		echo "Không tìm thấy vận đơn.";
	}else{
		echo "Khách hàng: <b>".$province->ten_khach_hang."</b></br>Người nhận: <b>".$province->ten_nguoi_nhan."</b></br>Nơi gửi: <b>".$province->noi_gui."</b></br>Nơi nhận: <b>".$province->noi_nhan."</b></br>Thời gian nhận: <b>".$province->thoi_gian_nhan."</b></br>Trạng thái: <b>".$province->trang_thai."</b>";
		if($province->ghi_chu != "")
		{
			echo "</br>Ghi chú: <b>".$province->ghi_chu."</b>";
		}
	}
}
function danh_sach_tinh_di() {
	global $wpdb;
	$dich_vu=$_POST['dich_vu'];
	$province = $wpdb->get_results("
		select ma_tinh  ma_tinh_di, ten_tinh tinh_di from gia_tinh_thanh_pho where ma_tinh in ('tp_hcm','ha_noi') order by ma_tinh desc
	");
	foreach($province as $province2){
		if(!empty($province2->tinh_di)){
			echo "<option value='".$province2->ma_tinh_di."'>".$province2->tinh_di."</option>";
		}
	}
	
}
function danh_sach_tinh_den() {
	global $wpdb;
	$dich_vu=$_POST['dich_vu'];
	$province = $wpdb->get_results("
		select ma_tinh ma_tinh_den,ten_tinh tinh_den from gia_tinh_thanh_pho a where a.ma_khu_vuc IS NULL or a.ma_khu_vuc='' order by ma_tinh
	");
	foreach($province as $province2){
		if(!empty($province2->tinh_den)){
			echo "<option value='".$province2->ma_tinh_den."'>".$province2->tinh_den."</option>";
		}
	}
	
}
function danh_sach_dich_vu() {
	global $wpdb;
	$temp=$wpdb->get_results("select ma_dich_vu,ten_dich_vu from  gia_dich_vu order by (case when ma_dich_vu='chuyen_phat_nhanh' then 0 else 1 end)");
	foreach($temp as $temp2){
		if(!empty($temp2->ma_dich_vu)){
			echo "<option value='".$temp2->ma_dich_vu."'>".$temp2->ten_dich_vu."</option>";
		}
	}
}
// Default status
//die( '0' );
