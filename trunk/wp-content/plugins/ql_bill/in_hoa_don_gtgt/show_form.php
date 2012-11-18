<?
if(!isset($_GET['f']) || empty($_GET['f'])){
	$form=1;
}else{
	$form=$_GET['f'];
}
if($form==1){
?>
<script type="text/javascript" src="http://jqueryjs.googlecode.com/files/jquery-1.3.1.min.js" > </script> 
<script type="text/javascript">
	function TinhHoaDon()
    {
		//Remove format
		document.getElementById('report_content_cong_thanh_toan').value = document.getElementById('report_content_cong_thanh_toan').value.replace(",","");
		
		//Caculate number
		document.getElementById('report_content_cong_thanh_toan_bang_chu').value = DocTienBangChu(document.getElementById('report_content_cong_thanh_toan').value) + " đồng";
		document.getElementById('report_content_cong_tien_hang').value = parseInt(document.getElementById('report_content_cong_thanh_toan').value / (1 + parseInt(document.getElementById('report_content_tax').value) / 100));
		document.getElementById('report_content_cong_tien_thue').value = parseInt(document.getElementById('report_content_cong_thanh_toan').value) - parseInt(document.getElementById('report_content_cong_tien_hang').value);
		document.getElementById('load_thanh_tien_1').value = document.getElementById('report_content_cong_tien_hang').value;
		
		//Format number
		document.getElementById('load_thanh_tien_1').value = numberFormat(document.getElementById('load_thanh_tien_1').value);		
		document.getElementById('report_content_cong_tien_hang').value = numberFormat(document.getElementById('report_content_cong_tien_hang').value);
		document.getElementById('report_content_cong_tien_thue').value = numberFormat(document.getElementById('report_content_cong_tien_thue').value);
		document.getElementById('report_content_cong_thanh_toan').value = numberFormat(document.getElementById('report_content_cong_thanh_toan').value);
	}
	
	var ChuSo=new Array(" không "," một "," hai "," ba "," bốn "," năm "," sáu "," bảy "," tám "," chín ");
	var Tien=new Array( "", " nghìn", " triệu", " tỷ", " nghìn tỷ", " triệu tỷ");
	//1. Hàm đọc số có ba chữ số;
	function DocSo3ChuSo(baso)
	{
		var tram;
		var chuc;
		var donvi;
		var KetQua="";
		tram=parseInt(baso/100);
		chuc=parseInt((baso%100)/10);
		donvi=baso%10;
		if(tram==0 && chuc==0 && donvi==0) return "";
		if(tram!=0)
		{
			KetQua += ChuSo[tram] + " trăm ";
			if ((chuc == 0) && (donvi != 0)) KetQua += " linh ";
		}
		if ((chuc != 0) && (chuc != 1))
		{
				KetQua += ChuSo[chuc] + " mươi";
				if ((chuc == 0) && (donvi != 0)) KetQua = KetQua + " linh ";
		}
		if (chuc == 1) KetQua += " mười ";
		switch (donvi)
		{
			case 1:
				if ((chuc != 0) && (chuc != 1))
				{
					KetQua += " mốt ";
				}
				else
				{
					KetQua += ChuSo[donvi];
				}
				break;
			case 5:
				if (chuc == 0)
				{
					KetQua += ChuSo[donvi];
				}
				else
				{
					KetQua += " lăm ";
				}
				break;
			default:
				if (donvi != 0)
				{
					KetQua += ChuSo[donvi];
				}
				break;
			}
		return KetQua;
	}
	//2. Hàm đọc số thành chữ (Sử dụng hàm đọc số có ba chữ số)	
	function DocTienBangChu(SoTien)
	{
		var lan=0;
		var i=0;
		var so=0;
		var KetQua="";
		var tmp="";
		var ViTri = new Array();
		if(SoTien<0) return "Số tiền âm !";
		if(SoTien==0) return "Không đồng !";
		if(SoTien>0)
		{
			so=SoTien;
		}
		else
		{
			so = -SoTien;
		}
		if (SoTien > 8999999999999999)
		{
			//SoTien = 0;
			return "";
		}
		ViTri[5] = Math.floor(so / 1000000000000000);
		if(isNaN(ViTri[5]))
			ViTri[5] = "0";
		so = so - parseFloat(ViTri[5].toString()) * 1000000000000000;
		ViTri[4] = Math.floor(so / 1000000000000);
		 if(isNaN(ViTri[4]))
			ViTri[4] = "0";
		so = so - parseFloat(ViTri[4].toString()) * 1000000000000;
		ViTri[3] = Math.floor(so / 1000000000);
		 if(isNaN(ViTri[3]))
			ViTri[3] = "0";
		so = so - parseFloat(ViTri[3].toString()) * 1000000000;
		ViTri[2] = parseInt(so / 1000000);
		 if(isNaN(ViTri[2]))
			ViTri[2] = "0";
		ViTri[1] = parseInt((so % 1000000) / 1000);
		 if(isNaN(ViTri[1]))
			ViTri[1] = "0";
		ViTri[0] = parseInt(so % 1000);
	  if(isNaN(ViTri[0]))
			ViTri[0] = "0";
		if (ViTri[5] > 0)
		{
			lan = 5;
		}
		else if (ViTri[4] > 0)
		{
			lan = 4;
		}
		else if (ViTri[3] > 0)
		{
			lan = 3;
		}
		else if (ViTri[2] > 0)
		{
			lan = 2;
		}
		else if (ViTri[1] > 0)
		{
			lan = 1;
		}
		else
		{
			lan = 0;
		}
		for (i = lan; i >= 0; i--)
		{
		   tmp = DocSo3ChuSo(ViTri[i]);
		   KetQua += tmp;
		   if (ViTri[i] > 0) KetQua += Tien[i];
		   if ((i > 0) && (tmp.length > 0)) KetQua += ',';//&& (!string.IsNullOrEmpty(tmp))
		}
	   if (KetQua.substring(KetQua.length - 1) == ',')
	   {
			KetQua = KetQua.substring(0, KetQua.length - 1);
	   }
	   KetQua = KetQua.substring(1,2).toUpperCase()+ KetQua.substring(2);
	   return KetQua;//.substring(0, 1);//.toUpperCase();// + KetQua.substring(1);
	}
	
	// This function formats numbers by adding commas
	function numberFormat(nStr){
	  nStr += '';
	  x = nStr.split('.');
	  x1 = x[0];
	  x2 = x.length > 1 ? '.' + x[1] : '';
	  var rgx = /(\d+)(\d{3})/;
	  while (rgx.test(x1))
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	  return x1 + x2;
	}	
</script>

<script type="text/javascript">

    function PrintElem(elem)
    {
        Popup($(elem).text());
    }

    function Popup(data) 
    {
		var w = screen.width, h = screen.height;
        var mywindow = window.open('', 'my div', 'top=0,left=0,width=' + w + ',height=' + h);
        mywindow.document.write('<html><head><style type="text/css" media="print">@page{size: A6; margin: 0mm;} body{background-color:#FFFFFF;border: solid 1px black; margin: 0px;}</style>');
        mywindow.document.write('</head><body><b> <font size="0.8px" style="font-family:times new roman">');
		
		mywindow.document.write('<br/><br/><br/><br/><br/>');
		mywindow.document.write('<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
			+ document.getElementById('load_ngay').value);
		mywindow.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
			+ document.getElementById('load_thang').value);
		mywindow.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
			+ document.getElementById('load_nam').value);
		mywindow.document.write('<font size="0.7px"><br/></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
			+ document.getElementById('load_nguoi_lien_he').value);
		mywindow.document.write('<font size="0.7px"><br/></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' 
			+ document.getElementById('load_ten_cong_ty').value);
		mywindow.document.write('<font size="0.7px"><br/></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' 
			+ document.getElementById('load_mst').value);
		mywindow.document.write('<font size="0.7px"><br/></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' 
			+ document.getElementById('load_dia_chi').value);
		mywindow.document.write('<font size="0.7px"><br/></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' 
			+ document.getElementById('report_content_payment_method').value 
			+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
			+ document.getElementById('report_content_account_number').value );
		mywindow.document.write('<br/><br/><br/>');
		mywindow.document.write('<table style="font-size: 11px; font-weight: bold;"><tr><td width="60"></td> <td width="30">1</td><td width="250">'+document.getElementById('load_ten_dich_vu_1').value+'</td><td width="50" align="center">'+document.getElementById('load_don_vi_tinh_1').value+'</td> <td width="70" align="center">'+document.getElementById('load_so_luong_1').value+'</td> <td width="70" align="right">'+document.getElementById('load_don_gia_1').value+'</td> <td width="70" align="right">'+document.getElementById('load_thanh_tien_1').value+'</td> </tr>'
			+ '</table>');
		mywindow.document.write('<font size="0.7px"><br/></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' 
			+ document.getElementById('report_content_cong_tien_hang').value);
		mywindow.document.write('<font size="0.7px"><br/></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' 
			+ document.getElementById('report_content_tax').value
			+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
			+ document.getElementById('report_content_cong_tien_thue').value );
		mywindow.document.write('<font size="0.7px"><br/></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
			+ document.getElementById('report_content_cong_thanh_toan').value );		
		mywindow.document.write('<font size="0.7px"><br/></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '
			+ document.getElementById('report_content_cong_thanh_toan_bang_chu').value);
		
		//mywindow.document.write(data);
		
        mywindow.document.write('</font></b></body></html>');		
		mywindow.document.close();
		mywindow.focus();
		mywindow.print();
		mywindow.close();

        return true;
    }

