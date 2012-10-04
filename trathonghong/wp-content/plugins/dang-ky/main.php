<?php
/*
Plugin Name: Đăng ký
Plugin URI: http://www.trathonghong.com
Description: Đăng ký
Version: 1.0
Author: NhaLT
Author URI: http://www.trathonghong.com
Author Email: lgthnha@yahoo.com.vn
*/

class Magic_Contact {

  var $options = array();
  
  var $version = 0;
  
  function __construct(){
    add_action('plugin_action_links_' . plugin_basename(__FILE__), array( &$this, 'AddPluginActions' ) );
    add_action('admin_menu', array( &$this, 'mc_admin_actions' ) );
    add_action('template_redirect', array( &$this, 'script_magic_contact' ) );
    add_action('wp_footer', array( &$this, 'div_magic_contact' ) );
    add_action('wp_ajax_magic_contact_ajax', array(&$this,'magic_contact_ajax'));
    add_action('wp_ajax_nopriv_magic_contact_ajax', array(&$this,'magic_contact_ajax'));
    $this->options = get_option( 'magic_contact_options', array() );
    $this->version = get_option( 'magic_contact_version', 0);
    if( 0 !== version_compare('0.2', (string)$this->version) )
      $this->magic_contact_option_update();
  }

	function magic_contact_option_update(){
    $defaults = array(
      'recipient_contact'       => get_bloginfo('admin_email'),
      'subject_contact'         => 'Nội dung liên hệ',
      'label_name_contact'      => 'Tên liên hệ',
      'label_email_contact'     => 'E-mail',
      'label_phone_contact'     => 'Phone',
      'label_website_contact'   => 'Website',
      'label_feedback_contact'  => 'Nội dung',
      'label_send_contact'      => 'Gửi',
      'recievedMsg_contact'     => 'Cảm ơn bạn đã gửi thông tin!',
      'notRecievedMsg_contact'  => 'Yêu cầu không gửi được, vui lòng thử lại!',
      'disclaimer_contact'      => 'Xin vui lòng điền thông tin yêu cầu, chúng tôi xin hân hạnh được phục vụ quý khách!',
      'hide_email_contact'      => false,
      'hide_phone_contact'      => false,
      'hide_website_contact'    => false,
      'side_contact'            => 'left'
    );
    if(empty($this->options)){
      foreach($defaults as $key => $value){
        $old = get_option( $key );
        if(!empty($old) && 0 !== strpos($old, 'hide_'))
          $this->options[$key] = $old;
        elseif(!empty($old))
          $this->options[$key] = $old == 'true' ? true : false;
      }
    }
    $this->options = array_merge($this->options, $defaults);
    update_option('magic_contact_options', $this->options);
    update_option( 'magic_contact_version', 0.2 );
  }
	
  function AddPluginActions($links) {
    $new_links = array('<a href="options-general.php?page=magic-contact.php">' . __('Settings') . '</a>');
    return array_merge($new_links, $links);
  }
	
  
  function mc_admin_actions(){
    add_options_page("Magic Contact", "Đăng ký liên hệ", 'manage_options',"magic-contact.php", array(&$this,"magic_contact_menu"));
  }

