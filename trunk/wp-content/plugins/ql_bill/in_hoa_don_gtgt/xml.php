<?php
global $mysqli;
$grid = new EditableGrid();
$khach_hang = $mysqli->real_escape_string(strip_tags($_GET['khach_hang']));
$ma_hoa_don_gtgt = $mysqli->real_escape_string(strip_tags($_GET['ma_hoa_don_gtgt']));
$grid->addColumn('stt', 'Stt', 'string', NULL,false);
$grid->addColumn('ten_dich_vu', 'Tên hàng hóa, dịch vụ', 'string', NULL,true);
$grid->addColumn('don_vi_tinh', 'Đơn vị tính', 'string', NULL,true);
$grid->addColumn('so_luong', 'Số lượng', 'integer', NULL,true);
$grid->addColumn('don_gia', 'Đơn giá', 'integer', NULL,true);
$grid->addColumn('thanh_tien', 'Thành tiền', 'integer', NULL,false);
$grid->addColumn('action', 'Xóa', 'string', NULL,false);
$query="
	SELECT
		id,@curRank := @curRank + 1 AS stt,ten_dich_vu,don_vi_tinh,so_luong,don_gia,so_luong*don_gia as thanh_tien
	FROM gia_hoa_don_gtgt_noi_dung, (SELECT @curRank := 0) r
	WHERE ma_hoa_don_gtgt = $ma_hoa_don_gtgt and ma_khach_hang = '$khach_hang'
	ORDER by stt";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);