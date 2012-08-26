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
			$field="ma_khu_vuc";
		}else{
			$field=$colname;
		}
		if($colname=="id"){
			$result2 = $mysqli->query("SELECT ma_khu_vuc FROM gia_khu_vuc  WHERE ma_khu_vuc = '$id'");
			$num=$result2->num_rows;
			if($num>0){
				$result = $mysqli->query("UPDATE gia_khu_vuc SET ma_khu_vuc = '$value' WHERE ma_khu_vuc = '$id'");
			}else{
				$result="";
			}
		}else{
			$result = $mysqli->query("UPDATE gia_khu_vuc SET $field = '$value' WHERE ma_khu_vuc = '$id'");
		}
		echo $result ? "ok" : "error";
		$mysqli->close();
	}elseif($action=="delete"){
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$result = $mysqli->query("DELETE from gia_khu_vuc WHERE ma_khu_vuc = '$id'");
		$mysqli->close();
		echo $result ? "ok" : "error";
	}elseif($action=="add_record"){
		$ma_khu_vuc = $mysqli->real_escape_string(strip_tags($_POST['ma_khu_vuc']));
		$ten_khu_vuc = $mysqli->real_escape_string(strip_tags($_POST['ten_khu_vuc']));
		$result =  $mysqli->query("INSERT INTO gia_khu_vuc 
			(ma_khu_vuc,ten_khu_vuc) value 
			('$ma_khu_vuc','$ten_khu_vuc')");
		echo $result ? "true" : "false";
		$mysqli->close();
	}
?>