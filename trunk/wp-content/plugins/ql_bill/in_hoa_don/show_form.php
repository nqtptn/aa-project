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
function get_xml_link()
{
	var link='<? echo get_admin_url()?>admin.php?page=in_hoa_don&noheader=1&nofooter=1&action=XML';
	link = link + "&thang=" + $("#thang").val();
	link = link + "&nam=" + $("#nam").val();
	return link;
}
function get_report_link()
{	
	var link='<? echo get_admin_url()?>admin.php?page=in_hoa_don&noheader=1&nofooter=1&action=export_function';
	link = link + "&thang=" + $("#thang").val();
	link = link + "&nam=" + $("#nam").val();
	return link;
}
function load_content()
{
	$("#tablecontent").html("Loading...");
	var xml_link=get_xml_link();
	DatabaseGrid(xml_link,"tablecontent","filter","");
	$("#report").html("<img src='<? echo plugins_url('ql_bill/images/icon_16.gif')?>' border='0' style='vertical-align: middle' /> <a href='" + get_report_link() +"' target=_blank>Xuất Báo Cáo</a>");
}
</script>
<br/>
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