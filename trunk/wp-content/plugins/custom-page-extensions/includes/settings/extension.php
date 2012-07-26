<?php
if ( preg_match('#' . basename(__FILE__) . '#', $_SERVER['PHP_SELF']) ) {
     die('You are not allowed to call this page directly.');
}
/**
 * page.php - View for the page settings.
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
     <h3 class="handle" style="margin:0;padding:3px;cursor:default;">
          <?php _e('Default Page Settings', 'custom-page-extensions'); ?>
     </h3>
     <div class="table custom-page-extensions-settings-table">
          <table class="form-table">
               <tbody>
                    <?php if (!get_option('permalink_structure')) : ?>
                    <tr valign="top">
                         <td scope="row" colspan="2">
                              <p><strong>Note</strong>: You must be using  pretty permalinks for this plugin to work. <a href="<?php echo get_option('siteurl'); ?>/wp-admin/options-permalink.php">Click here to change your permalink structure</a>.</p>
                         </td>
                    </tr>
                    <?php else : ?>
                    <tr valign="top">
                         <th scope="row"><?php _e('Page Extension'); ?></th>
                         <td>
                              <input type="text" size="75" id="custom_page_extension" name="<?php echo $this->optionsName; ?>[extension]" value="<?php echo $this->options->extension; ?>" />
                              <br />
                              <?php _e('<strong>Note</strong>: Do not include a period (.) before your extension.'); ?>
                         </td>
                    </tr>
                    <?php endif; ?>
               </tbody>
          </table>
     </div>
</div>