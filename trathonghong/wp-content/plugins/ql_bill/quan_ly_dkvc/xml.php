<?php
global $mysqli;
$status= $mysqli->real_escape_string(strip_tags($_GET['status']));
$grid = new EditableGrid();
$grid->addColumn('id', 'Mã đăng ký', 'string', NULL,false);
$grid->addColumn('ten_lien_he', 'Tên liên hệ', 'string', NULL,false);
$grid->addColumn('dien_thoai', 'Điện thoại', 'string',  NULL,false);
$grid->addColumn('email', 'Email', 'string' , NULL,false);
$grid->addColumn('website', 'Website', 'string', NULL,false);
$grid->addColumn('noi_dung', 'Nội dung', 'string', NULL,false);
$grid->addColumn('status', 'Đã xem', 'boolean', NULL,true);
$grid->addColumn('action', 'Xóa', 'string', NULL,false);
$query="
	SELECT
		id, 
		ten_lien_he,
		dien_thoai,
		email,
		website,
		noi_dung,
		status
	FROM gia_dang_ky_van_chuyen
	WHERE status=$status
	ORDER by maketime desc";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);