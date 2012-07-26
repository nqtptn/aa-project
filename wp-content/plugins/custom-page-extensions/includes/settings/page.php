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
                    <tr valign="top">
                         <th scope="row" colspan="4"><?php _e('Decide which boxes will be checked automatically on the widgets form.', 'custom-page-extensions'); ?></th>
                    </tr>
                    <tr>
                         <td><label><input type="checkbox" name="<?php echo $this->optionsName; ?>[is_home_default]" value="1" <?php checked($this->options->is_home_default, '1'); ?> /> <?php _e('Home Page', 'custom-page-extensions'); ?></label></td>
                         <td><label><input type="checkbox" name="<?php echo $this->optionsName; ?>[is_front_default]" value="1" <?php checked($this->options->is_front_default, '1'); ?> /> <?php _e('Front Page', 'custom-page-extensions'); ?></label></td>
                         <td><label><input type="checkbox" name="<?php echo $this->optionsName; ?>[is_archive_default]" value="1" <?php checked($this->options->is_archive_default, '1'); ?> /> <?php _e('Archive Page', 'custom-page-extensions'); ?></label></td>
                         <td><label><input type="checkbox" name="<?php echo $this->optionsName; ?>[is_category_default]" value="1" <?php checked($this->options->is_category_default, '1'); ?> /> <?php _e('Category Page', 'custom-page-extensions'); ?></label></td>
                    </tr>
                    <tr>
                         <td><label><input type="checkbox" name="<?php echo $this->optionsName; ?>[is_tag_default]" value="1" <?php checked($this->options->is_tag_default, '1'); ?> /> <?php _e('Tag Page', 'custom-page-extensions'); ?></label></td>
                         <td><label><input type="checkbox" name="<?php echo $this->optionsName; ?>[is_search_default]" value="1" <?php checked($this->options->is_search_default, '1'); ?> /> <?php _e('Search Page', 'custom-page-extensions'); ?></label></td>
                         <td><label><input type="checkbox" name="<?php echo $this->optionsName; ?>[is_single_default]" value="1" <?php checked($this->options->is_single_default, '1'); ?> /> <?php _e('Post Page', 'custom-page-extensions'); ?></label></td>
                         <td><label><input type="checkbox" name="<?php echo $this->optionsName; ?>[is_date_default]" value="1" <?php checked($this->options->is_date_default, '1'); ?> /> <?php _e('Date Page', 'custom-page-extensions'); ?></label></td>
                    </tr>
               </tbody>
          </table>
     </div>
</div>