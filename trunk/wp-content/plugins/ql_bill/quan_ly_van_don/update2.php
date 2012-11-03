<?
global $wpdb,$mysqli;
$action = $mysqli->real_escape_string(strip_tags($_POST['action']));
	if($action=="update"){
		$colname = $mysqli->real_escape_string(strip_tags($_POST['colname']));
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$coltype = $mysqli->real_escape_string(strip_tags($_POST['coltype']));
		$value = $mysqli->real_escape_string(strip_tags($_POST['newvalue']));
		
		if($colname=="id"){
			$result = $mysqli->query("UPDATE gia_van_don SET ma_van_don = '$value' WHERE ma_van_don = '$id'");
		}else if($colname=="da_giao"){
			if($value == 1){
				$result = $mysqli->query("UPDATE gia_van_don SET trang_thai = 'Đã giao' WHERE ma_van_don = '$id'");
			}else{
				$result = $mysqli->query("UPDATE gia_van_don SET trang_thai = 'Đang vận chuyển' WHERE ma_van_don = '$id'");
			}
		}else{
			$result = $mysqli->query("UPDATE gia_van_don SET $colname = '$value' WHERE ma_van_don = '$id'");
		}
		
		echo $result ? "ok" : "error";
		$mysqli->close();
		
	}elseif($action=="delete"){
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$result = $mysqli->query("DELETE from gia_van_don WHERE ma_van_don = '$id'");
		$mysqli->close();
		echo $result ? "ok" : "error";
	}elseif($action=="add_record"){
		$ma_van_don = $mysqli->real_escape_string(strip_tags($_POST['ma_van_don']));
		$ten_khach_hang = $mysqli->real_escape_string(strip_tags($_POST['ten_khach_hang']));
		$noi_nhan = $mysqli->real_escape_string(strip_tags($_POST['noi_nhan']));
		$noi_phat = $mysqli->real_escape_string(strip_tags($_POST['noi_phat']));
		$trang_thai = $mysqli->real_escape_string(strip_tags($_POST['trang_thai']));
		$ghi_chu = $mysqli->real_escape_string(strip_tags($_POST['ghi_chu']));
		$result =  $mysqli->query("INSERT INTO gia_van_don 
			(ma_van_don,ten_khach_hang,noi_nhan,noi_phat,trang_thai,ghi_chu,ngay_tao) value 
			('$ma_van_don','$ten_khach_hang','$noi_nhan','$noi_phat','$trang_thai','$ghi_chu',NOW())");
		echo $result ? "true" : "false";
		$mysqli->close();
	}
?>