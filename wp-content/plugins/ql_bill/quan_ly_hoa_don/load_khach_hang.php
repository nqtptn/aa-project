<?
global $wpdb;
$search_khach_hang = $_POST['search_khach_hang'];
$current_user = wp_get_current_user();
if($current_user->user_login == "admin"){
	$province = $wpdb->get_results("select ma_khach_hang,ten_khach_hang from (select id, user_login as ma_khach_hang, concat(user_nicename,' - ',(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name')) as ten_khach_hang from dev_users where user_login <> 'admin') as a where concat(ma_khach_hang,' ',ten_khach_hang) like concat('%','$search_khach_hang','%') and (select meta_value from dev_usermeta where user_id=ID and meta_key='dev_capabilities') like '%subscriber%' order by ma_khach_hang");
}else{
	$province = $wpdb->get_results("select ma_khach_hang,ten_khach_hang from (select id, user_login as ma_khach_hang, concat(user_nicename,' - ',(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name')) as ten_khach_hang from dev_users where user_login <> 'admin' and ma_tinh_di='".($current_user->ma_tinh_di)."') where concat(ma_khach_hang,' ',ten_khach_hang) like concat('%','$search_khach_hang','%') and (select meta_value from dev_usermeta where user_id=ID and meta_key='dev_capabilities') like '%subscriber%' order by ma_khach_hang");
}

foreach($province as $province2){
	echo "<option value='".$province2->ma_khach_hang."'>".$province2->ten_khach_hang."</option>";
}
?>