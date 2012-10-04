<?php
global $mysqli;
$grid = new EditableGrid();
$grid->addColumn('id', 'Mã dịch vụ', 'string', NULL,true);
$grid->addColumn('ten_dich_vu', 'Tên dịch vụ', 'string', NULL,true);
$grid->addColumn('thoi_gian_van_chuyen', 'Thời gian vận chuyển', 'string',  NULL,true);
$grid->addColumn('mo_ta', 'Mô tả', 'string' , NULL,true);
$grid->addColumn('la_dich_vu_cong_them', 'Là dịch vụ cộng thêm', 'boolean', NULL,true);
$grid->addColumn('gia_cong_them', 'Giá cộng thêm', 'integer', NULL,true);
$grid->addColumn('ti_le_phu_phi', 'Tỉ lệ phụ phí', 'double(%)', NULL,true);
$grid->addColumn('vat', 'VAT', 'double(%)', NULL,true);
$grid->addColumn('action', 'Xóa', 'string', NULL,false);
$query="
	SELECT
		ma_dich_vu as id, 
		ten_dich_vu,
		thoi_gian_van_chuyen,
		mo_ta,
		la_dich_vu_cong_them,
		gia_cong_them,
		ti_le_phu_phi,
		vat
	FROM gia_dich_vu
	ORDER by ten_dich_vu";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);