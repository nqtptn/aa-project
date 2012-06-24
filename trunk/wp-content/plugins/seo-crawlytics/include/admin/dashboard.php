<script type="text/javascript">



    jQuery(function($) {

        $('.handlediv').click(function() {

            $(this).parent().find('.inside').toggle();

        });

    });



</script>

<div class="wrap">

    <h2 id="bota-title">SEO Crawlytics: Dashboard</h2>

    <div id="bota_content_top" class="postbox-container" style="width:70%;">

        <div class="metabox-holder">    

            <div class="meta-box-sortables ui-sortable">

                    <div id="general-settings" class="postbox">

                        <div class="handlediv" title="Click to toggle"><br></div>

                        <h3 class="hndle"><span>Robot Visits - Hourly</span></h3>

                        <div class="inside">

                            

                            <?php bota_dashboard_widget_function(); ?>

                            

                        </div>

                    </div>

                    

                    <div id="webmastertools" class="postbox">

                        <div class="handlediv" title="Click to toggle"><br></div>

                        <h3 class="hndle"><span>Robot Visits - Daily</span></h3>

                        <div class="inside">

                            

                            <?php bota_dashboard_plain_graph_function(); ?>

                            

                        </div>

                    </div>

                    

                    <div id="webmastertools" class="postbox">

                        <div class="handlediv" title="Click to toggle"><br></div>

                        <h3 class="hndle"><span>Visit Details</span></h3>

                        <div class="inside">

                            

                            <?php bota_dashboard_latest_function(); ?>

                            

                        </div>

                    </div>

                    

            </div>

        </div>

    </div>

    <?php include BOTA_PATH . '/include/widgets/options_sidebar.php'; ?>

</div>