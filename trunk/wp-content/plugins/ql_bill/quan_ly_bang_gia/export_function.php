<?php
	global $wpdb;
	$khach_hang = $_GET['khach_hang'];
	$thang = $_GET['thang'];
	$nam = $_GET['nam'];
	$temp=$wpdb->get_results("
		SELECT
				ma_van_chuyen as id, 
				@curRank := @curRank + 1 AS stt,
				date_format(ngay, \"%d\") as ngay,
				ma_dich_vu,
				ma_tinh_den,
				khoi_luong,
				cuoc_phi,
				phu_thu,
				tong,
				ghi_chu,
				so_bill
				from gia_van_chuyen_dn, (SELECT @curRank := 0) r
				where date_format(ngay, \"%Y-%m\") = '$nam-$thang' and ma_khach_hang = '$khach_hang'
				order by ngay
	");
	//pack("CCC",0xef,0xbb,0xbf).
	$html_content='
		<page style="font-family: freeserif">
		<div align="center"><b>Microsoft.com</b></div>
		<table border="1" style="border-collapse: collapse;">
			<tr bgcolor="#cccccc">
				<th>Ngày</th>
				<th align="center">Dịch vụ</th>
				<th align="center">Tỉnh đến</th>
				<th align="center">Khối lượng</th>
				<th align="center">Giá cước</th>
				<th align="center">Phụ thu</th>
				<th align="center">Tổng</th>
			</tr>
	';
	foreach($temp as $temp2){
		$html_content.="
			<tr>
				<td width='70' align='left'>".($temp2->ngay)."/$thang/$nam</td>
				<td  width='250' align='left'>";
		$QUERY1=$wpdb->get_row("select ten_dich_vu from  gia_dich_vu where la_dich_vu_cong_them=0 AND ma_dich_vu='".($temp2->ma_dich_vu)."'");
		$html_content.=$QUERY1->ten_dich_vu;
		$html_content.="
				</td>
				<td width='70' align='left'>";
		$QUERY2=$wpdb->get_row("SELECT ten_tinh FROM gia_tinh_thanh_pho where  ma_tinh='".($temp2->ma_tinh_den)."'");
		$html_content.=$QUERY2->ten_tinh;				
		$html_content.="
				</td>
				<td width='80' align='right'>".($temp2->khoi_luong)."</td>
				<td width='80' align='right'>".($temp2->cuoc_phi)."</td>
				<td width='80' align='right'>".($temp2->phu_thu)."</td>
				<td width='80' align='right'>".($temp2->tong)."</td>
			</tr>
		";
	}
	$html_content.='
			</table>
			<div align="right"><b>Microsoft.com</b></div>
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