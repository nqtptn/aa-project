<div id="normal-sortables" class="meta-box-sortables ui-sortable">

    <div id="bota_graph" class="postbox" >
        <div class="handlediv" title="Click to toggle"><br></div><h3 class="hndle"><span>Robot Crawl History</span></h3>
        <div class="inside">
            
            <?php if (!empty($postHistory)): ?>

                <script type="text/javascript">
                    jQuery(function($) {
                        $('#bota_latest_table').dataTable( {
                        } );
                    } );
                </script>

                <table class="display" id="bota_latest_table">
                    <thead>
                        <tr>
                            <th>Bot name</th>
                            <th>Date</th>
                            <th>Visited URL</th>
                            <th>Referral URL</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($postHistory as $report): ?>
                        <tr>
                            <td><?php echo $report->visited_by; ?></td>
                            <td><?php echo $report->visited_on; ?></td>
                            <td><?php echo $report->visited_uri; ?></td>
                            <td><?php echo $report->visited_referral; ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
                <br style="clear: both;" />
            <?php else: ?>
                This page is either not publicly available, or has not yet been discovered by bots. Note: Page specific data is available after 24 hours of the actual crawl.
            <?php endif; ?>

        </div>
    </div>

</div>