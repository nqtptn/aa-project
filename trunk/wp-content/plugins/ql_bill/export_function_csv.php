<?php
	global $wpdb;
	$current_user = wp_get_current_user();
	$khach_hang= $_GET['khach_hang'];
	if($khach_hang == ""){
		$khach_hang = $current_user->user_login;
	}
	$report_content= $_GET['content'];
	$temp2=$wpdb->get_row("
		select user_login as
		ma_khach_hang
		,(select meta_value from dev_usermeta where user_id=ID and meta_key='first_name') as
		nguoi_lien_he
		,(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name') as
		ten_cong_ty
		,(select meta_value from dev_usermeta where user_id=ID and meta_key='nickname') as
		dia_chi
		,(select meta_value from dev_usermeta where user_id=ID and meta_key='aim') as
		dien_thoai
		,(select meta_value from dev_usermeta where user_id=ID and meta_key='yim') as
		fax
		,(select meta_value from dev_usermeta where user_id=ID and meta_key='jabber') as
		mst
		from dev_users where user_login='$khach_hang'");
		$thang = $_GET['thang'];
	$nam = $_GET['nam'];
	header('Content-Type: text/csv; charset=utf-8');
header("Content-disposition:attachment;filename= ".$_GET['khach_hang']."_".$nam."_".$thang.".csv ");
	
	$temp=$wpdb->get_results("
		SELECT
				ma_van_chuyen as id,
				@curRank := @curRank + 1 AS stt,
				date_format(ngay, \"%d\") as ngay,
				(select ten_dich_vu from  gia_dich_vu where la_dich_vu_cong_them=0 AND ma_dich_vu=a.ma_dich_vu) dich_vu,
				(SELECT ten_tinh FROM gia_tinh_thanh_pho where  ma_tinh=a.ma_tinh_den) tinh_den,
				khoi_luong,
				cuoc_phi,
				phu_thu,
				tong,
				ghi_chu,
				so_bill
				from gia_van_chuyen_dn a, (SELECT @curRank := 0) r
				where date_format(ngay, \"%Y-%m\") = '$nam-$thang' and ma_khach_hang = '$khach_hang'
				order by ngay
	");
	//pack("CCC",0xef,0xbb,0xbf).
$html_content='BẢNG KÊ NỢ CHI TIẾT THÁNG '.$thang. ' NĂM ' .$nam."\r\n\r\n";
$html_content.="Mã khách hàng:\t".($temp2->ma_khach_hang)."\t\tTên công ty:\t".($temp2->ten_cong_ty)."\r\n";
$html_content.="Người liên hệ:\t".($temp2->nguoi_lien_he)."\t\tĐịa chỉ:\t".($temp2->dia_chi)."\r\n";
$html_content.="ĐT:\t".($temp2->dien_thoai)."\t\tMST:\t".($temp2->mst)."\r\n";
$html_content.="Fax:\t".($temp2->fax)."\r\n\r\n";
$html_content.="TT\tNgày\tSố bill\tTỉnh đến\tDịch vụ\tKhối lượng\tCước phí\tPhụ thu\tTổng\tGhi chú\r\n";
	$tong1=0;
	$tong2=0;
	$tong3=0;
	foreach($temp as $temp2){
		$tong1 = $tong1 + $temp2->cuoc_phi;
		$tong2 = $tong2 + $temp2->phu_thu;
		$tong3 = $tong3 + $temp2->tong;
		$html_content.=($temp2->stt)."\t".($temp2->ngay)."\t".($temp2->so_bill)."\t".($temp2->tinh_den)."\t".($temp2->dich_vu)."\t".(number_format($temp2->khoi_luong,0,'',','))."\t".(number_format($temp2->cuoc_phi,0,'',','))."\t".(number_format($temp2->phu_thu,0,'',','))."\t".(number_format($temp2->tong,0,'',','))."\t".($temp2->ghi_chu)."\r\n";
	}
	$html_content.="\t\t\t\t\tTổng\t".number_format($tong1,0,'',',')."\t".number_format($tong2,0,'',',')."\t".number_format($tong3,0,'',',')."\r\n\r\n";
	$temp2=$wpdb->get_row("SELECT * FROM gia_chuc_vu WHERE  ma_tinh_di='tp_hcm'");
	$thang_1 = $thang + 1;
	$nam_1 = $nam;
	if($thang == 12){
		$thang_1 = 1;
		$nam_1 = $nam + 1;
	}
	$html_content.=$report_content."\r\nMọi thắc mắc vui lòng liên hệ: ".($temp2->lien_he)."\r\n";
	$html_content.="Giám đốc\t\tKế toán trưởng\t\tKế toán công nợ\t\tKế toán dữ liệu\r\n";
	$html_content.="".($temp2->giam_doc)."\t\t".($temp2->ke_toan_truong)."\t\t".($temp2->ke_toan_cong_no)."\t\t".($temp2->ke_toan_du_lieu)."\r\n";
	echo chr(255).chr(254).mb_convert_encoding($html_content, "UTF-16LE", "UTF-8");
	//header("Location: ../report/".$_GET['khach_hang']."_".$nam."_".$thang.".pdf");