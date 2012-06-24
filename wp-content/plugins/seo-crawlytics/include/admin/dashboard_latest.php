<script type="text/javascript">
    jQuery(function($) {
        $('#bota_latest_table').dataTable( {
			"iDisplayLength": 25
        } );
    } );
</script>

<table class="display" id="bota_latest_table">
    <thead>
        <tr>
            <th>Robot Name</th>
            <th>Date</th>
            <th>Visited URL</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach ($gFirstReport as $report): ?>
        <tr>
            <td><strong><?php echo $report->visited_by; ?></strong></td>
            <td><?php echo $report->visited_on; ?></td>
            <td><a href="<?php echo $report->visited_uri; ?>"><?php echo $report->visited_uri; ?></a></td>
            <?php // echo $report->visited_referral; ?>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
<br style="clear: both;" />