<?php
if (!empty($_POST)) {
    //Form data sent

    $bots = array();
    $bot_names = $_POST['bota_bot_name'];
    $bot_masks = $_POST['bota_bot_mask'];
    $bot_rdns = $_POST['bota_bot_rdns'];

    foreach ($bot_names as $key => $name) {
        if (!empty($name)) {
            $bots[] = array('id' => $key, 'name' => $name, 'mask' => $bot_masks[$key], 'rdns' => $bot_rdns[$key]);
        }
    }
    
    if ($_POST['bota_alerts'] == 'on') {
        update_option('bota_alerts', 1);
    } else {
        update_option('bota_alerts', 0);
    }

    if ($_POST['bota_supported'] == 'on') {
        update_option('bota_supported', 1);
    } else {
        update_option('bota_supported', 0);
    }

    update_option('bota_alert_type', (int)$_POST['bota_alert_type']);
    
    update_option('bota_bots', serialize($bots));
    update_option('bota_emails', $_POST['bota_emails']);
    update_option('bota_email_subject', $_POST['bota_email_subject']);
    update_option('bota_email_message', $_POST['bota_email_message']);
    
    echo '<div class="updated"><p><strong>' . __('Options saved.') . '</strong></p></div>';
    
} else {
    $bots = unserialize(get_option('bota_bots'));
}

?>

<script type="text/javascript">
    function bota_addBotline() {
        jQuery('#bota_bot_container').append('<li><p><?php echo __('Bot name / mask / reverse DNS',
        'bota_lang'); ?><input type="text" style="margin-left: 15px;" name="bota_bot_name[]" size="20" /><input type="text" name="bota_bot_mask[]" size="20" /><input type="text" name="bota_bot_rdns[]" size="20" /><input type="button" onClick="jQuery(this).parent().parent().remove();" value="<?php echo __('Remove',
        'bota_lang'); ?>" /></p></li>');
            }
</script>

<div class="wrap">
    <h2 id="bota-title">SEO Crawlytics: Options</h2>
    <div id="bota_content_top" class="postbox-container" style="width:70%;">
        <div class="metabox-holder">    
            <div class="meta-box-sortables ui-sortable">
                <form name="bota_form" id="bota_form" method="post" action="<?php echo str_replace('%7E', '~', $_SERVER['REQUEST_URI']); ?>">
                    
                    <div id="general-settings" class="postbox">
                        <div class="handlediv" title="Click to toggle"><br></div>

                        <h3 class="hndle"><span><?php echo __('Detection & Verification Settings', 'bota_lang'); ?></span></h3>
                        <div class="inside">
                            
                            <ul id="bota_bot_container" style="list-style: none;">
                            <?php
                            foreach ($bots as $bot) {
                                echo '<li id="bota_bot_container_' . esc_html($bot['id']) . '">
                                    <p>' . __('Robot Name | Mask | Reverse DNS',
                                        'bota_lang') . '<input style="margin-left: 15px;" type="text" name="bota_bot_name[' . esc_html($bot['id']) . ']" value="' . esc_html($bot['name']) . '" size="20" />
                                        <input type="text" name="bota_bot_mask[' . esc_html($bot['id']) . ']" value="' . esc_html($bot['mask']) . '" size="20" />
                                        <input type="text" name="bota_bot_rdns[' . esc_html($bot['id']) . ']" value="' . esc_html($bot['rdns']) . '" size="20" />
                                        <input type="button" onClick="jQuery(this).parent().parent().remove();" value="' . __('Remove',
                                        'bota_lang') . '" />
                                        </p>
                                    </li>';
                            }
                            ?>
                            </ul>

                            <input type="button" value="Add new bot" onClick="bota_addBotline();" />
                        </div>
                    </div>
                    <div id="webmastertools" class="postbox">
                        <div class="handlediv" title="Click to toggle"><br></div>
                        <h3 class="hndle"><span><?php echo __('Notification Settings', 'bota_lang'); ?></span></h3>
                        <div class="inside">

                            <input name="bota_supported" type="checkbox" class="checkbox" id="bota_supported" <?php echo (get_option('bota_supported') == 1) ? 'checked="yes"' : ''; ?>>
                            <label for="bota_supported"><?php _e("I support SEO Crawlytics, give me access to the extra features! "); ?></label>
                            <br class="clear">

                            <input name="bota_alerts" type="checkbox" class="checkbox" id="bota_alerts" <?php echo (get_option('bota_alerts') == 1) ? 'checked="yes"' : ''; ?>>
                            <label for="bota_alerts"><?php _e("Email alerts active? "); ?></label>
                            <br class="clear">
                            
                            <label class="select" for="bota_alert_type"><?php _e("Email alert type: "); ?></label>
                            <select name="bota_alert_type" class="select" id="bota_alert_type">
                                <option value="0" <?php echo (get_option('bota_alert_type') == 0) ? 'SELECTED' : ''; ?>>Instant Notification</option>
                                <option value="1" <?php echo (get_option('bota_alert_type') == 1) ? 'SELECTED' : ''; ?>>Daily Reports</option>
                            </select>
                            <br class="clear">
                            
                            <label class="textinput" for="bota_emails"><?php _e("Email address, comma separated: "); ?></label>
                            <input type="text" name="bota_emails" id="bota_emails" class="textinput" value="<?php echo esc_html(get_option('bota_emails')); ?>" size="40">
                            <br class="clear">
                            
                            <label for="bota_email_subject" class="textinput"><?php _e("Email subject: "); ?></label>
                            <input type="text" class="textinput" name="bota_email_subject" id="bota_email_subject" value="<?php echo esc_html(get_option('bota_email_subject')); ?>" size="40">
                            <br class="clear">
                            
                            <label for="bota_email_message" class="textinput"><?php _e("Email body: "); ?></label>
                            <textarea class="textinput metadesc" name="bota_email_message" style="width: 400px; height: 80px;"><?php echo esc_html(get_option('bota_email_message')); ?></textarea><br />
                            <br class="clear">
                            <p>You can use the following variables: {bot} {mask} {url} {time} {refer} {ipaddress}</p>

                        </div>
                    </div>
                    <div id="webmastertools" class="postbox">
                        <div class="handlediv" title="Click to toggle"><br></div>
                        <h3 class="hndle"><span><?php echo __('Integation Options', 'bota_lang'); ?></span></h3>
                        <div class="inside">

                            <p>To integrate this tracking system into other parts of your site, you can simply copy and paste this small snippet into your HTML.</p>
                            <div style="margin-top: 10px; border: 1px solid #666; background: #EEE; padding-left: 10px;">
                                <pre>&lt;img src="<?php echo BOTA_URL; ?>track/" /&gt;</pre>
                            </div>

                        </div>
                    </div>
                    <div class="submit"><input type="submit" class="button-primary" name="submit" value="Save Settings"></div>
                </form>
            </div>
        </div>
    </div>
    <?php include BOTA_PATH . '/include/widgets/options_sidebar.php'; ?>
</div>