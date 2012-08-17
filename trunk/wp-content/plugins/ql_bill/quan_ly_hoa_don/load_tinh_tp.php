<?
global $wpdb;
$ma_dich_vu=$_POST['ma_dich_vu'];
$province = $wpdb->get_results("select ma_tinh,ten_tinh from gia_tinh_thanh_pho where ma_tinh in (select ma_tinh_den from gia_dich_vu_tinh_thanh_pho where ma_tinh_di='tp_hcm' and ma_dich_vu='$ma_dich_vu')");
foreach($province as $province2){
	if(!empty($province2->ma_tinh)){
		echo "<option value='".$province2->ma_tinh."'>".$province2->ten_tinh."</option>";
	}
}
?>