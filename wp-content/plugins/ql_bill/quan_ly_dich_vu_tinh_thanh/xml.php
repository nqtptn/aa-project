<?php
global $mysqli;
$grid = new EditableGrid();
$dich_vu = $mysqli->real_escape_string(strip_tags($_GET['dich_vu']));

$grid->addColumn('stt', 'Stt', 'string', NULL,false);
$grid->addColumn('ten_tinh', 'Tên tỉnh', 'string', NULL,false);
$grid->addColumn('la_tinh_di', 'Là tỉnh đi', 'boolean', NULL,true);
$grid->addColumn('la_tinh_den', 'Là tỉnh đến', 'boolean',  NULL,true);
$grid->addColumn('action', '', NULL, NULL,false);
$query="
	select ma_tinh as id,@curRank := @curRank + 1 AS stt,ten_tinh
	,(select count(*) from gia_dich_vu_tinh_thanh a1 where a1.ma_dich_vu='$dich_vu' and a1.ma_tinh=a.ma_tinh and la_tinh_di=1)la_tinh_di
	,(select count(*) from gia_dich_vu_tinh_thanh a1 where a1.ma_dich_vu='$dich_vu' and a1.ma_tinh=a.ma_tinh and la_tinh_di=0)la_tinh_den 
	from gia_tinh_thanh_pho a, (SELECT @curRank := 0) r 
	order by ma_tinh";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);