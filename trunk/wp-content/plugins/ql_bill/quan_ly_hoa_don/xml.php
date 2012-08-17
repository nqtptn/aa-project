<?php
function fetch_pairs($mysqli,$query){
	if (!($res = $mysqli->query($query)))return FALSE;
	$rows = array();
	while ($row = $res->fetch_assoc()) {
		$first = true;
		$key = $value = null;
		foreach ($row as $val) {
			if ($first) { $key = $val; $first = false; }
			else { $value = $val; break; }
		}
		$rows[$key] = $value;
	}
	return $rows;
}
$grid = new EditableGrid();
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
if(!$mysqli->real_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME)){
	echo "Die";
}
$khach_hang = $mysqli->real_escape_string(strip_tags($_GET['khach_hang']));
$thang = $mysqli->real_escape_string(strip_tags($_GET['thang']));
$nam = $mysqli->real_escape_string(strip_tags($_GET['nam']));
$grid->addColumn('stt', 'Stt', 'string', NULL,true);
$grid->addColumn('ngay', 'Ngày', 'string', NULL,true);
$grid->addColumn('so_bill', 'Số Bill', 'string', NULL,true);
$grid->addColumn('ma_dich_vu', 'Dịch vụ', 'string',  fetch_pairs($mysqli,'select ma_dich_vu,ten_dich_vu from  gia_dich_vu where la_dich_vu_cong_them=0'),true);
$grid->addColumn('ma_tinh_den', 'Tỉnh đến', 'string' , fetch_pairs($mysqli,'SELECT ma_tinh as ma_tinh_den, ten_tinh FROM gia_tinh_thanh_pho'),true);
$grid->addColumn('khoi_luong', 'Trọng lượng', 'integer (tấn)', NULL,true);
$grid->addColumn('cuoc_phi', 'Giá cước', 'integer', NULL,true);
$grid->addColumn('phu_thu', 'Phụ phí', 'integer', NULL,true);
$grid->addColumn('tong', 'Tổng', 'integer', NULL,false);
$grid->addColumn('ghi_chu', 'Ghi chú', 'string', NULL,true);
$grid->addColumn('action', 'Xóa', 'string', NULL,false);
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