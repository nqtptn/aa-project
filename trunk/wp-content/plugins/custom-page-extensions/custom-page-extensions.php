<?php

/*
  Plugin Name: Custom Page Extensions
  Plugin URI: http://wordpress.grandslambert.com/plugins/custom-page-extensions.html
  Description: Allows you to add a custom extension to your page URLs. This only affects pages created under the Pages menu and not your posts, category or tag URLs.
  Author: GrandSlambert
  Version: 0.6
  Author: GrandSlambert
  Author URI: http://www.grandslambert.com/
 */

/* Class Declaration */

class gsCustomPageExtensions {

     var $version = '0.6';

     /* Plugin settings */
     var $optionsName = "custom_page_extensions_options";
     var $menuName = 'custom-page-extensions-options';
     var $pluginName = 'Custom Page Extensions';
     var $options = array();
     var $make_link = false;
     var $extension;

     /* Options page name - OLD settings
       var $optionsName = "custom_page_extensions_options";
       var $optionsPageName = "custom_page_extensions-options";
      */

     /**
      * Class Constructor
      *
      * Gets the extension from the options table if exists or uses the .html default
      */
     function gsCustomPageExtensions() {
          /* Load Langauge Files */
          $langDir = dirname(plugin_basename(__FILE__)) . '/lang';
          load_plugin_textdomain('custom-page-extensions', false, $langDir, $langDir);

          /* Set the plugin name to use the selected language. */
          $this->pluginName = __('Custom Page Extensions', 'custom-page-extensions');

          global $wp_rewrite;

          /* Plugin paths */
          $this->pluginPath = WP_PLUGIN_DIR . '/' . basename(dirname(__FILE__));
          $this->pluginURL = WP_PLUGIN_URL . '/' . basename(dirname(__FILE__));

          // Get the extension.
          $this->load_settings();

          /* Add Options Pages and Links */
          add_action('admin_menu', array(&$this, 'admin_menu'));
          add_action('admin_init', array(&$this, 'admin_init'));
          add_action('update_option_' . $this->optionsName, array(&$this, 'update_option'), 10);
          add_action('wp_loaded', array(&$this, 'flush_rules'));

          add_filter('plugin_action_links', array(&$this, "plugin_action_links"), 10, 2);
          add_filter('user_trailingslashit', array(&$this, 'no_page_slash'), 66, 2);
     }

     /**
      * Load the plugin settings.
      */
     function load_settings() {
          $options = get_option($this->optionsName);

          if ($old_setting = get_option('custom_page_extension')) {
               delete_option('custom_page_extension');
          }

          $defaults = array(
               'extension' => ($old_setting != "") ? $old_setting : 'html',
          );

          $this->options = (object) wp_parse_args($options, $defaults);
     }

     /**
      * Outputs the options sub panel
      */
     function options_panel() {
          // Include options panel
          include($this->pluginPath . "/includes/settings.php");
     }

     /**
      * Adds Disclaimer options tab to admin menu
      */
     function admin_menu() {
          global $wp_version;
          $pages[] = add_submenu_page('edit-pages.php', "Custom Page Extensions Options", "Page Extension", 'manage_options', $this->menuName, array(&$this, "options_panel"));
          $pages[] = add_options_page($this->pluginName . __(' Settings', 'custom-page-extensions'), $this->pluginName, 'manage_options', $this->menuName, array(&$this, 'options_panel'));

          foreach ( $pages as $page ) {
               add_action('admin_print_styles-' . $page, array(&$this, 'admin_print_styles'));
               add_action('admin_print_scripts-' . $page, array(&$this, 'admin_print_scripts'));
          }
     }

     /**
      * Register the options for Wordpress MU Support
      */
     function admin_init() {
          register_setting($this->optionsName, $this->optionsName);
          wp_register_style('custom-page-extensions-admin-css', $this->pluginURL . '/includes/custom-page-extensions-admin.css');
          wp_register_script('custom-page-extensions-js', $this->pluginURL . '/js/custom-page-extensions.js');
     }

     /**
      * Print the administration styles.
      */
     function admin_print_styles() {
          wp_enqueue_style('custom-page-extensions-admin-css');
     }

     /**
      * Print the scripts needed for the admin.
      */
     function admin_print_scripts() {
          wp_enqueue_script('custom-page-extensions-js');
     }

     /**
      * Adds a settings link next to Login Configurator on the plugins page
      */
     function plugin_action_links($links, $file) {
          static $this_plugin;

          if ( !$this_plugin ) {
               $this_plugin = plugin_basename(__FILE__);
          }

          if ( $file == $this_plugin ) {
               $settings_link = '<a href="edit.php?post_type=page&page=' . $this->menuName . '">' . __('Settings') . '</a>';
               array_unshift($links, $settings_link);
          }

          return $links;
     }

