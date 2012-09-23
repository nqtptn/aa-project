<?
global $wpdb;
$khach_hang=$_POST['makhachhang'];
$data1 = $wpdb->get_results("SELECT 
	ma_dich_vu,
	ma_tinh_di,
	ma_tinh_den,
	khoi_luong,
	cuoc_phi,
	phu_thu,
	tong,
	ghi_chu,
	ngay,
	ck_sale,
	ma_khach_hang,
	so_bill

	FROM gia_van_chuyen_dn_import where ma_khach_hang='$khach_hang'");
$data2 = $wpdb->insert("gia_van_chuyen_dn",$data1);
?>