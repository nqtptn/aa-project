<script type="text/javascript">

    function bota_supported() {

        window.open('http://twitter.com/intent/tweet?url=http://www.elevatelocal.co.uk/seo-crawlytics&text=Just sharing some support for SEO Crawlytics Wordpress plugin!&via=ysekand&related=yarrcat','Tweet about this plugin','width=400,height=200,toolbar=no, location=no,directories=no,status=no,menubar=no,scrollbars=no,copyhistory=no, resizable=yes');

        window.location.href = 'admin.php?page=bota&supported=1';

    }

</script>



<div style="width:29%; float: right; clear: right;">

    <div class="metabox-holder">    

        <div class="meta-box-sortables ui-sortable" style="min-height: 50px;">

            <div id="wordpress-botahelp" class="postbox">

                <div class="handlediv" title="Click to toggle"><br></div>

                <h3 class="hndle"><span>Support SEO Crawlytics</span></h3>

                <div class="inside">

                    <p>We only accept donations between $1 and $100m.</p>
                    <span style="text-align: center">
                        <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                        <input type="hidden" name="cmd" value="_donations">
                        <input type="hidden" name="business" value="info@elevatelocal.co.uk">
                        <input type="hidden" name="lc" value="GB">
                        <input type="hidden" name="item_name" value="Elevatelocal">
                        <input type="hidden" name="no_note" value="0">
                        <input type="hidden" name="currency_code" value="USD">
                        <input type="hidden" name="bn" value="PP-DonationsBF:btn_donateCC_LG.gif:NonHostedGuest">
                        <input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal — The safer, easier way to pay online.">
                        <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                        </form>
                    </span>
                    <hr />
                    Got any questions? <strong>You can find me at</strong>:<br />
                    Google+ <a href="https://plus.google.com/114240873058453687530">Yousaf Sekander</a><br />
					Twitter <a href="http://www.twitter.com/ysekand">@ysekand</a>
                </div>

            </div>

        </div>

    </div>

</div>



<div class="postbox-container" style="width:29%; float: right; clear: right;">

    <div class="metabox-holder">    

        <div class="meta-box-sortables ui-sortable" style="min-height: 50px;">

            <div id="wordpress-botahelp" class="postbox">

                <div class="handlediv" title="Click to toggle"><br></div>

                <h3 class="hndle"><span>Top Crawled Categories</span></h3>

                <div class="inside">

                    <?php if (get_option('bota_supported')): ?>

                        <?php bota_dashboard_widget_top_categories(); ?>

                    <?php else: ?>

                        <p>To access these features, please consider supporting this plugin by <a onclick="bota_supported();" href="javascript:void(0);">Tweeting about it</a>. However, you can enable these features anyway <a href="admin.php?page=bota&supported=1">here</a>.</p>

                    <?php endif; ?>

                </div>

            </div>

        </div>

    </div>

</div>



<div class="postbox-container" style="width:29%; float: right; clear: right;">

    <div class="metabox-holder">    

        <div class="meta-box-sortables ui-sortable" style="min-height: 50px;">

            <div id="wordpress-botahelp" class="postbox">

                <div class="handlediv" title="Click to toggle"><br></div>

                <h3 class="hndle"><span>Most Crawled Pages</span></h3>

                <div class="inside">

                    <?php if (get_option('bota_supported')): ?>

                        <?php bota_dashboard_widget_top_pages(); ?>

                    <?php else: ?>

                        <p>To access these features, please consider supporting this plugin by <a onclick="bota_supported();" href="javascript:void(0);">Tweeting about it</a>. However, you can enable these features anyway <a href="admin.php?page=bota&supported=1">here</a>.</p>

                    <?php endif; ?>

                </div>

            </div>

        </div>

    </div>

</div>



<div class="postbox-container" style="width:29%; float: right; clear: right;">

    <div class="metabox-holder">    

        <div class="meta-box-sortables ui-sortable" style="min-height: 50px;">

            <div id="wordpress-botahelp" class="postbox">

                <div class="handlediv" title="Click to toggle"><br></div>

                <h3 class="hndle"><span>Crawl Spread</span></h3>

                <div class="inside">

                    <?php if (get_option('bota_supported')): ?>

                        <?php bota_dashboard_widget_top_bots(); ?>

                    <?php else: ?>

                        <p>To access these features, please consider supporting this plugin by <a onclick="bota_supported();" href="javascript:void(0);">Tweeting about it</a>. However, you can enable these features anyway <a href="admin.php?page=bota&supported=1">here</a>.</p>

                    <?php endif; ?>

                </div>

            </div>

        </div>

    </div>

</div>



<div class="postbox-container" style="width:29%; float: right; clear: right;">

    <div class="metabox-holder">    

        <div class="meta-box-sortables ui-sortable" style="min-height: 50px;">

            <div id="wordpress-botahelp" class="postbox">

                <div class="handlediv" title="Click to toggle"><br></div>

                <h3 class="hndle"><span>Peak Crawl Times</span></h3>

                <div class="inside">

                    <?php if (get_option('bota_supported')): ?>

                        <?php bota_dashboard_widget_active_times(); ?>

                    <?php else: ?>

                        <p>To access these features, please consider supporting this plugin by <a onclick="bota_supported();" href="javascript:void(0);">Tweeting about it</a>. However, you can enable these features anyway <a href="admin.php?page=bota&supported=1">here</a>.</p>

                    <?php endif; ?>

                </div>

            </div>

        </div>

    </div>

</div>