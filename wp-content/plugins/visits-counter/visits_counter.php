<?php
/**

Plugin Name: Simple Visitors Counter
Plugin URI: http://kaplonski.pl/
Description: Simple visitors and online users counter on Your site
Version: 1.4.1
Author: Sławek Kapłoński
Author URI: http://kaplonski.pl/
License: GPLv2 or later
*/

/*
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


include_once 'visits_counter_class.php';
include_once 'visits_counter_widget_class.php';

load_plugin_textdomain('visits_counter', false, basename( dirname( __FILE__ ) ) . '/languages/');

function vc_installation(){
    $vc = new visits_counter();
    $vc->vc_installation();
}

function vc_adminInit(){
    $vc = new visits_counter();
    $vc->vc_adminInit();
}

function vc_initWidget($args){
    $widget = new visits_counter_widget();
    $widget->drawWidget($args);
}

register_activation_hook(__FILE__, 'vc_installation');
add_action('admin_init', 'vc_adminInit');
wp_register_sidebar_widget('Visits Counter Widget', __('Visits Counter Widget','visits_counter'), 'vc_initWidget');
?>
