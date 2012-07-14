<?php
include_once('../../../wp-load.php');
$dump=print_r($_POST);
$msg='';
foreach($_POST as $ipnkey => $ipnval)
{
$msg.=$ipnkey."=".$ipnval."\n";
}


$notify_debug = 1;

/* email address used in the To: and From: fields of the debug email messages. */
$site_email = $paypalid;


// PayPal primary email account email address 
/*
Primary email address of the payment recipient (i.e., the merchant). 
If the payment is sent to a non-primary email address on your PayPal account, 
the receiver_email will still be your primary email
*/
$paypal_receiver_email = $paypalid;


// accept money from PayPal user's that have an unverified PayPal account
// yes or no
$accept_unverified = 'no';

// accept money from PayPal user's that have an unconfirmed PayPal account address
// yes or no
$accept_unconfirmed = 'yes';


// paypal ipn ip address 65.206.229.140
// NetRange:   65.206.228.0 - 65.206.231.255

$date = date("D, j M Y H:i:s O"); 
$crlf = "\n";
$debug_headers = "From: $site_email" .$crlf;
$debug_headers .= "Reply-To: $site_email" .$crlf;
$debug_headers .= "Return-Path: $site_email" .$crlf;
$debug_headers .= "X-Mailer: Perl-Studio" .$crlf;
$debug_headers .= "Date: $date" .$crlf; 
$debug_headers .= "X-Sender-IP: $REMOTE_ADDR" .$crlf; 
//========================================================================================
// end user configuration

$error = 0;
$post_string = '';
$output = '';
$valid_post = ''; 

$workString = 'cmd=_notify-validate';
/* Get PayPal Payment Notification variables including the encrypted code */ 
reset($HTTP_POST_VARS);
while(list($key, $val) = each($HTTP_POST_VARS)) { 
$post_string .= $key.'='.$val.'&'; 
$val = stripslashes($val);
$val = urlencode($val); 
$workString .= '&' .$key .'=' .$val; 
} 

if($notify_debug){
  $str = $post_string;
  $str = str_replace('&', "\n", $str );
  $debugmess = "post_string sent from PayPal\n===============================\n$str\n\n";
  $str = $workString;
  $str = str_replace('&', "\n", $str );
  $debugmess .= "workString posted back to PayPal\n==========================\n$str\n\n";
    
  /* mail it to the owner of this script*/
  //mail($site_email, "PayPal Notify Debug Results", $debugmess, $debug_headers);

}  


$details_string= "<table border=0 cellpadding=0 cellspacing=5 width=60%>\n";
$details_string.= '<tr><td>payment date</td><td>' .$_POST['payment_date'] ."</td></tr>\n"; 
$details_string.= '<tr><td>invoice no.</td><td>' .$_POST['invoice'] ."</td></tr>\n"; 
$details_string.= '<tr><td>payment id</td><td>' .$_POST['txn_id'] ."</td></tr>\n"; 
$details_string.= '<tr><td>item name</td><td>' .$_POST['item_name'] ."</td></tr>\n"; 
$details_string.= '<tr><td>quantity</td><td>' .$_POST['quantity'] ."</td></tr>\n"; 
$details_string.= '<tr><td>payment status</td><td>' .$_POST['payment_status'] ."</td></tr>\n"; 
$details_string.= '<tr><td>pending reason</td><td>' .$_POST['pending_reason'] ."</td></tr>\n"; 
$details_string.= '<tr><td>payment gross</td><td>' .$_POST['payment_gross'] ."</td></tr>\n"; 
$details_string.= '<tr><td>payment method</td><td>' .$_POST['payment_method'] ."</td></tr>\n"; 
$details_string.= '<tr><td>firstname</td><td>' .$_POST['first_name'] ."</td></tr>\n"; 
$details_string.= '<tr><td>lastname</td><td>' .$_POST['last_name'] ."</td></tr>\n"; 
$details_string.= '<tr><td>street address</td><td>' .$_POST['address_street'] ."</td></tr>\n"; 
$details_string.= '<tr><td>city</td><td>' .$_POST['address_city'] ."</td></tr>\n"; 
$details_string.= '<tr><td>state</td><td>' .$_POST['address_state'] ."</td></tr>\n"; 
$details_string.= '<tr><td>zipcode</td><td>' .$_POST['address_zip'] ."</td></tr>\n"; 
$details_string.= '<tr><td>country</td><td>' .$_POST['address_country'] ."</td></tr>\n"; 
$details_string.= '<tr><td>payer email</td><td>' .$_POST['payer_email'] ."</td></tr>\n"; 
$details_string.= '<tr><td>address status</td><td>' .$_POST['address_status'] ."</td></tr>\n"; 
$details_string.= '<tr><td>payer status</td><td>' .$_POST['payer_status'] ."</td></tr>\n"; 
$details_string.= "</table>\n";


