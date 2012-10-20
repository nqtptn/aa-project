<?
global $wpdb,$mysqli;
$current_user = wp_get_current_user();
$action = $mysqli->real_escape_string(strip_tags($_POST['action']));
	if($action=="update"){
		$colname = $mysqli->real_escape_string(strip_tags($_POST['colname']));
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$coltype = $mysqli->real_escape_string(strip_tags($_POST['coltype']));
		$value = $mysqli->real_escape_string(strip_tags($_POST['newvalue']));
		
		// This very generic. So this script can be used to update several tables.
		$return=false;

		if($colname=="ten_dich_vu" || $colname=="don_vi_tinh" || $colname=="so_luong" || $colname=="don_gia"){
			if($colname=="so_luong"){
				if(empty($value)){
					$value=0;
				}
				$result = $mysqli->query("UPDATE gia_hoa_don_gtgt_noi_dung SET so_luong='$value' WHERE id = '$id'");
			}elseif($colname=="don_gia"){
				if(empty($value)){
					$value=0;
				}
				$result = $mysqli->query("UPDATE gia_hoa_don_gtgt_noi_dung SET don_gia='$value' WHERE id = '$id'");
			}elseif($colname=="ten_dich_vu"){
				$result = $mysqli->query("UPDATE gia_hoa_don_gtgt_noi_dung SET ten_dich_vu='$value' WHERE id = '$id'");
			}elseif($colname=="don_vi_tinh"){
				$result = $mysqli->query("UPDATE gia_hoa_don_gtgt_noi_dung SET don_vi_tinh='$value' WHERE id = '$id'");
			}
		}
		echo $result ? "ok" : "error";
		$mysqli->close();
		
	}elseif($action=="delete"){
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$result = $mysqli->query("DELETE from gia_hoa_don_gtgt_noi_dung WHERE id = '$id'");
		$mysqli->close();
		echo $result ? "ok" : "error";
	}elseif($action=="add_record"){
		$khach_hang = $mysqli->real_escape_string(strip_tags($_POST['khach_hang']));
		$ma_hoa_don_gtgt = $mysqli->real_escape_string(strip_tags($_POST['ma_hoa_don_gtgt']));
		$ten_dich_vu = $mysqli->real_escape_string(strip_tags($_POST['ten_dich_vu']));
		$don_vi_tinh = $mysqli->real_escape_string(strip_tags($_POST['don_vi_tinh']));
		$so_luong = $mysqli->real_escape_string(strip_tags($_POST['so_luong']));
		$don_gia = $mysqli->real_escape_string(strip_tags($_POST['don_gia']));
		$result =  $mysqli->query("INSERT INTO gia_hoa_don_gtgt_noi_dung 
			(ma_khach_hang,ma_hoa_don_gtgt,ten_dich_vu,don_vi_tinh,so_luong,don_gia) value 
			('$khach_hang','$ma_hoa_don_gtgt','$ten_dich_vu','$don_vi_tinh','$so_luong','$don_gia')");
		echo $result ? $mysqli->insert_id : "false";
		echo $result ;
		$mysqli->close();
	}
?>