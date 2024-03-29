<?php
global $mysqli;
$grid = new EditableGrid();
$khach_hang = $mysqli->real_escape_string(strip_tags($_GET['khach_hang']));
$thang = $mysqli->real_escape_string(strip_tags($_GET['thang']));
$nam = $mysqli->real_escape_string(strip_tags($_GET['nam']));
$grid->addColumn('stt', 'Stt', 'string', NULL,true);
$grid->addColumn('ngay', 'Ngày', 'string', NULL,true);
$grid->addColumn('so_bill', 'Số Bill', 'string', NULL,true);
$grid->addColumn('ma_dich_vu', 'Dịch vụ', 'string',  fetch_pairs($mysqli,'select ma_dich_vu,ten_dich_vu from gia_dich_vu'),true);
$grid->addColumn('ma_tinh_den', 'Tỉnh đến', 'string' , fetch_pairs($mysqli,'SELECT ma_tinh as ma_tinh_den, ten_tinh FROM gia_tinh_thanh_pho'),true);
$grid->addColumn('khoi_luong', 'Trọng lượng', 'integer (tấn)', NULL,true);
$grid->addColumn('ngoai_thanh', 'Vùng sâu', 'boolean', NULL,true);
$grid->addColumn('sau12h', 'Sau 12h', 'boolean', NULL,true);
$grid->addColumn('cuoc_phi', 'Cước phí', 'integer', NULL,true);
$grid->addColumn('phu_thu', 'Phụ phí', 'integer', NULL,true);
$grid->addColumn('tong', 'Tổng', 'integer', NULL,false);
$grid->addColumn('ghi_chu', 'Ghi chú', 'string', NULL,true);
$grid->addColumn('ma_khach_hang', 'Mã KH', 'string', NULL,false);
$grid->addColumn('action', 'Xóa', 'string', NULL,false);
$query="
	SELECT
		ma_van_chuyen as id, 
		@curRank := @curRank + 1 AS stt,
		date_format(ngay, \"%d\") as ngay,
		ma_dich_vu,
		ma_tinh_den,
		khoi_luong,
		ngoai_thanh,
		sau12h,
		cuoc_phi,
		phu_thu,
		tong,
		ghi_chu,
		ma_khach_hang,
		so_bill
	FROM gia_van_chuyen_dn, (SELECT @curRank := 0) r
	WHERE date_format(ngay, \"%Y-%m\") = '$nam-$thang' and ma_khach_hang = '$khach_hang'
	ORDER by ngay";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);