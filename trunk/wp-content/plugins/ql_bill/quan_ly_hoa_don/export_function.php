<?php
	global $wpdb;
	$current_user = wp_get_current_user();
	$khach_hang= $_GET['khach_hang'];
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
	$html_content='
		<page style="font-family: freeserif">
		<table>
			<tr>
				<td width="350" text-align="center">
					CTY CP TM - DV TIẾP VẬN TOÀN CẦU<br />
					tEL: (08) 9480323 - 9480324
				</td>
				<td width="350" text-align="center">
				CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />
				Độc lập - Tự do - Hạnh phúc
				</td></tr>
		</table>
		<br/>
		<div align="center"><span style="font-weight: bold; font-size: 15pt">BẢNG KÊ NỢ CHI TIẾT THÁNG '.$thang. ' NĂM ' .$nam.'</span></div>
		<br/>
		<table>
			<tr>
				<td width="350" text-align="left">
					Mã khách hàng: '.($temp2->ma_khach_hang).'<br />
					Người liên hệ: '.($temp2->nguoi_lien_he).'<br />
					ĐT: '.($temp2->dien_thoai).'<br />
					Fax: '.($temp2->fax).'
				</td>
				<td width="450" text-align="left">
					'.($temp2->ten_cong_ty).'<br />
					Địa chỉ: '.($temp2->dia_chi).'<br />
					MST: '.($temp2->mst).'
				</td></tr>
		</table>
		<br/>
		<table border="1" style="border-collapse: collapse;">
			<tr bgcolor="#cccccc">
				<th align="center">TT</th>
				<th align="center">Ngày</th>
				<th align="center">Số bill</th>
				<th align="center">Tỉnh đến</th>
				<th align="center">Dịch vụ</th>				
				<th align="center">Khối lượng</th>
				<th align="center">Cước phí</th>
				<th align="center">Phụ thu</th>
				<th align="center">Tổng</th>
				<th align="center">Ghi chú</th>
			</tr>
	';
	$tong1=0;
	$tong2=0;
	$tong3=0;
	foreach($temp as $temp2){
		$tong1 = $tong1 + $temp2->cuoc_phi;
		$tong2 = $tong2 + $temp2->phu_thu;
		$tong3 = $tong3 + $temp2->tong;
		$html_content.="
			<tr>
				<td width='20' align='center'>".($temp2->stt)."</td>
				<td width='30' align='center'>".($temp2->ngay)."</td>
				<td width='70' align='center'>".($temp2->so_bill)."</td>
				<td width='80' align='left'>".($temp2->tinh_den)."</td>
				<td width='170' align='left'>".($temp2->dich_vu)."</td>				
				<td width='60' align='right'>".(number_format($temp2->khoi_luong,0,'',','))."</td>
				<td width='60' align='right'>".(number_format($temp2->cuoc_phi,0,'',','))."</td>
				<td width='50' align='right'>".(number_format($temp2->phu_thu,0,'',','))."</td>
				<td width='80' align='right'>".(number_format($temp2->tong,0,'',','))."</td>
				<td width='70' align='right'>".($temp2->ghi_chu)."</td>
			</tr>
		";
	}
	$html_content.='
			<tr bgcolor="#cccccc">
				<td colspan="6" align="center">Tổng</td>
				<td align="right">'.number_format($tong1,0,'',',').'</td>
				<td align="right">'.number_format($tong2,0,'',',').'</td>
				<td align="right">'.number_format($tong3,0,'',',').'</td>
				<td></td>
			</tr>
			</table>
			';
	$temp2=$wpdb->get_row("SELECT * FROM gia_chuc_vu WHERE  ma_tinh_di='tp_hcm'");
	$thang_1 = $thang + 1;
	$nam_1 = $nam;
	if($thang == 12){
		$thang_1 = 1;
		$nam_1 = $nam + 1;
	}
	$html_content.='
		<br/>
		<div align="center">
			'.$report_content.'
			<br />
			Mọi thắc mắc vui lòng liên hệ: '.($temp2->lien_he).'
		</div>
		<br />
		<table>
			<tr>
				<td width="190" text-align="center" valign="top">
					Giám đốc<br /><br /><br /><br />
					<b>'.($temp2->giam_doc).'</b>
				</td>
				<td width="190" text-align="center" valign="top">
					Kế toán trưởng<br /><br /><br /><br />
					<b>'.($temp2->ke_toan_truong).'</b>
				</td>
				<td width="190" text-align="center" valign="top">
					Kế toán công nợ<br /><br /><br /><br />
					<b>'.($temp2->ke_toan_cong_no).'</b>
				</td>
				<td width="190" text-align="center" valign="top">
					Kế toán dữ liệu<br /><br /><br /><br />
					<b>'.($temp2->ke_toan_du_lieu).'</b>
				</td>
			</tr>
		</table>
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