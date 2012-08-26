<?php
global $mysqli;
$grid = new EditableGrid();
$grid->addColumn('id', 'Mã khu vực', 'string', NULL,true);
$grid->addColumn('ten_khu_vuc', 'Tên khu vực', 'string', NULL,true);
$grid->addColumn('action', 'Xóa', 'string', NULL,false);
$query="
	SELECT
		ma_khu_vuc as id, 
		ten_khu_vuc
	FROM gia_khu_vuc
	ORDER by ten_khu_vuc";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);