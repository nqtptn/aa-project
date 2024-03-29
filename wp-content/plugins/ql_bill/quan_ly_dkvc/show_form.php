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
	input_value['id'] = $("#ma_dich_vu").val();
	input_value['ten_dich_vu'] = $("#ten_dich_vu").val();
	input_value['thoi_gian_van_chuyen'] = $("#thoi_gian_van_chuyen").val();
	input_value['mo_ta'] = $("#mo_ta").val();
	input_value['la_dich_vu_cong_them'] = ($("#la_dich_vu_cong_them").is(':checked') ? 1 : 0);
	input_value['gia_cong_them'] = parseInt($("#gia_cong_them").val());
	if(input_value['gia_cong_them']==""){
		input_value['gia_cong_them']=0;
	}
	input_value['ti_le_phu_phi'] = parseInt($("#ti_le_phu_phi").val());
	if(input_value['ti_le_phu_phi']==""){
		input_value['ti_le_phu_phi']=0;
	}
	input_value['vat'] = parseInt($("#vat").val());
	if(input_value['vat']==""){
		input_value['vat']=0;
	}
	
	if(isNaN(input_value['gia_cong_them'])){
		alert("Giá cộng thêm phải là số!");
		$("#gia_cong_them").focus();
	}else if(isNaN(input_value['ti_le_phu_phi'])){
		alert("Tỉ lệ cộng thêm phải là số!");
		$("#ti_le_phu_phi").focus();
	}else if(isNaN(input_value['vat'])){
		alert("Thuế phải là số!");
		$("#vat").focus();
	}else{
		$.ajax({
			url: xml_link,
			type: 'POST',
			dataType: "html",
			data: {
				ma_dich_vu : input_value['id'],
				ten_dich_vu : input_value['ten_dich_vu'],
				thoi_gian_van_chuyen : input_value['thoi_gian_van_chuyen'],
				mo_ta : input_value['mo_ta'],
				la_dich_vu_cong_them : input_value['la_dich_vu_cong_them'],
				gia_cong_them : input_value['gia_cong_them'],
				ti_le_phu_phi : input_value['ti_le_phu_phi'],
				vat : input_value['vat'],
				action: "add_record",
			},
			success: function (response)
			{
				if(response!="false"){
					if(editableGrid.getRowCount()==0){
						load_content();
					}else{
						editableGrid.insert(editableGrid.getRowId(editableGrid.getRowCount() - 1),input_value['id'],input_value);
						$("#ma_dich_vu").val("");
						$("#ten_dich_vu").val("");
						$("#thoi_gian_van_chuyen").val("");
						$("#mo_ta").val("");
						$("#la_dich_vu_cong_them").removeAttr("checked");
						$("#gia_cong_them").val("");
						$("#ti_le_phu_phi").val("15");
						$("#vat").val("10");
						$("#ma_dich_vu").focus();
					}
				}else{
					alert("Mã dịch vụ đã tồn tại!\n Vui lòng nhập mã dịch vụ khác hoặc kiểm tra lại");
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
					alert("Mã dịch vụ đã tồn tại!\n Vui lòng nhập mã dịch vụ khác hoặc kiểm tra lại");
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
	var link='<? echo get_admin_url()?>admin.php?page=quan_ly_dkvc&noheader=1&nofooter=1&action=XML';
	link = link + "&status=" + ($("#status").is(':checked') ? 1 : 0);
	return link;
}
function load_content()
{
	$("#tablecontent").html("Loading...");
	var xml_link=get_xml_link();
	DatabaseGrid(xml_link,"tablecontent","filter",update_url);
}
var update_url="<? echo get_admin_url()?>admin.php?page=quan_ly_dkvc&action=update_record&noheader=1&nofooter=1";
</script>
<br/>
<label for="thang">Đăng ký vận chuyển đã xem:</label>
<input type='checkbox' id='status' value='1' onchange="load_content()"/>
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

<script type='text/javascript'>
load_content();
</script>
<?
}
?>