  function magic_contact_menu(){   
    if ( isset($_POST['submit']) ) {
      if ( !function_exists('current_user_can') || !current_user_can('manage_options') )
        die(__('Cheatin&#8217; uh?'));

      if(!empty($_POST['magic_contact'])){
        $mc = $_POST['magic_contact'];
        $nv = array();
        $nv['recipient_contact'] = isset($mc['recipient_contact']) ? $mc['recipient_contact'] : $this->options['recipient_contact'];
        $nv['subject_contact'] = isset($mc['subject_contact']) ? $mc['subject_contact'] : $this->options['subject_contact'];
        $nv['label_name_contact'] = isset($mc['label_name_contact']) ? $mc['label_name_contact'] : $this->options['label_name_contact'];
        $nv['label_email_contact'] = isset($mc['label_email_contact']) ? $mc['label_email_contact'] : $this->options['label_email_contact'];
        $nv['label_phone_contact'] = isset($mc['label_phone_contact']) ? $mc['label_phone_contact'] : $this->options['label_phone_contact'];
        $nv['label_website_contact'] = isset($mc['label_website_contact']) ? $mc['label_website_contact'] : $this->options['label_website_contact'];
        $nv['label_feedback_contact'] = isset($mc['label_feedback_contact']) ? $mc['label_feedback_contact'] : $this->options['label_feedback_contact'];
        $nv['label_send_contact'] = isset($mc['label_send_contact']) ? $mc['label_send_contact'] : $this->options['label_send_contact'];
        $nv['recievedMsg_contact'] = isset($mc['recievedMsg_contact']) ? $mc['recievedMsg_contact'] : $this->options['recievedMsg_contact'];
        $nv['notRecievedMsg_contact'] = isset($mc['notRecievedMsg_contact']) ? $mc['notRecievedMsg_contact'] : $this->options['notRecievedMsg_contact'];
        $nv['disclaimer_contact'] = isset($mc['disclaimer_contact']) ? $mc['disclaimer_contact'] : $this->options['disclaimer_contact'];
        $nv['hide_email_contact'] = isset($mc['hide_email_contact']) ? true : false;
        $nv['hide_phone_contact'] = isset($mc['hide_phone_contact']) ? true : false;
        $nv['hide_website_contact'] = isset($mc['hide_website_contact']) ? true : false;
        $nv['side_contact'] = isset($mc['side_contact']) ? $mc['side_contact'] : $this->options['side_contact'];
        $this->options = array_merge($this->options, $nv);
        update_option( 'magic_contact_options', $this->options );
      }
      
    }
    include_once(dirname(__FILE__).'/form-admin.php');
  }
	
	
  function script_magic_contact(){
    $base = trailingslashit(plugins_url('',__FILE__)); 
    wp_enqueue_script( 'jquery.contactable', $base . 'contactable/jquery.contactable.js', array('jquery') , 3.1);
    wp_enqueue_script( 'jquery.validate', $base . 'contactable/jquery.validate.pack.js', array('jquery') , 3.1);
    wp_enqueue_script( 'my_contactable', $base . 'my.contactable.js', array('jquery') , 3.1);
    
    $js_vars = array(
      'name'            => 'Tên liên hệ',
      'email'           => 'E-mail',
      'phone'           => 'Phone',
      'message'         => 'Nội dung',
      'subject'         => $this->options['subject_contact'],
      'label_name'      => $this->options['label_name_contact'],
      'label_email'     => $this->options['label_email_contact'],
      'label_phone'     => $this->options['label_phone_contact'],
      'label_website'   => $this->options['label_website_contact'],
      'label_feedback'  => $this->options['label_feedback_contact'],
      'label_send'      => $this->options['label_send_contact'],
      'recievedMsg'     => $this->options['recievedMsg_contact'],
      'notRecievedMsg'  => $this->options['notRecievedMsg_contact'],
      'disclaimer'      => $this->options['disclaimer_contact'],
      'hide_email'      => $this->options['hide_email_contact'] ? 'true' : 'false',
      'hide_phone'      => $this->options['hide_phone_contact'] ? 'true' : 'false',
      'hide_website'    => $this->options['hide_website_contact'] ? 'true' : 'false',
      'fileMail'        => admin_url('admin-ajax.php'),
      'side'            => $this->options['side_contact'],
      'action'          => 'magic_contact_ajax'
    );

    wp_localize_script( 'my_contactable', 'MagicContact', $js_vars );
    wp_enqueue_style( 'contactable', $base . 'contactable/contactable.css' );
  }


