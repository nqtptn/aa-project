<?php
/*
Plugin Name: Yahoo Slide
Plugin URI: http://loopscreative.com/yahoo-slide-plugin-for-wordpress/
Description: Yahoo sliding chat add proffesional looks yahoo chat for your visitors.
Version: 1.0
Author: Hawdy Gunawan
Author URI: http://www.loopscreative.com/

.____                               
|    |    ____   ____ ______  ______
|    |   /  _ \ /  _ \\____ \/  ___/
|    |__(  <_> |  <_> )  |_> >___ \ 
|_______ \____/ \____/|   __/____  >
        \/            |__|       \/

 --------------------------------------------------------------------
|                                                                    |
| License: Proprietary                                               |
|                                                                    |
| Yahoo Slide - adds a Yahoo sliding chat, professional looks        |
|               yahoo chat for your visitors.                        |
| Copyright (C) Hawdy Gunawan, Loops Creative                        |
| http://loopscreative.com                                           |
| All rights reserved.                                               |
|                                                                    |
| This program is free software, You may not sell, or redistribute   |
| this plugin in any shape or form. Free for personal and            |
| Commercial use.                                                    |
|                                                                    |
| This program is distributed in the hope that it will be useful,    |
| but WITHOUT ANY WARRANTY; without even the implied warranty of     |
| MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
--------------------------------------------------------------------

*/
/* Version check */
function yahoo_slide_url( $path = '' ) {
	global $wp_version;
	if ( version_compare( $wp_version, '2.8', '<' ) ) { // Using WordPress 2.7
		$folder = dirname( plugin_basename( __FILE__ ) );
		if ( '.' != $folder )
			$path = path_join( ltrim( $folder, '/' ), $path );

		return plugins_url( $path );
	}
	return plugins_url( $path, __FILE__ );
}
add_action('wp_head', 'yahoo_css');
function yahoo_css(){ 
?>
<script type='text/javascript' src='<?php echo get_option('siteurl');?>/wp-content/plugins/yahooslide/jquery.js?ver=1.4.4'></script> 
<script type="text/javascript">
	document.documentElement.className = 'js';
</script>
<script type="text/javascript">
 
		// When the DOM is ready, initialize the scripts.
		jQuery(function( $ ){
 
 
 $(document).ready(function(){
 
				
			$('#slidingchat_trigger1').click(
				function( event ){
					// Prevent the default event.
					event.preventDefault();
 
					// Toggle the slide based on its current
					// visibility.
					if ($('#slidingchat_inner').is( ":visible" )){
 
						// Hide - slide up.
						$('#slidingchat_inner').slideUp( 300, function(){ 
						$('#slidingchat_trigger1').show();
						$('#slidingchat_trigger2').css({'background':'url(<?php echo get_option('siteurl');?>/wp-content/plugins/yahooslide/images/window1.png) no-repeat'});
						 } );
 
					} else {
 
						// Show - slide down.
						$('#slidingchat_inner').slideDown( 300, function(){ 
						$('#slidingchat_trigger1').hide();
						$('#slidingchat_trigger2').css({'background':'url(<?php echo get_option('siteurl');?>/wp-content/plugins/yahooslide/images/window2.png) no-repeat'});
						 } );
 
					}
				}
			);
			
			
			$('#slidingchat_trigger2').click(
				function( event ){
					// Prevent the default event.
					event.preventDefault();
 
					// Toggle the slide based on its current
					// visibility.
					if ($('#slidingchat_inner').is( ":visible" )){
 
						// Hide - slide up.
						$('#slidingchat_inner').slideUp( 300, function(){ 
						$('#slidingchat_trigger1').show() } );
 
					} else {
 
						// Show - slide down.
						$('#slidingchat_inner').slideDown( 300, function(){ 
						$('#slidingchat_trigger1').hide() } );
 
					}
				}
			);
			
			
			
			});
			
 
		});
		
	</script>
<div id="slidingchat_container" style="bottom:0px;right: 10px ;position:fixed;width:243px;z-index:99999">
		<div style="cursor:pointer; background:url('<?php echo get_option('siteurl');?>/wp-content/plugins/yahooslide/images/callout.png') no-repeat;height:112px;" id="slidingchat_trigger1"></div>
   		<div style="cursor:pointer; background:url('<?php echo get_option('siteurl');?>/wp-content/plugins/yahooslide/images/window1.png') no-repeat;height:29px;width:243px;" id="slidingchat_trigger2">
        <div style="color:#fff; text-transform:capitalize; font-family:Arial, Helvetica, sans-serif;font-size:12px;margin-left:12px;padding:6px; font-weight:bold;" id="slidingchat_status">
		<?php  
 			 if($yahoousername!='get_option("yahoo_username")')
             { 
                $status = file_get_contents('http://opi.yahoo.com/online?u='.get_option('yahoo_username').'&m=a&t=1');
                if($status=='01')
                {
                        echo '<span style="color:#FFDF80;">'.get_option('online_text').'</span>';
                }
                else
                {
                         echo get_option('offline_text');
                }
              }
              else
              {
              		echo "Provide a yahoo username!";
              }
            ?>
        </div>
        </div>
		<div id="slidingchat_inner" style="display:none;border: 1px solid #000;background:#000;">
 			<?php echo get_option('yahoo_pingbox_code'); ?>
		</div></div>
<?php }
// create custom plugin settings menu
add_action('admin_menu', 'yahoo_slide_settings');

