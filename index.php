<?php
/**
 * Front to the WordPress application. This file doesn't do anything, but loads
 * wp-blog-header.php which does and tells WordPress to load the theme.
 *
 * @package WordPress
 */

/**
 * Tells WordPress to load the WordPress theme and output it.
 *
 * @var bool
 */
//echo $_SERVER['REQUEST_URI'];
//exit;
if(substr($_SERVER['PHP_SELF'],-9)=="index.php" && $_SERVER['REQUEST_URI']=="/aaexpress/"){
	
	header("Location: ./trang-chu.html");
}
define('WP_USE_THEMES', true);

/** Loads the WordPress Environment and Template */
require('./wp-blog-header.php');