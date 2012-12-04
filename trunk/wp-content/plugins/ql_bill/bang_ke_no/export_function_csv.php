<?php
	global $wpdb;
	$current_user = wp_get_current_user();
	$ma_tinh_di=$current_user->ma_tinh_di;
	$thang = $_GET['thang'];
	$nam = $_GET['nam'];
	$temp=$wpdb->get_results("
			SELECT
				a.ma_khach_hang as id, 
				@curRank := @curRank + 1 AS stt,
				(select meta_value from dev_usermeta,dev_users where user_id=dev_users.ID and user_login=a.ma_khach_hang and meta_key='first_name') as nguoi_lien_he,
				(select meta_value from dev_usermeta,dev_users where user_id=dev_users.ID and user_login=a.ma_khach_hang and meta_key='last_name') as ten_khach_hang,
				(select meta_value from dev_usermeta,dev_users where user_id=dev_users.ID and user_login=a.ma_khach_hang and meta_key='nickname') as dia_chi,
				(select meta_value from dev_usermeta,dev_users where user_id=dev_users.ID and user_login=a.ma_khach_hang and meta_key='aim') as dien_thoai,
				a.ma_khach_hang,
				sum(tong) so_tien,
				(select (case when count(*) then 'Đã thu' else 'Nợ' end) from gia_bang_ke_no b where b.thang=date_format(a.ngay, \"%m\") and b.nam=date_format(a.ngay, \"%Y\") and b.ma_khach_hang=a.ma_khach_hang and da_thu=1) as trang_thai,
				(select nguoi_thu_tien from gia_bang_ke_no b where b.thang=date_format(a.ngay, \"%m\") and b.nam=date_format(a.ngay, \"%Y\") and b.ma_khach_hang=a.ma_khach_hang) as nguoi_thu_tien
			FROM gia_van_chuyen_dn a, (SELECT @curRank := 0) r
			WHERE date_format(a.ngay, \"%Y-%m\") = '$nam-$thang' and ma_tinh_di='$ma_tinh_di'
			GROUP BY a.ma_khach_hang
			ORDER by stt,a.ma_khach_hang
	");
	//pack("CCC",0xef,0xbb,0xbf).
	header('Content-Type: text/csv; charset=utf-8');
	header("Content-disposition:attachment;filename= Bang_Ke_No_".$nam."_".$thang.".csv ");
	$html_content="BẢNG KÊ NỢ THÁNG ".$thang. " NĂM " .$nam."\r\n\r\n";
	$html_content.="TT\tTên khách hàng\tNgười liên hệ\tĐiện thoại\tĐịa chỉ\tMã KH\tĐã thu\tChưa thu\tNgười thu tiền\tTrạng thái"."\r\n";
	$tong1=0;
	$tong2=0;
	$tong3=0;
	foreach($temp as $temp2){
		$da_thu=0;
		$chua_thu=0;
		if($temp2->trang_thai == 'Đã thu'){
			$da_thu = $temp2->so_tien;
		}else{
			$chua_thu = $temp2->so_tien;
		}
		$tong1 = $tong1 + $da_thu;
		$tong2 = $tong2 + $chua_thu;
		$html_content.="".($temp2->stt)."\t".($temp2->ten_khach_hang)."\t".($temp2->nguoi_lien_he)."\t".($temp2->dien_thoai)."\t".($temp2->dia_chi)."\t".($temp2->ma_khach_hang)."\t".number_format(($da_thu),0,'',',')."\t".number_format(($chua_thu),0,'',',')."".($temp2->nguoi_thu_tien)."\t".($temp2->trang_thai)."\r\n";
	}
	$html_content.="\t\t\t\tTổng\t".number_format($tong1+$tong2,0,'',',')."\t".number_format($tong1,0,'',',')."\t".number_format($tong2,0,'',',')."\r\n";
	echo chr(255).chr(254).mb_convert_encoding($html_content, "UTF-16LE", "UTF-8");
	//header("Location: ../report/".$_GET['khach_hang']."_".$nam."_".$thang.".pdf");