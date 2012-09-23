<?php
global $mysqli;
$grid = new EditableGrid();
$ma_dich_vu = $mysqli->real_escape_string(strip_tags($_GET['ma_dich_vu']));
$ma_tinh_di = $mysqli->real_escape_string(strip_tags($_GET['ma_tinh_di']));
$grid->addColumn('stt', 'Stt', 'string', NULL,true);
$grid->addColumn('ma_tinh_den', 'Tỉnh đến', 'string' , NULL ,true);
$grid->addColumn('khoi_luong_tu', 'KL từ', 'integer (tấn)', NULL,true);
$grid->addColumn('khoi_luong_den', 'KL đến', 'integer (tấn)', NULL,true);
$grid->addColumn('ma_phuong_tien', 'Phương tiện', 'string',  fetch_pairs($mysqli,'SELECT ma_phuong_tien, ten_phuong_tien FROM gia_phuong_tien'),true);
$grid->addColumn('gia', 'Giá cước', 'integer', NULL,true);
$grid->addColumn('don_vi_khoi_luong_vuot', 'KL vượt', 'integer (tấn)', NULL,true);
$grid->addColumn('gia_toi_da_can_tren', 'Giá tối đa', 'integer', NULL,false);
$grid->addColumn('gia_cong_them_gui_sau_12h', 'Giá sau 12h', 'integer', NULL,false);
$grid->addColumn('gia_toi_da_can_tren_gui_sau_12h', 'Giá tối đa sau 12h', 'integer', NULL,false);
$grid->addColumn('action', 'Xóa', 'string', NULL,false);
$query="
	SELECT
		ma_bang_gia as id, 
		@curRank := @curRank + 1 AS stt,
		ma_tinh_den,
		khoi_luong_tu,
		khoi_luong_den,
		ma_phuong_tien,
		gia,
		don_vi_khoi_luong_vuot,
		gia_toi_da_can_tren,
		gia_cong_them_gui_sau_12h,
		gia_toi_da_can_tren_gui_sau_12h
	FROM gia_bang_gia, (SELECT @curRank := 0) r
	WHERE ma_dich_vu = '$ma_dich_vu' and ma_tinh_di = '$ma_tinh_di'
	ORDER by ma_tinh_den,khoi_luong_tu";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);