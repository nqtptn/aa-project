<?
global $wpdb;
$khach_hang=$_POST['khach_hang'];
$them_moi = $wpdb->get_results("insert into gia_hoa_don_gtgt(ma_khach_hang,ngay,hinh_thuc_thanh_toan,thue_gtgt) value('$khach_hang',CURDATE( ),'Tiền mặt',10)");
$hoa_don = $wpdb->get_results("select id, concat(id,' - ',ngay) as ngay from gia_hoa_don_gtgt where ma_khach_hang='$khach_hang' order by id desc");
$ma_noi_dung = 0;
foreach($hoa_don as $hoa_don2){
	if(!empty($hoa_don2->id)){
		if($hoa_don2->id > $ma_noi_dung){
			$ma_noi_dung = $hoa_don2->id;
		}
		echo "<option value='".$hoa_don2->id."'>".$hoa_don2->ngay."</option>";
	}
}
if($ma_noi_dung > 0){
	$them_moi_noi_dung = $wpdb->get_results("insert into gia_hoa_don_gtgt_noi_dung(ma_khach_hang,ma_hoa_don_gtgt,so_luong) value('$khach_hang',$ma_noi_dung,1)");
	$them_moi_noi_dung = $wpdb->get_results("insert into gia_hoa_don_gtgt_noi_dung(ma_khach_hang,ma_hoa_don_gtgt) value('$khach_hang',$ma_noi_dung)");
	$them_moi_noi_dung = $wpdb->get_results("insert into gia_hoa_don_gtgt_noi_dung(ma_khach_hang,ma_hoa_don_gtgt) value('$khach_hang',$ma_noi_dung)");
}
?>