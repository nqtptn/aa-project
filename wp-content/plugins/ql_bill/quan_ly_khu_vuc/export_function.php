<?php
	global $wpdb;
	$khach_hang = $_GET['khach_hang'];
	$thang = $_GET['thang'];
	$nam = $_GET['nam'];
	$temp=$wpdb->get_results("
		SELECT
			ma_khu_vuc as id, 
			ten_khu_vuc
		FROM gia_khu_vuc
		ORDER by ten_khu_vuc
	");
	//pack("CCC",0xef,0xbb,0xbf).
	$html_content='
	<page style="font-family: freeserif">
		<div align="center"><b>Danh sách khu vực</b></div>
		<table border="1" style="border-collapse: collapse;">
			<tr bgcolor="#cccccc">
				<th>Mã khu vực</th>
				<th>Tên khu vực</th>
			</tr>
	';
	foreach($temp as $temp2){
		$html_content.="
			<tr>
				<td>".($temp2->id)."</td>
				<td width='200'>".($temp2->ten_khu_vuc)."</td>
			</tr>
		";
	}
	$html_content.='
		</table>
	</page>';
	try
    {
        $html2pdf = new HTML2PDF('P', 'A4', 'en');
        $html2pdf->pdf->SetDisplayMode('real');
        $html2pdf->writeHTML($html_content);
        $html2pdf->Output("../report/khu_vuc.pdf");
    }
    catch(HTML2PDF_exception $e) {
        echo $e;
        exit;
    }
	//header("Location: ../report/khu_vuc.pdf");