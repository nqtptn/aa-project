<?php
global $mysqli;
$grid = new EditableGrid();
$current_user = wp_get_current_user();
$ma_tinh_di=$current_user->ma_tinh_di;
$khach_hang = $mysqli->real_escape_string(strip_tags($_GET['khach_hang']));
$thang = $mysqli->real_escape_string(strip_tags($_GET['thang']));
$nam = $mysqli->real_escape_string(strip_tags($_GET['nam']));
$grid->addColumn('stt', 'Stt', 'string', NULL,false);
$grid->addColumn('ten_khach_hang', 'Tên khách hàng', 'string', NULL,false);
$grid->addColumn('nguoi_lien_he', 'Người liên hệ', 'string', NULL,false);
$grid->addColumn('dien_thoai', 'Điện thoại', 'string', NULL,false);
$grid->addColumn('dia_chi', 'Địa chỉ', 'string', NULL,false);
$grid->addColumn('ma_khach_hang', 'Mã khách hàng', 'string', NULL,false);
$grid->addColumn('so_tien', 'Số tiền', 'integer', NULL,false);
$grid->addColumn('da_thu_tien', 'Đã thu tiền', 'boolean', NULL,true);
$grid->addColumn('nguoi_thu', 'Người thu tiền', 'string', NULL,true);
$query="
	SELECT
		CONCAT($nam,'-',$thang,' -',a.ma_khach_hang) as id, 
		@curRank := @curRank + 1 AS stt,
		(select meta_value from dev_usermeta,dev_users where user_id=dev_users.ID and user_login=a.ma_khach_hang and meta_key='first_name') as nguoi_lien_he,
		(select meta_value from dev_usermeta,dev_users where user_id=dev_users.ID and user_login=a.ma_khach_hang and meta_key='last_name') as ten_khach_hang,
		(select meta_value from dev_usermeta,dev_users where user_id=dev_users.ID and user_login=a.ma_khach_hang and meta_key='nickname') as dia_chi,
		(select meta_value from dev_usermeta,dev_users where user_id=dev_users.ID and user_login=a.ma_khach_hang and meta_key='aim') as dien_thoai,
		a.ma_khach_hang,
		sum(tong) so_tien,
		(select da_thu from gia_bang_ke_no b where b.thang=date_format(a.ngay, \"%m\") and b.nam=date_format(a.ngay, \"%Y\") and b.ma_khach_hang=a.ma_khach_hang limit 0,1) as da_thu_tien,
		(select nguoi_thu_tien from gia_bang_ke_no b where b.thang=date_format(a.ngay, \"%m\") and b.nam=date_format(a.ngay, \"%Y\") and b.ma_khach_hang=a.ma_khach_hang limit 0,1) as nguoi_thu
	FROM gia_van_chuyen_dn a, (SELECT @curRank := 0) r
	WHERE date_format(a.ngay, \"%Y-%m\") = '$nam-$thang' and ma_tinh_di='$ma_tinh_di'
	GROUP BY a.ma_khach_hang
	ORDER by stt,a.ma_khach_hang";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);