<?php
/*

License: GPLv2 or later

This program is free software; you can redistribute it and/or

modify it under the terms of the GNU General Public License

as published by the Free Software Foundation; either version 2

of the License, or (at your option) any later version.



This program is distributed in the hope that it will be useful,

but WITHOUT ANY WARRANTY; without even the implied warranty of

MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the

GNU General Public License for more details.



You should have received a copy of the GNU General Public License

along with this program; if not, write to the Free Software

Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

*/

//*************** Admin function ***************
function bota_include_common_resources() {

    $plugindir = get_settings('home') . '/wp-content/plugins/' . dirname(plugin_basename(__FILE__));
    wp_enqueue_script('bota_flottable', $plugindir . '/resources/jquery.flots.datatables.min.js');
    wp_enqueue_script('bota_flotpie', $plugindir . '/resources/jquery.flot.pie.js');
    wp_enqueue_style('bota_base', $plugindir . '/resources/base.css');
}

function bota_options() {

    bota_include_common_resources();
    include 'admin/options_form.php';
}

function bota_dashboard() {

    if ($_GET['supported'] == 1) {
        update_option('bota_supported', 1);
    }

    bota_include_common_resources();
    include 'admin/dashboard.php';
}

function bota_postpage_summary() {
    global $wpdb, $post;

    bota_include_common_resources();

    $sql = 'SELECT * FROM `' . $wpdb->prefix . 'plugin_bota` WHERE `visited_page` = %d;';
    $postHistory = $wpdb->get_results($wpdb->prepare($sql, (int)$post->ID));
    
    include 'widgets/postpage_summary.php';
}

add_action('edit_form_advanced', 'bota_postpage_summary');
add_action('edit_page_form', 'bota_postpage_summary');

function bota_admin_menu() {
    add_menu_page( 'SEO Crawlytics', 'SEO Crawlytics', 'manage_options', 'bota', 'bota_dashboard', plugin_dir_url( __FILE__ ) . 'eye.png' );
    add_submenu_page( 'bota', 'Configuration', 'Configuration', 'manage_options', 'bota_options', 'bota_options');
}

add_action('admin_menu', 'bota_admin_menu');

function bota_expand_timeline(array $mapData) {

    $newData = array();

    foreach ($mapData as &$item) {

        if ((float)$prevItem[0] != (float)$item[0] - 3600 && (float)$prevItem[0] > strtotime('2 weeks ago')) {
            $newData[] = array(( (float)$prevItem[0] + 3600 ) * 1000, 0);
            $newData[] = array(( (float)$item[0] - 3600 ) * 1000, 0);
        }

        $newData[] = array((float)$item[0] * 1000, (int)$item[1]);
        $prevItem = $item;
    }

    return $newData;

}

function bota_dashboard_widget_active_times() {
    global $wp, $wpdb;

    $sql = 'SELECT HOUR(visited_on) as label, COUNT(*) as data FROM `' . $wpdb->prefix . 'plugin_bota` GROUP BY label;';

    $gFirstReport = $wpdb->get_results($sql, ARRAY_N);
    $nFirstReport = array();
    $lastArrayDate = 0;

    foreach ($gFirstReport as &$item) {
        if ($lastArrayDate != 0 && $lastArrayDate < (int)$item[0] - 1) {
            array_push($nFirstReport, array((int)$item[0] - 1, 0));
        }

        array_push($nFirstReport, array((int)$item[0], (int)$item[1]));

        $lastArrayDate = (int)$item[0];
    }

    include 'widgets/chart_active_times.php';
}

function bota_dashboard_widget_top_categories() {
    global $wp, $wpdb;

    $sql = 'SELECT term1.name as label, COUNT(*) AS data FROM `' . $wpdb->prefix . 'plugin_bota` bota1 LEFt JOIN `' . $wpdb->prefix . 'term_relationships` tr1 
        ON tr1.object_id = bota1.visited_page LEFT JOIN `' . $wpdb->prefix . 'terms` term1 ON term1.term_id = tr1.term_taxonomy_id 
        LEFT JOIN `' . $wpdb->prefix . 'term_taxonomy` tax1 ON tr1.term_taxonomy_id = tax1.term_taxonomy_id WHERE tax1.taxonomy = \'category\'
        AND bota1.visited_page IS NOT NULL GROUP BY tr1.term_taxonomy_id;';

    $gFirstReport = $wpdb->get_results($sql, ARRAY_N);
    $nFirstReport = array();

    foreach ($gFirstReport as &$item) {
        array_push($nFirstReport, array('label' => $item[0], 'data' => (int)$item[1]));
    }

    include 'widgets/chart_top_categories.php';
}

function bota_dashboard_widget_top_pages() {
    global $wp, $wpdb;

    $sql = 'SELECT posts1.post_title as label, COUNT(*) AS data FROM `' . $wpdb->prefix . 'plugin_bota` bota1 
        LEFT JOIN `' . $wpdb->prefix . 'posts` posts1 ON posts1.ID = bota1.visited_page WHERE bota1.visited_page IS NOT NULL 
        GROUP BY bota1.visited_page ORDER BY data DESC LIMIT 10;';

    $gFirstReport = $wpdb->get_results($sql, ARRAY_N);
    $nFirstReport = array();

    foreach ($gFirstReport as &$item) {
        array_push($nFirstReport, array('label' => $item[0], 'data' => (int)$item[1]));
    }

    include 'widgets/chart_top_pages.php';
}

