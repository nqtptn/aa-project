<?
global $wpdb,$mysqli;
$action = $mysqli->real_escape_string(strip_tags($_POST['action']));
	if($action=="update"){
		$colname = $mysqli->real_escape_string(strip_tags($_POST['colname']));
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$coltype = $mysqli->real_escape_string(strip_tags($_POST['coltype']));
		$value = $mysqli->real_escape_string(strip_tags($_POST['newvalue']));
		
		// This very generic. So this script can be used to update several tables.
		$return=false;
		if($colname=="id"){
			$field="ma_dich_vu";
		}else{
			$field=$colname;
		}
		if($colname=="id"){
			$result2 = $mysqli->query("SELECT ma_dich_vu FROM gia_dich_vu  WHERE ma_dich_vu = '$id'");
			$num=$result2->num_rows;
			if($num>0){
				$result = $mysqli->query("UPDATE gia_dich_vu SET ma_dich_vu = '$value' WHERE ma_dich_vu = '$id'");
			}else{
				$result="";
			}
		}else{
			$result = $mysqli->query("UPDATE gia_dich_vu SET $field = '$value' WHERE ma_dich_vu = '$id'");
		}
		echo $result ? "ok" : "error";
		$mysqli->close();
		
	}elseif($action=="delete"){
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$result = $mysqli->query("DELETE from gia_dich_vu WHERE ma_dich_vu = '$id'");
		$mysqli->close();
		echo $result ? "ok" : "error";
	}elseif($action=="add_record"){
		$ma_dich_vu = $mysqli->real_escape_string(strip_tags($_POST['ma_dich_vu']));
		$ten_dich_vu = $mysqli->real_escape_string(strip_tags($_POST['ten_dich_vu']));
		$thoi_gian_van_chuyen = $mysqli->real_escape_string(strip_tags($_POST['thoi_gian_van_chuyen']));
		$mo_ta = $mysqli->real_escape_string(strip_tags($_POST['mo_ta']));
		$la_dich_vu_cong_them = $mysqli->real_escape_string(strip_tags($_POST['la_dich_vu_cong_them']));
		$co_phu_phi = $mysqli->real_escape_string(strip_tags($_POST['co_phu_phi']));
		$gia_cong_them = $mysqli->real_escape_string(strip_tags($_POST['gia_cong_them']));
		$result =  $mysqli->query("INSERT INTO gia_dich_vu 
			(ma_dich_vu,ten_dich_vu,thoi_gian_van_chuyen,mo_ta,la_dich_vu_cong_them,co_phu_phi,gia_cong_them) value 
			('$ma_dich_vu','$ten_dich_vu','$thoi_gian_van_chuyen','$mo_ta','$la_dich_vu_cong_them','$co_phu_phi','$gia_cong_them')");
		echo $result ? "true" : "false";
		$mysqli->close();
	}
?>