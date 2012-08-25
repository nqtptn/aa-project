<?php
global $mysqli;
$grid = new EditableGrid();
$grid->addColumn('id', 'Mã tỉnh', 'string', NULL,true);
$grid->addColumn('giam_doc', 'Giám đốc', 'string', NULL,true);
$grid->addColumn('ke_toan_truong', 'Kế toán trưởng', 'string', NULL,true);
$grid->addColumn('ke_toan_cong_no', 'Kế toán công nợ', 'string', NULL,true);
$grid->addColumn('ke_toan_du_lieu', 'Kế toán dữ liệu', 'string', NULL,true);
$grid->addColumn('lien_he', 'ĐT liên hệ', 'string', NULL,true);
$grid->addColumn('action', 'Xóa', 'string', NULL,false);
$query="
	SELECT
		ma_tinh_di as id, 
		giam_doc,ke_toan_truong,ke_toan_cong_no,ke_toan_du_lieu,lien_he
	FROM gia_chuc_vu";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);