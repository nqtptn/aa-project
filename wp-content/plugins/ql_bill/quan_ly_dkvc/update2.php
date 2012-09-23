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

		$result = $mysqli->query("UPDATE gia_dang_ky_van_chuyen SET status = $value WHERE id = $id");

		echo $result ? "ok" : "error";
		$mysqli->close();
		
	}elseif($action=="delete"){
		$id = $mysqli->real_escape_string(strip_tags($_POST['id']));
		$result = $mysqli->query("DELETE from gia_dang_ky_van_chuyen WHERE id = $id");
		$mysqli->close();
		echo $result ? "ok" : "error";
	}
?>