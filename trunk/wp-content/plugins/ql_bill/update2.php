<?
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
if(!$mysqli->real_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME)){
	echo "Die";
}
$action = $mysqli->real_escape_string(strip_tags($_POST['action']));
$form=$_GET['f'];
if($form==1){
	if($action=="update"){
		$colname = $mysqli->real_escape_string(strip_tags($_POST['colname']));
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$coltype = $mysqli->real_escape_string(strip_tags($_POST['coltype']));
		$value = $mysqli->real_escape_string(strip_tags($_POST['newvalue']));
														
		// Here, this is a little tips to manage date format before update the table
		if ($coltype == 'date') {
			if ($value === "") 
				$value = NULL;
			else {
				$date_info = date_parse_from_format('d/m/Y H:i:S', $value);
				$value = $date_info['year']."/".$date_info['month']."/".$date_info['day']." 00:00:00";
		   }
		}                      

		// This very generic. So this script can be used to update several tables.
		$return=false;
		if($colname=="id"){
			$field="ma_van_chuyen";
		}else{
			$field=$colname;
		}
		$result = $mysqli->query("UPDATE gia_van_chuyen_dn SET $field = '$value' WHERE ma_van_chuyen = '$id'");
		$result2 = $mysqli->query("UPDATE gia_van_chuyen_dn SET tong = cuoc_phi + phu_thu WHERE ma_van_chuyen = '$id'");
		echo $result ? "ok" : "error $result";
		$mysqli->close();
	}elseif($action=="delete"){
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$result = $mysqli->query("DELETE from gia_van_chuyen_dn WHERE ma_van_chuyen = '$id'");
		$mysqli->close();
		echo $result ? "ok" : "error";
	}elseif($action=="add_record"){
		$ngay = $mysqli->real_escape_string(strip_tags($_POST['ngay']));
		$ma_dich_vu = $mysqli->real_escape_string(strip_tags($_POST['ma_dich_vu']));
		$ma_tinh_den = $mysqli->real_escape_string(strip_tags($_POST['ma_tinh_den']));
		$cuoc_phi = $mysqli->real_escape_string(strip_tags($_POST['cuoc_phi']));
		$phu_thu = $mysqli->real_escape_string(strip_tags($_POST['phu_thu']));
		$tong = $mysqli->real_escape_string(strip_tags($_POST['tong']));
		$ghi_chu = $mysqli->real_escape_string(strip_tags($_POST['ghi_chu']));
		$result =  $mysqli->query("INSERT INTO gia_van_chuyen_dn 
			(ngay,ma_dich_vu,ma_tinh_den,ma_tinh_di,cuoc_phi,phu_thu,tong,ghi_chu) value 
			('$ngay','$ma_dich_vu','$ma_tinh_den','tp_hcm','$cuoc_phi','$phu_thu','$tong','$ghi_chu')");
		echo $result ? $mysqli->insert_id : "false";
		$mysqli->close();
	}
}
?>