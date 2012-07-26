<?php
if ( preg_match('#' . basename(__FILE__) . '#', $_SERVER['PHP_SELF']) ) {
     die('You are not allowed to call this page directly.');
}
/**
 * footer.php - View for the footer on all plugin pages.
 *
 * @package Custom Page Extensions
 * @subpackage includes
 * @author GrandSlambert
 * @copyright 2009-2011
 * @access public
 * @since 0.6
 */
?>

<div class="postbox">
     <h3 class="handl" style="margin:0; padding:3px;cursor:default;">
          <?php _e('Plugin Information', 'custom-page-extensions'); ?>
     </h3>
     <div style="padding:5px;">
          <p><?php _e('This page sets the defaults for the plugin. Each of these settings can be overridden when you add an index to your page.', 'custom-page-extensions'); ?></p>
          <p><span><?php _e('You are using', 'custom-page-extensions'); ?> <strong> <a href="http://plugins.grandslambert.com/plugins/custom-page-extensions.html" target="_blank"><?php echo $this->pluginName; ?> <?php echo $this->version; ?></a></strong> by <a href="http://grandslambert.com" target="_blank">GrandSlambert</a>.</span> </p>
     </div>
</div>
<div class="postbox">
     <h3 class="handl" style="margin:0; padding:3px;cursor:default;">
          <?php _e('Usage', 'custom-page-extensions'); ?>
     </h3>
     <div style="padding:5px;">
          <p>
               <?php printf(__('See the %1$s for this plugin for more details on what each of these settings does.', 'custom-page-extensions'),
                       '<a href="http://docs.grandslambert.com/wiki/custom_page_extensions" target="_blank">' . __('Documentation Page', 'custom-page-extensions') . '</a>'); ?>
          </p>
     </div>
</div>
<div class="postbox">
     <h3 class="handl" style="margin:0; padding:3px;cursor:default;">
          <?php _e('Recent Contributors', 'custom-page-extensions'); ?>
          </h3>
          <div style="padding:5px;">
               <p><?php _e('GrandSlambert would like to thank these wonderful contributors to this plugin!', 'custom-page-extensions'); ?></p>
          <?php $this->contributor_list(); ?>
     </div>
</div>