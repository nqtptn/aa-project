<?
global $wpdb;
$so_bill=$_POST['so_bill'];
$hoa_don = $wpdb->get_results("
	select concat(' => Lỗi, số bill đã được nhập tại khu vực ',ma_tinh_di,' - Mã KH ',ma_khach_hang,date_format(ngay, \" - Tháng %m Năm %Y\")) thong_tin_bill
	from gia_van_chuyen_dn where so_bill='$so_bill'");	

foreach($hoa_don as $hoa_don2){
	echo $hoa_don2->thong_tin_bill;
	return;
}

?>