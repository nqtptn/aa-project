<?php

add_action('admin_menu', 'easel_options_setup');

function easel_options_setup() {
	$options_title = __('Options','easel');
	$admin_title = __('Easel Options', 'easel');
	$pagehook = add_theme_page($admin_title, $admin_title, 'edit_theme_options', 'easel-options', 'easel_admin_options');
	add_action('admin_head-' . $pagehook, 'easel_admin_page_head');
	add_action('admin_print_scripts-' . $pagehook, 'easel_admin_print_scripts');
	add_action('admin_print_styles-' . $pagehook, 'easel_admin_print_styles');
}

function easel_admin_print_scripts() {
	wp_enqueue_script('utils');
	wp_enqueue_script('jquery');
}

function easel_admin_print_styles() {
	wp_admin_css('css/global');
	wp_admin_css('css/colors');
	wp_admin_css('css/ie');
	wp_enqueue_style('easel-options-style', easel_themeinfo('themeurl') . '/options/options.css');
}

function easel_admin_page_head() { ?>
	<!--[if lt ie 8]> <style> div.show { position: static; margin-top: 1px; } #eadmin div.off { height: 22px; } </style> <![endif]-->
<?php }


function easel_admin_options() { ?>
<div class="wrap">
	<div id="eadmin-headericon" style="background: url('<?php echo easel_themeinfo('themeurl') ?>/images/easel_small.png') no-repeat;"></div>
	<p class="alignleft">
		<h2><?php _e('Easel Options','easel'); ?></h2>
		<?php _e('Easel is a modular theme that has an abundant of hooks and actions placed in it for additional usability.  Ref: Comic Easel', 'easel'); ?><br />
		<?php _e('While Easel is an excellent stand-alone theme, it can be enhanced in usability with the associated plugins that have been built to utilize it\'s functionality.','easel'); ?><br />
	</p>
	<div class="clear"></div>
	<?php
	$tab = '';
	if (isset($_GET['tab'])) $tab = wp_filter_nohtml_kses($_GET['tab']);

	if (isset($_REQUEST['action']) && $_REQUEST['action'] == 'easel_reset') {
		delete_option('easel-options');
		global $easel_themeinfo; $easel_themeinfo = '';
	?>
		<div id="message" class="updated"><p><strong><?php _e('Easel Settings RESET!','easel'); ?></strong></p></div>
	<?php } 
	if (empty($easel_options)) { 
		easel_themeinfo('reset');
	}
	$easel_options = get_option('easel-options');
	if ( isset($_POST['_wpnonce']) && wp_verify_nonce($_POST['_wpnonce'], 'update-options') ) {
		
		if ($_REQUEST['action'] == 'easel_save_layout') {
			foreach (array(
				'layout',
				'scheme'
					) as $key) {
							if (isset($_REQUEST[$key])) 
								$easel_options[$key] = wp_filter_nohtml_kses($_REQUEST[$key]);
			}
			
			foreach (array(
				'disable_default_design'
			) as $key) {
				if (!isset($_REQUEST[$key])) $_REQUEST[$key] = 0;
				$easel_options[$key] = (bool)( $_REQUEST[$key] == 1 ? true : false );
			}
			
			$tab = 'layout';
			update_option('easel-options', $easel_options);
		}
		
		if ($_REQUEST['action'] == 'easel_save_debug') {
			foreach (array(
				'enable_debug_footer_code',
				'force_active_connection_close'
			) as $key) {
				if (!isset($_REQUEST[$key])) $_REQUEST[$key] = 0;
				$easel_options[$key] = (bool)( $_REQUEST[$key] == 1 ? true : false );
			}
			$tab = 'debug';
			update_option('easel-options', $easel_options);
		}
		
		if ($_REQUEST['action'] == 'easel_save_addons') {
			foreach (array(
				'enable_addon_page_options',
				'enable_addon_membersonly',
				'enable_addon_showcase',
				'enable_addon_showcase_slider',
				'enable_addon_playingnow',
				'enable_addon_commpress'
			) as $key) {
				if (!isset($_REQUEST[$key])) $_REQUEST[$key] = 0;
				$easel_options[$key] = (bool)( $_REQUEST[$key] == 1 ? true : false );
			}
			
			foreach (array(
				'non_members_message'
			) as $key) {
				if (isset($_REQUEST[$key])) 
					$easel_options[$key] = wp_filter_nohtml_kses($_REQUEST[$key]);
			}
			
			$tab = 'addons';
			update_option('easel-options', $easel_options);
		}
		
		if ($_REQUEST['action'] == 'easel_save_general') {

			foreach (array(
			'disable_jquery_menu_code',
			'disable_scroll_to_top',
			'enable_sidebar_css',
			'enable_avatar_trick',
			'disable_comment_note',
			'disable_comment_javascript',
			'enable_numbered_pagination',
			'enable_post_thumbnail_rss',
			'disable_footer_text',
			'disable_page_titles',
			'disable_post_titles',
			'enable_post_calendar',
			'enable_post_author_gravatar',
			'disable_categories_in_posts',
			'disable_tags_in_posts',
			'disable_author_info_in_posts',
			'disable_date_info_in_posts',
			'disable_default_menubar',
			'enable_search_in_menubar',
			'enable_rss_in_menubar',
			'disable_blog_on_homepage',
			'enable_comments_on_homepage',
			'facebook_like_blog_post',
			'facebook_meta',
			'display_archive_as_links',
			'menubar_social_icons',
			'enable_breadcrumbs'
				) as $key) {
					if (!isset($_REQUEST[$key])) $_REQUEST[$key] = 0;
					$easel_options[$key] = (bool)( $_REQUEST[$key] == 1 ? true : false );
			}

			foreach (array(
				'avatar_directory',
				'home_post_count',
				'copyright_name',
				'copyright_url',
				'custom_image_header_width',
				'custom_image_header_height',
				'menubar_social_twitter',
				'menubar_social_facebook',
				'archive_display_order',
				'excerpt_or_content_in_archive'
						) as $key) {
							if (isset($_REQUEST[$key])) 
								$easel_options[$key] = wp_filter_nohtml_kses($_REQUEST[$key]);
			}
			$tab = 'general';
			update_option('easel-options', $easel_options);
		}
		if ($tab) { ?>
			<div id="message" class="updated"><p><strong><?php _e('Easel Settings SAVED!','easel'); ?></strong></p></div>
			<script>function hidemessage() { document.getElementById('message').style.display = 'none'; }</script>
		<?php }
	} 
	$version = easel_themeinfo('version');
	$easel_options = get_option('easel-options');
	?>
	<div id="poststuff" class="metabox-holder">
		<div id="eadmin">
		  <?php
		  	$tab_info = array(
				'layout' => __('Layout', 'easel'),
		  		'general' => __('General', 'easel'),
				'addons' => __('Addons', 'easel'),
				'debug' => __('Debug', 'easel') 
		  	);

		  	if (empty($tab)) { $tab = array_shift(array_keys($tab_info)); }

		  	foreach($tab_info as $tab_id => $label) { ?>
		  		<div id="easel-tab-<?php echo $tab_id ?>" class="easel-tab <?php echo ($tab == $tab_id) ? 'on' : 'off'; ?>"><span><?php echo $label; ?></span></div>
		  	<?php }
		  ?>
		</div>

		<div id="easel-options-pages">
		  <?php	foreach (glob(easel_themeinfo('themepath') . '/options/*.php') as $file) { include($file); } ?>
		</div>
	</div>
	<script type="text/javascript">
		(function($) {
			var showPage = function(which) {
				$('#easel-options-pages > div').each(function(i) {
					$(this)[(this.id == 'easel-' + which) ? 'show' : 'hide']();
				});
			};

			$('.easel-tab').click(function() {
				$('#message').animate({height:"0", opacity:0, margin: 0}, 100, 'swing', function() { $(this).remove() });

				showPage(this.id.replace('easel-tab-', ''));
				var myThis = this;
				$('.easel-tab').each(function() {
					var isSame = (this == myThis);
					$(this).toggleClass('on', isSame).toggleClass('off', !isSame);
				});
				return false;
			});

			showPage('<?php echo esc_js($tab); ?>');
		}(jQuery));
	</script>
</div>
	<div class="eadmin-footer">
		<div id="easel-version-title"><a href="http://frumph.net/">Easel <?php echo easel_themeinfo('version'); ?></a></div>
		<br />
		<?php _e('Created, Developed and maintained by','easel'); ?> <a href="http://frumph.net/">Philip M. Hofer</a> <small>(<a href="http://frumph.net/">Frumph</a>)</small><br />
		<?php _e('If you like the Easel theme, please donate.  It will help in developing new features and versions.','easel'); ?>
		<table style="margin:0 auto;">
			<tr>
				<td style="width:200px;">
					<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
						<input type="hidden" name="cmd" value="_s-xclick" />
						<input type="hidden" name="hosted_button_id" value="46RNWXBE7467Q" />
						<input type="image" src="https://www.paypal.com/en_US/i/btn/btn_donateCC_LG.gif" name="submit" alt="PayPal - The safer, easier way to pay online!" />
						<img alt="" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" />
					</form>
				</td>
				<td style="width:200px;">
					<form method="post" id="myForm" name="template" enctype="multipart/form-data" action="">
						<?php wp_nonce_field('update-options') ?>
						<input name="easel_reset" type="submit" class="button" value="Reset All Settings" />
						<input type="hidden" name="action" value="easel_reset" />
					</form>
				</td>
			</tr>
		</table>
	</div>

<?php
}
