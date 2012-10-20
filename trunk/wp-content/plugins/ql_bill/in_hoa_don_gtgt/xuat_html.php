<?php
	global $wpdb;
	$khach_hang = $_GET['khach_hang'];
	$ma_hoa_don_gtgt = $_GET['ma_hoa_don_gtgt'];
	$report_content_tax = $_GET['report_content_tax'];
	$report_content_payment_method = $_GET['report_content_payment_method'];
	$content_account_number = $_GET['content_account_number'];
	$temp=$wpdb->get_results("
		SELECT
			id,@curRank := @curRank + 1 AS stt,
			ten_dich_vu,
			don_vi_tinh,
			so_luong,
			don_gia,
			so_luong*don_gia as thanh_tien
		FROM gia_hoa_don_gtgt_noi_dung, (SELECT @curRank := 0) r
		WHERE ma_hoa_don_gtgt = $ma_hoa_don_gtgt and ma_khach_hang = '$khach_hang'
		ORDER by stt	
	");
	//pack("CCC",0xef,0xbb,0xbf).
	$html_content="
		<br /><br />
		<br /><br />
		<table border=\"1\" style=\"border-collapse: collapse;\">
			<tr bgcolor=\"#cccccc\">
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
	";
	foreach($temp as $temp2){
		$html_content.="
			<tr>
				<td>".($temp2->ngay)."/$thang/$nam</td>
				<td>";
		$QUERY1=$wpdb->get_row("select ten_dich_vu from  gia_dich_vu where la_dich_vu_cong_them=0 AND ma_dich_vu='".($temp2->ma_dich_vu)."'");
		$html_content.=$QUERY1->ten_dich_vu;
		$html_content.="
				</td>
				<td>";
		$QUERY2=$wpdb->get_row("SELECT ten_tinh FROM gia_tinh_thanh_pho where  ma_tinh='".($temp2->ma_tinh_den)."'");
		$html_content.=$QUERY2->ten_tinh;				
		$html_content.="
				</td>
				<td>".($temp2->khoi_luong)."</td>
				<td>".($temp2->cuoc_phi)."</td>
				<td>".($temp2->phu_thu)."</td>
				<td>".($temp2->tong)."</td>
			</tr>
		";
		
	}
	$html_content.="
		</table>
		<div style=\"float:right;text-align:center\">
		Thay mặt HĐQT<br /><br />
		Tổng thống (đã ký)<br />
		<b>Trần Châu Long</b>
		</div>
		";
	$html_content = '<page style="font-family: freeserif"><br />'.$html_content.'</page>';
	try
    {
        $html2pdf = new HTML2PDF('P', 'A4', 'fr');
        $html2pdf->pdf->SetDisplayMode('real');
        $html2pdf->writeHTML($html_content);
        $html2pdf->Output("../report/".$_GET['khach_hang']."_".$nam."_".$thang.".pdf");
    }
    catch(HTML2PDF_exception $e) {
        echo $e;
        exit;
    }
	header("Location: ../report/".$_GET['khach_hang']."_".$nam."_".$thang.".pdf");