function yahoo_slide_settings() {

	//create new top-level menu
	add_menu_page('Yahoo Slide Settings', 'Yahoo Slide', 'administrator', __FILE__, 'yahooslide_settings_page',plugins_url('/images/icon.png', __FILE__));

	//call register settings function
	add_action( 'admin_init', 'register_yahooslidesettings' );
}


function register_yahooslidesettings() {
	//register our settings
	register_setting( 'yahooslide-settings-group', 'yahoo_username' );
	register_setting( 'yahooslide-settings-group', 'yahoo_pingbox_code' );
	register_setting( 'yahooslide-settings-group', 'offline_text' );
	register_setting( 'yahooslide-settings-group', 'online_text' );
}

function yahooslide_settings_page() {
?>
<div style="box-shadow: -1px 2px 8px 1px gray;border-radius: 14px 14px;width: 250px; right: 0; float: right; position: fixed; margin: 30px 10px 20px 0; background: #fff; border: 1px solid #e9e9e9; padding: 5px 5px 5px 5px; color: #666; font-size: 11px;">
<h3 style="margin: 0 0 10px 0; border-bottom: 1px dashed #666;">Want more Plugin?</h3>
Please donate so that i could buy some coffee to stay awake, awake, and awake and make another cool plugin :)
<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_donations">
<input type="hidden" name="business" value="JYYDR6NJR5KKJ">
<input type="hidden" name="lc" value="ID">
<input type="hidden" name="item_name" value="Loops Creative">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="bn" value="PP-DonationsBF:coffee.png:NonHosted">
<input type="image" src="http://loopscreative.com/wp-content/themes/Minimal/images/coffee.png" border="0" name="submit" title= "Buy me a Coffee" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/WEBSCR-640-20110429-1/en_US/i/scr/pixel.gif" width="1" height="1">
</form>
<h3 style="margin: 0 0 10px 0; border-bottom: 1px dashed #666;">Hello we are Loops! :D</h3>
Check <a href="http://loopscreative.com">Loops website</a> for Our Portfolio, Marketing Inspiration, Design, Tips and Tutorial (Indonesian Website). Don't forget to <a href="http://www.twitter.com/loopscreative">follow us on twitter</a> and <a href="http://www.facebook.com/pages/Loops-Creative/133832626681690">join our facebook fan page</a>.

<div style="margin: 10px 0 10px 0; border-top: 1px dashed #666;">
<a href="http://loopscreative.com/yahoo-slide-plugin-for-wordpress/">Questions?</a></div>

</div>
<div class="wrap">
<h2>Yahoo Slide</h2>