/* assign posted variables to local variables
1)note: some of these posted variables will be empty

2)note: the following is not a complete list of the posted variables
*/

$item_name = trim(stripslashes($_POST['item_name']));
$item_number = trim(stripslashes($_POST['item_number']));
$payment_status = trim(stripslashes($_POST['payment_status']));
$payment_gross = trim(stripslashes($_POST['payment_gross']));
$txn_id = trim(stripslashes($_POST['txn_id']));
$receiver_email = trim(stripslashes($_POST['receiver_email']));
$payer_email = trim(stripslashes($_POST['payer_email']));
$payment_date = trim(stripslashes($_POST['payment_date']));
$invoice =  trim(stripslashes($_POST['invoice']));
$quantity = trim(stripslashes($_POST['quantity']));
$pending_reason = trim(stripslashes($_POST['pending_reason']));
$payment_method = trim(stripslashes($_POST['payment_method']));
$first_name = trim(stripslashes($_POST['first_name']));
$last_name = trim(stripslashes($_POST['last_name']));
$address_street = trim(stripslashes($_POST['address_street']));
$address_city = trim(stripslashes($_POST['address_city']));
$address_state = trim(stripslashes($_POST['address_state']));
$address_zipcode = trim(stripslashes($_POST['address_zip']));
$address_country = trim(stripslashes($_POST['address_country']));
$payer_email = trim(stripslashes($_POST['payer_email']));
$address_status = trim(stripslashes($_POST['address_status']));
$payer_status = trim(stripslashes($_POST['payer_status']));
$notify_version = trim(stripslashes($_POST['notify_version'])); 
$verify_sign = trim(stripslashes($_POST['verify_sign'])); 
$business = trim(stripslashes($_POST['business'])); 
$custom = trim(stripslashes($_POST['custom'])); 
$txn_type = trim(stripslashes($_POST['txn_type'])); 

$settle_amount = trim(stripslashes($_POST['settle_amount'])); 
$settle_currency = trim(stripslashes($_POST['settle_currency'])); 
$exchange_rate = trim(stripslashes($_POST['exchange_rate'])); 
$payment_fee = trim(stripslashes($_POST['payment_fee'])); 
$mc_gross = trim(stripslashes($_POST['mc_gross'])); 
$mc_fee = trim(stripslashes($_POST['mc_fee'])); 
$mc_currency = trim(stripslashes($_POST['mc_currency'])); 
$tax = trim(stripslashes($_POST['tax'])); 
$for_auction = trim(stripslashes($_POST['for_auction'])); 
$memo = trim(stripslashes($_POST['memo'])); 
$option_name1 = trim(stripslashes($_POST['option_name1'])); 
$option_selection1 = trim(stripslashes($_POST['option_selection1'])); 
$option_name2 = trim(stripslashes($_POST['option_name2'])); 
$option_selection2 = trim(stripslashes($_POST['option_selection2'])); 
$num_cart_items = trim(stripslashes($_POST['num_cart_items'])); 


