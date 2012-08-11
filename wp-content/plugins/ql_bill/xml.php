<?php
require_once('EditableGrid.php');
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
if(!isset($_GET['f']) || empty($_GET['f'])){
	$form=1;
}else{
	$form=$_GET['f'];
}
if($form==1){
	$grid->addColumn('ngay', 'Ngày', 'date', NULL,true);
	$grid->addColumn('ma_dich_vu', 'Dịch vụ', 'string',  fetch_pairs($mysqli,'select ma_dich_vu,ten_dich_vu from  gia_dich_vu where la_dich_vu_cong_them=0'),true);
	$grid->addColumn('ma_tinh_den', 'Tỉnh đến', 'string' , fetch_pairs($mysqli,'SELECT ma_tinh as ma_tinh_den, ten_tinh FROM gia_tinh_thanh_pho'),true);
	$grid->addColumn('cuoc_phi', 'Giá cước', 'integer', NULL,true);
	$grid->addColumn('phu_thu', 'Phụ phí', 'integer', NULL,true);
	$grid->addColumn('tong', 'Tổng', 'integer', NULL,false);
	$grid->addColumn('ghi_chu', 'Ghi chú', 'string', NULL,true);
	$grid->addColumn('action', 'Xóa', 'string', NULL,false);
	$query="
				SELECT
				ma_van_chuyen as id, 
				date_format(ngay, \"%d/%m/%Y\") as ngay,
				ma_dich_vu,
				ma_tinh_den,
				cuoc_phi,
				phu_thu,
				tong,
				ghi_chu
				from gia_van_chuyen_dn";
	$result = $mysqli->query($query);
	$mysqli->close();
	$grid->renderXML($result,$total_record,$total_page,$curent_page);
}