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
	input_value['id'] = $("#ma_van_don").val();
	input_value['ten_khach_hang'] = $("#ten_khach_hang").val();
	input_value['ten_nguoi_nhan'] = $("#ten_nguoi_nhan").val();
	input_value['noi_gui'] = $("#noi_gui").val();
	input_value['noi_nhan'] = $("#noi_nhan").val();
	input_value['thoi_gian_nhan'] = $("#thoi_gian_nhan").val();
	input_value['trang_thai'] = ($("#da_giao").is(':checked') ? "Đã giao" : $("#trang_thai").val());
	input_value['ghi_chu'] = $("#ghi_chu").val();
	if(input_value['id']==""){
		alert("Vui lòng nhập mã vận đơn!");
		$("#ma_van_don").focus();
	}else{
		$.ajax({
			url: xml_link,
			type: 'POST',
			dataType: "html",
			data: {
				ma_van_don : input_value['id'],
				ten_khach_hang : input_value['ten_khach_hang'],
				ten_nguoi_nhan : input_value['ten_nguoi_nhan'],
				noi_gui : input_value['noi_gui'],
				noi_nhan : input_value['noi_nhan'],
				thoi_gian_nhan : input_value['thoi_gian_nhan'],
				trang_thai : input_value['trang_thai'],
				ghi_chu : input_value['ghi_chu'],
				action: "add_record",
			},
			success: function (response)
			{
				if(response!="false"){
					if(editableGrid.getRowCount()==0){
						load_content();
					}else{
						editableGrid.insert(editableGrid.getRowId(editableGrid.getRowCount() - 1),input_value['id'],input_value);
						//$("#ma_van_don").val("");
						$("#ten_khach_hang").val("");
						$("#ten_nguoi_nhan").val("");
						$("#ghi_chu").val("");
						$("#ma_van_don").focus();
					}
				}else{
					alert("Mã vận đơn đã tồn tại!\n Vui lòng nhập mã vận đơn khác hoặc kiểm tra lại");
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
			if (!success){
				editableGrid.setValueAt(rowIndex, columnIndex, oldValue);
				if(editableGrid.getColumnName(columnIndex)=="id"){
					alert("Mã vận đơn đã tồn tại!\n Vui lòng nhập mã vận đơn khác hoặc kiểm tra lại");
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

function get_xml_link()
{
	var link='<? echo get_admin_url()?>admin.php?page=quan_ly_van_don&noheader=1&nofooter=1&action=XML';
	link = link + "&so_van_don=" + $("#so_van_don").val();
	return link;
}
function get_report_link()
{
	var link='<? echo get_admin_url()?>admin.php?page=quan_ly_van_don&noheader=1&nofooter=1&action=export_function';
	return link;
}
function load_content()
{
	$("#tablecontent").html("Loading...");
	var xml_link=get_xml_link();
	DatabaseGrid(xml_link,"tablecontent","filter",update_url);
	$("#report").html("<img src='<? echo plugins_url('ql_bill/images/icon_16.gif')?>' border='0' style='vertical-align: middle' /> <a href='" + get_report_link() +"' target=_blank>Xuất Báo Cáo</a>");
}
var update_url="<? echo get_admin_url()?>admin.php?page=quan_ly_van_don&action=update_record&noheader=1&nofooter=1";
</script>
<br/>
<label for="so_van_don">Số vận đơn:</label>
<input type='text' size='12' id='so_van_don' onchange="load_content();" />
<label for="pagesize">Số dòng trên trang:</label>
<select id="pagesize" name="pagesize">
	<option value="10">10</option>
	<option value="20">20</option>
	<option value="30">30</option>
	<option value="50">50</option>
	<option value="70">70</option>
	<option value="100">100</option>
</select>
<label for="filter">Tìm kiếm:</label>
<input type="text" id="filter"/>

<div id="tablecontent"></div>
<div id="paginator"></div>

<div id='posting' style='margin-top:10px;border: 1px solid #ccc;-moz-border-radius: 5px;-webkit-border-radius: 5px;padding:10px'>
	<div style='border-bottom:1px dotted #999;color:#588eaf'><b>Thêm mới</b></div>
	<form name="post_form" method="post" onsubmit='return post_data(update_url)'>
		<table>
			<tr>
				<td>
					<label for="ma_van_don">Số vận đơn</label>
				</td>
				<td>
					<label for="ten_khach_hang">Tên khách hàng</label>
				</td>				
				<td>
					<label for="ten_nguoi_nhan">Tên người nhận</label>
				</td>				
				<td>
					<label for="noi_gui">Nơi gửi</label>
				</td>
				<td>
					<label for="noi_nhan">Nơi nhận</label>
				</td>
				<td>
					<label for="thoi_gian_nhan">Thời gian nhận</label>
				</td>				
				<td>
					<label for="trang_thai">Trạng thái</label>
				</td>
				<td>
					<label for="da_giao">Đã giao</label>
				</td>				
				<td>
					<label for="ghi_chu">Ghi chú</label>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>
					<input type='text' size='10' id='ma_van_don' value=''  />	
				</td>
				<td>
					<input type='text' size='18' id='ten_khach_hang' value=''  />
				</td>				
				<td>
					<input type='text' size='18' id='ten_nguoi_nhan' value=''  />
				</td>				
				<td>
					<input type='text' size='13' id='noi_gui' value=''  />
				</td>
				<td>
					<input type='text' size='13' id='noi_nhan' value=''  />				
				</td>
				<td>
					<input type='text' size='10' id='thoi_gian_nhan' value=''  />				
				</td>
				<td align="center">
					<input type='text' size='12' id='trang_thai' value='Đang vận chuyển' />
				</td>
				<td>
					<input type='checkbox' id='da_giao' value='0' />					
				</td>
				<td>
					<input type='text' size='30' id='ghi_chu' value='' />
				</td>
				<td>
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