</script>
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
	input_value['ten_dich_vu'] = $("#ten_dich_vu").val();
	input_value['don_vi_tinh'] = $("#don_vi_tinh").val();
	input_value['so_luong'] = $("#so_luong").val();
	input_value['don_gia'] = $("#don_gia").val();
	if(isNaN(input_value['so_luong'])){
		alert("Số lượng phải là số!");
		$("#so_luong").focus();
	}else if(isNaN(input_value['don_gia'])){
		alert("Đơn giá phải là số!");
		$("#don_gia").focus();
	}else{
		$.ajax({
			url: xml_link,
			type: 'POST',
			dataType: "html",
			data: {
				khach_hang : $("#khach_hang").val(),
				ma_hoa_don_gtgt : $("#ma_hoa_don_gtgt").val(),
				ten_dich_vu : input_value['ten_dich_vu'],
				don_vi_tinh : input_value['don_vi_tinh'],
				cuoc_phi : input_value['cuoc_phi'],
				so_luong : input_value['so_luong'],
				don_gia : input_value['don_gia'],
				thanh_tien : parseInt(input_value['don_gia']) * parseInt(input_value['so_luong']),
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
						$("#ten_dich_vu").val("");
						$("#ten_dich_vu").focus();
					}
				}else{
					alert("Thêm mới không thành công, vui lòng kiểm tra Tên hàng hóa, dịch vụ và thông tin nhập!");
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
	var total=editableGrid.getValueAt(rowIndex, 6);
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
				var cot_so_luong=3;
				var cot_don_gia=4;
				var cot_thanh_tien=5;
				if(editableGrid.getColumnName(columnIndex)=="so_luong" || editableGrid.getColumnName(columnIndex)=="don_gia"){
					total = editableGrid.getValueAt(rowIndex, cot_so_luong) * editableGrid.getValueAt(rowIndex, cot_don_gia);
					editableGrid.setValueAt(rowIndex, cot_thanh_tien, total);
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
	var link='<? echo get_admin_url()?>admin.php?page=in_hoa_don_gtgt&noheader=1&nofooter=1&action=XML';
	link = link + "&khach_hang=" + $("#khach_hang").val();
	link = link + "&ma_hoa_don_gtgt=" + $("#ma_hoa_don_gtgt").val();
	return link;
}
function get_report_link()
{
	var link='<? echo get_admin_url()?>admin.php?page=in_hoa_don_gtgt&noheader=1&nofooter=1&action=export_function';
	link = link + "&khach_hang=" + $("#khach_hang").val();
	link = link + "&ma_hoa_don_gtgt=" + $("#ma_hoa_don_gtgt").val();
	link = link + "&content_tax=" + $("#report_content_tax").val();
	link = link + "&content_payment_method=" + $("#report_content_payment_method").val();
	link = link + "&content_account_number=" + $("#report_content_account_number").val();
	return link;
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
			load_hoa_don();
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Ajax failure\n" + errortext); },
		async: true
	});
}

function load_hoa_don()
{
	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=in_hoa_don_gtgt&action=load_hoa_don&noheader=1&nofooter=1",
		type: 'POST',
		dataType: "html",
		data: {
			khach_hang : $("#khach_hang").val()
		},
		success: function (response)
		{
			// reset old value if failed then highlight row
			$("#ma_hoa_don_gtgt").html(response);
			if($("#ma_hoa_don_gtgt").val != ""){
				load_thong_tin_khach_hang();
			}
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Thực hiện lỗi, vui lòng thực hiện lại. \n" + errortext); },
		async: true
	});
}

