<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>> 
<head>
	<meta http-equiv="Content-Type" content="<?php bloginfo('html_type') ?>; charset=<?php bloginfo('charset') ?>" />
	<title><?php 
	bloginfo('name');
	$bloginfo_description = get_bloginfo('description');
	if (is_home () && !empty($bloginfo_description)) {
		echo ' - '; bloginfo('description');
	} elseif (is_category() ) {
		echo ' - '; single_cat_title();
	} elseif (is_single() || is_page() ) { 
		echo ' - '; single_post_title();
	} elseif (is_search() ) { 
		echo __(' search results: ','comicpress'); echo esc_html($s);
	} else { 
		echo ' - '; wp_title('',true);
	}
  ?></title>
	<link rel="stylesheet" href="<?php echo get_stylesheet_uri(); ?>" type="text/css" media="screen" />
	
<?php if (!easel_themeinfo('disable_default_design')) { ?>
	<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/style-default.css" type="text/css" media="screen" />
<?php } ?>
	<link rel="pingback" href="<?php bloginfo('pingback_url') ?>" />
	<meta name="Easel" content="<?php echo easel_themeinfo('version'); ?>" />
<?php 
	wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<!-- Project Wonderful Ad Box Loader -->
<!-- Put this after the <body> tag at the top of your page -->
<script type="text/javascript">
   (function(){function pw_load(){
      if(arguments.callee.z)return;else arguments.callee.z=true;
      var d=document;var s=d.createElement('script');
      var x=d.getElementsByTagName('script')[0];
      s.type='text/javascript';s.async=true;
      s.src='//www.projectwonderful.com/pwa.js';
      x.parentNode.insertBefore(s,x);}
   if (window.attachEvent){
    window.attachEvent('DOMContentLoaded',pw_load);
    window.attachEvent('onload',pw_load);}
   else{
    window.addEventListener('DOMContentLoaded',pw_load,false);
    window.addEventListener('load',pw_load,false);}})();
</script>
<!-- End Project Wonderful Ad Box Loader -->
<div id="page-head"><?php do_action('easel-page-head'); ?></div>
<div id="page-wrap">
	<div id="page">
		<br>
		<?php if (!easel_themeinfo('disable_default_menubar') && function_exists('easel_menubar')) easel_menubar();?>
		<?php easel_get_sidebar('above-header'); ?>
		<table border="0" cellpadding="0" cellspacing="0" width="1095px" height="180px" 
			style="background-color: #FFF; background: url(<?php echo get_template_directory_uri(); ?>/images/banner1.jpg) left repeat;
					margin: 0px 0px 1px 3px; border: solid 1px black;">
			<tr>
				<td width="230px" style="padding: 0px 0px 0px 20px; >
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" height="110" width="180"> 
						<param name="movie" value="<?php echo get_template_directory_uri(); ?>/images/banner.swf"> 
						<param name="quality" value="high"> 
						<embed src="<?php echo get_template_directory_uri(); ?>/images/banner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" height="110" width="180"> 
					</object>
				</td> 
				<td>
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" height="110" width="350"> 
						<param name="movie" value="<?php echo get_template_directory_uri(); ?>/images/banneradv.swf"> 
						<param name="quality" value="high"> 
						<embed src="<?php echo get_template_directory_uri(); ?>/images/banneradv.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" height="110" width="350"> 
					</object>						  
				</td> 
			</tr>
		</table>
		<!--
		<div id="header">
			<div class="header-info">
				<h1><a href="<?php echo home_url(); ?>"><?php bloginfo('name') ?></a></h1>
				<div class="description"><?php bloginfo('description') ?></div>
			</div>
			<?php easel_get_sidebar('header'); ?>
			<div class="clear"></div>
		</div>
		<MARQUEE style="margin-left:5px;COLOR: #ff0" onmouseover=this.stop() 
				  onmouseout=this.start() width=610 scrollAmount=2 
				  scrollDelay=50><A style="COLOR: #ff0"  title="AA-EXPRESS đồng hành cùng bạn mọi lúc mọi nơi" 
				  href ="http://localhost/aaexpress/"><SPAN 
				  class=style4>AA-EXPRESS đồng hành cùng bạn mọi lúc mọi nơi</SPAN> </A>&nbsp; &nbsp; &nbsp;</MARQUEE>
		-->
<?php 
if (easel_themeinfo('enable_breadcrumbs')) easel_breadcrumbs();
easel_get_sidebar('menubar');
get_template_part('layout', 'head');
?>