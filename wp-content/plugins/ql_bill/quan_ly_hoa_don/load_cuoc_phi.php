<?
global $wpdb;
$ma_dich_vu=$_POST['ma_dich_vu'];
$ma_tinh_den=$_POST['ma_tinh_den'];
$don_vi_kg=$_POST['don_vi_kg'];
$khoi_luong=$_POST['khoi_luong'];
if($don_vi_kg == 1){
	$khoi_luong = $khoi_luong * 1000;
}
$province = $wpdb->get_row("select round((select (1+vat/100)*(1+ti_le_phu_phi/100) from gia_dich_vu where ma_dich_vu='$ma_dich_vu') * fn_tinh_gia('$ma_dich_vu','tp_hcm','$ma_tinh_den',$khoi_luong,0),0) as returnvalue");
echo $province->returnvalue;
?>