if($paypal_receiver_email != "$receiver_email"){
    $error_message .= "Error code 501. Possible fraud. Error with receiver_email. receiver_email = $receiver_email\n";
    $error++;
}  

if (!preg_match("/^65.206/", $REMOTE_ADDR)) {
    $error_message .= "Error code 502. Possible fraud. Error with REMOTE IP ADDRESS = $REMOTE_ADDR . The remote address of the script posting to this notify script does not match a valid PayPal ip address\n";
    $error++;
}  


// post back to PayPal system to validate
$header = "POST /cgi-bin/webscr HTTP/1.0\r\n";
$header .= "Content-Type: application/x-www-form-urlencoded\r\n";
$header .= "Content-Length: " . strlen ($workString) . "\r\n\r\n";
$fp = fsockopen ("https://www.paypal.com", 80, $errno, $errstr, 30);


if (!$fp) {
// HTTP ERROR
echo "$errstr ($errno)";
} else {
   fputs ($fp, $header . $workString);
   while (!feof($fp)) {
     $output .= fgets ($fp, 1024);
   }
   fclose ($fp);
}


// remove post headers if present.
$output = preg_replace("'Content-type: text/plain'si","",$output);


$error_lines = split("\n", $error_message);
$i=0;
while($i <= sizeof($error_lines)) {            
  $error_message_html .= "<p>" .$error_lines[$i];
  $i++;
}

// logic for handling the INVALID or VERIFIED responses.
/* valid response from PayPal, update paypal table with  response message*/ 

if (ereg('VERIFIED',$output)) { 
    $valid_post = 'VERIFIED POST'; 
    if (eregi('failed',$payment_status)){ 
    /* invalid - update paypal table with 'invalid' response message*/  
      //$debug_status = "updated paypal table with VERIFIED-failed response";
      //update_paypal_ipn_table();


    
    } 
    else if (eregi('denied',$payment_status)){ 
    /* invalid - update paypal table with 'invalid' response message*/  
      $debug_status = "updated paypal table with VERIFIED-denied";
      update_paypal_ipn_table();
     
    } 
    
     else if (eregi('pending',$payment_status)){ 
    /* invalid - update paypal table with 'invalid' response message*/  
      $debug_status = "updated paypal table with VERIFIED-pending";
       update_paypal_ipn_table();
    
    }     
    
    else if ((eregi('Completed',$payment_status)) && ($error == 0)){ 
      
      if (eregi('unverified',$payer_status)){ 
      /* update paypal table with 'VERIFIED-unverified' response message*/ 
        if($accept_unverified == 'yes'){          
            // set paid = 'yes'
             $debug_status = "updated paypal table with VERIFIED-completed response with unverified payer status";
              update_paypal_ipn_table();
           }
        else{
            $debug_status = "updated paypal table with VERIFIED-unverified response";
             update_paypal_ipn_table();
        }  
     } 
     else if (eregi('unconfirmed',$address_status)) {  
      /* valid - update paypal table with 'unconfirmed' response message*/ 
      if($accept_unconfirmed == 'yes'){
             // set paid = 'yes'
            $debug_status = "updated paypal table with VERIFIED-completed response with unconfirmed address status";
            update_paypal_ipn_table();
          }
       else{
            $debug_status = "updated paypal table with VERIFIED-unconfirmed response";
             update_paypal_ipn_table();

        }  
      }
      else{
                
          /* valid-verified , update paypal table with verified response */ 
          $debug_status = "updated paypal table with VERIFIED-completed response, Order Complete";
          update_paypal_ipn_table();

        }
    }   // end payment status complete
}   // end VERIFIED response from paypal

else if (ereg('INVALID',$output)) { 
  $valid_post = 'INVALID POST'; 
    /* invalid - update paypal table with 'invalid' response message*/ 
  $debug_status = "updated paypal table with INVALID response. PayPal returned an INVALID response";
  update_paypal_ipn_table();

} 

