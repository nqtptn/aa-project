<?
global $wpdb;
$khach_hang=$_POST['khach_hang'];
$hoa_don = $wpdb->get_results("
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

foreach($hoa_don as $hoa_don2){
	echo'<table>
			<tr><td width="200px">Ngày tháng năm: </td><td><input type="text" size="2" id="load_ngay" value="13"/><input type="text" size="2" id="load_thang" value="11"/><input type="text" size="4" id="load_nam" value="12"/></td></tr>
			<tr><td width="200px">Họ tên người mua hàng: </td><td><input type="text" id="load_nguoi_lien_he" value="'.$hoa_don2->nguoi_lien_he.'"/></td></tr>
			<tr><td>Tên đơn vị: </td><td> <input type="text" id="load_ten_cong_ty" value="'.$hoa_don2->ten_cong_ty.'"/></td></tr>
			<tr><td>Mã số thuế: </td><td> <input type="text" id="load_mst" value="'.$hoa_don2->mst.'"/></td></tr>
			<tr><td>Địa chỉ: </td><td><input type="text" id="load_dia_chi" value="'.$hoa_don2->dia_chi.'"/></td></tr>
			<tr><td>Hình thức thanh toán:</td><td><input type="text" id="report_content_payment_method" value="'.$hd->hinh_thuc_thanh_toan.'" /></td>
				<td>Số tài khoản:</td><td><input type="text" id="report_content_account_number" value="'.$hd->so_tai_khoan.'" /></td></tr>
			<tr><td colspan="4">
				<table>
					<tr>
						<td width="100">STT</td>
						<td width="230">Tên hàng hóa, dịch vụ </td>
						<td width="80">Đơn vị tính</td> <td width="70">Số lượng</td> 
						<td width="100">Đơn giá</td> <td width="100">Thành tiền</td> 
					</tr>
					<tr>
						<td><input type="text" size="2" id="load_stt_1" value="1" readonly="readonly"/></td>
						<td><TEXTAREA id="load_ten_dich_vu_1" ROWS="4" COLS="50" value=""></TEXTAREA></td>
						<td><input type="text" size="10" id="load_don_vi_tinh_1" value=""/></td>
						<td><input type="text" size="8" id="load_so_luong_1" value="" onblur="TinhHoaDon()" /></td>
						<td><input type="text" size="13" id="load_don_gia_1" value="" onblur="TinhHoaDon()"/></td> 
						<td><input type="text" size="13" id="load_thanh_tien_1" value="" onblur="TinhHoaDon()"/></td>
					</tr>				
					<tr><td>		
						</td><td>
						</td><td>
							Cộng tiền hàng:
						</td><td>
							<input type="text" id="report_content_cong_tien_hang" value="" readonly="readonly"/>
					</td></tr>
					<tr><td>
							Thuế suất GTGT (%):
						</td><td>
							<input type="text" id="report_content_tax" value="10" onblur="TinhHoaDon()"/>
						</td><td>
							Tiền thuế GTGT:			
						</td><td>
							<input type="text" id="report_content_cong_tien_thue" value="" readonly="readonly"/>
					</td></tr>
					<tr><td>		
						</td><td>
						</td><td>
							Tổng cộng tiền thanh toán:
						</td><td>
							<input type="text" id="report_content_cong_thanh_toan" value="" onblur="TinhHoaDon()"/>
					</td></tr>
					<tr><td>
							Tổng cộng tiền thanh toán bằng chữ:
						</td><td colspan="3">
							<input type="text" id="report_content_cong_thanh_toan_bang_chu" size="80" value="" />
							<input type="button" value=" In hóa đơn GTGT " onclick="PrintElem(\'#mydiv\')" />
							<b><label id="ket_qua"></label></b>
					</td></tr>
				</table>
			</td></tr>
		</table>';
		return;
	}


?>