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

		$result = $mysqli->query("UPDATE gia_bang_gia SET $colname = '$value' WHERE ma_bang_gia = '$id'");
		//echo "UPDATE gia_bang_gia SET $colname = '$value' WHERE ma_bang_gia = '$id'";
		if($result){
			// cap nhat gia
			$result2 =  $wpdb->query("select fn_cap_nhat_gia_toi_da_can_tren()");
			//
			$temp1 = $wpdb->get_row("SELECT gia_toi_da_can_tren,gia_toi_da_can_tren_gui_sau_12h FROM gia_bang_gia where ma_bang_gia = '$this_id'");
			echo ($temp1->gia_toi_da_can_tren)."|".($temp1->gia_toi_da_can_tren_gui_sau_12h);
		}else{
			echo "error";
		}
		$mysqli->close();
	}elseif($action=="delete"){
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$result = $mysqli->query("DELETE from gia_bang_gia WHERE ma_bang_gia = '$id'");
		$mysqli->close();
		echo $result ? "ok" : "error";
	}elseif($action=="add_record"){
		$chon_khach_hang = $mysqli->real_escape_string(strip_tags($_POST['chon_khach_hang']));
		$ma_dich_vu = $mysqli->real_escape_string(strip_tags($_POST['ma_dich_vu']));
		$ma_tinh_di = $mysqli->real_escape_string(strip_tags($_POST['ma_tinh_di']));
		$ma_tinh_den = $mysqli->real_escape_string(strip_tags($_POST['ma_tinh_den']));
		$khoi_luong_tu = $mysqli->real_escape_string(strip_tags($_POST['khoi_luong_tu']));
		$khoi_luong_den = $mysqli->real_escape_string(strip_tags($_POST['khoi_luong_den']));
		$ma_phuong_tien = $mysqli->real_escape_string(strip_tags($_POST['ma_phuong_tien']));
		$cuoc_phi = $mysqli->real_escape_string(strip_tags($_POST['cuoc_phi']));
		$don_vi_khoi_luong_vuot = $mysqli->real_escape_string(strip_tags($_POST['don_vi_khoi_luong_vuot']));
		$gia_sau_12h = $mysqli->real_escape_string(strip_tags($_POST['gia_sau_12h']));
		if($don_vi_khoi_luong_vuot>0){
			$co_vuot_khoi_luong=1;
		}else{
			$co_vuot_khoi_luong=0;
		}
		$result =  $mysqli->query("INSERT INTO gia_bang_gia 
			(ma_dich_vu,ma_tinh_di,ma_tinh_den,khoi_luong_tu,khoi_luong_den,ma_phuong_tien,gia,don_vi_khoi_luong_vuot,gia_cong_them_gui_sau_12h,co_vuot_khoi_luong,ma_khach_hang) value 
			('$ma_dich_vu','$ma_tinh_di','$ma_tinh_den','$khoi_luong_tu','$khoi_luong_den','$ma_phuong_tien','$cuoc_phi','$don_vi_khoi_luong_vuot','$gia_sau_12h','$co_vuot_khoi_luong','$chon_khach_hang')");
		$this_id = $mysqli->insert_id;
		if($this_id){
			// cap nhat gia
			$result2 =  $wpdb->query("select fn_cap_nhat_gia_toi_da_can_tren()");
			//
			$temp1 = $wpdb->get_row("SELECT gia_toi_da_can_tren,gia_toi_da_can_tren_gui_sau_12h FROM gia_bang_gia where ma_bang_gia = '$this_id'");
			echo $this_id."|".($temp1->gia_toi_da_can_tren)."|".($temp1->gia_toi_da_can_tren_gui_sau_12h);
		}else{
			echo "false";
		}
		$mysqli->close();
	}
?>