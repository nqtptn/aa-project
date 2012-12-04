<?php
	global $wpdb;
	$current_user = wp_get_current_user();
	$khach_hang=$current_user->user_login;
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
	$html_content='
		<page style="font-family: freeserif">
		<br/>
		<div align="center"><span style="font-weight: bold; font-size: 15pt">BẢNG KÊ NỢ THÁNG '.$thang. ' NĂM ' .$nam.'</span></div>
		<br/>
		<table border="1" style="border-collapse: collapse;">
			<tr bgcolor="#cccccc">
				<th align="center">TT</th>
				<th align="center">Tên khách hàng</th>
				<th align="center">Người liên hệ</th>
				<th align="center">Điện thoại</th>
				<th align="center">Địa chỉ</th>				
				<th align="center">Mã KH</th>
				<th align="center">Số tiền</th>
				<th align="center">Người thu tiền</th>
				<th align="center">Trạng thái</th>
			</tr>
	';
	$tong1=0;
	$tong2=0;
	$tong3=0;
	foreach($temp as $temp2){
		$tong1 = $tong1 + $temp2->so_tien;
		$html_content.="
			<tr>
				<td width='20' align='center'>".($temp2->stt)."</td>
				<td width='130' align='left'>".($temp2->ten_khach_hang)."</td>
				<td width='80' align='left'>".($temp2->nguoi_lien_he)."</td>
				<td width='80' align='left'>".($temp2->dien_thoai)."</td>
				<td width='120' align='left'>".($temp2->dia_chi)."</td>				
				<td width='50' align='left'>".($temp2->ma_khach_hang)."</td>
				<td width='60' align='right'>".number_format(($temp2->so_tien),0,'',',')."</td>
				<td width='90' align='left'>".($temp2->nguoi_thu_tien)."</td>
				<td width='60' align='left'>".($temp2->trang_thai)."</td>
			</tr>
		";
	}
	$html_content.='
			<tr bgcolor="#cccccc">
				<td colspan="6" align="center">Tổng</td>
				<td align="right">'.number_format($tong1,0,'',',').'</td>
				<td align="right"></td>
				<td align="right"></td>
				<td></td>
			</tr>
			</table>
			';
	$html_content.='
		<br/>
		</page>
	';
	try
    {
        $html2pdf = new HTML2PDF('P', 'A4', 'en');
        $html2pdf->pdf->SetDisplayMode('real');
        $html2pdf->writeHTML($html_content);
        $html2pdf->Output("../report/".$_GET['khach_hang']."_".$nam."_".$thang.".pdf");
    }
    catch(HTML2PDF_exception $e) {
        echo $e;
        exit;
    }
	//header("Location: ../report/".$_GET['khach_hang']."_".$nam."_".$thang.".pdf");