function load_thong_tin_khach_hang()
{
	$("#ket_qua").html("");
	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=in_hoa_don_gtgt&action=load_thong_tin_khach_hang&noheader=1&nofooter=1",
		type: 'POST',
		dataType: "html",
		data: {
			khach_hang : $("#khach_hang").val()
		},
		success: function (response)
		{
			// reset old value if failed then highlight row
			$("#mydiv").html(response);
			if($("#ma_hoa_don_gtgt").val != ""){
				load_noi_dung_hang_hoa();
			}
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Thực hiện lỗi, vui lòng thực hiện lại. \n" + errortext); },
		async: true
	});
}

function load_content()
{	
}

function tao_moi_hoa_don()
{	
	if($("#khach_hang").val() == ""){
		alert("Vui lòng chọn khách hàng!");
		return false;
	}

	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=in_hoa_don_gtgt&action=tao_moi_hoa_don&noheader=1&nofooter=1",
		type: 'POST',
		dataType: "html",
		data: {
			khach_hang : $("#khach_hang").val()
		},
		success: function (response)
		{
			// reset old value if failed then highlight row
			$("#ma_hoa_don_gtgt").html(response);
			if($("#ma_hoa_don_gtgt").val != ""){
				load_thong_tin_khach_hang();
			}			
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Thực hiện lỗi, vui lòng thực hiện lại. \n" + errortext); },
		async: true
	});
}

