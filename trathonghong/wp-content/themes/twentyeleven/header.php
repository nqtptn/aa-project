<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 * @package WordPress
 * @subpackage Twenty_Eleven
 * @since Twenty Eleven 1.0
 */
?><!DOCTYPE html>
<!--[if IE 6]>
<html id="ie6" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 7]>
<html id="ie7" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 8]>
<html id="ie8" <?php language_attributes(); ?>>
<![endif]-->
<!--[if !(IE 6) | !(IE 7) | !(IE 8)  ]><!-->
<html <?php language_attributes(); ?>>
<!--<![endif]-->
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>" />
<meta name="viewport" content="width=device-width" />
<title><?php
	/*
	 * Print the <title> tag based on what is being viewed.
	 */
	global $page, $paged;

	wp_title( '|', true, 'right' );

	// Add the blog name.
	bloginfo( 'name' );

	// Add the blog description for the home/front page.
	$site_description = get_bloginfo( 'description', 'display' );
	if ( $site_description && ( is_home() || is_front_page() ) )
		echo " | $site_description";

	// Add a page number if necessary:
	if ( $paged >= 2 || $page >= 2 )
		echo ' | ' . sprintf( __( 'Page %s', 'twentyeleven' ), max( $paged, $page ) );

	?></title>
<link rel="profile" href="http://gmpg.org/xfn/11" />
<link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo( 'stylesheet_url' ); ?>" />
<?
if(isset($_COOKIE["curent_theme"])){
?>
<link id="curent_theme_added" rel="stylesheet" type="text/css" media="all" href="<?php bloginfo('template_url') ?>/css<?=$_COOKIE["curent_theme"]?>.css" />
<?
}else{
?>
	<link id="curent_theme_added" rel="stylesheet" type="text/css" media="all" href="<?php bloginfo('template_url') ?>/css1.css" />
<?
	}
?>

<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
<!--[if lt IE 9]>
<script src="<?php echo get_template_directory_uri(); ?>/js/html5.js" type="text/javascript"></script>
<![endif]-->
<?php
	/* We add some JavaScript to pages with the comment form
	 * to support sites with threaded comments (when in use).
	 */
	if ( is_singular() && get_option( 'thread_comments' ) )
		wp_enqueue_script( 'comment-reply' );

	/* Always have wp_head() just before the closing </head>
	 * tag of your theme, or you will break many plugins, which
	 * generally use this hook to add elements to <head> such
	 * as styles, scripts, and meta tags.
	 */
	wp_head();
?>
</head>

<body <?php body_class(); ?>>
<div id="page" class="hfeed">

	<header id="branding" role="banner">
			<hgroup>
				<img style="width:500px; height:60px; margin-left:-50px;padding: 15px 0 12px 0px;" src="<?php bloginfo('template_url') ?>/images/headers/LogoHeaderThongHong.png" alt="Trà Thông Hồng" title="Trà Thông Hồng"></img>
				<!--<h1 id="site-title"><span><a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></span></h1>
				<h2 id="site-description"><?php bloginfo( 'description' ); ?></h2>-->
			</hgroup>
<div id="change_theme">
<script type="text/javascript">
function change_webtheme(filename){
	var elment=document.getElementById('curent_theme_added');
	setCookie(filename);
	elment.href = '<?php bloginfo('template_url') ?>/css' + filename + '.css';
}
function setCookie(value){
	var c_name='curent_theme';
	var expiredays=365;
	var exdate=new Date();
	exdate.setDate(exdate.getDate()+expiredays);
	document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString()+";path=/");
}
</script>
<div class="styled-select">
	<select onchange="change_webtheme(this.value);">
		<option value="1" <? if(isset($_COOKIE["curent_theme"]) && $_COOKIE["curent_theme"]==1) echo "selected" ?>>Theme 1</option>
		<option value="2" <? if(isset($_COOKIE["curent_theme"]) && $_COOKIE["curent_theme"]==2) echo "selected" ?>>Theme 2</option>
		<option value="3" <? if(isset($_COOKIE["curent_theme"]) && $_COOKIE["curent_theme"]==3) echo "selected" ?>>Theme 3</option>
		<option value="4" <? if(isset($_COOKIE["curent_theme"]) && $_COOKIE["curent_theme"]==4) echo "selected" ?>>Theme 4</option>
		<option value="5" <? if(isset($_COOKIE["curent_theme"]) && $_COOKIE["curent_theme"]==5) echo "selected" ?>>Theme 5</option>
		<option value="6" <? if(isset($_COOKIE["curent_theme"]) && $_COOKIE["curent_theme"]==6) echo "selected" ?>>Theme 6</option>
		<option value="7" <? if(isset($_COOKIE["curent_theme"]) && $_COOKIE["curent_theme"]==7) echo "selected" ?>>Theme 7</option>
		<option value="8" <? if(isset($_COOKIE["curent_theme"]) && $_COOKIE["curent_theme"]==8) echo "selected" ?>>Theme 8</option>
		<option value="9" <? if(isset($_COOKIE["curent_theme"]) && $_COOKIE["curent_theme"]==9) echo "selected" ?>>Theme 9</option>
	</select>
</div>
</div>
			<div style="width:1054px; height:282px;">
           		<div id="top_flash" style="background:url(<?php bloginfo('template_url') ?>/images/headers/LogoThongHong.png) no-repeat; width:360px; height:277px; position:absolute; z-index: 2"></div>
				<div style="width:764px; height:282px; float:right">
					<?php if (function_exists('slideshow')) { 
						slideshow($output = true, $post_id = false, $gallery_id = false, $params = array()); 
					} ?>
				</div>
            </div>
			
			<?php
				// Check to see if the header image has been removed
				$header_image = get_header_image();
				if ( ! empty( $header_image ) ) :
			?>
			<a href="<?php echo esc_url( home_url( '/' ) ); ?>">
			</a>
			<?php endif; // end check for removed header image ?>
			<?php
				// Has the text been hidden?
				if ( 'blank' == get_header_textcolor() ) :
			?>
				<div class="only-search<?php if ( ! empty( $header_image ) ) : ?> with-image<?php endif; ?>">
				<?php get_search_form(); ?>

				</div>
			<?php
				else :
			?>
				<?php get_search_form(); ?>
			<?php endif; ?>
			
			<nav id="access" role="navigation">
				<h3 class="assistive-text"><?php _e( 'Main menu', 'twentyeleven' ); ?></h3>
				<?php /*  Allow screen readers / text browsers to skip the navigation menu and get right to the good stuff. */ ?>
				<div class="skip-link"><a class="assistive-text" href="#content" title="<?php esc_attr_e( 'Skip to primary content', 'twentyeleven' ); ?>"><?php _e( 'Skip to primary content', 'twentyeleven' ); ?></a></div>
				<div class="skip-link"><a class="assistive-text" href="#secondary" title="<?php esc_attr_e( 'Skip to secondary content', 'twentyeleven' ); ?>"><?php _e( 'Skip to secondary content', 'twentyeleven' ); ?></a></div>
				<?php /* Our navigation menu.  If one isn't filled out, wp_nav_menu falls back to wp_page_menu. The menu assiged to the primary position is the one used. If none is assigned, the menu with the lowest ID is used. */ ?>
				<?php wp_nav_menu( array( 'theme_location' => 'primary' ) ); ?>
			</nav><!-- #access -->
	</header><!-- #branding -->


	<div id="main">