echo "<p>IPN notification process complete<p>PayPal returned: $valid_post<p>$error_message_html<p>$details_string";


if (eregi('Completed',$payment_status) && $notify_debug){
   $debugmess = "updating record with\n";
   $debugmess .= "**********************************\n";
   $debugmess .= "payment_status = $payment_status\n";
   $debugmess .= "payer_status = $payer_status\n";
   $debugmess .= "address_status = $address_status\n";
   $debugmess .= $debug_status;
   $debugmess .= "\n\n";
   $debugmess .= "error_message";
   $debugmess .= "\n\n";
   $debugmess .= $error_message;
   
   
      /* mail it to the owner of this script*/
  // mail("debanjan.dey@dotcomweavers.com", "PayPal Notify Debug Results 2", $debugmess, $debug_headers);
}

$redr = "n";

if ($payment_status=="Completed"){
    $redr = "y"; 
}

if ($st=="Completed"){
    $redr = "y"; 
}

//if ($payment_status == "Completed"){
if ($redr=="y")
{
global $wpdb;
$table_order = $wpdb->prefix."distance_order";
$updateOrder="update $table_order set `payment_status`='1' where `ordid`=".$item_number;
mysql_query($updateOrder);
//mail("debanjan@web1infotech.com","test",$updateOrder);

ob_start();

?>
<p>
Payment Successfull
</p>
<p>
Order ID : DIST-<?php echo $item_number;?>
</p>
<p>
Transaction ID : <?php echo $txn_id;?>
</p>
<p>
Payment_date : <?php echo $payment_date;?>
</p>
<p>
Total Amount : $<?php echo $payment_gross;?>
</p>
<p>
Item name : <?php echo $item_name;?>
</p>
<p>
Payment Status : <?php echo $payment_status;?>
</p>
<?php
if(isset($pending_reason))
{
?>
<p>
Pending reason : <?php echo $pending_reason;?>
</p>
<?php

}

?>
<?php
$content = ob_get_clean();
//$email = get_option('admin_email');
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
//$mail_to=$roww[0]->v_email;
$mail_subject=$item_name; 
@mail($custom, $mail_subject, $content, $headers);
@mail(get_option('admin_email'), $mail_subject, $content, $headers);
}
//end      
//exit;
/**************************************/
global $wpdb;
$table_order = $wpdb->prefix."distance_order";
$updateOrder = "UPDATE $table_order SET `txn_id` = '".$txn_id."' WHERE `ordid` =".$item_number;



//$updateOrder="update $table_order `txn_id` ='$txn_id' where `ordid`=".$item_number;
mysql_query($updateOrder);
//mail("debanjan@web1infotech.com","test",$updateOrder);
//mail("debanjan@web1infotech.com", "IPN Recd", "$msg");
ob_start();

?>
<p>
Thank you, You order completed successfully , we will get back to you with in 24 hrs.For order and payment confirmation please check your email.
</p>
<p>
Order ID : DIST-<?php echo $item_number;?>
</p>
<p>
Transaction ID : <?php echo $txn_id;?>
</p>
<p>
Payment_date : <?php echo $payment_date;?>
</p>
<p>
Total Amount : $<?php echo $payment_gross;?>
</p>
<p>
Item name : <?php echo $item_name;?>
</p>
<p>
Payment Status : <?php echo $payment_status;?>
</p>
<?php
if(isset($pending_reason))
{
?>
<p>
Pending reason : <?php echo $pending_reason;?>
</p>
<?php

}

?>
<?php
$content = ob_get_clean();
//$email = get_option('admin_email');
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
//$mail_to=$roww[0]->v_email;
$mail_subject=$item_name; 
@mail($custom, $mail_subject, $content, $headers);
@mail(get_option('admin_email'), $mail_subject, $content, $headers);
session_destroy();
/* ======================================================================== */
/*      add your ipn database update code here */

?>
