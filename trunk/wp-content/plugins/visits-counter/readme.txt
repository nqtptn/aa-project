=== Visits counter ===
Contributors: slawek1082
Tags: counter, users, count users, online users, simple counter
Requires at least: 3.0
Tested up to: 3.3.1
Stable tag: 1.4.1

This plugin counts current online users and overall users on Your page.

== Description ==

This is simple counter of users which are on Your page at this time (within time which You specify). 
It also counts overall how many users was on Your page all time.
You can display those values anywhere You want on Your page.
Now there is also simple sidebar widget which You can add to Your page's sidebar and it displays those counters.

If You have any problem with plugin after upgrade to newer version, please first turn plugin off and than turn it on again in wp-admin panel

== Installation ==

1. Install plugin by simple copy it to /wp-content/plugins folder
2. Activate the plugin through the 'Plugins' menu in WordPress
3. Customize it on "General" setting tab in wp-admin panel
3. Place 
    `<?php 
        $counter = new visits_counter(); 
        $count_values = $counter->vc_count_users();
        echo "Online users: ".$count_values['online_users'];
        echo "Overall users visited on page since ".$count_values['counterStartTime'].": ".$count_values['overall_counter'];
    ?>`
 in your template

== Changelog ==
= 1.4.1 =
* Now plugin should works also with multisite configuration and network activation

= 1.4 =
* Added possibility to not count admin users on page (by default admins are counted as any user)
* Fixed bug with setting default option value when it was not set in db or when it was set to 0 (false)

= 1.3.1 =
* Fixed bug with not correct refreshing daily and weekly counter when day or week was change to next

= 1.3 =
* Added daily and weekly counters
* Added possibility to choose which counters should be displayed in widget (current online users, overall, daily, weekly)

= 1.2.3 =
* Fixed bug with setiing "count BOTs" option in wp-admin panel

= 1.2.2 =
* Fixed bug with error of translation widget title in wp-admin panel

= 1.2.1 =
* Fixed bug that sometimes user was not counted to overall counter value

= 1.2 =
* Added simple sidebar widget with counter
* Required tables in db are now created properly

= 1.1 =
* Added option to count only 'normal' users and not count Bots (e.g. GoogleBot)

= 1.0 =
* First release.
