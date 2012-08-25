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
			$field="ma_van_chuyen";
		}else{
			$field=$colname;
		}
		if($colname=="ma_dich_vu" || $colname=="ma_tinh_den" || $colname=="khoi_luong" || $colname=="cuoc_phi" || $colname=="phu_thu"){
			if($colname=="cuoc_phi"){
				if(empty($value)){
					$value=0;
				}
				$result = $mysqli->query("UPDATE gia_van_chuyen_dn SET cuoc_phi='$value',tong = $value + phu_thu WHERE ma_van_chuyen = '$id'");
			}elseif($colname=="phu_thu"){
				if(empty($value)){
					$value=0;
				}
				$result = $mysqli->query("UPDATE gia_van_chuyen_dn SET phu_thu='$value',tong = $value + cuoc_phi WHERE ma_van_chuyen = '$id'");
			}elseif($colname=="ma_dich_vu"){
				$temp1 = $wpdb->get_row("SELECT ma_tinh_den,khoi_luong FROM gia_van_chuyen_dn where ma_van_chuyen = '$id'");
				$temp2 = $wpdb->get_row("select fn_tinh_gia('".$value."','tp_hcm','".$temp1->ma_tinh_den."',".$temp1->khoi_luong.",0) as returnvalue");
				$result = $mysqli->query("UPDATE gia_van_chuyen_dn SET ma_dich_vu = '$value', cuoc_phi='".($temp2->returnvalue)."', tong=(".($temp2->returnvalue)." + phu_thu)  WHERE ma_van_chuyen = '$id'");
			}elseif($colname=="ma_tinh_den"){
				$temp1 = $wpdb->get_row("SELECT ma_dich_vu,khoi_luong FROM gia_van_chuyen_dn where ma_van_chuyen = '$id'");
				$temp2 = $wpdb->get_row("select fn_tinh_gia('".$temp1->ma_dich_vu."','tp_hcm','".$value."',".$temp1->khoi_luong.",0) as returnvalue");
				$result = $mysqli->query("UPDATE gia_van_chuyen_dn SET ma_tinh_den = '$value', cuoc_phi='".($temp2->returnvalue)."', tong=(".($temp2->returnvalue)." + phu_thu)  WHERE ma_van_chuyen = '$id'");
			}else{
				//Neu cot khoi luong dc cap nhat, tinh lai cuoc phi
				if(empty($value)){
					$value=0;
				}
				$temp1 = $wpdb->get_row("SELECT ma_dich_vu,ma_tinh_den FROM gia_van_chuyen_dn where ma_van_chuyen = '$id'");
				$temp2 = $wpdb->get_row("select fn_tinh_gia('".$temp1->ma_dich_vu."','tp_hcm','".$temp1->ma_tinh_den."',".$value.",0) as returnvalue");
				$result = $mysqli->query("UPDATE gia_van_chuyen_dn SET khoi_luong = '$value', cuoc_phi='".($temp2->returnvalue)."', tong=(".($temp2->returnvalue)." + phu_thu)  WHERE ma_van_chuyen = '$id'");
			}
		}else if ($colname=="ngay"){
			$temp1 = $wpdb->get_row("SELECT date_format(ngay, \"%Y-%m-\") as ngay FROM gia_van_chuyen_dn where ma_van_chuyen = '$id'");
			$result = $mysqli->query("UPDATE gia_van_chuyen_dn SET ngay = '".$temp1->ngay.$value."' WHERE ma_van_chuyen = '$id'");
		}else{
			$result = $mysqli->query("UPDATE gia_van_chuyen_dn SET $field = '$value' WHERE ma_van_chuyen = '$id'");
		}
		echo $result ? (($colname=="ma_dich_vu" || $colname=="khoi_luong" || $colname=="ma_tinh_den") ? ($temp2->returnvalue > 0 ? $temp2->returnvalue : 0) : "ok") : "error";
		$mysqli->close();
		
	}elseif($action=="delete"){
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$result = $mysqli->query("DELETE from gia_van_chuyen_dn WHERE ma_van_chuyen = '$id'");
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