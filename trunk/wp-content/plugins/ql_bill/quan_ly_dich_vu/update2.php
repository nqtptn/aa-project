<?
global $wpdb;
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
if(!$mysqli->real_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME)){
	echo "Die";
}
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
			$num=mysql_num_rows($result2);
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
		$ngay = $mysqli->real_escape_string(strip_tags($_POST['ngay']));
		$temp = explode("/",$ngay);
		$ngay = $temp[2]."/".$temp[1]."/".$temp[0]. " 00:00:00";
		$ma_dich_vu = $mysqli->real_escape_string(strip_tags($_POST['ma_dich_vu']));
		$ma_tinh_den = $mysqli->real_escape_string(strip_tags($_POST['ma_tinh_den']));
		$cuoc_phi = $mysqli->real_escape_string(strip_tags($_POST['cuoc_phi']));
		$phu_thu = $mysqli->real_escape_string(strip_tags($_POST['phu_thu']));
		$tong = $mysqli->real_escape_string(strip_tags($_POST['tong']));
		$ghi_chu = $mysqli->real_escape_string(strip_tags($_POST['ghi_chu']));
		$khoi_luong = $mysqli->real_escape_string(strip_tags($_POST['khoi_luong']));
		$khach_hang = $mysqli->real_escape_string(strip_tags($_POST['khach_hang']));
		$so_bill = $mysqli->real_escape_string(strip_tags($_POST['so_bill']));
		$result =  $mysqli->query("INSERT INTO gia_van_chuyen_dn 
			(ngay,ma_dich_vu,ma_tinh_den,ma_tinh_di,cuoc_phi,phu_thu,tong,ghi_chu,khoi_luong,ma_khach_hang,so_bill) value 
			('$ngay','$ma_dich_vu','$ma_tinh_den','tp_hcm','$cuoc_phi','$phu_thu','$tong','$ghi_chu','$khoi_luong','$khach_hang','$so_bill')");
		echo $result ? $mysqli->insert_id : "false";
		echo $result ;
		$mysqli->close();
	}
?>