function bota_dashboard_widget_top_bots() {
    global $wp, $wpdb;

    $sql = 'SELECT visited_by as label, COUNT(*) AS data FROM `' . $wpdb->prefix . 'plugin_bota` bota1 
        GROUP BY visited_by ORDER BY data DESC LIMIT 10;';

    $gFirstReport = $wpdb->get_results($sql, ARRAY_N);
    $nFirstReport = array();

    foreach ($gFirstReport as &$item) {
        array_push($nFirstReport, array('label' => $item[0], 'data' => (int)$item[1]));
    }

    include 'widgets/chart_top_bots.php';
}

function bota_dashboard_widget_function() {
    global $wp, $wpdb;
    
    $knownBots = unserialize(get_option('bota_bots'));

    $sql = 'SELECT ( UNIX_TIMESTAMP( visited_on ) - UNIX_TIMESTAMP( visited_on ) %% ( 3600 ) ) AS visit_date, COUNT(*) as visit_total FROM `' . $wpdb->prefix . 'plugin_bota`
        WHERE `visited_by` = %s AND `visited_on` > DATE_SUB( NOW( ), INTERVAL 14 DAY) GROUP BY visit_date;';
    
    $gFirstReport  = $wpdb->get_results($wpdb->prepare($sql, $knownBots[0]['name']), ARRAY_N);
    $gSecondReport = $wpdb->get_results($wpdb->prepare($sql, $knownBots[1]['name']), ARRAY_N);
    $gThirdReport  = $wpdb->get_results($wpdb->prepare($sql, $knownBots[2]['name']), ARRAY_N);
    
    $nFirstReport = array();
    $nSecondReport = array();
    $nThirdReport = array();

    $nFirstReport = bota_expand_timeline($gFirstReport);
    $nSecondReport = bota_expand_timeline($gSecondReport);
    $nThirdReport = bota_expand_timeline($gThirdReport);
    
    $gStartDate = date('Y-m-d', strtotime('14 days ago'));
    $gEndDate = date('Y-m-d', strtotime('tomorrow'));

    include 'admin/dashboard_graph.php';
}

function bota_dashboard_plain_graph_function() {
    global $wp, $wpdb;
    
    $knownBots = unserialize(get_option('bota_bots'));

    $sql = 'SELECT UNIX_TIMESTAMP(DATE(`visited_on`)) as visit_date, COUNT(`visited_on`) as visit_total FROM `' . $wpdb->prefix . 'plugin_bota`
        WHERE `visited_by` = %s AND `visited_on` > DATE_SUB( NOW( ), INTERVAL 14 DAY) GROUP BY DATE(`visited_on`);';
    
    $gFirstPlainReport  = $wpdb->get_results($wpdb->prepare($sql, $knownBots[0]['name']), ARRAY_N);
    $gSecondPlainReport = $wpdb->get_results($wpdb->prepare($sql, $knownBots[1]['name']), ARRAY_N);
    $gThirdPlainReport  = $wpdb->get_results($wpdb->prepare($sql, $knownBots[2]['name']), ARRAY_N);
    
    foreach ($gFirstPlainReport as &$item) {
        $item[0] = (float)$item[0] * 1000;
        $item[1] = (int)$item[1];
    }
    
    foreach ($gSecondPlainReport as &$item) {
        $item[0] = (float)$item[0] * 1000;
        $item[1] = (int)$item[1];
    }
    
    foreach ($gThirdPlainReport as &$item) {
        $item[0] = (float)$item[0] * 1000;
        $item[1] = (int)$item[1];
    }
    
    $gStartDate = date('Y-m-d', strtotime('14 days ago'));
    $gEndDate = date('Y-m-d', strtotime('tomorrow'));

    include 'admin/dashboard_plain_graph.php';
}

function bota_dashboard_latest_function() {
    global $wp, $wpdb;
    
    $sql = 'SELECT * FROM `' . $wpdb->prefix . 'plugin_bota` ORDER BY `visited_on` DESC LIMIT 500';
    $gFirstReport = $wpdb->get_results($sql);
    
    include 'admin/dashboard_latest.php';
}

function bota_add_dashboard_widgets() {

    bota_include_common_resources();
    
    //wp_add_dashboard_widget('bota_dashboard_plain_graph', 'Bot visits by day', 'bota_dashboard_plain_graph_function');
    wp_add_dashboard_widget('bota_dashboard_widget', 'Bot visit drilldown', 'bota_dashboard_widget_function');
    //wp_add_dashboard_widget('bota_dashboard_latest', 'Latest bot visits', 'bota_dashboard_latest_function');
}

function bota_send_daily_report($null = null) {
    global $wpdb;
    
    if (get_option('bota_alert_type') != 1) {
        return;
    }
    
    $records = $wpdb->get_results('SELECT * FROM `' . $wpdb->prefix . 'plugin_bota` WHERE `visited_on` > DATE_SUB( NOW( ), INTERVAL 1 DAY);');
    $response = "Daily report for " . date('F j, Y') . ", total of " . count($records) . " bot visits\r\n\r\n";
    
    foreach ($records as $record) {
        $response .= $record->visited_by . ' visited ' . $record->visited_uri . ' at ' . $record->visited_on . "\r\n";
    }
    
    $emails = explode(',', get_option('bota_emails'));
    $subject = 'Daily bot report';

    foreach ($emails as $email) {
        mail(trim($email), $subject, $response);
    }
}

add_action('wp_dashboard_setup', 'bota_add_dashboard_widgets');