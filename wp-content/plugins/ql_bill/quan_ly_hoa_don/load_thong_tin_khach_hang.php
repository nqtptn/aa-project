<?
global $wpdb;
$khach_hang=$_POST['khach_hang'];
$hoa_don = $wpdb->get_results("
	select concat(user_nicename,' - ',(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name')) as ten,ti_le_phu_phi,ti_le_phu_phi_ngoai_thanh
	from dev_users where user_login='$khach_hang'");	

foreach($hoa_don as $hoa_don2){
	echo'	Nhập bill cho khách hàng: '.$hoa_don2->ten.' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			Phụ phí (%) <input readonly type="text" size="2" id="ti_le_phu_phi" value="'.$hoa_don2->ti_le_phu_phi.'"/> 
			Phụ phí ngoại thành (%) <input readonly type="text" size="2" id="ti_le_phu_phi_ngoai_thanh" value="'.$hoa_don2->ti_le_phu_phi_ngoai_thanh.'"/>';
		return;
	}


?>