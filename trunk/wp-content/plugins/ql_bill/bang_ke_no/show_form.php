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
			}
		    highlight(row.id, success ? "ok" : "error");
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
		async: true
	});

}
function get_xml_link()
{
	var link='<? echo get_admin_url()?>admin.php?page=bang_ke_no&noheader=1&nofooter=1&action=XML';
	link = link + "&status=" + ($("#status").is(':checked') ? 1 : 0);
	link = link + "&thang=" + $("#thang").val();
	link = link + "&nam=" + $("#nam").val();
	return link;
}
function get_report_link()
{
	var link='<? echo get_admin_url()?>admin.php?page=bang_ke_no&noheader=1&nofooter=1&action=export_function';
	//link = link + "&status=" + ($("#status").is(':checked') ? 1 : 0);
	link = link + "&thang=" + $("#thang").val();
	link = link + "&nam=" + $("#nam").val();
	return link;
}
function load_content()
{
	$("#tablecontent").html("Loading...");
	var xml_link=get_xml_link();
	DatabaseGrid(xml_link,"tablecontent","filter",update_url);
	$("#report").html("<img src='<? echo plugins_url('ql_bill/images/icon_16.gif')?>' border='0' style='vertical-align: middle' /> <a href='" + get_report_link() +"' target=_blank>Xuất Báo Cáo</a>");
}
var update_url="<? echo get_admin_url()?>admin.php?page=bang_ke_no&action=update_record&noheader=1&nofooter=1";
</script>
<br/>
<!--
<label for="status">Đã thu nợ:</label>
<input type='checkbox' id='status' value='1' onchange="load_content()"/>
&nbsp; 
-->
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
<div id='report'></div>

<script type='text/javascript'>
load_content();
</script>
<?
}
?>