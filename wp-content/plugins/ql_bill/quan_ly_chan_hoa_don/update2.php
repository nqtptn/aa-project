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
			$field="ma_tinh_di";
		}else{
			$field=$colname;
		}
		if($colname=="id"){
			$result2 = $mysqli->query("SELECT ma_tinh_di FROM gia_chuc_vu  WHERE ma_tinh_di = '$id'");
			$num=$result2->num_rows;
			if($num>0){
				$result = $mysqli->query("UPDATE gia_chuc_vu SET ma_tinh_di = '$value' WHERE ma_tinh_di = '$id'");
			}else{
				$result="";
			}
		}else{
			$result = $mysqli->query("UPDATE gia_chuc_vu SET $field = '$value' WHERE ma_tinh_di = '$id'");
		}
		echo $result ? "ok" : "error";
		$mysqli->close();
	}elseif($action=="delete"){
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$result = $mysqli->query("DELETE from gia_chuc_vu WHERE ma_tinh_di = '$id'");
		$mysqli->close();
		echo $result ? "ok" : "error";
	}elseif($action=="add_record"){
		$ma_tinh_di = $mysqli->real_escape_string(strip_tags($_POST['ma_tinh_di']));
		$giam_doc = $mysqli->real_escape_string(strip_tags($_POST['giam_doc']));
		$ke_toan_truong = $mysqli->real_escape_string(strip_tags($_POST['ke_toan_truong']));
		$ke_toan_cong_no = $mysqli->real_escape_string(strip_tags($_POST['ke_toan_cong_no']));
		$ke_toan_du_lieu = $mysqli->real_escape_string(strip_tags($_POST['ke_toan_du_lieu']));
		$lien_he = $mysqli->real_escape_string(strip_tags($_POST['lien_he']));
		$result =  $mysqli->query("INSERT INTO gia_chuc_vu 
			(ma_tinh_di,giam_doc,ke_toan_truong,ke_toan_cong_no,ke_toan_du_lieu,lien_he) value 
			('$ma_tinh_di','$giam_doc','$ke_toan_truong','$ke_toan_cong_no','$ke_toan_du_lieu','$lien_he')");
		echo $result ? "true" : "false";
		$mysqli->close();
	}
?>