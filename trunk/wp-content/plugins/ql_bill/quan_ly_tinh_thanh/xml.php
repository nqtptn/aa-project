<?php
global $mysqli;
$grid = new EditableGrid();
$grid->addColumn('id', 'Mã tỉnh', 'string', NULL,true);
$grid->addColumn('ten_tinh', 'Tên tỉnh', 'string', NULL,true);
$grid->addColumn('ma_khu_vuc', 'Khu vực', 'string',  fetch_pairs($mysqli,'SELECT ma_khu_vuc, ten_khu_vuc	FROM gia_khu_vuc ORDER by ten_khu_vuc'),true);
$grid->addColumn('vi_tri_x', 'Vị trí X', 'integer' , NULL,true);
$grid->addColumn('vi_tri_y', 'Vị trí Y', 'integer', NULL,true);
$grid->addColumn('trung_tam_tinh', 'Trung tâm tỉnh', 'string', NULL,true);
$grid->addColumn('action', 'Xóa', 'string', NULL,false);
$query="
	SELECT
		ma_tinh as id, 
		ten_tinh,
		ma_khu_vuc,
		vi_tri_x,
		vi_tri_y,
		trung_tam_tinh
	FROM gia_tinh_thanh_pho
	ORDER by ten_tinh";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);