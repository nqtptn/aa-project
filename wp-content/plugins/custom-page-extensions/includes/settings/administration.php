<?php
if ( preg_match('#' . basename(__FILE__) . '#', $_SERVER['PHP_SELF']) ) {
     die('You are not allowed to call this page directly.');
}
/**
 * admin.php - View for the administration tab.
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
     <h3 class="handl" style="margin:0;padding:3px;cursor:default;">
          <?php _e('Administration', 'custom-page-extensions'); ?>
     </h3>
     <div class="table custom-page-extensions-settings-table">
          <table class="form-table cp-table">
               <tbody>
                    <tr align="top">
                         <th scope="row"><label class="primary" for="custom_page_extensions_reset_options"><?php _e('Reset to default', 'custom-page-extensions'); ?> : </label></th>
                         <td><input type="checkbox" id="custom_page_extensions_reset_options" name="confirm-reset-options" value="1" onclick="custom_page_extensions_reset(this)" /></td>
                    </tr>
                    <!--
                    <tr align="top">
                         <th scope="row"><label class="primary" for="custom_page_extensions_backup_options"><?php _e('Back-up Options', 'custom-page-extensions'); ?> : </label></th>
                         <td><input type="checkbox" id="custom_page_extensions_backup_options" name="confirm-backup-options" value="1" onclick="backupOptions(this)" /></td>
                    </tr>
                    <tr align="top">
                         <th scope="row"><label class="primary" for="custom_page_extensions_restore_options"><?php _e('Restore Options', 'custom-page-extensions'); ?> : </label></th>
                         <td><input type="file" id="custom_page_extensions_restore_options" name="custom-page-extensions-restore-options"/></td>
                    </tr>
                    -->
               </tbody>
          </table>
     </div>
</div>