<form method="post" action="options.php">
    <?php settings_fields( 'yahooslide-settings-group' ); ?>
    <table class="form-table">
        
         <tr valign="top">
        <th scope="row">Your Yahoo Username</th>
        <td><input type="text" name="yahoo_username" value="<?php echo get_option('yahoo_username'); ?>" style="width: 350px;" /> (Username Only)</td>
        </tr>
         
        <tr valign="top">
        <th scope="row">Offline Text</th>
        <td><input type="text" name="offline_text" id="offline_text" value="<?php echo get_option('offline_text'); ?>" style="width: 350px;" /> (Text when Offline)</td>
        </tr>
         <tr valign="top">
        <th scope="row">Online Text</th>
        <td><input type="text" name="online_text" id="online_text" value="<?php echo get_option('online_text'); ?>" style="width: 350px;" /> (Text when Online)</td>
        </tr>
        
        <tr valign="top">
        <th scope="row">Paste your Pingbox code <br/> <a href="http://messenger.yahoo.com/pingbox/">(Get one here)</a></th>
        <td>
         <textarea name="yahoo_pingbox_code" id="yahoo_pingbox_code" cols="60" rows="10"><?php echo stripslashes(htmlentities (get_option('yahoo_pingbox_code'))); ?></textarea>
        </td>
        </tr>
        
        
    </table>
    
    <p class="submit">
    <input type="submit" class="button-primary" value="<?php _e('Save Changes') ?>" />
    </p>

</form>
</div>
<?php } ?>
<?php 
			add_action('wp_dashboard_setup', 'loops_custom_dashboard_widgets');

function loops_custom_dashboard_widgets() {
   global $wp_meta_boxes;

   wp_add_dashboard_widget('loopscreativedbswidget', 'Latest from Loopscreative', 'dbs_widget');
}
		function texts_limit( $text, $limit, $finish = ' [&hellip;]') {
			if( strlen( $text ) > $limit ) {
		    	$text = substr( $text, 0, $limit );
				$text = substr( $text, 0, - ( strlen( strrchr( $text,' ') ) ) );
				$text .= $finish;
			}
			return $text;
		}

		function dbs_widget() {
			$options = get_option('loopscreativedbswidget');
			$loopslogo = WP_PLUGIN_URL . '/yahooslide/images/loops.png';
			$emaillogo = WP_PLUGIN_URL . '/yahooslide/images/email.gif';
			$fblogo = WP_PLUGIN_URL . '/yahooslide/images/facebook.png';
			$twitlogo = WP_PLUGIN_URL . '/yahooslide/images/twit.png';
			$rsslogo = WP_PLUGIN_URL . '/yahooslide/images/rss-icon.gif';
			require_once(ABSPATH.WPINC.'/rss.php');
			if ( $rss = fetch_rss( 'http://loopscreative.com/feed/' ) ) { ?>
				<div class="rss-widget">
                
				<a href="http://loopdcreative.com/" title="Go to loopscretive.com"><img src="<?php echo $loopslogo ?>"  class="alignright" alt="Loopscreative"/></a>			
				<ul>
                <?php 
				$rss->items = array_slice( $rss->items, 0, 5 );
				foreach ( (array) $rss->items as $item ) {
					echo '<li>';
					echo '<a class="rsswidget" href="'.clean_url( $item['link'], $protocolls=null, 'display' ).'">'. ($item['title']) .'</a> ';
					echo '<span class="rss-date">'. date('F j, Y', strtotime($item['pubdate'])) .'</span>';
					
					echo '</li>';
				}
				?> 
				</ul>
				<div style="border-top: 1px solid #ddd; padding-top: 10px; text-align:center;">
				<a href="http://feeds.feedburner.com/Loopscreativecom"><img src="<?php echo $rsslogo ?>" alt="Subscribe Loops RSS" style="margin: 0 5px 0 0; vertical-align: middle; line-height: 18px;"/>Subscribe Loops RSS</a>
                &nbsp; &nbsp; &nbsp;
                <a href="http://www.twitter.com/loopscreative"><img src="<?php echo $twitlogo ?>" alt="Follow Loops" style="margin: 0 5px 0 0; vertical-align: middle; line-height: 18px;"/>Follow Loops</a>
                &nbsp; &nbsp; &nbsp;
                <a href="http://www.facebook.com/pages/Loops-Creative/133832626681690"><img src="<?php echo $fblogo ?>" alt="Join Loops Facebook" style="margin: 0 5px 0 0; vertical-align: middle; line-height: 18px;" />Join Loops Facebook</a>
				</div>
				</div>
			<?php }
		}
?>