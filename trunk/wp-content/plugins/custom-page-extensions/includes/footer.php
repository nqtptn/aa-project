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

<div id="custom_page_extensions_footer" class="custom-page-extensions-footer">
     <div class="postbox" style="width:49%; float:left">
          <h3 class="handl" style="margin:0; padding:3px;cursor:default;"><?php _e('Credits', 'custom-page-extensions'); ?></h3>
          <div style="padding:8px;">
               <p>
                    <?php
                    printf(__('Thank you for trying the %1$s plugin - I hope you find it useful. For the latest updates on this plugin, vist the %2$s. If you have problems with this plugin, please use our %3$s or check out the %4$s.', 'custom-page-extensions'),
                            $this->pluginName,
                            '<a href="http://plugins.grandslambert.com/plugins/custom-page-extensions.html" target="_blank">' . __('official site', 'custom-page-extensions') . '</a>',
                            '<a href="http://support.grandslambert.com/forum/custom-page-extensions" target="_blank">' . __('Support Forum', 'custom-page-extensions') . '</a>',
                            '<a href="http://docs.grandslambert.com/wiki/Custom_Page_Extensions" target="_blank">' . __('Documentation Page', 'custom-page-extensions') . '</a>'
                    );
                    ?>
               </p>
               <p>
                    <?php
                    printf(__('This plugin is &copy; %1$s by %2$s and is released under the %3$s', 'custom-page-extensions'),
                            '2009-' . date("Y"),
                            '<a href="http://grandslambert.com" target="_blank">GrandSlambert, Inc.</a>',
                            '<a href="http://www.gnu.org/licenses/gpl.html" target="_blank">' . __('GNU General Public License', 'custom-page-extensions') . '</a>'
                    );
                    ?>
               </p>
          </div>
     </div>
     <div class="postbox" style="width:49%; float:right">
          <h3 class="handl" style="margin:0; padding:3px;cursor:default;"><?php _e('Donate', 'custom-page-extensions'); ?></h3>
          <div style="padding:8px">
               <p>
                    <?php printf(__('If you find this plugin useful, please consider supporting this and our other great %1$s.', 'custom-page-extensions'), '<a href="http://plugins.grandslambert.com/" target="_blank">' . __('plugins', 'custom-page-extensions') . '</a>'); ?>
                    <a href="http://plugins.grandslambert.com/custom-page-extensions-donate" target="_blank"><?php _e('Donate a few bucks!', 'custom-page-extensions'); ?></a>
               </p>
               <p style="text-align: center;"><a target="_blank" href="http://plugins.grandslambert.com/custom-page-extensions-donate"><img width="122" height="47" alt="paypal_btn_donateCC_LG" src="http://grandslambert.com/paypal.gif" title="paypal_btn_donateCC_LG" class="aligncenter size-full wp-image-174"/></a></p>
          </div>
     </div>
</div>