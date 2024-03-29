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
	input_value['ngay'] = $("#ngay").val();
	input_value['ma_dich_vu'] = $("#ma_dich_vu").val();
	input_value['ma_tinh_den'] = $("#ma_tinh_den").val();
	input_value['cuoc_phi'] = $("#cuoc_phi").val();
	if(input_value['cuoc_phi']==""){
		input_value['cuoc_phi']=0;
	}
	input_value['phu_thu'] = $("#phu_thu").val();
	if(input_value['phu_thu']==""){
		input_value['phu_thu']=0;
	}
	input_value['ghi_chu'] = $("#ghi_chu").val();
	input_value['don_vi_kg'] = ($("#don_vi_kg").attr('checked') ? 1000 : 1);
	input_value['khoi_luong'] = $("#khoi_luong").val() * input_value['don_vi_kg'];
	input_value['ngoai_thanh'] = ($("#ngoai_thanh").is(':checked') ? 1 : 0);
	input_value['sau12h'] = ($("#sau12h").is(':checked') ? 1 : 0);
	input_value['tong'] = parseInt(input_value['cuoc_phi']) + parseInt(input_value['phu_thu']);
	input_value['stt'] = editableGrid.getRowCount() + 1;
	input_value['so_bill'] = $("#so_bill").val();
	if(isNaN(input_value['cuoc_phi'])){
		alert("Cước phí phải là số!");
		$("#cuoc_phi").focus();
	}else if(isNaN(input_value['phu_thu'])){
		alert("Phụ thu phải là số!");
		$("#phu_thu").focus();
	}else if(isNaN(input_value['khoi_luong'])){
		alert("Khối lượng phải là số!");
		$("#khoi_luong").focus();
	}else{
		$.ajax({
			url: xml_link,
			type: 'POST',
			dataType: "html",
			data: {
				ngay : $("#ngay").val() + "/" + $("#thang").val() + "/" + $("#nam").val(),
				ma_dich_vu : input_value['ma_dich_vu'],
				ma_tinh_den : input_value['ma_tinh_den'],
				cuoc_phi : input_value['cuoc_phi'],
				phu_thu : input_value['phu_thu'],
				ghi_chu : input_value['ghi_chu'],
				don_vi_kg : input_value['don_vi_kg'],				
				khoi_luong : input_value['khoi_luong'],
				ngoai_thanh : input_value['ngoai_thanh'],
				sau12h : input_value['sau12h'],
				khach_hang : $("#khach_hang").val(),
				so_bill : $("#so_bill").val(),
				tong : parseInt(input_value['cuoc_phi']) + parseInt(input_value['phu_thu']),
				action: "add_record",
			},
			success: function (response)
			{
				if(response!="false"){
					if(editableGrid.getRowCount()==0){
						load_content();
					}else{
						input_value['id']=response;
						editableGrid.insert(editableGrid.getRowId(editableGrid.getRowCount() - 1),response,input_value);
						$("#cuoc_phi").val("");
						$("#phu_thu").val("");
						$("#ghi_chu").val("");
						$("#khoi_luong").val("");
						$("#so_bill").val("");
						$("#so_bill").focus();
					}
				}else{
					alert("Thêm mới không thành công, vui lòng kiểm tra Số Bill và thông tin nhập!");
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
			var success = onResponse ? onResponse(response) : (response == "ok" || !isNaN(parseInt(response))); // by default, a sucessfull reponse can be "ok" or a database id
			if (!success) editableGrid.setValueAt(rowIndex, columnIndex, oldValue)
			else{
				var cot_cuoc_phi=8;
				var cot_phu_thu=9;
				var cot_tong=10;
				if(editableGrid.getColumnName(columnIndex)=="phu_thu" || editableGrid.getColumnName(columnIndex)=="cuoc_phi"){
					total = editableGrid.getValueAt(rowIndex, cot_cuoc_phi) + editableGrid.getValueAt(rowIndex, cot_phu_thu);
					editableGrid.setValueAt(rowIndex, cot_tong, total);
				}else if(editableGrid.getColumnName(columnIndex)=="khoi_luong" || editableGrid.getColumnName(columnIndex)=="ngoai_thanh" || editableGrid.getColumnName(columnIndex)=="sau12h"){
					editableGrid.setValueAt(rowIndex, cot_cuoc_phi, response);
					total = editableGrid.getValueAt(rowIndex, cot_cuoc_phi) + editableGrid.getValueAt(rowIndex, cot_phu_thu);
					editableGrid.setValueAt(rowIndex, cot_tong, total);
				}else if(editableGrid.getColumnName(columnIndex)=="ma_tinh_den"){
					editableGrid.setValueAt(rowIndex, cot_cuoc_phi, response);
					total = editableGrid.getValueAt(rowIndex, cot_cuoc_phi) + editableGrid.getValueAt(rowIndex, cot_phu_thu);
					editableGrid.setValueAt(rowIndex, cot_tong, total);
				}else if(editableGrid.getColumnName(columnIndex)=="ma_dich_vu"){
					editableGrid.setValueAt(rowIndex, cot_cuoc_phi, response);
					total = editableGrid.getValueAt(rowIndex, cot_cuoc_phi) + editableGrid.getValueAt(rowIndex, cot_phu_thu);
					editableGrid.setValueAt(rowIndex, cot_tong, total);
				}
			}
		    highlight(row.id, success ? "ok" : "error");
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
	var temp2 = ($("#don_vi_kg").attr('checked') ? 1 : -1);
	var temp3 = ($("#ngoai_thanh").attr('checked') ? 1 : 0);
	var temp4 = ($("#sau12h").attr('checked') ? 1 : 0);
	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=quan_ly_hoa_don&action=load_cuoc_phi&noheader=1&nofooter=1",
		type: 'POST',
		dataType: "html",
		data: {
			khach_hang : $("#khach_hang").val(),
			ti_le_phu_phi : $("#ti_le_phu_phi").val(),
			ti_le_phu_phi_ngoai_thanh : $("#ti_le_phu_phi_ngoai_thanh").val(),			
			ma_dich_vu : $("#ma_dich_vu").val(),
			ma_tinh_den : $("#ma_tinh_den").val(),
			ma_phuong_tien : $("#ma_phuong_tien").val(),
			don_vi_kg : temp2,
			ngoai_thanh : temp3,
			sau12h : temp4,
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
function check_so_bill()
{
	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=quan_ly_hoa_don&action=check_so_bill&noheader=1&nofooter=1",
		type: 'POST',
		dataType: "html",
		data: {
			so_bill : $("#so_bill").val()
		},
		success: function (response)
		{
			// reset old value if failed then highlight row
			$("#div_check_so_bill").html(response);
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
		async: true
	});
}
function load_khach_hang()
{
	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=quan_ly_hoa_don&action=load_khach_hang&noheader=1&nofooter=1",
		type: 'POST',
		dataType: "html",
		data: {
			search_khach_hang : $("#search_khach_hang").val()
		},
		success: function (response)
		{
			// reset old value if failed then highlight row
			$("#khach_hang").html(response);
			load_thong_tin_khach_hang();
			load_content();
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
		async: true
	});
}
function load_thong_tin_khach_hang()
{
	$("#ket_qua").html("");
	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=quan_ly_hoa_don&action=load_thong_tin_khach_hang&noheader=1&nofooter=1",
		type: 'POST',
		dataType: "html",
		data: {
			khach_hang : $("#khach_hang").val()
		},
		success: function (response)
		{
			// reset old value if failed then highlight row
			$("#mydiv").html(response);
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Thực hiện lỗi, vui lòng thực hiện lại. \n" + errortext); },
		async: true
	});
}
function load_tinh_tp()
{
	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=quan_ly_hoa_don&action=load_tinh_tp&noheader=1&nofooter=1",
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
	var link='<? echo get_admin_url()?>admin.php?page=quan_ly_hoa_don&noheader=1&nofooter=1&action=XML';
	link = link + "&khach_hang=" + $("#khach_hang").val();
	link = link + "&thang=" + $("#thang").val();
	link = link + "&nam=" + $("#nam").val();
	return link;
}
function get_report_link()
{
	var link='<? echo get_admin_url()?>admin.php?page=quan_ly_hoa_don&noheader=1&nofooter=1&action=export_function';
	link = link + "&khach_hang=" + $("#khach_hang").val();
	link = link + "&thang=" + $("#thang").val();
	link = link + "&nam=" + $("#nam").val();
	link = link + "&content=" + $("#report_content").val();
	return link;
}
function get_report_link_csv()
{
	var link='<? echo get_admin_url()?>admin.php?page=quan_ly_hoa_don&noheader=1&nofooter=1&action=export_function_csv';
	link = link + "&khach_hang=" + $("#khach_hang").val();
	link = link + "&thang=" + $("#thang").val();
	link = link + "&nam=" + $("#nam").val();
	link = link + "&content=" + $("#report_content").val();
	return link;
}
function load_content()
{
	$("#tablecontent").html("Loading...");
	load_thong_tin_khach_hang();
	var xml_link=get_xml_link();
	DatabaseGrid(xml_link,"tablecontent","filter",update_url);
	$("#report").html("<img src='<? echo plugins_url('ql_bill/images/icon_16.gif')?>' border='0' style='vertical-align: middle' /> <a href='" + get_report_link() +"' target=_blank>Xuất ra PDF</a>");
	$("#report_csv").html("<img src='<? echo plugins_url('ql_bill/images/ex.png')?>' border='0' style='vertical-align: middle' /> <a href='" + get_report_link_csv() +"' target=_blank>Xuất ra excel</a>");
}
var update_url="<? echo get_admin_url()?>admin.php?page=quan_ly_hoa_don&action=update_record&noheader=1&nofooter=1";
</script>
<br/>
<label for="khach_hang">Khách hàng:</label>
<input type='text' size='12' id='search_khach_hang' onchange="load_khach_hang();" />
<select id='khach_hang' style="width:250px" onchange="load_content()">
<?
	global $wpdb;
	$current_user = wp_get_current_user();
	if($current_user->user_login == "admin"){
		$province = $wpdb->get_results("select user_login as ma_khach_hang, concat(user_nicename,' - ',(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name')) as ten_khach_hang from dev_users where user_login <> 'admin' and (select meta_value from dev_usermeta where user_id=ID and meta_key='dev_capabilities') like '%subscriber%' order by ma_khach_hang");
	}else{
		$province = $wpdb->get_results("select user_login as ma_khach_hang, concat(user_nicename,' - ',(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name')) as ten_khach_hang from dev_users where user_login <> 'admin' and ma_tinh_di='".($current_user->ma_tinh_di)."' and (select meta_value from dev_usermeta where user_id=ID and meta_key='dev_capabilities') like '%subscriber%' order by ma_khach_hang");
	}
	foreach($province as $province2){
		echo "<option value='".$province2->ma_khach_hang."'>".$province2->ten_khach_hang."</option>";
	}
?>
</select>
<label for="thang">Tháng:</label>
<select id='thang' onchange="load_content()">
	<?
		for ($i=1;$i<=12;$i++){
			if($i<10){
				$d_value="0".$i;
			}else{
				$d_value=$i;
			}
			if($i==date("n",time())){
				echo "<option value='$d_value' selected>$d_value</option>";
			}else{
				echo "<option value='$d_value'>$d_value</option>";
			}
		}
	?>
</select>
<label for="nam">Năm:</label>
<select id='nam' onchange="load_content()">
	<?
		for ($i=date("Y",time());$i>=(date("Y",time())-5);$i--){
			if($i==date("Y",time())){
				echo "<option value='$i' selected>$i</option>";
			}else{
				echo "<option value='$i'>$i</option>";
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
<input type="text" size='15' id="filter"/>

<div id="tablecontent"></div>
<div id="paginator"></div>
<div id='posting' style='margin-top:10px;border: 1px solid #ccc;-moz-border-radius: 5px;-webkit-border-radius: 5px;padding:10px'>
	<div style='border-bottom:1px dotted #999;color:#588eaf'>
		<b>Báo cáo</b>
	</div>
	Nội dung footer báo cáo:
	<input type="text" id="report_content" size="107" onchange="load_content()" value="Đề nghị Quý cơ quan kiểm tra và thanh toán bảng kê trên trước ngày" />
	<br /><span id='report'></span>
	<span id='report_csv'></span>
</div>
<div id='posting' style='margin-top:10px;border: 1px solid #ccc;-moz-border-radius: 5px;-webkit-border-radius: 5px;padding:10px'>
	<div style='border-bottom:1px dotted #999;color:#588eaf'>
		<b><div id="mydiv"></div></b>
	</div>
	<form name="post_form" method="post" onsubmit='return post_data(update_url)'>
		<table>
			<tr>
				<td>
					<label for="ngay">Ngày</label>
				</td>
				<td>
					<label for="so_bill">Số Bill</label>
				</td>				
				<td>
					<label for="ma_dich_vu">Dịch vụ</label>
				</td>
				<td>
					<label for="ma_tinh_den">Tỉnh đến</label>
				</td>
				<td>
					<label for="ma_phuong_tien">Vận chuyển</label>
				</td>
				<td>
					<label for="khoi_luong">KG</label>
				</td>
				<td>
					<label for="khoi_luong">Trọng lượng</label>
				</td>				
				<td>
					<label for="ngoai_thanh">VSâu</label>
				</td>
				<td>
					<label for="sau12h">Sau12h</label>
				</td>
				<td>
					<label for="cuoc_phi">Cước phí</label>
				</td>
				<td>
					<label for="phu_thu">Phụ thu</label>
				</td>
				<td>
					<label for="ghi_chu">Ghi chú</label>
				</td>
			</tr>
			<tr>
				<td>
					<select id='ngay'>
						<?
							for ($i=1;$i<=31;$i++){
								if($i<10){
									$d_value="0".$i;
								}else{
									$d_value=$i;
								}
								if($i==date("j",time())){
									echo "<option value='$d_value' selected>$d_value</option>";
								}else{
									echo "<option value='$d_value'>$d_value</option>";
								}
							}
						?>
					</select>				
				</td>
				<td>
					<input type='text' size='10' id='so_bill' value='' onchange="check_so_bill();"/>					
				</td>				
				<td>
					<select id='ma_dich_vu' style="width:160px" onchange="load_cuoc_phi();">
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
				</td>
				<td>
					<select id="ma_tinh_den" style="width:100px" onchange="load_cuoc_phi();">
					<?
						global $wpdb;
						$province = $wpdb->get_results("select ma_tinh,ten_tinh from gia_tinh_thanh_pho a where a.ma_tinh not in ('den_300km','tren_300km') order by ma_tinh");
						foreach($province as $province2){
							if(!empty($province2->ma_tinh)){
								echo "<option value='".$province2->ma_tinh."'>".$province2->ten_tinh."</option>";
							}
						}
					?>
					</select>				
				</td>
				<td>
					<select id="ma_phuong_tien" style="width:75px" onchange="load_cuoc_phi();">
						<option value=""></option>
						<option value="xe_container">Xe tải</option>
						<option value="tau_hoa">Tàu hỏa</option>
					</select>				
				</td>
				<td align="right">
					<input type='checkbox' id='don_vi_kg' value='1' CHECKED onclick="load_cuoc_phi();"/>
				</td>
				<td>
					<input type='text' size='6' id='khoi_luong' value=''  onchange="load_cuoc_phi();" />
				</td>
				<td align="right">
					<input type='checkbox' id='ngoai_thanh' value='0' onclick="load_cuoc_phi();"/>
				</td>
				<td align="right">
					<input type='checkbox' id='sau12h' value='0' onclick="load_cuoc_phi();"/>
				</td>
				<td>
					<input type='text' size='10' id='cuoc_phi' value='' />
				</td>
				<td>
					<input type='text' size='10' id='phu_thu' value='' />
				</td>
				<td>
					<input type='text' size='15' id='ghi_chu' value='' />
					<input type='submit' value=' Save ' />
				</td>
			</tr>			
		</table>
		<b><div id="div_check_so_bill"></div></b>
	</form>
</div>
<script type='text/javascript'>
load_content();
</script>
<?
}
?>