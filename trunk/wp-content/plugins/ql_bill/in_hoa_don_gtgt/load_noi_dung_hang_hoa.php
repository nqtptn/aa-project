<?
global $wpdb;
$ma_hoa_don_gtgt=$_POST['ma_hoa_don_gtgt'];

if($ma_hoa_don_gtgt > 0){
	$hoa_don = $wpdb->get_results("
		SELECT
			@curRank := @curRank + 1 AS stt,id,ten_dich_vu,don_vi_tinh,so_luong,don_gia,so_luong*don_gia as thanh_tien
		FROM gia_hoa_don_gtgt_noi_dung, (SELECT @curRank := 0) r
		WHERE ma_hoa_don_gtgt = $ma_hoa_don_gtgt
		ORDER by stt"
	);	
	$hd_thong_tin = $wpdb->get_results("
		SELECT hinh_thuc_thanh_toan,so_tai_khoan,cong_tien_hang,thue_gtgt,tien_thue_gtgt,tong_cong,viet_bang_chu
		FROM gia_hoa_don_gtgt
		WHERE id = $ma_hoa_don_gtgt"
	);
	
	foreach($hd_thong_tin as $hd){
	echo '<table>
		<tr><td>
				Hình thức thanh toán:
			</td><td>
				<input type="text" id="report_content_payment_method" value="'.$hd->hinh_thuc_thanh_toan.'" />
			</td><td>
				Số tài khoản:
			</td><td>
				<input type="text" id="report_content_account_number" value="'.$hd->so_tai_khoan.'" />
		</td></tr>
		<tr><td colspan="4">
			<table><tr><td width="30">ID</td><td width="230">Tên hàng hóa, dịch vụ </td><td width="80">Đơn vị tính</td> <td width="70">Số lượng</td> <td width="100">Đơn giá</td> <td width="100">Thành tiền</td> </tr>';
	foreach($hoa_don as $hoa_don2){
		echo 	'<tr>
					<td><input type="text" size="2" id="load_stt_'.$hoa_don2->stt.'" value="'.$hoa_don2->id.'" readonly="readonly"/></td>
					<td><input type="text" size="40" id="load_ten_dich_vu_'.$hoa_don2->stt.'" value="'.$hoa_don2->ten_dich_vu.'"/></td>
					<td><input type="text" size="13" id="load_don_vi_tinh_'.$hoa_don2->stt.'" value="'.$hoa_don2->don_vi_tinh.'"/></td>
					<td><input type="text" size="10" id="load_so_luong_'.$hoa_don2->stt.'" value="'.$hoa_don2->so_luong.'" onblur="TinhHoaDon()" /></td>
					<td><input type="text" id="load_don_gia_'.$hoa_don2->stt.'" value="'.$hoa_don2->don_gia.'" onblur="TinhHoaDon()"/></td> 
					<td><input type="text" id="load_thanh_tien_'.$hoa_don2->stt.'" value="'.$hoa_don2->thanh_tien.'" readonly="readonly"/></td>
				</tr>';
	}
	echo 	'</table>
		</td></tr>
		<tr><td>		
			</td><td>
			</td><td>
				Cộng tiền hàng:
			</td><td>
				<input type="text" id="report_content_cong_tien_hang" value="'.$hd->cong_tien_hang.'" readonly="readonly"/>
		</td></tr>
		<tr><td>
				Thuế suất GTGT (%):
			</td><td>
				<input type="text" id="report_content_tax" value="'.$hd->thue_gtgt.'" onblur="TinhHoaDon()"/>
			</td><td>
				Tiền thuế GTGT:			
			</td><td>
				<input type="text" id="report_content_cong_tien_thue" value="'.$hd->tien_thue_gtgt.'" readonly="readonly"/>
		</td></tr>
		<tr><td>		
			</td><td>
			</td><td>
				Tổng cộng tiền thanh toán:
			</td><td>
				<input type="text" id="report_content_cong_thanh_toan" value="'.$hd->tong_cong.'" readonly="readonly"/>
		</td></tr>
		<tr><td>
				Tổng cộng tiền thanh toán bằng chữ:
			</td><td colspan="3">
				<input type="text" id="report_content_cong_thanh_toan_bang_chu" size="80" value="'.$hd->viet_bang_chu.'" />
			</td></tr>
		</table>
	';
	}
} else {
	echo "<br/>Khách hàng chưa có hoá đơn, vui lòng bấm Tạo hoá đơn cho khách hàng.<br/>";
}
?>