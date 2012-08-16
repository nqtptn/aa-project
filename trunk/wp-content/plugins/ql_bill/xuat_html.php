<?php
if(!isset($_GET['f']) || empty($_GET['f'])){
	$form=1;
}else{
	$form=$_GET['f'];
}
if($form==1){
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
	$html_content="
		Tổng công ty hóa chất, vật liệu xây dựng, <b>khoan cắt bê tông Nhã Lợi</b><br /><br />
		<table border=\"1\" style=\"border-collapse: collapse;\">
			<tr bgcolor=\"#cccccc\">
				<th>Ngày</th>
				<th>Mã dịch vụ</th>
				<th>Tỉnh đến</th>
				<th>Khối lượng</th>
				<th>Giá cước</th>
				<th>Phụ thu</th>
				<th>Tổng</th>
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
	require_once('pdf/html2pdf.class.php');
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
}