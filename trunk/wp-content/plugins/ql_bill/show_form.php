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
		pageSize: 10,
		tableLoaded: function() {
			this.setCellRenderer("action", new CellRenderer({
				render: function(cell, value) {
					cell.innerHTML = "<a onclick=\"if (confirm('Are you sure you want to delete this record ? ')) delete_record(editableGrid," + cell.rowIndex + ",'"+update_url+"');\" style=\"cursor:pointer\" class='button'>Xóa</a>";
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
	input_value['ngay'] = $("#ngay").val() + "/" + $("#thang").val() + "/" + $("#nam").val();
	input_value['ma_dich_vu'] = $("#ma_dich_vu").val();
	input_value['ma_tinh_den'] = $("#ma_tinh_den").val();
	input_value['cuoc_phi'] = $("#cuoc_phi").val();
	input_value['phu_thu'] = $("#phu_thu").val();
	input_value['ghi_chu'] = $("#ghi_chu").val();
	input_value['tong'] = input_value['cuoc_phi'] + input_value['phu_thu'];
	$.ajax({
		url: xml_link,
		type: 'POST',
		dataType: "html",
		data: {
			ngay : input_value['ngay'],
			ma_dich_vu : input_value['ma_dich_vu'],
			ma_tinh_den : input_value['ma_tinh_den'],
			cuoc_phi : input_value['cuoc_phi'],
			phu_thu : input_value['phu_thu'],
			ghi_chu : input_value['ghi_chu'],
			tong : input_value['cuoc_phi'] + input_value['phu_thu'],
			action: "add_record",
		},
		success: function (response)
		{
			if(response!="false"){
				input_value['id']=response;
				editableGrid.insert(0,response,input_value);
			}
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
		async: true
	});
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
				if(editableGrid.getColumnName(columnIndex)=="phu_thu" || editableGrid.getColumnName(columnIndex)=="cuoc_phi"){
					total = editableGrid.getValueAt(rowIndex, 4) + editableGrid.getValueAt(rowIndex, 3);
					editableGrid.setValueAt(rowIndex, 5, total);
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
var update_url="<? echo get_admin_url()?>admin.php?page=ql_bill/ql_bill.php&action=update_record&noheader=1&nofooter=1&f=1";
var xml_link='<? echo get_admin_url()?>admin.php?page=ql_bill/ql_bill.php&noheader=1&nofooter=1&action=XML&f=1';
DatabaseGrid(xml_link,"tablecontent","filter",update_url);
</script>
<label for="filter">Lọc :</label>
<input type="text" id="filter"/>
<label for="pagesize">Số dòng trên trang: </label>
<select id="pagesize" name="pagesize">
	<option value="10">10</option>
	<option value="15">15</option>
	<option value="20">20</option>
	<option value="25">25</option>
	<option value="30">30</option>
	<option value="40">40</option>
	<option value="50">50</option>
</select>
<div id="tablecontent"></div>
<div id="paginator"></div>
<div id='posting'>
	<form name="post_form" method="post" onsubmit='return post_data(update_url)'>
		<label for="ngay">Ngày</label>
		<select id='ngay'>
			<?
				for ($i=1;$i<=31;$i++){
					echo "<option value='$i'>$i</option>";
				}
			?>
		</select>
		<label for="thang">Tháng</label>
		<select id='thang'>
			<?
				for ($i=1;$i<=12;$i++){
					echo "<option value='$i'>$i</option>";
				}
			?>
		</select>
		<label for="nam">Năm</label>
		<select id='nam'>
			<?
				for ($i=date("Y",time());$i>=(date("Y",time())-5);$i--){
					echo "<option value='$i'>$i</option>";
				}
			?>
		</select>
		<br />
		<label for="ma_dich_vu">Dịch vụ</label>
		<select id='ma_dich_vu'>
			<?
				global $wpdb;
				$temp=$wpdb->get_results("select ma_dich_vu,ten_dich_vu from  gia_dich_vu where la_dich_vu_cong_them=0");
				foreach($temp as $temp2){
					if(!empty($temp2->ma_dich_vu)){
						echo "<option value='".$temp2->ma_dich_vu."'>".$temp2->ten_dich_vu."</option>";
					}
				}
			?>
		</select>
		<label for="ma_tinh_den">Mã tỉnh</label>
		<select id="ma_tinh_den">
		<?
			global $wpdb;
			$province = $wpdb->get_results("SELECT ma_tinh, ten_tinh FROM gia_tinh_thanh_pho");
			//echo $wpdb->get_var( $wpdb->prepare("SELECT ma_tinh, ten_tinh FROM gia_tinh_thanh_pho", $comment_author, $comment_date) );
			foreach($province as $province2){
				if(!empty($province2->ma_tinh)){
					echo "<option value='".$province2->ma_tinh."'>".$province2->ten_tinh."</option>";
				}
			}
		?>
		</select>
		
		<label for="cuoc_phi">Cước phí</label>
		<input type='text' id='cuoc_phi' value='' />

		<label for="phu_thu">Phụ thu</label>
		<input type='text' id='phu_thu' value='' />
		<label for="ghi_chu">Ghi chú</label>
		<input type='text' id='ghi_chu' value='' />
		<input type='submit' value='Save' />
	</form>
</div>
<?
}
?>