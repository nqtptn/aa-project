/**
 * custom-page-extensions.js - Javascript for the Settings page.
 *
 * @package Better RSS Widget
 * @subpackage includes
 * @author GrandSlambert
 * @copyright 2009-2011
 * @access public
 * @since 2.1
 */


/* Function to submit the form from the save settings tab */
function custom_page_extensions_save_settings () {
     document.getElementById('custom_page_extensions_settings').submit();
}
/* Function to change tabs on the settings pages */
function custom_page_extensions_show_tab(tab) {
     /* Close Active Tab */
     activeTab = document.getElementById('active_tab').value;
     document.getElementById('custom_page_extensions_box_' + activeTab).style.display = 'none';
     document.getElementById('custom_page_extensions_' + activeTab).removeAttribute('class','custom-page-extensions-selected');

     /* Open new Tab */
     document.getElementById('custom_page_extensions_box_' + tab).style.display = 'block';
     document.getElementById('custom_page_extensions_' + tab).setAttribute('class','custom-page-extensions-selected');
     document.getElementById('active_tab').value = tab;
}

/* Function to verify selection to reset options */
function custom_page_extensions_reset(element) {
     if (element.checked) {
          if (prompt('Are you sure you want to reset all of your options? To confirm, type the word "reset" into the box.') == 'reset' ) {
               document.getElementById('custom_page_extensions_settings').submit();
          } else {
               element.checked = false;
          }
     }
}

function onClickRedirectHome(element)
{
     var field = document.getElementById('custom_page_extensions_redirect_url');
     var url = document.getElementById('home_page_url').value;

     if (element.checked)
     {
          field.value = url;
          field.readOnly = true;
     }
     else
     {
          field.readOnly = false;
     }
}
