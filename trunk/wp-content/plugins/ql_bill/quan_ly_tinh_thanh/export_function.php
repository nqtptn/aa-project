<?php
	global $wpdb;
	$khach_hang = $_GET['khach_hang'];
	$thang = $_GET['thang'];
	$nam = $_GET['nam'];
	$temp=$wpdb->get_results("
		SELECT
			ma_dich_vu as id, 
			ten_dich_vu,
			thoi_gian_van_chuyen,
			mo_ta,
			la_dich_vu_cong_them,
			gia_cong_them,
			ti_le_cong_them
		FROM gia_dich_vu
		ORDER by ten_dich_vu
	");
	//pack("CCC",0xef,0xbb,0xbf).
	$html_content='
		<page style="font-family: freeserif">
		<div align="center"><b>Danh sách tỉnh thành</b></div>
		<table border="1" style="border-collapse: collapse;">
			<tr bgcolor="#cccccc">
				<th>Mã dịch vụ</th>
				<th>Tên dịch vụ</th>
				<th>Thời gian v/c</th>
				<th>Mô tả</th>
				<th>DV cộng thêm</th>
				<th>Giá cộng thêm</th>
				<th>Tỉ lệ cộng thêm</th>
			</tr>
	';
	foreach($temp as $temp2){
		$html_content.="
			<tr>
				<td>".($temp2->id)."</td>
				<td width='200'>".($temp2->ten_dich_vu)."</td>
				<td>".($temp2->thoi_gian_van_chuyen)."</td>
				<td>".($temp2->mo_ta)."</td>
				<td>".($temp2->la_dich_vu_cong_them==1 ? '<img src="'.plugins_url("ql_bill/images/check.png").'" />' : '')."</td>
				<td>".($temp2->gia_cong_them)."</td>
				<td>".($temp2->ti_le_cong_them)."</td>
			</tr>
		";
		
	}
	$html_content.='
			</table>
			<div align="right"><b>Microsoft.com</b></div>
		</page>';
	try
    {
        $html2pdf = new HTML2PDF('P', 'A4', 'en');
        $html2pdf->pdf->SetDisplayMode('real');
        $html2pdf->writeHTML($html_content);
        $html2pdf->Output("../report/tinh_thanh.pdf");
   }catch(HTML2PDF_exception $e) {
        echo $e;
        exit;
    }
	//header("Location: ../report/dich_vu.pdf");