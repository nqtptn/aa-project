<?php
include_once('../../../wp-load.php');
global $wpdb;
$table_order = $wpdb->prefix."distance_order";

$ordernum = $_REQUEST['oid'];
$selectOrder = "select * from $table_order where ordid='".$ordernum."' order by ordid";
$resO = query($selectOrder);
$row0 = loadrows($resO);
?>
  <table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td colspan="2"><strong style="font-size:18px;">Your Order Status : </strong></td>
  </tr>
  <tr>
    <td width="42%"><strong>From Address:</strong></td>
    <td width="58%"><?php echo $row0[0]->source_address ;?></td>
  </tr>
  <tr>
    <td><strong>To Address:</strong></td>
    <td><?php echo $row0[0]->desti_address ;?></td>
  </tr>
  <tr>
    <td><strong>Qty:</strong></td>
    <td><?php echo $row0[0]->total_qty ;?> </td>
  </tr>
  <tr>
    <td><strong>Weight:</strong></td>
    <td><?php echo $row0[0]->total_weight ;?> lb</td>
  </tr>
  <tr>
    <td><strong>Order date:</strong></td>
    <td><?php echo $row0[0]->date_or ;?></td>
  </tr>
  <tr>
    <td><strong>Order Status:</strong></td>
    <td>
	<?php 
	if($row0[0]->order_status==0){ echo "Pending";}
	if($row0[0]->order_status==1){ echo "On the way";}
	if($row0[0]->order_status==2){ echo "Postpone";}
	if($row0[0]->order_status==3){ echo "Delay";}
	if($row0[0]->order_status==4){ echo "Shipped Done";}
	if($row0[0]->order_status==5){ echo "Decline";}
	
	?></td>
  </tr>
   <tr>
    <td><strong>Check Status Code :</strong></td>
    <td>DIST-<?php echo $row0[0]->ordid ;?></td>
  </tr>
  <tr>
    <td>Mail sent</td>
    <td>&nbsp;</td>
  </tr>
</table>

<?php
ob_start();
  ?>
  <table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td colspan="2"><strong style="font-size:18px;">Your Order Status : </strong></td>
  </tr>
  <tr>
    <td width="42%"><strong>From Address:</strong></td>
    <td width="58%"><?php echo $row0[0]->source_address ;?></td>
  </tr>
  <tr>
    <td><strong>To Address:</strong></td>
    <td><?php echo $row0[0]->desti_address ;?></td>
  </tr>
  <tr>
    <td><strong>Qty:</strong></td>
    <td><?php echo $row0[0]->total_qty ;?> </td>
  </tr>
  <tr>
    <td><strong>Weight:</strong></td>
    <td><?php echo $row0[0]->total_weight ;?> lb</td>
  </tr>
  <tr>
    <td><strong>Order date:</strong></td>
    <td><?php echo $row0[0]->date_or ;?></td>
  </tr>
  <tr>
    <td><strong>Order Status:</strong></td>
    <td>
	<?php 
	if($row0[0]->order_status==0){ echo "Pending";}
	if($row0[0]->order_status==1){ echo "On the way";}
	if($row0[0]->order_status==2){ echo "Postpone";}
	if($row0[0]->order_status==3){ echo "Delay";}
	if($row0[0]->order_status==4){ echo "Shipped Done";}
	if($row0[0]->order_status==5){ echo "Decline";}
	
	?></td>
  </tr>
   <tr>
    <td><strong>Check Status Code :</strong></td>
    <td>DIST-<?php echo $row0[0]->ordid ;?></td>
  </tr>
</table>
<?php
$content = ob_get_clean();
//$email = get_option('admin_email');
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
//$mail_to=$roww[0]->v_email;
$mail_subject='Your Order Status'; 
@mail($row0[0]->email, $mail_subject, $content, $headers);
//@mail(get_option('admin_email'), $mail_subject, $content, $headers);
?>