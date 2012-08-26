<?
global $wpdb,$mysqli;
$action = $mysqli->real_escape_string(strip_tags($_POST['action']));
$ma_dich_vu = 'chuyen_bang_duong_bo';//$mysqli->real_escape_string(strip_tags($_GET['dich_vu']));

	if($action=="update"){
		$colname = $mysqli->real_escape_string(strip_tags($_POST['colname']));
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$coltype = $mysqli->real_escape_string(strip_tags($_POST['coltype']));
		$value = $mysqli->real_escape_string(strip_tags($_POST['newvalue']));
		
		// This very generic. So this script can be used to update several tables.
		$return=false;

		if($colname=="la_tinh_di" || $colname=="la_tinh_den"){
			if($colname=="la_tinh_di"){
				if($value==1){
					$result = $mysqli->query("INSERT INTO gia_dich_vu_tinh_thanh(ma_dich_vu,ma_tinh,la_tinh_di) VALUE('$ma_dich_vu','$id',1)");
				}else{
					$result = $mysqli->query("DELETE gia_dich_vu_tinh_thanh WHERE ma_dich_vu='$ma_dich_vu' and ma_tinh='$id' and la_tinh_di=1)");
				}				
			}else{
				if($value==1){
					$result = $mysqli->query("INSERT INTO gia_dich_vu_tinh_thanh(ma_dich_vu,ma_tinh,la_tinh_di) VALUE('$ma_dich_vu','$id',0)");
				}else{
					$result = $mysqli->query("DELETE gia_dich_vu_tinh_thanh WHERE ma_dich_vu='$ma_dich_vu' and ma_tinh='$id' and la_tinh_di=0)");
				}	
			}
		}
		echo $result ? "ok" : "error";
		$mysqli->close();
		
	}
?>