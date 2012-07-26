<?php
if ( preg_match('#' . basename(__FILE__) . '#', $_SERVER['PHP_SELF']) ) {
     die('You are not allowed to call this page directly.');
}
/**
 * settings.php - View for the Settings page.
 *
 * @package Custom Page Extensions
 * @subpackage includes
 * @author GrandSlambert
 * @copyright 2009-2011
 * @access public
 * @since 0.6
 */
/* Flush the rewrite rules */
global $wp_rewrite, $wp_query;
$wp_rewrite->flush_rules();

if ( isset($_REQUEST['tab']) ) {
     $selectedTab = $_REQUEST['tab'];
} else {
     $selectedTab = 'extension';
}

$tabs = array(
     'extension' => __('Extension', 'custom-page-extensions'),
     //'page' => __('Page Settings', 'custom-page-extensions'),
     'administration' => __('Administration', 'custom-page-extensions'),
);
?>

<div class="wrap">
     <form method="post" action="options.php" id="custom_page_extensions_settings">
          <input type="hidden" id="home_page_url" value ="<?php echo site_url(); ?>" />
          <div class="icon32" id="icon-custom-page-extensions"><br/></div>
          <h2><?php echo $this->pluginName; ?> &raquo; <?php _e('Plugin Settings', 'custom-page-extensions'); ?> </h2>
          <?php if ( isset($_REQUEST['reset']) ) : ?>
               <div id="settings-error-custom-page-extensions_upated" class="updated settings-error">
                    <p><strong><?php _e('Custom Page Extensions settings have been reset to defaults.', 'custom-page-extensions'); ?></strong></p>
               </div>     
          <?php endif; ?>
          <?php settings_fields($this->optionsName); ?>
               <input type="hidden" name="<?php echo $this->optionsName; ?>[random-value]" value="<?php echo rand(1000, 100000); ?>" />
               <input type="hidden" name="active_tab" id="active_tab" value="<?php echo $selectedTab; ?>" />
               <ul id="custom_page_extensions_tabs">
               <?php foreach ( $tabs as $tab => $name ) : ?>
                    <li id="custom_page_extensions_<?php echo $tab; ?>" class="custom-page-extensions<?php echo ($selectedTab == $tab) ? '-selected' : ''; ?>">
                         <a href="#top" onclick="custom_page_extensions_show_tab('<?php echo $tab; ?>')"><?php echo $name; ?></a>
                    </li>
               <?php endforeach; ?>
                    <li id="custom_page_extensions_save_tab" class="save-tab">
                         <a href="#top" onclick="custom_page_extensions_save_settings()"><?php _e('Save Settings', 'custom-page-extensions'); ?></a>
                    </li>
               </ul>

               <div style="width:49%; float:left">
               <?php foreach ( $tabs as $tab => $name ) : ?>
                         <div id="custom_page_extensions_box_<?php echo $tab; ?>" style="display: <?php echo ($selectedTab == $tab) ? '' : 'none'; ?>">
                    <?php require_once('settings/' . $tab . '.php'); ?>
                    </div>
               <?php endforeach; ?>

                    </div>

                    <div style="width:49%; float:right">
               <?php require_once('sidebar-frame.php'); ?>
                    </div>
               </form>
     <?php require_once('footer.php'); ?>
</div>
