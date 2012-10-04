<?
global $wpdb,$mysqli;
$thang = $mysqli->real_escape_string(strip_tags($_POST['thang']));
$action = $mysqli->real_escape_string(strip_tags($_POST['action']));
	if($action=="update"){
		$colname = $mysqli->real_escape_string(strip_tags($_POST['colname']));
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$thang = intval(substr($id,5,2));
		$nam = intval(substr($id,0,4));
		$ma_khach_hang = substr($id,8);
		$coltype = $mysqli->real_escape_string(strip_tags($_POST['coltype']));
		$value = $mysqli->real_escape_string(strip_tags($_POST['newvalue']));
		
		// This very generic. So this script can be used to update several tables.
		if($colname=="da_thu_tien"){
			$temp1 = $wpdb->get_row("select count(*)sl from gia_bang_ke_no where thang=$thang and nam=$nam and ma_khach_hang='$ma_khach_hang'");
			if($temp1->sl > 0){
				$result = $mysqli->query("UPDATE gia_bang_ke_no SET da_thu=$value WHERE thang=$thang and nam=$nam and ma_khach_hang='$ma_khach_hang'");
			}else{
				$result = $mysqli->query("INSERT INTO gia_bang_ke_no(thang,nam,ma_khach_hang,da_thu) VALUE($thang,$nam,'$ma_khach_hang',$value)");
			}
		}else if ($colname=="nguoi_thu"){
			$temp1 = $wpdb->get_row("select count(*)sl from gia_bang_ke_no where thang=$thang and nam=$nam and ma_khach_hang='$ma_khach_hang'");
			if($temp1->sl > 0){
				$result = $mysqli->query("UPDATE gia_bang_ke_no SET nguoi_thu_tien='$value' WHERE thang=$thang and nam=$nam and ma_khach_hang='$ma_khach_hang'");
			}else{
				$result = $mysqli->query("INSERT INTO gia_bang_ke_no(thang,nam,ma_khach_hang,nguoi_thu_tien) VALUE($thang,$nam,'$ma_khach_hang','$value')");
			}		}
		echo $result ? "ok" : "error";
		$mysqli->close();
		
	}
?>