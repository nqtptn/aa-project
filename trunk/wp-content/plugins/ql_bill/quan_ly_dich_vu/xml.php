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
$grid->addColumn('id', 'ma_dich_vu', 'string', NULL,true);
$grid->addColumn('ten_dich_vu', 'ten_dich_vu', 'string', NULL,true);
$grid->addColumn('thoi_gian_van_chuyen', 'thoi_gian_van_chuyen', 'string',  NULL,true);
$grid->addColumn('mo_ta', 'mo_ta', 'string' , NULL,true);
$grid->addColumn('la_dich_vu_cong_them', 'la_dich_vu_cong_them', 'integer (tấn)', NULL,true);
$grid->addColumn('gia_cong_them', 'gia_cong_them', 'integer', NULL,true);
$grid->addColumn('ti_le_cong_them', 'ti_le_cong_them', 'integer', NULL,true);
$grid->addColumn('action', 'Xóa', 'string', NULL,false);
$query="
	SELECT
		ma_dich_vu as id, 
		ten_dich_vu,
		thoi_gian_van_chuyen,
		mo_ta,
		la_dich_vu_cong_them,
		gia_cong_them,
		ti_le_cong_them
	FROM gia_dich_vu
	ORDER by ten_dich_vu";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);