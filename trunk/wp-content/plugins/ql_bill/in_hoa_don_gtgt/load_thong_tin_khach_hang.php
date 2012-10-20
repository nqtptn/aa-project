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
	echo 	'<table><tr><td width="200px">Họ tên người mua hàng: </td><td><input type="text" id="load_nguoi_lien_he" value="'.$hoa_don2->nguoi_lien_he.'"/></td></tr>
			 <tr><td>Tên đơn vị: </td><td> <input type="text" id="load_ten_cong_ty" value="'.$hoa_don2->ten_cong_ty.'"/></td></tr>
			 <tr><td>Mã số thuế: </td><td> <input type="text" id="load_mst" value="'.$hoa_don2->mst.'"/></td></tr>
			 <tr><td>Địa chỉ: </td><td><input type="text" id="load_dia_chi" value="'.$hoa_don2->dia_chi.'"/></td></tr></table>';
}


?>