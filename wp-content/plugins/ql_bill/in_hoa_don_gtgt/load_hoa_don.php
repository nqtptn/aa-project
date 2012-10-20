<?
global $wpdb;
$khach_hang=$_POST['khach_hang'];
$hoa_don = $wpdb->get_results("select id, concat(id,' - ',ngay) as ngay from gia_hoa_don_gtgt where ma_khach_hang='$khach_hang' order by id desc");
foreach($hoa_don as $hoa_don2){
	if(!empty($hoa_don2->id)){
		echo "<option value='".$hoa_don2->id."'>".$hoa_don2->ngay."</option>";
	}
}
?>