  function div_magic_contact(){
    echo '<div id="mycontactform"> </div>';
  }
  function magic_contact_ajax(){
	global $wpdb;
    $name = esc_attr(trim($_POST['name']));
    $emailAddr = is_email($_POST['email']) ? $_POST['email']: get_bloginfo('admin_email');
    $comment = nl2br(esc_attr(trim($_POST['comment'])));
    $phone = nl2br(esc_attr(trim($_POST['phone'])));
    $subject = esc_attr(trim($_POST['subject']));	
    $website = empty($_POST['website']) ? false : esc_url($_POST['website']);
	$edit_poll_question = $wpdb->query("INSERT INTO $wpdb->dang_ky_lien_he 
		(ten_lien_he,dien_thoai,email,website,noi_dung)
		value
		('$name','$phone','$emailAddr','$website','$comment')");
   $contactMessage = sprintf('<div><p style="font-weight: bold; display: inline;">From:</p> %s</div>',$name);
    if($website)
      $contactMessage .= sprintf('<div><p style="font-weight: bold; display: inline;">Website:</p> %s</div>',$website);
	if($phone)
      $contactMessage .= sprintf('<div><p style="font-weight: bold; display: inline;">Phone:</p> %s</div>',$phone);
    if($emailAddr)
      $contactMessage .= sprintf('<div><p style="font-weight: bold; display: inline;">Reply to:</p> %s</div>',$emailAddr);
    
    if(!$emailAddr){
      echo 'An invalid email address was entered';
      die();
    }
    
    //add referer
    if(isset($_SERVER["HTTP_REFERER"])){
      $contactMessage .= sprintf('<div><p style="font-weight: bold; display: inline;">On page:</p> %s</div>',$_SERVER["HTTP_REFERER"]);
    }
    $contactMessage .= sprintf('<div><p style="font-weight: bold; display: inline;">Message:</p> %s</div>',$comment);
    
    $contactMessage = sprintf('<div>%s</div>',$contactMessage);
    
    if( get_bloginfo('admin_email') == $emailAddr){ $name = get_bloginfo('name'); }
    
    $headers = array(
      sprintf("From: %s <%s>",$name,$emailAddr),
      "Content-Type: text/html"
    );
    $h = implode("\r\n",$headers) . "\r\n";
    
    $keys = array('/{main}/','/{footer}/','/{subject}/');
    $footer = sprintf('%s - %s - %s',get_bloginfo('name'),get_bloginfo('description'),get_bloginfo('url') );
    $values = array($contactMessage,$footer,$subject);
    $contactMessage = preg_replace($keys,$values,$this->template());
    
    $send = wp_mail($this->options['recipient_contact'], $subject, $contactMessage,$h);
    if($send)
      echo('success');
    else
      echo('no send');
    die();
  }
  
  function template(){
  
  $tmpl = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>{subject}</title>
	<meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
</head>
<body marginheight="0" topmargin="0" marginwidth="0" bgcolor="#c5c5c5" leftmargin="0">

<table cellspacing="0" border="0" cellpadding="0" width="100%">
	
	<tr>
		
		<td valign="top">

			<table cellspacing="0" border="0" align="center" style="background: #fff; border-right: 1px solid #ccc; border-left: 1px solid #ccc;" cellpadding="0" width="500">
				<tr>
					<td valign="top">
						<!-- header -->
						<table cellspacing="0" border="0" height="157" cellpadding="0" width="500">
							
							<tr>
								<td class="main-title" height="13" valign="top" style="padding: 0 20px; font-size: 25px; font-family: Georgia; font-style: italic;" width="500" colspan="2">
								  <br />
									<singleline label="Title">{subject}</singleline>
								</td>
							</tr>
							<tr>
								<td height="20" valign="top" width="500" colspan="2">
								  <hr style="width:93%;" />
								</td>
							</tr>
							<tr>
								<td class="header-bar" valign="top" style="color: #999; font-family: Verdana; font-size: 12px; padding: 0 20px; height: 15px;" width="500" height="15">
									{main}
								</td>

						<!-- / header -->
					
				</table></td>
				</tr>
					
				<tr>
					<td valign="top" width="500">
						<!-- footer -->
						<table cellspacing="0" border="0" height="32" cellpadding="0" width="500">
							<tr>
								<td valign="top" colspan="2">
								  <hr style="width:93%;" />
								</td>
							</tr>
							<tr>
								<td class="copyright" height="70" align="center" valign="top" style="padding: 0 20px; color: #999; font-family: Verdana; font-size: 10px; line-height: 20px;" width="500" colspan="2">
									<multiline label="Description">{footer}</multiline>
								</td>
							</tr>
						</table>
						<!-- / end footer -->
					</td>
				</tr></table></td>
</table></body></html>';

		return $tmpl;
  
  }
}

$MagicContact = new Magic_Contact();