<?
global $wpdb;
$ma_dich_vu=$_POST['ma_dich_vu'];
$ma_tinh_den=$_POST['ma_tinh_den'];
$khoi_luong=$_POST['khoi_luong'];
$province = $wpdb->get_row("select fn_tinh_gia('$ma_dich_vu','tp_hcm','$ma_tinh_den',$khoi_luong,0) as returnvalue");
echo $province->returnvalue;
?>