     /**
      * Check on update option to see if we need to reset the options.
      * @param <array> $input
      * @return <boolean>
      */
     function update_option($input) {
          if ( $_REQUEST['confirm-reset-options'] ) {
               delete_option($this->optionsName);
               wp_redirect(admin_url('options-general.php?page=' . $this->menuName . '&tab=' . $_POST['active_tab'] . '&reset=true'));
               exit();
          } else {
               wp_redirect(admin_url('options-general.php?page=' . $this->menuName . '&tab=' . $_POST['active_tab'] . '&updated=true'));
               exit();
          }
     }

     /**
      * Performs the permalink rewrite
      */
     function custom_page_permalink() {
          global $wp_rewrite;

          if ( get_option('permalink_structure') != '' && !strpos($wp_rewrite->get_page_permastruct(), '.' . $this->options->extension) ) {
               $wp_rewrite->page_structure = $wp_rewrite->page_structure . '.' . $this->options->extension;
          }
     }

     /**
      * Removes the trailing slash from page URLs
      */
     function no_page_slash($string, $type) {
          global $wp_rewrite;

          if ( $wp_rewrite->using_permalinks() && $wp_rewrite->use_trailing_slashes == true && $type == 'page' ) {
               return untrailingslashit($string);
          } else {
               return $string;
          }
     }

     /**
      * Force the extension to be added each time WordPress is loaded.
      */
     function flush_rules() {
          $this->activate();
     }

     /**
      * Plugin activation function
      *
      * Registers the custom extension when the plugin is activated.
      */
     function activate() {
          global $wp_rewrite;

          if ( get_option('permalink_structure') != '' && !strpos($wp_rewrite->get_page_permastruct(), '.' . $this->options->extension) ) {
               $wp_rewrite->page_structure = $wp_rewrite->page_structure . '.' . $this->options->extension;
          }

          $wp_rewrite->flush_rules();
     }

     /**
      * Plugin deactivation function
      *
      * Removes the custom extension when the plugin is deactivated.
      */
     function deactivate() {
          global $wp_rewrite;

          $wp_rewrite->page_structure = str_replace("." . $this->options->extension, "", $wp_rewrite->page_structure);
          $wp_rewrite->flush_rules();
     }

     /**
      * Display the list of contributors.
      * @return boolean
      */
     function contributor_list() {
          $this->showFields = array('NAME', 'LOCATION', 'COUNTRY');
          print '<ul>';

          $xml_parser = xml_parser_create();
          xml_parser_set_option($xml_parser, XML_OPTION_CASE_FOLDING, true);
          xml_set_element_handler($xml_parser, array($this, "start_element"), array($this, "end_element"));
          xml_set_character_data_handler($xml_parser, array($this, "character_data"));

          if ( !(@$fp = fopen('http://grandslambert.com/xml/custom-page-extensions/contributors.xml', "r")) ) {
               print 'There was an error getting the list. Try again later.';
               return;
          }

          while ($data = fread($fp, 4096)) {
               if ( !xml_parse($xml_parser, $data, feof($fp)) ) {
                    die(sprintf("XML error: %s at line %d",
                                    xml_error_string(xml_get_error_code($xml_parser)),
                                    xml_get_current_line_number($xml_parser)));
               }
          }

          xml_parser_free($xml_parser);
          print '</ul>';
     }

     /**
      * XML Start Element Procedure.
      */
     function start_element($parser, $name, $attrs) {
          if ( $name == 'NAME' ) {
               print '<li class="rp-contributor">';
          } elseif ( $name == 'ITEM' ) {
               print '<br><span class="rp_contributor_notes">Contributed: ';
          }

          if ( $name == 'URL' ) {
               $this->make_link = true;
          }
     }

     /**
      * XML End Element Procedure.
      */
     function end_element($parser, $name) {
          if ( $name == 'ITEM' ) {
               print '</li>';
          } elseif ( $name == 'ITEM' ) {
               print '</span>';
          } elseif ( in_array($name, $this->showFields) ) {
               print ', ';
          }

          $this->make_link = false;
     }

     /**
      * XML Character Data Procedure.
      */
     function character_data($parser, $data) {
          if ( $this->make_link ) {
               print '<a href="http://' . $data . '" target="_blank">' . $data . '</a>';
               $this->make_link = false;
          } else {
               print $data;
          }
     }

     /**
      * Displayes any data sent in textareas.
      *
      * @param <type> $input
      */
     function debug($input) {
          $contents = func_get_args();

          foreach ( $contents as $content ) {
               print '<textarea style="width:49%; height:250px; float: left;">';
               print_r($content);
               print '</textarea>';
          }

          echo '<div style="clear: both"></div>';
     }

}

// Pre 2.6 Compatibility
if ( !defined('WP_CONTENT_DIR') )
     define('WP_CONTENT_DIR', ABSPATH . 'wp-content');


$GSCPE = new gsCustomPageExtensions;

add_action('init', array($GSCPE, 'custom_page_permalink'), -1);
register_activation_hook(__FILE__, array($GSCPE, 'activate'));
register_deactivation_hook(__FILE__, array($GSCPE, 'deactivate'));
?>