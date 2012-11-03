<?
global $wpdb;
$khach_hang=$_POST['khach_hang'];
$ma_hoa_don_gtgt = $_POST['ma_hoa_don_gtgt'];
$report_content_payment_method = $_POST['report_content_payment_method'];
$report_content_account_number = $_POST['report_content_account_number'];
$report_content_cong_tien_hang = str_replace (",","",$_POST['report_content_cong_tien_hang']);
$report_content_tax = $_POST['report_content_tax'];
$report_content_cong_tien_thue = str_replace (",","",$_POST['report_content_cong_tien_thue']);
$report_content_cong_thanh_toan = str_replace (",","",$_POST['report_content_cong_thanh_toan']);
$report_content_cong_thanh_toan_bang_chu = $_POST['report_content_cong_thanh_toan_bang_chu'];
$load_stt_1 = $_POST['load_stt_1'];
$load_ten_dich_vu_1 = $_POST['load_ten_dich_vu_1'];
$load_don_vi_tinh_1 = $_POST['load_don_vi_tinh_1'];
$load_so_luong_1 = str_replace (",","",$_POST['load_so_luong_1']);
$load_don_gia_1 = str_replace (",","",$_POST['load_don_gia_1']);
$load_thanh_tien_1 = str_replace (",","",$_POST['load_thanh_tien_1']);

$cap_nhat_hoa_don = $wpdb->get_results("update gia_hoa_don_gtgt set hinh_thuc_thanh_toan='$report_content_payment_method'
	,so_tai_khoan='$report_content_account_number'
	,cong_tien_hang='$report_content_cong_tien_hang'
	,thue_gtgt='$report_content_tax'
	,tien_thue_gtgt=$report_content_cong_tien_thue
	,tong_cong=$report_content_cong_thanh_toan
	,viet_bang_chu='$report_content_cong_thanh_toan_bang_chu'
	where id=$ma_hoa_don_gtgt");
$cap_nhat_noi_dung1 = $wpdb->get_results("update gia_hoa_don_gtgt_noi_dung set ten_dich_vu='$load_ten_dich_vu_1'
	,don_vi_tinh='$load_don_vi_tinh_1'
	,so_luong=$load_so_luong_1
	,don_gia=$load_don_gia_1
	,so_thu_tu=$load_thanh_tien_1
	where id=$load_stt_1");
$cap_nhat_noi_dung2 = $wpdb->get_results("update gia_hoa_don_gtgt_noi_dung set ten_dich_vu='$load_ten_dich_vu_2'
	,don_vi_tinh='$load_don_vi_tinh_2'
	,so_luong=$load_so_luong_2
	,don_gia=$load_don_gia_2
	,so_thu_tu=$load_thanh_tien_2
	where id=$load_stt_2");
$cap_nhat_noi_dung3 = $wpdb->get_results("update gia_hoa_don_gtgt_noi_dung set ten_dich_vu='$load_ten_dich_vu_3'
	,don_vi_tinh='$load_don_vi_tinh_3'
	,so_luong=$load_so_luong_3
	,don_gia=$load_don_gia_3
	,so_thu_tu=$load_thanh_tien_3
	where id=$load_stt_3");	
	
echo "Lưu thành công.";
?>