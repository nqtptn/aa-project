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
			$field="ma_tinh";
		}else{
			$field=$colname;
		}
		if($colname=="id"){
			$result2 = $mysqli->query("SELECT ma_tinh FROM gia_tinh_thanh_pho  WHERE ma_tinh = '$id'");
			$num=$result2->num_rows;
			if($num>0){
				$result = $mysqli->query("UPDATE gia_tinh_thanh_pho SET ma_tinh = '$value' WHERE ma_tinh = '$id'");
			}else{
				$result="";
			}
		}else{
			$result = $mysqli->query("UPDATE gia_tinh_thanh_pho SET $field = '$value' WHERE ma_tinh = '$id'");
		}
		echo $result ? "ok" : "error";
		$mysqli->close();
		
	}elseif($action=="delete"){
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$result = $mysqli->query("DELETE from gia_tinh_thanh_pho WHERE ma_tinh = '$id'");
		$mysqli->close();
		echo $result ? "ok" : "error";
	}elseif($action=="add_record"){
		$ma_tinh = $mysqli->real_escape_string(strip_tags($_POST['ma_tinh']));
		$ten_tinh = $mysqli->real_escape_string(strip_tags($_POST['ten_tinh']));
		$ma_khu_vuc = $mysqli->real_escape_string(strip_tags($_POST['ma_khu_vuc']));
		$vi_tri_x = $mysqli->real_escape_string(strip_tags($_POST['vi_tri_x']));
		$vi_tri_y = $mysqli->real_escape_string(strip_tags($_POST['vi_tri_y']));
		$trung_tam_tinh = $mysqli->real_escape_string(strip_tags($_POST['trung_tam_tinh']));
		$result =  $mysqli->query("INSERT INTO gia_tinh_thanh_pho 
			(ma_tinh,ten_tinh,ma_khu_vuc,vi_tri_x,vi_tri_y,trung_tam_tinh) value 
			('$ma_tinh','$ten_tinh','$ma_khu_vuc','$vi_tri_x','$vi_tri_y','$trung_tam_tinh')");
		echo $result ? "true" : "false";
		$mysqli->close();
	}
?>