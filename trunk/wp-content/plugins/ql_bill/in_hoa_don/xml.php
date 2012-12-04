<?php
global $mysqli;
$grid = new EditableGrid();
$current_user = wp_get_current_user();
$khach_hang=$current_user->user_login;
$thang = $mysqli->real_escape_string(strip_tags($_GET['thang']));
$nam = $mysqli->real_escape_string(strip_tags($_GET['nam']));
$grid->addColumn('stt', 'Stt', 'string', NULL,false);
$grid->addColumn('ngay', 'Ngày', 'string', NULL,false);
$grid->addColumn('so_bill', 'Số Bill', 'string', NULL,false);
$grid->addColumn('ma_dich_vu', 'Dịch vụ', 'string',  fetch_pairs($mysqli,'select ma_dich_vu,ten_dich_vu from  gia_dich_vu where la_dich_vu_cong_them=0'),false);
$grid->addColumn('ma_tinh_den', 'Tỉnh đến', 'string' , fetch_pairs($mysqli,'SELECT ma_tinh as ma_tinh_den, ten_tinh FROM gia_tinh_thanh_pho'),false);
$grid->addColumn('khoi_luong', 'Trọng lượng', 'integer (tấn)', NULL,false);
$grid->addColumn('cuoc_phi', 'Giá cước', 'integer', NULL,false);
$grid->addColumn('phu_thu', 'Phụ phí', 'integer', NULL,false);
$grid->addColumn('tong', 'Tổng', 'integer', NULL,false);
$grid->addColumn('ghi_chu', 'Ghi chú', 'string', NULL,false);
$query="
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
	FROM gia_van_chuyen_dn, (SELECT @curRank := 0) r
	WHERE date_format(ngay, \"%Y-%m\") = '$nam-$thang' and ma_khach_hang = '$khach_hang'
	ORDER by ngay";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);