function load_noi_dung_hang_hoa()
{
	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=in_hoa_don_gtgt&action=load_noi_dung_hang_hoa&noheader=1&nofooter=1",
		type: 'POST',
		dataType: "html",
		data: {
			ma_hoa_don_gtgt : $("#ma_hoa_don_gtgt").val()
		},
		success: function (response)
		{
			// reset old value if failed then highlight row
			$("#div_noi_dung_hang_hoa").html(response);
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Thực hiện lỗi, vui lòng thực hiện lại. \n" + errortext); },
		async: true
	});
}

function luu_hoa_don()
{
	$.ajax({
		url: "<? echo get_admin_url()?>admin.php?page=in_hoa_don_gtgt&action=luu_hoa_don&noheader=1&nofooter=1",
		type: 'POST',
		dataType: "html",
		data: {
			khach_hang : $("#khach_hang").val(),
			ma_hoa_don_gtgt : $("#ma_hoa_don_gtgt").val(),
			report_content_payment_method : $("#report_content_payment_method").val(),
			report_content_account_number : $("#report_content_account_number").val(),
			report_content_cong_tien_hang : $("#report_content_cong_tien_hang").val(),
			report_content_tax : $("#report_content_tax").val(),
			report_content_cong_tien_thue : $("#report_content_cong_tien_thue").val(),
			report_content_cong_thanh_toan : $("#report_content_cong_thanh_toan").val(),
			report_content_cong_thanh_toan_bang_chu : $("#report_content_cong_thanh_toan_bang_chu").val(),
			load_stt_1 : $("#load_stt_1").val(),
			load_ten_dich_vu_1 : $("#load_ten_dich_vu_1").val(),
			load_don_vi_tinh_1 : $("#load_don_vi_tinh_1").val(),
			load_so_luong_1 : $("#load_so_luong_1").val(),
			load_don_gia_1 : $("#load_don_gia_1").val(),
			load_thanh_tien_1 : $("#load_thanh_tien_1").val()
		},
		success: function (response)
		{
			// reset old value if failed then highlight row
			$("#ket_qua").html(response);
		},
		error: function(XMLHttpRequest, textStatus, exception) { alert("Thực hiện lỗi, vui lòng thực hiện lại. \n" + errortext); },
		async: true
	});
}

var update_url="<? echo get_admin_url()?>admin.php?page=in_hoa_don_gtgt&action=update_record&noheader=1&nofooter=1";
</script>
<br/>
<label for="khach_hang">Khách hàng:</label>
<input type='text' size='12' id='search_khach_hang' onchange="load_khach_hang();" />
<select id='khach_hang' onchange="load_hoa_don()">
<?
	echo "<option value=''>Chọn khách hàng</option>";
	global $wpdb;
	$current_user = wp_get_current_user();
	if($current_user->user_login == "admin"){
		$province = $wpdb->get_results("select user_login as ma_khach_hang, concat(user_nicename,' - ',(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name')) as ten_khach_hang from dev_users where user_login <> 'admin' and (select meta_value from dev_usermeta where user_id=ID and meta_key='dev_capabilities') like '%subscriber%' order by ma_khach_hang");
	}else{
		$province = $wpdb->get_results("select user_login as ma_khach_hang, concat(user_nicename,' - ',(select meta_value from dev_usermeta where user_id=ID and meta_key='last_name')) as ten_khach_hang from dev_users where user_login <> 'admin' and ma_tinh_di='".($current_user->ma_tinh_di)."' and (select meta_value from dev_usermeta where user_id=ID and meta_key='dev_capabilities') like '%subscriber%' order by ma_khach_hang");
	}
	//echo $wpdb->get_var( $wpdb->prepare("SELECT ma_tinh, ten_tinh FROM gia_tinh_thanh_pho", $comment_author, $comment_date) );
	foreach($province as $province2){
		echo "<option value='".$province2->ma_khach_hang."'>".$province2->ten_khach_hang."</option>";
	}
?>
</select>


<div id="tablecontent"></div>

<div id='posting' style='margin-top:10px;border: 1px solid #ccc;-moz-border-radius: 5px;-webkit-border-radius: 5px;padding:10px'>
	<div style='border-bottom:1px dotted #999;color:#588eaf'>
		<b>Thông tin hóa đơn <label id="ten_khach_hang"></label></b>
	</div>
	<br/>
	<div id="mydiv"></div>
</div>

<script type='text/javascript'>
load_content();
</script>
<?
}
?>