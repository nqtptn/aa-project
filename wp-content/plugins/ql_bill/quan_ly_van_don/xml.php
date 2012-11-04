<?php
global $mysqli;
$current_user = wp_get_current_user();
if($current_user->user_login == "admin"){
	$tinh_di = "'ha_noi','tp_hcm'";
}else{
	$tinh_di = "'".$current_user->ma_tinh_di."'";
}

$grid = new EditableGrid();
$so_van_don = $mysqli->real_escape_string(strip_tags($_GET['so_van_don']));
if ($so_van_don == ""){
	$so_van_don = "%";
}
$grid->addColumn('id', 'Số vận đơn', 'string', NULL,true);
$grid->addColumn('ten_khach_hang', 'Tên khách hàng', 'string', NULL,true);
$grid->addColumn('noi_nhan', 'Nơi nhận', 'string',  NULL,true);
$grid->addColumn('noi_phat', 'Nơi phát', 'string' , NULL,true);
$grid->addColumn('trang_thai', 'Trạng thái', 'string', NULL,true);
$grid->addColumn('da_giao', 'Đã giao hàng', 'boolean', NULL,true);
$grid->addColumn('ghi_chu', 'Ghi chú', 'string', NULL,true);
$grid->addColumn('ngay_tao', 'Ngày tạo', 'string', NULL,false);
$grid->addColumn('action', 'Xóa', 'string', NULL,false);
$query="
	SELECT 
		ma_van_don as id,
		ten_khach_hang,
		noi_nhan,
		noi_phat,
		trang_thai,
		(case when trang_thai='Đã giao' then 1 else 0 end) as da_giao,
		ghi_chu,
		ngay_tao
	FROM gia_van_don
	WHERE ma_van_don like '$so_van_don' and  ma_tinh_di in (".$tinh_di.")
	ORDER by ngay_tao desc
	LIMIT 100";
$result = $mysqli->query($query);
$mysqli->close();
$grid->renderXML($result);