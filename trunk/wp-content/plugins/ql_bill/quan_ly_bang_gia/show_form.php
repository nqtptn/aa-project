<?
if(!isset($_GET['f']) || empty($_GET['f'])){
	$form=1;
}else{
	$form=$_GET['f'];
}
if($form==1){
?>
<script type='text/javascript'>
function DatabaseGrid(XML_link,field_id,filter_id,update_url)
{
	editableGrid = new EditableGrid(field_id, {
		enableSort: true,
		pageSize: $("#pagesize").val(),
		tableLoaded: function() {
			this.setCellRenderer("action", new CellRenderer({
				render: function(cell, value) {
					cell.innerHTML = "<a onclick=\"if (confirm('Bạn có muốn xoá dòng dữ liệu này?')) delete_record(editableGrid," + cell.rowIndex + ",'"+update_url+"');\" style=\"cursor:pointer\" class='button'>Xóa</a>";
				}
			}));
			this.renderGrid(field_id, "testgrid");
			_$(filter_id).value = this.currentFilter ? this.currentFilter : '';
			_$(filter_id).onkeyup = function() {
				editableGrid.filter(_$(filter_id).value);
			};
			$("#pagesize").change(function() {
				editableGrid.setPageSize($("#pagesize").val());
			});
			editableGrid.setPageSize($("#pagesize").val());
		},
		modelChanged: function(rowIndex, columnIndex, oldValue, newValue, row) {
			updateCellValue(this, rowIndex, columnIndex, oldValue, newValue, row,update_url);
		},
		tableRendered: function() { this.updatePaginator(); }

	});
	editableGrid.loadXML(XML_link);
}
function post_data(xml_link){
	var input_value=new Array();
	input_value['chon_khach_hang'] = $("#chon_khach_hang").val();
	input_value['ma_dich_vu'] = $("#ma_dich_vu").val();
	input_value['ma_tinh_di'] = $("#ma_tinh_di").val();
	input_value['ma_tinh_den'] = Get_ma_tinh_den();
	input_value['khoi_luong_tu'] = $("#khoi_luong_tu").val();
	if(input_value['khoi_luong_tu']==""){
		input_value['khoi_luong_tu']=0;
	}
	input_value['khoi_luong_den'] = $("#khoi_luong_den").val();
	if(input_value['khoi_luong_den']==""){
		input_value['khoi_luong_den']=0;
	}
	input_value['ma_phuong_tien'] = $("#ma_phuong_tien").val();
	input_value['gia'] = $("#cuoc_phi").val();
	input_value['don_vi_khoi_luong_vuot'] = $("#don_vi_khoi_luong_vuot").val();
	input_value['gia_cong_them_gui_sau_12h'] = $("#gia_sau_12h").val();
	
	if(isNaN(input_value['gia'])){
		alert("'Cước' phí phải là số!");
		$("#gia").focus();
	}else if(isNaN(input_value['khoi_luong_tu'])){
		alert("'Khối lượng từ' phải là số!");
		$("#khoi_luong_tu").focus();
	}else if(isNaN(input_value['khoi_luong_den'])){
		alert("'Khối lượng đến' phải là số!");
		$("#khoi_luong_den").focus();
	}else if(isNaN(input_value['don_vi_khoi_luong_vuot'])){
		alert("'ĐVKL vượt' phải là số!");
		$("#don_vi_khoi_luong_vuot").focus();
	}else if(isNaN(input_value['gia_cong_them_gui_sau_12h'])){
		alert("'Giá sau 12h' phải là số!");
		$("#gia_cong_them_gui_sau_12h").focus();
	}else{
		$.ajax({
			url: xml_link,
			type: 'POST',
			dataType: "html",
			data: {
				chon_khach_hang : input_value['chon_khach_hang'],
				ma_dich_vu : input_value['ma_dich_vu'],
				ma_tinh_di : input_value['ma_tinh_di'],
				ma_tinh_den : input_value['ma_tinh_den'],
				khoi_luong_tu : input_value['khoi_luong_tu'],
				khoi_luong_den : input_value['khoi_luong_den'],
				ma_phuong_tien : input_value['ma_phuong_tien'],
				cuoc_phi : input_value['gia'],
				don_vi_khoi_luong_vuot : input_value['don_vi_khoi_luong_vuot'],
				gia_sau_12h : input_value['gia_cong_them_gui_sau_12h'],
				action: "add_record",
			},
			success: function (response)
			{
				if(response!="false"){
					if(editableGrid.getRowCount()==0){
						load_content();
					}else{
						var temp222 = response.split('|')
						input_value['id']=temp222[0];
						input_value['gia_toi_da_can_tren']=temp222[1];
						input_value['gia_toi_da_can_tren_gui_sau_12h']=temp222[2];
						editableGrid.insert(editableGrid.getRowId(editableGrid.getRowCount() - 1),response,input_value);
						$("#khoi_luong_tu").val("");
						$("#khoi_luong_den").val("");
						$("#cuoc_phi").val("");
						$("#don_vi_khoi_luong_vuot").val("");
						$("#gia_sau_12h").val("");
						$("#khoi_luong_tu").focus();
					}
				}else{
					alert("Thêm mới không thành công!");
				}
			},
			error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
			async: true
		});
	}
	return false;
}
/**
   updateCellValue calls the PHP script that will update the database.
 */
function updateCellValue(editableGrid, rowIndex, columnIndex, oldValue, newValue, row,sys_url,onResponse)
{
	var total=editableGrid.getValueAt(rowIndex, 5);
	$.ajax({
		url: sys_url,
		type: 'POST',
		dataType: "html",
		data: {
			id: editableGrid.getRowId(rowIndex),
			newvalue: editableGrid.getColumnType(columnIndex) == "boolean" ? (newValue ? 1 : 0) : newValue,
			colname: editableGrid.getColumnName(columnIndex),
			coltype: editableGrid.getColumnType(columnIndex),
			action: "update"
		},
		success: function (response)
		{

			// reset old value if failed then highlight row
			if (response=="error") editableGrid.setValueAt(rowIndex, columnIndex, oldValue)
			else{
				var giatoida=7;
				var giatoidasau12h=9;
				var temp222 = response.split('|')
				editableGrid.setValueAt(rowIndex, giatoida, temp222[0]);
				editableGrid.setValueAt(rowIndex, giatoidasau12h, temp222[1]);
			}
		    highlight(row.id, response=="error" ? "error" : "ok");
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
		async: true
	});

}
function delete_record(editableGrid, rowIndex,sys_url,onResponse)
{
	$.ajax({
		url: sys_url,
		type: 'POST',
		dataType: "html",
		data: {
			tablename : editableGrid.name,
			id: editableGrid.getRowId(rowIndex),
			action: "delete"
		},
		success: function (response)
		{
			// reset old value if failed then highlight row
			var success = onResponse ? onResponse(response) : (response == "ok" || !isNaN(parseInt(response))); // by default, a sucessfull reponse can be "ok" or a database id
			if (success) editableGrid.remove(rowIndex);
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
		async: true
	});
}
function load_cuoc_phi()
{
	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=quan_ly_bang_gia&action=load_cuoc_phi&noheader=1&nofooter=1",
		type: 'POST',
		dataType: "html",
		data: {
			ma_dich_vu : $("#ma_dich_vu").val(),
			ma_tinh_den : $("#ma_tinh_den").val(),
			khoi_luong : $("#khoi_luong").val()
		},
		success: function (response)
		{
			// reset old value if failed then highlight row
			$("#cuoc_phi").val(response);
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
		async: true
	});
}
function load_tinh_tp()
{
	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=quan_ly_bang_gia&action=load_tinh_tp&noheader=1&nofooter=1",
		type: 'POST',
		dataType: "html",
		data: {
			ma_dich_vu : $("#ma_dich_vu").val()
		},
		success: function (response)
		{
			// reset old value if failed then highlight row
			$("#ma_tinh_den").html(response);
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
		async: true
	});
}
function get_xml_link()
{
	var link='<? echo get_admin_url()?>admin.php?page=quan_ly_bang_gia&noheader=1&nofooter=1&action=XML';
	link = link + "&khach_hang=" + $("#khach_hang").val();
	link = link + "&ma_dich_vu=" + $("#ma_dich_vu").val();
	link = link + "&ma_tinh_di=" + $("#ma_tinh_di").val();
	return link;
}
function load_content()
{
	load_tinh_tp();
	$("#tablecontent").html("Loading...");
	var xml_link=get_xml_link();
	DatabaseGrid(xml_link,"tablecontent","filter",update_url);
	$("#report").html("<img src='<? echo plugins_url('ql_bill/images/icon_16.gif')?>' border='0' style='vertical-align: middle' /> <a href='" + get_report_link() +"' target=_blank>Xuất Báo Cáo</a>");
}
function Get_ma_tinh_den()
{
	var selectedArray = new Array();
	var selObj = document.getElementById('ma_tinh_den');
	var i;
	var count = 0;
	for (i=0; i<selObj.options.length; i++) {
		if (selObj.options[i].selected) {
			selectedArray[count] = selObj.options[i].value;
			count++;
		}
	}
	return "," + selectedArray + ",";
}
var update_url="<? echo get_admin_url()?>admin.php?page=quan_ly_bang_gia&action=update_record&noheader=1&nofooter=1";
</script>
<br/>
<label for="khach_hang">Bảng giá:</label>
<select id='khach_hang' onchange="load_content()">
<?
	global $wpdb;
	$current_user = wp_get_current_user();
	if($current_user->user_login == "admin"){
		$province = $wpdb->get_results("select user_login as ma_khach_hang, concat(user_nicename,' - ',(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name')) as ten_khach_hang from dev_users where user_login <> 'admin' and (select meta_value from dev_usermeta where user_id=ID and meta_key='dev_capabilities') like '%subscriber%' and user_login in (select distinct ma_khach_hang from gia_bang_gia) order by ma_khach_hang");
	}else{
		$province = $wpdb->get_results("select user_login as ma_khach_hang, concat(user_nicename,' - ',(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name')) as ten_khach_hang from dev_users where user_login <> 'admin' and ma_tinh_di='".($current_user->ma_tinh_di)."' and (select meta_value from dev_usermeta where user_id=ID and meta_key='dev_capabilities') like '%subscriber%' and user_login in (select distinct ma_khach_hang from gia_bang_gia) order by ma_khach_hang");
	}
	echo "<option value=''>Bảng giá mặc định</option>";
	foreach($province as $province2){
		echo "<option value='".$province2->ma_khach_hang."'>".$province2->ten_khach_hang."</option>";
	}
?>
</select>
<label for="ma_tinh_di">Tỉnh đi:</label>
<select id='ma_tinh_di'  onchange="load_content();">
<?
	global $wpdb;
	$province = $wpdb->get_results("select ma_tinh,ten_tinh from gia_tinh_thanh_pho where ma_tinh in ('ha_noi','tp_hcm')");
	foreach($province as $province2){
		if(!empty($province2->ma_tinh)){
			echo "<option value='".$province2->ma_tinh."'>".$province2->ten_tinh."</option>";
		}
	}
?>
</select>

<label for="ma_dich_vu">Dịch vụ:</label>
<select id='ma_dich_vu'  onchange="load_content();">
	<?
		global $wpdb;
		$temp=$wpdb->get_results("select ma_dich_vu,ten_dich_vu from  gia_dich_vu");
		foreach($temp as $temp2){
			if(!empty($temp2->ma_dich_vu)){
				if($temp2->ma_dich_vu == 'chuyen_phat_nhanh'){
					echo "<option selected='selected' value='".$temp2->ma_dich_vu."'>".$temp2->ten_dich_vu."</option>";
				}else{
					echo "<option value='".$temp2->ma_dich_vu."'>".$temp2->ten_dich_vu."</option>";
				}
			}
		}
	?>
</select>

<label for="pagesize">Số dòng:</label>
<select id="pagesize" name="pagesize">
	<option value="10">10</option>
	<option value="20">20</option>
	<option value="30">30</option>
	<option value="50">50</option>
	<option value="70">70</option>
	<option value="100">100</option>
</select>
<label for="filter">Tìm kiếm:</label>
<input type="text" id="filter" size='15'/>

<div id="tablecontent"></div>
<div id="paginator"></div>

<div id='posting' style='margin-top:10px;border: 1px solid #ccc;-moz-border-radius: 5px;-webkit-border-radius: 5px;padding:10px'>
	<div style='border-bottom:1px dotted #999;color:#588eaf'><b>Thêm mới</b></div>
	<form id="post_form" name="post_form" method="post" onsubmit='return post_data(update_url)'>
		<table>
			<tr>
				<td>
					<label for="ma_tinh_den">Tỉnh đến</label>
				</td>
				<td>
					<label for="chon_khach_hang">Khách hàng</label>
				</td>				
				<td>
					<label for="khoi_luong_tu">KL từ</label>
				</td>
				<td>
					<label for="khoi_luong_den">KL đến</label>
				</td>
				<td>
					<label for="ma_phuong_tien">Phương tiện</label>
				</td>
				<td>
					<label for="cuoc_phi">Cước phí</label>
				</td>
				<td>
					<label for="don_vi_khoi_luong_vuot">ĐVKL vượt</label>
				</td>
				<td>
					<label for="gia_sau_12h">Giá sau 12h</label>
				</td>
			</tr>
			<tr>
				<td width="140" valign="top">
					<select id="ma_tinh_den" name="ma_tinh_den" multiple="multiple" size="50" onclick="Get_ma_tinh_den()">
					<?
						global $wpdb;
						$province = $wpdb->get_results("select ma_tinh,ten_tinh from gia_tinh_thanh_pho order by ma_tinh");
						foreach($province as $province2){
							if(!empty($province2->ma_tinh)){
								echo "<option value='".$province2->ma_tinh."'>".$province2->ten_tinh."</option>";
							}
						}
					?>
					</select>
					<br /><i>Nhấn Ctrl hoặc Shift để chọn nhiều giá trị</i>
				</td>
				<td valign="top">
					<select id='chon_khach_hang'>
					<?
						global $wpdb;
						$current_user = wp_get_current_user();
						if($current_user->user_login == "admin"){
							$province = $wpdb->get_results("select user_login as ma_khach_hang, concat(user_nicename,' - ',(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name')) as ten_khach_hang from dev_users where user_login <> 'admin' and (select meta_value from dev_usermeta where user_id=ID and meta_key='dev_capabilities') like '%subscriber%' order by ma_khach_hang");
						}else{
							$province = $wpdb->get_results("select user_login as ma_khach_hang, concat(user_nicename,' - ',(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name')) as ten_khach_hang from dev_users where user_login <> 'admin' and ma_tinh_di='".($current_user->ma_tinh_di)."' and (select meta_value from dev_usermeta where user_id=ID and meta_key='dev_capabilities') like '%subscriber%' order by ma_khach_hang");
						}
						echo "<option value=''>Bảng giá mặc định</option>";
						foreach($province as $province2){
							echo "<option value='".$province2->ma_khach_hang."'>".$province2->ten_khach_hang."</option>";
						}
					?>
					</select>				
				</td>
				<td valign="top">
					<input type='text' size='8' id='khoi_luong_tu' value=''/>
				</td>
				<td valign="top">
					<input type='text' size='8' id='khoi_luong_den' value=''/>
				</td>
				<td valign="top">
					<select id="ma_phuong_tien">
						<option value=''></option>
					<?
						global $wpdb;
						$province = $wpdb->get_results("SELECT ma_phuong_tien, ten_phuong_tien FROM gia_phuong_tien");
						foreach($province as $province2){
							if(!empty($province2->ma_phuong_tien)){
								echo "<option value='".$province2->ma_phuong_tien."'>".$province2->ten_phuong_tien."</option>";
							}
						}
					?>
					</select>
				</td>
				<td valign="top">
					<input type='text' size='12' id='cuoc_phi' value='' />
				</td>
				<td valign="top">
					<input type='text' size='8' id='don_vi_khoi_luong_vuot' value=''/>
				</td>
				<td valign="top">
					<input type='text' size='12' id='gia_sau_12h' value=''/>
					<input type='submit' value='    Save    ' />
				</td>
			</tr>
		</table>

	</form>
</div>
<script type='text/javascript'>
load_content();
</script>
<?
}
?>